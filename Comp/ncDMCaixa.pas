unit ncDMCaixa;
{
    ResourceString: Dario 12/03/13
}

interface

uses
  SysUtils, Classes, DB, nxdb, kbmMemTable, nxllTransport,
  nxptBasePooledTransport, nxtwWinsockTransport, nxsdServerEngine,
  nxreRemoteServerEngine, nxllComponent, frxClass, frxDBSet, frxExportPDF,
  uLogs, uNexTransResourceStrings_PT;

type

  {TDadosCaixa = record
    dcID : Integer;
    dcAbertura : TDateTime;
    dcFechamento : TDateTime;
    dcSaldoInicial : Currency;
    dcUsuario : String;
  end;}

  TDadosResFin = record
    rfFaturamento,
    rfDebitado,
    rfRecebido,
    rfPgDebito  : Currency;
  end;  
    
  TdmCaixa = class(TDataModule)
    nxSession: TnxSession;
    nxDB: TnxDatabase;
    nxRSE: TnxRemoteServerEngine;
    nxTCPIP: TnxWinsockTransport;
    dsQVC: TDataSource;
    qVC: TnxQuery;
    tProd: TnxTable;
    tProdDescricao: TStringField;
    tME: TnxTable;
    mtEst: TkbmMemTable;
    mtEstSaldoInicial: TFloatField;
    mtEstEntradas: TFloatField;
    mtEstCompras: TFloatField;
    mtEstSaidas: TFloatField;
    mtEstVendas: TFloatField;
    mtEstValorVendas: TCurrencyField;
    mtEstDescricao: TStringField;
    mtEstSaldoFinal: TFloatField;
    mtEstLucro: TCurrencyField;
    dsTot: TDataSource;
    dsEst: TDataSource;
    mtTot: TkbmMemTable;
    mtTotItem: TIntegerField;
    mtTotDescricao: TStringField;
    mtTotTotal: TCurrencyField;
    tProdID: TAutoIncField;
    mtEstID: TIntegerField;
    tProdCustoUnitario: TCurrencyField;
    tProdNaoControlaEstoque: TBooleanField;
    qRFFat: TnxQuery;
    mtTotFaturamento: TCurrencyField;
    mtTotDebitado: TCurrencyField;
    mtTotRecebido: TCurrencyField;
    mtTotPgDebito: TCurrencyField;
    qSS: TnxQuery;
    qSSTipo: TWordField;
    qSSTotal: TCurrencyField;
    qDesc: TnxQuery;
    qCanc: TnxQuery;
    tCli: TnxTable;
    qGratis: TnxQuery;
    qVCCategoria: TStringField;
    qVCTotal: TCurrencyField;
    qVCDesconto: TCurrencyField;
    qVCTotFinal: TCurrencyField;
    dsGratis: TDataSource;
    tMEID: TAutoIncField;
    tMETran: TIntegerField;
    tMEProduto: TIntegerField;
    tMEQuant: TFloatField;
    tMEUnitario: TCurrencyField;
    tMETotal: TCurrencyField;
    tMECustoU: TCurrencyField;
    tMEItem: TWordField;
    tMEDesconto: TCurrencyField;
    tMEPago: TCurrencyField;
    tMEPagoPost: TCurrencyField;
    tMEDescPost: TCurrencyField;
    tMEDataHora: TDateTimeField;
    tMEEntrada: TBooleanField;
    tMECancelado: TBooleanField;
    tMEEstoqueAnt: TFloatField;
    tMECliente: TIntegerField;
    tMECaixa: TIntegerField;
    tMECategoria: TStringField;
    tMENaoControlaEstoque: TBooleanField;
    tMEITran: TIntegerField;
    tMETipoTran: TWordField;
    tMESessao: TIntegerField;
    tMESaldoFinal: TFloatField;
    tCaixa: TnxTable;
    tCaixaID: TAutoIncField;
    tCaixaAberto: TBooleanField;
    tCaixaUsuario: TStringField;
    tCaixaAbertura: TDateTimeField;
    tCaixaFechamento: TDateTimeField;
    tCaixaTotalFinal: TCurrencyField;
    tCaixaDescontos: TCurrencyField;
    tCaixaCancelamentos: TCurrencyField;
    tCaixaSaldoAnt: TCurrencyField;
    tCaixaObs: TMemoField;
    qFecha: TnxQuery;
    qFechaCancelado: TBooleanField;
    qFechaTipo: TWordField;
    qFechaTotal: TCurrencyField;
    qFechaDesconto: TCurrencyField;
    qFechaPago: TCurrencyField;
    qFechaDebito: TCurrencyField;
    tSessao: TnxTable;
    PDFexp: TfrxPDFExport;
    frdbCaixa: TfrxDBDataset;
    frdbTot: TfrxDBDataset;
    tCriar: TnxTable;
    tCriarID: TAutoIncField;
    tCriarTipo: TIntegerField;
    tCriarParametros: TMemoField;
    tCriarDestino: TMemoField;
    qVCQuant: TFloatField;
    tCaixaSangria: TCurrencyField;
    tCaixaSupr: TCurrencyField;
    mtImp: TkbmMemTable;
    mtImpTipoImp: TIntegerField;
    tTipoImp: TnxTable;
    mtImpQuant: TIntegerField;
    mtImpValor: TCurrencyField;
    dsImp: TDataSource;
    tImp: TnxTable;
    tImpID: TAutoIncField;
    tImpTran: TIntegerField;
    tImpCaixa: TIntegerField;
    tImpManual: TBooleanField;
    tImpDataHora: TDateTimeField;
    tImpComputador: TStringField;
    tImpMaquina: TWordField;
    tImpPaginas: TWordField;
    tImpImpressora: TStringField;
    tImpDocumento: TMemoField;
    tImpSessao: TIntegerField;
    tImpResultado: TWordField;
    tImpq1: TWordField;
    tImpq2: TWordField;
    tImpq3: TWordField;
    tImpq4: TWordField;
    tImpq5: TWordField;
    tImpq6: TWordField;
    tImpq7: TWordField;
    tImpq8: TWordField;
    tImpq9: TWordField;
    tImpq10: TWordField;
    tImpv1: TCurrencyField;
    tImpv2: TCurrencyField;
    tImpv3: TCurrencyField;
    tImpv4: TCurrencyField;
    tImpv5: TCurrencyField;
    tImpv6: TCurrencyField;
    tImpv7: TCurrencyField;
    tImpv8: TCurrencyField;
    tImpv9: TCurrencyField;
    tImpv10: TCurrencyField;
    tImpTotal: TCurrencyField;
    tImpDesconto: TCurrencyField;
    tImpPagoPost: TCurrencyField;
    tImpDescPost: TCurrencyField;
    tImpPago: TCurrencyField;
    tImpFunc: TStringField;
    tImpCliente: TIntegerField;
    tImpCancelado: TBooleanField;
    mtImpNomeTipoImp: TStringField;
    tCaixaReproc: TDateTimeField;
    qCorr: TnxQuery;
    qCorr2: TnxQuery;
    qSessao: TnxQuery;
    dsSessao: TDataSource;
    qSessaoID: TIntegerField;
    qSessaoInicio: TDateTimeField;
    qSessaoTermino: TDateTimeField;
    qSessaoMinutosR: TFloatField;
    qSessaoMinutosC: TFloatField;
    qSessaoMaq: TWordField;
    qSessaoMaqI: TWordField;
    qSessaoEncerrou: TBooleanField;
    qSessaoCliente: TIntegerField;
    qSessaoTransfMaq: TBooleanField;
    qSessaoTipoCli: TWordField;
    qSessaoCancelado: TBooleanField;
    qSessaoTotal: TCurrencyField;
    qSessaoDesconto: TCurrencyField;
    qSessaoPagoPost: TCurrencyField;
    qSessaoDescPost: TCurrencyField;
    qSessaoPago: TCurrencyField;
    qSessaoNomeCliente: TStringField;
    qSessaoFuncI: TStringField;
    qSessaoFuncF: TStringField;
    qSessaoObs: TMemoField;
    qSessaoTipoAcesso: TIntegerField;
    qSessaoCaixaI: TIntegerField;
    qSessaoCaixaF: TIntegerField;
    qSessaoTicksI: TIntegerField;
    qSessaoPausado: TBooleanField;
    qSessaoInicioPausa: TIntegerField;
    qSessaoMinTicksUsados: TIntegerField;
    qSessaoMinTicksTotal: TIntegerField;
    qSessaoFimTicksUsados: TIntegerField;
    qSessaoFimTicksTotal: TIntegerField;
    qSessaoStrPausas: TMemoField;
    qSessaoStrTransfMaq: TMemoField;
    qSessaoStrFechamentoCaixa: TMemoField;
    qSessaoMinutosCli: TFloatField;
    qSessaoMinutosPrev: TFloatField;
    qSessaoMinutosMax: TFloatField;
    qSessaoMinutosCliU: TFloatField;
    qSessaoValorCli: TCurrencyField;
    qSessaoValorCliU: TFloatField;
    qSessaoTranI: TIntegerField;
    qSessaoTranF: TIntegerField;
    qSessaoPermitirDownload: TBooleanField;
    qSessaoVersaoRegistro: TIntegerField;
    qSessaoCartaoTempo: TBooleanField;
    qSessaoHP1: TIntegerField;
    qSessaoHP2: TIntegerField;
    qSessaoHP3: TIntegerField;
    qSessaoHP4: TIntegerField;
    qSessaoHP5: TIntegerField;
    qSessaoHP6: TIntegerField;
    qSessaoHP7: TIntegerField;
    qSessaoRG: TStringField;
    qSessaoCPF: TStringField;
    qSessaoEndereco: TStringField;
    qSessaoBairro: TStringField;
    qSessaoDataNasc: TDateField;
    qSessaoCEP: TStringField;
    qSessaoUF: TStringField;
    qSessaoTelefone: TStringField;
    qSessaoCelular: TStringField;
    qSessaoCidade: TStringField;
    qSessaoEmail: TStringField;
    tTran: TnxTable;
    tTranID: TAutoIncField;
    tTranDataHora: TDateTimeField;
    tTranCliente: TIntegerField;
    tTranTipo: TWordField;
    tTranFunc: TStringField;
    tTranTotal: TCurrencyField;
    tTranDesconto: TCurrencyField;
    tTranPago: TCurrencyField;
    tTranObs: TMemoField;
    tTranCancelado: TBooleanField;
    tTranCanceladoPor: TStringField;
    tTranCanceladoEm: TDateTimeField;
    tTranCaixa: TIntegerField;
    tTranMaq: TWordField;
    tTranNomeCliente: TStringField;
    tTranSessao: TIntegerField;
    tTranDescr: TStringField;
    tTranDebito: TCurrencyField;
    tTranQtdTempo: TFloatField;
    tTranCredValor: TBooleanField;
    tITran: TnxTable;
    tITranID: TAutoIncField;
    tITranTran: TIntegerField;
    tITranCaixa: TIntegerField;
    tITranDataHora: TDateTimeField;
    tITranTipoTran: TWordField;
    tITranTipoItem: TWordField;
    tITranSubTipo: TWordField;
    tITranItemID: TIntegerField;
    tITranSubItemID: TIntegerField;
    tITranItemPos: TWordField;
    tITranTotal: TCurrencyField;
    tITranDesconto: TCurrencyField;
    tITranPago: TCurrencyField;
    tITranCancelado: TBooleanField;
    tITranSessao: TIntegerField;
    tITranDebito: TCurrencyField;
    tImpx75: TBooleanField;
    qSessaoUsername: TStringField;
    mtEstFidResg: TFloatField;
    tMEFidResgate: TBooleanField;
    tMEFidPontos: TFloatField;
    qFatPre: TnxQuery;
    qFatPos: TnxQuery;
    mtFatPrePos: TkbmMemTable;
    mtFatPrePosTipo: TStringField;
    mtFatPrePosQuant: TIntegerField;
    mtFatPrePosValor: TCurrencyField;
    tTipoPass: TnxTable;
    tTipoPassID: TAutoIncField;
    tTipoPassNome: TStringField;
    tPacote: TnxTable;
    tPacoteID: TAutoIncField;
    tPacoteDescr: TStringField;
    dsPrePos: TDataSource;
    tCaixaEstSessoesQtd: TIntegerField;
    tCaixaEstSessoesTempo: TFloatField;
    tCaixaEstUrls: TIntegerField;
    tCaixaEstSyncOk: TBooleanField;
    tCaixaEstBuscasEng: TMemoField;
    qEstSearchQtd: TnxQuery;
    qEstSearchPag: TnxQuery;
    qEstUrl: TnxQuery;
    qEstSessoes: TnxQuery;
    qEstRes: TnxQuery;
    tCaixaEstRes: TMemoField;
    qCancQuant: TLargeintField;
    qCancTotal: TCurrencyField;
    qGratisCliente: TIntegerField;
    qGratisQuant: TLargeintField;
    qGratisMinutosU: TFloatField;
    qGratisMinutosP: TFloatField;
    qDescQuant: TLargeintField;
    qDescTotal: TCurrencyField;
    qFatPosQuant: TLargeintField;
    qFatPosValor: TCurrencyField;
    qEstSearchPagSearchEng: TStringField;
    qEstSearchPagQtd: TLargeintField;
    qEstSearchQtdSearchEng: TStringField;
    qEstSearchQtdQtd: TLargeintField;
    qEstUrlqtd: TLargeintField;
    qEstResDisplayWH: TStringField;
    qEstResqtd: TLargeintField;
    qEstSessoestempo: TFloatField;
    qEstSessoesqtd: TLargeintField;
    qFatPreTipo: TWordField;
    qFatPreIDPacPass: TIntegerField;
    qFatPreQuant: TLargeintField;
    qFatPreValor: TCurrencyField;
    qGratisNomeCliente: TStringField;
    qManut: TnxQuery;
    qManutFunc: TStringField;
    qManutQuant: TLargeintField;
    qManutMinutosU: TFloatField;
    dsManut: TDataSource;
    qSessaoIPs: TnxMemoField;
    tCaixaSaldoF: TCurrencyField;
    tCaixaQuebra: TCurrencyField;
    frdbEst: TfrxDBDataset;
    mtEstEntradasTot: TFloatField;
    frdbImp: TfrxDBDataset;
    frdbTran: TfrxDBDataset;
    tRepProd: TnxTable;
    tRepProdID: TAutoIncField;
    tRepProdCodigo: TStringField;
    tRepProdDescricao: TStringField;
    tRepProdUnid: TStringField;
    tRepProdPreco: TCurrencyField;
    tRepProdObs: TnxMemoField;
    tRepProdImagem: TGraphicField;
    tRepProdCategoria: TStringField;
    tRepProdFornecedor: TIntegerField;
    tRepProdSubCateg: TStringField;
    tRepProdEstoqueAtual: TFloatField;
    tRepProdCustoUnitario: TCurrencyField;
    tRepProdEstoqueACE: TFloatField;
    tRepProdEstoqueACS: TFloatField;
    tRepProdPodeAlterarPreco: TBooleanField;
    tRepProdNaoControlaEstoque: TBooleanField;
    tRepProdEstoqueMin: TFloatField;
    tRepProdEstoqueMax: TFloatField;
    tRepProdAbaixoMin: TBooleanField;
    tRepProdAbaixoMinDesde: TDateTimeField;
    tRepProdEstoqueRepor: TFloatField;
    tRepProdFidelidade: TBooleanField;
    tRepProdFidPontos: TIntegerField;
    frdbProd: TfrxDBDataset;
    qRepTran: TnxQuery;
    qRepTranID: TIntegerField;
    qRepTranDataHora: TDateTimeField;
    qRepTranCliente: TIntegerField;
    qRepTranTipo: TWordField;
    qRepTranFunc: TStringField;
    qRepTranTotal: TCurrencyField;
    qRepTranDesconto: TCurrencyField;
    qRepTranTotLiq: TCurrencyField;
    qRepTranPago: TCurrencyField;
    qRepTranDebito: TCurrencyField;
    qRepTranObs: TnxMemoField;
    qRepTranCancelado: TBooleanField;
    qRepTranCanceladoPor: TStringField;
    qRepTranCanceladoEm: TDateTimeField;
    qRepTranCaixa: TIntegerField;
    qRepTranMaq: TWordField;
    qRepTranNomeCliente: TStringField;
    qRepTranSessao: TIntegerField;
    qRepTranDescr: TStringField;
    qRepTranQtdTempo: TFloatField;
    qRepTranCredValor: TBooleanField;
    qRepTranFidResgate: TBooleanField;
    qRepTranNomeTipo: TStringField;
    qRepTranCancFid: TStringField;
    tCaixaIDLivre: TStringField;
    tUsuario: TnxTable;
    tUsuarioUsername: TStringField;
    tUsuarioNome: TStringField;
    tUsuarioAdmin: TBooleanField;
    repCaixa: TfrxReport;
    tCaixaNomeLoja: TStringField;
    qPagEsp: TnxQuery;
    qPagEspTotalF: TCurrencyField;
    qPagEspTotalValor: TCurrencyField;
    qPagEspTotalTroco: TCurrencyField;
    qPagEspEspecie: TWordField;
    tEsp: TnxTable;
    tEspID: TWordField;
    tEspNome: TStringField;
    tEspImg: TWordField;
    qPagEspNomeEspecie: TStringField;
    qPagEspImg: TWordField;
    qPagEspObs: TStringField;
    dsPagEsp: TDataSource;
    frdbPagEsp: TfrxDBDataset;
    qRFPag: TnxQuery;
    qRFFatTipoTran: TWordField;
    qRFFatTipoItem: TWordField;
    qRFFatTotal: TCurrencyField;
    qRFFatDesconto: TCurrencyField;
    qRFPagTipoTran: TWordField;
    qRFPagTipoItem: TWordField;
    qRFPagTotal: TCurrencyField;
    qRFPagDesconto: TCurrencyField;
    qRFPagPago: TCurrencyField;
    qRFPagDebito: TCurrencyField;
    qFechaTroco: TCurrencyField;
    qCred: TnxQuery;
    qCredCredito: TCurrencyField;
    procedure qVCCalcFields(DataSet: TDataSet);
    procedure tMECalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure qFatPosCalcFields(DataSet: TDataSet);
    procedure mtEstCalcFields(DataSet: TDataSet);
    procedure repCaixaBeforePrint(Sender: TfrxReportComponent);
    procedure qRepTranCalcFields(DataSet: TDataSet);
    procedure tCaixaCalcFields(DataSet: TDataSet);
    procedure qPagEspCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    drf : Array[0..2] of TDadosResFin;
    CaixaI, 
    CaixaF: Integer;

    TemSupSan : Boolean;
    FImpTran : Boolean;
    TotalTroco : Currency;
    
    procedure AbreConn;
    function AbreCaixa(aFunc: String; aSaldo: Currency; aManterSaldo: Boolean; var aNumCx: Integer): Integer;
    function FechaCaixa(aFunc: String; aSaldo: Currency; aNumCx: Integer; aReproc: Boolean): Integer;
    
    function Processa(aID: Integer; aPeriodo: Boolean; aDataI, aDataF: TDateTime): Currency;
    procedure ExportaCaixa(aID: Integer; aArquivo: String);
    procedure ExportaCaixaKite(aID: Integer; aArquivo: String; slPar: tStrings);
    { Public declarations }
  end;

