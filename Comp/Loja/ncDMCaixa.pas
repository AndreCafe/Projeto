{$I NEX.INC}

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
    drfQtd : Integer;
    drfValor : Currency;
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
    mtTotValor: TCurrencyField;
    tProdID: TAutoIncField;
    mtEstID: TIntegerField;
    tProdCustoUnitario: TCurrencyField;
    tProdNaoControlaEstoque: TBooleanField;
    qRFFat: TnxQuery;
    qDesc: TnxQuery;
    qCanc: TnxQuery;
    tCli: TnxTable;
    qVCCategoria: TStringField;
    qVCTotal: TCurrencyField;
    qVCDesconto: TCurrencyField;
    qVCTotFinal: TCurrencyField;
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
    tCaixaReproc: TDateTimeField;
    qCorr: TnxQuery;
    qCorr2: TnxQuery;
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
    mtEstFidResg: TFloatField;
    tMEFidResgate: TBooleanField;
    tMEFidPontos: TFloatField;
    tCaixaEstSessoesQtd: TIntegerField;
    tCaixaEstSessoesTempo: TFloatField;
    tCaixaEstUrls: TIntegerField;
    tCaixaEstSyncOk: TBooleanField;
    tCaixaEstBuscasEng: TMemoField;
    tCaixaEstRes: TMemoField;
    qCancQuant: TLargeintField;
    qCancTotal: TCurrencyField;
    qDescQuant: TLargeintField;
    qDescTotal: TCurrencyField;
    tCaixaSaldoF: TCurrencyField;
    tCaixaQuebra: TCurrencyField;
    frdbEst: TfrxDBDataset;
    mtEstEntradasTot: TFloatField;
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
    qFechaTroco: TCurrencyField;
    qRFPag: TnxQuery;
    qRFPagCredito: TCurrencyField;
    qRFPagDebito: TCurrencyField;
    qRFPagTipo: TWordField;
    qRFPagQtd: TLargeintField;
    qRFPagCreditoUsado: TCurrencyField;
    qRFPagPago: TCurrencyField;
    qRFFatTipo: TWordField;
    qRFFatQtd: TLargeintField;
    qRFFatTotLiq: TCurrencyField;
    mtRF1: TkbmMemTable;
    mtRF1Item: TIntegerField;
    mtRF1Descricao: TStringField;
    mtRF1Total: TCurrencyField;
    dsRF1: TDataSource;
    mtRF2: TkbmMemTable;
    mtRF2Item: TIntegerField;
    mtRF2Descricao: TStringField;
    mtRF2Total: TCurrencyField;
    dsRF2: TDataSource;
    mtRF3: TkbmMemTable;
    mtRF3Item: TIntegerField;
    mtRF3Descricao: TStringField;
    mtRF3Total: TCurrencyField;
    dsRF3: TDataSource;
    dbRF1: TfrxDBDataset;
    dbRF2: TfrxDBDataset;
    dbRF3: TfrxDBDataset;
    mtRF1Bold: TBooleanField;
    mtRF1Cor: TIntegerField;
    mtRF2Bold: TBooleanField;
    mtRF2Cor: TIntegerField;
    mtRF3Bold: TBooleanField;
    mtRF3Cor: TIntegerField;
    mtObs: TkbmMemTable;
    mtObsObs: TMemoField;
    dbObs: TfrxDBDataset;
    qRFPagTroco: TCurrencyField;
    procedure qVCCalcFields(DataSet: TDataSet);
    procedure tMECalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure mtEstCalcFields(DataSet: TDataSet);
    procedure repCaixaBeforePrint(Sender: TfrxReportComponent);
    procedure qRepTranCalcFields(DataSet: TDataSet);
    procedure tCaixaCalcFields(DataSet: TDataSet);
    procedure qPagEspCalcFields(DataSet: TDataSet);
    procedure mtRF1CalcFields(DataSet: TDataSet);
    procedure mtRF2CalcFields(DataSet: TDataSet);
    procedure mtRF3CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure AddItemRF(aItem: Integer; aDescr: String; aValor: Currency; aAddZero: Boolean = True);
  public
    drf : Array[1..16] of TDadosResFin;
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

const
  irfFaturamento    = 1;
  irfDebitado       = 2;
  irfCredUsado      = 3;
  irfDescontos      = 4;
  irfCancelamentos  = 5;
  irfVendasRec      = 6;
  irfDebPagos       = 7;
  irfTrocoCred      = 8;
  irfTotalRec       = 9;
  irfSaldoInicial   = 10;
  irfTotalRec2      = 11;
  irfDinAdd         = 12;
  irfDinRem         = 13;
  irfSaldoFinal     = 14;
  irfSaldoInformado = 15;
  irfQuebraCaixa    = 16;  

implementation

uses
  ncClassesBase, ncErros, Graphics, ncDebug;

// START resource string wizard section

{$R *.dfm}

resourcestring
  rsValorOriginal = 'Valor Original';
  rsTroco = 'Troco';


function InitTran(aDB: TnxDatabase;
                  const aTables : array of TnxTable;
                  aWith : Boolean): Boolean;
