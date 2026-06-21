unit uDMA;

interface

uses
  SysUtils, Classes, nxdb, nxllTransport, nxptBasePooledTransport,
  nxptZipCompressor, ComCtrls,
  nxtwWinsockTransport, nxllComponent, DB, kbmMWCustomTransport,
  kbmMWClient, kbmMWTCPIPIndyTransport, kbmMemTable, kbmMWStreamFormat,
  kbmMWBinaryStreamFormat, nxsdServerEngine, nxreRemoteServerEngine, Dbf,
  kbmMWTCPIPIndyClientTransport;

type

  PInfoTabela = ^TInfoTabela;
  TInfoTabela = record
   itIndexName : String;
   itMasterSource : TDataSource;
   itMasterFields : String;
  end;

  TDM = class(TDataModule)
    Q: TnxQuery;
    tOSFaseDesc: TnxTable;
    tOSFase: TnxTable;
    dsOSFase: TDataSource;
    dsOSFaseDesc: TDataSource;
    dsOS: TDataSource;
    tOS: TnxTable;
    Tab: TnxTable;
    DS: TDataSource;
    dsLog: TDataSource;
    tLog: TnxTable;
    tLogID: TAutoIncField;
    tLogTecnico: TStringField;
    tLogData: TDateTimeField;
    tLogDetalhes: TMemoField;
    tLogOper: TWordField;
    tLogOK: TBooleanField;
    tLogDuracao: TDateTimeField;
    tLogUUpload: TIntegerField;
    dbLog: TnxDatabase;
    dbPar: TnxDatabase;
    dbUp: TnxDatabase;
    nxTCPIP: TnxWinsockTransport;
    nxSession: TnxSession;
    kbmCli: TkbmMWSimpleClient;
    mwTCPIP: TkbmMWTCPIPIndyClientTransport;
    mtCli: TkbmMemTable;
    mtTec: TkbmMemTable;
    mtCliID: TStringField;
    mtCliNome: TStringField;
    mtCliTranslado: TDateTimeField;
    mtCliAssinou: TStringField;
    mtCliNoturno: TStringField;
    mtCliFimSem: TStringField;
    mtCliAbono: TDateTimeField;
    mtCliMotAbono: TStringField;
    mtCliCidade: TStringField;
    mtCliKM: TIntegerField;
    mtCliVlPedag: TCurrencyField;
    mtCliPgAlim: TBooleanField;
    mtCliPgHosp: TBooleanField;
    mtTecNome: TStringField;
    mtTecSenha: TStringField;
    mtTecID: TStringField;
    mtTecEmpresa: TStringField;
    mtTecListaProj: TStringField;
    MT: TkbmMemTable;
    BSF: TkbmMWBinaryStreamFormat;
    nxRSE: TnxRemoteServerEngine;
    tRAF: TnxTable;
    tRAItem: TnxTable;
    tRAOS: TnxTable;
    dsRAF: TDataSource;
    tRAFID: TAutoIncField;
    tRAFDHCriacao: TDateTimeField;
    tRAFDHFechaCli: TDateTimeField;
    tRAFDHFechaTec: TDateTimeField;
    tRAFDataI: TDateTimeField;
    tRAFDataF: TDateTimeField;
    dsRAItem: TDataSource;
    tRAItemSync: TBooleanField;
    tRAItemTecnico: TStringField;
    tRAItemCliente: TStringField;
    tRAItemTipo: TWordField;
    tRAItemValor: TCurrencyField;
    tRAItemJustDiverg: TMemoField;
    tRAItemDescr: TMemoField;
    tRAItemNumF: TIntegerField;
    tRAItemValorDef: TCurrencyField;
    tRAItemValorCli: TCurrencyField;
    tRAItemValorTec: TCurrencyField;
    tRAItemStatusTec: TWordField;
    tRAItemLogID: TIntegerField;
    tRAItemStatusCli: TWordField;
    tRAItemChave: TStringField;
    tRAItemNomeCli: TStringField;
    tRAItemNomeTec: TStringField;
    dsRAOS: TDataSource;
    tRAOSSync: TBooleanField;
    tRAOSTecnico: TStringField;
    tRAOSCliente: TStringField;
    tRAOSDataOS: TDateTimeField;
    tRAOSIDOS: TIntegerField;
    tRAOSLogID: TIntegerField;
    tRAOSNumF: TIntegerField;
    tRAOSHoras: TTimeField;
    TabMaxDiasUpload: TWordField;
    TabMaxDiasDown: TWordField;
    TabDataDown: TDateTimeField;
    TabNomeFranquia: TStringField;
    TabBitMap: TGraphicField;
    TabObedeceListaProj: TBooleanField;
    TabListaProjDefault: TStringField;
    TabRestringeDiurno: TBooleanField;
    TabTravarTranslado: TBooleanField;
    TabCampoLocalOS: TBooleanField;
    TabInicioDiurno: TDateTimeField;
    TabFimDiurno: TDateTimeField;
    TabUploadApontamentoSemOS: TBooleanField;
    TabPermitirRateio: TBooleanField;
    TabConflitoHoraTodosCli: TBooleanField;
    TabExigeAutorizadoPor: TBooleanField;
    TabMostraReemb: TBooleanField;
    TabForcaTransladoProj: TBooleanField;
    TabTransladoUnicoPorCliente: TBooleanField;
    TabImprimeAndamentoProjeto: TBooleanField;
    TabValidarEDT: TBooleanField;
    TabEstimarFaseNoApontamento: TBooleanField;
    TabExigirEstimativa: TBooleanField;
    TabVlHosp: TCurrencyField;
    TabVlKMCli: TCurrencyField;
    TabVlKMTec: TCurrencyField;
    TabVlAlim: TCurrencyField;
    TabMostrarRA: TBooleanField;
    tRAItemData: TDateField;
    tRAItemID: TWordField;
    tRAItemIDRA: TWordField;
    tRAItemONServ: TBooleanField;
    tRAItemExcluirServ: TBooleanField;
    tRAOSIDRA: TWordField;
    tExp: TDbf;
    tExpCodigo: TStringField;
    tExpValor: TCurrencyField;
    QID: TStringField;
    QTipo: TWordField;
    QValor: TCurrencyField;
    tExpIDCons: TStringField;
    tAuxRAOS: TnxTable;
    tAuxRAOSSync: TBooleanField;
    tAuxRAOSTecnico: TStringField;
    tAuxRAOSCliente: TStringField;
    tAuxRAOSDataOS: TDateTimeField;
    tAuxRAOSIDOS: TWordField;
    tAuxRAOSLogID: TIntegerField;
    tAuxRAOSNumF: TWordField;
    tAuxRAOSHoras: TTimeField;
    tAuxRAOSIDRA: TWordField;
    TabChecarVersaoProj: TBooleanField;
    TabPermiteApagarOSSincronizada: TBooleanField;
    mtCliValorKM: TFloatField;
    TabAtivarIntervalo: TBooleanField;
    procedure tLogBeforePost(DataSet: TDataSet);
    procedure tRAItemCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure Exporta(CliTec: String; PB: TProgressBar);
    procedure AbreSessao;
    procedure FechaSessao;
    procedure Sincronizou(Tabela: TDataset);
    procedure TransfDados(F, D: TDataset);
    procedure TransfRecords(TF, TD: TDataset);
    function SalvaInfoTabela(T: TnxTable): PInfoTabela;
    procedure RestauraInfoTabela(T: TnxTable; var IT : PInfoTabela);
    { Public declarations }
  end;