var
  dmCaixa: TdmCaixa;

implementation

uses
  ncClassesBase, ncErros, Graphics, ncDebug;

// START resource string wizard section

{$R *.dfm}

{ TdmCaixa }

resourcestring
  rsValorOriginal = 'Valor Original';
  rsTroco = 'Troco';


function InitTran(aDB: TnxDatabase;
                  const aTables : array of TnxTable;
                  aWith : Boolean): Boolean;
var I : Integer;
begin
  Result := False;
  if aDB.InTransaction then Exit;
  I := 10;
  while I > 0 do begin
    try
      if aWith then
        aDB.StartTransactionWith(aTables)
      else
        aDB.StartTransaction;
      I := 0;
    except
      Dec(I);
      Random(500);
    end
  end;
  Result := True;
end;


function TdmCaixa.AbreCaixa(aFunc: String; aSaldo: Currency; aManterSaldo: Boolean; var aNumCx: Integer): Integer;
var SaldoAnt: Currency;
begin
  tCaixa.Active := True;
  tTran.IndexName := 'IID'; // do not localize
  tTran.Open;
  tITran.Open;
  tImp.Open;
  InitTran(nxDB, [tCaixa, tImp, tTran, tITran], True);
  try
    tCaixa.IndexName := 'IAberto'; // do not localize
    try
      if tCaixa.FindKey([True]) then begin
        nxDB.Rollback;
        Result := ncerrJaTemCaixaAberto;
        Exit;
      end;
    finally
      tCaixa.IndexName := 'IID'; // do not localize
    end;

    
    if aManterSaldo then begin
      if tCaixa.IsEmpty then 
        SaldoAnt := 0 
      else begin
        tCaixa.Last;
        SaldoAnt := tCaixaTotalFinal.Value + tCaixaSaldoAnt.Value + tCaixaSupr.Value - tCaixaSangria.Value;
      end;
    end else
      SaldoAnt := aSaldo;
      
    tCaixa.Insert;
    tCaixaAbertura.Value := Now;
    tCaixaAberto.Value := True;
    tCaixaUsuario.Value := aFunc;
    if aManterSaldo or gConfig.PedirSaldoI then
      tCaixaSaldoAnt.Value := SaldoAnt;
      
    tCaixaEstSyncOk.Value := False;
    tCaixa.Post;
                                       
    aNumCx := tCaixaID.Value;
    Result := 0;

    tImp.IndexName := 'ICaixaID'; // do not localize
    while tImp.FindKey([0]) do begin
      tImp.Edit;
      if tImpx75.Value then
        tImpCaixa.Value := aNumCx else
        tImpCaixa.Value := -1;
      tImp.Post;

      if tImpx75.Value then
      if tTran.FindKey([tImpTran.Value]) and (tTranCaixa.Value=0) then begin
        if tTranCaixa.Value=0 then
        
        tTran.Edit;
        tTranCaixa.Value := aNumCx;
        tTran.Post;

        tITran.SetRange([tTranID.Value], [tTranID.Value]);
        try
          tITran.First;
          while not tITran.Eof do begin
            tITran.Edit;
            tITranCaixa.Value := aNumCx;
            tITran.Post;
            tITran.Next;
          end;
        finally
          tITran.CancelRange;
        end;
      end;
    end;
    nxDB.Commit;
  except
    on e: exception do begin
        nxDB.Rollback;
        Result := ncerrExcecaoNaoTratada_TdmCaixa_AbreCaixa;
        glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

