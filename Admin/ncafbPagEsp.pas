unit ncafbPagEsp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxBar, dxPSCore, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxClasses, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, DB, cxDBData, nxdb, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxCalendar, cxSpinEdit, dxPScxPivotGridLnk, ExtCtrls, uParentedPanel;

type
  TfbPagEsp = class(TFrmBase)
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    Tab: TnxTable;
    dsTab: TDataSource;
    TabID: TAutoIncField;
    TabCaixa: TIntegerField;
    TabDataHora: TDateTimeField;
    TabTran: TIntegerField;
    TabEspecie: TWordField;
    TabTipo: TWordField;
    TabValor: TCurrencyField;
    TabDoc: TStringField;
    TabCancelado: TBooleanField;
    TabNome: TStringField;
    TVCaixa: TcxGridDBColumn;
    TVValor: TcxGridDBColumn;
    TVNome: TcxGridDBColumn;
    TVData: TcxGridDBColumn;
    TVTran: TcxGridDBColumn;
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    class function Descricao: String; override;
    procedure FiltraDados; override;
    { Public declarations }
  end;

var
  fbPagEsp: TfbPagEsp;

implementation

uses ufmImagens, ncaDM;

{$R *.dfm}

{ TfbPagEsp }

procedure TfbPagEsp.cmEditarClick(Sender: TObject);
begin
  inherited;
  Dados.EditarTran(TabTran.Value);
end;

class function TfbPagEsp.Descricao: String;
begin
  Result := 'Conferir Meio de Pagamento';
end;

procedure TfbPagEsp.FiltraDados;
begin
  inherited;
  Tab.Active := True;
end;

procedure TfbPagEsp.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  dxBarDockControl1.SunkenBorder := False;
end;

end.
