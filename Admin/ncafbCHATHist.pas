unit ncafbCHATHist;
{
    ResourceString: Dario 10/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxEditorProducers,
  dxPScxExtEditorProducers, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCalendar, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, nxdb, dxBar, dxPSCore, cxGridCustomPopupMenu, cxGridPopupMenu,
  ExtCtrls, cxNavigator, dxPScxPivotGridLnk, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, uParentedPanel;

type
  TfbChatHist = class(TFrmBase)
    Tab: TnxTable;
    TabID: TAutoIncField;
    TabDe: TIntegerField;
    TabPara: TIntegerField;
    TabDataHora: TDateTimeField;
    TabTexto: TnxMemoField;
    dsTab: TDataSource;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    TVID: TcxGridDBColumn;
    TVDe: TcxGridDBColumn;
    TVPara: TcxGridDBColumn;
    TVDataHora: TcxGridDBColumn;
    TVTexto: TcxGridDBColumn;
    dxBarLargeButton1: TdxBarLargeButton;
    procedure FrmBasePaiClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure TVDeGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
  private
    { Private declarations }
  public
    class function Descricao: String; override;
    class function Modulo: Integer; override;
    { Public declarations }
  end;

var
  fbChatHist: TfbChatHist;

implementation

uses ncaFrmPri, ncaDM, ufmImagens;

// START resource string wizard section
resourcestring
  SHistóricoDeChat = 'Histórico de Chat';
  SAtendente = 'Atendente';
  STodos = 'Todos';

// END resource string wizard section


{$R *.dfm}

class function TfbChatHist.Descricao: String;
begin
  Result := SHistóricoDeChat;
end;

class function TfbChatHist.Modulo: Integer;
begin
  Result := -1;
end;

procedure TfbChatHist.dxBarLargeButton1Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfbChatHist.FrmBasePaiClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfbChatHist.TVDeGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if AText='0' then
    AText := SAtendente 
  else
  if AText='-1' then
    AText := STodos;
end;

end.

