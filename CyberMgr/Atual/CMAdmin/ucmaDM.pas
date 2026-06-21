unit ucmaDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, nxdb, nxllConst, nxllTypes, nxdbBase, kbmMemTable, LMDCustomComponent,
  LMDOneInstance, 
  cmClassesBase, 
  cmServRemoto,
  cmListaID,
  cmIDRecursos,
  dxBar,
  cxVGrid,
  cxDBVGrid,
  cxGrid,
  cmCompCliente, ExtCtrls, nxsdServerEngine, nxreRemoteServerEngine,
  nxllComponent, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxCurrencyEdit,
  cxCalendar, cxMaskEdit, cxTextEdit, cxDBLookupComboBox,
  cxGridCustomTableView, 
  cxGridTableView, 
  cxGridDBTableView, 
  cxGridDBCardView,
  cxGridCardView,
  cxClasses,
  cxControls, cxGridCustomView, nxcCliente, LMDIniCtrl;

type

  TInfoCor = object
    icCorFundo : TColor;
    icCorFonte : TColor;
    icNegrito  : Boolean;
    procedure Limpa;
    procedure LeStr(S: String);
    function GetStr: String;
  end;

  TInfoModulo = object
    imID        : Byte;
    imPos       : Byte;
    imVisivel   : Boolean;
    imMostratab : Boolean;
    procedure Limpa;
    procedure LeStr(S: String);
    function GetStr: String;
  end;


  TDados = class(TDataModule)
    tbCli: TnxTable;
    dsCli: TDataSource;
    tbPro: TnxTable;
    dsPro: TDataSource;
    tbCat: TnxTable;
    dsCat: TDataSource;
    dsME: TDataSource;
    tbTran: TnxTable;
    tbProCodigo: TStringField;
    tbProUnid: TStringField;
    tbProPreco: TCurrencyField;
    tbProObs: TMemoField;
    tbProImagem: TGraphicField;
    tbMovEst: TnxTable;
    dsItensME: TDataSource;
    Session: TnxSession;
    db: TnxDatabase;
    tbProxCategoria: TStringField;
    tbConfig: TnxTable;
    dsConfig: TDataSource;
    SoUmProg: TLMDOneInstance;
    tAuxMovEst: TnxTable;
    tAuxMovEstSaldo: TFloatField;
    tAuxMovEstFatorSaldo: TIntegerField;
    tbProEstoqueAtual: TFloatField;
    tbProCustoUnitario: TCurrencyField;
    RSE: TnxRemoteServerEngine;
    tbProEstoqueACE: TFloatField;
    tbProEstoqueACS: TFloatField;
    tbProEstoqueFinal: TFloatField;
    mtUsuario: TkbmMemTable;
    dsUsuario: TDataSource;
    mtUsuarioUsername: TStringField;
    mtUsuarioNome: TStringField;
    mtUsuarioAdmin: TBooleanField;
    mtUsuarioSenha: TStringField;
    mtUsuarioGrupos: TMemoField;
    mtUsuarioDireitos: TMemoField;
    mtUsuarioNumClientes: TIntegerField;
    tbLayout: TnxTable;
    dsLayout: TDataSource;
    tbLayoutUsuario: TStringField;
    tbLayoutGrid: TStringField;
    tbLayoutNome: TStringField;
    tbLayoutPublico: TBooleanField;
    tbLayoutLayout: TBlobField;
    tbLayoutFiltro: TBlobField;
    tbLayoutUsuarios: TMemoField;
    ServRem: TCMServidorRemoto;
    CM: TClienteCyberMgr;
    mtMaquina: TkbmMemTable;
    mtMaquinaNumero: TIntegerField;
    mtMaquinaNome: TStringField;
    mtMaquinaInicio: TDateTimeField;
    mtMaquinaContato: TIntegerField;
    mtMaquinaNomeContato: TStringField;
    mtMaquinaInicioTicks: TIntegerField;
    mtMaquinaAcesso: TIntegerField;
    dsMaquina: TDataSource;
    mtMaquinaCliente: TIntegerField;
    mtMaquinaConectado: TBooleanField;
    tbPacote: TnxTable;
    dsPacote: TDataSource;
    tbPacoteHoras: TSmallintField;
    tbPacoteValorTotal: TCurrencyField;
    tbCaixa: TnxTable;
    mtMaquinaProgramaAtual: TStringField;
    mtMaquinaParado: TBooleanField;
    mtMaquinaLimiteTempo: TIntegerField;
    mtMaquinaLimiteTempoDT: TDateTimeField;
    mtMaquinaMenu: TMemoField;
    tbAcesso: TnxTable;
    dsCaixa: TDataSource;
    tbPacoteDescr: TStringField;
    tbPacoteCodigo: TWordField;
    tbHoraCor: TnxTable;
    mtMaquinaTipoAcesso: TWordField;
    tbTipoAcesso: TnxTable;
    mtMaquinaNomeTipoAcesso: TStringField;
    mtMaquinaMostrar: TStringField;
    mtMaquinaSinal: TCurrencyField;
    mtMaquinaVendas: TFloatField;
    tbSinal: TnxTable;
    mtMaquinaTotalFinal: TCurrencyField;
    mtMaquinaObsAcesso: TStringField;
    tbHoraCorTipoAcesso: TWordField;
    tbHoraCorDia: TWordField;
    tbHoraCorHora: TWordField;
    tbHoraCorCor: TIntegerField;
    tbCor: TnxTable;
    mtMaquinaLiberaAlemPacote: TBooleanField;
    tbCorTipoAcesso: TWordField;
    tbCorCor: TIntegerField;
    tbCorCorFonte: TIntegerField;
    tbCorDescricao: TStringField;
    tbCorReinicia: TBooleanField;
    tbEtapas: TnxTable;
    tbEtapasTipoAcesso: TWordField;
    tbEtapasCor: TIntegerField;
    tbEtapasPos: TWordField;
    tbEtapasTempo: TDateTimeField;
    tbEtapasTolerancia: TDateTimeField;
    tbEtapasValor: TCurrencyField;
    tbEtapasValorMin: TCurrencyField;
    mtMaquinaComputerName: TStringField;
    tbTipoAcessoCodigo: TWordField;
    tbTipoAcessoNome: TStringField;
    dsTipoAcesso: TDataSource;
    tbConfigNomeProdImp: TStringField;
    tbConfigNumSeq: TAutoIncField;
    tbConfigModulos: TMemoField;
    tbConfigTiposLancExtra: TMemoField;
    tbConfigProgramasPermitidos: TMemoField;
    tbConfigJanelasExplorer: TMemoField;
    tbConfigFecharProgramas: TBooleanField;
    tbConfigAutoExecutar: TStringField;
    tbConfigLimiteTempoPadrao: TDateTimeField;
    tbConfigPacoteTempoReal: TBooleanField;
    tbConfigPermiteLoginSemCred: TBooleanField;
    tbConfigProdutoImpressao: TStringField;
    tbConfigPermiteCapturaTela: TBooleanField;
    tbConfigAlertaFimTempo: TDateTimeField;
    tbConfigVariosTiposAcesso: TBooleanField;
    tbConfigModoPagtoAcesso: TWordField;
    mtMaquinaAguardaPagto: TBooleanField;
    Timer2: TTimer;
    tbConfigMostraPrePagoDec: TBooleanField;
    tbConfigTempoMaxAlerta: TDateTimeField;
    tbConfigMostraCliCadAntesAvulso: TBooleanField;
    mtMaquinaCaixa: TIntegerField;
    mtMaquinaUsuarioI: TStringField;
    tbConfigAbre1: TDateTimeField;
    tbConfigAbre2: TDateTimeField;
    tbConfigAbre3: TDateTimeField;
    tbConfigAbre4: TDateTimeField;
    tbConfigAbre5: TDateTimeField;
    tbConfigAbre6: TDateTimeField;
    tbConfigAbre7: TDateTimeField;
    tbConfigFecha1: TDateTimeField;
    tbConfigFecha2: TDateTimeField;
    tbConfigFecha3: TDateTimeField;
    tbConfigFecha4: TDateTimeField;
    tbConfigFecha5: TDateTimeField;
    tbConfigFecha6: TDateTimeField;
    tbConfigFecha7: TDateTimeField;
    tbConfigCorLivre: TIntegerField;
    tbConfigCorFLivre: TIntegerField;
    tbConfigCorUsoPrePago: TIntegerField;
    tbConfigCorFUsoPrePago: TIntegerField;
    tbConfigCorUsoPosPago: TIntegerField;
    tbConfigCorFUsoPosPago: TIntegerField;
    tbConfigCorAguardaPagto: TIntegerField;
    tbConfigCorFAguardaPagto: TIntegerField;
    tbConfigCorManutencao: TIntegerField;
    tbConfigCorFManutencao: TIntegerField;
    tbConfigCorPausado: TIntegerField;
    tbConfigCorFPausado: TIntegerField;
    nxTCPIP: TnxWinsockTransport;
    tbTranNumero: TAutoIncField;
    tbTranCaixaI: TIntegerField;
    tbTranCaixaF: TIntegerField;
    tbTranCaixaP: TIntegerField;
    tbTranTipoAcesso: TWordField;
    tbTranInicio: TDateTimeField;
    tbTranFim: TDateTimeField;
    tbTranDataPagto: TDateTimeField;
    tbTranContato: TIntegerField;
    tbTranNome: TStringField;
    tbTranMaquina: TWordField;
    tbTranTipo: TWordField;
    tbTranFuncI: TStringField;
    tbTranFuncF: TStringField;
    tbTranTempo: TDateTimeField;
    tbTranTempoCobrado: TDateTimeField;
    tbTranCredUsado: TIntegerField;
    tbTranCredAnterior: TIntegerField;
    tbTranDesconto: TCurrencyField;
    tbTranProdutos: TCurrencyField;
    tbTranValor: TCurrencyField;
    tbTranObs: TMemoField;
    tbTranIsento: TBooleanField;
    tbTranNaoUsarPacote: TBooleanField;
    tbTranCodPacote: TWordField;
    tbTranSinal: TCurrencyField;
    tbTranTransacaoVinculada: TIntegerField;
    tbTranValorFinalAcesso: TCurrencyField;
    tbTranDescontoProduto: TCurrencyField;
    tbTranNumDoc: TStringField;
    tbMovEstNumSeq: TAutoIncField;
    tbMovEstTransacao: TIntegerField;
    tbMovEstProduto: TStringField;
    tbMovEstQuant: TFloatField;
    tbMovEstUnitario: TCurrencyField;
    tbMovEstTotal: TCurrencyField;
    tbMovEstItem: TWordField;
    tbMovEstDesconto: TCurrencyField;
    tbMovEstDataMov: TDateTimeField;
    tbMovEstDataPag: TDateTimeField;
    tbMovEstEntrada: TBooleanField;
    tbMovEstCancelado: TBooleanField;
    tbMovEstEstoqueAnt: TFloatField;
    tbMovEstTipoTran: TWordField;
    tbMovEstContato: TIntegerField;
    tbMovEstCaixaMov: TIntegerField;
    tbMovEstCaixaPag: TIntegerField;
    tbMovEstCategoria: TStringField;
    tAuxMovEstNumSeq: TAutoIncField;
    tAuxMovEstTransacao: TIntegerField;
    tAuxMovEstProduto: TStringField;
    tAuxMovEstQuant: TFloatField;
    tAuxMovEstUnitario: TCurrencyField;
    tAuxMovEstTotal: TCurrencyField;
    tAuxMovEstItem: TWordField;
    tAuxMovEstDesconto: TCurrencyField;
    tAuxMovEstDataMov: TDateTimeField;
    tAuxMovEstDataPag: TDateTimeField;
    tAuxMovEstEntrada: TBooleanField;
    tAuxMovEstCancelado: TBooleanField;
    tAuxMovEstEstoqueAnt: TFloatField;
    tAuxMovEstTipoTran: TWordField;
    tAuxMovEstContato: TIntegerField;
    tAuxMovEstCaixaMov: TIntegerField;
    tAuxMovEstCaixaPag: TIntegerField;
    tAuxMovEstCategoria: TStringField;
    tbTranStatusPagto: TWordField;
    mtMaquinaTipoTran: TIntegerField;
    mtMaquinaManutencao: TBooleanField;
    tbCaixaNumero: TAutoIncField;
    tbCaixaAberto: TBooleanField;
    tbCaixaUsuario: TStringField;
    tbCaixaAbertura: TDateTimeField;
    tbCaixaFechamento: TDateTimeField;
    tbCaixaAcesso: TCurrencyField;
    tbCaixaAcessoNaoPago: TCurrencyField;
    tbCaixaAcessoDebPago: TCurrencyField;
    tbCaixaAcessoQuant: TCurrencyField;
    tbCaixaVenda: TCurrencyField;
    tbCaixaVendaNaoPago: TCurrencyField;
    tbCaixaVendaDebPago: TCurrencyField;
    tbCaixaVendaQuant: TCurrencyField;
    tbCaixaSuprimento: TCurrencyField;
    tbCaixaSangria: TCurrencyField;
    tbCaixaSaldoAnt: TCurrencyField;
    tbCaixaDescontos: TCurrencyField;
    tbCaixaTempoAcesso: TFloatField;
    tbCaixaTempoManutencao: TFloatField;
    tbCaixaSaldoFinal: TCurrencyField;
    tbCaixaTotal: TCurrencyField;
    tbCliCodigo: TAutoIncField;
    tbCliNome: TStringField;
    tbCliEndereco: TStringField;
    tbCliBairro: TStringField;
    tbCliCidade: TStringField;
    tbCliUF: TStringField;
    tbCliCEP: TStringField;
    tbCliNasc: TDateTimeField;
    tbCliSexo: TStringField;
    tbCliObs: TMemoField;
    tbCliCpf: TStringField;
    tbCliRg: TStringField;
    tbCliTelefone: TStringField;
    tbCliEmail: TMemoField;
    tbCliCreditoM: TIntegerField;
    tbCliTempoTotal: TIntegerField;
    tbCliTempoInicial: TIntegerField;
    tbCliIsento: TBooleanField;
    tbCliUsername: TStringField;
    tbCliSenha: TStringField;
    tbCliUltVisita: TDateTimeField;
    tbCliDebito: TCurrencyField;
    tbCliEscola: TStringField;
    tbCliNickName: TStringField;
    tbCliDataNasc: TDateTimeField;
    tbCliCelular: TStringField;
    tbCliTemDebito: TBooleanField;
    Q: TnxQuery;
    tbCaixaObs: TMemoField;
    tbTipoPass: TnxTable;
    tbPass: TnxTable;
    tbConfigCampoLocalizaCli: TWordField;
    tbConfigCMGuard: TMemoField;
    tbConfigManterSaldoCaixa: TBooleanField;
    tbConfigNaoMostrarMsgDebito: TBooleanField;
    dsTipoPass: TDataSource;
    tbTipoPassCodigo: TAutoIncField;
    tbTipoPassNome: TStringField;
    tbTipoPassValor: TCurrencyField;
    tbTipoPassTipoAcesso: TIntegerField;
    tbTipoPassTipoExp: TWordField;
    tbTipoPassExpirarEm: TDateTimeField;
    tbTipoPassMaxSegundos: TIntegerField;
    tbTipoPassObs: TMemoField;
    tbTipoPassDia1: TIntegerField;
    tbTipoPassDia2: TIntegerField;
    tbTipoPassDia3: TIntegerField;
    tbTipoPassDia4: TIntegerField;
    tbTipoPassDia5: TIntegerField;
    tbTipoPassDia6: TIntegerField;
    tbTipoPassDia7: TIntegerField;
    tbTipoPassMinutos: TIntegerField;
    tbHistPass: TnxTable;
    tbConfigEncerramentoPrePago: TWordField;
    tbConfigTolerancia: TDateTimeField;
    tbConfigPortaImpRec: TStringField;
    tbConfigSaltoImpRec: TWordField;
    tbConfigLargImpRec: TWordField;
    tbConfigCabecalhoImpRec: TMemoField;
    tbConfigRodapeImpRec: TMemoField;
    tbConfigImprimirImpRec: TBooleanField;
    tbCliTipoAcessoPref: TIntegerField;
    tbConfigRegImp98: TBooleanField;
    gvRep: TcxGridViewRepository;
    TVL: TcxGridDBTableView;
    TVLCodigo: TcxGridDBColumn;
    TVLNome: TcxGridDBColumn;
    TVLUsername: TcxGridDBColumn;
    TVLDebito: TcxGridDBColumn;
    tbConfigCorFDesktop: TIntegerField;
    tbConfigCorDesktop: TIntegerField;
    tbConfigMostraProgAtual: TBooleanField;
    tbConfigMostraObs: TBooleanField;
    tbConfigEscondeTextoBotoes: TBooleanField;
    tbProDescricao: TStringField;
    tbProCategoria: TStringField;
    tbCatDescricao: TStringField;
    tbMovEstCustoU: TCurrencyField;
    tbCliAlteradoEm: TDateTimeField;
    tbCliIncluidoPor: TStringField;
    tbCliAlteradoPor: TStringField;
    tbCliIncluidoEm: TDateTimeField;
    tbConfigExigirRG: TBooleanField;
    tbConfigDesativaRegAutImp: TBooleanField;
    tbCliPai: TStringField;
    tbCliMae: TStringField;
    tbCliEscolaHI: TDateTimeField;
    tbCliEscolaHF: TDateTimeField;
    tbCliInativo: TBooleanField;
    tbCliLimiteDebito: TCurrencyField;
    tbConfigLimitePadraoDebito: TCurrencyField;
    tbCliFoto: TGraphicField;
    tbConfigEscondeTipoAcesso: TBooleanField;
    tbProSubCateg: TStringField;
    tbProPodeAlterarPreco: TBooleanField;
    tbProNaoControlaEstoque: TBooleanField;
    tAuxMovEstNaoControlaEstoque: TBooleanField;
    mtUsuarioMaxMaqManut: TIntegerField;
    mtUsuarioMaxTempoManut: TIntegerField;
    tbConfigMostrarApenasPIN: TBooleanField;
    tbConfigTextoPIN: TStringField;
    tbConfigAlterarSenhaCli: TBooleanField;
    tbConfigVerSenhaCli: TBooleanField;
    tbChat: TnxTable;
    tbChatNumSeq: TAutoIncField;
    tbChatDe: TSmallintField;
    tbChatPara: TSmallintField;
    tbChatDataHora: TDateTimeField;
    tbChatTexto: TMemoField;
    tbChatDiz: TStringField;
    dsChat: TDataSource;
    tbChatMaq: TIntegerField;
    Reg: TLMDIniCtrl;
    mtTT: TkbmMemTable;
    mtTTDescr: TStringField;
    mtTTTipo: TSmallintField;
    mtTTCodigo: TIntegerField;
    dsTT: TDataSource;
    mtTTMinutos: TIntegerField;
    mtTTValor: TCurrencyField;
    mtTTTipoAcesso: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure FFTblMgrPause;
    procedure SoUmProgCustom(Sender: TObject);
    procedure CMAoDesativar(Sender: TObject);
    procedure tAuxMovEstCalcFields(DataSet: TDataSet);
    procedure tbProCalcFields(DataSet: TDataSet);
    procedure ffClientConnectionLost(aSource: TObject; aStarting: Boolean;
      var aRetry: Boolean);
    procedure CMAoAtualizarUsuario(Sender: TObject);
    procedure CMAoDestruirUsuario(Sender: TObject);
    procedure CMAoAtualizarMaquina(Sender: TObject);
    procedure CMAoDestruirMaquina(Sender: TObject);
    procedure mtMaquinaCalcFields(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure tbCaixaCalcFields(DataSet: TDataSet);
    procedure tbTipoPassCalcFields(DataSet: TDataSet);
    procedure CMAoAtualizarConfig(Sender: TObject);
    procedure tbChatCalcFields(DataSet: TDataSet);
    procedure CMAoReceberChat(Sender: TObject; MsgID, De, Para: Integer;
      DataHora: TDateTime; Texto: string);
    procedure SetUChat(const Value: Integer);   
  private
    { Private declarations }
    FUChat: Integer;
  public
    ListaAcessoFin : TStringList;
    procedure ApagarME(Transacao: Integer);
    procedure AbreDB;
    procedure FecharDB;
    function ControlaSaldo(aProduto: String): Boolean;
    function ReprocessaProd(Produto: String): Extended;
    { Public declarations }
    function ObtemSaldoAnterior(Produto: String;
                                Data: TDateTime; 
                                NumSeq: Integer): Extended;
    procedure AjustaSaldoPosterior(Produto: String;
                                   Data: TDateTime;
                                   NumSeq: Integer;
                                   Saldo: Extended);
    procedure AjustaEstoqueProduto(Produto: String; Custo: Double; Quant: Double);
    procedure AbrirFecharCaixa;
    procedure TotalizaDebCli(Cli: Integer);
    procedure RefreshTipoCred;
    function TotalCreditos: Integer;
    function TotalDebitos: Double;
    function LimiteDebito(F: TField): Double;

    procedure AjustaCampoLocalizaCli;

    property UChat: Integer
      read FUChat write SetUChat;
//    function ObtemAguardando: Double;
  end;

  function DateTimeToTempo(DT: TDateTime; Unid: String): Double;
  procedure GetInfoCor(Itens, Cores: TStrings; S: String; var IC: TInfoCor);
  
  procedure TransfDados(TF, TD: TDataset);
  procedure TransfDadosEsp(TF, TD: TDataset; ExceptFields: String);
  
  function Permitido(TipoAcesso: Integer): Boolean;

  function BarV(B: Boolean): TdxBarItemVisible;

  procedure PostInspectors(F: TForm);
  function PodeEditarTran(T: TDataset): Boolean;

  function ValorStr(E: Extended): String;
  function Pad(S: String; T: Integer): String;
  function LPad(S: String; T: Integer): String;
  function CharStr(C: Char; T: Integer): String;
  function TempoSt(S: String): String;
  

  procedure ChecaCaixa;
  
  
var
  Dados: TDados;
  NumAcessoPagto: Integer;
  MaisDeUm : Boolean = False;  
  ServidorRemoto : Boolean = False;
  Conectando: Boolean = False;
  
const
  DelimitaSt = #13#10;
  
  Fechando : Boolean = False;

var  
  DirUA : String;   // Direitos do usuário atual
  DiaAberto : TDateTime;
  NumAberto : Integer;

implementation

uses ucmaPri, ucmaFrmAcesso, ufmFormBase, ucmafbMaquinas;

{$R *.DFM}

function TempoSt(S: String): String;
begin
  if S>'' then begin
    S[3] :='h';
    S[6] :='m';
    S := S + 's';
    if Copy(S, 7, 2)='00' then
      S := Copy(S, 1, 6);
    if Copy(S, 4, 2)='00' then
      S := Copy(S, 1, 3) + Copy(S, 7, 3);
    if Copy(S, 1, 2)='00' then
      S := Copy(S, 4, 10);
    while (S>'') and (S[1]='0') do Delete(S, 1, 1);
  end;
  Result := S;
end;


procedure ChecaCaixa;
begin
  if NumAberto<1 then 
    Raise Exception.Create('O caixa está fechado');
end;  

function MasterParentName(C: TControl): String;
begin
  Result := '';
  while C.Parent<>nil do begin
    Result := C.Parent.Name;
    C := C.Parent;
  end;   
end;

function GridClassName(C: TControl; ALayout: String): String;
begin
  Result := C.Owner.Name;
  if ALayout<>'padrao' then
    Result := Result + '.' + MasterParentName(C);
end;

procedure LeLayout(AGrid: TcxGrid; ALayout: String);
var 
  M: TStream;
  GV : TcxCustomGridView;
begin
  if not Dados.tbLayout.Active then Exit;
  with Dados do 
  if tbLayout.FindKey([True, GridClassName(AGrid, ALayout), 'todos', ALayout]) then begin
    M := TMemoryStream.Create;
    try 
      tbLayoutLayout.SaveToStream(M);
      M.Position := 0;
      GV := AGrid.Views[0];
      GV.RestoreFromStream(M);
      if GV is TcxGridDBTableView then
        with TcxGridDBTableView(GV) do
          OptionsView.DataRowHeight := StrToIntDef(tbLayoutUsuarios.Value, OptionsView.DataRowHeight)
      else   
      if GV is TcxGridDBCardView then
        with TcxGridDBCardView(GV) do
          OptionsView.CaptionWidth := StrToIntDef(tbLayoutUsuarios.Value, OptionsView.CardWidth);
    finally
      M.Free;
    end;    
  end;
end;

procedure SalvaLayout(AGrid: TcxGrid; ALayout: String);
var 
  M: TStream;
  GV : TcxCustomGridView;
begin
  with Dados do begin
    if not tbLayout.Active then Exit;
  
    if tbLayout.FindKey([True, GridClassName(AGrid, ALayout), 'todos', ALayout]) then
      tbLayout.Edit
    else
      tbLayout.Insert;
      
    M := TMemoryStream.Create;
    try 
      GV := AGrid.Views[0];
      GV.StoreToStream(M);
      M.Position := 0;
      tbLayoutLayout.LoadFromStream(M);
      if GV is TcxGridDBTableView then
        tbLayoutUsuarios.Value := IntToStr(TcxGridDBTableView(GV).OptionsView.DataRowHeight)
      else   
      if GV is TcxGridDBCardView then
        tbLayoutUsuarios.Value := IntToStr(TcxGridDBCardView(GV).OptionsView.CardWidth);
      tbLayoutPublico.Value := True;
      tbLayoutGrid.Value := GridClassName(AGrid, ALayout);
      tbLayoutUsuario.Value := 'todos';
      tbLayoutNome.Value := ALayout;
      tbLayout.Post;
    finally
      M.Free;
    end;    
  end;
end;


function ValorStr(E: Extended): String;
begin
  Result := FloatToStrF(E, ffCurrency, 20, 2);
end;

function Pad(S: String; T: Integer): String;
begin
  Result := S;
  while Length(Result) < T do Result := Result + ' ';
end;

function LPad(S: String; T: Integer): String;
begin
  Result := S;
  while Length(Result) < T do Result := ' ' + Result;
end;

function CharStr(C: Char; T: Integer): String;
begin
  Result := '';
  while Length(Result) < T do Result := Result + C;
end;

function PodeEditarTran(T: TDataset): Boolean;
begin
  Result := (T.FieldByName('StatusPagto').AsInteger<=spAguardaPagto) or
            ((NumAberto>0) and
             (T.FieldByName('CaixaF').AsInteger=NumAberto) and
             (T.FieldByName('TransacaoVinculada').AsInteger=0));
end;


procedure PostInspectors(F: TForm);
var I : Integer;
begin
  for I := 0 to F.ComponentCount-1 do
    if F.Components[I] is TcxDBVerticalGrid then 
      TcxDBVerticalGrid(F.Components[I]).DataController.PostEditingData;
end;


function BarV(B: Boolean): TdxBarItemVisible;
begin
  if B then
    Result := ivAlways
  else
    Result := ivNever;  
end;

procedure TransfDadosEsp(TF, TD: TDataset; ExceptFields: String);
var 
  I : Integer;
  F : TField;
begin
  ExceptFields := UpperCase(ExceptFields);
  with TD do
  for I := 0 to pred(Fields.Count) do with Fields[I] do 
  if (FieldKind=fkData) and (Pos('|'+UpperCase(FieldName)+'|', ExceptFields)=0) then begin
    F := TF.FindField(FieldName);
    if (F <> nil) and (F.FieldKind=fkData) then 
    if (TD is TkbmMemTable) or (TD.State<>dsInsert) or (F.DataType<>ftAutoInc) then
      Value := F.Value;
  end;
end;

procedure TransfDados(TF, TD: TDataset);
begin
  TransfDadosEsp(TF, TD, '');
end;


function LeftPadCh(S: String; C: Char; T: Integer): String;
begin
  Result := S;
  while Length(Result) < T do Result := C + Result;
end;

procedure TInfoCor.Limpa;
begin
  icCorFundo := clWhite;
  icCorFonte := clBlack;
  icNegrito  := False;
end;
  
procedure TInfoCor.LeStr(S: String);
begin
  if Length(S) <> 31 then
    Limpa
  else begin
    icCorFundo := TColor(StrToIntDef(Trim(Copy(S, 1, 15)), Integer(clWhite)));
    icCorFonte := TColor(StrToIntDef(Trim(Copy(S, 16, 15)), Integer(clBlack)));
    icNegrito  := (S[31] = 'T')
  end;
end;

function TInfoCor.GetStr: String;
const
  TFStr : Array[Boolean] of Char = ('F', 'T');
begin
  Result := 
    Pad(IntToStr(Integer(icCorFundo)), 15) +
    Pad(IntToStr(Integer(icCorFonte)), 15) +
    TFStr[icNegrito];
end;

procedure GetInfoCor(Itens, Cores: TStrings; S: String; var IC: TInfoCor);
var I : Integer;
begin
  I := Itens.IndexOf(S);
  if I = -1 then I := 0;
  if (Cores.Count>I) then
    IC.LeStr(Cores[I])
  else
    IC.Limpa;  
end;

procedure TInfoModulo.Limpa;
begin
  imID        := 0;
  imPos       := 0;
  imVisivel   := True;
  imMostraTab := True;
end;
  
procedure TInfoModulo.LeStr(S: String);
begin
  if Length(S) <> 6 then
    Limpa
  else begin
    imID := StrToIntDef(Copy(S, 1, 2), 0);
    imPos := StrToIntDef(Copy(S, 3, 2), 0);
    imVisivel := (S[5]='T');
    imMostraTab := (S[6]='T');
  end;  
end;

function TInfoModulo.GetStr: String;
const
  TFStr : Array[Boolean] of Char = ('F', 'T');
begin
  Result := 
    Pad(IntToStr(imID), 2) + 
    Pad(IntToStr(imPos), 2) + 
    TFStr[imVisivel] +
    TFStr[imMostraTab];
end;

function DateTimeToTempo(DT: TDateTime; Unid: String): Double;
begin
  if Unid = 'Horas' then
    Result := Frac(DT) * 24
  else
  if Unid = 'Minutos' then
    Result := Frac(DT) * (24 * 60)
  else
  if Unid = 'Segundos' then
    Result := Frac(DT) * (24 * 60 * 60)
  else
    Result := 0;
end;

procedure TDados.ApagarME(Transacao: Integer);
const
  Fator : Array[Boolean] of Integer = (-1, 1);
var
  Produto: String;
  Data: TDateTime;
  NumSeq: Integer;
  SaldoAnt: Extended;
  Tipo : Integer;
  Mov : Extended;
begin
  tbTran.IndexName := 'INumero';
  if not tbTran.FindKey([Transacao]) then Exit;
  
  if (tbTranTipo.Value=ttEstVenda) and
     (tbTranCaixaP.Value>0) and
     (tbTranCaixaP.Value <> NumAberto) then
  begin
    Beep;
    ShowMessage('Impossível excluir uma transação de um caixa que já está fechado!');
    Exit;
  end;

  if MessageDlg('Confirma a exclusão ?', mtConfirmation, [mbyes, mbno],0) <> mryes then Exit;
                
  tbMovEst.IndexName := 'ITranItem';
  tbMovEst.SetRange([Transacao], [Transacao]);
  try
    DB.StartTransactionWith([tbMovEst, tbTran, tAuxMovEst]);
    try
      while not (tbMovEst.Eof and tbMovEst.Bof) do begin
        if (not tbMovEstCancelado.Value) then
        begin
          Produto := tbMovEstProduto.Value;
          Data := tbMovEstDataMov.Value;
          NumSeq := tbMovEstNumSeq.Value;
          SaldoAnt := tbMovEstEstoqueAnt.Value;
        end else
          Produto := '';

        if (not tbMovEstCancelado.Value) then begin
          Mov := Fator[tbMovEstEntrada.Value] * tbMovEstQuant.Value;
          AjustaEstoqueProduto(tbMovEstProduto.Value, 0, (-1 * Mov));
        end;

        tbMovEst.Delete;
        if Produto > '' then
          AjustaSaldoPosterior(Produto, Data, NumSeq, SaldoAnt);   
      end;
      tbTran.Delete;
      DB.Commit;
    except
      tbMovEst.Cancel;
      tbTran.Cancel;
      DB.Rollback;
      Raise;
    end;
  finally
    tbMovEst.CancelRange;
  end;
end;

procedure TDados.AbreDB;
var I : Integer;
begin
  nxTCPIP.Enabled := False;
  nxTCPIP.ServerName := ServRem.Host;
  nxTCPIP.Enabled := True;
  session.Active:= true;
  db.Connected:= true;
  tbCli.open;
  tbCat.open;
  tbPro.open;
  tbTipoPass.Open;
  tbPass.Open;
  tbTran.open;
  tbAcesso.Open;
  tbMovEst.open;
  tbConfig.Open;
  tbLayout.Open;
  tbPacote.Open;
  tbCaixa.Open;
  tbCor.Open;
  tbEtapas.Open;
  tbHoraCor.Open;
  tbSinal.Open;
  tbTipoAcesso.Open;
  tbHistPass.Open;
  tbChat.Open;

  if tbCaixa.FindKey([True]) then begin
    DiaAberto := tbCaixa.FieldByName('Abertura').AsDateTime;
    NumAberto := tbCaixa.FieldByName('Numero').AsInteger;
  end else begin
    DiaAberto := 0;
    NumAberto := -1;
  end;    

  tAuxMovEst.Open;

  mtUsuario.DisableControls;
  try
    mtUsuario.Active := True;
    mtUsuario.EmptyTable;
    CM.Usuarios.SalvaDataset(mtUsuario);
    mtUsuario.First;
  finally
    mtUsuario.EnableControls;
  end;

  mtMaquina.DisableControls;
  try
    mtMaquina.Active := True;
    mtMaquina.EmptyTable;
    CM.Maquinas.SalvaDataset(mtMaquina);
    mtMaquina.First;
  finally
    mtMaquina.EnableControls;
  end;

  if tbConfig.RecordCount > 0 then 
    tbConfig.First;
    
  AjustaCampoLocalizaCli;
end;

procedure TDados.DataModuleCreate(Sender: TObject);
var S: String;
begin
  S := ExtractFilePath(ParamStr(0))+'Ajuda';
  if not DirectoryExists(S) then
    mkDir(S);
    
  LeLayoutProc := @LeLayout;
  SalvaLayoutProc := @SalvaLayout;
  nxTCPIP.Enabled := False;
  nxTCPIP.Port := 16100;
  nxTCPIP.Enabled := True;
  ListaAcessoFin := TStringList.Create;
  DiaAberto := 0;
  NumAberto := -1;
  DirUA := '';
  if MaisDeUm then Exit;
  FUChat := Reg.ReadInteger('', 'UChat', 0);
end;

procedure TDados.FFTblMgrPause;
begin
  Application.ProcessMessages;
end;

function TDados.LimiteDebito(F: TField): Double;
begin
  if F.IsNull then
    Result := tbConfigLimitePadraoDebito.Value
  else
    Result := F.AsFloat;  
end;

procedure TDados.SoUmProgCustom(Sender: TObject);
begin
  MaisDeUm := True;
  ShowMessage('Já existe um CM-Admin sendo executado!');
end;

procedure TDados.CMAoDesativar(Sender: TObject);
begin
  if not Conectando then begin
    Session.Active := False;
    Application.Terminate;
  end;  
end;

procedure TDados.tAuxMovEstCalcFields(DataSet: TDataSet);
begin
  if tAuxMovEstCancelado.Value or tAuxMovEstNaoControlaEstoque.Value then
    tAuxMovEstFatorSaldo.Value := 0
  else
  if tAuxMovEstEntrada.Value then
    tAuxMovEstFatorSaldo.Value := 1
  else
    tAuxMovEstFatorSaldo.Value := -1;
    
  if tAuxMovEstNaoControlaEstoque.Value then
    tAuxMovEstSaldo.Value := 0
  else   
    tAuxMovEstSaldo.Value := tAuxMovEstEstoqueAnt.Value + (tAuxMovEstFatorSaldo.Value * tAuxMovEstQuant.Value);      
end;

procedure TDados.SetUChat(const Value: Integer);   
begin
  if Value=FUChat then Exit;
  FUChat := Value;
  Reg.WriteInteger('', 'UChat', FUChat);
end;

function TDados.ReprocessaProd(Produto: String): Extended;
var Saldo: Double;                                  
begin
  Result := 0;
  tAuxMovEst.SetRange([Produto], [Produto]);
  while (not tAuxMovEst.Eof) do begin
    tAuxMovEst.Edit;
    tAuxMovEstEstoqueAnt.Value := Result;
    tAuxMovEst.Post;
    Result := tAuxMovEstSaldo.Value;
    tAuxMovEst.Next;
  end;
end;

function TDados.ObtemSaldoAnterior(Produto: String; 
                                   Data: TDateTime; 
                                   NumSeq: Integer): Extended;
var 
  I, F : TDateTime;
begin
  I := 1;
  F := 9999999;
  Result := 0;
  tAuxMovEst.SetRange([Produto, I], [Produto, F]);
  if tAuxMovEst.Eof and tAuxMovEst.Bof then Exit;
  tAuxMovEst.FindNearest([Produto, Data, (NumSeq-1)]);
  while (not tAuxMovEst.Bof) and 
        ((tAuxMovEstDataMov.Value > Data) or
         ((tAuxMovEstDataMov.Value=Data) and (tAuxMovEstNumSeq.Value>=NumSeq))) do
    tAuxMovEst.Prior;
  if not tAuxMovEst.Bof then
    Result := tAuxMovEstSaldo.Value;
end;

procedure TDados.AjustaSaldoPosterior(Produto: String; Data: TDateTime;
  NumSeq: Integer; Saldo: Extended);
var
  I, F : TDateTime;
  CS : Boolean;
begin
  I := 1;
  F := 9999999;
  CS := ControlaSaldo(Produto);
  tAuxMovEst.SetRange([Produto, I], [Produto, F]);
  if tAuxMovEst.Eof and tAuxMovEst.Bof then Exit;

  tAuxMovEst.FindNearest([Produto, Data, (NumSeq+1)]);

  if (tAuxMovEstDataMov.Value<Data) or
     ((tAuxMovEstDataMov.Value=Data) and (tAuxMovEstNumSeq.Value<=NumSeq)) then
    Exit;

  repeat 
    tAuxMovEst.Edit;
    if tAuxMovEstNaoControlaEstoque.Value then
      tAuxMovEstEstoqueAnt.Value := 0
    else  
      tAuxMovEstEstoqueAnt.Value := Saldo;      
    tAuxMovEst.Post;
    Saldo := tAuxMovEstSaldo.Value;
    tAuxMovEst.Next;
  until tAuxMovEst.Eof;
end;

procedure TDados.AjustaEstoqueProduto(Produto: String; Custo, Quant: Double);
begin
  tbPro.IndexName := 'ICodigo';
  if tbPro.FindKey([Produto]) then begin
    tbPro.Edit;
    if Custo<>0 then
      tbProCustoUnitario.Value := Custo;
    if tbProNaoControlaEstoque.Value then
      tbProEstoqueAtual.Clear
    else   
      tbProEstoqueAtual.Value := tbProEstoqueAtual.Value + Quant;
    tbPro.Post;
  end;
end;

procedure TDados.tbProCalcFields(DataSet: TDataSet);
begin
  tbProEstoqueFinal.Value :=
    tbProEstoqueAtual.Value +
    tbProEstoqueACE.Value -
    tbProEstoqueACS.Value;
end;

procedure TDados.ffClientConnectionLost(aSource: TObject;
  aStarting: Boolean; var aRetry: Boolean);
begin
  aRetry := False;
  CM.Ativo := False;
  ServRem.Ativo := False;
  Application.Terminate;
end;

procedure TDados.CMAoAtualizarUsuario(Sender: TObject);
var U: TCMUsuario;
begin
  if not mtUsuario.Active then Exit;
  U := TCMUsuario(Sender);
  if mtUsuario.Locate('Username', U.Username, []) then 
    mtUsuario.Edit
  else
    mtUsuario.Append;  
  U.SalvaDataset(mtUsuario);
  mtUsuario.Post;
end;

procedure TDados.CMAoDestruirUsuario(Sender: TObject);
begin
  if not mtUsuario.Active then Exit;
  with TCMUsuario(Sender) do
  if mtUsuario.Locate('Username', Username, []) then
    mtUsuario.Delete;
end;

procedure TDados.CMAoReceberChat(Sender: TObject; MsgID, De, Para: Integer;
  DataHora: TDateTime; Texto: string);
begin
  UChat := MsgID;
  FrmPri.FrmChat.MsgEnv(DataHora, De, Para, Texto);
end;

function TDados.ControlaSaldo(aProduto: String): Boolean;
var SIndex: String;
begin
  Result := True;
  SIndex := tbPro.IndexName;
  tbPro.IndexName := 'ICodigo';
  try
    Result := (not tbPro.FindKey([aProduto])) or (not tbProNaoControlaEstoque.Value);
  finally
    tbPro.IndexName := SIndex;
  end;
end;

procedure TDados.CMAoAtualizarMaquina(Sender: TObject);
var 
  M : TCMMaquina;
  NumAnt : Integer;
  AguardaAnt: Boolean;
  S: String;
  FI : PfmFormInfo;
begin
  if not mtMaquina.Active then Exit;
  mtMaquina.DisableControls;
  try
    M := TCMMaquina(Sender);
    NumAnt := mtMaquina.FieldByName('Numero').AsInteger;
    if mtMaquina.Locate('Numero', M.Numero, []) then
      mtMaquina.Edit
    else begin
      FI  := FrmPri.FM.FormByClass(TfbMaquinas);
      if (FI<>nil) and (FI^.fiInstance<>nil) then
        TfbMaquinas(FI^.fiInstance).RefreshCacheMaq;
      mtMaquina.Append;
    end;  
    AguardaAnt := mtMaquinaAguardaPagto.Value;  
    M.SalvaDataset(mtMaquina);
    S := M.NomeContato;
    
    if mtMaquinaAcesso.Value < 1 then begin
      mtMaquinaInicio.Value := 0;
      mtMaquinaNomeContato.Value := '';
      mtMaquinaNome.Value := '';
      mtMaquinaProgramaAtual.Value := '';
    end;
    mtMaquina.Post;
    if (not mtMaquinaAguardaPagto.Value) or AguardaAnt or  
       (CM.Config.ModoPagtoAcesso<>mpgTelaPagtoAutomatica) or
       (ListaAcessoFin.IndexOf(mtMaquinaAcesso.AsString)=-1) then begin
      AguardaAnt := True;
      mtMaquina.Locate('Numero', NumAnt, []);
    end;
  finally
    mtMaquina.EnableControls;
  end;
  mtMaquina.Refresh;   
  if not AguardaAnt then begin
    ListaAcessoFin.Delete(ListaAcessoFin.IndexOf(mtMaquinaAcesso.AsString));
    NumAcessoPagto := mtMaquinaAcesso.Value;
    Timer2.Enabled := True;
  end;  
end;

procedure TDados.CMAoDestruirMaquina(Sender: TObject);
var 
  M : TCMMaquina;
  FI: PfmFormInfo;
begin
  if not mtMaquina.Active then Exit;
  M := TCMMaquina(Sender);
  
  if mtMaquina.Locate('Numero', M.Numero, []) then begin
    FI  := FrmPri.FM.FormByClass(TfbMaquinas);
    if (FI<>nil) and (FI^.fiInstance<>nil) then
      TfbMaquinas(FI^.fiInstance).RefreshCacheMaq;
    mtMaquina.Delete;
  end;  
end;

procedure TDados.mtMaquinaCalcFields(DataSet: TDataSet);
begin
  mtMaquinaConectado.Value := (mtMaquinaCliente.Value>0);
  if mtMaquinaAcesso.Value > 0 then 
    mtMaquinaLimiteTempoDT.Value := TicksToDateTime(mtMaquinaLimiteTempo.Value)
  else
    mtMaquinaLimiteTempoDT.Value := 0;
      
  if mtMaquinaContato.Value > 0 then
    mtMaquinaMostrar.Value := mtMaquinaNomeContato.Value
  else
    mtMaquinaMostrar.Value := mtMaquinaNome.Value;  
  mtMaquinaTotalFinal.Value := mtMaquinaAcesso.Value + mtMaquinaVendas.Value;
  mtMaquinaManutencao.Value := (mtMaquinaTipoTran.Value=ttManutencao);
end;

function Permitido(TipoAcesso: Integer): Boolean;
begin
  if Dados.CM.UA.Admin then
    Result := True
  else        
    Result := ItemTrueStr(Dados.CM.UA.Direitos, TipoAcesso);
end;

procedure TDados.AbrirFecharCaixa;
var
  Hora : TDateTime;
  SAnt : Extended;
begin
  if NumAberto<1 then begin
    tbCaixa.CancelRange;
    tbCaixa.IndexName := 'INumero';
    tbCaixa.Last;
    if tbCaixa.RecordCount>0 then
      SAnt := tbCaixaSaldoFinal.Value
    else
      SAnt := 0;

    Hora := Now;
    if not SimNao('Confirma abertura do caixa de '+
                  FormatDateTime('dd/mm/yyyy hh:mm', Hora)) then Exit;
    tbCaixa.Insert;
    tbCaixaAberto.Value := True;
    tbCaixaAbertura.Value := Hora;
    tbCaixaUsuario.Value := Dados.CM.Username;
    if tbConfigManterSaldoCaixa.Value then
      tbCaixaSaldoAnt.Value := Sant;
    tbCaixa.Post;
    DiaAberto := Hora;
    NumAberto := tbCaixaNumero.Value;
  end;
end;

{function TDados.ObtemAguardando: Double;
begin
  Q.Active := False;
  Q.Active := True;
  if Q.RecordCount > 0 then
    Result := Q.FieldByName('Acessos').AsFloat + Q.FieldByName('Vendas').AsFloat
  else
    Result := 0;
end;}

procedure TDados.DataModuleDestroy(Sender: TObject);
begin
  ListaAcessoFin.Free;
end;

procedure TDados.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  if tbAcesso.FindKey([NumAcessoPagto]) then
    TFrmAcesso.Create(Self).Editar(tbAcesso, 2);
end;

procedure TDados.tbCaixaCalcFields(DataSet: TDataSet);
begin
  tbCaixaTotal.Value :=
    (tbCaixaAcesso.Value + tbCaixaVenda.Value + tbCaixaAcessoDebPago.Value + tbCaixaVendaDebPago.Value) -
    (tbCaixaAcessoNaoPago.Value + tbCaixaVendaNaoPago.Value);

  tbCaixaSaldoFinal.Value :=
    tbCaixaSaldoAnt.Value +
    tbCaixaTotal.Value +
    tbCaixaSuprimento.Value -
    tbCaixaSangria.Value;
end;

procedure TDados.tbChatCalcFields(DataSet: TDataSet);
var S: String;
begin
  if tbChatDe.Value=0 then begin
    S := 'Atendente diz';
    tbChatMaq.Value := tbChatPara.Value;
  end else begin
    S := 'Máquina diz';
    tbChatMaq.Value := tbChatDe.Value;
  end;
    
  tbChatDiz.Value := FormatDateTime('hh:mm:ss', tbChatDataHora.Value) + ' - ' + S;
end;

procedure TDados.RefreshTipoCred;
begin
  dsTT.Dataset := nil;
  try
    mtTT.Active := True;
    mtTT.EmptyTable;
    mtTT.Append;
    mtTTTipo.Value := 0;
    mtTTDescr.Value := 'Tempo Avulso';
    mtTT.Post;
  
    tbTipoPass.First;
    while not tbTipoPass.Eof do begin
      mtTT.Append;
      mtTTTipo.Value := 1;
      mtTTDescr.Value := tbTipoPassNome.Value;
      mtTTCodigo.Value := tbTipoPassCodigo.Value;
      mtTTMinutos.Value := tbTipoPassMinutos.Value;
      mtTTValor.Value := tbTipoPassValor.Value;
      mtTTTipoAcesso.Value := tbTipoPassTipoAcesso.Value;
      mtTT.Post;
      tbTipoPass.Next;
    end;
  
    tbPacote.First;
    while not tbPacote.Eof do begin
      mtTT.Append;
      mtTTTipo.Value := 1;
      mtTTDescr.Value := tbPacoteDescr.Value;
      mtTTCodigo.Value := tbPacoteCodigo.Value;
      mtTTMinutos.Value := tbPacoteHoras.Value * 60;
      mtTTValor.Value := tbPacoteValorTotal.Value;
      mtTT.Post;
      tbPacote.Next;
    end;
  
    mtTT.First;
  finally
    dsTT.Dataset := mtTT;
  end;
end;

procedure TDados.TotalizaDebCli(Cli: Integer);
var Debito: Double;
begin
  Q.Active := False;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT ' +
            '  Sum(ValorFinalAcesso) as ACESSO, ' +
            '  SUM(Produtos) as Produtos, ' +
            '  Sum(DescontoProduto) as DescProd ' +
            'FROM Transacao ' +
            'WHERE '+
            '  (Contato='+IntToStr(Cli)+') AND '+
            '  (StatusPagto='+IntToStr(spDebitado)+') AND '+
            '  (CaixaP=0)');
  Q.Open;
  Debito := Q.FieldByName('Acesso').AsFloat +
            Q.FieldByName('Produtos').AsFloat -
            Q.FieldByName('DescProd').AsFloat;
  tbCli.CancelRange;
  tbCli.IndexName := 'ICodigo';            
  if tbCli.FindKey([Cli]) then begin
    tbCli.Edit;
    tbCliDebito.Value := Debito;
    tbCliTemDebito.AsBoolean := (Debito>0.0009);
    tbCli.Post;
  end;
  Q.Active := False;
