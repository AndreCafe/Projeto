unit uImpLOKAR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, IBDatabase, IBCustomDataSet, IBTable, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxSkinsCore, cxLookAndFeels,
  cxLookAndFeelPainters, cxNavigator, nxreRemoteServerEngine;

type
  TForm16 = class(TForm)
    nxSession1: TnxSession;
    nxDB: TnxDatabase;
    tCli: TnxTable;
    nxTCP: TnxWinsockTransport;
    PB: TProgressBar;
    DataSource1: TDataSource;
    IBDB: TIBDatabase;
    tOdin: TIBTable;
    IBTransaction1: TIBTransaction;
    Panel1: TPanel;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    btnImport: TButton;
    tCliID: TAutoIncField;
    tCliNome: TStringField;
    tCliEndereco: TStringField;
    tCliBairro: TStringField;
    tCliCidade: TStringField;
    tCliUF: TStringField;
    tCliCEP: TStringField;
    tCliSexo: TStringField;
    tCliObs: TnxMemoField;
    tCliCpf: TStringField;
    tCliRg: TStringField;
    tCliTelefone: TStringField;
    tCliEmail: TnxMemoField;
    tCliMinutos: TFloatField;
    tCliPassaportes: TFloatField;
    tCliMinutosUsados: TFloatField;
    tCliMinutosIniciais: TFloatField;
    tCliIsento: TBooleanField;
    tCliUsername: TStringField;
    tCliPai: TStringField;
    tCliMae: TStringField;
    tCliSenha: TStringField;
    tCliUltVisita: TDateTimeField;
    tCliDebito: TCurrencyField;
    tCliEscola: TStringField;
    tCliEscolaHI: TDateTimeField;
    tCliEscolaHF: TDateTimeField;
    tCliNickName: TStringField;
    tCliDataNasc: TDateTimeField;
    tCliCelular: TStringField;
    tCliTemDebito: TBooleanField;
    tCliLimiteDebito: TCurrencyField;
    tCliFoto: TGraphicField;
    tCliIncluidoEm: TDateTimeField;
    tCliAlteradoEm: TDateTimeField;
    tCliIncluidoPor: TStringField;
    tCliAlteradoPor: TStringField;
    tCliTitEleitor: TStringField;
    tCliFidPontos: TFloatField;
    tCliFidTotal: TFloatField;
    tCliFidResg: TFloatField;
    tCliAniversario: TStringField;
    tCliCotaImpEspecial: TBooleanField;
    tCliCotaImpDia: TIntegerField;
    tCliCotaImpMes: TIntegerField;
    tCliSemFidelidade: TBooleanField;
    tCliNaoGuardarCredito: TBooleanField;
    tCliPermiteLoginSemCred: TBooleanField;
    tCliCHorario: TIntegerField;
    tCliOpCHorario: TWordField;
    tCliHP1: TIntegerField;
    tCliHP2: TIntegerField;
    tCliHP3: TIntegerField;
    tCliHP4: TIntegerField;
    tCliHP5: TIntegerField;
    tCliHP6: TIntegerField;
    tCliHP7: TIntegerField;
    tCliInativo: TBooleanField;
    tCliTipoAcessoPref: TIntegerField;
    tCliFornecedor: TBooleanField;
    tCliValorCred: TCurrencyField;
    tOdinCLIENTEID: TIntegerField;
    tOdinNICK: TIBStringField;
    tOdinBAIRRO: TIBStringField;
    tOdinCEL: TIBStringField;
    tOdinCEP: TIBStringField;
    tOdinCIDADE: TIBStringField;
    tOdinNOME: TIBStringField;
    tOdinCOMPLEMENTO: TIBStringField;
    tOdinCPF: TIBStringField;
    tOdinENDERECO: TIBStringField;
    tOdinFIXO: TIBStringField;
    tOdinFOTO: TBlobField;
    tOdinMAE: TIBStringField;
    tOdinOBS: TIBStringField;
    tOdinPAI: TIBStringField;
    tOdinPRAZOCREDITO: TIntegerField;
    tOdinPRAZOPRODUTO: TIntegerField;
    tOdinRG: TIBStringField;
    tOdinUF: TIBStringField;
    tOdinNUMERO: TIBStringField;
    tOdinVALORMAXIMO: TIBBCDField;
    tOdinEMAIL: TIBStringField;
    tOdinCREDITO: TIBBCDField;
    tOdinVVENDAPRAZO: TIBBCDField;
    TVCLIENTEID: TcxGridDBColumn;
    TVNICK: TcxGridDBColumn;
    TVBAIRRO: TcxGridDBColumn;
    TVCEL: TcxGridDBColumn;
    TVCEP: TcxGridDBColumn;
    TVCIDADE: TcxGridDBColumn;
    TVNOME: TcxGridDBColumn;
    TVCOMPLEMENTO: TcxGridDBColumn;
    TVCPF: TcxGridDBColumn;
    TVENDERECO: TcxGridDBColumn;
    TVFIXO: TcxGridDBColumn;
    TVFOTO: TcxGridDBColumn;
    TVMAE: TcxGridDBColumn;
    TVOBS: TcxGridDBColumn;
    TVPAI: TcxGridDBColumn;
    TVPRAZOCREDITO: TcxGridDBColumn;
    TVPRAZOPRODUTO: TcxGridDBColumn;
    TVRG: TcxGridDBColumn;
    TVUF: TcxGridDBColumn;
    TVNUMERO: TcxGridDBColumn;
    TVVALORMAXIMO: TcxGridDBColumn;
    TVEMAIL: TcxGridDBColumn;
    TVCREDITO: TcxGridDBColumn;
    TVVVENDAPRAZO: TcxGridDBColumn;
    nxRemoteServerEngine1: TnxRemoteServerEngine;
    procedure Button2Click(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
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

function StrToCurrency(S: String): Currency;
var 
  Code : Integer;
  Res: Real;
begin
  Result := 0;
  S := SoDig(S);
  if (Length(S)>=3) then begin
    S := Copy(S, 1, Length(S)-2) + '.' + Copy(S, Length(S)-1, 2);
    Val(S, Res, Code);
    if Code=0 then
      REsult := Res;
  end;
end;

procedure TForm16.Button2Click(Sender: TObject);
begin
  ibDB.DatabaseName := ExtractFilePath(ParamStr(0))+'odin.fdb';
  ibDB.Connected := True;
  tOdin.Open;
  TV.DataController.CreateAllItems(True);
end;

procedure TForm16.btnImportClick(Sender: TObject);
begin
  tCli.Active := True;
  tCli.DeleteRecords;
  tOdin.Active := True;
  tCli.SetAutoIncValue(0);
  PB.Position := 0;
  while not tOdin.Eof do begin
    Application.ProcessMessages;
    PB.Position := PB.Position + 1;
    
    tCli.Insert;
    tCliNickname.Value := tOdinNick.Value;
    tCliNome.Value := tOdinNome.value;
    tCliMInutos.Value := tOdinCredito.Value * 60;
    tCliCPF.Value := tOdinCPF.Value;
    tCliIsento.Value := False;
    tCliInativo.Value := False;
    tCli.Post;
    
    tOdin.Next;
  end;
  ShowMessage('Fim de Importação');
end;

end.
