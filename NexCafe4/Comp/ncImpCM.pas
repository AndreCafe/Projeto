unit ncImpCM;

interface

uses
  SysUtils, ncErros, Classes, DB, nxdb, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, nxllComponent, nxsdServerEngine, nxreRemoteServerEngine,
  kbmMemTable, ncSessao;

type
  TEvAndamento = procedure (TableName: String; Maximo, Posicao: Integer) of object;
  
  TdmCM = class(TDataModule)
    nxSS: TnxSession;
    nxDB: TnxDatabase;
    cmAviso: TnxTable;
    cmAvisoMinutos: TWordField;
    cmAvisoAvisoTexto: TStringField;
    cmAvisoSegAvisoTexto: TWordField;
    cmAvisoPiscarAvisoTexto: TBooleanField;
    cmAvisoSom: TBlobField;
    cmAvisoTocarSom: TBooleanField;
    cmCaixa: TnxTable;
    cmCaixaNumero: TAutoIncField;
    cmCaixaAberto: TBooleanField;
    cmCaixaUsuario: TStringField;
    cmCaixaAbertura: TDateTimeField;
    cmCaixaFechamento: TDateTimeField;
    cmCaixaAcesso: TCurrencyField;
    cmCaixaAcessoNaoPago: TCurrencyField;
    cmCaixaAcessoDebPago: TCurrencyField;
    cmCaixaAcessoQuant: TCurrencyField;
    cmCaixaVenda: TCurrencyField;
    cmCaixaVendaNaoPago: TCurrencyField;
    cmCaixaVendaDebPago: TCurrencyField;
    cmCaixaVendaQuant: TCurrencyField;
    cmCaixaSuprimento: TCurrencyField;
    cmCaixaSangria: TCurrencyField;
    cmCaixaSaldoAnt: TCurrencyField;
    cmCaixaDescontos: TCurrencyField;
    cmCaixaTempoAcesso: TFloatField;
    cmCaixaTempoManutencao: TFloatField;
    cmCaixaObs: TMemoField;
    cmCli: TnxTable;
    cmCliCodigo: TAutoIncField;
    cmCliNome: TStringField;
    cmCliEndereco: TStringField;
    cmCliBairro: TStringField;
    cmCliCidade: TStringField;
    cmCliUF: TStringField;
    cmCliCEP: TStringField;
    cmCliNasc: TDateTimeField;
    cmCliSexo: TStringField;
    cmCliObs: TMemoField;
    cmCliCpf: TStringField;
    cmCliRg: TStringField;
    cmCliTelefone: TStringField;
    cmCliEmail: TMemoField;
    cmCliCreditoM: TIntegerField;
    cmCliTempoTotal: TIntegerField;
    cmCliTempoInicial: TIntegerField;
    cmCliIsento: TBooleanField;
    cmCliUsername: TStringField;
    cmCliPai: TStringField;
    cmCliMae: TStringField;
    cmCliSenha: TStringField;
    cmCliUltVisita: TDateTimeField;
    cmCliDebito: TCurrencyField;
    cmCliEscola: TStringField;
    cmCliEscolaHI: TDateTimeField;
    cmCliEscolaHF: TDateTimeField;
    cmCliNickName: TStringField;
    cmCliDataNasc: TDateTimeField;
    cmCliCelular: TStringField;
    cmCliTemDebito: TBooleanField;
    cmCliLimiteDebito: TCurrencyField;
    cmCliFoto: TGraphicField;
    cmCliIncluidoEm: TDateTimeField;
    cmCliAlteradoEm: TDateTimeField;
    cmCliIncluidoPor: TStringField;
    cmCliAlteradoPor: TStringField;
    cmCliInativo: TBooleanField;
    cmCliTipoAcessoPref: TIntegerField;
    cmCor: TnxTable;
    cmCorTipoAcesso: TWordField;
    cmCorCor: TIntegerField;
    cmCorCorFonte: TIntegerField;
    cmCorDescricao: TStringField;
    cmCorReinicia: TBooleanField;
    cmCorP: TnxTable;
    cmCorPTipoAcesso: TWordField;
    cmCorPCor: TIntegerField;
    cmCorPPos: TWordField;
    cmCorPValor: TCurrencyField;
    cmCorPTempo: TDateTimeField;
    cmCorPValorMin: TCurrencyField;
    cmCorPTolerancia: TDateTimeField;
    cmHPass: TnxTable;
    cmHPassNumSeq: TAutoIncField;
    cmHPassPassaporte: TIntegerField;
    cmHPassTransacao: TIntegerField;
    cmHPassDataHora: TDateTimeField;
    cmHPassSegundos: TIntegerField;
    MT: TkbmMemTable;
    MTTransacao: TIntegerField;
    MTSessao: TIntegerField;
    cmHC: TnxTable;
    cmHCTipoAcesso: TWordField;
    cmHCDia: TWordField;
    cmHCHora: TWordField;
    cmHCCor: TIntegerField;
    cmImp: TnxTable;
    cmImpIDSeq: TAutoIncField;
    cmImpDataHora: TDateTimeField;
    cmImpComputador: TStringField;
    cmImpMaquina: TWordField;
    cmImpPaginas: TIntegerField;
    cmImpImpressora: TStringField;
    cmImpDocumento: TMemoField;
    cmImpAcesso: TIntegerField;
    cmImpResultado: TWordField;
    cmMaq: TnxTable;
    cmMaqNumero: TWordField;
    cmMaqNome: TStringField;
    cmMaqInicio: TDateTimeField;
    cmMaqContato: TIntegerField;
    cmMaqTipoAcesso: TWordField;
    cmMaqNomeContato: TStringField;
    cmMaqInicioTicks: TIntegerField;
    cmMaqAcesso: TIntegerField;
    cmMaqCreditoCli: TIntegerField;
    cmMaqIsento: TBooleanField;
    cmMaqMenu: TMemoField;
    cmMaqRecursos: TMemoField;
    cmMaqSinal: TCurrencyField;
    cmMaqVendas: TCurrencyField;
    cmMaqObsAcesso: TMemoField;
    cmMaqLimiteTempo: TIntegerField;
    cmMaqLiberaAlemPacote: TBooleanField;
    cmMaqTicksParadoPac: TIntegerField;
    cmMaqComputerName: TStringField;
    cmMaqAguardaPagto: TBooleanField;
    cmMaqManutencao: TBooleanField;
    cmMaqCaixa: TIntegerField;
    cmMaqUsuarioI: TStringField;
    cmMaqTipoTran: TWordField;
    cmMaqStrPassaportes: TMemoField;
    cmPac: TnxTable;
    cmPacCodigo: TWordField;
    cmPacHoras: TWordField;
    cmPacValorTotal: TCurrencyField;
    cmPacDescr: TStringField;
    cmProd: TnxTable;
    cmProdCodigo: TStringField;
    cmProdDescricao: TStringField;
    cmProdUnid: TStringField;
    cmProdPreco: TCurrencyField;
    cmProdObs: TMemoField;
    cmProdImagem: TGraphicField;
    cmProdCategoria: TStringField;
    cmProdSubCateg: TStringField;
    cmProdEstoqueAtual: TFloatField;
    cmProdCustoUnitario: TCurrencyField;
    cmProdEstoqueACE: TFloatField;
    cmProdEstoqueACS: TFloatField;
    cmProdPodeAlterarPreco: TBooleanField;
    cmProdNaoControlaEstoque: TBooleanField;
    cmTA: TnxTable;
    cmTACodigo: TWordField;
    cmTANome: TStringField;
    cmTPass: TnxTable;
    cmTPassCodigo: TAutoIncField;
    cmTPassNome: TStringField;
    cmTPassValor: TCurrencyField;
    cmTPassTipoAcesso: TIntegerField;
    cmTPassTipoExp: TWordField;
    cmTPassExpirarEm: TDateTimeField;
    cmTPassMaxSegundos: TIntegerField;
    cmTPassObs: TMemoField;
    cmTPassDia1: TIntegerField;
    cmTPassDia2: TIntegerField;
    cmTPassDia3: TIntegerField;
    cmTPassDia4: TIntegerField;
    cmTPassDia5: TIntegerField;
    cmTPassDia6: TIntegerField;
    cmTPassDia7: TIntegerField;
    cmUsuario: TnxTable;
    mtTran: TkbmMemTable;
    IntegerField10: TIntegerField;
    mtTranTran: TIntegerField;
    cmUsuarioUsername: TStringField;
    cmUsuarioNome: TStringField;
    cmUsuarioAdmin: TBooleanField;
    cmUsuarioSenha: TStringField;
    cmUsuarioGrupos: TMemoField;
    cmUsuarioDireitos: TMemoField;
    cmUsuarioMaxTempoManut: TIntegerField;
    cmUsuarioMaxMaqManut: TIntegerField;
    cmConfig: TnxTable;
    cmConfigNumSeq: TAutoIncField;
    cmConfigModulos: TMemoField;
    cmConfigTiposLancExtra: TMemoField;
    cmConfigProgramasPermitidos: TMemoField;
    cmConfigCMGuard: TMemoField;
    cmConfigJanelasExplorer: TMemoField;
    cmConfigFecharProgramas: TBooleanField;
    cmConfigAutoExecutar: TStringField;
    cmConfigLimiteTempoPadrao: TDateTimeField;
    cmConfigPacoteTempoReal: TBooleanField;
    cmConfigPermiteLoginSemCred: TBooleanField;
    cmConfigEncerramentoPrePago: TWordField;
    cmConfigProdutoImpressao: TStringField;
    cmConfigPermiteCapturaTela: TBooleanField;
    cmConfigAlertaFimTempo: TDateTimeField;
    cmConfigVariosTiposAcesso: TBooleanField;
    cmConfigModoPagtoAcesso: TWordField;
    cmConfigMostraPrePagoDec: TBooleanField;
    cmConfigTempoMaxAlerta: TDateTimeField;
    cmConfigMostraCliCadAntesAvulso: TBooleanField;
    cmConfigAbre1: TDateTimeField;
    cmConfigAbre2: TDateTimeField;
    cmConfigAbre3: TDateTimeField;
    cmConfigAbre4: TDateTimeField;
    cmConfigAbre5: TDateTimeField;
    cmConfigAbre6: TDateTimeField;
    cmConfigAbre7: TDateTimeField;
    cmConfigFecha1: TDateTimeField;
    cmConfigFecha2: TDateTimeField;
    cmConfigFecha3: TDateTimeField;
    cmConfigFecha4: TDateTimeField;
    cmConfigFecha5: TDateTimeField;
    cmConfigFecha6: TDateTimeField;
    cmConfigFecha7: TDateTimeField;
    cmConfigCorLivre: TIntegerField;
    cmConfigCorFLivre: TIntegerField;
    cmConfigCorUsoPrePago: TIntegerField;
    cmConfigCorFUsoPrePago: TIntegerField;
    cmConfigCorUsoPosPago: TIntegerField;
    cmConfigCorFUsoPosPago: TIntegerField;
    cmConfigCorAguardaPagto: TIntegerField;
    cmConfigCorFAguardaPagto: TIntegerField;
    cmConfigCorManutencao: TIntegerField;
    cmConfigCorFManutencao: TIntegerField;
    cmConfigCorPausado: TIntegerField;
    cmConfigCorFPausado: TIntegerField;
    cmConfigCorDesktop: TIntegerField;
    cmConfigCorFDesktop: TIntegerField;
    cmConfigCampoLocalizaCli: TWordField;
    cmConfigManterSaldoCaixa: TBooleanField;
    cmConfigNaoMostrarMsgDebito: TBooleanField;
    cmConfigTolerancia: TDateTimeField;
    cmConfigRegImp98: TBooleanField;
    cmConfigLimitePadraoDebito: TCurrencyField;
    cmConfigPortaImpRec: TStringField;
    cmConfigSaltoImpRec: TWordField;
    cmConfigLargImpRec: TWordField;
    cmConfigCabecalhoImpRec: TMemoField;
    cmConfigRodapeImpRec: TMemoField;
    cmConfigImprimirImpRec: TBooleanField;
    cmConfigMostraProgAtual: TBooleanField;
    cmConfigMostraObs: TBooleanField;
    cmConfigEscondeTextoBotoes: TBooleanField;
    cmConfigEscondeTipoAcesso: TBooleanField;
    cmConfigExigirRG: TBooleanField;
    cmConfigDesativaRegAutImp: TBooleanField;
    cmConfigTipoFDesktop: TStringField;
    cmConfigTipoFLogin: TStringField;
    cmConfigNumFDesktop: TIntegerField;
    cmConfigNumFLogin: TIntegerField;
    cmConfigMostrarApenasPIN: TBooleanField;
    cmConfigTextoPIN: TStringField;
    cmConfigAlterarSenhaCli: TBooleanField;
    cmConfigVerSenhaCli: TBooleanField;
    cmTran: TnxTable;
    cmTranNumero: TAutoIncField;
    cmTranCaixaI: TIntegerField;
    cmTranCaixaF: TIntegerField;
    cmTranCaixaP: TIntegerField;
    cmTranTipoAcesso: TWordField;
    cmTranInicio: TDateTimeField;
    cmTranFim: TDateTimeField;
    cmTranDataPagto: TDateTimeField;
    cmTranContato: TIntegerField;
    cmTranNome: TStringField;
    cmTranMaquina: TWordField;
    cmTranTipo: TWordField;
    cmTranFuncI: TStringField;
    cmTranFuncF: TStringField;
    cmTranTempo: TDateTimeField;
    cmTranTempoCobrado: TDateTimeField;
    cmTranCredUsado: TIntegerField;
    cmTranCredAnterior: TIntegerField;
    cmTranDesconto: TCurrencyField;
    cmTranProdutos: TCurrencyField;
    cmTranValor: TCurrencyField;
    cmTranObs: TMemoField;
    cmTranIsento: TBooleanField;
    cmTranNaoUsarPacote: TBooleanField;
    cmTranCodPacote: TWordField;
    cmTranSinal: TCurrencyField;
    cmTranTransacaoVinculada: TIntegerField;
    cmTranValorFinalAcesso: TCurrencyField;
    cmTranDescontoProduto: TCurrencyField;
    cmTranNumDoc: TStringField;
    cmTranStatusPagto: TWordField;
    cmTranT0: TFloatField;
    cmTranT1: TFloatField;
    cmTranT2: TFloatField;
    cmTranT3: TFloatField;
    cmTranT4: TFloatField;
    cmTranT5: TFloatField;
    cmTranT6: TFloatField;
    cmTranT7: TFloatField;
    cmTranT8: TFloatField;
    cmTranT9: TFloatField;
    cmTranT10: TFloatField;
    cmTranT11: TFloatField;
    cmTranT12: TFloatField;
    cmTranT13: TFloatField;
    cmTranT14: TFloatField;
    cmTranT15: TFloatField;
    cmTranT16: TFloatField;
    cmTranT17: TFloatField;
    cmTranT18: TFloatField;
    cmTranT19: TFloatField;
    cmTranT20: TFloatField;
    cmTranT21: TFloatField;
    cmTranT22: TFloatField;
    cmTranT23: TFloatField;
    cmPass: TnxTable;
    cmPassNumero: TAutoIncField;
    cmPassTipoPass: TIntegerField;
    cmPassCliente: TIntegerField;
    cmPassExpirou: TBooleanField;
    cmPassSenha: TStringField;
    cmPassPrimeiroUso: TDateTimeField;
    cmPassTipoAcesso: TIntegerField;
    cmPassTipoExp: TWordField;
    cmPassExpirarEm: TDateTimeField;
    cmPassMaxSegundos: TIntegerField;
    cmPassSegundos: TIntegerField;
    cmPassAcessos: TIntegerField;
    cmPassDia1: TIntegerField;
    cmPassDia2: TIntegerField;
    cmPassDia3: TIntegerField;
    cmPassDia4: TIntegerField;
    cmPassDia5: TIntegerField;
    cmPassDia6: TIntegerField;
    cmPassDia7: TIntegerField;
    cmPassTransacao: TIntegerField;
    cmPassDataCompra: TDateTimeField;
    cmPassValido: TBooleanField;
    cmPassValor: TCurrencyField;
    cmMovEst: TnxTable;
    cmMovEstNumSeq: TAutoIncField;
    cmMovEstTransacao: TIntegerField;
    cmMovEstProduto: TStringField;
    cmMovEstQuant: TFloatField;
    cmMovEstUnitario: TCurrencyField;
    cmMovEstTotal: TCurrencyField;
    cmMovEstCustoU: TCurrencyField;
    cmMovEstItem: TWordField;
    cmMovEstDesconto: TCurrencyField;
    cmMovEstDataMov: TDateTimeField;
    cmMovEstDataPag: TDateTimeField;
    cmMovEstEntrada: TBooleanField;
    cmMovEstCancelado: TBooleanField;
    cmMovEstEstoqueAnt: TFloatField;
    cmMovEstTipoTran: TWordField;
    cmMovEstContato: TIntegerField;
    cmMovEstCaixaMov: TIntegerField;
    cmMovEstCaixaPag: TIntegerField;
    cmMovEstCategoria: TStringField;
    cmAux: TnxTable;
    cmAuxNumero: TAutoIncField;
    cmAuxCaixaI: TIntegerField;
    cmAuxCaixaF: TIntegerField;
    cmAuxCaixaP: TIntegerField;
    cmAuxTipoAcesso: TWordField;
    cmAuxInicio: TDateTimeField;
    cmAuxFim: TDateTimeField;
    cmAuxDataPagto: TDateTimeField;
    cmAuxContato: TIntegerField;
    cmAuxNome: TStringField;
    cmAuxMaquina: TWordField;
    cmAuxTipo: TWordField;
    cmAuxFuncI: TStringField;
    cmAuxFuncF: TStringField;
    cmAuxTempo: TDateTimeField;
    cmAuxTempoCobrado: TDateTimeField;
    cmAuxCredUsado: TIntegerField;
    cmAuxCredAnterior: TIntegerField;
    cmAuxDesconto: TCurrencyField;
    cmAuxProdutos: TCurrencyField;
    cmAuxValor: TCurrencyField;
    cmAuxObs: TMemoField;
    cmAuxIsento: TBooleanField;
    cmAuxNaoUsarPacote: TBooleanField;
    cmAuxCodPacote: TWordField;
    cmAuxSinal: TCurrencyField;
    cmAuxTransacaoVinculada: TIntegerField;
    cmAuxValorFinalAcesso: TCurrencyField;
    cmAuxDescontoProduto: TCurrencyField;
    cmAuxNumDoc: TStringField;
    cmAuxStatusPagto: TWordField;
    cmAuxT0: TFloatField;
    cmAuxT1: TFloatField;
    cmAuxT2: TFloatField;
    cmAuxT3: TFloatField;
    cmAuxT4: TFloatField;
    cmAuxT5: TFloatField;
    cmAuxT6: TFloatField;
    cmAuxT7: TFloatField;
    cmAuxT8: TFloatField;
    cmAuxT9: TFloatField;
    cmAuxT10: TFloatField;
    cmAuxT11: TFloatField;
    cmAuxT12: TFloatField;
    cmAuxT13: TFloatField;
    cmAuxT14: TFloatField;
    cmAuxT15: TFloatField;
    cmAuxT16: TFloatField;
    cmAuxT17: TFloatField;
    cmAuxT18: TFloatField;
    cmAuxT19: TFloatField;
    cmAuxT20: TFloatField;
    cmAuxT21: TFloatField;
    cmAuxT22: TFloatField;
    cmAuxT23: TFloatField;
    mtItem: TkbmMemTable;
    mtItemTransacao: TIntegerField;
    mtItemItemID: TIntegerField;
    mtItemTipo: TIntegerField;
    Q: TnxQuery;
    Qcontato: TIntegerField;
    Qacesso: TCurrencyField;
    Qprod: TCurrencyField;
    Qdescprod: TCurrencyField;
    Qtotal: TCurrencyField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure QCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FEvAndamento : TEvAndamento;

    procedure Imp_ttAcesso;
    procedure Imp_ttVendaPacote;
    procedure Imp_ttCreditoTempo;
    procedure Imp_ttManutencao;
    procedure Imp_ttAcessoVenda;
    procedure Imp_ttDebitoTempo;
    procedure Imp_ttSinal;
    procedure Imp_ttEstVenda;
    procedure Imp_ttEstCompra;
    procedure Imp_ttEstEntrada;
    procedure Imp_ttEstSaida;
    procedure Imp_ttPagtoDebito;
    procedure Imp_ttSuprimentoCaixa;
    procedure Imp_ttSangriaCaixa;
    procedure Imp_ttVendaPassaporte;
    
    
    procedure ImpAviso;
    procedure ImpCaixa;
    procedure ImpClientes;
    procedure ImpCor;
    procedure ImpCorPrecos;
    procedure ImpHPass;
    procedure ImpPass;
    procedure ImpHoraCor;
    procedure ImpImp;
    procedure ImpMaq;
    procedure ImpPacote;
    procedure ImpProduto;
    procedure ImpTipoAcesso;
    procedure ImpTipoPass;
    procedure ImpUsuario;
    procedure ImpConfig;
    procedure ImpTran;

    procedure AddDeb;
  public
    FSessao : TncSessao;
    procedure Importa;
    procedure Open;
    procedure OpenConn(aPasta: String);

    property EvAndamento: TEvAndamento 
      read FEvAndamento write FEvAndamento;
      
    { Public declarations }
  end;

