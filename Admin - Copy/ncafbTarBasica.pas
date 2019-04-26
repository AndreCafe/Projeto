unit ncafbTarBasica;
{
    ResourceString: Dario 10/03/13
    João: TODO List!
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxButtonEdit, cxTextEdit, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxClasses, cxControls, cxGridCustomView, cxGridLevel, cxGrid, nxdb,
  kbmMemTable, dxBar, LMDCustomSimpleLabel, LMDSimpleLabel,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel,
  LMDControl, LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, dxPSCore, cxGridCustomPopupMenu, cxGridPopupMenu,
  dxBarExtItems, ExtCtrls, cxCurrencyEdit, dxBarExtDBItems, Buttons,
  cxTimeEdit, cxMaskEdit, 
  cxColorComboBox, cxGridDBTableView, cxFilterControl, cxDBFilterControl,
  cxContainer, cxLabel, LMDPNGImage, cxCheckBox, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, cxLookAndFeels,
  cxLookAndFeelPainters, cxNavigator, dxPScxPivotGridLnk, uNexTransResourceStrings_PT;

type
  TfbTarBasica = class(TFrmBase)
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    Tab: TnxTable;
    TabTipoAcesso: TWordField;
    TabCor: TIntegerField;
    TabCorFonte: TIntegerField;
    TabDescricao: TStringField;
    TabReinicia: TBooleanField;
    TabPrecosStr: TnxMemoField;
    TabDivQtd: TIntegerField;
    TabReiniciaDesde: TWordField;
    TabDivTipo: TWordField;
    TabArredondar: TWordField;
    DS: TDataSource;
    TabTarifasPorHora: TStringField;
    LMDSimplePanel1: TLMDSimplePanel;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVCor: TcxGridDBColumn;
    TVDescricao: TcxGridDBColumn;
    TVTarifasPorHora: TcxGridDBColumn;
    GL: TcxGridLevel;
    BarMgrBar2: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    TVPadrao: TcxGridDBColumn;
    cmTarifaPadrao: TdxBarLargeButton;
    TabSemValorMin: TBooleanField;
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure cmNovoClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
    procedure TVPadraoGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure cmTarifaPadraoClick(Sender: TObject);
    procedure TVPadraoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    
    { Private declarations }
    procedure AtualizaDireitos; override;
      
  public
    procedure FiltraDados; override;
    class function Descricao: String; override;
    { Public declarations }
  end;

var
  fbTarBasica: TfbTarBasica;

implementation

uses 
  ncaFrmPri, 
  ncaDM, 
  ncaFrmTarifa,
  ncIDRecursos, ncClassesBase, ufmImagens;

// START resource string wizard section
// MMX resource string wizard section REMOVIDA - 08/04/13 12:30


{$R *.dfm}

{unction InverseColor( color: TColor ): TColor;
var
  rgb_: TColorref;
  
  Function Inv( b: Byte ): Byte;
  Begin
    if b > 128 Then
      result:= 0
    else
      result:= 255;
  End;
  
begin
  rgb_ := ColorToRgb( color );
  rgb_ := RGB( Inv(GetRValue( rgb_ )),
               Inv(GetGValue( rgb_ )),
               Inv(GetBValue( rgb_ )));
  Result := rgb_;
end;}



procedure TfbTarBasica.FiltraDados;
begin
  if not Tab.Active then
    Tab.Open else
    Tab.Refresh;
end;


procedure TfbTarBasica.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  fbTarBasica := Self;
end;

procedure TfbTarBasica.TabCalcFields(DataSet: TDataSet);
var 
  T: TncTarifa;
  I : Integer;
  S : String;
begin
  inherited;

  S := TabDescricao.Value;
  if s='sapato' then Exit; // TODO : check string
  

  T := gTarifas.PorCor[TabCor.Value];
  if T<>nil then
    TabTarifasPorHora.Value :=
      SncafbTarBasica_1h + Trim(FloatToStrF(T.ValorHora(1), ffCurrency, 10, 2)) +
      SncafbTarBasica_2h + Trim(FloatToStrF(T.ValorHora(2), ffCurrency, 10, 2)) +
      SncafbTarBasica_3h + Trim(FloatToStrF(T.ValorHora(3), ffCurrency, 10, 2));
end;

procedure TfbTarBasica.TVPadraoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  ACanvas.Font.Style := [fsBold];
end;

procedure TfbTarBasica.TVPadraoGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;
begin
  inherited;
  V := ARecord.Values[TVCor.Index];
  if (V<>null) and (V=gConfig.TarifaPadrao) then
    AText := SncafbTarBasica_TarifaPadrão;
end;

procedure TfbTarBasica.cmApagarClick(Sender: TObject);
var T : TncTarifa;
begin
  inherited;
  if Tab.IsEmpty then Exit;
  if Tab.RecordCount=1 then begin
    ShowMessage(SncafbTarBasica_NãoéPossívelApagarTodasTarifas);
    Exit;
  end;
  if TabCor.Value=gConfig.TarifaPadrao then begin
    ShowMessage(SncafbTarBasica_EssaéATarifaPadrãoNãoéPermitidoA);
    Exit;
  end;
  T := gTarifas.PorCor[TabCor.Value];
  if T<>nil then
  if SimNaoH(SncafbTarBasica_DesejaRealmenteApagarOTarifa + TabDescricao.Value + '?', Handle) then
  begin
    Dados.CM.ApagaObj(T);
    Tab.Refresh;
  end;
  
end;

procedure TfbTarBasica.cmEditarClick(Sender: TObject);
var T: TncTarifa;
begin
  inherited;
  if Tab.IsEmpty then Exit;
  
  T := TncTarifa.Create;
  try
    T.LeDataset(Tab);
    TFrmTarifa.Create(Self).Editar(T);
    Tab.Refresh;
  finally
    T.Free;
  end;
end;

procedure TfbTarBasica.cmNovoClick(Sender: TObject);
begin
  inherited;
  TFrmTarifa.Create(Self).Novo;
  Tab.Refresh;
end;

procedure TfbTarBasica.cmTarifaPadraoClick(Sender: TObject);
begin
  inherited;
  gConfig.AtualizaCache;
  gConfig.TarifaPadrao := TabCor.Value;
  Dados.CM.SalvaAlteracoesObj(gConfig, False);
end;

class function TfbTarBasica.Descricao: String;
begin
  Result := SncafbTarBasica_TarifaçãoBásica;
end;

procedure TfbTarBasica.AtualizaDireitos;
begin
  Tab.Refresh;
  TV.Invalidate(True);
  cmNovo.Enabled := Permitido(daCFGPrecos);
  cmApagar.Enabled := Permitido(daCFGPrecos);
end;

end.

