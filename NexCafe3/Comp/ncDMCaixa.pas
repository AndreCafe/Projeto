unit ncDMCaixa;

interface

uses
  SysUtils, Classes, DB, nxdb, kbmMemTable, nxllTransport,
  nxptBasePooledTransport, nxtwWinsockTransport, nxsdServerEngine,
  nxreRemoteServerEngine, nxllComponent, frxClass, frxExportPDF, frxDBSet;

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
    qTempo: TnxQuery;
    dsTempo: TDataSource;
    qHora: TnxQuery;
    qManut: TnxQuery;
    dsManut: TDataSource;
    dsHora: TDataSource;
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
    qRF: TnxQuery;
    qRFTipoTran: TWordField;
    qRFTipoItem: TWordField;
    qRFTotal: TCurrencyField;
    qRFDesconto: TCurrencyField;
    qRFPago: TCurrencyField;
    qRFDebito: TCurrencyField;
    mtTotFaturamento: TCurrencyField;
    mtTotDebitado: TCurrencyField;
    mtTotRecebido: TCurrencyField;
    mtTotPgDebito: TCurrencyField;
    qSS: TnxQuery;
    qSSTipo: TWordField;
    qSSTotal: TCurrencyField;
    qDesc: TnxQuery;
    qCanc: TnxQuery;
    qDescTotal: TCurrencyField;
    qCancTotal: TCurrencyField;
    qHoraHora: TWordField;
    qHoraMinutosU: TFloatField;
    qHoraMinutosP: TFloatField;
    qTempoMaq: TIntegerField;
    qTempoMinutosU: TFloatField;
    qTempoMinutosP: TFloatField;
    tCli: TnxTable;
    qManutFunc: TStringField;
    qManutMinutosU: TFloatField;
    qGratis: TnxQuery;
    qGratisCliente: TIntegerField;
    qGratisMinutosU: TFloatField;
    qGratisMinutosP: TFloatField;
    qVCCategoria: TStringField;
    qVCTotal: TCurrencyField;
    qVCDesconto: TCurrencyField;
    qGratisNomeCliente: TStringField;
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
    repCaixa: TfrxReport;
    qDescQuant: TFloatField;
    qVCQuant: TFloatField;
    qGratisQuant: TFloatField;
    tCaixaSangria: TCurrencyField;
    tCaixaSupr: TCurrencyField;
    qManutQuant: TFloatField;
    qCancQuant: TFloatField;
    qTempoCli: TnxQuery;
    qTempoCliCliente: TIntegerField;
    qTempoCliQuant: TFloatField;
    dsTotCli: TDataSource;
    qAuxTempoCli: TnxQuery;
    qAuxTempoCliCliente: TIntegerField;
    qAuxTempoCliMinutosU: TFloatField;
    qAuxTempoCliMinutosP: TFloatField;
    qAuxTempo: TnxQuery;
    IntegerField2: TIntegerField;
    FloatField5: TFloatField;
    qTempoQuant: TIntegerField;
    qAuxHora: TnxQuery;
    WordField1: TWordField;
    FloatField6: TFloatField;
    qHoraQuant: TIntegerField;
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
    qTUsado: TnxQuery;
    dsTU: TDataSource;
    mtTU: TkbmMemTable;
    mtTUTempo: TIntegerField;
    mtTUQuant: TIntegerField;
    qTUsadoMinutosR: TFloatField;
    mtTUPerc: TFloatField;
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
    qFatPreTipo: TWordField;
    qFatPreIDPacPass: TIntegerField;
    qFatPreValor: TCurrencyField;
    qFatPos: TnxQuery;
    qFatPreQuant: TFloatField;
    qFatPosQuant: TFloatField;
    qFatPosValor: TCurrencyField;
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
    qCliValor: TnxQuery;
    qCliValorcliente: TIntegerField;
    qCliValorvalor: TCurrencyField;
    mtTotCli: TkbmMemTable;
    mtTotCliCliente: TIntegerField;
    mtTotCliQuant: TFloatField;
    mtTotCliMinutosU: TFloatField;
    mtTotCliMinutosP: TFloatField;
    mtTotCliNomeCli: TStringField;
    mtTotCliValor: TCurrencyField;
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
    qEstResDisplayWH: TStringField;
    qEstResqtd: TFloatField;
    qEstSessoestempo: TFloatField;
    qEstSessoesqtd: TFloatField;
    qEstUrlqtd: TFloatField;
    qEstSearchQtdSearchEng: TStringField;
    qEstSearchQtdQtd: TFloatField;
    qEstSearchPagSearchEng: TStringField;
    qEstSearchPagQtd: TFloatField;
    tCaixaEstRes: TMemoField;
    procedure qVCCalcFields(DataSet: TDataSet);
    procedure tMECalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure mtTUCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    drf : Array[0..2] of TDadosResFin;
    CaixaI, 
    CaixaF: Integer;

    TemSupSan : Boolean;
    
    procedure AbreConn;
    function AbreCaixa(aFunc: String; aManterSaldo: Boolean; var aNumCx: Integer): Integer;
    function FechaCaixa(aFunc: String; aNumCx: Integer; aReproc: Boolean): Integer;
    
    procedure Processa(aID: Integer; aPeriodo: Boolean; aDataI, aDataF: TDateTime);
    procedure ExportaCaixa(aID: Integer; aArquivo: String);
    procedure PopulateTU;
    { Public declarations }
  end;

