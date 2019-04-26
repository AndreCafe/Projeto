unit ncafbRevisarProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxBar, dxPSCore, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxClasses, ExtCtrls, uParentedPanel, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, nxdb, cxGridLevel,
  cxGridCustomView, cxGrid, dxDockControl, dxPScxPivotGridLnk, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel;

type
  TfbRevisarProduto = class(TFrmBase)
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    Tab: TnxTable;
    TabDescricao: TStringField;
    TabCadastroRapido: TBooleanField;
    TabIncluidoEm: TDateTimeField;
    TabID: TAutoIncField;
    TabCodigo: TStringField;
    TabUnid: TStringField;
    TabPreco: TCurrencyField;
    TabObs: TnxMemoField;
    TabImagem: TGraphicField;
    TabCategoria: TStringField;
    TabFornecedor: TIntegerField;
    TabSubCateg: TStringField;
    TabEstoqueAtual: TFloatField;
    TabCustoUnitario: TCurrencyField;
    TabEstoqueACE: TFloatField;
    TabEstoqueACS: TFloatField;
    TabPodeAlterarPreco: TBooleanField;
    TabNaoControlaEstoque: TBooleanField;
    TabEstoqueMin: TFloatField;
    TabEstoqueMax: TFloatField;
    TabAbaixoMin: TBooleanField;
    TabAbaixoMinDesde: TDateTimeField;
    TabEstoqueRepor: TFloatField;
    Tabplus: TBooleanField;
    TabplusURL: TnxMemoField;
    TabplusCodParceiro: TStringField;
    TabplusCodProduto: TStringField;
    TabAtivo: TBooleanField;
    TabFidelidade: TBooleanField;
    TabFidPontos: TIntegerField;
    Tabmd5Imagem: TStringField;
    TablastProdModif: TDateTimeField;
    TabuploadR: TWordField;
    TabuploadS: TWordField;
    Tabfk_produ: TIntegerField;
    TabbatchUID: TGuidField;
    TVColumnDescricao: TcxGridDBColumn;
    DataSource1: TDataSource;
    TVColumnID: TcxGridDBColumn;
    procedure cmEditarClick(Sender: TObject);
  private
    fDockingControl: TdxCustomDockControl;
    fDockingControlAutoHide :boolean;
    fDockingControlAutoHide2 :boolean;
    fDockingControlEditing :boolean;
    fLastTabIsEmpty :boolean;
    { Private declarations }
  public
    procedure FiltraDados; override;
    procedure refreshRevisarCadProduto(AControl, ADockControl: TdxCustomDockControl; AType: TdxDockingType; AIndex: Integer; const aForce:boolean=false);
    constructor Create(AOwner: TComponent; AControl: TdxCustomDockControl); reintroduce;
    { Public declarations }
  end;

var
  fbRevisarProduto: TfbRevisarProduto;

implementation

uses ncaFrmPri, ncaDM, ncaFrmProduto2;

{$R *.dfm}

{ TfbRevisarProduto }

procedure TfbRevisarProduto.cmEditarClick(Sender: TObject);
begin
  if Tab.IsEmpty then Exit;


  if Dados.tbPro.Locate('ID', TabID.Value, []) then begin
    if not fDockingControlEditing then begin
        fDockingControlAutoHide2 := fDockingControl.AutoHide;
        fDockingControlEditing := true;
    end;
    if Tab.recordcount>1 then
        fDockingControl.AutoHide := false;
    TFrmProduto.Create(Self).Editar(Dados.tbPro);
    Tab.Refresh;
    //FrmPri.dpRevisarProduto.Visible := not Tab.IsEmpty;
    if Tab.recordcount>0 then
      fDockingControl.AutoHide := false;
    if fDockingControlEditing and (Tab.recordcount=0) then begin
       fDockingControl.AutoHide := fDockingControlAutoHide2;
       fDockingControlEditing := false;
    end;
    FrmPri.refreshRevisarCadProduto(true);
  end;
end;

constructor TfbRevisarProduto.Create(AOwner: TComponent; AControl: TdxCustomDockControl);
begin
  inherited create(AOwner);
  fDockingControl := AControl;
  fDockingControlAutoHide := fDockingControl.AutoHide;
  Tab.IndexName := 'ICadastroRapido';
  Tab.Filter := '';
  Tab.Filtered := false;
end;

procedure TfbRevisarProduto.FiltraDados;
begin
     tab.active:=true;
     Tab.IndexName := 'ICadastroRapido';
     tab.SetRange([true], [true]);
     fLastTabIsEmpty := not tab.isEmpty;
     fDockingControlAutoHide := fDockingControl.AutoHide;
end;

procedure TfbRevisarProduto.refreshRevisarCadProduto(AControl, ADockControl: TdxCustomDockControl; AType: TdxDockingType; AIndex: Integer; const aForce:boolean=false);
begin
    //TV.DataController.DataModeController.GridMode := true;
    fDockingControl := AControl;
    if not tab.active then begin
        tab.open;
        fLastTabIsEmpty := tab.isEmpty;
        tab.SetRange([true], [true]);
    end;

    tab.Refresh;

    fDockingControl := AControl;
    if (fLastTabIsEmpty<>tab.isEmpty) or (aForce) then
        if tab.isEmpty then begin
            fDockingControlAutoHide := fDockingControl.AutoHide;
            //fDockingControl.AutoHide := true;
            //fDockingControl.UnDock;
            //fDockingControl.close;
            fDockingControl.AutoHide := false;
            fDockingControl.Visible  := false;
        end else begin
            //fDockingControl.DockTo(ADockControl, AType, 0);
            fDockingControl.Visible  := true;
            if not fDockingControlEditing then
                fDockingControl.AutoHide := fDockingControlAutoHide;
            //fDockingControl.AutoHide := true;
            //fDockingControlAutoHide := true;
        end;
    fLastTabIsEmpty := tab.isEmpty;
end;

end.
