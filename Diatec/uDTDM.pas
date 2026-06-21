unit uDTDM;

interface

uses
  Windows, Messages, Variants, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, kbmMemTable, nxdb, nxllConst, nxllTypes, nxdbBase, 
  ExtCtrls, lmdclass, FileCtrl,uDTSyncDef, 
  LMDSysInfo, LMDCustomComponent, LMDIniCtrl, lmdcont,
  nxllComponent, nxsrSqlEngineBase, nxsqlEngine, nxsdServerEngine,
  nxsrServerEngine, cxEdit, cxEditRepositoryItems, cxStyles,
  cxClasses, cxGridTableView, cxGridBandedTableView;

type
  TDM = class(TDataModule)
    dsCli: TDataSource;
    dsProj: TDataSource;
    dsFaseTec: TDataSource;
    tAuxCli: TnxTable;
    tTec: TnxTable;
    tFaseTec: TnxTable;
    tOS: TnxTable;
    tAponta: TnxTable;
    nxdb: TnxDatabase;
    nxSession: TnxSession;
    tAuxCliID: TStringField;
    tAuxCliNome: TStringField;
    tTecNome: TStringField;
    tFaseTecCliente: TStringField;
    tFaseTecTecnico: TStringField;
    tFaseTecStatus: TStringField;
    tFaseTecSync: TBooleanField;
    tOSCliente: TStringField;
    tOSData: TDateTimeField;
    tOSID: TWordField;
    tOSInicio: TDateTimeField;
    tOSTermino: TDateTimeField;
    tOSTranslado: TDateTimeField;
    tOSAbono: TDateTimeField;
    tOSMotivoAbon: TStringField;
    tApontaCliente: TStringField;
    tApontaProjeto: TStringField;
    tApontaData: TDateTimeField;
    tApontaTecnico: TStringField;
    tApontaHoras: TDateTimeField;
    dsFase: TDataSource;
    dsAponta: TDataSource;
    tApontaSync: TBooleanField;
    tFase: TnxTable;
    tFaseCliente: TStringField;
    tFaseNome: TStringField;
    tFaseInicio: TDateTimeField;
    tFaseTermino: TDateTimeField;
    tFaseHoras: TWordField;
    tFasePercEst: TWordField;
    tFaseSync: TBooleanField;
    tFaseHorasReal: TFloatField;
    dsTec: TDataSource;
    tTecSenha: TStringField;
    tAmarraFase: TnxTable;
    tFaseSumario: TBooleanField;
    tProj: TnxTable;
    tProjCliente: TStringField;
    tProjNome: TStringField;
    Timer1: TTimer;
    tOSTecnico: TStringField;
    tOSNomeCliente: TStringField;
    dsOS: TDataSource;
    tOSItens: TnxTable;
    tOSItensCliente: TStringField;
    tOSItensData: TDateTimeField;
    tOSItensTecnico: TStringField;
    tOSItensHoras: TDateTimeField;
    tOSItensSync: TBooleanField;
    dsOSItems: TDataSource;
    tOSItensNomeProjeto: TStringField;
    tOSItensNomeFase: TStringField;
    tNovaOS: TnxTable;
    tMotivo: TnxTable;
    tMotivoID: TStringField;
    tMotivoNome: TStringField;
    dsMotivo: TDataSource;
    tNovoAponta: TnxTable;
    tOSTotalHoras: TDateTimeField;
    tAuxProj: TnxTable;
    tAuxFase: TnxTable;
    tFaseStatus: TStringField;
    tFaseValidador: TStringField;
    tOSUniqueID: TStringField;
    tOSFaseDesc: TnxTable;
    tOSFaseDescCliente: TStringField;
    tOSFaseDescTecnico: TStringField;
    tOSAssinou: TStringField;
    tApontaTipoHora: TStringField;
    tFaseDatReI: TDateTimeField;
    tFaseDatReF: TDateTimeField;
    tFaseDataVld: TDateTimeField;
    tTipoHora: TnxTable;
    tApontaNomeTipoHora: TStringField;
    tOSItensOS: TSmallintField;
    tApontaOS: TSmallintField;
    tApontaDescricao: TStringField;
    tOSItensDescricao: TStringField;
    tOSTotalFinal: TDateTimeField;
    tOSItensNomeTipoHora: TStringField;
    tOSNomeAbono: TStringField;
    tOSNomeTecnico: TStringField;
    tOSCodNomeCli: TStringField;
    tOSCodNomeTec: TStringField;
    tOSItensCodNomeFase: TStringField;
    tOSChaveOS: TStringField;
    tOSFaseDescTexto: TStringField;
    tOSFaseDescSync: TBooleanField;
    tFaseIconIndex: TIntegerField;
    tApontaKeyField: TStringField;
    tOSSync: TBooleanField;
    INICtrl: TLMDIniCtrl;
    tApontaNomeTecnico: TStringField;
    tFaseUniqueID: TStringField;
    tAuxCliTranslado: TDateTimeField;
    tAuxCliAssinou: TStringField;
    tOcorrencia: TnxTable;
    dsOcorrencia: TDataSource;
    tApontaOcorrencia: TStringField;
    tAmarraFaseCliente: TStringField;
    tAmarraFaseProjeto: TStringField;
    tAmarraFaseTipo: TStringField;
    tOSItensProjeto: TStringField;
    tOSItensTipoHora: TStringField;
    tOSItensOcorrencia: TStringField;
    tOSItensRevisao: TStringField;
    tProjID: TStringField;
    tFaseProjeto: TStringField;
    tFaseRevisao: TStringField;
    tFaseTecProjeto: TStringField;
    tFaseIDRetag: TStringField;
    tOSProjeto: TStringField;
    tOSFaseDescProjeto: TStringField;
    tFaseTecNomeTec: TStringField;
    tAmarraFaseNomeFasePai: TStringField;
    dsAmarraFase: TDataSource;
    tApontaRevisao: TStringField;
    tTipoHoraID: TStringField;
    tTipoHoraDescricao: TStringField;
    tTipoHoraTipo: TStringField;
    DBDown: TnxDatabase;
    LMDSysInfo1: TLMDSysInfo;
    tAuxCliNoturno: TStringField;
    tAuxCliFimSem: TStringField;
    qCli: TnxQuery;
    qCliCliente: TStringField;
    qCliID: TStringField;
    qCliNome: TStringField;
    qCliTranslado: TDateTimeField;
    qCliAssinou: TStringField;
    qCliNoturno: TStringField;
    qCliFimSem: TStringField;
    tFaseNovoHor: TWordField;
    tFaseNovoIni: TDateTimeField;
    tFaseNovoFim: TDateTimeField;
    tFaseJustific: TStringField;
    tFaseTecSug: TStringField;
    tParametro: TnxTable;
    tParametroMaxDiasUpload: TWordField;
    tParametroMaxDiasDown: TWordField;
    tParametroDataDown: TDateTimeField;
    tParametroNomeFranquia: TStringField;
    tParametroBitMap: TGraphicField;
    tProjLocaPla: TStringField;
    tProjLocaRec: TStringField;
    tFaseMotSug: TStringField;
    tApontaTipoHoraTipo: TStringField;
    tProjNoturno: TStringField;
    tProjFimSem: TStringField;
    tFaseFlagSug: TStringField;
    tProjTranslado: TDateTimeField;
    tFaseCliSug: TStringField;
    tFaseSyncSug: TBooleanField;
    tFaseIDSugPrint: TStringField;
    tFaseNomeTecSug: TStringField;
    tFaseNomeMotSug: TStringField;
    tFaseDataSug: TDateTimeField;
    tSolicita: TnxTable;
    tSolicitaCliente: TStringField;
    tSolicitaProjeto: TStringField;
    tSolicitaTecnico: TStringField;
    tSolicitaData: TDateTimeField;
    tSolicitaItem: TWordField;
    tSolicitaTipo: TStringField;
    tSolicitaOrigem: TStringField;
    tSolicitaNomeResp: TStringField;
    tSolicitaSync: TBooleanField;
    tSolicitaDesc: TnxTable;
    dsSolicita: TDataSource;
    dsSolicitaDesc: TDataSource;
    tOcorrenciaID: TStringField;
    tOcorrenciaDescricao: TStringField;
    tSolicitaDescCliente: TStringField;
    tSolicitaDescProjeto: TStringField;
    tSolicitaDescTecnico: TStringField;
    tSolicitaDescItem: TWordField;
    tSolicitaDescPos: TWordField;
    tSolicitaDescTexto: TStringField;
    tSolicitaDescSync: TBooleanField;
    tTecID: TStringField;
    tSolicitaNomeTec: TStringField;
    tSolicitaNomeTipo: TStringField;
    tSolicitaNomeOrigem: TStringField;
    tSolicitaDescData: TDateTimeField;
    tAuxSol: TnxTable;
    tSolicitaDescricao: TStringField;
    tAuxSD: TnxTable;
    tSolicitaChave: TStringField;
    qCliAbono: TDateTimeField;
    qCliMotAbono: TStringField;
    tTecEmpresa: TStringField;
    tSolicitaDataRT: TDateTimeField;
    tSolicitaDescTipo: TStringField;
    tSolicitaRetorno: TStringField;
    tSolicitaNomeRT: TStringField;
    tProjAbono: TDateTimeField;
    tProjMotAbono: TStringField;
    tProjOSAbon: TStringField;
    tFaseIDSug: TStringField;
    tAmarraFaseFasePai: TStringField;
    tAmarraFaseFaseFilho: TStringField;
    tOSItensFase: TStringField;
    tFaseID: TStringField;
    tFaseFasePai: TStringField;
    tFaseTecFase: TStringField;
    tApontaFase: TStringField;
    tOSFaseDescFase: TStringField;
    tTecListaProj: TStringField;
    dsPar: TDataSource;
    tParametroRestringeDiurno: TBooleanField;
    tOSLocal: TStringField;
    tParametroTravarTranslado: TBooleanField;
    tParametroCampoLocalOS: TBooleanField;
    tOSNomeLocal: TStringField;
    tOSEntrou: TStringField;
    tParametroInicioDiurno: TDateTimeField;
    tParametroFimDiurno: TDateTimeField;
    tParametroUploadApontamentoSemOS: TBooleanField;
    tParametroObedeceListaProj: TBooleanField;
    tParametroListaProjDefault: TStringField;
    tOSDataComp: TDateTimeField;
    tParametroPermitirRateio: TBooleanField;
    tParametroConflitoHoraTodosCli: TBooleanField;
    tOSNumAtend: TStringField;
    tProjTipo: TStringField;
    tParametroExigeAutorizadoPor: TBooleanField;
    tOSFaseDescData: TDateTimeField;
    tOSFaseDescOS: TSmallintField;
    ServerEngine: TnxServerEngine;
    SQLEngine: TnxSqlEngine;
    tLog: TnxTable;
    tLogID: TAutoIncField;
    tLogTecnico: TStringField;
    tLogData: TDateTimeField;
    tLogDetalhes: TMemoField;
    tLogOper: TWordField;
    tLogOK: TBooleanField;
    tLogDuracao: TDateTimeField;
    tLogUUpload: TIntegerField;
    dsLog: TDataSource;
    tLogNomeTec: TStringField;
    tLogNomeOper: TStringField;
    tOSGeraReemb: TBooleanField;
    tOSTipoReemb: TStringField;
    tOSKmDestino: TFloatField;
    tOSPedagio1: TFloatField;
    tOSPedagio2: TFloatField;
    tOSPedagio3: TFloatField;
    tOSPedagio4: TFloatField;
    tOSMotivo: TStringField;
    tOSOutroLocal: TStringField;
    tOSItensChaveU: TStringField;
    tParametroMostraReemb: TBooleanField;
    tParametroForcaTransladoProj: TBooleanField;
    tApontaItem: TIntegerField;
    tApontaLogID: TIntegerField;
    tApontaDownOk: TBooleanField;
    tOSFaseDescItem: TIntegerField;
    tOSFaseDescLogID: TIntegerField;
    tOSFaseDescDownOk: TBooleanField;
    tOSItensItem: TIntegerField;
    tOSItensLogID: TIntegerField;
    tOSItensDownOk: TBooleanField;
    tParametroTransladoUnicoPorCliente: TBooleanField;
    tOSVeicProp: TStringField;
    tOSProjCodNome: TStringField;
    tProjHorasPrev: TFloatField;
    tProjHorasReal: TFloatField;
    tProjPosicao: TDateTimeField;
    tOSProjHorasPrev: TFloatField;
    tOSProjHorasReal: TFloatField;
    tOSProjNome: TStringField;
    tOSProjPosicao: TDateTimeField;
    tParametroImprimeAndamentoProjeto: TBooleanField;
    tFer: TnxTable;
    tFerData: TDateField;
    tFerDescricao: TStringField;
    mtHR: TkbmMemTable;
    mtHRID: TStringField;
    mtHRHoras: TFloatField;
    tFaseHR: TFloatField;
    tParametroValidarEDT: TBooleanField;
    tParametroEstimarFaseNoApontamento: TBooleanField;
    tParametroExigirEstimativa: TBooleanField;
    tFaseOBS: TStringField;
    tRA: TnxTable;
    tRAOS: TnxTable;
    tRAItem: TnxTable;
    tRASync: TBooleanField;
    tRATecnico: TStringField;
    tRACliente: TStringField;
    tRADataI: TDateField;
    tRADataF: TDateField;
    tRALogID: TIntegerField;
    tRAOSSync: TBooleanField;
    tRAOSTecnico: TStringField;
    tRAOSCliente: TStringField;
    tRAOSDataOS: TDateTimeField;
    tRAOSLogID: TIntegerField;
    tRAItemSync: TBooleanField;
    tRAItemTecnico: TStringField;
    tRAItemCliente: TStringField;
    tRAItemTipo: TWordField;
    tRAItemValor: TCurrencyField;
    tRAItemDescr: TMemoField;
    tRAItemNumF: TIntegerField;
    tRAItemValorDef: TCurrencyField;
    tRAItemValorCli: TCurrencyField;
    tRAItemValorTec: TCurrencyField;
    tRAItemStatusTec: TWordField;
    tRAItemLogID: TIntegerField;
    tRAItemStatusCli: TWordField;
    dsRA: TDataSource;
    dsRAOS: TDataSource;
    dsRAItem: TDataSource;
    tRAChaveU: TStringField;
    tRAOSChaveU: TStringField;
    tRAItemChaveU: TStringField;
    tRANomeCli: TStringField;
    tRANumF: TIntegerField;
    tRAStatusCli: TWordField;
    tRAStatusTec: TWordField;
    tRAItemCusteadoPor: TIntegerField;
    tRAItemJustDiverg: TMemoField;
    qCliCidade: TStringField;
    qCliKM: TIntegerField;
    qCliVlPedag: TCurrencyField;
    qCliPgAlim: TBooleanField;
    qCliPgHosp: TBooleanField;
    tParametroVlHosp: TCurrencyField;
    tParametroVlKMCli: TCurrencyField;
    tParametroVlKMTec: TCurrencyField;
    tParametroMostrarRA: TBooleanField;
    tParametroVlAlim: TCurrencyField;
    tAuxRAOS: TnxTable;
    tRAOSNumF: TIntegerField;
    tRAOSHoras: TTimeField;
    tRADHUpload: TDateTimeField;
    tAuxRA: TnxTable;
    tRAID: TIntegerField;
    tRAOSIDOS: TWordField;
    tRAOSIDRA: TIntegerField;
    tRAItemIDRA: TIntegerField;
    tRAItemData: TDateField;
    tRAItemID: TWordField;
    tRAItemONServ: TBooleanField;
    tRAItemNomeCli: TStringField;
    tDesp: TnxTable;
    dsDesp: TDataSource;
    tDespSync: TBooleanField;
    tDespTecnico: TStringField;
    tDespCliente: TStringField;
    tDespData: TDateField;
    tDespID: TWordField;
    tDespIDRA: TWordField;
    tDespTipo: TWordField;
    tDespValor: TCurrencyField;
    tDespJustDiverg: TMemoField;
    tDespDescr: TMemoField;
    tDespNumF: TIntegerField;
    tDespValorDef: TCurrencyField;
    tDespValorCli: TCurrencyField;
    tDespValorTec: TCurrencyField;
    tDespStatusTec: TWordField;
    tDespLogID: TIntegerField;
    tDespStatusCli: TWordField;
    tDespONServ: TBooleanField;
    tDespExcluirServ: TBooleanField;
    tDespChaveU: TStringField;
    tDespCusteadoPor: TIntegerField;
    tDespNomeCli: TStringField;
    repEdit: TcxEditRepository;
    repEditStatusTec: TcxEditRepositoryImageComboBoxItem;
    repEditStatusCli: TcxEditRepositoryImageComboBoxItem;
    repEditTipoDesp: TcxEditRepositoryImageComboBoxItem;
    tRAItemExcluirServ: TBooleanField;
    tRAOSChaveOS: TStringField;
    tRANomeTec: TStringField;
    tRAItemNomeTipo: TStringField;
    tRAItemValorStr: TStringField;
    tFasePercRealizado: TFloatField;
    tOSApagar: TStringField;
    tOSVersaoProj: TStringField;
    tApontaApagar: TStringField;
    tProjVersaoProj: TStringField;
    tOSItensApagar: TStringField;
    tOSFaseDescApagar: TStringField;
    Q: TnxQuery;
    tParametroPermiteApagarOSSincronizada: TBooleanField;
    tProjAPSemOS: TStringField;
    tOSObrigaInt: TStringField;
    tOSAbonaInt: TStringField;
    tOSIInt: TDateTimeField;
    tOSFInt: TDateTimeField;
    tProjAbonaInt: TStringField;
    tParametroAtivarIntervalo: TBooleanField;
    tOSTempoInt: TDateTimeField;
    tAuxDesc: TnxTable;
    tAuxDescCliente: TStringField;
    tAuxDescTecnico: TStringField;
    tAuxDescPos: TWordField;
    tAuxDescTexto: TStringField;
    tAuxDescSync: TBooleanField;
    tAuxDescProjeto: TStringField;
    tAuxDescFase: TStringField;
    tAuxDescData: TDateTimeField;
    tAuxDescOS: TSmallintField;
    tAuxDescItem: TIntegerField;
    tAuxDescLogID: TIntegerField;
    tAuxDescDownOk: TBooleanField;
    tAuxDescApagar: TStringField;
    tOSVlTrans: TCurrencyField;
    tOSObs: TStringField;
    tParametroAtivarValorTrans: TBooleanField;
    tOSItensTipoHoraTipo: TStringField;
    tParametroPermiteCorrigirOS: TBooleanField;
    dsMTDescr: TDataSource;
    tOSFaseDescPos: TIntegerField;
    mtDescr: TkbmMemTable;
    mtDescrCliente: TStringField;
    mtDescrTecnico: TStringField;
    mtDescrTexto: TStringField;
    mtDescrSync: TBooleanField;
    mtDescrProjeto: TStringField;
    mtDescrFase: TStringField;
    mtDescrData: TDateTimeField;
    mtDescrOS: TSmallintField;
    mtDescrItem: TIntegerField;
    mtDescrLogID: TIntegerField;
    mtDescrDownOk: TBooleanField;
    mtDescrApagar: TStringField;
    mtDescrPos: TIntegerField;
    tParametroTodasHorasNoFeriado: TBooleanField;
    tTipoHoraSemTrans: TStringField;
    procedure tDespBeforePost(DataSet: TDataSet);
    procedure tDespAfterInsert(DataSet: TDataSet);
    procedure tDespCalcFields(DataSet: TDataSet);
    procedure tApontaAfterInsert(DataSet: TDataSet);
    procedure tFaseCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure tProjAfterScroll(DataSet: TDataSet);
    procedure tAuxCliAfterScroll(DataSet: TDataSet);
    procedure tFaseBeforePost(DataSet: TDataSet);
    procedure tApontaBeforePost(DataSet: TDataSet);
    procedure tOSBeforePost(DataSet: TDataSet);
    procedure tOSAfterInsert(DataSet: TDataSet);
    procedure tOSItensBeforePost(DataSet: TDataSet);
    procedure tOSCalcFields(DataSet: TDataSet);
    procedure tApontaBeforeDelete(DataSet: TDataSet);
    procedure tApontaCalcFields(DataSet: TDataSet);
    procedure tOSItensCalcFields(DataSet: TDataSet);
    procedure tSolicitaCalcFields(DataSet: TDataSet);
    procedure tSolicitaBeforePost(DataSet: TDataSet);
    procedure tSolicitaDescBeforePost(DataSet: TDataSet);
    procedure tSolicitaAfterInsert(DataSet: TDataSet);
    procedure tLogCalcFields(DataSet: TDataSet);
    procedure tRACalcFields(DataSet: TDataSet);
    procedure tRAOSCalcFields(DataSet: TDataSet);
    procedure tRAItemCalcFields(DataSet: TDataSet);
    procedure tRAAfterInsert(DataSet: TDataSet);
    procedure tRAOSAfterInsert(DataSet: TDataSet);
    procedure tRABeforePost(DataSet: TDataSet);
    procedure tRAOSBeforePost(DataSet: TDataSet);
    procedure tRAItemBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    function GetVer: String;
    procedure AbreDB;
    procedure FechaDB;
    procedure FiltraOS;
    procedure ApagaOS;
    procedure ExcluiOSServ;
    procedure ApagaApontamento;
    procedure ApagaCGP;
{    function NovoOSID(Cliente: String; Dia: TDateTime): Integer;}

    function NovoItemSol(Dia: TDateTime): Integer;

    function ConflitoOSID(Cliente: String; 
                          Dia, Inicio, Termino: TDateTime; 
                          ID: Word): Boolean;

    function TemTranslado(Cliente: String; Dia: TDateTime; ID: Word): Boolean; 
                          
                          
    function NovoItemAponta(Cliente, Projeto, Fase: String): Integer;
{    function ExisteAponta(Cliente, Projeto, Fase: String): Boolean;}
    
    function CalcDesc(C, P, F, T: String; I: Integer; aGravaMT: Boolean = False): String;
    function CalcMemoSol(Tipo: Char): String;
    procedure SomaHR(Forcar: Boolean);
    procedure NovoStatusPai(aFasePai: String; aStatus: String);
    function ObtemValorRADef(aTipo: Integer): Double;
    function ProxIDRA: Integer;
    function ProxIDItem: Integer;
    { Public declarations }
  end;

  function DateTimeToHoras(DT: TDateTime): Double;
  function DifHoras(I, T: TDateTime): TDateTime;
  Function CopiaArquivo(srcname,destname:string):byte;
  function ZeroPad(St: String; Tam: Byte): String;
  