var
  dmCaixa: TdmCaixa;
  FracaoTempoUsado : Integer = 5;
  SessoesTU : Integer = 0;

implementation

uses 
  ncClassesBase, ncErros, Graphics, uPerfLog;

{$R *.dfm}

{ TdmCaixa }


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


function TdmCaixa.AbreCaixa(aFunc: String; aManterSaldo: Boolean; var aNumCx: Integer): Integer;
var SaldoAnt: Currency;
begin
  tCaixa.Active := True;
  tTran.IndexName := 'IID';
  tTran.Open;
  tITran.Open;
  tImp.Open;
  InitTran(nxDB, [tCaixa, tImp, tTran, tITran], True);
  try
    tCaixa.IndexName := 'IAberto';
    try
      if tCaixa.FindKey([True]) then begin
        nxDB.Rollback;
        Result := ncerrJaTemCaixaAberto;
        Exit;
      end;
    finally
      tCaixa.IndexName := 'IID';
    end;

    if aManterSaldo and not tCaixa.IsEmpty then begin
      tCaixa.Last;
      SaldoAnt := tCaixaTotalFinal.Value + tCaixaSaldoAnt.Value + tCaixaSupr.Value - tCaixaSangria.Value;
    end else
      SaldoAnt := 0;
      
    tCaixa.Insert;
    tCaixaAbertura.Value := Now;
    tCaixaAberto.Value := True;
    tCaixaUsuario.Value := aFunc;
    tCaixaSaldoAnt.Value := SaldoAnt;
    tCaixaEstSyncOk.Value := False;
    tCaixa.Post;

    aNumCx := tCaixaID.Value;
    Result := 0;

    tImp.IndexName := 'ICaixa';
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
    nxDB.Rollback;
    Result := ncerrExcecaoNaoTratada;
  end;
end;

procedure TdmCaixa.AbreConn;
begin
  nxDB.AliasPath := '';
  nxDB.AliasName := 'NexCafe';
  nxDB.Active := True;
  tME.Open;
  tCli.Open;
  tProd.Open;
  tCaixa.Open;
  tSessao.Open;
  tCriar.Open;
end;

procedure TdmCaixa.DataModuleCreate(Sender: TObject);
begin
  TemSupSan := False;
end;

procedure TdmCaixa.ExportaCaixa(aID: Integer; aArquivo: String);
begin
  Processa(aID, False, 0, 0);
  pdfExp.FileName := aArquivo;
  pdfExp.DefaultPath := '';
  repCaixa.PrepareReport;
  repCaixa.Export(PDFexp);
end;

function TdmCaixa.FechaCaixa(aFunc: String; aNumCx: Integer; aReproc: Boolean): Integer;
var 
  SAnt: Currency;
  SL : TStrings;