procedure TdmCaixa.AbreConn;
begin
  nxDB.AliasPath := '';
  nxDB.AliasName := 'NexCafe'; // do not localize
  nxDB.Active := True;
  tCli.Open;
  tME.Open;
  tProd.Open;
  tCaixa.Open;
  tSessao.Open;
  tCriar.Open;
end;

procedure TdmCaixa.DataModuleCreate(Sender: TObject);
begin
  TemSupSan := False;
  FImpTran := False;
  TotalTroco := 0;
end;

procedure TdmCaixa.ExportaCaixa(aID: Integer; aArquivo: String);
begin
  ExportaCaixaKite(aID, aArquivo, nil);
end;

procedure TdmCaixa.ExportaCaixaKite(aID: Integer; aArquivo: String;
  slPar: tStrings);
var sIdent: String;  
begin
  DebugMsg('TdmCaixa.ExportaCaixa - aID: ' + IntToStr(aID) + ' - aArquivo: ' + aArquivo); // do not localize
  Processa(aID, False, 0, 0);
  DebugMsg('TdmCaixa.ExportaCaixa - 2'); // do not localize

  tUsuario.Active := True;

  if slPar<>nil then begin
    slPar.Add('timestamp_de_abertura='+formatDateTime('YYYY-MM-DD HH:NN:SS', tCaixaAbertura.Value)); // do not localize
    slPar.Add('timestamp_de_fechamento='+formatDateTime('YYYY-MM-DD HH:NN:SS', tCaixaFechamento.Value)); // do not localize
    slPar.Add('username_funcionario='+tCaixaUsuario.Value); // do not localize
    slPar.Add('numero_do_caxa='+tCaixaID.AsString); // do not localize
    slPar.Add('conta_da_loja='+gConfig.Conta); // do not localize
    if tUsuario.FindKey([tCaixaUsuario.Value]) then
      slPar.Add('nome_funcionario='+tUsuarioNome.Value) else // do not localize
      slPar.Add('nome_funcionario='); // do not localize
    if Trim(gConfig.EmailIdent)>'' then 
      sIdent:= gConfig.EmailIdent + ' - ' else
      sIdent:= '';
    slPar.Add('subject='+sIdent+'Caixa n.' + tCaixaID.AsString+ // do not localize
                           ' - ' + tCaixaAbertura.AsString + 
                           ' a ' + tCaixaFechamento.AsString);
    
  end;
  
  pdfExp.FileName := aArquivo;
  DebugMsg('TdmCaixa.ExportaCaixa - 3'); // do not localize
  pdfExp.DefaultPath := '';
  DebugMsg('TdmCaixa.ExportaCaixa - 4'); // do not localize
  
  repCaixa.PrepareReport;
  DebugMsg('TdmCaixa.ExportaCaixa - 5'); // do not localize
  repCaixa.Export(PDFexp);
  DebugMsg('TdmCaixa.ExportaCaixa - 6'); // do not localize