var
  DM: TDM;

  IDTecnico: String;
  NomeTecnico: String;
  SenhaTec: String;
  UProjSoma: String;
  lAbort: Boolean = False;

const  
// Status Fase
sfIniciado    = 0;
sfConcluido   = 1;
sfValidado    = 2;
sfNaoIniciado = 3;
sfEstourado   = 4;
sfSumario     = 5;  
sfAtrasada    = 6;

const
  CriandoProj  : Boolean = False;
  Inicializando: Boolean = False;
  Sincronizando: Boolean = False;
  SomandoHR    : Boolean = False;
  UploadSemOS  : Boolean = True;

const  
  lpHoras      = 'HH';
  lpHoraInicio = 'HI';
  lpHoraFim    = 'HF';
  lpTotal      = 'HD';
 
  TagIO = '<IO>';
  TagFO = '<FO>';
  
implementation

uses uDTFrmPri, kbmMWZipStdTransStream, uVersionInfo;

{$R *.DFM}

function ZeroPad(St: String; Tam: Byte): String;
begin
  Result := St;
  while Length(Result) < Tam do
    Result := '0' + Result;
end;

function Pad(St: String; Tam: Byte): String;
begin
  Result := St;
  while Length(Result) < Tam do Result := Result + ' ';
end;

function DateTimeToHoras(DT: TDateTime): Double;
begin
  Result := Frac(DT) * 24;