begin
  InitTran(nxDB, [], False);
  try
    tCaixa.IndexName := 'IID';
    if not tCaixa.FindKey([aNumCx]) then begin
      nxDB.Rollback;
      Result := ncerrItemInexistente;
      Exit;
    end;
    SAnt := 0;

    if aReproc then begin
      if tCaixaAberto.Value then begin
        nxDB.Rollback;
        Raise Exception.Create('O reprocessamento de caixa só pode ser realizado em caixas que já foram fechados');
      end;
      if gConfig.ManterSaldoCaixa then begin
        tCaixa.Prior;
        if (tCaixaID.Value < aNumCx) then
          SAnt := tCaixaTotalFinal.Value + tCaixaSaldoAnt.Value + tCaixaSupr.Value - tCaixaSangria.Value;
        tCaixa.FindKey([aNumCx]);
      end;
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
      qCorr.ParamByName('Caixa').AsInteger := aNumCx;
      qCorr.ExecSQL;

      qCorr2.Active := False;
      qCorr2.SQL.Text := 'update itran '+
                         'set caixa = ' + IntToStr(aNumCx) +
                         ' where tran in (select id from tran where caixa = ' + IntToStr(aNumCx) +')';
      qCorr2.ExecSQL;     

      qCorr2.Active := False;
      qCorr2.SQL.Text := 'update movest '+
                         'set caixa = ' + IntToStr(aNumCx) +
                         ' where tran in (select id from tran where caixa = ' + IntToStr(aNumCx) +')';
      qCorr2.ExecSQL;                         
    end;

    qFecha.ParamByName('Caixa').AsInteger := aNumCx;

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
          SL.Values['p_'+qEstSearchPagSearchEng.Value] := IntToStr(Trunc(qEstSearchPagQtd.Value));
          qEstSearchPag.Next;
        end;

        qEstSearchQtd.First;
        while not qEstSearchQtd.Eof do begin
          SL.Values['q_'+qEstSearchQtdSearchEng.Value] := IntToStr(Trunc(qEstSearchQtdQtd.Value));
          qEstSearchQtd.Next;
        end;

        tCaixaEstBuscasEng.Value := SL.Text;

        SL.Text := '';
        qEstRes.First;
        while not qEstRes.Eof do begin
          SL.Values[qEstResDisplayWH.Value] := IntToStr(Trunc(qEstResQtd.Value));
          qEstRes.Next;
        end;
        tCaixaEstUrls.Value := Trunc(qEstUrlQtd.Value);
        tCaixaEstRes.Value := SL.Text;
        tCaixaEstSessoesQtd.Value := Trunc(qEstSessoesQtd.Value);
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
        tCaixaTotalFinal.Value := tCaixaTotalFinal.Value + qFechaPago.Value;
      end;
      tCaixaDescontos.Value := tCaixaDescontos.Value + qFechaDesconto.Value;
      qFecha.Next;
    end;
    tCaixaAberto.Value := False;
    if aReproc then
      tCaixaReproc.Value := Now else
      tCaixaFechamento.Value := Now;
    tCaixaEstSyncOk.Value := True;  
    tCaixa.Post;
    Result := 0;
    nxDB.Commit; 
  except
    nxDB.Rollback;
    Result := ncerrExcecaoNaoTratada;
  end;
end;

procedure TdmCaixa.mtTUCalcFields(DataSet: TDataSet);
begin
  if SessoesTU>0 then 
    mtTUPerc.Value := (mtTUQuant.Value / SessoesTU) * 100;
end;

function V2Casas(C: Currency): Currency;
begin
  Result := Int(C * 100) / 100;
end;

procedure TdmCaixa.PopulateTU;
var T: Integer;
begin
  dsTU.DataSet := nil;
  try
    mtTU.Active := False;
    mtTU.Open;
    qTUsado.First;
    SessoesTU := qTUsado.RecordCount;
    while not qTUsado.Eof do begin
      T := (Trunc(qTUsadoMinutosR.Value) div FracaoTempoUsado) * FracaoTempoUsado;
      if mtTU.FindKey([T]) then
        mtTU.Edit else
        mtTU.Insert;
      mtTUTempo.Value := T;
      mtTUQuant.Value := mtTUQuant.Value + 1;
      mtTU.Post;  
      qTUsado.Next;
    end;
    mtTU.First;
  finally
    dsTU.DataSet := mtTU;
  end;
end;

procedure TdmCaixa.Processa(aID: Integer; aPeriodo: Boolean; aDataI, aDataF: TDateTime);
var
  Q: TnxQuery;
  I, Num : Integer;
  CustoU, TotFinal, PercDesc, Desc, DescT : Double;
  drf : Array[0..2] of TDadosResFin;
  S: String;
  Incluir: Boolean;
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
var ind: Integer;
begin
  for ind := Index+1 to 10 do
  if QImp(Ind)>0 then begin
    Result := False;
    Exit;
  end;
  Result := True;
end;