var
  dmCM: TdmCM;

implementation

uses ncDMServ, ncClassesBase, ncServBD;

{$R *.dfm}

const
  ttAcesso            = 0;
  ttVendaPacote       = 1;
  ttCreditoTempo      = 2;
  ttManutencao        = 3;
  ttAcessoVenda       = 4;
  ttDebitoTempo       = 5;
  ttSinal             = 6;
  ttEstVenda          = 7;
  ttEstCompra         = 8;
  ttEstEntrada        = 9;
  ttEstSaida          = 10;
  ttPagtoDebito       = 11;
  ttSuprimentoCaixa   = 12;
  ttSangriaCaixa      = 13;
  ttVendaPassaporte   = 14;


procedure TransfDados(De, Para: TnxTable);
var 
  I : Integer;
  F : TField;
begin
  for I := 0 to De.FieldCount-1 do with De.Fields[I] do begin
    F := Para.FindField(FieldName);
    if F<>nil then
    try
      F.Value := Value;
    except
    end;
  end;
end;

procedure TdmCM.AddDeb;
begin
  with DM do begin
    if (cmTranCaixaP.Value=0) and (tITranDebito.Value > 0.0001) then begin
      tDebito.Insert;
      tDebitoData.Value := tITranDataHora.Value;
      tDebitoValor.Value := tITranDebito.Value;
      tDebitoTipo.Value := tITranTipoItem.Value;
      tDebitoCliente.Value := tTranCliente.Value;
      tDebitoID.Value := tITranItemID.Value;
      tDebito.Post;
    end;
  end;
