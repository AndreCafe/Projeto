unit ncaDMComp;

interface

uses
  SysUtils, Classes, Dialogs, frxClass, DB, nxdb, frxDBSet, ExtCtrls, frxExportTXT;

type
  TdmComp = class(TDataModule)
    dbTran: TfrxDBDataset;
    dbITran: TfrxDBDataset;
    dsItran: TDataSource;
    dsTran: TDataSource;
    tTran: TnxTable;
    tTranID: TAutoIncField;
    tTranDataHora: TDateTimeField;
    tTranCliente: TIntegerField;
    tTranTipo: TWordField;
    tTranFunc: TStringField;
    tTranTotal: TCurrencyField;
    tTranDesconto: TCurrencyField;
    tTranPago: TCurrencyField;
    tTranDebito: TCurrencyField;
    tTranObs: TMemoField;
    tTranCancelado: TBooleanField;
    tTranCanceladoPor: TStringField;
    tTranCanceladoEm: TDateTimeField;
    tTranCaixa: TIntegerField;
    tTranMaq: TWordField;
    tTranNomeCliente: TStringField;
    tTranSessao: TIntegerField;
    tTranDescr: TStringField;
    tITran: TnxTable;
    tITranID: TAutoIncField;
    tITranTran: TIntegerField;
    tITranCaixa: TIntegerField;
    tITranSessao: TIntegerField;
    tITranDataHora: TDateTimeField;
    tITranTipoTran: TWordField;
    tITranTipoItem: TWordField;
    tITranSubTipo: TWordField;
    tITranItemID: TIntegerField;
    tITranSubItemID: TIntegerField;
    tITranItemPos: TWordField;
    tITranTotal: TCurrencyField;
    tITranDesconto: TCurrencyField;
    tITranDebito: TCurrencyField;
    tITranPago: TCurrencyField;
    tITranCancelado: TBooleanField;
    Timer1: TTimer;
    tRec: TnxTable;
    tRecID: TAutoIncField;
    tRecCliente: TIntegerField;
    tRecTran: TIntegerField;
    tTranNomeTipo: TStringField;
    tAuxTran: TnxTable;
    tITranNomeTipoItem: TStringField;
    txtExp: TfrxTXTExport;
    tITranPgAnt: TCurrencyField;
    tITranDescrItem: TStringField;
    tITranDescrPg: TStringField;
    tITranValorOriginal: TCurrencyField;
    tSessao: TnxTable;
    tMovEst: TnxTable;
    tTempo: TnxTable;
    tImp: TnxTable;
    tITranDescAnt: TCurrencyField;
    tSessaoID: TAutoIncField;
    tSessaoInicio: TDateTimeField;
    tSessaoTermino: TDateTimeField;
    tSessaoMinutosR: TFloatField;
    tSessaoMinutosC: TFloatField;
    tSessaoMaq: TWordField;
    tSessaoMaqI: TWordField;
    tSessaoEncerrou: TBooleanField;
    tSessaoCliente: TIntegerField;
    tSessaoTransfMaq: TBooleanField;
    tSessaoTipoCli: TWordField;
    tSessaoCancelado: TBooleanField;
    tSessaoTotal: TCurrencyField;
    tSessaoDesconto: TCurrencyField;
    tSessaoPagoPost: TCurrencyField;
    tSessaoDescPost: TCurrencyField;
    tSessaoPago: TCurrencyField;
    tSessaoNomeCliente: TStringField;
    tSessaoFuncI: TStringField;
    tSessaoFuncF: TStringField;
    tSessaoObs: TMemoField;
    tSessaoTipoAcesso: TIntegerField;
    tSessaoCaixaI: TIntegerField;
    tSessaoCaixaF: TIntegerField;
    tSessaoTicksI: TIntegerField;
    tSessaoPausado: TBooleanField;
    tSessaoInicioPausa: TIntegerField;
    tSessaoMinTicksUsados: TIntegerField;
    tSessaoMinTicksTotal: TIntegerField;
    tSessaoFimTicksUsados: TIntegerField;
    tSessaoFimTicksTotal: TIntegerField;
    tSessaoStrPausas: TMemoField;
    tSessaoStrTransfMaq: TMemoField;
    tSessaoStrFechamentoCaixa: TMemoField;
    tSessaoMinutosCli: TFloatField;
    tSessaoMinutosPrev: TFloatField;
    tSessaoMinutosMax: TFloatField;
    tSessaoMinutosCliU: TFloatField;
    tSessaoValorCli: TCurrencyField;
    tSessaoValorCliU: TFloatField;
    tSessaoTranI: TIntegerField;
    tSessaoTranF: TIntegerField;
    tTempoID: TAutoIncField;
    tTempoDataHora: TDateTimeField;
    tTempoFunc: TStringField;
    tTempoTipo: TWordField;
    tTempoMinutos: TFloatField;
    tTempoIDPacPass: TIntegerField;
    tTempoPassaporte: TIntegerField;
    tTempoTotal: TCurrencyField;
    tTempoDesconto: TCurrencyField;
    tTempoPagoPost: TCurrencyField;
    tTempoDescPost: TCurrencyField;
    tTempoPago: TCurrencyField;
    tTempoCliente: TIntegerField;
    tTempoMaq: TWordField;
    tTempoSessao: TIntegerField;
    tTempoCancelado: TBooleanField;
    tTempoTran: TIntegerField;
    tTempoCaixa: TIntegerField;
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
    tMovEstID: TAutoIncField;
    tMovEstTran: TIntegerField;
    tMovEstProduto: TIntegerField;
    tMovEstQuant: TFloatField;
    tMovEstUnitario: TCurrencyField;
    tMovEstTotal: TCurrencyField;
    tMovEstCustoU: TCurrencyField;
    tMovEstItem: TWordField;
    tMovEstDesconto: TCurrencyField;
    tMovEstPago: TCurrencyField;
    tMovEstPagoPost: TCurrencyField;
    tMovEstDescPost: TCurrencyField;
    tMovEstDataHora: TDateTimeField;
    tMovEstEntrada: TBooleanField;
    tMovEstCancelado: TBooleanField;
    tMovEstEstoqueAnt: TFloatField;
    tMovEstCliente: TIntegerField;
    tMovEstCaixa: TIntegerField;
    tMovEstCategoria: TStringField;
    tMovEstNaoControlaEstoque: TBooleanField;
    tMovEstITran: TIntegerField;
    tMovEstTipoTran: TWordField;
    tMovEstSessao: TIntegerField;
    tAuxTranID: TAutoIncField;
    tAuxTranDataHora: TDateTimeField;
    tAuxTranCliente: TIntegerField;
    tAuxTranTipo: TWordField;
    tAuxTranFunc: TStringField;
    tAuxTranTotal: TCurrencyField;
    tAuxTranDesconto: TCurrencyField;
    tAuxTranPago: TCurrencyField;
    tAuxTranDebito: TCurrencyField;
    tAuxTranObs: TMemoField;
    tAuxTranCancelado: TBooleanField;
    tAuxTranCanceladoPor: TStringField;
    tAuxTranCanceladoEm: TDateTimeField;
    tAuxTranCaixa: TIntegerField;
    tAuxTranMaq: TWordField;
    tAuxTranNomeCliente: TStringField;
    tAuxTranSessao: TIntegerField;
    tAuxTranDescr: TStringField;
    tITranDataOrig: TDateTimeField;
    tAuxITran: TnxTable;
    tAuxITranID: TAutoIncField;
    tAuxITranTran: TIntegerField;
    tAuxITranCaixa: TIntegerField;
    tAuxITranSessao: TIntegerField;
    tAuxITranDataHora: TDateTimeField;
    tAuxITranTipoTran: TWordField;
    tAuxITranTipoItem: TWordField;
    tAuxITranSubTipo: TWordField;
    tAuxITranItemID: TIntegerField;
    tAuxITranSubItemID: TIntegerField;
    tAuxITranItemPos: TWordField;
    tAuxITranTotal: TCurrencyField;
    tAuxITranDesconto: TCurrencyField;
    tAuxITranDebito: TCurrencyField;
    tAuxITranPago: TCurrencyField;
    tAuxITranCancelado: TBooleanField;
    tPro: TnxTable;
    tProCodigo: TStringField;
    tProUnid: TStringField;
    tProPreco: TCurrencyField;
    tProObs: TMemoField;
    tProImagem: TGraphicField;
    tProEstoqueAtual: TFloatField;
    tProCustoUnitario: TCurrencyField;
    tProEstoqueACE: TFloatField;
    tProEstoqueACS: TFloatField;
    tProEstoqueFinal: TFloatField;
    tProDescricao: TStringField;
    tProCategoria: TStringField;
    tProSubCateg: TStringField;
    tProPodeAlterarPreco: TBooleanField;
    tProNaoControlaEstoque: TBooleanField;
    tProID: TAutoIncField;
    dbConfig: TfrxDBDataset;
    repJT: TfrxReport;
    repMatrixFS: TfrxReport;
    repMatrix: TfrxReport;
    repJTFS: TfrxReport;
    procedure Timer1Timer(Sender: TObject);
    procedure tTranCalcFields(DataSet: TDataSet);
    procedure tITranCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Imprime(aTran: Integer; aVisualiza: Boolean = False);
    { Public declarations }
  end;

