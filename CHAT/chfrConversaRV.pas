unit chfrConversaRV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, chfrConversa, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMemo, RVScroll, RichView, RVStyle, RVTable, ShellApi, Buttons,
  LMDSpeedButton, ExtCtrls;

type
  HackScroller = class(TRVScroller);
  
  TchFrameConversaRV = class(TchFrameConversa)
    RV: TRichView;
    RVS: TRVStyle;
    btnFechar: TLMDSpeedButton;
    procedure RVJump(Sender: TObject; id: Integer);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
    procedure AddWithURLs(s: String; DefStyle, UrlStyle: Integer);

    procedure FecharJanela(var Msg);
      message wm_user;
  public
    procedure AddMsg(ARecebeu: Boolean; AHora: TDateTime; ATexto: String); override;
    { Public declarations }
  end;

  procedure Register;

var
  chFrameConversaRV: TchFrameConversaRV;

implementation

{$R *.dfm}

{ TFrameConversa2 }

function IsAddress(s: String): Boolean;
begin
  // Checks for prefix.
  // For better results, it should check for lengths...
  s := UpperCase(s);
  Result :=
        (Pos('HTTP://',   s)=1) or
        (Pos('FTP://',    s)=1) or
        (Pos('FILE://',   s)=1) or
        (Pos('GOPHER://', s)=1) or
        (Pos('MAILTO://', s)=1) or        
        (Pos('HTTPS://',  s)=1) or
        (Pos('MAILTO:',   s)=1) or
        (Pos('NEWS:',     s)=1) or
        (Pos('TELNET:',   s)=1) or
        (Pos('WAIS:',     s)=1) or
        (Pos('WWW.',      s)=1) or
        (Pos('FTP.',      s)=1);
end;

function IsEmail(const s: String): Boolean;
var p1, p2: Integer;
   pchr: PChar;
begin
  //'@' must exist and '.' must be after it. This is not comprehensive test,
  //but I think that it's ok 
  Result := False;
  p1 := Pos('@', s);
  if p1=0 then exit;
  pchr := StrRScan(PChar(s),'.');
  if pchr = nil then exit;
  p2 := pchr - PChar(s)+1;
  if p1>p2 then exit;
  Result := True;
end;


procedure TchFrameConversaRV.AddMsg(ARecebeu: Boolean; AHora: TDateTime; ATexto: String);
var 
  Table : TRVTableItemInfo;
  Cor : TColor;
  S : String;
  SL: TStrings;
begin
  if Chat = nil then Exit;

  if ARecebeu then begin
    Cor := clYellow;
    S := NodeInfo.niNome;
  end else begin
    Cor := clSilver;
    S := Chat.Nome;
  end;

  if S='' then 
    S := '(Desconhecido)';
    
  table := TRVTableItemInfo.CreateEx(1,2, RV.RVData);
  table.Color := Cor;
  table.BorderLightColor := Cor;
  table.BorderColor := Cor;
  table.CellBorderLightColor := Cor;
  table.CellBorderColor := clYellow;
  table.BorderWidth := 0;
  table.CellBorderWidth := 0;
  table.CellPadding := 0;
  table.CellVSpacing := 0;
  table.CellHSpacing := 0;                  

  Table.Rows[0].VAlign := rvcMiddle;
  with table.Cells[0,0] do begin
    VAlign := rvcMiddle;
    Color := Cor;
    DeleteItems(0, 1);
    AddNL(S + ' diz:', 0, 0);
  end;

  with table.Cells[0,1] do begin
    VAlign := rvcMiddle;
    Color := Cor;
    DeleteItems(0, 1);
    AddNL(FormatDateTime('dd/mm/yyyy hh:mm:ss', Now), 1, 1);
  end;

  RV.AddItem('', table);  
  SL := TStringList.Create;
  try
    SL.Text := ATexto;
    AddWithURLs(ATexto, 0, 3);
    if Trim(SL.Strings[SL.Count-1]) <> '' then
      RV.AddNL('', 0, 0);
  finally
    SL.Free;
  end;    
  RV.FormatTail;

  inherited;
end;

procedure Register;
begin
  RegisterClasses([TchFrameConversaRV]);
end;

procedure TchFrameConversaRV.AddWithURLs(s: String; DefStyle,
  UrlStyle: Integer);
var Before, CurrentWord, Space: String;
    p, pLF: Integer;
    ParaNo: Integer;
    LF: Boolean;
begin
   ParaNo := 0;
   Before := '';
   if s = '' then begin
     rv.AddNL('', DefStyle, ParaNo);
     exit;
   end;
   while s<>'' do begin
     p := Pos(' ', s);
     pLF := Pos(#13#10, s);
     if ((P=0) and (pLF>0)) or ((P>0) and (pLF>0) and (pLF<P)) then begin
       P := pLF;
       LF := True;
     end else  
       LF := False;    
     if p=0 then p := Length(s)+1;
     CurrentWord := Copy(s, 1, p-1);
     if LF then begin
       Space := Copy(s, p, 2);
       s := Copy(s, p+2, Length(s));
     end else begin
       Space := Copy(s, p, 1);
       s := Copy(s, p+1, Length(s));
     end;  
     if IsAddress(CurrentWord) or IsEmail(CurrentWord) then begin
        if Before<>'' then begin
          rv.AddTextNL(Before, DefStyle, ParaNo, ParaNo);
          ParaNo := -1;
          Before := '';
        end;
        rv.AddNL(CurrentWord, UrlStyle, ParaNo);
        if LF then
          rv.AddNL('', DefStyle, 0) 
        else  
        if Space<>'' then begin
          ParaNo := -1;
          rv.AddTextNL(Space, DefStyle, ParaNo, ParaNo);
        end;  
     end else begin
       if LF then begin
         rv.AddTextNL(Before + CurrentWord, DefStyle, ParaNo, ParaNo);
         ParaNo := -1;
         RV.AddNL('', DefStyle, 0);
         Before := '';
       end else
         Before := Before + CurrentWord+Space;
     end;  
   end;
   if Before<>'' then
     rv.AddTextNL(Before, DefStyle, ParaNo, ParaNo);
end;

procedure TchFrameConversaRV.RVJump(Sender: TObject; id: Integer);
var ItemNo: Integer;
    s: String;
begin
  ItemNo := rv.GetJumpPointItemNo(id);
  s := rv.GetItemText(ItemNo);
  if not IsAddress(s) and IsEmail(s) then
    s := 'mailto:'+s;
  ShellExecute(Application.Handle, 'open', PChar(s), nil, nil, SW_NORMAL);
end;

procedure TchFrameConversaRV.btnFecharClick(Sender: TObject);
begin
  PostMessage(Handle, wm_user, 0, 0);
end;

procedure TchFrameConversaRV.FecharJanela(var Msg);
begin
  Fechar;
end;

end.
