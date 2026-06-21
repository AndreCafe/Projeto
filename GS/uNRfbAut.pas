unit uNRfbAut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxBar,
  dxPSCore, cxGridCustomPopupMenu, cxGridPopupMenu, dxBarExtItems, ExtCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  DB, cxDBData, cxImageComboBox, cxCalendar, cxTextEdit, cxSpinEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, nxdb, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxMaskEdit, cxDropDownEdit,
  StdCtrls, cxRadioGroup, cxContainer, cxLabel, Buttons, PngSpeedButton, cxPC,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  LMDControl;

type
  TfbAut = class(TFrmBase)
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    Tab: TnxTable;
    dsTab: TDataSource;
    TabID: TAutoIncField;
    TabPrograma: TWordField;
    TabLoja: TIntegerField;
    TabAutorizacao: TStringField;
    TabVencimento: TDateField;
    TabCodigoEquip: TStringField;
    TabMaquinas: TWordField;
    TabTipo: TWordField;
    TabCriadaEm: TDateTimeField;
    TabCriadaPor: TStringField;
    TabInativadaEm: TDateTimeField;
    TabInativadaPor: TStringField;
    TabAtiva: TBooleanField;
    TabObs: TMemoField;
    TabGerar: TBooleanField;
    TabEnviouCli: TBooleanField;
    TabNomeLoja: TStringField;
    TVPrograma: TcxGridDBColumn;
    TVAutorizacao: TcxGridDBColumn;
    TVVencimento: TcxGridDBColumn;
    TVCodigoEquip: TcxGridDBColumn;
    TVMaquinas: TcxGridDBColumn;
    TVTipo: TcxGridDBColumn;
    TVCriadaEm: TcxGridDBColumn;
    TVCriadaPor: TcxGridDBColumn;
    TVInativadaEm: TcxGridDBColumn;
    TVInativadaPor: TcxGridDBColumn;
    TVAtiva: TcxGridDBColumn;
    TVEnviouCli: TcxGridDBColumn;
    TVNomeLoja: TcxGridDBColumn;
    TabCodLoja: TIntegerField;
    LMDSimplePanel1: TLMDSimplePanel;
    Paginas: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    LMDSimplePanel2: TLMDSimplePanel;
    btnEncontrar: TPngSpeedButton;
    cxLabel1: TcxLabel;
    rgVencRecentes: TcxRadioButton;
    edVencI: TcxDateEdit;
    cxLabel2: TcxLabel;
    edVencF: TcxDateEdit;
    edProxVenc: TcxSpinEdit;
    rgDataVenc: TcxRadioButton;
    cxLabel3: TcxLabel;
    edHD: TcxTextEdit;
    cxTabSheet4: TcxTabSheet;
    cxLabel4: TcxLabel;
    rbAtivas: TcxRadioButton;
    rbInativas: TcxRadioButton;
    rbTodas: TcxRadioButton;
    rbBuscaExata: TcxRadioButton;
    rbBuscaAprox: TcxRadioButton;
    cxLabel5: TcxLabel;
    procedure TVEnviouCliCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVAtivaCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cmEditarClick(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure rbAtivasClick(Sender: TObject);
    procedure btnEncontrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FiltraDados; override;

    class function Descricao: String; override;
  end;

var
  fbAut: TfbAut;

implementation

uses uNexRegDM, uNexRegPri, uFrmAutorizacao, nrAutorizacao;

{$R *.dfm}

{ TfbAut }

procedure TfbAut.btnEncontrarClick(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TfbAut.cmEditarClick(Sender: TObject);
begin
  inherited;
  TFrmAut.Create(Self).Editar(TabLoja.Value);
  Tab.Refresh;
end;

class function TfbAut.Descricao: String;
begin
  Result := 'Licenças';
end;

procedure TfbAut.FiltraDados;
var I : Integer;
begin
  inherited;
  FrmPri.DisableDatasets;
  try
    Tab.Active := True;
    if Paginas.ActivePageIndex<>1 then begin
      Tab.Filtered := False;
      Tab.Filter := '';
    end else  
      Tab.Filtered := (Paginas.ActivePageIndex=1);
    case Paginas.ActivePageIndex of
      0 : begin
        Tab.IndexName := 'IEnviouAtiva';
        Tab.SetRange([False, True], [False, True]);
      end;
      1 : begin
        Tab.IndexName := 'IAtivaVencimento';
        I := edProxVenc.Value;
        if rgVencRecentes.Checked then 
          Tab.SetRange([True, Date-3], [True, Date+I]) else
          Tab.SetRange([True, Trunc(edVencI.Date)], [True, Trunc(edVencF.Date)]);
        Tab.Filter := 'Tipo <> 2';
      end;
      2 : begin
        Tab.IndexName := 'IEquip';
        if rbBuscaExata.Checked then
          Tab.SetRange([edHD.Text], [edHD.Text]) else
          Tab.SetRange([edHD.Text], [edHD.Text+'zzzzzzzzzzzzzzzzzzzzzzzzzzz']);
      end;
      3 : begin
        if rbAtivas.Checked then begin
          Tab.IndexName := 'IAtiva';
          Tab.SetRange([True], [True]);
        end else
        if rbInativas.Checked then begin
          Tab.IndexName := 'IAtiva';
          Tab.SetRange([False], [False]);
        end else begin
          Tab.IndexName := 'IID';
          Tab.CancelRange;
        end;
      end;
    end;
  finally
    FrmPri.EnableDatasets;
  end;
  Tab.Refresh;
end;

procedure TfbAut.rbAtivasClick(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

procedure TfbAut.TabCalcFields(DataSet: TDataSet);
begin
  inherited;
  TabCodLoja.Value := TabLoja.Value;
end;

procedure TfbAut.TVAtivaCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  if (AViewInfo.Value=null) or (AviewInfo.Value=False) then begin
    ACanvas.Font.Color := clGray;
    ACanvas.Font.Style := [];
  end else begin
    ACanvas.Font.Color := clGreen;
    ACanvas.Font.Style := [fsBold];
  end;
  ACanvas.Brush.Color := clWhite;
end;

procedure TfbAut.TVEnviouCliCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var V: Variant;  
begin
  inherited;
  V := AViewInfo.GridRecord.Values[tvAtiva.Index];

  if (AViewInfo.Value=null) or (AviewInfo.Value=False) then begin
    ACanvas.Font.Style := [fsBold];
    if (V=null) or (V=False) then
      ACanvas.Font.Color := clGray else
      ACanvas.Font.Color := clBlack;
  end else begin
    if (V=null) or (V=False) then
      ACanvas.Font.Color := clGray else
      ACanvas.Font.Color := clBlack;
  end;
  ACanvas.Brush.Color := clWhite;
end;

end.