var
  DM: TDM;
                                  
implementation

uses uDTSyncDef, Windows, Forms, kbmMWZipStdTransStream, uDiatecAdmin;

{$R *.dfm}

procedure TDM.AbreSessao;
var 
  ProxyIP : String;
  ProxyPort: Integer;
begin
  mwTCPIP.Params.Clear;
  mwTCPIP.Active := False;
  mwTCPIP.Port := cfgPort;
  mwTCPIP.Host := cfgSrv;
  mwTCPIP.StreamFormat := 'ZIPPED';
  try
    mwTCPIP.Active := True;
  except
    Raise;  
  end;    
end;

procedure TDM.Exporta(CliTec: String; PB: TProgressBar);
var 
  ValorKM, Vl: Double;
  S: String;
begin
  if SameText(CliTec, 'cliente') then begin
    ValorKM := TabVlKMCli.Value;
    S := 'ValorCli';
  end   
  else begin
    ValorKM := TabVlKMTec.Value;
    S := 'ValorTec';
  end;
  PB.Position := 0;  
      
  Q.Active := False;
  try
    tExp.Active := True;
    tExp.EmptyTable;
    Q.SQL.Text := Format('select %s as ID, Tipo, Sum(%s) as Valor from "RAItem" ' +
                         'where NumF = %s ' +
                         'group by ID, Tipo', [CliTec, S, tRAFID.AsString]);
    Q.Active := True;
    PB.Max := Q.RecordCount;
    Q.First;
    while not Q.Eof do begin
      PB.Position := PB.Position + 1;
      if tExp.Locate('Codigo', QID.Value, []) then 
        tExp.Edit
      else begin
        tExp.Insert;
        tExpCodigo.Value := QID.Value;
        tExpIDCons.Value := tRafID.AsString;
      end;  
      
      if SameText(CliTec, 'cliente') and
         mtCli.Locate('ID', Q.FieldByName('ID').AsString, []) and
         (mtCliValorKM.Value>0.01) then
        VL := mtCliValorKM.Value else
        VL := ValorKM;
        
      if QTipo.Value = tiraKM then
        tExpValor.Value := tExpValor.Value + (QValor.Value * Vl)
      else
        tExpValor.Value := tExpValor.Value + QValor.Value;
        
      tExp.Post;
      Application.ProcessMessages;
      Q.Next;
    end;
  finally
    Q.Active := False;
    tExp.Active := False;
  end;