var
  dmComp: TdmComp = nil;

implementation

uses ncClassesBase, ncaDM;

{$R *.dfm}

procedure TdmComp.DataModuleCreate(Sender: TObject);
begin
  tAuxTran.Open;
  tPro.Open;
  tTran.Open;
  tRec.Open;
  tTempo.Open;
  tImp.Open;
  tMovEst.Open;
  tSessao.Open;
  tAuxITran.Open;
  tITran.Open;

  txtExp.FileName := ExtractFilePath(ParamStr(0))+'recibo.txt';
end;

procedure TdmComp.Imprime(aTran: Integer; aVisualiza: Boolean = False);
var 
  SL: TStrings;
  Arq : TextFile;
  I : Integer;
  R : TfrxReport;
  S: String;
begin
  if tTran.FindKey([aTran]) then begin
    tITran.SetRange([aTran], [aTran]);
    if Dados.CM.Config.RecMatricial then begin
      case tTranTipo.Value of
        trFimSessao : R := repMatrixFS;
      else
        R := repMatrix;    
      end;
    
      R.PrepareReport(True);
      R.Export(txtExp);
      
      AssignFile(Arq, Dados.CM.Config.RecPorta);
      Rewrite(Arq);

      SL := TStringList.Create;
      try
        SL.LoadFromFile(txtExp.FileName);
        SL.SaveToFile('c:\recibo.txt');
        S := SL.Text;
        repeat
          I := Pos(#12, S);
          if I>0 then 
            Delete(S, I, 1);
        until (I<=0);
        SL.Text := S;

        for I := 0 to SL.Count-1 do 
          Writeln(Arq, Sl[I]);
        for I := 1 to Dados.CM.Config.RecSalto do
          Writeln(Arq);
      finally
        SL.Free;
        CloseFile(Arq);
      end;
//      repMatrix.ShowReport(False);
    end else begin
      case tTranTipo.Value of
        trFimSessao : R := repJTFS
      else
        R := repJT;    
      end;
      R.PrepareReport(True);
      if aVisualiza then
        R.ShowReport(False) else
        R.Print;
//      repJT.ShowReport(False);
    end;
  end;
end;

procedure TdmComp.Timer1Timer(Sender: TObject);
var 
  Tran: Integer;
  Achou : Boolean;
begin
  Timer1.Enabled := tRec.Active;
  if tRec.Active then begin
    try
      Achou := tRec.FindKey([Dados.CM.Handle]);
    except
      Achou := False;
      Timer1.Enabled := False;
    end;
    if Achou then
    try
      Tran := tRecTran.Value;
      tRec.Delete;
    finally
      Imprime(Tran);
    end;
  end;
end;

procedure TdmComp.tITranCalcFields(DataSet: TDataSet);
var 
  V: Currency;
  S: String;
begin
  with tITranNomeTipoItem do
  case tITranTipoItem.Value of
    itSessao    : begin
      if tITranTipoTran.Value = trFimSessao then
        Value := 'FIM DE SESSÃO' else
        Value := 'SESSÃO';
    end;
    itMovEst    : Value := 'PRODUTO';
    itTempo     : Value := 'CRED.TEMPO';
    itTran      : Value := 'TRANSAÇÃO';
    itImpressao : Value := 'IMPRESSÃO';
  end;

  if (tITranTipoTran.Value in [trFimSessao, trPagDebito]) and
     ((tITranTipoItem.Value <> itSessao) or (tITranTipoTran.Value <> trFimSessao)) then
  begin
    case tITranTipoItem.Value of
      itSessao    : if tSessao.FindKey([tITranItemID.Value]) then
      begin
        tITranValorOriginal.Value := tSessaoTotal.Value;
        tITranPgAnt.Value := tSessaoPago.Value + tSessaoPagoPost.Value - tITranPago.Value;
        tITranDescAnt.Value := tSessaoDesconto.Value + tSessaoDescPost.Value - tITranDesconto.Value;
        tITranDataOrig.Value := tSessaoTermino.Value;
      end;
      
      itMovEst    : if tMovEst.FindKey([tITranItemID.Value]) then 
      begin
        tITranValorOriginal.Value := tMovEstTotal.Value;
        tITranPgAnt.Value := tMovEstPago.Value + tMovEstPagoPost.Value - tITranPago.Value;
        tITranDescAnt.Value := tMovEstDesconto.Value + tMovEstDescPost.Value - tITranDesconto.Value;
        tITranDataOrig.Value := tMovEstDataHora.Value;
      end;

      itTempo     : if tTempo.FindKey([tITranItemID.Value]) then 
      begin
        tITranValorOriginal.Value := tTempoTotal.Value;
        tITranPgAnt.Value := tTempoPago.Value + tTempoPagoPost.Value - tITranPago.Value;
        tITranDescAnt.Value := tTempoDesconto.Value + tTempoDescPost.Value - tITranDesconto.Value;
        tITranDataOrig.Value := tTempoDataHora.Value;
      end;
      
      itImpressao : if tImp.FindKey([tITranItemID.Value]) then 
      begin
        tITranValorOriginal.Value := tImpTotal.Value;
        tITranPgAnt.Value := tImpPago.Value + tImpPagoPost.Value - tITranPago.Value;
        tITranDescAnt.Value := tImpDesconto.Value + tImpDescPost.Value - tITranDesconto.Value;
        tITranDataOrig.Value := tImpDataHora.Value;
      end;
    end;
    V := tITranPgAnt.Value + tITranDescAnt.Value;
    if V>0.0009 then 
      tITranDescrPg.Value := FloatToStrF(V, ffCurrency, 15, 2) + ' Pg/Desc Ant';
  end else
    tITranDataOrig.Value := tITranDataHora.Value;

  S := '';
  case tITranTipoItem.Value of
    itMovEst : 
    if tMovEst.FindKey([tITranItemID.Value]) then begin
      S := tMovEstQuant.AsString+'-';
      if tPro.FindKey([tMovEstProduto.Value]) then 
        S := S + tProDescricao.Value else
        S := 'Produto';
    end else
      S := 'Produto';

    itSessao : begin
      if tSessao.FindKey([tITranItemID.Value]) then
        S := tITranNomeTipoItem.Value + ': Tempo de uso' + MinutosToHMSStr(tSessaoMinutosR.Value) else
        S := tITranNomeTipoItem.Value;
      tITranValorOriginal.Value := tITranTotal.Value;  
    end;

    itTempo     : begin
      if tAuxITran.FindKey([tITranTipoItem.Value, tITranItemID.Value]) and
         tAuxTran.FindKey([tAuxITranTran.Value]) then 
        S := 'Cred.Tempo: ' + tAuxTranDescr.Value else
        S := 'Cred.Tempo';
    end;
    
    itImpressao : begin  
      if tAuxITran.FindKey([tITranTipoItem.Value, tITranItemID.Value]) and
         tAuxTran.FindKey([tAuxITranTran.Value]) then 
        S := 'Impressão: ' + tAuxTranDescr.Value else
        S := 'Impressão';
    end;
  end;

  if tITranTipoTran.Value = trPagDebito then
  if tITranDescrPg.Value='' then
    tITranDescrPg.Value := FormatDateTime('dd/mm/yyyy', tITranDataOrig.Value) else
    S := S + ' - ' + FormatDateTime('dd/mm/yyyy', tITranDataOrig.Value);

  tITranDescrItem.Value := S;
end;

procedure TdmComp.tTranCalcFields(DataSet: TDataSet);
begin
  with tTranNomeTipo do
  case tTranTipo.Value of
    trInicioSessao  : Value := 'INICIO DE SESSÃO';
    trFimSessao     : Value := 'RECIBO DE USO DE COMPUTADOR';
    trCredTempo     : Value := 'CRÉDITO DE TEMPO';
    trDebTempo      : Value := 'DÉBITO DE TEMPO';
    trEstVenda      : Value := 'VENDA DE PRODUTOS';
    trEstCompra     : Value := 'COMPRA';
    trEstEntrada    : Value := 'ENTRADA DE ESTOQUE';
    trEstSaida      : Value := 'SAIDA DE ESTOQUE';
    trPagDebito     : Value := 'PAGAMENTO DE DEBITOS';
    trCaixaEnt      : Value := 'SUPRIMENTO DE CAIXA';
    trCaixaSai      : Value := 'SANGRIA DE CAIXA';
    trImpressao     : Value := 'IMPRESSÃO';
    trTransfMaq     : Value := 'TRANSFERÊNCIA DE MÁQUINA';
  end;
end;

end.
