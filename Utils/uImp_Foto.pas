unit uImp_Foto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, DBTables, IBDatabase, 
  ADODB, nxreRemoteServerEngine, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDBaseEdit, LMDCustomEdit, LMDCustomBrowseEdit,
  LMDBrowseEdit;
  

type
  TForm16 = class(TForm)
    nxSession1: TnxSession;
    nxDB: TnxDatabase;
    tCli: TnxTable;
    nxTCP: TnxWinsockTransport;
    tCliID: TAutoIncField;
    tCliFoto: TGraphicField;
    PB: TProgressBar;
    Button1: TButton;
    Label1: TLabel;
    nxRSE: TnxRemoteServerEngine;
    edPasta: TLMDBrowseEdit;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

uses ncClassesBase;

{$R *.dfm}

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


function MinutosOpti(I, F: TDateTime): Double;
var 
  H1, M1, S1, MS1,
  H2, M2, S2, MS2  : Word;
begin
  if F<I then begin
    Result := 0;
    Exit;
  end;

  DecodeTime(I, H1, M1, S1, MS1);
  DecodeTime(F, H2, M2, S2, MS2);
  I := Int(I) + EncodeTime(H1, M1, 0, 0);
  F := Int(F) + EncodeTime(H2, M2, 0, 0);
  Result := DateTimeToMinutos(F-I);
end;

procedure TForm16.Button1Click(Sender: TObject);
var 
  sPasta, S: String;
begin
  tCli.Open;
  PB.Max := tCli.RecordCount;
  PB.Position := 0;
  tCli.First;
  sPasta := edPasta.Text;
  if copy(S, length(s), 1)<>'\' then sPasta := sPasta + '\';
  while not tCli.Eof do begin
    PB.Position := PB.Position + 1;
    Application.ProcessMessages;
    S := sPasta + tCliID.AsString + '.jpg';
    if FileExists(S) then begin
      tCli.Edit;
      tCliFoto.LoadFromFile(S);
      tCli.Post;
    end;
    tCli.Next;
  end;
  ShowMessage('Fim de importação de fotos');
  Close;
  
end;

end.

// Senha OptiCyber MS Access = k4hvd$$

JetOLEDB:Database Password
