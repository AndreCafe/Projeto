unit ncafbImp;
{
    ResourceString: Dario 10/03/13
    João: TODO List!
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSCore, cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, dxBarExtItems,
  ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCalendar, cxMaskEdit,
  cxImageComboBox, cxMemo, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, nxdb, 
  cxTimeEdit, dxmdaset, cxPC, cxGridBandedTableView,
  cxGridDBBandedTableView, LMDPNGImage, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  cxContainer, cxLabel, LMDCustomScrollBox, LMDScrollBox, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  cxPCdxBarPopupMenu, cxLookAndFeels, cxLookAndFeelPainters, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, cxNavigator, dxPScxPivotGridLnk, uParentedPanel;

type
  TfbImp = class(TFrmBase)
    DataSource1: TDataSource;
    Tab: TnxTable;
    TabDataHora: TDateTimeField;
    TabComputador: TStringField;
    TabMaquina: TWordField;
    TabImpressora: TStringField;
    TabDocumento: TMemoField;
    TabResultado: TWordField;
    TabID: TAutoIncField;
    TabTran: TIntegerField;
    TabCaixa: TIntegerField;
    TabManual: TBooleanField;
    TabSessao: TIntegerField;
    Tabq1: TWordField;
    Tabq2: TWordField;
    Tabq3: TWordField;
    Tabq4: TWordField;
    Tabq5: TWordField;
    Tabq6: TWordField;
    Tabq7: TWordField;
    Tabq8: TWordField;
    Tabq9: TWordField;
    Tabq10: TWordField;
    Tabv1: TCurrencyField;
    Tabv2: TCurrencyField;
    Tabv3: TCurrencyField;
    Tabv4: TCurrencyField;
    Tabv5: TCurrencyField;
    Tabv6: TCurrencyField;
    Tabv7: TCurrencyField;
    Tabv8: TCurrencyField;
    Tabv9: TCurrencyField;
    Tabv10: TCurrencyField;
    TabTotal: TCurrencyField;
    TabDesconto: TCurrencyField;
    TabPagoPost: TCurrencyField;
    TabDescPost: TCurrencyField;
    TabPago: TCurrencyField;
    TabFunc: TStringField;
    TabCliente: TIntegerField;
    TabCancelado: TBooleanField;
    TabPaginas: TWordField;
    Timer1: TTimer;
    AuxTab: TnxTable;
    AuxTabID: TAutoIncField;
    Paginas: TcxPageControl;
    tsPausa: TcxTabSheet;
    tsRegistradas: TcxTabSheet;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVMaquina1: TcxGridDBColumn;
    TVPaginas1: TcxGridDBColumn;
    VColumn1: TcxGridDBColumn;
    VColumn2: TcxGridDBColumn;
    TVDocumento1: TcxGridDBColumn;
    TVResultado1: TcxGridDBColumn;
    TVImpressora1: TcxGridDBColumn;
    TVAcesso1: TcxGridDBColumn;
    TVComputador1: TcxGridDBColumn;
    TVCaixa: TcxGridDBColumn;
    TVID: TcxGridDBColumn;
    TVDataHora1: TcxGridDBColumn;
    GL: TcxGridLevel;
    dsPM: TDataSource;
    dxBarDockControl3: TdxBarDockControl;
    BarMgrBar2: TdxBar;
    cmJobResume: TdxBarLargeButton;
    cmJobDelete: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarSubItem2: TdxBarSubItem;
    cmRevisar: TdxBarLargeButton;
    barPDF: TdxBar;
    dsPrintDoc: TDataSource;
    dxBarDockControl2: TdxBarDockControl;
    GridA: TcxGrid;
    TVA: TcxGridDBTableView;
    tvAMaq: TcxGridDBColumn;
    tvAPag: TcxGridDBColumn;
    tvADocumento: TcxGridDBColumn;
    tvAImp: TcxGridDBColumn;
    tvAComputador: TcxGridDBColumn;
    glA: TcxGridLevel;
    dsPausadas: TDataSource;
    BarMgrBar3: TdxBar;
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmJobResumeClick(Sender: TObject);
    procedure cmJobDeleteClick(Sender: TObject);
    procedure TVStatusCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure TVMouseEnter(Sender: TObject);
    procedure TVMouseLeave(Sender: TObject);
    procedure GridEnter(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure cmRevisarClick(Sender: TObject);
  private
    { Private declarations }
    FMouseIn, FFocusIn : Boolean;
    FLastID : Cardinal;
  public
    procedure FiltraDados; override;
    class function Descricao: String; override;
    class function Modulo: Integer; override;
    procedure AtualizaDireitos; override;

    function  GetGrid: TcxGrid; override;
    function IncludeGridNameLayout: Boolean; override;
    
    

    procedure TemNovidade;
    
    { Public declarations }
  end;

var
  fbImp: TfbImp;

implementation

uses 
  ncaDM,  StdCtrls,
  ncaFrmPri, ncaFrmImp, ncImpressao, ncClassesBase, ufmImagens, ncJob,
  ncPrintDoc;

// START resource string wizard section
resourcestring
  SImpressões = 'Impressões';

// END resource string wizard section


{$R *.dfm}

{ TfbImp }

procedure TfbImp.AtualizaDireitos;
begin
  inherited;
  if gConfig.RevisarPDFAdmin then
    cmRevisar.Visible := ivAlways else
    cmRevisar.Visible := ivNever;

  if not Paginas.ActivePage.TabVisible then
    Paginas.ActivePage := tsRegistradas;
    
  if Tab.Active then Tab.Refresh;
end;

procedure TfbImp.cmEditarClick(Sender: TObject);
var Imp, Ant: TncImpressao;
begin
  if Tab.IsEmpty then Exit;

  Imp := TncImpressao.Create;
  Ant := TncImpressao.Create;
  try
    Imp.LoadFromDataset(Tab);
    Ant.AssignFrom(Imp);
    if TFrmImp.Create(nil).Editar(False, (Imp.impCaixa=NumAberto), Imp) and (not Imp.Igual(Ant)) then
    begin
      Imp._Operacao := osAlterar;
      Dados.CM.SalvaImpressao(Imp);
      Tab.Refresh;
      FrmPri.RefreshTran;
    end;
  finally
    Imp.Free;
    Ant.Free;
  end;
end;

procedure TfbImp.cmJobDeleteClick(Sender: TObject);
var PD : TncPrintDoc;
begin
  inherited;
  with Dados do begin
    if mtPausadas.IsEmpty then Exit;
    if mtPausadasPDF.Value then begin
      PD := CM.PrintDocs.PorArq[mtPrintDocArq.Value];
      if PD<>nil then begin
        PD.DocInfo.Values['control'] := 'cancelar'; // TODO : check string // do not localize
        CM.PrintDocControl(PD.DocInfo);
      end;
    end else
      CM.JobControl(mtPausadasPrinterIndex.Value, mtPausadasJobID.Value, jc_delete);
  end;
end;

procedure TfbImp.cmJobResumeClick(Sender: TObject);
var PD : TncPrintDoc;
begin
  inherited;
  if Dados.mtPausadas.IsEmpty then Exit;

  with Dados do 
  if mtPausadasPDF.Value then begin
    PD := CM.PrintDocs.PorArq[mtPausadasID.Value];
    if PD<>nil then begin
      PD.DocInfo.Values['control'] := 'liberar'; // TODO : check string // do not localize
      CM.PrintDocControl(PD.DocInfo);
    end;
  end else
    CM.JobControl(mtPausadasPrinterIndex.Value, mtPausadasJobID.Value, jc_resume);
end;

procedure TfbImp.cmNovoClick(Sender: TObject);
var Imp: TncImpressao;
begin
  inherited;
  if CaixaFechado then Exit;
  Imp := TncImpressao.Create;
  try
    Imp.impManual := True;
    if TFrmImp.Create(nil).Editar(True, True, Imp) then begin
      Imp._Operacao := osIncluir;
      Dados.CM.SalvaImpressao(Imp);
      Tab.Refresh;
      FrmPri.RefreshTran;
    end;
  finally
    Imp.Free;
  end;
end;

procedure TfbImp.cmRevisarClick(Sender: TObject);
begin
  inherited;
  with Dados do 
  if (not mtPausadas.IsEmpty) and mtPausadasPDF.Value then
    FrmPri.DownloadPrintDoc(mtPausadasID.Value);
end;

class function TfbImp.Descricao: String;
begin
  Result := SImpressões;
end;

class function TfbImp.Modulo: Integer;
begin
  Result := -1;
end;

procedure TfbImp.FiltraDados;
begin
  AuxTab.Open;
  AuxTab.SetRange([siRegistrou], [siRegistrou]);

  if not Tab.Active then Tab.Open;
  Tab.IndexName := 'IID'; // do not localize
  
  Tab.Refresh;
end;

procedure TfbImp.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  Paginas.ActivePageIndex := 0;
  FMouseIn := False;
  FFocusIn := False;
  FlastID := 0;
end;

function TfbImp.GetGrid: TcxGrid;
begin
  if Paginas.ActivePageIndex=0 then
    Result := GridA else
    Result := Grid;
end;

procedure TfbImp.GridEnter(Sender: TObject);
begin
  inherited;
  FFocusIn := True;
end;

procedure TfbImp.GridExit(Sender: TObject);
begin
  inherited;
  FFocusIn := False;
end;

function TfbImp.IncludeGridNameLayout: Boolean;
begin
  Result := True;
end;

procedure TfbImp.PaginasChange(Sender: TObject);
begin
  inherited;
  Tab.Refresh;
  if Paginas.ActivePageIndex=0 then
    MenuGrid.Grid := GridA else
    MenuGrid.Grid := Grid;
end;

procedure TfbImp.TemNovidade;
begin
  try
    if not Dados.nxTCPIP.Active then Exit;
    
    AuxTab.First;
    
    if AuxTabID.Value <> FLastID then
    if (not FMouseIn) and (not FFocusIn) then begin
      Tab.First;
      FLastID := TabID.Value;
    end;
  except
  end;
end;

procedure TfbImp.TVMouseEnter(Sender: TObject);
begin
  inherited;
  FMouseIn := True;
end;

procedure TfbImp.TVMouseLeave(Sender: TObject);
begin
  inherited;
  FMouseIn := False;
end;

procedure TfbImp.TVStatusCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  if (aViewInfo.Value<>null) and (AViewInfo.Value=siPausado) then
    ACanvas.Brush.Color := clWhite;
end;

end.

