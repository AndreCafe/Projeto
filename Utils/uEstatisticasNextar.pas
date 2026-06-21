unit uEstatisticasNextar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, nxsdServerEngine, nxreRemoteServerEngine, nxdb,
  nxllComponent, cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxPC, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxImageComboBox, cxSpinEdit, dxSkinsCore, dxSkinOffice2007Black, dxSkinSeven,
  dxSkinsDefaultPainters, StdCtrls, LMDControl, ExtCtrls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSharp,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, kbmMemTable, cxMaskEdit, cxDropDownEdit;

type
  TForm13 = class(TForm)
    Paginas: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    tvRec: TcxGridDBTableView;
    glRec: TcxGridLevel;
    gridRec: TcxGrid;
    nxSession: TnxSession;
    nxDB: TnxDatabase;
    qRec: TnxQuery;
    DataSource1: TDataSource;
    nxRSE: TnxRemoteServerEngine;
    nxTCP: TnxWinsockTransport;
    tvRecMes: TcxGridDBColumn;
    tvRecAno: TcxGridDBColumn;
    tvRecTotal: TcxGridDBColumn;
    cxTabSheet2: TcxTabSheet;
    gridVen: TcxGrid;
    TVVen: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    glVen: TcxGridLevel;
    qVen: TnxQuery;
    dsVen: TDataSource;
    cxTabSheet3: TcxTabSheet;
    dsCad: TDataSource;
    qCadAnt: TnxQuery;
    gridCad: TcxGrid;
    TVCad: TcxGridDBTableView;
    glCad: TcxGridLevel;
    cxTabSheet4: TcxTabSheet;
    dsAR: TDataSource;
    qAR: TnxQuery;
    GridAReceber: TcxGrid;
    TVAReceber: TcxGridDBTableView;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    VAReceberColumn1: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    glAReceber: TcxGridLevel;
    TVAR2: TcxGridDBTableView;
    GLAR2: TcxGridLevel;
    GridAR2: TcxGrid;
    qAR2: TnxQuery;
    dsAR2: TDataSource;
    qAR2loja: TStringField;
    qAR2ID: TIntegerField;
    qAR2rLoja: TIntegerField;
    qAR2Vencimento: TDateField;
    qAR2Pagamento: TDateField;
    qAR2Valor: TCurrencyField;
    qAR2ValorPago: TCurrencyField;
    qAR2Obs: TMemoField;
    qAR2Doc: TStringField;
    qAR2Descricao: TStringField;
    qAR2Lancamento: TDateTimeField;
    qAR2Tipo: TStringField;
    qAR2PC: TIntegerField;
    qAR2SituacaoCobr: TWordField;
    TVAR2loja: TcxGridDBColumn;
    TVAR2rLoja: TcxGridDBColumn;
    TVAR2Vencimento: TcxGridDBColumn;
    TVAR2Pagamento: TcxGridDBColumn;
    TVAR2Valor: TcxGridDBColumn;
    TVAR2ValorPago: TcxGridDBColumn;
    TVAR2Obs: TcxGridDBColumn;
    TVAR2Doc: TcxGridDBColumn;
    TVAR2Descricao: TcxGridDBColumn;
    TVAR2Lancamento: TcxGridDBColumn;
    TVAR2Tipo: TcxGridDBColumn;
    TVAR2PC: TcxGridDBColumn;
    TVAR2SituacaoCobr: TcxGridDBColumn;
    qARDia: TIntegerField;
    qARMes: TIntegerField;
    qARAno: TIntegerField;
    qARTotal: TCurrencyField;
    qCadAntDS: TIntegerField;
    qCadAntDia: TIntegerField;
    qCadAntMes: TIntegerField;
    qCadAntAno: TIntegerField;
    qCadAntLojas: TLargeintField;
    qCadAntMaquinas: TLargeintField;
    LMDSimplePanel1: TLMDSimplePanel;
    Button1: TButton;
    Button2: TButton;
    lbCalc: TLabel;
    Timer1: TTimer;
    qDes: TnxQuery;
    qDesLojas: TLargeintField;
    dsDES: TDataSource;
    mtCad: TkbmMemTable;
    mtCadAno: TWordField;
    mtCadMes: TWordField;
    mtCadDia: TWordField;
    mtCadCriacao: TWordField;
    mtCadAtivacao: TWordField;
    mtCadChurn: TWordField;
    mtCadFree: TWordField;
    mtCadPremium: TWordField;
    mtCadDefinitivo: TWordField;
    mtCadTotal: TWordField;
    TVCadAno: TcxGridDBColumn;
    TVCadMes: TcxGridDBColumn;
    TVCadDia: TcxGridDBColumn;
    TVCadCriacao: TcxGridDBColumn;
    TVCadAtivacao: TcxGridDBColumn;
    TVCadNaoAtivou: TcxGridDBColumn;
    TVCadChurn: TcxGridDBColumn;
    TVCadFree: TcxGridDBColumn;
    TVCadPremium: TcxGridDBColumn;
    TVCadDefinitivo: TcxGridDBColumn;
    TVCadTotal: TcxGridDBColumn;
    qCad: TnxQuery;
    qCadLojas: TLargeintField;
    qAti: TnxQuery;
    qAtiLojas: TLargeintField;
    qDesAno: TWordField;
    qDesMes: TWordField;
    qDesDia: TWordField;
    qCadAno: TWordField;
    qCadMes: TWordField;
    qCadDia: TWordField;
    qAtiAno: TWordField;
    qAtiMes: TWordField;
    qAtiDia: TWordField;
    mtCadDS: TWordField;
    mtCadNaoAtivou: TIntegerField;
    mtCadpercAtivacao: TFloatField;
    mtCadpercNAtivou: TFloatField;
    mtCadpercAbandono: TFloatField;
    mtCadSaldo: TIntegerField;
    mtCadpercSaldo: TFloatField;
    TVCadpercAtivacao: TcxGridDBColumn;
    TVCadpercNAtivou: TcxGridDBColumn;
    TVCadpercAbandono: TcxGridDBColumn;
    TVCadSaldo: TcxGridDBColumn;
    TVCadpercSaldo: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cmExp: TButton;
    dlgExp: TSaveDialog;
    mtCadDias: TIntegerField;
    mtCadDiasM: TFloatField;
    qDesUDias: TLargeintField;
    TVCadDiasM: TcxGridDBColumn;
    tAbandono: TnxTable;
    TVAbandono: TcxGridDBTableView;
    tAbandonoCodigo: TAutoIncField;
    tAbandonoCadastroEm: TDateTimeField;
    tAbandonoLoja: TStringField;
    tAbandonoCidade: TStringField;
    tAbandonoUF: TStringField;
    tAbandonoEndereco: TnxMemoField;
    tAbandonoBairro: TStringField;
    tAbandonoTelefones: TnxMemoField;
    tAbandonoProprietarios: TnxMemoField;
    tAbandonoUDias: TWordField;
    tAbandonoMotivoDesist: TStringField;
    tAbandonoEmailConta: TStringField;
    tAbandonoUAno: TWordField;
    tAbandonoUMes: TWordField;
    tAbandonoUDia: TWordField;
    dsAbandono: TDataSource;
    TVAbandonoUDias: TcxGridDBColumn;
    TVAbandonoEmailConta: TcxGridDBColumn;
    TVAbandonoCodigo: TcxGridDBColumn;
    TVAbandonoCadastroEm: TcxGridDBColumn;
    TVAbandonoLoja: TcxGridDBColumn;
    TVAbandonoCidade: TcxGridDBColumn;
    TVAbandonoUF: TcxGridDBColumn;
    TVAbandonoEndereco: TcxGridDBColumn;
    TVAbandonoBairro: TcxGridDBColumn;
    TVAbandonoTelefones: TcxGridDBColumn;
    TVAbandonoProprietarios: TcxGridDBColumn;
    TVAbandonoMotivoDesist: TcxGridDBColumn;
    glAbandono: TcxGridLevel;
    procedure TVAReceberFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure mtCadCalcFields(DataSet: TDataSet);
    procedure cmExpClick(Sender: TObject);
    procedure TVCadDataControllerDetailExpanded(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
  private
    { Private declarations }
    procedure Processa;
  public
    procedure RefreshAR2;
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

uses cxGridExportlink;

{$R *.dfm}

{ TForm13 }

procedure TForm13.Button1Click(Sender: TObject);
begin
  Paginas.Visible := False;
  lbCalc.Visible := True;
  Timer1.Enabled := True;
end;

procedure TForm13.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm13.cmExpClick(Sender: TObject);
const
  Exts: Array[1..3] of String = ('xls', 'htm', 'txt');
begin
  if Pos('.', dlgExp.FileName)>0 then
    dlgExp.FileName := Copy(dlgExp.FileName, 1, Pos('.', dlgExp.FileName)-1);

  if not (dlgExp.FilterIndex in [1..3]) then
    dlgExp.FilterIndex := 1;
  
  if dlgExp.Execute and (dlgExp.FileName <> '') then begin
    if Pos('.', dlgExp.FileName)=0 then
      dlgExp.FileName := dlgExp.FileName + '.' + Exts[dlgExp.FilterIndex];
    case dlgExp.FilterIndex of
      1: ExportGridToExcel(dlgExp.FileName, gridCad);
      2: ExportGridToHtml(dlgExp.FileName, gridCad);
      3: ExportGridToText(dlgExp.FileName, gridCad);
    end;
  end;
end;

procedure TForm13.mtCadCalcFields(DataSet: TDataSet);
var
  A, C, D, N: Word;
begin
  A := 0;
  C := 0;
  D := 0;
  if not mtCadAtivacao.IsNull then
    A := mtCadAtivacao.Value;
  if not mtCadCriacao.IsNull then
    C := mtCadCriacao.Value;
  if not mtCadChurn.isNull then
    D := mtCadChurn.Value;
  N := C-A;  

  if C>0 then begin
    mtCadpercAtivacao.Value := Trunc(A/C * 1000) / 10;
    mtCadpercNAtivou.Value := Trunc(N/C * 1000) / 10;
  end;

  if A>0 then begin
    mtCadpercAbandono.Value := Trunc(D/A * 1000) / 10;
    mtCadSaldo.Value := A-D;
    mtCadpercSaldo.Value := Trunc((A-D) / A * 1000) / 10;
  end;

  mtCadNaoAtivou.Value := C - A;

  if D>0 then
    mtCadDiasM.Value := Trunc((mtCadDias.Value / D) * 10) / 10;
end;

procedure TForm13.Processa;

procedure TotQ(Q: TnxQuery; fAno, fMes, fDia, fTot: TWordField; fDias, fLojas: TLargeintField);
begin
  Q.First;
  while not Q.Eof do begin
    if not mtCad.FindKey([fAno.Value, fMes.Value, fDia.Value]) then 
    begin
      mtCad.Append;
      mtCadAno.Value := fAno.Value;
      mtCadMes.Value := fMes.Value;
      mtCadDia.Value := fDia.Value;
    end else
      mtCad.Edit;
    fTot.Value := fLojas.Value;
    if fDias<>nil then
      mtCadDias.Value := fDias.Value;
    mtCad.Post; 
    Q.next;  
  end;
end;

begin
  nxTCP.Active := True;
  nxDB.Active := True;

  qRec.Active := False;
  qVen.Active := False;
  qCad.Active := False;
  qAR2.Active := False;
  qAR.Active  := False;
  
  qDes.Params[0].AsDateTime := Date - 7;
  qCad.Params[0].AsDateTime := Date - 7;
  qAti.Params[0].AsDateTime := Date - 7;

  qRec.Open;
  qVen.Open;
  qCad.Open;
  qAR.Open;
  qDes.Open;
  qAti.Open;

  mtCad.Open;

  dsCad.DataSet := nil;
  try
    TotQ(qCad, qCadAno, qCadMes, qCadDia, mtCadCriacao, nil, qCadLojas);
    TotQ(qDes, qDesAno, qDesMes, qDesDia, mtCadChurn, qDesUDias, qDesLojas);
    TotQ(qAti, qAtiAno, qAtiMes, qAtiDia, mtCadAtivacao, nil, qAtiLojas); 
  finally
    dsCad.Dataset := mtCad;
  end;
  lbCalc.Visible := False;
  Paginas.Visible := True;
end;

procedure TForm13.RefreshAR2;
var Dia, Mes, Ano: Integer;
begin
  Dia := qARDia.Value;
  Mes := qARMes.Value;
  Ano := qARAno.Value;
  qAR2.Active := False;
  if (Dia>0) and (Mes>0) and (Ano>0) then begin
    qAR2.Params[0].Value := EncodeDate(qARAno.Value, qARMes.Value, qARDia.Value);
    qAR2.Open;
  end;
end;

procedure TForm13.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Processa;
end;

procedure TForm13.TVAReceberFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  RefreshAR2;
end;

procedure TForm13.TVCadDataControllerDetailExpanded(
  ADataController: TcxCustomDataController; ARecordIndex: Integer);
begin
  tAbandono.SetRange([
    ADataController.Values[ARecordIndex, tvCadAno.Index],
    ADataController.Values[ARecordIndex, tvCadMes.Index],
    ADataController.Values[ARecordIndex, tvCadDia.Index]],
    [ADataController.Values[ARecordIndex, tvCadAno.Index],
     ADataController.Values[ARecordIndex, tvCadMes.Index],
     ADataController.Values[ARecordIndex, tvCadDia.Index]]);
end;

end.


SELECT UAno as Ano, UMes as Mes, UDia as Dia, count(Distinct(Codigo)) as Lojas  FROM "cliente"
where (uobtemlic is not null) and (uobtemlic <= :data)
group by Ano, Mes, Dia
