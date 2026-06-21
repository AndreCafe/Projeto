unit ncaDMComp;
{
    ResourceString: Dario 10/03/13
    João: TODO List!
}

interface

uses
  SysUtils, Classes, Dialogs, frxClass, DB, nxdb, frxDBSet, ExtCtrls, frxExportTXT,
   uNexTransResourceStrings_PT, OoMisc, AdPort, frxDCtrl, frxCross, frxChBox,
  frxBarcode, frxRich, frxDesgn, frxExportPDF, frxExportMail, frxExportRTF,
  frxDMPExport;

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
    repSerialFS: TfrxReport;
    repSerial: TfrxReport;
    repWin: TfrxReport;
    repWinFS: TfrxReport;
    ApdComPort1: TApdComPort;
    repWinBFS_OLD: TfrxReport;
    repWinB: TfrxReport;
    tITranQuant: TStringField;
    tITranQuantUnid: TStringField;
    repCustom: TfrxReport;
    frxRTFExport1: TfrxRTFExport;
    frxMailExport1: TfrxMailExport;
    frxPDFExport1: TfrxPDFExport;
    Designer: TfrxDesigner;
    frxRichObject1: TfrxRichObject;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    frxCrossObject1: TfrxCrossObject;
    frxDialogControls1: TfrxDialogControls;
    tITranUnitario: TCurrencyField;
    dbProduto: TfrxDBDataset;
    repWinBFS: TfrxReport;
    tCliente: TnxTable;
    dbCliente: TfrxDBDataset;
    tTranTotLiq: TCurrencyField;
    tTranDebitoAnt: TCurrencyField;
    tTranDebitoPago: TCurrencyField;
    tTranCreditoAnt: TCurrencyField;
    tTranCredito: TCurrencyField;
    tTranCreditoUsado: TCurrencyField;
    tTranTroco: TCurrencyField;
    tTranCaixaPag: TIntegerField;
    tTranQtdTempo: TFloatField;
    tTranCredValor: TBooleanField;
    tTranPagPend: TBooleanField;
    dmExp: TfrxDotMatrixExport;
    tTranTipoPago: TWordField;
    tAuxTranTipoPago: TWordField;
    procedure DataModuleDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure tTranCalcFields(DataSet: TDataSet);
    procedure tITranCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    prnIniValues : TStringList;
    prnIniFileName : string;
    procedure LoadPrnIni(prnName:string);
    procedure readPrnIni(prnName:string);
    procedure savePrnIni(prnName:string);
    function  ValueToPrnIni(s:string):string;
    function  PrnIniToValue(s:string):string;
    procedure loadDefValues;
    procedure ImprimeWindows(aTran: Integer; aVisualiza: Boolean = False);
    procedure ImprimeSerial(aTran: Integer; aVisualiza: Boolean = False);
    //procedure ImprimeMatricial(aTran: Integer; aVisualiza: Boolean = False);
    { Private declarations }
  public
    procedure Imprime(aTran: Integer; aVisualiza: Boolean = False);
    procedure Customize(aFimSessao, aWindows, aBobina: Boolean);
    { Public declarations }
  end;

var
  dmComp: TdmComp = nil;

implementation

uses ncClassesBase, ncaDM, ncDebug, inifiles, Printers, Winspool,
  FileCtrl;

// START resource string wizard section
// MMX resource string wizard section REMOVIDA - 08/04/13 12:30


procedure PrintFile(const sPrinter, sFileName: string; aDataType: String = 'TEXT');
const
  iBufferSize = 32768;
var
  Count, BytesWritten: Cardinal;
  hPrinter, hDeviceMode: THandle;
  sDevice : array[0..255] of char;
  sDriver : array[0..255] of char;
  sPort   : array[0..255] of char;
  DocInfo: TDocInfo1A;
  f: File;
  pBuffer: Pointer;