end;

function ConflitoHorario(I1, T1, I2, T2: TDateTime): Boolean;
begin
  Result := (I1 < T2) and (I2 < T1);
end;

function TDM.ConflitoOSID(Cliente: String;
                          Dia, Inicio, Termino: TDateTime; 
                          ID: Word): Boolean;
var SIndexName : String;
begin
  SIndexName := tNovaOS.IndexName;
  try
    tNovaOS.CancelRange;
    if tParametroConflitoHoraTodosCli.Value then begin
      tNovaOS.IndexName := 'ITecnico';
      tNovaOS.SetRange([IDTecnico, Dia], [IDTecnico, Dia]);
    end else   
      tNovaOS.SetRange([Cliente, IDTecnico, Dia], [Cliente, IDTecnico, Dia]);

    tNovaOS.Refresh;
    tNovaOS.First;
    Result := True;
    while not tNovaOS.Eof do
      if (tNovaOS.FieldByName('ID').AsInteger<>ID) and
         ConflitoHorario(tNovaOS.FieldByName('Inicio').AsDateTime,
                         tNovaOS.FieldByName('Termino').AsDateTime,
                         Inicio, Termino)
      then
        Exit
      else
        tNovaOS.Next;          
  finally
    tNovaOS.IndexName := SIndexName;
  end;      
  Result := False;  