end;

function TDados.TotalDebitos: Double;
begin
  Q.Active := False;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT ' +
            '  Sum(ValorFinalAcesso) as Acesso, ' +
            '  SUM(Produtos) as Produtos, ' +
            '  Sum(DescontoProduto) as DescProd ' +
            'FROM Transacao ' +
            'WHERE '+
            '  (StatusPagto='+IntToStr(spDebitado)+') AND '+
            '  (CaixaP=0)');
  Q.Open;
  Result := Q.FieldByName('Acesso').AsFloat +
            Q.FieldByName('Produtos').AsFloat -
            Q.FieldByName('DescProd').AsFloat;
end;

function TDados.TotalCreditos: Integer;
begin
  Q.Active := False;
  Q.SQL.Clear;
  Q.SQL.Add('SELECT SUM(CreditoM / 60000) as Minutos From Contato where (CreditoM>0) and (CreditoM<'+IntToStr(High(Integer))+')');
  Q.Open;
  Result := Q.FieldByName('Minutos').AsInteger;
end;

procedure TDados.AjustaCampoLocalizaCli;
var Campo: String;
begin
  case tbConfigCampoLocalizaCli.Value of
    1 : begin
      TVLUsername.Index := 0;
      TVLNome.Index := 1;
      TVL.OptionsBehavior.IncSearchItem := TVLUsername;
      tbCli.IndexName := 'IUsername';
    end;
    2 : begin
      TVLCodigo.Index := 0;
      TVLNome.Index := 1;
      TVL.OptionsBehavior.IncSearchItem := TVLCodigo;
      tbCli.IndexName := 'ICodigo';
    end;
  else
    TVL.OptionsBehavior.IncSearchItem := TVLNome;
    TVLUsername.Index := 1;
    TVLNome.Index := 0;
    tbCli.IndexName := 'INome';
  end;
end;

procedure TDados.tbTipoPassCalcFields(DataSet: TDataSet);
begin
  tbTipoPassMinutos.Value := tbTipoPassMaxSegundos.Value div 60;
end;

procedure TDados.FecharDB;
begin
  DB.Connected := False;
  Session.Active := False;
  nxTCPIP.Active := False;
  mtUsuario.EmptyTable;
  mtMaquina.EmptyTable;
end;

procedure TDados.CMAoAtualizarConfig(Sender: TObject);
begin
  tbConfig.Refresh;
end;

end.