end;

procedure TdmCM.DataModuleCreate(Sender: TObject);
begin
  FEvAndamento := nil;
  FSessao := TncSessao.Create(True);
end;

procedure TdmCM.DataModuleDestroy(Sender: TObject);
begin
  FSessao.Free;
end;

procedure TdmCM.ImpAviso;
var 
  Texto, Som: Boolean;
  I, T: Integer;
begin
  cmAviso.Open;
  cmAviso.First;
  I := 0;
  T := cmAviso.RecordCount;
  with DM do 
  while not cmAviso.Eof do begin
    Inc(I);
    FEvAndamento('Avisos', T, I);
    Som := (cmAvisoSom.BlobSize>0);
    Texto := (Trim(cmAvisoAvisoTexto.Value)>'');
    if Som or Texto then begin
      tAvisos.Insert;
      TransfDados(cmAviso, tAvisos);
      if Som and Texto then
        tAvisosTipo.Value := 2 else
      if Som then
        tAvisosTipo.Value := 1 else
        tAvisosTipo.Value := 0; 
      tAvisos.Post;
    end;
    cmAviso.Next;
  end;
end;

procedure TdmCM.ImpCaixa;
var I, T: Integer;
begin
  cmCaixa.Open;
  I := 0;
  T := cmCaixa.RecordCount;
  with DM do 
  while not cmCaixa.Eof do begin
    Inc(I);
    FEvAndamento('Caixa', T, I);
    tCaixa.Insert;
    tCaixaID.Value := cmCaixaNumero.Value;
    tCaixaAbertura.Value := cmCaixaAbertura.Value;
    tCaixaFechamento.Value := cmCaixaFechamento.Value;
    tCaixaUsuario.Value := cmCaixaUsuario.Value;
    tCaixaDescontos.Value := cmCaixaDescontos.Value;
    tCaixaSaldoAnt.Value := cmCaixaSaldoAnt.Value;
    tCaixaAberto.Value := cmCaixaAberto.Value;
    tCaixaObs.Value := cmCaixaObs.Value;
    tCaixaTotalFinal.Value :=
      cmCaixaAcesso.Value + 
      cmCaixaAcessoDebPago.Value + 
      cmCaixaVenda.Value + 
      cmCaixaVendaDebPago.Value - 
      (cmCaixaAcessoNaoPago.Value + cmCaixaVendaNaoPago.Value);
    tCaixaSupr.Value := cmCaixaSuprimento.Value;  
    tCaixaSangria.Value := cmCaixaSangria.Value;
    tCaixa.Post;
    cmCaixa.Next;
  end;
  if I>0 then
    DM.tCaixa.SetAutoIncValue(cmCaixaNumero.Value);