begin
  Printer.PrinterIndex := Printer.Printers.IndexOf(sPrinter);
  Printer.GetPrinter(sDevice, sDriver, sPort, hDeviceMode);

  if not WinSpool.OpenPrinter(@sDevice, hPrinter, nil) then
     exit;

  DocInfo.pDocName := 'NEXCAFE_RECIBO';
  DocInfo.pDatatype := PAnsiChar(aDataType);
  DocInfo.pOutputFile := nil;
  
  if StartDocPrinter(hPrinter, 1, @DocInfo) = 0 then
  begin
    WinSpool.ClosePrinter(hPrinter);
    exit;
  end;

  if not StartPagePrinter(hPrinter) then
  begin
    EndDocPrinter(hPrinter);
    WinSpool.ClosePrinter(hPrinter);
    exit;
  end;

  System.Assign(f, sFileName);
  try
    Reset(f, 1);
    GetMem(pBuffer, iBufferSize);
    while not eof(f) do
    begin
      Blockread(f, pBuffer^, iBufferSize, Count);
      if Count>0 then
      begin
        if not WritePrinter(hPrinter, pBuffer, Count, BytesWritten) then
        begin
          EndPagePrinter(hPrinter);
          EndDocPrinter(hPrinter);
          WinSpool.ClosePrinter(hPrinter);
          FreeMem(pBuffer, iBufferSize);
          exit;
        end;
      end;
    end;
    FreeMem(pBuffer, iBufferSize);
    EndDocPrinter(hPrinter);
    WinSpool.ClosePrinter(hPrinter);
  finally
    System.Closefile(f);
  end;
end;


function FolderBaseComp: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'custom\';
end;


Const
    S_ReciboTxt = 'recibo.txt';  // do not localize
    S_prnIni    = 'NexPrn.ini';  // do not localize
    SPrnCmd_SetCodePage                 = #27+#116; // +n       // do not localize
    SPrnCmd_AtivaModoNormal             = #27+'H';              // do not localize
    SPrnCmd_AtivaModoCondensado         = #27+#15;              // do not localize
    SPrnCmd_DesativaModoCondensado      = #27+#18;              // do not localize
    SPrnCmd_AtivaModoExpandido          = #27+'W';  // +n       // do not localize
    SPrnCmd_DesativaModoExpandido       = #27+'W';  // +n       // do not localize
    SPrnCmd_AtivaItalico                = #27+#4;               // do not localize
    SPrnCmd_DesativaItalico             = #27+#5;               // do not localize
    SPrnCmd_AtivaRealce                 = #27+'E';              // do not localize
    SPrnCmd_DesativaRealce              = #27+'F';              // do not localize
    SPrnCmd_AcionarCortePapel           = #27+'w';              // do not localize

    S_SetCodePage                 = 'SetCodePage';              // do not localize
    S_AtivaModoNormal             = 'AtivaModoNormal';          // do not localize
    S_AtivaModoCondensado         = 'AtivaModoCondensado';      // do not localize
    S_DesativaModoCondensado      = 'DesativaModoCondensado';   // do not localize
    S_AtivaModoExpandido          = 'AtivaModoExpandido';       // do not localize
    S_DesativaModoExpandido       = 'DesativaModoExpandido';    // do not localize
    S_AtivaItalico                = 'AtivaItalico';             // do not localize
    S_DesativaItalico             = 'DesativaItalico';          // do not localize
    S_AtivaRealce                 = 'AtivaRealce';              // do not localize
    S_DesativaRealce              = 'DesativaRealce';           // do not localize
    S_AcionarCortePapel           = 'AcionarCortePapel';        // do not localize


resourcestring
  rsErroProdutoNaoExiste = '## Erro: produto não existe';    

{$R *.dfm}

procedure TdmComp.DataModuleDestroy(Sender: TObject);
begin
    prnIniValues.Free;
end;

procedure TdmComp.Customize(aFimSessao, aWindows, aBobina: Boolean);
var 
  R: TfrxReport; S: String;
begin
  if aWindows then begin
    if aBobina then begin
      if aFimSessao then
        R := repWinBFS else
        R := repWinB;
    end else begin
      if aFimSessao then
        R := repWinFS else
        R := repWin;
    end;
  end else
  if aFimSessao then
    R := repSerialFS else
    R := repSerial;

  CreateDir(FolderBaseComp);

  S := FolderBaseComp+R.Name+'.fr3';
  if not FileExists(S) then 
    R.SaveToFile(S);

  repCustom.LoadFromFile(S);
  repCustom.FileName := S;
  repCustom.DesignReport;  