end;

function TdmCaixa.FechaCaixa(aFunc: String; aSaldo: Currency; aNumCx: Integer; aReproc: Boolean): Integer;
var 
  SAnt: Currency;
  SL : TStrings;
begin
  InitTran(nxDB, [], False);
  try
    tCaixa.IndexName := 'IID'; // do not localize
    if not tCaixa.FindKey([aNumCx]) then begin
      nxDB.Rollback;
      Result := ncerrItemInexistente;
      Exit;
    end;
    SAnt := 0;

    if aReproc then begin
      if tCaixaAberto.Value then begin
        nxDB.Rollback;
        Raise ENexCafe.Create(SncDMCaixa_OReprocessamentoDeCaixaSÛPodeSer);
      end;
      if gConfig.ManterSaldoCaixa then begin
        tCaixa.Prior;
        if (tCaixaID.Value < aNumCx) then
        if not tCaixaSaldoF.IsNull then
          SAnt := tCaixaSaldoF.Value else
          SAnt := tCaixaTotalFinal.Value + tCaixaSaldoAnt.Value + tCaixaSupr.Value - tCaixaSangria.Value;
        tCaixa.FindKey([aNumCx]);
      end else
        SAnt := tCaixaSaldoAnt.Value;
    end else
    if not tCaixaAberto.Value then begin
      nxDB.Rollback;
      Result := ncerrCaixaJaFoiFechado;
      Exit;
    end;

    if not aReproc then
    if tSessao.FindKey([True, 0]) then begin
      nxDB.Rollback;
      Result := ncerrAguardaPagto;
      Exit;
    end;

    if aReproc then begin
      qCorr.Active := False;
      qCorr.ParamByName('Caixa').AsInteger := aNumCx; // do not localize
      qCorr.ExecSQL;

      qCorr2.Active := False;
      qCorr2.SQL.Text := 'update itran '+ // do not localize
                         'set caixa = ' + IntToStr(aNumCx) + // do not localize
                         ' where tran in (select id from tran where caixa = ' + IntToStr(aNumCx) +')'; // do not localize
      qCorr2.ExecSQL;     

      qCorr2.Active := False;
      qCorr2.SQL.Text := 'update movest '+ // do not localize
                         'set caixa = ' + IntToStr(aNumCx) + // do not localize
                         ' where tran in (select id from tran where caixa = ' + IntToStr(aNumCx) +')'; // do not localize
      qCorr2.ExecSQL;                         
    end;

    qFecha.ParamByName('Caixa').AsInteger := aNumCx; // do not localize

    qFecha.Active := True;
    tCaixa.Edit;
    tCaixaCancelamentos.Value := 0;
    tCaixaDescontos.Value := 0;
    tCaixaTotalFinal.Value := 0;
    tCaixaSangria.Value := 0;
    tCaixaSupr.Value := 0;
    qEstSearchPag.Params[0].Value := aNumCx;
    qEstSearchQtd.Params[0].Value := aNumCx;
    qEstUrl.Params[0].Value := aNumCx;
    qEstSessoes.Params[0].Value := aNumCx;
    try
      qEstSearchPag.Active := True;
      qEstSearchQtd.Active := True;
      qEstUrl.Active := True;
      qEstSessoes.Active := True;
      qEstRes.Active := True;
      SL := TStringList.Create;
      try
        qEstSearchPag.First;
        while not qEstSearchPag.Eof do begin
          SL.Values['p_'+qEstSearchPagSearchEng.Value] := IntToStr(qEstSearchPagQtd.Value);
          qEstSearchPag.Next;
        end;

        qEstSearchQtd.First;
        while not qEstSearchQtd.Eof do begin
          SL.Values['q_'+qEstSearchQtdSearchEng.Value] := IntToStr(qEstSearchQtdQtd.Value);
          qEstSearchQtd.Next;
        end;

        tCaixaEstBuscasEng.Value := SL.Text;

        SL.Text := '';
        qEstRes.First;
        while not qEstRes.Eof do begin
          SL.Values[qEstResDisplayWH.Value] := IntToStr(qEstResQtd.Value);
          qEstRes.Next;
        end;
        tCaixaEstUrls.Value := qEstUrlQtd.Value;
        tCaixaEstRes.Value := SL.Text;
        tCaixaEstSessoesQtd.Value := qEstSessoesQtd.Value;
        tCaixaEstSessoesTempo.Value := qEstSessoesTempo.Value;
      finally
        SL.Free;
      end;
    finally
      qEstSearchPag.Active := False;
      qEstSearchQtd.Active := False;
      qEstUrl.Active := False;
      qEstSessoes.Active := False;
      qEstRes.Active := False;
    end;
    
    
    if aReproc then
      tCaixaSaldoAnt.Value := SAnt;
      
    while not qFecha.Eof do begin
      if qFechaCancelado.Value then
        tCaixaCancelamentos.Value := tCaixaCancelamentos.Value + qFechaTotal.Value 
      else 
      case qFechaTipo.Value of
        trCaixaEnt : tCaixaSupr.Value := tCaixaSupr.Value + qFechaTotal.Value;
        trCaixaSai : tCaixaSangria.Value := tCaixaSangria.Value + qFechaTotal.Value;
        trEstCompra,
        trEstSaida,
        trEstEntrada,
        trCorrDataCx : ;
      else  
        tCaixaTotalFinal.Value := tCaixaTotalFinal.Value + (qFechaPago.Value-qFechaTroco.Value);
      end;
      tCaixaDescontos.Value := tCaixaDescontos.Value + qFechaDesconto.Value;
      qFecha.Next;
    end;
    tCaixaAberto.Value := False;
    if aReproc then
      tCaixaReproc.Value := Now else
      tCaixaFechamento.Value := Now;
    tCaixaEstSyncOk.Value := True;  
    if gConfig.PedirSaldoF then begin
      if (not aReproc) then
        tCaixaSaldoF.Value := aSaldo;
      tCaixaQuebra.Value := 
        tCaixaSaldoF.Value - 
        (tCaixaTotalFinal.Value + tCaixaSaldoAnt.Value + tCaixaSupr.Value - tCaixaSangria.Value);
    end;
      
    tCaixa.Post;
    Result := 0;
    nxDB.Commit;
  except
    on e: exception do begin
       nxDB.Rollback;
       Result := ncerrExcecaoNaoTratada_TdmCaixa_FechaCaixa;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