end;

procedure TdmCM.ImpClientes;
var I, T: Integer;
begin
  cmCli.Open;
  I := 0;
  T := cmCli.RecordCount;
  with DM do 
  while not cmCli.Eof do begin
    Inc(I);
    FEvAndamento('Clientes', T, I);
    tCli.Insert;
    TransfDados(cmCli, tCli);
    tCliID.Value := cmCliCodigo.Value;
    tCliMinutos.Value := cmCliCreditoM.Value / 60000;
    tCliMinutosUsados.Value := cmCliTempoTotal.Value / 60;
    tCliMinutosIniciais.Value := cmCliTempoInicial.Value / 60;
    tCli.Post;
    cmCli.Next;
  end;
  if I>0 then
    DM.tCli.SetAutoIncValue(cmCliCodigo.Value);
end;

procedure TdmCM.ImpConfig;
var I, T: Integer;
begin
  cmConfig.Open;
  I := 0;
  T := cmConfig.RecordCount;
  with DM do 
  while not cmCor.Eof do begin
    Inc(I);
    FEvAndamento('Config', T, I);
    tConfig.Insert;
    TransfDados(cmConfig, tConfig);
    tConfig.Post;
    cmConfig.Next;
  end;
end;

procedure TdmCM.ImpCor;
var I, T: Integer;
begin
  cmCor.Open;
  I := 0;
  T := cmCor.RecordCount;
  with DM do 
  while not cmCor.Eof do begin
    Inc(I);
    FEvAndamento('Tarifas', T, I);
    tTarifa.Insert;
    TransfDados(cmCor, tTarifa);
    tTarifa.Post;
    cmCor.Next;
  end;
end;

procedure TdmCM.ImpCorPrecos;
var I, T: Integer;
begin
  cmCorP.Open;
  I := 0;
  T := cmCorP.RecordCount;
  with DM do 
  while not cmCorP.Eof do begin
    Inc(I);
    FEvAndamento('CorPrecos', T, I);
    tETar.Insert;
    TransfDados(cmCorP, tETar);
    tETar.Post;
    cmCorP.Next;
  end;
end;

procedure TdmCM.ImpHoraCor;
var I, T: Integer;
begin
  cmHC.Open;
  I := 0;
  T := cmHC.RecordCount;
  with DM do 
  while not cmHC.Eof do begin
    Inc(I);
    FEvAndamento('HoraCor', T, I);
    tHTar.Insert;
    TransfDados(cmHC, tHTar);
    tHTar.Post;
    cmHC.Next;
  end;
end;

procedure TdmCM.ImpHPass;
var I, T: Integer;
begin
  cmHPass.Open;
  I := 0;
  T := cmHPass.RecordCount;
  with DM do 
  while not cmHPass.Eof do begin
    Inc(I);
    FEvAndamento('HPass', T, I);
    tHPass.Insert;
    tHPassID.Value := cmHPassNumSeq.Value;
    tHPassPassaporte.Value := cmHPassPassaporte.Value;
    tHPassDataHora.Value := cmHPassDataHora.Value;
    tHPassSessao.AsVariant := MT.Lookup('Transacao', cmHPassTransacao.Value, 'Sessao');
    tHPassMinutosAnt.Value := 0;
    tHPassMinutosUsados.Value := cmHPassSegundos.Value / 60;
    tHPass.Post;
    cmHPass.Next;
  end;
  if I>0 then
    DM.tHPass.SetAutoIncValue(cmHPassNumSeq.Value);
end;

procedure TdmCM.ImpImp;
var I, T: Integer;
begin
  cmImp.Open;
  I := 0;
  T := cmImp.RecordCount;
  with DM do 
  while not cmImp.Eof do begin
    Inc(I);
    FEvAndamento('Impressoes', T, I);
    tImp.Insert;
    TransfDados(cmImp, tImp);
    tImpID.Clear;
    tImp.Post;
    cmImp.Next;
  end;
end;

procedure TdmCM.ImpMaq;
var I, T: Integer;
begin
  cmMaq.Open;
  I := 0;
  T := cmMaq.RecordCount;
  with DM do 
  while not cmMaq.Eof do begin
    Inc(I);
    FEvAndamento('Maquinas', T, I);
    if tMaq.Locate('Numero', cmMaqNumero.Value, []) then
      tMaq.Edit else
      tMaq.Insert;
    TransfDados(cmMaq, tMaq);
    tMaq.Post;
    cmMaq.Next;
  end;
end;

procedure TdmCM.ImpPacote;
var I, T: Integer;
begin
  cmPac.Open;
  I := 0;
  T := cmPac.RecordCount;
  cmPac.First;
  with DM do 
  while not cmPac.Eof do begin
    Inc(I);
    FEvAndamento('Pacotes', T, I);
    tPacote.Insert;
    tPacoteID.Value := cmPacCodigo.Value;
    tPacoteDescr.Value := cmPacDescr.Value;
    tPacoteValor.Value := cmPacValorTotal.Value;
    tPacoteMinutos.Value := cmPacHoras.Value * 60;
    tPacote.Post;
    cmPac.Next;
  end;
  if I>0 then
    DM.tPacote.SetAutoIncValue(cmPacCodigo.Value);
end;

procedure TdmCM.ImpPass;
var I, T: Integer;
begin
  cmPass.Open;
  I := 0;
  T := cmPass.RecordCount;
  with DM do 
  while not cmPass.Eof do begin
    Inc(I);
    FEvAndamento('Passaportes', T, I);
    tPassaporte.Insert;
    TransfDados(cmPass, tPassaporte);
    tPassaporteID.Value := cmPassNumero.Value;
    tPassaporte.Post;
    cmPass.Next;
  end;
  if I > 0 then
    DM.tPassaporte.SetAutoIncValue(cmPassNumero.Value);
end;

procedure TdmCM.ImpProduto;
var I, T: Integer;
begin
  cmProd.Open;
  I := 0;
  T := cmProd.RecordCount;
  with DM do 
  while not cmProd.Eof do begin
    Inc(I);
    FEvAndamento('Produtos', T, I);
    tProduto.Insert;
    TransfDados(cmProd, tProduto);
    tProduto.Post;
    cmProd.Next;
  end;
end;
       
