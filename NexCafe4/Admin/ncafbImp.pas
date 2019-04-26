unit ncafbImp;

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
  cxContainer, cxLabel, LMDCustomScrollBox, LMDScrollBox;

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
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
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
    pgPausada: TcxPageControl;
    tsInativo: TcxTabSheet;
    tsAtivo: TcxTabSheet;
    dxBarDockControl2: TdxBarDockControl;
    GridA: TcxGrid;
    TVA: TcxGridDBTableView;
    tvAMaq: TcxGridDBColumn;
    tvAPag: TcxGridDBColumn;
    tvADocumento: TcxGridDBColumn;
    tvAImp: TcxGridDBColumn;
    tvAComputador: TcxGridDBColumn;
    glA: TcxGridLevel;
    LMDScrollBox1: TLMDScrollBox;
    cxLabel3: TcxLabel;
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    dxBarSubItem1: TdxBarSubItem;
    dxBarSubItem2: TdxBarSubItem;
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
  private
    { Private declarations }
    FMouseIn, FFocusIn : Boolean;
    FLastID : Cardinal;
  public
    procedure FiltraDados; override;
    class function Descricao: String; override;
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
  ncaFrmPri, ncaFrmImp, ncImpressao, ncClassesBase, ufmImagens, ncJob;

{$R *.dfm}

{ TfbImp }

procedure TfbImp.AtualizaDireitos;
begin
  inherited;
  if gConfig.PMPausaAutomatica then
    pgPausada.ActivePage := tsAtivo else
    pgPausada.ActivePage := tsInativo;
    
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
begin
  inherited;
  with Dados do 
    CM.JobControl(mtImpPrinterIndex.Value, mtImpJobID.Value, jc_delete);
end;

procedure TfbImp.cmJobResumeClick(Sender: TObject);
begin
  inherited;
  with Dados do 
    CM.JobControl(mtImpPrinterIndex.Value, mtImpJobID.Value, jc_resume);
end;

procedure TfbImp.cmNovoClick(Sender: TObject);
var Imp: TncImpressao;
begin
  inherited;
  ChecaCaixa;
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

class function TfbImp.Descricao: String;
begin
  Result := 'Impressões';
end;

procedure TfbImp.FiltraDados;
begin
  if gConfig.PMPausaAutomatica then
    pgPausada.ActivePage := tsAtivo else
    pgPausada.ActivePage := tsInativo;

  AuxTab.Open;
  AuxTab.SetRange([siRegistrou], [siRegistrou]);

  if not Tab.Active then Tab.Open;
  Tab.IndexName := 'IID';
  
  Tab.Refresh;
end;

procedure TfbImp.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
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