end;

procedure TDM.FechaSessao;
begin
  mwTCPIP.Active := False;
end;

procedure TDM.Sincronizou(Tabela: TDataset);
var F: TField;
begin
  if Tabela.FindField('Sync') = nil then Exit;
  Tabela.Edit;
  Tabela.FieldByName('Sync').Value := False;
  F := Tabela.FindField('SyncSug');
  if F<>nil then 
    F.Value := False;
  Tabela.Post;
end;

function TDM.SalvaInfoTabela(T: TnxTable): PInfoTabela;
var IT: TInfoTabela;
begin
  IT.itIndexName := T.IndexName;
  IT.itMasterSource := T.MasterSource;
  IT.itMasterFields := T.MasterFields;
  T.CancelRange;
  T.Active := False;
  T.MasterFields := '';
  T.MasterSource := nil;
  T.Active := True;
  T.IndexName := 'ISync';
  New(Result);
  Result^ := IT;
end;

procedure TDM.RestauraInfoTabela(T: TnxTable; var IT : PInfoTabela);
begin
  if IT=nil then Exit;
  try
    T.CancelRange;
    T.IndexName    := IT^.itIndexName;
    T.Active := False;
    T.MasterFields := IT^.itMasterFields;
    T.MasterSource := IT^.itMasterSource;
    T.Active := True;
  finally
    Dispose(IT);
    IT := nil;
  end;  
end;
    
procedure TDM.TransfDados(F, D: TDataset);
var 
  I : Integer;
  AF : TField;
begin
  D.Append;
  for I := 0 to pred(F.FieldCount) do 
  with F.Fields[I] do
  if FieldKind = fkData then begin
    AF := D.FindField(FieldName);
    if AF <> nil then 
      AF.Value := Value;
  end;  
  AF := D.FindField('Sync');
  if AF <> nil then AF.AsBoolean := False;  

  AF := D.FindField('SyncSug');
  if AF <> nil then AF.AsBoolean := False;
  
  D.Post;
end;

procedure TDM.TransfRecords(TF, TD: TDataset);
begin
  TF.First;
  while not TF.Eof do begin
    TransfDados(TF, TD);
    TF.Next;
  end;
end;

procedure TDM.tLogBeforePost(DataSet: TDataSet);
begin
  FrmPri.VG.DataController.PostEditingData;
end;

procedure TDM.tRAItemCalcFields(DataSet: TDataSet);
begin
  tRAItemChave.Value := 
    tRAItemTecnico.Value+'|'+
    tRAItemCliente.Value+'|'+
    tRAItemIDRA.AsString;
end;

end.