procedure TdmCM.ImpTipoAcesso;
var I, T: Integer;
begin
  cmTA.Open;
  I := 0;
  T := cmTA.RecordCount;
  with DM do 
  while not cmTA.Eof do begin
    Inc(I);
    FEvAndamento('Tipos de Acesso', T, I);
    tTipoAcesso.Insert;
    tTipoAcessoID.Value := cmTACodigo.Value;
    tTipoAcessoNome.Value := cmTANome.Value;
    tTipoAcesso.Post;
    cmTA.Next;
  end;

  gTiposAcesso.Limpa;
  gTiposAcesso.LeDataset(DM.tTipoAcesso);
end;

procedure TdmCM.ImpTipoPass;
var I, T: Integer;
begin
  cmTPass.Open;
  I := 0;
  T := cmTPass.RecordCount;
  with DM do 
  while not cmTPass.Eof do begin
    Inc(I);
    FEvAndamento('TipoPass', T, I);
    tTipoPass.Insert;
    TransfDados(cmTPass, tTipoPass);
    tTipoPassID.Value := cmTPassCodigo.Value;
    tTipoPass.Post;
    cmTPass.Next;
  end;
  if I > 0 then
    DM.tTipoPass.SetAutoIncValue(cmTPassCodigo.Value);
end;

procedure TdmCM.ImpTran;
var I, T: Integer;
begin
  cmTran.Open;
  I := 0;
  T := cmTran.RecordCount;
  with DM do 
  while not cmTran.Eof do begin
    Inc(I);
    if not DM.nxDB.InTransaction then
      DM.nxDB.StartTransaction;
    
    FEvAndamento('Transacao', T, I);
    case cmTranTipo.Value of
      ttAcesso : Imp_ttAcesso;
      ttVendaPacote : Imp_ttVendaPacote;
      ttCreditoTempo : Imp_ttCreditoTempo;
      ttManutencao : Imp_ttManutencao;
      ttAcessoVenda : Imp_ttAcessoVenda;
      ttDebitoTempo : Imp_ttDebitoTempo;
      ttSinal : Imp_ttSinal;
      ttEstVenda : Imp_ttEstVenda;
      ttEstCompra : Imp_ttEstCompra;
      ttEstEntrada : Imp_ttEstEntrada;
      ttEstSaida : Imp_ttEstSaida;
      ttPagtoDebito : Imp_ttPagtoDebito;
      ttSuprimentoCaixa : Imp_ttSuprimentoCaixa;
      ttSangriaCaixa : Imp_ttSangriaCaixa;
      ttVendaPassaporte : Imp_ttVendaPassaporte;
    end;

    if (I mod 2000) = 0 then
      DM.nxDB.Commit;
      
    cmTran.Next;
  end;

  if DM.nxDB.InTransaction then
    DM.nxDB.Commit;
end;

procedure TdmCM.ImpUsuario;
var I, T: Integer;
begin
  cmUsuario.Open;
  I := 0;
  T := cmUsuario.RecordCount;
  with DM do 
  while not cmUsuario.Eof do begin
    Inc(I);
    FEvAndamento('Usuarios', T, I);
    tUsuario.Insert;
    TransfDados(cmUsuario, tUsuario);
    tUsuario.Post;
    cmUsuario.Next;
  end;
end;

procedure TdmCM.Imp_ttAcesso;
var I: Integer;

procedure ImpVendasAcesso;
begin
  with DM do begin
    cmMovEst.SetRange([cmTranNumero.Value], [cmTranNumero.Value]);
    try
      cmMovEst.First;
      while not cmMovEst.Eof do begin
        Inc(I);
        tMovEst.Insert;
        tMovEstProduto.AsVariant := tProduto.Lookup('Codigo', cmMovEstProduto.Value, 'ID');
        tMovEstQuant.Value := cmMovEstQuant.Value;
        tMovEstUnitario.Value := cmMovEstUnitario.Value;
        tMovEstCustoU.Value := cmMovEstCustoU.Value;
        tMovEstTotal.Value := cmMovEstTotal.Value;
        tMovEstDesconto.Value := cmMovEstDesconto.Value;
        tMovEstTipoTran.Value := trEstVenda;
        tMovEstPago.Value := 0;
        if cmTranStatusPagto.Value=3 then 
          tMovEstPagoPost.Value := 0 else
          tMovEstPagoPost.Value := tMovEstTotal.Value - tMovEstDesconto.Value;
        tMovEstItem.Value := cmMovEstItem.Value;
        tMovEstDataHora.Value := cmMovEstDataMov.Value;
        tMovEstEntrada.Value := cmMovEstEntrada.Value;
        tMovEstEstoqueAnt.Value := cmMovEstEstoqueAnt.Value;
        tMovEstTipoTran.Value := trEstVenda;
        tMovEstCliente.Value := tTranCliente.Value;
        tMovEstCaixa.Value := cmMovEstCaixaMov.Value;
        tMovEstCategoria.Value := cmMovEstCategoria.Value;
        tMovEstNaoControlaEstoque.Value := False;
        tMovEstSessao.Value := tSessaoID.Value;
        tMovEst.Post;
        
        mtItem.Insert;
        mtItemTransacao.Value := cmTranNumero.Value;
        mtItemTipo.Value := itMovEst;
        mtItemItemID.Value := tMovEstID.Value;
        mtItem.Post;

        tTran.Insert;
        tTranMaq.Value := tSessaoMaq.Value;
        tTranTipo.Value := trEstVenda;
        tTranDataHora.Value := tMovEstDataHora.Value;
        tTranSessao.Value := tSessaoID.Value;
        tTranCliente.Value := tSessaoCliente.Value;
        tTranNomeCliente.Value := tSessaoNomeCliente.Value;
        tTranCaixa.Value := tMovEstCaixa.Value;
        tTranTotal.Value := tMovEstTotal.Value;
        tTranDesconto.Value := tMovEstDesconto.Value;
        tTranPago.Value := 0;
        tTran.Post;

        tITran.Insert;
        tITranCaixa.Value := tTranCaixa.Value;
        tITranTipoTran.Value := trEstVenda;
        tITranDataHora.Value := tTranDataHora.Value;
        tITranTran.Value := tTranID.Value;
        tITranTipoItem.Value := itMovEst;
        tITranTotal.Value := tMovEstTotal.Value;
        tITranDesconto.Value := tMovEstDesconto.Value;
        tITranPago.Value := 0;
        tITranItemID.Value := tMovEstID.Value;
        tITranSessao.Value := tSessaoID.Value;
        tITran.Post;

        tMovEst.Edit;
        tMovEstTran.Value := tTranID.Value;
        tMovEstITran.Value := tITranID.Value;
        tMovEst.Post;

        tITran.Insert;
        tITranCaixa.Value := tTranCaixa.Value;
        tITranTipoTran.Value := trFimSessao;
        tITranDataHora.Value := tSessaoTermino.Value;
        tITranTran.Value := tSessaoTranF.Value;
        tITranTipoItem.Value := itMovEst;
        tITranTotal.Value := tMovEstTotal.Value;
        tITranDesconto.Value := tMovEstDesconto.Value;
        tITranPago.Value := tMovEstPagoPost.Value;
        tITranItemID.Value := tMovEstID.Value;
        tITranSessao.Value := tSessaoID.Value;
        tITran.Post;
        
        cmMovEst.Next;
      end;   
    finally
      cmMovEst.CancelRange;
    end;
  end;  
end;