end;

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

  prnIniValues := TStringList.create;
  dmExp.FileName := ExtractFilePath(ParamStr(0))+S_ReciboTxt;
  prnIniFileName  := ExtractFilePath(ParamStr(0))+S_prnIni;
end;

procedure TdmComp.LoadPrnIni(prnName:string);
begin
    if FileExists(prnIniFileName) then
        readPrnIni(prnName)
    else begin
        loadDefValues;
        savePrnIni(prnName)
    end;

end;

procedure TdmComp.readPrnIni(prnName:string);
var
    sections : TStringList;
    inif : TIniFile;
begin
    inif := TIniFile.create(prnIniFileName);
    sections := TStringList.create;
    try
        if inif.SectionExists(prnName) then begin
            prnIniValues.add(S_SetCodePage+'='+PrnIniToValue(inif.ReadString(prnName, S_SetCodePage, SPrnCmd_SetCodePage)));
            prnIniValues.add(S_AtivaModoNormal+'='+PrnIniToValue(inif.ReadString(prnName, S_AtivaModoNormal, SPrnCmd_AtivaModoNormal)));
            prnIniValues.add(S_AtivaModoCondensado+'='+PrnIniToValue(inif.ReadString(prnName, S_AtivaModoCondensado, SPrnCmd_AtivaModoCondensado)));
            prnIniValues.add(S_DesativaModoCondensado+'='+PrnIniToValue(inif.ReadString(prnName, S_DesativaModoCondensado, SPrnCmd_DesativaModoCondensado)));
            prnIniValues.add(S_AtivaModoExpandido+'='+PrnIniToValue(inif.ReadString(prnName, S_AtivaModoExpandido, SPrnCmd_AtivaModoExpandido)));
            prnIniValues.add(S_DesativaModoExpandido+'='+PrnIniToValue(inif.ReadString(prnName, S_DesativaModoExpandido, SPrnCmd_DesativaModoExpandido)));
            prnIniValues.add(S_AtivaItalico+'='+PrnIniToValue(inif.ReadString(prnName, S_AtivaItalico, SPrnCmd_AtivaItalico)));
            prnIniValues.add(S_DesativaItalico+'='+PrnIniToValue(inif.ReadString(prnName, S_DesativaItalico, SPrnCmd_DesativaItalico)));
            prnIniValues.add(S_AtivaRealce+'='+PrnIniToValue(inif.ReadString(prnName, S_AtivaRealce, SPrnCmd_AtivaRealce)));
            prnIniValues.add(S_DesativaRealce+'='+PrnIniToValue(inif.ReadString(prnName, S_DesativaRealce, SPrnCmd_DesativaRealce)));
            prnIniValues.add(S_AcionarCortePapel+'='+PrnIniToValue(inif.ReadString(prnName, S_AcionarCortePapel, SPrnCmd_AcionarCortePapel)));
        end else begin
            loadDefValues;
            savePrnIni(prnName);
        end;
    finally
        sections.free;
        inif.free;
    end;
end;

procedure TdmComp.savePrnIni(prnName:string);
var
    inif : TIniFile;
begin
    inif := TIniFile.create(prnIniFileName);
    try
        inif.WriteString(prnName, S_SetCodePage, ValueToPrnIni(prnIniValues.Values[S_SetCodePage]));
        inif.WriteString(prnName, S_AtivaModoNormal, ValueToPrnIni(prnIniValues.Values[S_AtivaModoNormal]));
        inif.WriteString(prnName, S_AtivaModoCondensado, ValueToPrnIni(prnIniValues.Values[S_AtivaModoCondensado]));
        inif.WriteString(prnName, S_DesativaModoCondensado, ValueToPrnIni(prnIniValues.Values[S_DesativaModoCondensado]));
        inif.WriteString(prnName, S_AtivaModoExpandido, ValueToPrnIni(prnIniValues.Values[S_AtivaModoExpandido]));
        inif.WriteString(prnName, S_DesativaModoExpandido, ValueToPrnIni(prnIniValues.Values[S_DesativaModoExpandido]));
        inif.WriteString(prnName, S_AtivaItalico, ValueToPrnIni(prnIniValues.Values[S_AtivaItalico]));
        inif.WriteString(prnName, S_DesativaItalico, ValueToPrnIni(prnIniValues.Values[S_DesativaItalico]));
        inif.WriteString(prnName, S_AtivaRealce, ValueToPrnIni(prnIniValues.Values[S_AtivaRealce]));
        inif.WriteString(prnName, S_DesativaRealce, ValueToPrnIni(prnIniValues.Values[S_DesativaRealce]));
        inif.WriteString(prnName, S_AcionarCortePapel, ValueToPrnIni(prnIniValues.Values[S_AcionarCortePapel]));
    finally
        inif.free;
    end;