begin
  CaixaI := 0;
  CaixaF := 0;
  qTempo.Active := False;
  qVC.Active := False;
  qHora.Active := False;
  qAuxHora.Active := False;
  qManut.Active := False;
  qGratis.Active := False;
  qSS.Active := False;
  qDesc.Active := False;
  qCanc.Active := False;
  qTempo.Active := False;
  qAuxTempo.Active := False;
  qRF.Active := False;
  qTempoCli.Active := False;
  qAuxTempoCli.Active := False;
  qSessao.Active := False;
  qFatPre.Active := False;
  qFatPos.Active := False;
//  qCliValor.Active := False;
  mtTotCli.Active := False;
  
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
      Q.SQL.Add('SELECT MIN(ID) as CaixaI, MAX(ID) as CaixaF FROM CAIXA');
      Q.SQL.Add('WHERE (Abertura >= TIMESTAMP ' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', aDataI))+') AND ' +
                '      (Abertura <  TIMESTAMP ' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', aDataF+1))+') AND (Aberto = False)');
      PerfLog.Start('Q.Open');
      Q.Open;
      PerfLog.Done;
      CaixaI := Q.FieldByName('CaixaI').AsInteger;
      CaixaF := Q.FieldByName('CaixaF').AsInteger;
    finally
      Q.Free;
    end;
  end;

  if Num > 0 then begin
    tCaixa.Locate('ID', Num, []);
    CaixaI := Num;
    CaixaF := Num;
  end;

  qSessao.Params[0].AsInteger := CaixaI;
  qSessao.Params[1].AsInteger := CaixaF;
  qSessao.Params[2].AsInteger := CaixaI;
  qSessao.Params[3].AsInteger := CaixaF;
  PerfLog.Start('qSessao.Open');
  dsSessao.DataSet := nil;
  try
    qSessao.Open;
    PerfLog.Done;
  finally
    PerfLog.Start('dsSessao.Dataset := qSessao');
    dsSessao.Dataset := qSessao;
    PerfLog.Done;
  end;

  qFatPre.Params[0].AsInteger := CaixaI;
  qFatPre.Params[1].AsInteger := CaixaF;

  qFatPos.Params[0].AsInteger := CaixaI;
  qFatPos.Params[1].AsInteger := CaixaF;

  qRF.ParamByName('CaixaI').AsInteger := CaixaI;
  qRF.ParamByName('CaixaF').AsInteger := CaixaF;
  PerfLog.Start('qRF.Active := True');
  qRF.Active := True;
  PerfLog.Done;
  qRF.First;
  
  while not qRF.Eof do begin
    case qRFTipoItem.Value of
      itSessao, itTempo : I := drfSessao;
      itMovEst          : I := drfVendas;
      itImpressao       : I := drfImp;
    else
      I := -1;  
    end;
    if (I>=0) then
    if qRFTipoTran.Value = trPagDebito then
      drf[I].rfPgDebito := drf[I].rfPgDebito + qRFPago.Value
    else 
    if qRFTipoTran.Value <> trEstCompra then begin
    
      drf[I].rfRecebido := drf[I].rfRecebido + qRFPago.Value;
      drf[I].rfDebitado := drf[I].rfDebitado + qRFDebito.Value;
      if (qRFTipoItem.Value=itSessao) or (qRFTipoTran.Value<>trFimSessao) then
        drf[I].rfFaturamento := 
          drf[I].rfFaturamento +
          (qRFTotal.Value - qRFDesconto.Value);
    end;
      
    qRF.Next;
  end;

  PerfLog.Start('Soma produtos');
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
    PerfLog.Done;
  finally
    dsEst.Dataset := mtEst;
  end;

  PerfLog.Start('Soma impressões');
  mtImp.DisableControls;
  dsImp.Dataset := nil;
  try
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
        
        for I := 1 to 10 do 
        if QImp(I)>0 then begin
          if mtImp.Locate('TipoImp', I, []) then 
            mtImp.Edit
          else begin
            mtImp.Insert;
            mtImpTipoImp.Value := I;  
            mtImpNomeTipoImp.AsVariant := tTipoImp.Lookup('ID', I, 'Nome');
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
          mtImp.Post;
        end;
      end;
  
      tImp.Next;
    end;
  finally
    mtImp.EnableControls;
    dsImp.DataSet := mtImp;
  end;

  PerfLog.Done;

  mtImp.First;
  
  mtTot.Open;
  mtTot.EmptyTable;
  mtTot.Append;
  mtTotItem.Value := 1;
  mtTotDescricao.Value := 'Acessos';
  mtTotFaturamento.Value := drf[drfSessao].rfFaturamento;
  mtTotDebitado.Value := drf[drfSessao].rfDebitado;
  mtTotPgDebito.Value := drf[drfSessao].rfPgDebito;
  mtTotRecebido.Value := drf[drfSessao].rfRecebido;
  mtTotTotal.Value := drf[drfSessao].rfRecebido + drf[drfSessao].rfPgDebito;
  mtTot.Post;

  mtTot.Open;
  mtTot.Append;
  mtTotItem.Value := 2;
  mtTotDescricao.Value := 'Vendas';
  mtTotFaturamento.Value := drf[drfVendas].rfFaturamento;
  mtTotDebitado.Value := drf[drfVendas].rfDebitado;
  mtTotPgDebito.Value := drf[drfVendas].rfPgDebito;
  mtTotRecebido.Value := drf[drfVendas].rfRecebido;
  mtTotTotal.Value := drf[drfVendas].rfRecebido + drf[drfVendas].rfPgDebito;
  mtTot.Post;

  mtTot.Open;
  mtTot.Append;
  mtTotItem.Value := 3;
  mtTotDescricao.Value := 'Impressões';
  mtTotFaturamento.Value := drf[drfImp].rfFaturamento;
  mtTotDebitado.Value := drf[drfImp].rfDebitado;
  mtTotPgDebito.Value := drf[drfImp].rfPgDebito;
  mtTotRecebido.Value := drf[drfImp].rfRecebido;
  mtTotTotal.Value := drf[drfImp].rfRecebido + drf[drfImp].rfPgDebito;
  mtTot.Post;
  
  mtTot.Open;
  mtTot.Append;
  mtTotItem.Value := 4;
  mtTotDescricao.Value := 'Total do Caixa';


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

  qSS.ParamByName('CaixaI').AsInteger := CaixaI;
  qSS.ParamByName('CaixaF').AsInteger := CaixaF;
  PerfLog.Start('qSS.Active');
  qSS.Active := True;
  PerfLog.Done;

  qCanc.ParamByName('CaixaI').AsInteger := CaixaI;
  qCanc.ParamByName('CaixaF').AsInteger := CaixaF;
  
  PerfLog.Start('qCanc.Active');
  qCanc.Active := True;
  PerfLog.Done;

  qAuxTempo.ParamByName('CaixaI').AsInteger := CaixaI;
  qAuxTempo.ParamByName('CaixaF').AsInteger := CaixaF;
  PerfLog.Start('qAuxTempo.Active');
  qAuxTempo.Active := True;
  PerfLog.Done;

  qTempo.ParamByName('CaixaI').AsInteger := CaixaI;
  qTempo.ParamByName('CaixaF').AsInteger := CaixaF;
  PerfLog.Start('qTempo.Active');
  qTempo.Active := True;
  PerfLog.Done;

  PerfLog.Start('qTUsado.Active');
  qTUsado.Active := False;
  qTUsado.ParamByName('CaixaI').AsInteger := CaixaI;
  qTUsado.ParamByName('CaixaF').AsInteger := CaixaF;
  qTUsado.Active := True;
  PerfLog.Done;
  
  PopulateTU;