procedure TdmCaixa.mtEstCalcFields(DataSet: TDataSet);
begin
  mtEstEntradasTot.Value := mtEstEntradas.Value + mtEstCompras.Value;
end;

function V2Casas(C: Currency): Currency;
begin
  Result := Int(C * 100) / 100;
end;

function TdmCaixa.Processa(aID: Integer; aPeriodo: Boolean; aDataI, aDataF: TDateTime): Currency;
var
  Q: TnxQuery;
  I, Num, IDCli : Integer;
  CustoU, TotFinal, PercDesc, Desc, DescT : Double;
  drf : Array[0..2] of TDadosResFin;
  S: String;
  Incluir: Boolean;
  PagDet, PagReg : Integer;
  ValorI : Currency;
  qItem: Integer;
  Data: TDateTime;
  SaldoI : Double;
const
  drfSessao = 0;
  drfVendas = 1;
  drfImp    = 2;

function QImp(Index: Integer): Integer;
begin
  case Index of
     1 : Result := tImpQ1.Value;
     2 : Result := tImpQ2.Value;
     3 : Result := tImpQ3.Value;
     4 : Result := tImpQ4.Value;
     5 : Result := tImpQ5.Value;
     6 : Result := tImpQ6.Value;
     7 : Result := tImpQ7.Value;
     8 : Result := tImpQ8.Value;
     9 : Result := tImpQ9.Value;
    10 : Result := tImpQ10.Value;
  else
    Result := 0;  
  end;
end;

function ValorImp(Index: Integer): Currency;
begin
  case Index of
     1 : Result := tImpV1.Value * tImpQ1.Value;
     2 : Result := tImpV2.Value * tImpQ2.Value;
     3 : Result := tImpV3.Value * tImpQ3.Value;
     4 : Result := tImpV4.Value * tImpQ4.Value;
     5 : Result := tImpV5.Value * tImpQ5.Value;
     6 : Result := tImpV6.Value * tImpQ6.Value;
     7 : Result := tImpV7.Value * tImpQ7.Value;
     8 : Result := tImpV8.Value * tImpQ8.Value;
     9 : Result := tImpV9.Value * tImpQ9.Value;
    10 : Result := tImpV10.Value * tImpQ10.Value;
  else
    Result := 0;  
  end;
end;

function UltimoImp(Index: Integer): Boolean;
var
   ind: Integer;
begin
  for ind := Index+1 to 10 do
  if QImp(Ind)>0 then begin
    Result := False;
    Exit;
  end;
  Result := True;
end;

begin
  Result := 0;
  CaixaI := 0;
  CaixaF := 0;
  qVC.Active := False;
  qManut.Active := False;
  qGratis.Active := False;
  qSS.Active := False;
  qDesc.Active := False;
  qCanc.Active := False;
  qRFFat.Active := False;
  qRFPag.Active := False;
  qSessao.Active := False;
  qFatPre.Active := False;
  qFatPos.Active := False;
//  qCliValor.Active := False;
  
  mtEst.Active := False;
  mtEst.Active := True;

  mtTot.Active := False;
  mtTot.Active := True;

  mtFatPrePos.Active := False;
  mtFatPrePos.Active := True;
  
  FillChar(drf, SizeOf(drf), 0);
  Num := aID;

  if aPeriodo then begin
    Q := TnxQuery.Create(Self);
    try
      Q.Database := nxDB;
      Q.SQL.Add('SELECT MIN(ID) as CaixaI, MAX(ID) as CaixaF FROM CAIXA'); // do not localize
      Q.SQL.Add('WHERE (Abertura >= TIMESTAMP ' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', aDataI))+') AND ' + // do not localize
                '      (Abertura <  TIMESTAMP ' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', aDataF+1))+') AND (Aberto = False)'); // do not localize
      Q.Open;
      CaixaI := Q.FieldByName('CaixaI').AsInteger; // do not localize
      CaixaF := Q.FieldByName('CaixaF').AsInteger; // do not localize
    finally
      Q.Free;
    end;
  end;

  if Num > 0 then begin
    tCaixa.Locate('ID', Num, []); // do not localize
    CaixaI := Num;
    CaixaF := Num;
  end;

  tRepProd.Open;
  tRepProd.SetRange([True], [True]);

  qRepTran.Active := False;
  qRepTran.SQL.Text := 'select * from Tran'; // do not localize

  if gConfig.cce(cceTransacoesCanc) then
    S := '(Cancelado=True)' else // do not localize
    S := '';

  if gConfig.cce(cceTransacoesDesc) then
    if S>'' then
      S := '(Cancelado=True) or (Desconto>0)' else // do not localize
      S := '(Desconto>0)'; // do not localize

  if gConfig.cce(cceTransacoesObs) then
    if S>'' then
      S := S + ' or (Trim(Obs)>'+QuotedStr('')+')' else // do not localize
      S := '(Trim(Obs)>'+QuotedStr('')+')'; // do not localize

  if (gConfig.EmailEnviarCaixa) and (S>'') then begin
    FImpTran := True;
    S := 'where (Caixa='+IntToStr(CaixaI)+') and ('+S+') order by ID'; // do not localize
    qRepTran.SQL.Text := 'select * from Tran ' + S; // do not localize
    qRepTran.Open;    
  end else begin
