unit ncafbPatrocinadores;
{
    ResourceString: Dario 10/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxMaskEdit, cxCheckBox, cxCurrencyEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, nxdb, dxPSCore,
  cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, dxBarExtItems, ExtCtrls,
  cxImageComboBox, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, cxLookAndFeels, cxLookAndFeelPainters,
  cxNavigator, dxPScxPivotGridLnk, uNexTransResourceStrings_PT, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel;

type
  TfbPatrocinadores = class(TFrmBase)
    Tab: TnxTable;
    dsTab: TDataSource;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    TabNome: TStringField;
    TabURLArea1: TMemoField;
    TabURLArea2: TMemoField;
    TabDominiosPerm: TMemoField;
    TVNome: TcxGridDBColumn;
    TVURLArea1: TcxGridDBColumn;
    TVURLArea2: TcxGridDBColumn;
    TVDominiosPerm: TcxGridDBColumn;
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AtualizaDireitos; override;
    class function Descricao: String; override;
    class function Modulo: Integer; override;
    { Public declarations }
  end;

var
  fbPatrocinadores: TfbPatrocinadores;

implementation

uses 
  ncaDM, 
  ncaFrmPri, 
  ncaFrmPatro, ufmImagens;

// START resource string wizard section
// MMX resource string wizard section REMOVIDA - 08/04/13 12:30


{$R *.dfm}

{ TFrmBase1 }

procedure TfbPatrocinadores.AtualizaDireitos;
begin
  inherited;
  if not Tab.Active then 
    Tab.Open
  else
    Tab.Refresh;  
end;

class function TfbPatrocinadores.Descricao: String;
begin
  Result := SncafbPatrocinadores_PatrocinadoresAcessoGrátis;
end;

class function TfbPatrocinadores.Modulo: Integer;
begin
  Result := -1;
end;

procedure TfbPatrocinadores.cmNovoClick(Sender: TObject);
begin
  inherited;
  TFrmPatro.Create(Self).Novo(Tab);
end;

procedure TfbPatrocinadores.cmEditarClick(Sender: TObject);
begin
  inherited;
  TFrmPatro.Create(Self).Editar(Tab);
end;

procedure TfbPatrocinadores.cmApagarClick(Sender: TObject);
begin
  inherited;
  if SimNaoH(SncafbPatrocinadores_DesejaRealmenteApagarOPatrocinad + TabNome.AsString + '?', Handle) then
    Tab.Delete;
end;

end.