end;

function TDM.TemTranslado(Cliente: String; Dia: TDateTime; ID: Word): Boolean; 
begin
  tNovaOS.CancelRange;
  tNovaOS.SetRange([Cliente, IDTecnico, Dia], [Cliente, IDTecnico, Dia]);
  tNovaOS.Refresh;
  tNovaOS.First;
  Result := True;
  while not tNovaOS.Eof do begin
    if (tNovaOS.FieldByName('ID').AsInteger<>ID) and
       (FormatDateTime('hh:mm', tNovaOS.FieldByName('Translado').AsDateTime) > '00:00') then
      Exit;
    tNovaOS.Next;
  end;  
  Result := False;  
end;

                          
function TDM.NovoItemSol(Dia: TDateTime): Integer;
begin
  tAuxSol.CancelRange;
  tAuxSol.SetRange([tSolicitaCliente.Value, tSolicitaProjeto.Value, IDTecnico, Dia], 
                   [tSolicitaCliente.Value, tSolicitaProjeto.Value, IDTecnico, Dia]);
  tAuxSol.Refresh;
  tAuxSol.Last;
  if tAuxSol.RecordCount > 0 then
    Result := tAuxSol.FieldByName('Item').AsInteger + 1
  else
    Result := 1;
end;

{function TDM.NovoOSID(Cliente: String; Dia: TDateTime): Integer;
begin
  tNovaOS.CancelRange;
  tNovaOS.SetRange([Cliente, IDTecnico, Dia], [Cliente, IDTecnico, Dia]);
  tNovaOS.Refresh;
  tNovaOS.Last;
  if tNovaOS.RecordCount > 0 then
    Result := tNovaOS.FieldByName('ID').AsInteger + 1
  else
    Result := 1;
end;}

Function CopiaArquivo(srcname,destname:string):byte;
Var Source, Dest      : File;
    Buffer            : Array[1..1024] of Byte;
    ReadCnt, WriteCnt : Integer;
Begin

{ USO:
  CopiaArquivo('C:\path\ArqOrigem.Ext','C:\path\ArqDest.Ext')
  Devolve: 0 = Ok
           1 = Erro de I/O no arquivo de origem
           2 = Erro de I/O no destino
           3 = Disco Cheio
}
   AssignFile(source,srcname);
   Try
      Reset(Source,1);
   Except
      CopiaArquivo := 1;
      Exit;
   End;

   AssignFile(Dest,DestName);
   Try
      Rewrite(Dest,1)
   Except
      CopiaArquivo := 2;
      Exit;
   End;
   Repeat
      BlockRead(source,buffer,sizeof(buffer),readcnt);
      Try
         BlockWrite(Dest,Buffer,readcnt,writecnt);
      Except
         CopiaArquivo := 3; {disco cheio?}
         Exit;
      End;
   Until (readcnt = 0) or (writecnt <> readcnt);
   CloseFile(Dest);
   CloseFile(Source);
   CopiaArquivo := 0;
End;

function TDM.CalcMemoSol(Tipo: Char): String;
begin
{  if Inicializando then Exit;}
  tAuxSD.CancelRange;
  tAuxSD.SetRange([Tipo, tSolicitaCliente.Value, 
                   tSolicitaProjeto.Value,
                   tSolicitaTecnico.Value,
                   tSolicitaData.Value,
                   tSolicitaItem.Value],
                   
                  [Tipo, tSolicitaCliente.Value, 
                   tSolicitaProjeto.Value,
                   tSolicitaTecnico.Value,
                   tSolicitaData.Value,
                   tSolicitaItem.Value]);
                   
  tAuxSD.Refresh;
  tAuxSD.First;
  Result := '';
  while not tAuxSD.Eof do begin
    if Result>'' then Result := Result + #13;
    Result := Result + tAuxSD.FieldByName('Texto').AsString;
    tAuxSD.Next;
  end;
end;

function TDM.CalcDesc(C, P, F, T: String; I: Integer; aGravaMT: Boolean = False): String;
var
  Oculto, TeveTXT: Boolean;
  S, Linha : String;
  X : Integer;