//    qRepTran.Open;
    FImpTran := False;
  end;
  qSessao.Params[0].AsInteger := CaixaI;
  qSessao.Params[1].AsInteger := CaixaF;
{  qSessao.Params[2].AsInteger := CaixaI;
  qSessao.Params[3].AsInteger := CaixaF; }
  dsSessao.DataSet := nil;
  try
    qSessao.Open;
  finally
    dsSessao.Dataset := qSessao;
  end;

  qFatPre.Params[0].AsInteger := CaixaI;
  qFatPre.Params[1].AsInteger := CaixaF;

  qFatPos.Params[0].AsInteger := CaixaI;
  qFatPos.Params[1].AsInteger := CaixaF;

  qPagEsp.Active := False;
  qPagEsp.Params[0].AsInteger := CaixaI;
  qPagEsp.Params[1].AsInteger := CaixaF;
  qPagEsp.Active := True;
  qPagEsp.First;
  TotalTroco := 0;
  while not qPagEsp.Eof do begin
    TotalTroco := TotalTroco + qPagEspTotalTroco.Value;
    qPagEsp.Next;
  end;
  qPagEsp.First;

  qRFFat.ParamByName('CaixaI').AsInteger := CaixaI; // do not localize
  qRFFat.ParamByName('CaixaF').AsInteger := CaixaF; // do not localize
  qRFFat.Active := True;
  qRFFat.First;

  qRFPag.ParamByName('CaixaI').AsInteger := CaixaI; // do not localize
  qRFPag.ParamByName('CaixaF').AsInteger := CaixaF; // do not localize
  qRFPag.Active := True;
  qRFPag.First;

  qCred.ParamByName('CaixaI').AsInteger := CaixaI; // do not localize
  qCred.ParamByName('CaixaF').AsInteger := CaixaF; // do not localize
  qCred.Active := True;
  
  while not qRFFat.Eof do begin
    case qRFFatTipoItem.Value of
      itSessao, itTempo : I := drfSessao;
      itMovEst          : I := drfVendas;
      itImpressao       : I := drfImp;
    else
      I := -1;  
    end;
    if (I>=0) then
    if (qRFFatTipoTran.Value <> trEstCompra) and (qRFFatTipoTran.Value <> trPagDebito) then begin
      if (qRFFatTipoItem.Value=itSessao) or (qRFFatTipoTran.Value<>trFimSessao) then
        drf[I].rfFaturamento := 
          drf[I].rfFaturamento +
          (qRFFatTotal.Value - qRFFatDesconto.Value);
    end;
      
    qRFFat.Next;
  end;

  while not qRFPag.Eof do begin
    case qRFPagTipoItem.Value of
      itSessao, itTempo : I := drfSessao;
      itMovEst          : I := drfVendas;
      itImpressao       : I := drfImp;
    else
      I := -1;  
    end;
    if (I>=0) then
    if qRFPagTipoTran.Value = trPagDebito then
      drf[I].rfPgDebito := drf[I].rfPgDebito + qRFPagPago.Value
    else 
    if qRFPagTipoTran.Value <> trEstCompra then begin
      drf[I].rfRecebido := drf[I].rfRecebido + qRFPagPago.Value;
      drf[I].rfDebitado := drf[I].rfDebitado + qRFPagDebito.Value;
    end;
      
    qRFPag.Next;
  end;
  
  dsEst.Dataset := nil;
  try
    tProd.First;
    while not tProd.Eof do begin
      tME.SetRange([tProdID.Value, CaixaI], [tProdID.Value, CaixaF]);
      if not (tME.Eof and tME.Bof) then begin
        Data := 0;
        SaldoI := 0;
        mtEst.Append;
        mtEstID.Value := tProdID.Value;
        mtEstDescricao.Value := tProdDescricao.Value;
        tME.First;
        while not tME.Eof do begin
          if (Data=0) or (tMEDataHora.Value<Data) then  begin
            Data := tMEDataHora.Value;
            SaldoI := tMEEstoqueAnt.Value;
          end;
          case tMETipoTran.Value of
            trEstCompra  : mtEstCompras.Value := mtEstCompras.Value + tMEQuant.Value;
            trEstEntrada : mtEstEntradas.Value := mtEstEntradas.Value + tMEQuant.Value;
            trEstSaida   : mtEstSaidas.Value := mtEstSaidas.Value + tMEQuant.Value;
          else
            if tMEFidResgate.Value then begin
              mtEstFidResg.Value := mtEstFidResg.Value + tMEQuant.Value;
            end else begin
              mtEstVendas.Value := mtEstVendas.Value + tMEQuant.Value;
              mtEstValorVendas.Value := mtEstValorVendas.Value + tMETotal.Value - tMEDesconto.Value;
              CustoU := tMECustoU.Value;
              if (CustoU < 0.00009) then
                CustoU := tProdCustoUnitario.Value;
              mtEstLucro.Value := mtEstLucro.Value + (tMETotal.Value - (CustoU * tMEQuant.Value) - tMEDesconto.Value);
            end;
          end;
          tME.Next;
        end;
        mtEstSaldoInicial.Value := SaldoI;
        mtEstSaldoFinal.Value := tMESaldoFinal.Value;  
        mtEst.Post;
      end;
      tProd.Next;
    end;
  finally
    dsEst.Dataset := mtEst;
  end;

  PagDet := 0;
  PagReg := 0;
  ValorI := 0;
  mtImp.DisableControls;
  dsImp.Dataset := nil;
  try
    {$IFNDEF LOJA}
    tTipoImp.Active := True;
    mtImp.Active := True;
    mtImp.EmptyTable;
    tImp.Active := True;
    tImp.SetRange([CaixaI], [CaixaF]);
    tImp.First;
    while not tImp.Eof do begin
      if not tImpCancelado.Value then begin
        if (tImpDesconto.Value > 0.009) and (tImpTotal.Value>0.009) then begin
          DescT := tImpDesconto.Value;
          PercDesc := tImpDesconto.Value / tImpTotal.Value;
        end else begin
          PercDesc := 0;
          DescT := 0;
        end;
        
        if not tImpManual.Value then
          PagDet := PagDet + tImpPaginas.Value;
        
        for I := 1 to 10 do 
        if QImp(I)>0 then begin
          if mtImp.Locate('TipoImp', I, []) then  // do not localize
            mtImp.Edit
          else begin
            mtImp.Insert;
            mtImpTipoImp.Value := I;  
            mtImpNomeTipoImp.AsVariant := tTipoImp.Lookup('ID', I, 'Nome'); // do not localize
          end;
          mtImpQuant.Value := mtImpQuant.Value + QImp(I);
          if UltimoImp(I) then begin
            mtImpValor.Value := mtImpValor.Value + ValorImp(I) - DescT;
            DescT := 0;
          end else
          if DescT>0.009 then begin
            Desc := V2Casas(ValorImp(I) * PercDesc);
            mtImpValor.Value := mtImpValor.Value + ValorImp(I) - Desc;
            DescT := DescT - Desc;
          end else
            mtImpValor.Value := mtImpValor.Value + ValorImp(I);

          ValorI := ValorI + (tImpTotal.Value - tImpDesconto.Value);
          PagReg := PagReg + QImp(I);
          mtImp.Post;
        end;
      end;
      tImp.Next;
    end;
    
  finally
    mtImp.EnableControls;
    dsImp.DataSet := mtImp;
  end;

  if mtImp.RecordCount>1 then begin
    mtImp.Insert;
    mtImpTipoImp.Value := 11;
    mtImpNomeTipoImp.Value := SncDMCaixa_TOTAL;
    mtImpValor.Value := ValorI;
    mtImpQuant.Value := PagReg;
    mtImp.Post;
  end;

  if mtImp.RecordCount>0 then begin
    mtImp.Insert;
    mtImpTipoImp.Value := 12;
    mtImpNomeTipoImp.Value := SncDMCaixa_P¡GINASDETECTADASAUTOMATICAMENTE;
    mtImpQuant.Value := PagDet;
    mtImp.Post;
  end;

  mtImp.First;
  {$ENDIF}


  mtTot.Open;
  mtTot.EmptyTable;
  mtTot.Append;
  mtTotItem.Value := 1;
  mtTotDescricao.Value := SncDMCaixa_Acessos;
  mtTotFaturamento.Value := drf[drfSessao].rfFaturamento;
  mtTotDebitado.Value := drf[drfSessao].rfDebitado;
  mtTotPgDebito.Value := drf[drfSessao].rfPgDebito;
  mtTotRecebido.Value := drf[drfSessao].rfRecebido;
  mtTotTotal.Value := drf[drfSessao].rfRecebido + drf[drfSessao].rfPgDebito;
  mtTot.Post;

  mtTot.Open;
  mtTot.Append;
  mtTotItem.Value := 2;
  mtTotDescricao.Value := SncDMCaixa_Vendas;
  mtTotFaturamento.Value := drf[drfVendas].rfFaturamento;
  mtTotDebitado.Value := drf[drfVendas].rfDebitado;
  mtTotPgDebito.Value := drf[drfVendas].rfPgDebito;
  mtTotRecebido.Value := drf[drfVendas].rfRecebido;
  mtTotTotal.Value := drf[drfVendas].rfRecebido + drf[drfVendas].rfPgDebito;
  mtTot.Post;

  qItem := 3;
  {$IFNDEF LOJA}
  mtTot.Open;
  mtTot.Append;
  mtTotItem.Value := qItem;
  mtTotDescricao.Value := SncDMCaixa_Impressıes;
  mtTotFaturamento.Value := drf[drfImp].rfFaturamento;
  mtTotDebitado.Value := drf[drfImp].rfDebitado;
  mtTotPgDebito.Value := drf[drfImp].rfPgDebito;
  mtTotRecebido.Value := drf[drfImp].rfRecebido;
  mtTotTotal.Value := drf[drfImp].rfRecebido + drf[drfImp].rfPgDebito;
  mtTot.Post;
  inc(qItem);
  {$ENDIF}

  mtTot.Open;
  mtTot.Append;
  mtTotItem.Value := qItem;
  mtTotDescricao.Value := SncDMCaixa_TotalDoCaixa;


  mtTotFaturamento.Value := 
    drf[drfVendas].rfFaturamento +
    drf[drfSessao].rfFaturamento +
    drf[drfImp].rfFaturamento;
    
  mtTotDebitado.Value := 
    drf[drfVendas].rfDebitado +
    drf[drfSessao].rfDebitado +
    drf[drfImp].rfDebitado;
    
  mtTotPgDebito.Value := 
    drf[drfVendas].rfPgDebito +
   drf[drfSessao].rfPgDebito +
    drf[drfImp].rfPgDebito;
    
  mtTotRecebido.Value := 
    drf[drfVendas].rfRecebido +
    drf[drfSessao].rfRecebido +
    drf[drfImp].rfRecebido;
    
  mtTotTotal.Value := 
    drf[drfVendas].rfRecebido + drf[drfVendas].rfPgDebito +
    drf[drfSessao].rfRecebido + drf[drfSessao].rfPgDebito +
    drf[drfImp   ].rfRecebido + drf[drfImp   ].rfPgDebito;
    
  TotFinal := mtTotTotal.Value;  
  mtTot.Post;

  qSS.ParamByName('CaixaI').AsInteger := CaixaI; // do not localize
  qSS.ParamByName('CaixaF').AsInteger := CaixaF; // do not localize
  qSS.Active := True;

  qCanc.ParamByName('CaixaI').AsInteger := CaixaI; // do not localize
  qCanc.ParamByName('CaixaF').AsInteger := CaixaF; // do not localize
  
  qCanc.Active := True;

  qDesc.ParamByName('CaixaI').AsInteger := CaixaI; // do not localize
  qDesc.ParamByName('CaixaF').AsInteger := CaixaF; // do not localize
  qDesc.Active := True;

  qManut.ParamByName('CaixaI').AsInteger := CaixaI; // do not localize
  qManut.ParamByName('CaixaF').AsInteger := CaixaF; // do not localize
  qManut.Active := True;

  qVC.ParamByName('CaixaI').AsInteger := CaixaI; // do not localize
  qVC.ParamByName('CaixaF').AsInteger := CaixaF; // do not localize
  
  qVC.Active := True;

  qGratis.ParamByName('CaixaI').AsInteger := CaixaI; // do not localize
  qGratis.ParamByName('CaixaF').AsInteger := CaixaF; // do not localize
  qGratis.Active := True;

  qFatPre.Active := True;

  qFatPos.Active := True;
  
  mtFatPrePos.Append;
  mtFatPrePosTipo.Value := SncDMCaixa_PÛsPago;
  mtFatPrePosQuant.Value := qFatPosQuant.Value;
  mtFatPrePosValor.Value := qFatPosValor.Value;
  mtFatPrePos.Post;

  tPacote.Active := True;
  tTipoPass.Active := True;

  qFatPre.First;
  while not qFatPre.Eof do begin
    Incluir := True;
    case qFatPreTipo.Value of
      tctAvulso : S := SncDMCaixa_CrÈditoDeTempoAvulso;
      tctPacote : 
        if tPacote.FindKey([qFatPreIDPacPass.Value]) then
          S := tPacoteDescr.Value else
          S := SncDMCaixa_PacoteN„oExisteMais;
      tctCartaoTempo : 
        if tTipoPass.FindKey([qFatPreIDPacPass.Value]) then
          S := SncDMCaixa_Cart„oDeTempo+tTipoPassNome.Value else
          S := SncDMCaixa_Cart„oDeTempoN„oExisteMais;
      tctPassaporte :
        if tTipoPass.FindKey([qFatPreIDPacPass.Value]) then
          S := tTipoPassNome.Value else
          S := SncDMCaixa_PassaporteN„oExisteMais;
    else
      Incluir := False; 
    end;
    if Incluir then begin
      mtFatPrePos.Append;
      mtFatPrePosTipo.Value := S;
      mtFatPrePosQuant.Value := qFatPreQuant.Value;
      mtFatPrePosValor.Value := qFatPreValor.Value;
      mtFatPrePos.Post;
    end;
    qFatPre.Next;
  end;

  TemSupSan := False;
  
  if not aPeriodo then begin
    mtTot.Append;
    mtTotItem.Value := 5;
    mtTotDescricao.Value := SncDMCaixa_SaldoInicial;
    mtTotTotal.Value := tCaixaSaldoAnt.Value;
    TotFinal := TotFinal + mtTotTotal.Value;
    if mtTotTotal.Value>0.0009 then
      TemSupSan := True;
    mtTot.Post;
  end;
  
  mtTot.Append;
  mtTotItem.Value := 6;
  mtTotDescricao.Value := SncDMCaixa_DinheiroAdicionado;
  mtTotTotal.AsVariant := qSS.Lookup('Tipo', trCaixaEnt, 'Total'); // do not localize
  if mtTotTotal.IsNull then
    mtTotTotal.Value := 0;
  TotFinal := TotFinal + mtTotTotal.Value;

  if mtTotTotal.Value>0.0009 then
    TemSupSan := True;

  mtTot.Post;

  mtTot.Append;
  mtTotItem.Value := 7;
  mtTotDescricao.Value := SncDMCaixa_DinheiroRetirado;
  mtTotTotal.AsVariant := qSS.Lookup('Tipo', trCaixaSai, 'Total'); // do not localize
  if mtTotTotal.IsNull then
    mtTotTotal.Value := 0;
    
  TotFinal := TotFinal - mtTotTotal.Value;
  if mtTotTotal.Value>0.0009 then
    TemSupSan := True;
  mtTot.Post;

  if qCredCredito.Value>0.001 then begin
    mtTot.Append;
    mtTotItem.Value := 8;
    mtTotDescricao.Value := 'Troco creditado em conta';
    mtTotTotal.AsVariant := qCredCredito.Value; // do not localize
    if mtTotTotal.IsNull then
      mtTotTotal.Value := 0;
    TotFinal := TotFinal + qCredCredito.Value;
    mtTot.Post;
  end;

  mtTot.Append;
  mtTotItem.Value := 9;
  mtTotDescricao.Value := SncDMCaixa_SaldoFinal;
  mtTotTotal.Value := TotFinal;
  mtTot.Post;

  if (not aPeriodo) and  (not tCaixaAberto.Value) and gConfig.PedirSaldoF then begin
    mtTot.Append;
    mtTotItem.Value := 10;
    mtTotDescricao.Value := SncDMCaixa_SaldoInformado;
    mtTotTotal.Value := tCaixaSaldoF.Value;

    if Abs(tCaixaQuebra.Value)>0.009 then begin
      mtTot.Append;
      mtTotItem.Value := 10;
      mtTotDescricao.Value := SncDMCaixa_QuebraDeCaixa;
      mtTotTotal.Value := tCaixaQuebra.Value;
    end;
  end;

  Result := TotFinal;

