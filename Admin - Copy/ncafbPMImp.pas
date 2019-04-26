unit ncafbPMImp;
{
    ResourceString: Dario 10/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSCore, cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, dxBarExtItems,
  ExtCtrls, cxControls, cxPC, cxClasses, cxStyles, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, cxPCdxBarPopupMenu,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, uParentedPanel;

type
  TfbPMImp = class(TFrmBase)
    Paginas: TcxPageControl;
    FM: TFormManager;
    cmEmAndamento: TdxBarButton;
    cmRecentes: TdxBarButton;
    cmJobResume: TdxBarButton;
    cmJobDelete: TdxBarButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cmEditarImp: TdxBarButton;
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure FrmBasePaiDestroy(Sender: TObject);
    procedure cmRecentesClick(Sender: TObject);
    procedure cmEmAndamentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure FiltraDados; override;
    class function Descricao: String; override;
    { Public declarations }
  end;

var
  fbPMImp: TfbPMImp;

implementation

uses 
  ncafbPrintMon, 
  ncafbImp,
  ncaFrmPri,
  ncaDM;

// START resource string wizard section
resourcestring
  SImpressões = 'Impressões';

// END resource string wizard section


{$R *.dfm}

{ TFrmBase1 }

procedure TfbPMImp.cmEmAndamentoClick(Sender: TObject);
begin
  inherited;
  FM.Mostrar(TfbPrintMon, 0, 0);
  cmJobResume.Visible := ivAlways;
  cmJobDelete.Visible := ivAlways;
  cmEditarImp.Visible := ivNever;
end;

procedure TfbPMImp.cmRecentesClick(Sender: TObject);
begin
  inherited;
  FM.Mostrar(TfbImp, 0, 0);
  cmJobResume.Visible := ivNever;
  cmJobDelete.Visible := ivNever;
  cmEditarImp.Visible := ivAlways;
  FM.FormAtivo.FiltraDados;
end;

class function TfbPMImp.Descricao: String;
begin
  Result := SImpressões;
end;

procedure TfbPMImp.FiltraDados;
begin
  inherited;
end;

procedure TfbPMImp.FrmBasePaiCreate(Sender: TObject);
begin
  FM.RegistraForm(TfbPrintMon);
  FM.RegistraForm(TfbImp);
  FM.Mostrar(TfbPrintMon, 0, 0);
  FM.Mostrar(TfbImp, 0, 0);
  FM.FormAtivo.dxBarDockControl1.Visible := False;
  TfbImp(FM.FormAtivo).TV.OptionsView.GroupByBox := False;
  TfbImp(FM.FormAtivo).TV.OptionsView.Footer := False;
  TfbImp(FM.FormAtivo).TV.OptionsView.GridView.Navigator.Visible := False;
  TfbImp(FM.FormAtivo).Grid.Font.Size := 7;
  cmEditarImp.Visible := ivNever;
  
  Paginas.ActivePageIndex := 0;
end;

procedure TfbPMImp.FrmBasePaiDestroy(Sender: TObject);
begin
  FM.Clear;
  inherited;
end;

end.
 
 
