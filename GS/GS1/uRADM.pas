unit uRADM;

interface

uses
  SysUtils, Classes, kbmMWClient, kbmMWClientDataset,
  kbmMWCustomConnectionPool, kbmMemTable, kbmMWStreamFormat,
  kbmMWBinaryStreamFormat, kbmMWCustomTransport, kbmMWTCPIPIndyTransport,
  DB, kbmMWCustomDataset, chBase, chKBM, kbmMWCustomMessagingTransport,
  kbmMWTCPIPIndyMessagingTransport, kbmMWTCPIPIndyClientTransport,
  kbmMWTCPIPIndyMessagingClientTransport;

type
  TDM = class(TDataModule)
    mwPS: TkbmMWPooledSession;
    BSF: TkbmMWBinaryStreamFormat;
    mwCCP: TkbmMWClientConnectionPool;
    mwCli: TkbmMWPooledSimpleClient;
    Resolver: TkbmMWClientTransactionResolver;
    qCli: TkbmMWClientQuery;
    qCliCodigoStr: TStringField;
    qCliLicencaStr: TStringField;
    qCliSenha: TStringField;
    qCliCadastroEm: TDateTimeField;
    qCliCadastroPor: TStringField;
    qCliAtualizadoEm: TDateTimeField;
    qCliAtualizadoPor: TStringField;
    qCliLoja: TStringField;
    qCliRazaoSocial: TStringField;
    qCliPais: TStringField;
    qCliCidade: TStringField;
    qCliUF: TStringField;
    qCliEndereco: TMemoField;
    qCliCEP: TStringField;
    qCliBairro: TStringField;
    qCliSerieHD: TStringField;
    qCliNumMaq: TWordField;
    qCliCNPJ: TStringField;
    qCliIE: TStringField;
    qCliObs: TMemoField;
    qCliTelefones: TMemoField;
    qCliEmailReg: TMemoField;
    qCliFormaPagto: TMemoField;
    qCliLicMaq: TWordField;
    qCliLicTipo: TWordField;
    qCliLicVenc: TDateField;
    qCliManInicio: TDateField;
    qCliManVenc: TDateField;
    qCliProprietarios: TMemoField;
    qCliGerente: TStringField;
    qCliTipoLoja: TWordField;
    qCliEmailTec: TMemoField;
    qCliValor: TCurrencyField;
    qCliValorRec: TCurrencyField;
    qCliEmitirNF: TBooleanField;
    qCliMessenger: TMemoField;
    qCliICQ: TMemoField;
    qCliUVersao: TStringField;
    qCliUObtemLic: TDateTimeField;
    qCliCodigo: TIntegerField;
    dsCli: TDataSource;
    qFinCli: TkbmMWClientQuery;
    qFinCliID: TIntegerField;
    qFinCliLoja: TIntegerField;
    qFinCliVencimento: TDateField;
    qFinCliPagamento: TDateField;
    qFinCliValor: TCurrencyField;
    qFinCliValorPago: TCurrencyField;
    qFinCliObs: TMemoField;
    qFinCliDoc: TStringField;
    qFinCliDescricao: TStringField;
    qFinCliLancamento: TDateTimeField;
    qFinCliTipo: TStringField;
    qFinCliPC: TIntegerField;
    dsFinCli: TDataSource;
    dsFin: TDataSource;
    qFinT: TkbmMWClientQuery;
    qLog: TkbmMWClientQuery;
    qLogNum: TIntegerField;
    qLogDataHora: TDateTimeField;
    qLogLoja: TIntegerField;
    qLogDetalhes: TMemoField;
    qLogIP: TStringField;
    qLogOperID: TWordField;
    qLogOK: TBooleanField;
    qLogSerieHD: TStringField;
    qLogNomeLoja: TStringField;
    dsLog: TDataSource;
    qPC: TkbmMWClientQuery;
    dsPC: TDataSource;
    qPCID: TIntegerField;
    qPCPai: TIntegerField;
    qPCNome: TStringField;
    qPCSintetico: TBooleanField;
    qUsuario: TkbmMWClientQuery;
    dsUsuario: TDataSource;
    qUsuarioUsername: TStringField;
    qUsuarioSenha: TStringField;
    qUsuarioNome: TStringField;
    qUsuarioAdmin: TBooleanField;
    qUsuarioDireitos: TMemoField;
    qFinCliNomePC: TStringField;
    qMenu: TkbmMWClientQuery;
    dsMenu: TDataSource;
    qMenuUsername: TStringField;
    qMenuID: TIntegerField;
    qMenuPai: TIntegerField;
    qMenuDescricao: TStringField;
    qMenuForm: TStringField;
    qMenuOperID: TWordField;
    msgTCPIP: TkbmMWTCPIPIndyMessagingClientTransport;
    msgQIn: TkbmMWMemoryMessageQueue;
    msgQOut: TkbmMWMemoryMessageQueue;
    mwTCPIP: TkbmMWTCPIPIndyClientTransport;
    qCliStatus: TIntegerField;
    qCliContatarEm: TDateTimeField;
    qStatus: TkbmMWClientQuery;
    dsStatus: TDataSource;
    qStatusCodigo: TIntegerField;
    qStatusDescricao: TStringField;
    qStatusCorFonte: TIntegerField;
    qStatusCorFundo: TIntegerField;
    qCliDescrStatus: TStringField;
    qCliFonteStatus: TIntegerField;
    qCliFundoStatus: TIntegerField;
    procedure qFinCliAfterInsert(DataSet: TDataSet);
    procedure qFinCliBeforeInsert(DataSet: TDataSet);
    procedure qCliBeforePost(DataSet: TDataSet);
    procedure qCliBeforeEdit(DataSet: TDataSet);
    procedure qCliAfterDelete(DataSet: TDataSet);
    procedure qPCAfterPost(DataSet: TDataSet);
    procedure qPCAfterInsert(DataSet: TDataSet);
    procedure qPCBeforeInsert(DataSet: TDataSet);
    procedure qMenuAfterInsert(DataSet: TDataSet);
    procedure qMenuFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure qStatusAfterDelete(DataSet: TDataSet);
    procedure qStatusAfterInsert(DataSet: TDataSet);
    procedure qCliResolveError(Sender: TObject; ErrorType: Integer;
      Message: String; RecordID: Integer; Current: Boolean;
      var Retry: Boolean);
  private
    { Private declarations }
    FPai : Integer;
  public
    function EAdmin: Boolean;
    { Public declarations }
  end;

  procedure TransfFields(F, D: TFields);