{  mtTot.Append;
  mtTotItem.Value := 9;
  mtTotDescricao.Value := '';
  mtTot.Post;}

  if qDescQuant.Value>0 then begin
    mtTot.Append;
    mtTotItem.Value := 11;
    mtTotDescricao.Value := qDescQuant.AsString + SncDMCaixa_DescontoS;
    mtTotTotal.Value := qDescTotal.Value;
    mtTot.Post;
  end;

  if qCancQuant.Value>0 then begin
    mtTot.Append;
    mtTotItem.Value := 12;
    mtTotDescricao.Value := qCancQuant.AsString + SncDMCaixa_CancelamentoS;
    mtTotTotal.Value := qCancTotal.Value;
    mtTot.Post;
  end;

end;

procedure TdmCaixa.qFatPosCalcFields(DataSet: TDataSet);
begin
  qFatPosQuant.Value := 1;
end;

procedure TdmCaixa.qPagEspCalcFields(DataSet: TDataSet);
begin
  if (qPagEspEspecie.Value=1) then begin
    qPagEspTotalF.Value := qPagEspTotalValor.Value - TotalTroco;
    qPagEspObs.Value := rsValorOriginal + '=' + CurrencyToStr(qPagEspTotalValor.Value) + ' - ' + 
                        rsTroco + '=' + CurrencyToStr(TotalTroco);
  end else
    qPagEspTotalF.Value := qPagEspTotalValor.Value;