end;

procedure TdmComp.loadDefValues;
begin
    prnIniValues.add(S_SetCodePage+'='+SPrnCmd_SetCodePage);
    prnIniValues.add(S_AtivaModoNormal+'='+SPrnCmd_AtivaModoNormal);
    prnIniValues.add(S_AtivaModoCondensado+'='+SPrnCmd_AtivaModoCondensado);
    prnIniValues.add(S_DesativaModoCondensado+'='+SPrnCmd_DesativaModoCondensado);
    prnIniValues.add(S_AtivaModoExpandido+'='+SPrnCmd_AtivaModoExpandido);
    prnIniValues.add(S_DesativaModoExpandido+'='+SPrnCmd_DesativaModoExpandido);
    prnIniValues.add(S_AtivaItalico+'='+SPrnCmd_AtivaItalico);
    prnIniValues.add(S_DesativaItalico+'='+SPrnCmd_DesativaItalico);
    prnIniValues.add(S_AtivaRealce+'='+SPrnCmd_AtivaRealce);
    prnIniValues.add(S_DesativaRealce+'='+SPrnCmd_DesativaRealce);
    prnIniValues.add(S_AcionarCortePapel+'='+SPrnCmd_AcionarCortePapel);
end;

function  TdmComp.ValueToPrnIni(s:string):string;
var
    i : integer;
begin
    result := '';
    for I := 1 to Length(s) do
        result := result + inttostr(ord(s[i]))+';';
    if length(result)>0 then
        Setlength(result, length(result)-1);
end;

function  TdmComp.PrnIniToValue(s:string):string;
var
    sl : TStringList;
    i : integer;

    function isInteger(s:string):boolean;
    var
        ii : integer;
    begin
        result := true;
        for ii := 1 to Length(s) do
           if not(s[ii] in ['0'..'9']) then begin
               result := false;
               exit;
           end;

    end;
begin
    result := '';
    sl := TStringList.create;
    try
        sl.LineBreak := ';';
        sl.Text := s;
        for I := 0 to sl.Count - 1 do begin
            if isInteger(sl[i]) then
                result := result + char(strtoint(sl[i]))
            else
                result := result + sl[i];
        end;

    finally
        sl.free;
    end;
end;