{  qCliValor.ParamByName('CaixaI').AsInteger := CaixaI;
  qCliValor.ParamByName('CaixaF').AsInteger := CaixaF;
  qCliValor.Active := True;}

  qAuxTempoCli.ParamByName('CaixaI').AsInteger := CaixaI;
  qAuxTempoCli.ParamByName('CaixaF').AsInteger := CaixaF;
  
  PerfLog.Start('qAuxTempoCli.Active');
  qAuxTempoCli.Active := True;
  PerfLog.Done;
  
  qTempoCli.ParamByName('CaixaI').AsInteger := CaixaI;
  qTempoCli.ParamByName('CaixaF').AsInteger := CaixaF;
  
  PerfLog.Start('qTempoCli');
  qTempoCli.Active := True;
  PerfLog.Done;

  qAuxHora.ParamByName('CaixaI').AsInteger := CaixaI;
  qAuxHora.ParamByName('CaixaF').AsInteger := CaixaF;
  
  PerfLog.Start('qAuxHora');
  qAuxHora.Active := True;
  PerfLog.Done;
  
  qHora.ParamByName('CaixaI').AsInteger := CaixaI;
  qHora.ParamByName('CaixaF').AsInteger := CaixaF;
  PerfLog.Start('qHora');
  qHora.Active := True;
  PerfLog.Done;
  
  qDesc.ParamByName('CaixaI').AsInteger := CaixaI;
  qDesc.ParamByName('CaixaF').AsInteger := CaixaF;
  PerfLog.Start('qDesc');
  qDesc.Active := True;
  PerfLog.Done;

  qManut.ParamByName('CaixaI').AsInteger := CaixaI;
  qManut.ParamByName('CaixaF').AsInteger := CaixaF;
  PerfLog.Start('qManut');
  qManut.Active := True;
  PerfLog.Done;

  qVC.ParamByName('CaixaI').AsInteger := CaixaI;
  qVC.ParamByName('CaixaF').AsInteger := CaixaF;
  
  PerfLog.Start('qVC');
  qVC.Active := True;
  PerfLog.Done;

  qGratis.ParamByName('CaixaI').AsInteger := CaixaI;
  qGratis.ParamByName('CaixaF').AsInteger := CaixaF;
  PerfLog.Start('qGratis');
  qGratis.Active := True;
  PerfLog.Done;

  PerfLog.Start('qFatPre');
  qFatPre.Active := True;
  PerfLog.Done;

  PerfLog.Start('qFatPos');
  qFatPos.Active := True;
  PerfLog.Done;
  
  PerfLog.Start('Processamento Faturamento');
  
  mtFatPrePos.Append;
  mtFatPrePosTipo.Value := 'Pós-pago';
  mtFatPrePosQuant.Value := Trunc(qFatPosQuant.Value);
  mtFatPrePosValor.Value := qFatPosValor.Value;
  mtFatPrePos.Post;

  tPacote.Active := True;
  tTipoPass.Active := True;

  qFatPre.First;
  while not qFatPre.Eof do begin
    Incluir := True;
    case qFatPreTipo.Value of
      tctAvulso : S := 'Crédito de Tempo Avulso';
      tctPacote : 
        if tPacote.FindKey([qFatPreIDPacPass.Value]) then
          S := tPacoteDescr.Value else
          S := 'Pacote: Não existe mais';
      tctCartaoTempo : 
        if tTipoPass.FindKey([qFatPreIDPacPass.Value]) then
          S := 'Cartão de Tempo: '+tTipoPassNome.Value else
          S := 'Cartão de Tempo: Não existe mais';
      tctPassaporte :
        if tTipoPass.FindKey([qFatPreIDPacPass.Value]) then
          S := tTipoPassNome.Value else
          S := 'Passaporte: Não existe mais';
    else
      Incluir := False; 
    end;
    if Incluir then begin
      mtFatPrePos.Append;
      mtFatPrePosTipo.Value := S;
      mtFatPrePosQuant.Value := Trunc(qFatPreQuant.Value);
      mtFatPrePosValor.Value := qFatPreValor.Value;
      mtFatPrePos.Post;
    end;
    qFatPre.Next;
  end;

  PerfLog.Done;

  TemSupSan := False;
  
  if not aPeriodo then begin
    mtTot.Append;
    mtTotItem.Value := 5;
    mtTotDescricao.Value := 'Saldo Inicial';
    mtTotTotal.Value := tCaixaSaldoAnt.Value;
    TotFinal := TotFinal + mtTotTotal.Value;
    if mtTotTotal.Value>0.0009 then
      TemSupSan := True;
    mtTot.Post;
  end;
  
  mtTot.Append;
  mtTotItem.Value := 6;
  mtTotDescricao.Value := 'Suprimento';
  mtTotTotal.AsVariant := qSS.Lookup('Tipo', trCaixaEnt, 'Total');
  if mtTotTotal.IsNull then
    mtTotTotal.Value := 0;
  TotFinal := TotFinal + mtTotTotal.Value;

  if mtTotTotal.Value>0.0009 then
    TemSupSan := True;
    
  mtTot.Post;

  mtTot.Append;
  mtTotItem.Value := 7;
  mtTotDescricao.Value := 'Sangria';
  mtTotTotal.AsVariant := qSS.Lookup('Tipo', trCaixaSai, 'Total');
  if mtTotTotal.IsNull then
    mtTotTotal.Value := 0;
    
  TotFinal := TotFinal - mtTotTotal.Value;
  if mtTotTotal.Value>0.0009 then
    TemSupSan := True;
  mtTot.Post;

  mtTot.Append;
  mtTotItem.Value := 8;
  mtTotDescricao.Value := 'Saldo Final';
  mtTotTotal.Value := TotFinal;
  mtTot.Post;