begin
  with DM do begin
    if cmTranFim.Value = 0 then Exit;
    if cmTranCaixaF.Value = 0 then Exit;
    
    tSessao.Insert;
    tSessaoInicio.Value := cmTranInicio.Value;
    tSessaoTermino.Value := cmTranFim.Value;
    tSessaoMaq.Value := cmTranMaquina.Value;
    tSessaoFuncI.Value := cmTranFuncI.Value;
    tSessaoFuncF.Value := cmTranFuncF.Value;
    tSessaoCaixaI.Value := cmTranCaixaI.Value;
    tSessaoCaixaF.Value := cmTranCaixaF.Value;
    tSessaoMinutosR.Value := DateTimeToSegundos(cmTranTempo.Value) / 60;
    tSessaoMinutosC.Value := DateTimeToSegundos(cmTranTempoCobrado.Value) / 60;
    tSessaoTipoAcesso.Value := cmTranTipoAcesso.Value;
    tSessaoCliente.Value := cmTranContato.Value;
    tSessaoNomeCliente.Value := cmTranNome.Value;
    tSessaoMinutosCli.Value := cmTranCredAnterior.Value / 60000;
    tSessaoMinutosCliU.Value := cmTranCredUsado.Value / 60000;
    tSessaoMaqI.Value := tSessaoMaq.Value;
    tSessaoTotal.Value := cmTranValorFinalAcesso.Value+cmTranDesconto.Value;
    tSessaoDesconto.Value := cmTranDesconto.Value;
    tSessaoFimTicksTotal.Value := DateTimeToTicks(cmTranTempo.Value);
    if cmTranStatusPagto.Value=3 then begin
      tSessaoPago.Value := 0;
      if cmTranCaixaP.Value>0 then
        tSessaoPagoPost.Value := cmTranValorFinalAcesso.Value;
    end else
      tSessaoPago.Value := cmTranValorFinalAcesso.Value;
      
    tSessaoEncerrou.Value := True;
    if cmTranTipo.Value = ttManutencao then
      tSessaoTipoCli.Value := tcManutencao 
    else  
    if cmTranIsento.Value then
      tSessaoTipoCli.Value  := tcCliGratis else
      tSessaoTipoCli.Value  := tcNormal;
    tSessao.Post;
    
    mtItem.Insert;
    mtItemTransacao.Value := cmTranNumero.Value;
    mtItemTipo.Value := itSessao;
    mtItemItemID.Value := tSessaoID.Value;
    mtItem.Post;
    
    MT.Insert;
    MTTransacao.Value := cmTranNumero.Value;
    MTSessao.Value := tSessaoID.Value;
    MT.Post;

    tTran.Insert;
    tTranMaq.Value := tSessaoMaq.Value;
    tTranTipo.Value := trInicioSessao;
    tTranSessao.Value := tSessaoID.Value;
    tTranDataHora.Value := tSessaoInicio.Value;
    tTranCaixa.Value := tSessaoCaixaI.Value;
    tTranFunc.Value := tSessaoFuncI.Value;
    tTranCliente.Value := tSessaoCliente.Value;
    tTranNomeCliente.Value := tSessaoNomeCliente.Value;
    tTran.Post;

    tSessao.Edit;
    tSessaoTranI.Value := tTranID.Value;
    tSessao.Post;

    tITran.Insert;
    tITranSessao.Value := tSessaoID.Value;
    tITranTran.Value := tTranID.Value;
    tITranTipoTran.Value := trInicioSessao;
    tITranTipoItem.Value := itSessao;
    tITranItemID.Value := tSessaoID.Value;
    tITranCaixa.Value := tSessaoCaixaI.Value;
    tITranItemPos.Value := 1;
    tITran.Post;

    tTran.Insert;
    tTranMaq.Value := tSessaoMaq.Value;
    tTranCliente.Value := tSessaoCliente.Value;
    tTranNomeCliente.Value := tSessaoNomeCliente.Value;
    tTranTipo.Value := trFimSessao;
    tTranSessao.Value := tSessaoID.Value;
    tTranDataHora.Value := tSessaoTermino.Value;
    tTranCaixa.Value := tSessaoCaixaF.Value;
    tTranFunc.Value := tSessaoFuncI.Value;
    tTranTotal.Value :=
      cmTranValorFinalAcesso.Value +
      cmTranDesconto.Value +
      cmTranProdutos.Value;
    tTranDesconto.Value := cmTranDesconto.Value;

    if cmTranStatusPagto.Value=3 then 
      tTranPago.Value := 0 else
      tTranPago.Value := tTranTotal.Value - tTranDesconto.Value;
      
    tTran.Post;

    tSessao.Edit;
    tSessaoTranF.Value := tTranID.Value;
    tSessao.Post;

    FSessao.LeDataset(tSessao);
    FSessao.GeraOcupacao;

    for I := 0 to High(FSessao.ArrOcupacao^) do 
    with FSessao.ArrOcupacao^[I] do begin
      tOcupacao.Insert;
      tOcupacaoCliente.Value := FSessao.Cliente;
      tOcupacaoFunc.Value := FSessao.FuncI;
      tOcupacaoSessao.Value := FSessao.ID;
      tOcupacaoData.Value := eoData;
      tOcupacaoTipoCli.Value := FSessao.TipoCli;
      tOcupacaoHora.Value := eoHora;
      tOcupacaoMinutosU.Value := TicksToMinutos(eoTicksU);
      tOcupacaoMinutosP.Value := TicksToMinutos(eoTicksP);
      tOcupacaoMaq.Value := eoMaq;
      tOcupacaoCaixa.Value := eoCaixa;
      tOcupacao.Post;
    end;
    
    tITran.Insert;
    tITranSessao.Value := tSessaoID.Value;
    tITranTran.Value := tTranID.Value;
    tITranTipoTran.Value := trFimSessao;
    tITranTipoItem.Value := itSessao;
    tITranItemID.Value := tSessaoID.Value;
    tITranCaixa.Value := tSessaoCaixaF.Value;
    tITranItemPos.Value := 1;
    tITranTotal.Value := tSessaoTotal.Value;
    tITranDesconto.Value := tSessaoDesconto.Value;
    tITranPago.Value := tSessaoPago.Value;
    tITran.Post;

    AddDeb;

    if cmTranTipo.Value = ttAcessoVenda then
      ImpVendasAcesso;
  end;
end;

procedure TdmCM.Imp_ttAcessoVenda;
begin
  Imp_ttAcesso;
end;

procedure TdmCM.Imp_ttCreditoTempo;
var 
  AchouPass: Boolean;
begin
  with DM do begin
    if cmTranInicio.isNull or (cmTranInicio.Value=0) then Exit;
    
    tTempo.Insert;
    tTempoCaixa.Value := cmTranCaixaI.Value;
    tTempoDataHora.Value := cmTranInicio.Value;
    tTempoFunc.Value := cmTranFuncI.Value;
    tTempoCliente.Value := cmTranContato.Value;
    AchouPass := False;
    case cmTranTipo.Value of
      ttCreditoTempo : begin
        tTempoTipo.Value := tctAvulso;
        tTempoMinutos.Value := DateTimeToSegundos(cmTranTempo.Value) / 60;
      end;
      ttSinal : begin
        tTempoTipo.Value := tctAvulso;
        tTempoMinutos.Value := DateTimeToSegundos(cmTranTempo.Value) / 60;
        tTempoSessao.AsVariant := MT.Lookup('Transacao', cmTranTransacaoVinculada.Value, 'Sessao');
        tTempoCliente.Clear;
      end;
      ttVendaPacote : begin
        tTempoTipo.Value := tctPacote;
        tTempoIDPacPass.Value := cmTranCodPacote.Value;
        tTempoMinutos.Value := Trunc(cmTranTempo.Value);
      end;
      ttVendaPassaporte : begin
        tTempoTipo.Value := tctPassaporte;
        tTempoIDPacPass.Value := cmTranCodPacote.Value;
        if cmPass.Locate('Transacao', cmTranNumero.Value, []) then begin
          tTempoMinutos.Value := cmPassMaxSegundos.Value / 60;
          AchouPass := True;
        end;
      end;
    end;
    tTempoTipoAcesso.Value := cmTranTipoAcesso.Value;
    tTempoTotal.Value := cmTranValor.Value;
    tTempoDesconto.Value := cmTranDesconto.Value;
    if cmTranStatusPagto.Value=3 then begin
      tTempoPago.Value := 0;
      if cmTranCaixaP.Value>0 then
        tTempoPagoPost.Value := tTempoTotal.Value - tTempoDesconto.Value;
    end  else
      tTempoPago.Value := tTempoTotal.Value - tTempoDesconto.Value;
    tTempo.Post;
    
    mtItem.Insert;
    mtItemTransacao.Value := cmTranNumero.Value;
    mtItemTipo.Value := itTempo;
    mtItemItemID.Value := tTempoID.Value;
    mtItem.Post;
    
    tTran.Insert;
    tTranTipo.Value := trCredTempo;
    tTranDataHora.Value := tTempoDataHora.Value;
    tTranCaixa.Value := tTempoCaixa.Value;
    tTranFunc.Value := tTempoFunc.Value;
    tTranCliente.Value := tTempoCliente.Value;
    tTranNomeCliente.Value := cmTranNome.Value;
    tTranTotal.Value := cmTranValor.Value;
    tTranDesconto.Value := cmTranDesconto.Value;
    tTranPago.Value := tTempoPago.Value;
    tTranSessao.Value := tTempoSessao.Value;
    tTran.Post;

    if AchouPass and tPassaporte.Locate('ID', cmPassNumero.Value, []) then begin
      tPassaporte.Edit;
      tPassaporteTran.Value:= tTranID.Value;
      tPassaporte.Post;
    end;
    
    tITran.Insert;
    tITranDataHora.Value := tTranDataHora.Value;
    tITranItemPos.Value := 1;
    tITranTran.Value := tTranID.Value;
    tITranTipoTran.Value := trCredTempo;
    tITranCaixa.Value := tTempoCaixa.Value;
    tITranTotal.Value := cmTranValor.Value;
    tITranDesconto.Value := cmTranDesconto.Value;
    tITranPago.Value := tTempoPago.Value;
    tITranTipoItem.Value := itTempo;
    tITranItemID.Value := tTempoID.Value;
    tITranSessao.Value := tTempoSessao.Value;
    tITran.Post;

    AddDeb;

    tTempo.Edit;
    tTempoTran.Value := tTranID.Value;
    tTempo.Post;
  end;
