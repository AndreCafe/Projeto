unit ncaFrmWebMsg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw_EWB, EwbCore, EmbeddedWB, Automation;

type
  TFrmWEBMsg = class(TForm)
    WB: TEmbeddedWB;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WBDocumentComplete(ASender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
    procedure FormShow(Sender: TObject);
    procedure WBCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure WBNavigateError(ASender: TObject; const pDisp: IDispatch; var URL,
      Frame, StatusCode: OleVariant; var Cancel: WordBool);
    procedure WBGetExternal(Sender: TCustomEmbeddedWB;
      var ppDispatch: IDispatch);
  private
    { Private declarations }
  public
    Fechar : Boolean;
    { Public declarations }
  end;

  TFrmWEBMsgWrapper = class(TObjectWrapper)
  private
    function Form: TFrmWEBMsg;
  published
    procedure FecharForm;
  end;

var
  FrmWEBMsg: TFrmWEBMsg;

implementation

uses ncClassesBase;

{$R *.dfm}

procedure TFrmWEBMsg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmWEBMsg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := Fechar;
end;

procedure TFrmWEBMsg.FormCreate(Sender: TObject);
begin
  Width := 1;
  Height := 1;
  Fechar := False;
end;

procedure TFrmWEBMsg.FormShow(Sender: TObject);
begin
//  WB.navigate('http://www.nexcafe.com.br/msg.html');
  WB.navigate('http://nexmsg.nextar.com.br?conta='+gConfig.Conta+'&cok='+BoolStr[gConfig.FreePremium or (gConfig.QtdLic>0)]);
end;

procedure TFrmWEBMsg.WBCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Fechar := True;
  CanClose := True;
  Close;
end;

procedure TFrmWEBMsg.WBDocumentComplete(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var 
  S: String; 
  I, P: Integer;
  SL : TStrings;
  Sair : Boolean;
begin
  Sair := True;
  try
    S := WB.DocumentSource;
    P := Pos('!nexinfo!="', S);
    if P=0 then Exit;
    Delete(S, 1, P+10);
    S := Copy(S, 1, Pos('"', S)-1);
    if S='' then Exit;
    
    SL := TStringList.Create;
    try
      P := Pos(';', S);
      while P > 0 do begin
        SL.Add(Copy(S, 1, P-1));
        Delete(S, 1, P);
        P := Pos(';', S);
      end;
      if Trim(S)>'' then SL.Add(Trim(S));
      if not SameText(SL.Values['Ok'], 'Ok') then Exit;
      
      Width := StrToIntDef(Sl.Values['W'], 0);
      Height := StrToIntDef(Sl.Values['H'], 0);
      if (Width=0) or (Height=0) then Exit;

      case StrToIntDef(SL.Values['BS'], 2) of
        0 : BorderStyle := bsNone;
        1 : BorderStyle := bsSingle;
        2 : BorderStyle := bsDialog;
        3 : BorderStyle := bsToolWindow;
        4 : BorderStyle := bsSizeToolWin;
      else
        BorderStyle := bsDialog;
      end;
      
      Caption := WB.Doc2.Title;

{      if not SameText(SL.Values['SC'], 'S') then
        WB.UserInterfaceOptions := WB.UserInterfaceOptions + [DontUseScrollbars];}
      WB.Refresh;
      WB.Repaint;  

      Fechar := SameText(SL.Values['CC'], 'S');  
      
      Top := (Screen.Height - Height) div 2;
      Left := (Screen.Width - Width) div 2;
      Sair := False;
    finally
      SL.Free;
    end;
  finally
    if Sair then begin
      Fechar := True;
      Close;
    end;
  end;
end;

procedure TFrmWEBMsg.WBGetExternal(Sender: TCustomEmbeddedWB;
  var ppDispatch: IDispatch);
begin
  ppDispatch := TAutoObjectDispatch.Create(TFrmWEBMsgWrapper.Connect(Self)) as IDispatch;
end;

procedure TFrmWEBMsg.WBNavigateError(ASender: TObject; const pDisp: IDispatch;
  var URL, Frame, StatusCode: OleVariant; var Cancel: WordBool);
begin
  Cancel := True;
  Fechar := True;
  Close;
end;

{ TFrmBaseGMWrapper }

procedure TFrmWEBMsgWrapper.FecharForm;
begin
  Form.Fechar := True;
  Form.Close;
end;

function TFrmWEBMsgWrapper.Form: TFrmWEBMsg;
begin
  Result := TFrmWebMsg(FObject);
end;

end.