var I : Integer;
begin
  Result := False;
  if aDB.InTransaction then Exit;                                                      I := 10;
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
  InitTran(nxDB, [tCaixa, tTran, tITran], True);
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
  tCriar.Open;
end;

procedure TdmCaixa.AddItemRF(aItem: Integer; aDescr: String; aValor: Currency; aAddZero: Boolean = True);
begin
  if (aValor<0.01) and (not aAddZero) then Exit;

  mtTot.Append;
  mtTotDescricao.Value := aDescr;
  if aItem<>99 then
    mtTotValor.Value := aValor;
  mtTotItem.Value := aItem;
  mtTot.Post;

  if (aItem<>99) then 
  case aItem of
    irfFaturamento..irfCancelamentos: begin
      mtRF1.Append;
      mtRF1Descricao.Value := aDescr;
      mtRF1Total.Value := aValor;
      mtRF1Item.Value := aItem;
      mtRF1.Post
    end;

    irfVendasRec..irfTotalRec: begin
      mtRF2.Append;
      mtRF2Descricao.Value := aDescr;
      mtRF2Total.Value := aValor;
      mtRF2Item.Value := aItem;
      mtRF2.Post
    end;  

    irfSaldoInicial..irfQuebraCaixa: begin
      mtRF3.Append;
      mtRF3Descricao.Value := aDescr;
      mtRF3Total.Value := aValor;
      mtRF3Item.Value := aItem;
      mtRF3.Post
    end;
    
  end;
end;

procedure TdmCaixa.DataModuleCreate(Sender: TObject);
begin
  nxTCPIP.Port := 17200;
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

function GetCor(aItem: Integer): TColor;
begin
  case aItem of
    irfCancelamentos, irfDescontos, irfQuebraCaixa  : Result := clRed;
    irfSaldoFinal, irfSaldoInformado : Result := clBlue;
  else
    Result := clBlack;  
  end;
end;

function GetBold(aItem: Integer): Boolean;
begin
  case aItem of
    irfTotalRec,
    irfSaldoFinal,
    irfSaldoInformado,
    irfQuebraCaixa,
    irfFaturamento : Result := True;
  else
    Result := False;  
  end;
end;

procedure TdmCaixa.mtRF1CalcFields(DataSet: TDataSet);
begin
  mtRF1Bold.Value := GetBold(mtRF1Item.Value);
  mtRF1Cor.Value := GetCor(mtRF1Item.Value);
end;

procedure TdmCaixa.mtRF2CalcFields(DataSet: TDataSet);
begin
  mtRF2Bold.Value := GetBold(mtRF2Item.Value);
  mtRF2Cor.Value := GetCor(mtRF2Item.Value);
end;

procedure TdmCaixa.mtRF3CalcFields(DataSet: TDataSet);
begin
  mtRF3Bold.Value := GetBold(mtRF3Item.Value);
  mtRF3Cor.Value := GetCor(mtRF3Item.Value);
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
  S: String;
  Incluir: Boolean;
  PagDet, PagReg : Integer;
  ValorI : Currency;
  qItem: Integer;

begin
  Fillchar(DRF, SizeOf(DRF), 0);
  Result := 0;
  CaixaI := 0;
  CaixaF := 0;
  mtRF1.EmptyTable;
  mtRF2.EmptyTable;
  mtRF3.EmptyTable;

  mtObs.Active := False;
  mtObs.Active := True;
  
  qVC.Active := False;
  qDesc.Active := False;
  qCanc.Active := False;
  qRFFat.Active := False;
  qRFPag.Active := False;