const
  SvcName = 'Admin';
  SvcVersion = '100';  

var
  DM: TDM;

implementation

uses uLicenca;

{$R *.dfm}

procedure TransfFields(F, D: TFields);
var 
  I : Integer;
  Obj: TField;
begin
  for I := 0 to F.Count-1 do with F[I] do begin
    Obj := D.FindField(FieldName);
    if (Obj <> nil) and (Obj.FieldKind=fkData) then
      Obj.Value := Value;
  end;    
end;

procedure TDM.qFinCliAfterInsert(DataSet: TDataSet);
begin
  qFinCliLoja.Value := qCliCodigo.Value;
  qFinCliLancamento.Value := Date;
  qFinCliVencimento.Value := Date;
  qFinCliTipo.Value := 'R';
end;

procedure TDM.qFinCliBeforeInsert(DataSet: TDataSet);
begin
  if qFinCli.TransactionLevel=0 then
    qFinCli.StartTransaction;
end;

procedure TDM.qCliBeforePost(DataSet: TDataSet);
begin
  qCliAtualizadoPor.Value := mwCli.Username;
  qCliAtualizadoEm.Value := Now;
  if qCli.State = dsInsert then begin
    qCliCadastroEm.Value := Now;
    qCliCadastroPor.Value := mwCli.Username;
  end
end;

procedure TDM.qCliBeforeEdit(DataSet: TDataSet);
begin
  with TkbmCustomMemTable(Dataset) do 
  if TransactionLevel=0 then
    StartTransaction;
end;

procedure TDM.qCliAfterDelete(DataSet: TDataSet);
begin
  qCli.Resolve;
end;

procedure TDM.qPCAfterPost(DataSet: TDataSet);
begin
  with TkbmMWClientQuery(Dataset) do 
  try
    Resolve;
    Commit;
  except
    Rollback;
    Raise;
  end;  
end;

procedure TDM.qPCAfterInsert(DataSet: TDataSet);
begin
  qPCID.Value := mwCli.Request('Admin', '100', 'GetNextAutoInc', ['PlanoContas', 'ID', '']);
  qPCSintetico.Value := False;
  qPCPai.Value := FPai;
end;

procedure TDM.qPCBeforeInsert(DataSet: TDataSet);
begin
  FPai := qPCID.Value;
  qCliBeforeEdit(DataSet);
end;

procedure TDM.qMenuAfterInsert(DataSet: TDataSet);
begin
  qMenuID.Value := mwCli.Request('Admin', '100', 'GetNextAutoInc', ['Menu', 'ID', '']);
end;

function TDM.EAdmin: Boolean;
begin
  Result := (Copy(mwCli.Token, 6, 1) = 'S');
end;

procedure TDM.qMenuFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := (UpperCase(qMenuForm.Value) = 'TFBCLIENTES') or EAdmin;
end;

procedure TDM.qStatusAfterDelete(DataSet: TDataSet);
begin
  qStatus.Resolve;
end;

procedure TDM.qStatusAfterInsert(DataSet: TDataSet);
begin
  qStatusCodigo.Value := mwCli.Request('Admin', '100', 'GetNextAutoInc', ['Status', 'Codigo', '']);
end;

procedure TDM.qCliResolveError(Sender: TObject; ErrorType: Integer;
  Message: String; RecordID: Integer; Current: Boolean;
  var Retry: Boolean);
begin
  Retry := False;
  Exception.Create(Message);
end;

end.