end;

procedure TdmCaixa.qRepTranCalcFields(DataSet: TDataSet);
const BoolStr : Array[Boolean] of String[3] = ('N„o', 'Sim');
begin
  if qRepTranTipo.Value in [trInicioSessao..trAjustaFid] then
    qRepTranNomeTipo.Value := StTipoTransacao[qRepTranTipo.Value];
  qRepTranCancFid.Value := BoolStr[qRepTranCancelado.Value] + ' / ' + BoolStr[qRepTranFidResgate.Value];
end;

procedure TdmCaixa.qVCCalcFields(DataSet: TDataSet);
begin
  qVCTotFinal.Value := qVCTotal.Value - qVCDesconto.Value;
end;

procedure TdmCaixa.repCaixaBeforePrint(Sender: TfrxReportComponent);
begin
  if SameText(Sender.Name, 'srTran') then // do not localize
    Sender.Visible := FImpTran;

  if SameText(Sender.Name, 'srImpressoes') then // do not localize
    Sender.Visible := gConfig.cce(cceImpressoes);

  if SameText(Sender.Name, 'srMovEstoque') then // do not localize
    Sender.Visible := gConfig.cce(cceMovEstoque);

  if SameText(Sender.Name, 'srResumoFin') then // do not localize
    Sender.Visible := gConfig.cce(cceResumoFin);

  if SameText(Sender.Name, 'srEstoqueAbaixoMin') then // do not localize
    Sender.Visible := gConfig.cce(cceEstoqueAbaixoMin); 

  if SameText(Sender.Name, 'srPagEsp') then // do not localize
    Sender.Visible := gConfig.cce(ccePagEsp);  

  if SameText(Sender.Name, 'Footer2') then // do not localize
    Sender.Visible := (Trim(tCaixaObs.Value)>'');
end;

procedure TdmCaixa.tCaixaCalcFields(DataSet: TDataSet);
begin
  tCaixaNomeLoja.Value := gConfig.EmailIdent;
end;

procedure TdmCaixa.tMECalcFields(DataSet: TDataSet);
begin
  if tMENaoControlaEstoque.Value then
    tMESaldoFinal.Value := 0 else
  if tMECancelado.Value then
    tMESaldoFinal.Value := tMEEstoqueAnt.Value
  else
  if tMEEntrada.Value then
    tMESaldoFinal.Value := tMEEstoqueAnt.Value + tMEQuant.Value else
    tMESaldoFinal.Value := tMEEstoqueAnt.Value - tMEQuant.Value; 
end;

end.