end;

procedure TdmCM.Imp_ttDebitoTempo;
begin
  {-- Não suportado ainda --}
end;

procedure TdmCM.Imp_ttEstCompra;
var I : Integer;
begin
  with DM do begin
    tTran.Insert;
    case cmTranTipo.Value of
      ttEstCompra  : tTranTipo.Value := trEstCompra;
      ttEstEntrada : tTranTipo.Value := trEstEntrada;
      ttEstSaida   : tTranTipo.Value := trEstSaida;
      ttEstVenda   : tTranTipo.Value := trEstVenda; 
    end;
    tTranCaixa.Value := cmTranCaixaI.Value;
    tTranDataHora.Value := cmTranInicio.Value;
    tTranCliente.Value := cmTranContato.Value;
    tTranNomeCliente.Value := cmTranNome.Value;
    tTranTotal.Value := cmTranProdutos.Value;
    tTranDesconto.Value := cmTranDescontoProduto.Value;
    if tTranTipo.Value=trEstVenda then begin
      if cmTranStatusPagto.Value=3 then 
        tTranPago.Value := 0 else
        tTranPago.Value := tTranTotal.Value - tTranDesconto.Value;
    end;
    tTranObs.Value := cmTranObs.Value;
    tTran.Post;
    I := 0;

    cmMovEst.SetRange([cmTranNumero.Value], [cmTranNumero.Value]);
    try
      cmMovEst.First;
      while not cmMovEst.Eof do begin
        Inc(I);
        tMovEst.Insert;
        tMovEstProduto.AsVariant := tProduto.Lookup('Codigo', cmMovEstProduto.Value, 'ID');
        tMovEstQuant.Value := cmMovEstQuant.Value;
        tMovEstUnitario.Value := cmMovEstUnitario.Value;
        tMovEstCustoU.Value := cmMovEstCustoU.Value;
        tMovEstTotal.Value := cmMovEstTotal.Value;
        tMovEstDesconto.Value := cmMovEstDesconto.Value;
        if tTranTipo.Value = trEstVenda then begin
          if tTranDebito.Value>=0.01 then begin
            tMovEstPago.Value := 0;
            if cmTranCaixaP.Value>0 then
              tMovEstPagoPost.Value := tMovEstTotal.Value - tMovEstDesconto.Value;
          end  else
            tMovEstPago.Value := tMovEstTotal.Value - tMovEstDesconto.Value;
        end;
        tMovEstTran.Value := tTranID.Value;
        tMovEstItem.Value := cmMovEstItem.Value;
        tMovEstDataHora.Value := cmMovEstDataMov.Value;
        tMovEstEntrada.Value := cmMovEstEntrada.Value;
        tMovEstEstoqueAnt.Value := cmMovEstEstoqueAnt.Value;
        tMovEstTipoTran.Value := tTranTipo.Value;
        tMovEstCliente.Value := tTranCliente.Value;
        tMovEstCaixa.Value := cmMovEstCaixaMov.Value;
        tMovEstCategoria.Value := cmMovEstCategoria.Value;
        tMovEstNaoControlaEstoque.Value := False;
        tMovEst.Post;
        
        mtItem.Insert;
        mtItemTransacao.Value := cmTranNumero.Value;
        mtItemTipo.Value := itMovEst;
        mtItemItemID.Value := tMovEstID.Value;
        mtItem.Post;
        
        tITran.Insert;
        tITranCaixa.Value := tTranCaixa.Value;
        tITranTipoTran.Value := tTranTipo.Value;
        tITranDataHora.Value := tTranDataHora.Value;
        tITranItemPos.Value := I;
        tITranTran.Value := tTranID.Value;
        tITranTipoItem.Value := itMovEst;
        tITranTotal.Value := tMovEstTotal.Value;
        tITranDesconto.Value := tMovEstDesconto.Value;
        tITranPago.Value := tMovEstPago.Value;
        tITranItemID.Value := tMovEstID.Value;
        tITran.Post;

        AddDeb;

        tMovEst.Edit;
        tMovEstITran.Value := tITranID.Value;
        tMovEst.Post;
        
        cmMovEst.Next;
      end;   
    finally
      cmMovEst.CancelRange;
    end;
  end;
end;

procedure TdmCM.Imp_ttEstEntrada;
begin
  Imp_ttEstCompra;
end;

procedure TdmCM.Imp_ttEstSaida;
begin
  Imp_ttEstCompra;
end;
        
procedure TdmCM.Imp_ttEstVenda;
begin
  Imp_ttEstCompra;
end;

procedure TdmCM.Imp_ttManutencao;
begin
  Imp_ttAcesso;
end;

procedure TdmCM.Imp_ttPagtoDebito;
var Desc: Currency;
begin
  with DM do begin
    tTran.Insert;
    tTranTipo.Value := trPagDebito;
    tTranObs.Value := cmTranObs.Value;
    tTranDataHora.Value := cmTranInicio.Value;
    tTranFunc.Value := cmTranFuncI.Value;
    tTranTotal.Value := cmTranValor.Value + cmTranProdutos.Value;
    tTranDesconto.Value := cmTranDesconto.Value + cmTranDescontoProduto.Value;
    tTranPago.Value := tTranTotal.Value - tTranDesconto.Value;
    tTranCliente.Value := cmTranContato.Value;
    tTranNomeCliente.Value := cmTranNome.Value;
    tTranCaixa.Value := cmTranCaixaP.Value;
    tTran.Post;

    Desc := tTranDesconto.Value;

    cmAux.SetRange([cmTranNumero.Value], [cmTranNumero.Value]);
    try
      cmAux.First;
      while not cmAux.Eof do begin
        mtItem.SetRange([cmAuxNumero.Value], [cmAuxNumero.Value]);
        try
          mtItem.First;
          while not mtItem.Eof do begin
            tITran.Insert;
            tITranTipoTran.Value := trPagDebito;
            tITranDataHora.Value := cmTranInicio.Value;
            tITranCaixa.Value := tTranCaixa.Value;
            tITranTipoItem.Value := mtItemTipo.Value;
            tITranItemID.Value := mtItemItemID.Value;
            tITranTran.Value := tTranID.Value;
            case tITranTipoItem.Value of
              itSessao : 
                if tSessao.Locate('ID', tITranItemID.Value, []) then begin
                  tITranTotal.Value := tSessaoTotal.Value - tSessaoDesconto.Value;
                  if Desc>tITranTotal.Value then 
                    tITranDesconto.Value := tITranTotal.Value else
                    tITranDesconto.Value := Desc;
                  tSessao.Edit;
                  tSessaoPagoPost.Value := tITranTotal.Value - tITranDesconto.Value;
                  tSessaoDescPost.Value := tITranDesconto.Value;
                  tSessao.Post;  
                end;
                
              itTempo  :
                if tTempo.Locate('ID', tITranItemID.Value, []) then begin
                  tITranTotal.Value := tTempoTotal.Value - tTempoDesconto.Value;
                  if Desc>tITranTotal.Value then 
                    tITranDesconto.Value := tITranTotal.Value else
                    tITranDesconto.Value := Desc;
                  tTempo.Edit;
                  tTempoPagoPost.Value := tITranTotal.Value - tITranDesconto.Value;
                  tTempoDescPost.Value := tITranDesconto.Value;
                  tTempo.Post;  
                end;
              
              itMovEst :
                if tMovEst.Locate('ID', tITranItemID.Value, []) then begin
                  tITranTotal.Value := tMovEstTotal.Value - tMovEstDesconto.Value;
                  if Desc>tITranTotal.Value then 
                    tITranDesconto.Value := tITranTotal.Value else
                    tITranDesconto.Value := Desc;
                  tMovEst.Edit;
                  tMovEstPagoPost.Value := tITranTotal.Value - tITranDesconto.Value;
                  tMovEstDescPost.Value := tITranDesconto.Value;
                  tMovEst.Post;  
                end;
            end;
            tITranPago.Value := tITranTotal.Value - tITranDesconto.Value;
            Desc := Desc - tITranDesconto.Value;
            tITran.Post;
            mtItem.Next;
          end;
        finally
          mtItem.CancelRange;
        end;
        cmAux.Next;
      end;
    finally
      cmAux.CancelRange;
    end;
  end;