{  mtTot.Append;
  mtTotItem.Value := 9;
  mtTotDescricao.Value := '';
  mtTot.Post;}

  mtTot.Append;
  mtTotItem.Value := 10;
  mtTotDescricao.Value := qDescQuant.AsString + ' Desconto(s)';
  mtTotTotal.Value := qDescTotal.Value;
  mtTot.Post;

  mtTot.Append;
  mtTotItem.Value := 11;
  mtTotDescricao.Value := qCancQuant.AsString + ' Cancelamento(s)';
  mtTotTotal.Value := qCancTotal.Value;
  mtTot.Post;     

  dsTotCli.Dataset := nil;
  try
    mtTotCli.Open;

    PerfLog.Start('Processamento totalização de clientes - 1/3');               
    
    qTempoCli.First;
    while not qTempoCli.Eof do begin
      mtTotCli.Append;
      mtTotCliCliente.Value := qTempoCliCliente.Value;
      mtTotCliQuant.Value := qTempoCliQuant.Value;

      if mtTotCliCliente.Value=0 then
        mtTotCliNomeCli.Value := '* CLIENTES SEM CADASTRO (AVULSO)' 
      else
      if tCli.FindKey([mtTotCliCliente.Value]) then
        mtTotCliNomeCli.AsVariant := tCli.FieldByName('Nome').AsString;
        
      mtTotCli.Post;
      qTempoCli.Next;
    end;
    PerfLog.Done;

    PerfLog.Start('Processamento totalização de clientes - 2/3');               
    qAuxTempoCli.First;
    while not qAuxTempoCli.Eof do begin
      if mtTotCli.FindKey([qAuxTempoCliCliente.Value]) then begin
        mtTotCli.Edit;
        mtTotCliMinutosU.Value := qAuxTempoCliMinutosU.Value;
        mtTotCliMinutosP.Value := qAuxTempoCliMinutosP.Value;
        mtTotCli.Post;
      end;
      qAuxTempoCli.Next;
    end;
    PerfLog.Done;

    PerfLog.Start('Processamento totalização de clientes - 3/3');               
    tTran.Active := False;
    tTran.Active := True;
    tTran.IndexName := 'ICaixaID';
    tTran.SetRange([CaixaI], [CaixaF]);
    while not tTran.Eof do begin
      if (not (tTranTipo.Value in [5..7, 9, 10, 14])) then 
      begin
        if mtTotCli.FindKey([tTranCliente.Value]) then 
          mtTotCli.Edit else
          mtTotCli.Insert;
        mtTotCliCliente.Value := tTranCliente.Value;
        mtTotCliValor.Value := mtTotCliValor.Value + tTranPago.Value;

        if mtTotCliNomeCli.Value='' then
        if mtTotCliCliente.Value=0 then
          mtTotCliNomeCli.Value := '* CLIENTES SEM CADASTRO (AVULSO)' 
        else
        if tCli.FindKey([mtTotCliCliente.Value]) then
          mtTotCliNomeCli.Value := tCli.FieldByName('Nome').AsString;
      
        mtTotCli.Post;
      end;
      tTran.Next;
    end;

    PerfLog.Done;

{    qCliValor.First;
    while not qCliValor.Eof do begin
      if mtTotCli.FindKey([qCliValorCliente.Value]) then 
        mtTotCli.Edit else
        mtTotCli.Insert;
      mtTotCliCliente.Value := qCliValorCliente.Value;
      mtTotCliValor.Value := qCliValorValor.Value;

      if mtTotCliNomeCli.Value='' then
      if mtTotCliCliente.Value=0 then
        mtTotCliNomeCli.Value := '* CLIENTES SEM CADASTRO (AVULSO)' else
        mtTotCliNomeCli.AsVariant := tCli.Lookup('ID', mtTotCliCliente.Value, 'Nome');
      
      mtTotCli.Post;
      
      qCliValor.Next;
    end;}
    
  finally
    dsTotCli.Dataset := mtTotCli;
  end;

end;

procedure TdmCaixa.qVCCalcFields(DataSet: TDataSet);
begin
  qVCTotFinal.Value := qVCTotal.Value - qVCDesconto.Value;
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