//  qCliValor.Active := False;
  
  mtEst.Active := False;
  mtEst.Active := True;

  mtTot.Active := False;
  mtTot.Active := True;

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

    if Trim(tCaixaObs.Value)>'' then begin
      mtObs.Append;
      mtObsObs.Value := tCaixaObs.Value;
      mtObs.Post;
    end;
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

  qCanc.ParamByName('CaixaI').AsInteger := CaixaI; // do not localize
  qCanc.ParamByName('CaixaF').AsInteger := CaixaF; // do not localize
  qCanc.Active := True;

  qDesc.ParamByName('CaixaI').AsInteger := CaixaI; // do not localize
  qDesc.ParamByName('CaixaF').AsInteger := CaixaF; // do not localize
  qDesc.Active := True;

  qVC.ParamByName('CaixaI').AsInteger := CaixaI; // do not localize
  qVC.ParamByName('CaixaF').AsInteger := CaixaF; // do not localize
  qVC.Active := True;  

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

  while not qRFFat.Eof do begin
    case qRFFatTipo.Value of
      trEstVenda, trEstVendaWeb : begin
        drf[irfFaturamento].drfQtd := drf[irfFaturamento].drfQtd + qRFFatQtd.Value;
        drf[irfFaturamento].drfValor := drf[irfFaturamento].drfValor + qRFFatTotLiq.Value;
      end;
      
      trCaixaEnt : begin
        drf[irfDinAdd].drfQtd := qRFFatQtd.Value;
        drf[irfDinAdd].drfValor := qRFFatTotLiq.Value;
      end;
      
      trCaixaSai : begin
        drf[irfDinRem].drfQtd := qRFFatQtd.Value;
        drf[irfDinRem].drfValor := qRFFatTotLiq.Value;
      end;
    end;
    qRFFat.Next;
  end;

  while not qRFPag.Eof do begin
    case qRFPagTipo.Value of
      trEstVenda,
      trEstVendaWeb   : drf[irfVendasRec].drfValor := drf[irfVendasRec].drfValor + (qRFPagPago.Value - qRFPagTroco.Value - qRFPagCredito.Value);
      
      trPagDebito     : begin
        drf[irfDebPagos].drfQtd := qRFPagQtd.Value;
        drf[irfDebPagos].drfValor := qRFPagPago.Value;
      end;
      
    end;
    drf[irfTrocoCred].drfValor := drf[irfTrocoCred].drfValor + qRFPagCredito.Value;
    drf[irfDebitado].drfValor := drf[irfDebitado].drfValor + qRFPagDebito.Value;
    drf[irfCredUsado].drfValor := drf[irfCredUsado].drfValor + qRFPagCreditoUsado.Value;    
      
    qRFPag.Next;
  end;
  
  dsEst.Dataset := nil;
  try
    tProd.First;
    while not tProd.Eof do begin
      tME.SetRange([tProdID.Value, CaixaI], [tProdID.Value, CaixaF]);
      if not (tME.Eof and tME.Bof) then begin
        mtEst.Append;
        mtEstID.Value := tProdID.Value;
        mtEstDescricao.Value := tProdDescricao.Value;
        mtEstSaldoInicial.Value := tMEEstoqueAnt.Value;
        tME.First;
        while not tME.Eof do begin
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

  mtTot.Open;
  mtTot.EmptyTable;

  drf[irfTotalRec].drfValor := drf[irfVendasRec].drfValor +
                               drf[irfDebPagos].drfValor +
                               drf[irfTrocoCred].drfValor;

  drf[irfTotalRec2].drfValor := drf[irfTotalRec].drfValor;  

  if not aPeriodo then
    drf[irfSaldoFinal].drfValor := drf[irfTotalRec].drfValor +
                                   tCaixaSaldoAnt.Value +                             
                                   drf[irfDinAdd].drfValor -
                                   drf[irfDinRem].drfValor;
                               
  AddItemRF(irfFaturamento, SncDMCaixa_Faturamento, drf[irfFaturamento].drfValor);
  AddItemRF(99, '', 0);
  AddItemRF(irfDebitado, SncDMCaixa_Debitado, drf[irfDebitado].drfValor, False);
  AddItemRF(irfCredUsado, SncDMCaixa_CredUsado, drf[irfCredUsado].drfValor, False);
  AddItemRF(irfDescontos, SncDMCaixa_Descontos, qDescTotal.Value, False);
  AddItemRF(irfCancelamentos, SncDMCaixa_Cancelamentos, qCancTotal.Value, False);
  AddItemRF(99, '', 0);
  AddItemRF(99, SncDMCaixa_ValoresRecebidos, 0);
  AddItemRF(irfVendasRec, SncDMCaixa_Vendas, drf[irfVendasRec].drfValor);
  AddItemRF(irfDebPagos, SncDMCaixa_DebPagos, drf[irfDebPagos].drfValor, False);
  AddItemRF(irfTrocoCred, SncDMCaixa_TrocoCreditado, drf[irfTrocoCred].drfValor, false);
  AddItemRF(irfTotalRec, SncDMCaixa_TotalRec, drf[irfTotalRec].drfValor);
  AddItemRF(99, '', 0);
  if not aPeriodo then AddItemRF(99, SncDMCaixa_SaldoCaixa, 0);
  if not aPeriodo then AddItemRF(irfSaldoInicial, SncDMCaixa_SaldoInicial, tCaixaSaldoAnt.Value);
  if not aPeriodo then AddItemRF(irfTotalRec2, SncDMCaixa_ValoresRecebidos, drf[irfTotalRec2].drfValor);
  
  AddItemRF(irfDinAdd, '+ '+SncDMCaixa_DinheiroAdicionado, drf[irfDinAdd].drfValor, false);
  AddItemRF(irfDinRem, '- '+SncDMCaixa_DinheiroRetirado, drf[irfDinRem].drfValor, false);

  if (not aPeriodo) then begin
    AddItemRF(irfSaldoFinal, SncDMCaixa_SaldoFinal, drf[irfSaldoFinal].drfValor);
    if (not tCaixaAberto.Value) and gConfig.PedirSaldoF then begin
      AddItemRF(irfSaldoInformado, SncDMCaixa_SaldoInformado, tCaixaSaldoF.Value);
      AddItemRF(irfQuebraCaixa, SncDMCaixa_QuebraDeCaixa, tCaixaQuebra.Value, False);
    end;  
  end;
  
  Result := drf[irfSaldoFinal].drfValor;
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

