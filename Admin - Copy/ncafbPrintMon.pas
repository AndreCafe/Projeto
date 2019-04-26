unit ncafbPrintMon;
{
    ResourceString: Dario 10/03/13
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
  cxControls, cxGridCustomView, cxGrid, nxdb, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers, dxPScxExtEditorProducers,
  cxLookAndFeels, cxLookAndFeelPainters, uParentedPanel, cxNavigator;

type
  TfbPrintMon = class(TFrmBase)
    DataSource1: TDataSource;
    Tab: TnxTable;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    TVMaq: TcxGridDBColumn;
    TVPaginas: TcxGridDBColumn;
    TVPrinterName: TcxGridDBColumn;
    TVComputerName: TcxGridDBColumn;
    TVUserName: TcxGridDBColumn;
    TVDocument: TcxGridDBColumn;
    TVStatus: TcxGridDBColumn;
    cmJobResume: TdxBarButton;
    cmJobDelete: TdxBarButton;
    Timer1: TTimer;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    TabJobID: TIntegerField;
    TabComputer: TStringField;
    TabMaquina: TWordField;
    TabPrinterName: TStringField;
    TabPrinterShare: TStringField;
    TabPrinterPort: TStringField;
    TabPrinterServer: TStringField;
    TabUser: TStringField;
    TabDocument: TnxMemoField;
    TabPages: TIntegerField;
    TabTotalPages: TIntegerField;
    TabCopies: TIntegerField;
    TabClientPages: TIntegerField;
    TabStatus: TWordField;
    TabPrinterIndex: TIntegerField;
    TabPausou: TBooleanField;
    TabLiberacao: TWordField;
    TabImpID: TIntegerField;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    procedure FiltraDados; override;
    class function Descricao: String; override;
    procedure AtualizaDireitos; override;
    
    { Public declarations }
  end;

var
  fbPrintMon: TfbPrintMon;

implementation

uses 
  ncaDM, 
  ncaFrmPri,
  ncClassesBase;

// START resource string wizard section
resourcestring
  SImpressões = 'Impressões';

// END resource string wizard section


{$R *.dfm}

{ TfbImp }

procedure TfbPrintMon.AtualizaDireitos;
begin
  inherited;
  if Tab.Active then Tab.Refresh;
end;

class function TfbPrintMon.Descricao: String;
begin
  Result := SImpressões;
end;

procedure TfbPrintMon.FiltraDados;
begin
  if not Tab.Active then
    Tab.Open else
    Tab.Refresh;
end;

procedure TfbPrintMon.Timer1Timer(Sender: TObject);
begin
  inherited;
  FiltraDados;
end;

end.