procedure TdmComp.ImprimeSerial(aTran: Integer; aVisualiza: Boolean);
var
    p, i : integer;
    R : TfrxReport;
    sl : TStringList;
    s : string;


    procedure Aguardar(milisec:integer);
    begin
            while ApdComPort1.OutBuffUsed>0 do sleep(5);
             sleep(1);
    end;
    
    procedure SerialPrint(s:string);
    begin
            ApdComPort1.PutString(s);
            Aguardar(5);
    end;

    procedure SerialPrintLn(const s:string='');
    begin
            ApdComPort1.PutString(s+#13+#10);
            Aguardar(5);
    end;

    procedure SetCodePage(n:integer);
    begin
            SerialPrint(prnIniValues.Values[S_SetCodePage]+char(n));
    end;

begin
  DebugMsg('TdmComp.ImprimeSerial');
    if tryStrToInt(gConfig.RecPorta, p) then begin

        LoadPrnIni(gConfig.RecTipoImpressora);

        case tTranTipo.Value of
          trFimSessao : R := repSerialFS;
        else
          R := repSerial;
        end;

        R.PrepareReport(True);
        R.Export(dmExp);

        ApdComPort1.ComNumber := p;
        ApdComPort1.Open := true;
        sl := TStringList.create;
        try
            sl.loadFromFile(dmExp.FileName);

            S := SL.Text;
            repeat
              I := Pos(#12, S);
              if I>0 then
                Delete(S, I, 1);
            until (I<=0);
            SL.Text := S;

            if gConfig.RecLargura >40 then
                SerialPrint(prnIniValues.Values[S_AtivaModoCondensado])
            else
                SerialPrint(prnIniValues.Values[S_AtivaModoNormal]);


            {SetCodePage(2);
            for I := 0 to SL.Count-1 do
                SerialPrintLn(Sl[I]);
            SetCodePage(3);
            for I := 0 to SL.Count-1 do
                SerialPrintLn(Sl[I]);
            SetCodePage(4);
            for I := 0 to SL.Count-1 do
                SerialPrintLn(Sl[I]);
            SetCodePage(5);
            for I := 0 to SL.Count-1 do
                SerialPrintLn(Sl[I]);
            SetCodePage(6);
            for I := 0 to SL.Count-1 do
                SerialPrintLn(Sl[I]);
            SetCodePage(7);
            for I := 0 to SL.Count-1 do
                SerialPrintLn(Sl[I]);
            SetCodePage(8);
            for I := 0 to SL.Count-1 do
                SerialPrintLn(Sl[I]);
            SetCodePage(9);
            for I := 0 to SL.Count-1 do
                SerialPrintLn(Sl[I]);
            SetCodePage(10);
            for I := 0 to SL.Count-1 do
                SerialPrintLn(Sl[I]);
            SetCodePage(11);
            for I := 0 to SL.Count-1 do
                SerialPrintLn(Sl[I]);
            SetCodePage(12);
            for I := 0 to SL.Count-1 do
                SerialPrintLn(Sl[I]);
            SetCodePage(14);
            for I := 0 to SL.Count-1 do
                SerialPrintLn(Sl[I]);
            SetCodePage(21);
            for I := 0 to SL.Count-1 do
                SerialPrintLn(Sl[I]); }

            SetCodePage(8);
            for I := 0 to SL.Count-1 do
                SerialPrintLn(AnsiToUtf8(Sl[I]));

            for I := 1 to gConfig.RecSalto do
                SerialPrintLn;

            if gConfig.RecCortaFolha then
                SerialPrint(prnIniValues.Values[S_AcionarCortePapel]);

        finally
            ApdComPort1.Open := false;
            sl.free;
        end;
    end;
end;

procedure TdmComp.ImprimeWindows(aTran: Integer; aVisualiza: Boolean);
var
  R : TfrxReport;  S: String;
begin
      DebugMsg('TdmComp.Imprime - RecMatricial = FALSE'); // do not localize


      {case tTranTipo.Value of
        trFimSessao : R := repJTFS
      else
        R := repJT;
      end;
      case tTranTipo.Value of
        trFimSessao : R := repMatrixFS;
      else
        R := repMatrix;
      end; }

      if tTranTipo.Value=trFimSessao then
      begin
        if gConfig.RecPrinterGeneric then begin
          R := repSerialFS;
          DebugMsg('TdmComp.ImprimeWindows - repSerialFS');
        end else
        if gConfig.RecBobina then
        begin
          R := repWinBFS;
          DebugMsg('TdmComp.ImprimeWindows - repWinBFS');
        end else begin
          R := repWinFS;
          DebugMsg('TdmComp.ImprimeWindows - repWinFS');
        end;
      end else begin
        if gConfig.RecPrinterGeneric then begin
          R := repSerial;
          DebugMsg('TdmComp.ImprimeWindows - repSerial');
        end else
        if gConfig.RecBobina then begin
          DebugMsg('TdmComp.ImprimeWindows - repWinB');
          R := repWinB;
        end else begin
          R := repWin;
          DebugMsg('TdmComp.ImprimeWindows - repWin');
        end;
      end;

      try
        S := FolderBaseComp+R.Name+'.fr3';
        if gConfig.IsPremium then
        if FileExists(S) then begin
          repCustom.LoadFromFile(S);
          R := repCustom;
          DebugMsg('TdmComp.ImprimeWindows - Custom Load Ok - '+S);
        end;
      except
        on E: Exception do 
          DebugMsg('TdmComp.ImprimeWindows - Custom Load ('+S+')Exception: '+E.Message);
      end;
      
      R.PrintOptions.Printer := gConfig.RecTipoImpressora;
      R.PrintOptions.ShowDialog := False;
      R.PrepareReport(True);
{     if aVisualiza then
        R.ShowReport(False) else
        R.Print;}
//      repJT.ShowReport(False);

  if gConfig.RecPrinterGeneric then begin
    R.Export(dmExp);
    PrintFile(gConfig.RecTipoImpressora, dmExp.FileName, 'TEXT');
  end else
    R.Print;   
 end;

procedure TdmComp.Imprime(aTran: Integer; aVisualiza: Boolean = False);
begin
  DebugMsg('tDMComp.Imprime - aTran: ' + IntToStr(aTran)); // do not localize
  if tTran.FindKey([aTran]) then begin
    tCliente.Active := True;
    tCliente.SetRange([tTranCliente.Value], [tTranCliente.Value]);
    tITran.SetRange([aTran], [aTran]);
    if gConfig.ImpOutras then 
      ImprimeSerial(aTran, aVisualiza) else
      ImprimeWindows(aTran, aVisualiza);
  end;
end;

{
procedure TdmComp.ImprimeMatricial(aTran: Integer; aVisualiza: Boolean = False);
var 
  SL: TStrings;
  Arq : TextFile;
  I : Integer;
  R : TfrxReport;
  S: String;
begin
  DebugMsg('tDMComp.Imprime - aTran: ' + IntToStr(aTran)); // do not localize
  if tTran.FindKey([aTran]) then begin
    tITran.SetRange([aTran], [aTran]);
    if Dados.CM.Config.RecMatricial then begin
      DebugMsg('tDMComp.Imprime - RecMatricial = True'); // do not localize
    
      case tTranTipo.Value of
        trFimSessao : R := repMatrixFS;
      else
        R := repMatrix;    
      end;
    
      R.PrepareReport(True);
      R.Export(txtExp);

      DebugMsg('TdmComp.Imprime - AssignFile: ' + ncaDM.PortaRec); // do not localize
      
      AssignFile(Arq, ncaDM.PortaRec);

      DebugMsg('TdmComp.Imprime - Rewrite'); // do not localize
      
      Rewrite(Arq);

      DebugMsg('TdmComp.Imprime - Rewrite Ok'); // do not localize

      SL := TStringList.Create;
      try
        DebugMsg('TdmComp.Imprime - SL.LoadFromFile: ' + txtExp.FileName); // do not localize
        SL.LoadFromFile(txtExp.FileName);
        DebugMsg('TdmComp.Imprime - SaveToFile'); // do not localize
        SL.SaveToFile(ExtractFilePath(ParamStr(0))+SRecibo_ultimoTxt);
        DebugMsg('TdmComp.Imprime - SaveToFile OK'); // do not localize
        S := SL.Text;
        repeat
          I := Pos(#12, S);
          if I>0 then 
            Delete(S, I, 1);
        until (I<=0);
        SL.Text := S;

        DebugMsg('TdmComp.Imprime - Imprimir!'); // do not localize
        

        for I := 0 to SL.Count-1 do 
          Writeln(Arq, Sl[I]);

        DebugMsg('TdmComp.Imprime - Saltar'); // do not localize
          
        for I := 1 to Dados.CM.Config.RecSalto do
          Writeln(Arq);
      finally
        SL.Free;
        CloseFile(Arq);
      end;
//      repMatrix.ShowReport(False);
    end else begin
      DebugMsg('TdmComp.Imprime - RecMatricial = FALSE'); // do not localize
    
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
}

procedure TdmComp.Timer1Timer(Sender: TObject);
var 
  Tran: Integer;
  Achou : Boolean;
begin
  Tran := 0;
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
        Value := SncaDMComp_FIMDESESSAO else
        Value := 'SESSÃO'; // TODO : check string
    end;
    itMovEst    : Value := 'PRODUTO'; // TODO : check string
    itTempo     : Value := 'CRED.TEMPO'; // TODO : check string
    itTran      : Value := 'TRANSAÇÃO'; // TODO : check string
    itImpressao : Value := 'IMPRESSÃO'; // TODO : check string
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
        tITranUnitario.Value := tMovEstUnitario.Value;
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
      tITranDescrPg.Value := FloatToStrF(V, ffCurrency, 15, 2) + SncaDMComp_PgDescAnt;
  end else
    tITranDataOrig.Value := tITranDataHora.Value;

  S := '';
  case tITranTipoItem.Value of
    itMovEst : 
    if tMovEst.FindKey([tITranItemID.Value]) then begin
      tITranQuant.Value := tMovEstQuant.AsString;
      tITranUnitario.Value := tMovEstUnitario.Value;
      
      if tPro.FindKey([tMovEstProduto.Value]) then begin
        S := tProDescricao.Value;
        if tProUnid.Value>'' then
          tITranQuantUnid.Value := tITranQuant.Value + ' ('+tProUnid.Value+')' else
          tITranQuantUnid.Value := tITranQuant.Value;
      end else begin
        S := rsErroProdutoNaoExiste;
      end;
    end else
      S := 'Produto'; // do not localize

    itSessao : begin
      if tSessao.FindKey([tITranItemID.Value]) then
        S := tITranNomeTipoItem.Value + SncaDMComp_TempoDeUso + MinutosToHMSStr(tSessaoMinutosR.Value) else
        S := tITranNomeTipoItem.Value;
      tITranValorOriginal.Value := tITranTotal.Value;
    end;

    itTempo     : begin
      if tAuxITran.FindKey([tITranTipoItem.Value, tITranItemID.Value]) and
         tAuxTran.FindKey([tAuxITranTran.Value]) then 
        S := SncaDMComp_CredTempo_1 + tAuxTranDescr.Value else
        S := SncaDMComp_CredTempo_2;
    end;
    
    itImpressao : begin  
      if tAuxITran.FindKey([tITranTipoItem.Value, tITranItemID.Value]) and
         tAuxTran.FindKey([tAuxITranTran.Value]) then 
        S := SncaDMComp_Impressao_2 + tAuxTranDescr.Value else
        S := SncaDMComp_Impressao_2;
    end;
  end;

  if tITranTipoTran.Value = trPagDebito then
  if tITranDescrPg.Value='' then
    tITranDescrPg.Value := FormatDateTime('dd/mm/yyyy', tITranDataOrig.Value) else // TODO : check string
    S := S + ' - ' + FormatDateTime('dd/mm/yyyy', tITranDataOrig.Value); // TODO : check string

  tITranDescrItem.Value := S;
end;

procedure TdmComp.tTranCalcFields(DataSet: TDataSet);
begin
  with tTranNomeTipo do
  case tTranTipo.Value of
    trInicioSessao  : Value := 'INICIO DE SESSÃO'; // TODO : check string
    trFimSessao     : Value := 'RECIBO DE USO DE COMPUTADOR'; // TODO : check string
    trCredTempo     : Value := 'CRÉDITO DE TEMPO'; // TODO : check string
    trDebTempo      : Value := 'DÉBITO DE TEMPO'; // TODO : check string
    trEstVenda      : Value := 'VENDA DE PRODUTOS'; // TODO : check string
    trEstCompra     : Value := 'COMPRA'; // TODO : check string
    trEstEntrada    : Value := 'ENTRADA DE ESTOQUE'; // TODO : check string
    trEstSaida      : Value := 'SAIDA DE ESTOQUE'; // TODO : check string
    trPagDebito     : Value := 'PAGAMENTO DE DEBITOS'; // TODO : check string
    trCaixaEnt      : Value := 'SUPRIMENTO DE CAIXA'; // TODO : check string
    trCaixaSai      : Value := 'SANGRIA DE CAIXA'; // TODO : check string
    trImpressao     : Value := 'IMPRESSÃO'; // TODO : check string
    trTransfMaq     : Value := 'TRANSFERÊNCIA DE MÁQUINA'; // TODO : check string
  end;
end;

end.

