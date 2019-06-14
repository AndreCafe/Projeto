unit ncafbEspecie;
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
  cxNavigator, dxPScxPivotGridLnk, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  uParentedPanel;

type
  TfbEspecie = class(TFrmBase)
    Tab: TnxTable;
    dsTab: TDataSource;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    TabID: TWordField;
    TabTipo: TWordField;
    TabNome: TStringField;
    TabPermiteTroco: TBooleanField;
    TabPermiteVarios: TBooleanField;
    TabPermiteCred: TBooleanField;
    TabImg: TWordField;
    TabRecVer: TIntegerField;
    TVNome: TcxGridDBColumn;
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
  fbEspecie: TfbEspecie;

implementation

uses 
  ncaDM, 
  ncaFrmPri, 
  ncaFrmEspecie, ufmImagens;

// START resource string wizard section
// MMX resource string wizard section REMOVIDA - 08/04/13 12:30
// START resource string wizard section
resourcestring
//  SAvisosDeTérminoDeTempo = 'Avisos de Término de Tempo';
//  SDesejaRealmenteApagarOAvisoDe = 'Deseja realmente apagar o aviso de ';
//  SMinutos = ' minutos?';
  SDesejaRealmenteApagarOMeioDePagamento = 'Deseja realmente apagar o meio de pagamento ';
  SMeiosDePagamento = 'Meios de Pagamento';

// END resource string wizard section


{$R *.dfm}

{ TFrmBase1 }

procedure TfbEspecie.AtualizaDireitos;
begin
  inherited;
  if not Tab.Active then 
    Tab.Open
  else
    Tab.Refresh;  
end;

class function TfbEspecie.Descricao: String;
begin
  Result := SMeiosDePagamento;
end;

class function TfbEspecie.Modulo: Integer;
begin
  Result := -1;
end;

procedure TfbEspecie.cmNovoClick(Sender: TObject);
begin
  inherited;
  TFrmEspecie.Create(Self).Novo(Tab);
end;

procedure TfbEspecie.cmEditarClick(Sender: TObject);
begin
  inherited;
  TFrmEspecie.Create(Self).Editar(Tab);
end;

procedure TfbEspecie.cmApagarClick(Sender: TObject);
begin
  inherited;
  if SimNaoH(SDesejaRealmenteApagarOMeioDePagamento + TabNome.AsString + '?', Handle) then
    Tab.Delete;
end;

end.

