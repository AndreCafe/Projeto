unit ncaFrmGetWebTabs;
{
    ResourceString: Dario 11/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw_EWB, EwbCore, EmbeddedWB, Automation, ExtCtrls;

type
  TFrmGetWebTabs = class(TForm)
    WB: TEmbeddedWB;
    TimerErro: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WBDocumentComplete(ASender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
    procedure FormShow(Sender: TObject);
    procedure WBNavigateError(ASender: TObject; const pDisp: IDispatch; var URL,
      Frame, StatusCode: OleVariant; var Cancel: WordBool);
    procedure TimerErroTimer(Sender: TObject);
  private
    { Private declarations }

    function LoadFromIni: Boolean;
  public
    { Public declarations }
  end;


var
  FrmGetWebTabs: TFrmGetWebTabs;

implementation

uses ncClassesBase, ncaDM, ncaFrmPri;

// START resource string wizard section
const
  SHttpNextabsNextarComBr = 'http://nextabs.nextar.com.br';

// END resource string wizard section


{$R *.dfm}

procedure TFrmGetWebTabs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmGetWebTabs.FormCreate(Sender: TObject);
begin
  Width := 1;
  Height := 1;
  Left := 1;
end;

procedure TFrmGetWebTabs.FormShow(Sender: TObject);
begin
  if not LoadFromIni then begin
    WB.ClearCache;
    WB.navigate(SHttpNextabsNextarComBr+'?conta='+ // do not localize
      gConfig.Conta+'&adm='+BoolStr[Dados.CM.UA.Admin]+ // do not localize
      '&cok='+BoolStr[gConfig.FreePremium or (gConfig.QtdLic>0)]+ // do not localize
      '&sw='+prefixo_versao); // do not localize
  end else
    Close;
end;

function TFrmGetWebTabs.LoadFromIni: Boolean;
var 
  S: String;
  sl: TStrings;
  I : Integer;
begin
  Result := False;
  S := ExtractFilePath(ParamStr(0))+'webtabs.ini'; // do not localize
  if not FileExists(S) then Exit;
  Result := True;
  sl := TStringList.Create;
  try
    sl.LoadFromFile(S);
    for I := 0 to sl.Count-1 do 
      FrmPri.AddWebTab(sl[i]);
  finally
    sl.Free;
  end;
end;

procedure TFrmGetWebTabs.TimerErroTimer(Sender: TObject);
begin
  TimerErro.Enabled := False;
  WB.ClearCache;
  WB.navigate(SHttpNextabsNextarComBr+'?conta='+gConfig.Conta+'&adm='+BoolStr[Dados.CM.UA.Admin]+'&cok='+BoolStr[gConfig.FreePremium or (gConfig.QtdLic>0)]); // do not localize
end;

procedure TFrmGetWebTabs.WBDocumentComplete(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var 
  S: String;
  I, P: Integer;
  SL : TStrings;
begin
  try
    S := wb.DocumentSource;
    P := Pos('!webtabs!="', S); // do not localize
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
      for I := 0 to SL.Count-1 do 
        FrmPri.AddWebTab(SL[i]);
    finally
      SL.Free;
    end;
  finally
    Close;
  end;
end;

procedure TFrmGetWebTabs.WBNavigateError(ASender: TObject; const pDisp: IDispatch;
  var URL, Frame, StatusCode: OleVariant; var Cancel: WordBool);
begin
  TimerErro.Enabled := True;
  Cancel := True;
end;

end.