end;

procedure TdmCM.Imp_ttSangriaCaixa;
begin
  with DM do begin
    tTran.Insert;
    tTranTipo.Value := trCaixaSai;
    tTranObs.Value := cmTranObs.Value;
    tTranDataHora.Value := cmTranInicio.Value;
    tTranFunc.Value := cmTranFuncI.Value;
    tTranTotal.Value := cmTranValor.Value;
    tTranCaixa.Value := cmTranCaixaP.Value;
    tTran.Post;
  end;    
end;

procedure TdmCM.Imp_ttSinal;
begin
  Imp_ttCreditoTempo;
end;

procedure TdmCM.Imp_ttSuprimentoCaixa;
begin
  with DM do begin
    tTran.Insert;
    tTranCaixa.Value := cmTranCaixaP.Value;
    tTranTipo.Value := trCaixaEnt;
    tTranObs.Value := cmTranObs.Value;
    tTranDataHora.Value := cmTranInicio.Value;
    tTranFunc.Value := cmTranFuncI.Value;
    tTranTotal.Value := cmTranValor.Value;
    tTran.Post;
  end;
end;

procedure TdmCM.Imp_ttVendaPacote;
begin
  Imp_ttCreditoTempo;
end;

procedure TdmCM.Imp_ttVendaPassaporte;
begin
  Imp_ttCreditoTempo;
end;

procedure TdmCM.Open;
var I: Integer;
begin
  for I := 0 to ComponentCount-1 do 
    if Components[I] is TnxTable then
      TnxTable(Components[I]).Open;
end;

procedure TdmCM.OpenConn(aPasta: String);
begin
  nxDB.Active := False;
  nxSS.Active := False;
  nxSS.ServerEngine := dmServidorBD.ServerEngine;

  if Copy(aPasta, Length(aPasta), 1)<>'\' then
    aPasta := aPasta + '\';
  
  if not FileExists(aPasta+'contato.nx1') then 
    aPasta := aPasta + 'Dados\';

  if not FileExists(aPasta+'contato.nx1') then
    Raise ENexCafe.Create('Dados não encontrados na pasta ' + aPasta);
   
  nxDB.AliasName := '';
  nxDB.AliasPath := aPasta;  
  nxSS.Active := True;
  nxDB.Active := True;
end;

procedure TdmCM.QCalcFields(DataSet: TDataSet);
begin
  QTotal.Value := QAcesso.Value + QProd.Value - QDescProd.Value;
end;

procedure TdmCM.Importa;
var 
  IDProd : Integer;

function GetIDProd: Integer;
begin
  with DM do 
  if IDProd=0 then begin
    tProduto.Insert;
    tProdutoPodeAlterarPreco.Value := True;
    tProdutoNaoControlaEstoque.Value := True;
    tProdutoObs.Value := 'Este produto foi criado automaticamente '+sLineBreak+
                         'na importação do NexCafé para o Cyber Manager';
    tProdutoDescricao.Value := 'Débitos Anteriores - Upgrade do Cyber Manager';
    tProduto.Post;  
    Result := tProdutoID.Value;
  end else
    Result := IDProd;
end;

begin
  ImpAviso;
  ImpCaixa;
  ImpClientes;
  ImpCor;
  ImpCorPrecos;
  ImpHPass;
  ImpPass;
  ImpHoraCor;
  ImpImp;
  ImpMaq;
  ImpPacote;
  ImpProduto;
  ImpTipoAcesso;
  ImpTipoPass;
  ImpUsuario;
  ImpConfig;
  ImpTran;
  DM.ReprocessaDebitos;
  IDProd := 0;
  Q.Active := False;
  Q.Active := True;
  with DM do begin
    Q.First;
    tCli.Open;
    tCli.IndexName := 'IID';
    while not Q.Eof do begin
      if tCli.FindKey([QContato.Value]) and
         (tCliDebito.Value < QTotal.Value) then 
      begin
        tTran.Insert;
        tTranTipo.Value := trEstVenda;
        tTranDataHora.Value := Now;
        tTranDescr.Value := 'Divergência de Débito na Importação';
        tTranTotal.Value := qTotal.Value - tCliDebito.Value;
        tTranPago.Value := 0;
        tTranCaixa.Value := -1;
        tTranDesconto.Value := 0;
        tTranNomeCliente.Value := tCliNome.Value;
        tTranCliente.Value := tCliID.Value;
        tTranObs.Value := 'Venda criada automatimente na importação'+sLineBreak+
                          'do Cyber Manager para o NexCafé devido '+sLineBreak+
                          'divergências de valores de débito causados '+sLineBreak+
                          'por problemas de banco de dados corrompido';
        tTran.Post;
        tITran.Insert;
        tITranTipoTran.Value := trEstVenda;
        tITranTipoItem.Value := itMovEst;
        tITranTran.Value := tTranID.Value;
        tITranItemPos.Value := 1;
        tITranDataHora.Value := tTranDataHora.Value;
        tITranCaixa.Value := -1;
        tITranTotal.Value := tTranTotal.Value;
        tITranPago.Value := 0;
        tITranDesconto.Value := 0;
        tITran.Post;              

        tMovEst.Insert;
        tMovEstProduto.Value := GetIDProd;
        tMovEstDataHora.Value := tTranDataHora.Value;
        tMovEstTran.Value := tTranID.Value;
        tMovEstITran.Value := tITranID.Value;
        tMovEstCaixa.Value := -1;
        tMovEstUnitario.Value := tTranTotal.Value;
        tMovEstQuant.Value := 1;
        tMovEstTotal.Value := tTranTotal.Value;
        tMovEstDesconto.Value := 0;
        tMovEstPago.Value := 0;
        tMovEstNaoControlaEstoque.Value := True;
        tMovEstItem.Value := 1;
        tMovEstEntrada.Value := False;
        tMovEstTipoTran.Value := trEstVenda;
        tMovEstCliente.Value := tCliID.Value;
        tMovEst.Post;
        
        tITran.Edit;
        tITranItemID.Value := tMovEstID.Value;
        tITran.Post;

        tDebito.Insert;
        tDebitoCliente.Value := tCliID.Value;
        tDebitoValor.Value := tTranTotal.Value;
        tDebitoTipo.Value := itMovEst;
        tDebitoID.Value := tMovEstID.Value;
        tDebitoData.Value := tTranDataHora.Value;
        tDebito.Post;
      end;
      Q.Next;
    end;
  end;  
  DM.ReprocessaDebitos;
end;

end.