begin
  if Inicializando then Exit;
  tOSFaseDesc.IndexName := 'IChave';
  tOSFaseDesc.SetRange([C, P, F, T, I], [C, P, F, T, I]);
  tOSFaseDesc.First;
  Result := '';
  Oculto := False;
  while not tOSFaseDesc.Eof do begin
    S := tOSFaseDescTexto.Value;
    Linha := '';
    TeveTXT := False;
    if (S='') and (not Oculto) then
      TeveTXT := True;
    while S > '' do begin
      if Oculto then begin
        X := Pos(TagFO, S);
        if X > 0 then begin
          Oculto := False;
          Delete(S, 1, X+Length(TagFO));
        end else
          S := '';
      end else begin
        TeveTXT := True;
        X := Pos(TagIO, S);
        if X > 0 then begin
          Oculto := True;
          Linha := Copy(S, 1, X-1);
          Result := Result + Linha;
          Delete(S, 1, X+Length(TagIO));
        end else begin
          Linha := S;
          Result := Result + S;
          S := '';
        end;
      end;
    end;
      if aGravaMT then begin
        mtDescr.Append;
        mtDescrData.Value := tOSFaseDescData.Value;
        mtDescrCliente.Value := C;
        mtDescrProjeto.Value := P;
        mtDescrFase.Value := F;
        mtDescrTecnico.Value := T;
        mtDescrItem.Value := I;
        mtDescrPos.Value := tOSFaseDescPos.Value;
        mtDescrTexto.Value := Linha;
        mtDescrApagar.Value := tOSFaseDescApagar.Value;
        mtDescr.Post;
      end;
    if TeveTXT then begin

      Result := Result + sLineBreak;
    end;
    tOSFaseDesc.Next;
  end;
end;

{function TDM.ExisteAponta(Cliente, Projeto, Fase: String): Boolean;
var SaveIndexName: String;
begin
  SaveIndexName := tNovoAponta.IndexName;
  tNovoAponta.IndexName := 'IProjFaseData';
  try
    tNovoAponta.SetRange([Cliente, Projeto, Fase, Date, IDTecnico],
                         [Cliente, Projeto, Fase, Date, IDTecnico]);
    tNovoAponta.Refresh;
    Result := (tNovoAponta.RecordCount > 0);
  finally
    tNovoAponta.CancelRange;
    tNovoAponta.IndexName := SaveIndexName;
  end;
end;}

function TDM.NovoItemAponta(Cliente, Projeto, Fase: String): Integer;
begin
  Result := Random(High(Integer));
  Exit;
  
  tNovoAponta.CancelRange;
  tNovoAponta.SetRange([Cliente, Projeto, Fase, IDTecnico],
                       [Cliente, Projeto, Fase, IDTecnico]);
  tNovoAponta.Refresh;
  tNovoAponta.Last;
  if tNovoAponta.RecordCount > 0 then
    Result := tNovoAponta.FieldByName('Item').AsInteger + 1
  else
    Result := 1;
end;

procedure TDM.ApagaApontamento;
begin
  if tAponta.RecordCount=0 then Exit;
  nxdb.StartTransaction;
  try
    tOSFaseDesc.SetRange([tApontaCliente.Value,
                          tApontaProjeto.Value,
                          tApontaFase.Value,
                          tApontaTecnico.Value,
                          tApontaItem.Value],

                         [tApontaCliente.Value,
                          tApontaProjeto.Value,
                          tApontaFase.Value,
                          tApontaTecnico.Value,
                          tApontaItem.Value]);
    try
      tOSFaseDesc.First;
      while not (tOSFaseDesc.Eof and tOSFaseDesc.Bof) do
        tOSFaseDesc.Delete;
    finally
      tOSFaseDesc.CancelRange;
    end;
    tAponta.Delete;
    nxdb.Commit;
  except
    tAponta.Cancel;
    tFase.Cancel;
    nxdb.Rollback;
    Raise;
  end;
end;

procedure TDM.ApagaOS;
begin
  if tOS.RecordCount = 0 then Exit;
  nxdb.StartTransaction;
  try
    tOSItens.First;
    while tOSItens.RecordCount > 0 do begin
      tOSItens.Edit;
      tOSItensOS.Value := -1;
      tOSItens.Post;
      tOSItens.Refresh;
      tOSItens.First;
    end;
    tOS.Delete;
    nxdb.Commit;
  except
    tOS.Cancel;
    nxdb.RollBack;
    Raise;
  end;
end;

procedure TDM.FiltraOS;
begin
  tOS.CancelRange;
  tOS.IndexName := 'ITecnico';
  tOS.SetRange([IDTecnico], [IDTecnico]);
  tOS.Refresh;

  tSolicita.Filtered := False;
  tSolicita.Filter   := '(Origem='+QuotedStr('C')+') OR (Tecnico='+QuotedStr(IDTecnico)+')';
  tSolicita.Filtered := True;
  tSolicita.Refresh;
end;

procedure TDM.tApontaAfterInsert(DataSet: TDataSet);
begin
  if Sincronizando then Exit;
  tApontaCliente.Value := tFaseCliente.Value;
  tApontaProjeto.Value := tFaseProjeto.Value;
  tApontaFase.Value    := tFaseID.Value;
  tApontaData.Value    := Date;
  tApontaHoras.Value   := 0;
  tApontaTecnico.Value := IDTecnico;
  tApontaOS.Value      := -1;
  tApontaSync.Value    := True;
  tApontaRevisao.Value := tFaseRevisao.Value;
  tTipoHora.First;
  tApontaTipoHora.Value := tTipoHora.FieldByName('ID').AsString;
end;

procedure TDM.tFaseCalcFields(DataSet: TDataSet);
begin
  if Sincronizando then Exit;
  if SomandoHR then Exit;

  if tFaseSumario.Value then
    tFaseHR.AsVariant := mtHR.Lookup('ID', tFaseID.Value, 'Horas')
  else
    tFaseHR.Value := tFaseHorasReal.Value;  

  with tFaseMotSug do
  if Value='C' then
    tFaseNomeMotSug.Value := 'Solicitação do Cliente'
  else
  if Value='D' then
    tFaseNomeMotSug.Value := 'Levantamento Deficiente'
  else  
  if Value='E' then
    tFaseNomeMotSug.Value := 'Estouro por ocorrências'
  else
    tFaseNomeMotSug.Value := tFaseMotSug.Value;

  if (tFaseStatus.Value='C') or (tFaseStatus.Value='V') then
    tFasePercRealizado.Value := 100
  else  
  if (tFaseHoras.Value > 0.0009) and (tFaseHR.Value > 0.0009) then
    tFasePercRealizado.Value := (tFaseHR.Value / tFaseHoras.Value) * 100
  else                                    
    tFasePercRealizado.Value := 0;

  tFaseUniqueID.Value :=
      'V' + 
      Trim(tFaseCliente.Value) + 
      Trim(tFaseProjeto.Value) + 
      Trim(tFaseID.Value);  

  tFaseIDSugPrint.Value :=
      'R' + 
      Trim(tFaseCliente.Value)+ 
      Trim(tFaseProjeto.Value)+ 
      Trim(tFaseID.Value) + 
      FormatDateTime('yyyymmdd', tFaseDataSug.Value) +      
      Trim(tFaseIDSug.Value);     

  If tFaseSumario.Value then
     tFaseIconIndex.Value := sfSumario
  else
  if tFaseStatus.Value = 'I' then begin
    if tFaseHorasReal.Value > tFaseHoras.Value then
      tFaseIconIndex.Value := sfEstourado
    else
      tFaseIconIndex.Value := sfIniciado;
  end else        
  if tFaseStatus.Value = 'C' then
    tFaseIconIndex.Value := sfConcluido
  else
  if tFaseStatus.Value = 'V' then
    tFaseIconIndex.Value := sfValidado
  else 
    tFaseIconIndex.Value := sfNaoIniciado;

  if (tFaseIconIndex.Value = sfNaoIniciado) or  
     (tFaseIconIndex.Value = sfIniciado) then 
  if (Date>tFaseInicio.Value) or (Date>tFaseTermino.Value) then
    tFaseIconIndex.Value := sfAtrasada;
