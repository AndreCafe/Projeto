unit uGeraSenhaAleatoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, DBCtrls, 
  ExtCtrls, cxPC,
  cxControls, 
  nxreRemoteServerEngine, 
  LMDCustomComponent,
  LMDSysInfo;

type
  TFrmPri = class(TForm)
    nxSession1: TnxSession;
    nxDB: TnxDatabase;
    tCli: TnxTable;
    nxTCP: TnxWinsockTransport;
    tCliID: TAutoIncField;
    tCliSenha: TStringField;
    nxRSE: TnxRemoteServerEngine;
    Button1: TButton;
    PB: TProgressBar;
    procedure Button1Click(Sender: TObject);
  private
    OffSet: Integer;
    sl: Tstrings;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;

implementation

{$R *.dfm}

function SimNaoH(S: String; H : HWND): Boolean;
begin
  Result := (MessageBox(H, PChar(S), 'Atenção', MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = IDYES)
end;    
            
function SimNao(S: String): Boolean;
begin
  Result := SimNaoH(S, Application.ActiveFormHandle);
end;                

function StrToCurrency(S: String): Currency;
var 
  Code : Integer;
  Res: Real;
begin
  Result := 0;
  if (Trim(S)>'') then begin
    Val(S, Res, Code);
    if Code=0 then
      REsult := Res;
  end;
end;

function CodStr(I: Integer): String;
begin
  Result := IntToStr(I);
  while length(result)<3 do
    result := '0'+result;
end;

function SoDig(S: String): String;
var i: integer;
begin
  result := '';
  for i := 1 to length(S) do
    if s[i] in ['0'..'9', '-'] then
      result := result + s[i];
end;

procedure TFrmPri.Button1Click(Sender: TObject);
begin
  Randomize;
  tCli.Open;
  PB.Max := tCli.RecordCount;
  tCli.First;
  while not tCli.Eof do begin
    PB.Position := PB.Position + 1;
    if Trim(tClisenha.Value)= '' then begin 
      tCli.Edit;
      tCliSenha.Value := 
        IntToStr(Random(9)) + 
        IntToStr(Random(9)) + 
        IntToStr(Random(9)) + 
        IntToStr(Random(9)) + 
        IntToStr(Random(9)) + 
        IntToStr(Random(9));
      tCli.Post;
    end;
        
    tCli.Next;
    Application.ProcessMessages;
  end;

  ShowMessage('Senhas criadas com sucesso!');
  Close;
end;

initialization
  

end.