end;

procedure TDM.AbreDB;
begin
  tAuxFase.Open;
  tTec.Open;
  tParametro.Open;
  tAuxSD.Open;
  tLog.Open;
  tFer.Open;
  
  if tParametro.RecordCount=0 then begin
    tParametro.Insert;
    tParametroMaxDiasDown.Value := 99;
    tParametroMaxDiasUpload.Value := 99;
    tParametroDataDown.Value := Date;
    tParametro.Post;
  end;
  
  tAuxCli.Open;
  qCli.Open;
  tProj.Open;
  tOSFaseDesc.Open;
  tFase.Open;
  tFaseTec.Open;
  tOS.Open;
  tAponta.Open;
  tAmarraFase.Open;
  tOSItens.Open;
  tNovaOS.Open;
  tNovoAponta.Open;
  tMotivo.Open;
  tAuxProj.Open;
  tTipoHora.Open;
  tOcorrencia.Open;
  tSolicita.Open;
  tSolicitaDesc.Open;
  tAuxSol.Open;
  tAuxRAOS.Open;
  tRA.Open;
  tRAOS.Open;
  tRAItem.Open;
  tDesp.Open;
  tAuxDesc.Open;
  mtDescr.Open;
end;

procedure TDM.FechaDB;
begin
  mtDescr.Close;
  tAuxDesc.Close;
  tParametro.Close;
  tAuxCli.Close;
  qCli.Close;
  tTec.Close;
  tFer.Close;
  tLog.Close;
  tProj.Close;
  tFase.Close;
  tFaseTec.Close;
  tOS.Close;
  tAponta.Close;
  tAmarraFase.Close;
  tOSItens.Close;
  tNovaOS.Close;
  tNovoAponta.Close;
  tMotivo.Close;
  tAuxProj.Close;
  tAuxFase.Close;
  tOSFaseDesc.Close;
  tTipoHora.Close;
  tOcorrencia.Close;
  tSolicita.Close;
  tSolicitaDesc.Close;
  tAuxSol.Close;
  tAuxSD.Close;
  tRAItem.Close;
  tRaOS.Close;
  tRA.Close;
  tDesp.Close;
  tAuxRAOS.Close;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  if (Length(Path)>0) and (Path[Length(Path)]<>'\') then
    Path := Path + '\';
  nxSession.Active := True;

  Try
     TempPath := LmdSysInfo1.TempPath + 'DiaTec\';
       
     if Copy(Path, 1, 2) <> 'A:' then
       TempPath := Path+'Tabelas\';

     if not DirectoryExists(TempPath) then MkDir(TempPath);  
     if not DirectoryExists(Path+'Tabelas') then MkDir(Path+'Tabelas');

     nxDB.AliasPath := Path+'Tabelas';
     DBDown.AliasPath := TempPath;
     nxdb.Connected := True;
     
  Except
     Exit;
  End;
end;

procedure TDM.ExcluiOSServ;
begin
  if tOS.RecordCount = 0 then Exit;
  nxdb.StartTransaction;
  try
    tOSItens.First;
    while not tOSItens.Eof do begin
      tOSItens.Edit;
      tOSItensApagar.Value := 'S';
      tOSItensSync.Value := True;
      tAuxDesc.First;
      while not tAuxDesc.Eof do begin
        tAuxDesc.Edit;
        tAuxDescApagar.Value := 'S';
        tAuxDescSync.Value := True;
        tAuxDesc.Post;
        tAuxDesc.Next;
      end;
      tOSItens.Post;
      tOSItens.Next;
    end;
{    Q.SQL.Clear;
    Q.SQL.Add('update OSFase set Apagar = ' + QuotedStr('S') + ', Sync = True ');
    Q.SQL.Add(
      Format(' where (cliente = %s) and (tecnico = %s) and (data = %s) and (OS = %d)',
      [QuotedStr(tOSCliente.Value), 
       QuotedStr(tOSTecnico.Value),
       QuotedStr(tOSData.AsString),
       tOSID.Value]));
    Q.ExecSQL;
    Q.SQL.Clear;
    Q.SQL.Add('update OSFaseDesc set Apagar = ' + QuotedStr('S')+', Sync = True');
    Q.SQL.Add(
      Format(' where (cliente = %s) and (projeto = %s) and (fase = %s) and (tecnico = %s) and (item = %d)',
      [QuotedStr(tOSCliente.Value),
       QuotedStr(tOSProjeto.Value),
       QuotedStr(tOSFase.Value), 
       QuotedStr(tOSTecnico.Value),
       QuotedStr(tOSData.AsString),
       tOSID.Value]));
    
    Q.ExecSQL;   }
    tOS.Edit;
    tOSApagar.AsString := 'S';
    tOS.Post;
    nxdb.Commit;
  except
    tOS.Cancel;
    nxdb.RollBack;
    Raise;
  end;
end;

procedure TDM.tProjAfterScroll(DataSet: TDataSet);
begin
  if not Inicializando then 
    FrmPri.cmProjeto.Text := tProjNome.Value;
end;

procedure TDM.tAuxCliAfterScroll(DataSet: TDataSet);
begin
  if Inicializando then Exit;
  if Sincronizando then Exit;
  FrmPri.cmCliente.Text := qCliNome.Value;
end;

procedure TDM.tDespAfterInsert(DataSet: TDataSet);
begin
  tDespCliente.Value := qCliID.Value;
  tDespTecnico.Value := IDTecnico;
  tDespSync.Value    := True;
end;

procedure TDM.tDespBeforePost(DataSet: TDataSet);
begin
  tDespSync.Value := True;
end;

procedure TDM.tDespCalcFields(DataSet: TDataSet);
begin
  tDespChaveU.Value := tDespTecnico.Value + 
                       tDespCliente.Value + 
                       tDespID.AsString;
  if (tDespNumF.Value > 0) and (tDespStatusTec.Value in [sfratAprovado, sfratAprovDiverg]) then begin
    if tDespValorCli.Value > 0.01 then
      tDespCusteadoPor.Value := 2
    else
      tDespCusteadoPor.Value := 1;  
  end else
    tDespCusteadoPor.Value := 0;
end;

procedure TDM.tFaseBeforePost(DataSet: TDataSet);
begin
  if Sincronizando then Exit;
  tFaseSync.Value := True;
end;

procedure TDM.tApontaBeforePost(DataSet: TDataSet);
begin
  if Sincronizando then Exit;
  if tAponta.State in [dsInsert] then
    tApontaItem.Value := NovoItemAponta(tApontaCliente.Value,
                                        tApontaProjeto.Value,
                                        tApontaFase.Value);
  tApontaSync.Value := True;
end;

procedure TDM.tOSBeforePost(DataSet: TDataSet);
begin
  if Sincronizando then Exit;
  tOSID.Value := StrToInt(FormatDateTime('hhmm', tOSInicio.Value));
  if FormatDateTime('hh:mm', tOSAbono.Value ) = '00:00' then
    tOSMotivoAbon.Value := '';
  tOSSync.Value := True;
end;

procedure TDM.tOSAfterInsert(DataSet: TDataSet);
begin
  if Sincronizando then Exit;
  tOSLocal.Value     := '';
  tOSCliente.Value   := qCliID.Value;
  tOSData.Value      := Date;
  tOSTecnico.Value   := IDTecnico;
  tOSID.Value        := 0;
  tOSSync.Value      := True;
  tOSAbono.Value     := 0;
  tOSAssinou.Value   := qCliAssinou.Value;
  tOSAbono.Value     := qCliAbono.Value;
  tOSMotivoAbon.Value  := qCliMotAbono.Value;
  tOSVeicProp.Value := 'S';
  tOSTipoReemb.Value := '1';

  if tParametroAtivarIntervalo.Value then
    tOSObrigaInt.Value := 'S' else
    tOSObrigaInt.Value := 'N';
end;

procedure TDM.tOSItensBeforePost(DataSet: TDataSet);
begin
  if Sincronizando then Exit;
  tOSItensSync.Value := True;
end;

procedure TDM.tOSCalcFields(DataSet: TDataSet);
begin
  if Sincronizando then Exit;

  if tOSLocal.Value = 'C' then
    tOSNomeLocal.Value := 'Cliente' 
  else
  if tOSLocal.Value='M' then
    tOSNomeLocal.Value := 'Totvs IP'
  else
    tOSNomeLocal.Value := '';
    

  tOSUniqueID.Value := ZeroPad(tOSCliente.Value,6) +
                       tOSProjeto.Value +
                       FormatDateTime('yyyymmdd', tOSData.AsDateTime) +
                       ZeroPad(tOSID.AsString, 4);

  tOSChaveOS.Value  := ZeroPad(tOSCliente.Value,6) +
                       tOSTecnico.Value +
                       FormatDateTime('yyyymmdd', tOSData.AsDateTime) +
                       ZeroPad(tOSID.AsString, 4);

  tOSTotalHoras.Value := DifHoras(tOSInicio.Value, tOSTermino.Value);

  tOSTempoInt.Value := DifHoras(tOSIInt.Value, tOSFInt.Value);

  if tOSTotalHoras.Value >= tOSAbono.Value then
    tOSTotalHoras.Value := tOSTotalHoras.Value - tOSAbono.Value
  else
    tOSTotalHoras.Value := 0;

  tOSTotalFinal.Value := tOSTotalHoras.Value + tOSTranslado.Value;
  tOSCodNomeCli.Value := tOSCliente.Value + '-' + tOSNomeCliente.Value;
  tOSCodNomeTec.Value := tOSTecnico.Value + '-' + tOSNomeTecnico.Value;
  tOSProjCodNome.Value := tOSProjeto.Value + '-' + tOSProjNome.Value; 
end;

procedure TDM.tApontaBeforeDelete(DataSet: TDataSet);
begin
  if Sincronizando then Exit;
  tFase.Edit;
  tFaseHorasReal.Value :=
    tFaseHorasReal.Value -
    DateTimeToHoras(tApontaHoras.Value);
  if (tFaseStatus.Value = 'I') and (tFaseHorasReal.Value < 0.01) then
  begin
    tFaseStatus.Value := '';
    tFaseDatReI.AsVariant := null;
  end;
  tFase.Post;
end;

function DifHoras(I, T: TDateTime): TDateTime;
begin
  if T < I then
    Result := (T+1) - I
  else
    Result := T-I  
end;

procedure TDM.tApontaCalcFields(DataSet: TDataSet);
begin
  tApontaDescricao.Value :=
    CalcDesc(tApontaCliente.Value,
             tApontaProjeto.Value,
             tApontaFase.Value,
             tApontaTecnico.Value,
             tApontaItem.Value);
  tApontaKeyField.Value := tApontaCliente.Value+tApontaProjeto.Value+tApontaFase.Value+tApontaTecnico.Value+tApontaItem.AsString;
end;

procedure TDM.tOSItensCalcFields(DataSet: TDataSet);
var S: String;
begin
  tOSItensChaveU.Value :=
     tOSItensCliente.Value +
     tOSItensProjeto.Value +
     tOSItensFase.Value +
     tOSItensTecnico.Value +
     tOSItensItem.AsString;
     
  tOSItensCodNomeFase.Value :=
     tOSItensFase.Value + '-' +
     tOSItensNomeFase.Value;
     
  S := CalcDesc(tOSItensCliente.Value,
             tOSItensProjeto.Value,
             tOSItensFase.Value,
             tOSItensTecnico.Value,
             tOSItensItem.Value);
             
  tOSItensDescricao.Value := S;
end;

procedure TDM.tSolicitaCalcFields(DataSet: TDataSet);
begin
  if Sincronizando then Exit;

  tSolicitaChave.Value := 
    'C'+ Trim(tSolicitaCliente.Value) + '*' +
    Trim(tSolicitaProjeto.Value) + '*' + 
    Trim(tSolicitaTecnico.Value) + '*' +
    FormatDateTime('yyyyymmdd', tSolicitaData.Value) + '*' +
    tSolicitaItem.AsString;

  tSolicitaDescricao.Value := CalcMemoSol('E');
  tSolicitaRetorno.Value := CalcMemoSol('R');

  with tSolicitaNomeTipo do
  if tSolicitaTipo.Value = 'CF' then
    Value := 'Criação de Fase'
  else
  if tSolicitaTipo.Value = 'EF' then
    Value := 'Eliminação de Fase'
  else
  if tSolicitaTipo.Value = 'SR' then
    Value := 'Solicitação de Reunião de Acompanhamento'
  else
  if tSolicitaTipo.Value = 'ST' then
    Value := 'Solicitação de Auxílio Técnico'
  else  
  if tSolicitaTipo.Value = 'IG' then
    Value := 'Notificação/Informação Genérica'      
  else
    Value := tSolicitaTipo.Value;  

  if tSolicitaOrigem.Value = 'C' then
    tSolicitaNomeOrigem.Value := 'Cliente'
  else
    tSolicitaNomeOrigem.Value := 'Técnico';
end;

procedure TDM.tSolicitaBeforePost(DataSet: TDataSet);
begin
  if tSolicita.State=dsInsert then
    tSolicitaItem.Value := NovoItemSol(tSolicitaData.Value);
    
  tSolicitaSync.Value := True;
end;

procedure TDM.tSolicitaDescBeforePost(DataSet: TDataSet);
begin
  tSolicitaDescSync.Value := True;
end;

procedure TDM.tSolicitaAfterInsert(DataSet: TDataSet);
begin
  tSolicitaProjeto.Value := tProjID.Value;
  tSolicitaCliente.Value := tProjCliente.Value;
  tSolicitaTecnico.Value := IDTecnico;
  tSolicitaData.Value    := Date;
  tSolicitaOrigem.Value  := 'T';
  tSolicitaTipo.Value    := 'IG';
end;

procedure TDM.ApagaCGP;
begin
  if tSolicita.RecordCount=0 then Exit;
  nxdb.StartTransaction;
  try
    while not tSolicitaDesc.Eof do tSolicitaDesc.Delete;
    tSolicita.Delete;
    nxdb.Commit;
  except
    nxdb.Rollback;
    Raise;
  end;
end;

procedure TDM.tLogCalcFields(DataSet: TDataSet);
begin
  case tLogOper.Value of
    iolUpload     : tLogNomeOper.Value := 'Upload';
    iolDownload   : tLogNomeOper.Value := 'Download';
    iolImportacao : tLogNomeOper.Value := 'Importação';
    iolExportacao : tLogNomeOper.Value := 'Exportação';
    iolImpUpload  : tLogNomeOper.Value := 'Imp. Upload';
  else
    tLogNomeOper.Value := tLogOper.AsString;
  end;    
end;

procedure TDM.SomaHR(Forcar: Boolean);

procedure SomaFasePai(Fase: String; Horas: Double);
var 
  FP: String;
begin
  if mtHR.FindKey([Fase]) then
    mtHR.Edit
  else begin
    mtHR.Insert;
    mtHRID.Value := Fase;
    mtHRHoras.Value := 0;
  end;
  mtHRHoras.Value := mtHRHoras.Value + Horas;
  mtHR.Post;
  if tAuxFase.FindKey([tProjCliente.Value, tProjID.Value, Fase]) and
     (Trim(tAuxFase.FieldByName('FasePai').AsString)>'') then begin
    FP := Trim(tAuxFase.FieldByName('FasePai').AsString);
    if SameText(FP, Fase) then begin
      while (FP>'') and (FP[Length(FP)]<>'.') do Delete(FP, Length(FP), 1);
      if FP>'' then Delete(FP, Length(FP), 1);
//      ShowMessage(tAuxFase.FieldByName('FasePai').AsString+'=='+FP);
    end;
    SomaFasePai(FP, Horas);
  end;
end;

begin
  if (UProjSoma=tProjID.Value) and (not Forcar) then Exit;
  mtHR.Active := False;
  mtHR.Active := True;
  UProjSoma := tProjID.Value;
  tFase.DisableControls;
  SomandoHR := True;
  tFase.Active := True;
  try
    tFase.First;
    while not tFase.Eof do begin
      if (tFaseHorasReal.Value > 0.009) and (tFaseFasePai.Value>'') then
        SomaFasePai(tFaseFasePai.Value, tFaseHorasReal.Value);
      tFase.Next;
    end;
  finally
    SomandoHR := False;
    tFase.EnableControls;
  end;  
  tFase.Refresh;
end;

procedure TDM.NovoStatusPai(aFasePai: String; aStatus: String);
var
  T : TnxTable;
begin
  T := TnxTable.Create(nil);
  try
    T.Session := nxSession;
    T.Database := nxDB;
    T.TableName := 'Fase';
    T.IndexName := 'IFasePai';
    T.Open; 
    T.SetRange([tProjCliente.Value, tProjID.Value, aFasePai], 
               [tProjCliente.Value, tProjID.Value, aFasePai]);
    T.First;
    while not T.Eof do begin
      if T.FieldByName('Status').AsString <> aStatus then begin
        T.Edit;
        T.FieldByName('Status').AsString := aStatus;
        T.FieldByName('Sync').AsBoolean := True;
        T.Post;
      end;  
      if T.FieldByName('Sumario').AsBoolean then
        NovoStatusPai(T.FieldByName('ID').AsString, aStatus);
      T.Next;
    end;           
  finally
    T.Active := False;
    T.Free;
  end;    
end;

function TDM.GetVer: String;
var S: String;
begin
  S := GetVersionInfo;
  Result := 'Versão ' + Copy(S, 1, 5) + ' Build ' + Copy(S, 7, 10);
end;

procedure TDM.tRACalcFields(DataSet: TDataSet);
begin
  tRAChaveU.Value := tRATecnico.Value + 
                     tRACliente.Value +
                     FormatDateTime('yyyymmdd', tRADataI.Value) +
                     FormatDateTime('yyyymmdd', tRADataF.Value);
end;

procedure TDM.tRAOSCalcFields(DataSet: TDataSet);
begin
  tRAOSChaveU.Value := tRAOSTecnico.Value + 
                       tRAOSCliente.Value + 
                       tRAOSIDRA.AsString +
                       FormatDateTime('yyyymmdd', tRAOSDataOS.Value) +
                       tRAOSIDOS.AsString;

  tRAOSChaveOS.Value := tRAOSCliente.Value + 
                        tRAOSTecnico.Value +
                        FormatDateTime('yyyymmdd', tRAOSDataOS.Value) +
                        tRAOSIDOS.AsString;
end;

procedure TDM.tRAItemCalcFields(DataSet: TDataSet);
begin
  tRAItemChaveU.Value := tRAItemTecnico.Value + 
                         tRAItemCliente.Value + 
                         tRAItemID.AsString;
  if (tRAItemNumF.Value > 0) and (tRAItemStatusTec.Value in [sfratAprovado, sfratAprovDiverg]) then begin
    if tRAItemValorCli.Value > 0.01 then
      tRAItemCusteadoPor.Value := 2
    else
      tRAItemCusteadoPor.Value := 1;  
  end else
    tRAItemCusteadoPor.Value := 0;

  case tRAItemTipo.Value of
    tiraKM : tRAItemNomeTipo.Value := 'Kilometragem';
    tiraPedagio : tRAItemNomeTipo.Value := 'Pedágio';
    tiraRefeicao : tRAItemNomeTipo.Value := 'Alimentação';
    tiraHospedagem : tRAItemNomeTipo.Value := 'Hospedagem';
  else
    tRAItemNomeTipo.Value := 'Outros';  
  end; 

  if tRAItemTipo.Value=tiraKM then
    tRAItemValorStr.Value := IntToStr(Trunc(tRAItemValor.Value)) + 'KM (1)'
  else
    tRAItemValorStr.Value := FloatToStrF(tRAItemValor.Value, ffCurrency, 15, 2);
end;

function TDM.ObtemValorRADef(aTipo: Integer): Double;
begin
  case aTipo of
    tiraKM         : Result := qCliKM.Value;
    tiraPedagio    : Result := qCliVlPedag.Value;
    tiraRefeicao   : Result := tParametroVlAlim.Value;
    tiraHospedagem : Result := tParametroVlHosp.Value;
  else
    Result := 0;
  end;
end;

function TDM.ProxIDItem: Integer;
begin
  tDesp.IndexName := 'IID';
  tDesp.SetRange([IDTecnico, qCliID.Value], [IDTecnico, qCLIID.Value]);
  tDesp.Filter := '';
  tDesp.Filtered := False;
  try
    tDesp.Last;
    if (tDesp.Eof and tDesp.Bof) then 
      Result := 1
    else  
      Result := tDespID.AsInteger + 1;
  finally
    tDesp.CancelRange;
    tDesp.Filter := '(ExcluirServ <> True)';
    tDesp.Filtered := True;
  end;
end;

function TDM.ProxIDRA: Integer;
begin
  tAuxRA.Active := True;
  tAuxRA.SetRange([IDTecnico, qCliID.Value], [IDTecnico, qCliID.Value]);
  try
    if not (tAuxRA.Eof and tAuxRA.Bof) then begin
      tAuxRA.Last;
      Result := tAuxRA.FieldByName('ID').AsInteger + 1;
    end else
      Result := 1;
  finally
    tAuxRA.CancelRange;
  end;
end;

procedure TDM.tRAAfterInsert(DataSet: TDataSet);
var Cnt: Integer;
begin
  tRACliente.Value   := qCliID.Value;
  tRATecnico.Value   := IDTecnico;
  tRASync.Value := True;
end;

procedure TDM.tRAOSAfterInsert(DataSet: TDataSet);
begin
  tRAOSCliente.Value   := qCliID.Value;
  tRAOSTecnico.Value   := IDTecnico;
  tRAOSIDRA.Value      := tRAID.Value;
  tRAOSSync.Value := True;
end;

procedure TDM.tRABeforePost(DataSet: TDataSet);
begin
  tRASync.Value := True;
end;

procedure TDM.tRAOSBeforePost(DataSet: TDataSet);
begin
  tRAOSSync.Value := True;
end;

procedure TDM.tRAItemBeforePost(DataSet: TDataSet);
begin
  tRAItemSync.Value := True;
end;

end.
