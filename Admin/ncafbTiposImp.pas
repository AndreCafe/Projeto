unit ncafbTiposImp;
{
    ResourceString: Dario 10/03/13
}

interface

uses
  Windows, Messages, ncErros, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, nxdb, dxPSCore,
  cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, dxBarExtItems, ExtCtrls,
  cxMaskEdit, cxSpinEdit, cxImageComboBox,
  ImgList, cxContainer, cxLabel, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, cxLookAndFeels,
  cxLookAndFeelPainters, cxPCdxBarPopupMenu, PngImage, cxDBEdit,
  cxCheckBox, cxPC, LMDPNGImage, dxNavBarCollns, dxNavBarBase, dxNavBar, Menus,
  StdCtrls, cxButtons, LMDCustomScrollBox, LMDScrollBox, cxGroupBox, cxNavigator,
  dxPScxPivotGridLnk, uNexTransResourceStrings_PT, uParentedPanel,
  dxBarBuiltInMenu;

type
  TncImpDados = class
  
  end;
  
  TfbTiposImp = class(TFrmBase)
    cmZerarContador: TdxBarLargeButton;
    cxImageList1: TcxImageList;
    BarMgrBar2: TdxBar;
    cmSalvar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cxPageControl1: TcxPageControl;
    cxTabSheet4: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;
    panTarifas: TLMDSimplePanel;
    LMDSimplePanel4: TLMDSimplePanel;
    dxBarDockControl2: TdxBarDockControl;
    panOpcoes: TLMDSimplePanel;
    LMDScrollBox1: TLMDScrollBox;
    gbConfirmar: TcxGroupBox;
    imgConfirmar: TImage;
    LMDSimplePanel5: TLMDSimplePanel;
    lbInfoConfirmar: TcxLabel;
    LMDSimplePanel8: TLMDSimplePanel;
    cbConfirmarAdmin: TcxCheckBox;
    LMDSimplePanel10: TLMDSimplePanel;
    cbConfirmarCli: TcxCheckBox;
    btnMaisConfirmarCli: TcxButton;
    LMDSimplePanel9: TLMDSimplePanel;
    cbConfirmarServ: TcxCheckBox;
    btnMaisConfirmarServ: TcxButton;
    gbAtivar: TcxGroupBox;
    gbRevisar: TcxGroupBox;
    imgRevisar: TImage;
    panInnerRevisar: TLMDSimplePanel;
    lbInfoRevisar: TcxLabel;
    LMDSimplePanel14: TLMDSimplePanel;
    cbRevisarCli: TcxCheckBox;
    LMDSimplePanel13: TLMDSimplePanel;
    cbRevisarAdmin: TcxCheckBox;
    gbImpNex: TcxGroupBox;
    imgImpressoraNex: TImage;
    LMDSimplePanel1: TLMDSimplePanel;
    lbInfoImpNex: TcxLabel;
    LMDSimplePanel6: TLMDSimplePanel;
    lbImpNexSaibaMais: TcxLabel;
    cbImpNex: TcxCheckBox;
    LMDSimplePanel16: TLMDSimplePanel;
    Image1: TImage;
    gbTarifas: TcxGroupBox;
    imgTarifas: TImage;
    LMDSimplePanel2: TLMDSimplePanel;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVImgID: TcxGridDBColumn;
    TVNome: TcxGridDBColumn;
    TVValor: TcxGridDBColumn;
    TVShowImp: TcxGridDBColumn;
    TVImpressora: TcxGridDBColumn;
    GL: TcxGridLevel;
    LMDSimplePanel3: TLMDSimplePanel;
    lbNovo: TcxLabel;
    lbEditar: TcxLabel;
    lbApagar: TcxLabel;
    imgAtivar: TImage;
    LMDSimplePanel11: TLMDSimplePanel;
    cbControlarImpCli: TcxCheckBox;
    cbCobrarImpFunc: TcxCheckBox;
    cbControlarImpServ: TcxCheckBox;
    LMDSimplePanel12: TLMDSimplePanel;
    lbAlertaRevisar: TcxLabel;
    lbAlertaConfirmar: TcxLabel;
    procedure cmApagarClick(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmZerarContadorClick(Sender: TObject);
    procedure TVValorGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVValorCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure cbControlarImpCliClick(Sender: TObject);
    procedure cmSalvarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure btnMaisConfirmarServClick(Sender: TObject);
    procedure btnMaisConfirmarCliClick(Sender: TObject);
    procedure lbImpNexSaibaMaisClick(Sender: TObject);
    procedure FrmBasePaiDestroy(Sender: TObject);
  private
    { Private declarations }
    FFirstLoad : Boolean;
    procedure RefreshPMValorMinMax;
    procedure RefreshVis;

    function AlterouConfig: Boolean;
    procedure SaveConfig;
    procedure LoadConfig;
  public
    { Public declarations }
    function  GetGrid: TcxGrid; override;
    
    procedure FiltraDados; override;
    procedure AtualizaDireitos; override;
    class function Descricao: String; override;
  end;

var
  fbTiposImp: TfbTiposImp;

implementation

uses 
  ncaFrmPri, 
  ncIDRecursos, 
  ncaDM, 
  ncaFrmTipoImp, 
  ncDMServ, 
  ncClassesBase, 
  ncImgImp, 
  ncTipoImp, uLicEXECryptor, ncaFrmPMNaoPausar, ncaFrmPMConfigConfirma,
  ncaFrmImpNexCafe, ufmImagens;

// START resource string wizard section
// MMX resource string wizard section REMOVIDA - 08/04/13 12:30


{$R *.dfm}

{ TfbPacotes }

class function TfbTiposImp.Descricao: String;
begin
  Result := SncafbTiposImp_TarifasDeImpressao;
end;

procedure TfbTiposImp.FiltraDados;
begin
  inherited;
end;

procedure TfbTiposImp.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  FrmConfigConfirma := TFrmConfigConfirma.Create(Self);
  FrmPMNaoPausar := TFrmPMNaoPausar.Create(Self);
  barMgr.Bars[0].BorderStyle := bbsNone;
  FFirstLoad := True;
end;

procedure TfbTiposImp.FrmBasePaiDestroy(Sender: TObject);
begin
  inherited;
  FrmConfigConfirma.Free;
end;

function TfbTiposImp.GetGrid: TcxGrid;
begin
  Result := nil;
end;

procedure TfbTiposImp.lbImpNexSaibaMaisClick(Sender: TObject);
begin
  inherited;
  TFrmImpNexCafe.Create(Self).ShowModal;
end;

procedure TfbTiposImp.LoadConfig;
begin
  FFirstLoad := False;
  cbControlarImpCli.Checked := (gConfig.ControlaImp=ciRegistrar);
  cbControlarImpServ.Checked := gConfig.DetectarImpServ;
  cbCobrarImpFunc.Checked := (not gConfig.NaoCobrarImpFunc);
  cbImpNex.Checked := gConfig.PMPDF;
  cbRevisarCli.Checked := gConfig.PMReviewCli;
  cbRevisarAdmin.Checked := gConfig.PMReviewAdmin;
  cbConfirmarCli.Checked := gConfig.PMConfirmaImpCliente;
  cbConfirmarAdmin.Checked := gConfig.PMConfirmaImpAdmin;
  cbConfirmarServ.Checked := gConfig.PMPausarServ;
  FrmPMNaoPausar.edPMNaoPausar.Lines.Text := gConfig.PMNaoPausar;

  FrmConfigConfirma.edPMMostrarPaginasCli.Checked := gConfig.PMMostrarPaginasCli;
  FrmConfigConfirma.edPMMostrarValorCli.Checked := gConfig.PMMostrarValorCli;
  FrmConfigConfirma.edPMObs.Lines.Text := gConfig.PMObsValorCli;
  FrmConfigConfirma.edPMCalcValorCli.EditValue := gConfig.PMCalcValorCli;
  
end;

procedure TfbTiposImp.RefreshPMValorMinMax;
var aMin, aMax: Currency;
begin
  DM.ObtemValorMinMaxImp(aMin, aMax);
  if (gConfig.PMValorMin<>aMin) or (gConfig.PMValorMax<>aMax) then begin
    gConfig.AtualizaCache;
    gConfig.PMValorMin := aMin;
    gConfig.PMValorMax := aMax;
    Dados.CM.SalvaAlteracoesObj(gConfig, False);
  end;
end;

procedure TfbTiposImp.RefreshVis;
begin
  cbCobrarImpFunc.Enabled := cbControlarImpServ.Checked or cbControlarImpCli.Checked;
  gbTarifas.Enabled := cbCobrarImpFunc.Enabled;
  lbNovo.Enabled := gbTarifas.Enabled;
  lbEditar.Enabled := lbNovo.Enabled;
  lbApagar.Enabled := lbEditar.Enabled;
  gbImpNex.Enabled := cbControlarImpCli.Checked;
  cbImpNex.Enabled := gbImpNex.Enabled;
  lbInfoImpNex.Enabled := cbImpNex.Enabled;
  lbImpNexSaibaMais.Enabled := cbImpNex.Enabled;
  gbRevisar.Enabled := gbTarifas.Enabled and gConfig.RevisarPDFDisponivel and cbImpNex.Checked;
  lbInfoRevisar.Enabled := gbRevisar.Enabled;
  cbRevisarCli.Enabled := gbRevisar.Enabled;
  cbRevisarAdmin.Enabled := gbRevisar.Enabled;

  cbConfirmarServ.Visible := True;
  cbConfirmarServ.Enabled := cbControlarImpServ.Checked;
  btnMaisConfirmarServ.Enabled := cbControlarImpServ.Checked and cbConfirmarServ.Checked;

  if not gConfig.RevisarPDFDisponivel then begin
    lbAlertaRevisar.Visible := True;
    if gConfig.StatusConta=scAnt then
      lbAlertaRevisar.Caption := SncafbTiposImp_CompreUmaAtualizacaoDoNexCafePar else
      lbAlertaRevisar.Caption := SncafbTiposImp_RecursoExclusivoParaAssinantesNe;
  end else
  if not cbImpNex.Checked then begin
    lbAlertaRevisar.Visible := True;
    lbAlertaRevisar.Caption := SncafbTiposImp_AtiveAImpressoraNexCafeParaUsarE;
  end else
    lbAlertaRevisar.Visible := False;

  cbRevisarCli.Enabled := cbControlarImpCli.Checked and (not lbAlertaRevisar.Visible);
  cbRevisarAdmin.Enabled := cbRevisarCli.Enabled;
  lbInfoRevisar.Enabled := cbRevisarCli.Enabled;

  lbAlertaConfirmar.Visible := not gConfig.ConfirmarImpDisponivel;
  gbConfirmar.Enabled := gbTarifas.Enabled and (not lbAlertaConfirmar.Visible);
  lbInfoConfirmar.Enabled := gbConfirmar.Enabled;
  cbConfirmarCli.Enabled := gbConfirmar.Enabled and cbControlarImpCli.Checked;
  btnMaisConfirmarCli.Enabled := cbConfirmarCli.Enabled and cbConfirmarCli.Checked;
  btnMaisConfirmarCli.Visible := not cbImpNex.Checked;
  cbConfirmarServ.Enabled := cbControlarImpServ.Checked;
  btnMaisConfirmarServ.Enabled := cbConfirmarServ.Enabled and cbConfirmarServ.Checked;
  cbConfirmarAdmin.Enabled := cbConfirmarCli.Enabled;  

  cmSalvar.Enabled := AlterouConfig;
  cmCancelar.Enabled := AlterouConfig;
end;

procedure TfbTiposImp.SaveConfig;
var I: Integer;
begin
  gConfig.AtualizaCache;
  if cbImpNex.Checked then
  for I := 0 to gTiposImp.Count-1 do with gTiposImp.Itens[I] do
  if (PrinterDevMode='') or (Impressora='') then begin
    if (Impressora='') then
      ShowMessage(SncafbTiposImp_ENecessarioEscolherUmaImpressora) else
      ShowMessage(SncafbTiposImp_ENecessarioConfigurarAsPreferenc);
    Dados.mtTipoImp.Locate('ID', ID, []); // do not localize
    cmEditarClick(nil);
    Exit;
  end;
  if cbControlarImpCli.Checked then
    gConfig.ControlaImp := ciRegistrar else
    gConfig.ControlaImp := ciDesativado;
  gConfig.DetectarImpServ := cbControlarImpServ.Checked;
  gConfig.NaoCobrarImpFunc := not cbCobrarImpFunc.Checked;
  gConfig.PMPDF := cbImpNex.Checked;
  gConfig.PMReviewCli := cbRevisarCli.Checked;
  gConfig.PMReviewAdmin := cbRevisarAdmin.Checked;
  gConfig.PMConfirmaImpCliente := cbConfirmarCli.Checked;
  gConfig.PMConfirmaImpAdmin := cbConfirmarAdmin.Checked;
  gConfig.PMPausarServ := cbConfirmarServ.Checked;
  gConfig.PMPausaAutomatica := (cbControlarImpCli.Checked and (gConfig.PMConfirmaImpCliente or gConfig.PMConfirmaImpAdmin)) or (cbConfirmarServ.Checked and cbControlarImpServ.Checked);
  gConfig.PMPDFPrintEng := printeng_clprint;
  gConfig.PMNaoPausar := FrmPMNaoPausar.edPMNaoPausar.Lines.Text;

  gConfig.PMMostrarPaginasCli := FrmConfigConfirma.edPMMostrarPaginasCli.Checked;
  gConfig.PMMostrarValorCli := FrmConfigConfirma.edPMMostrarValorCli.Checked;
  gConfig.PMObsValorCli := FrmConfigConfirma.edPMObs.Lines.Text;
  gConfig.PMCalcValorCli := FrmConfigConfirma.edPMCalcValorCli.EditValue;
  
  Dados.CM.SalvaAlteracoesObj(gConfig, False);
  RefreshVis;
end;

procedure TfbTiposImp.TVValorCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  ACanvas.Font.Style :=[fsBold];
end;

procedure TfbTiposImp.TVValorGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if Trim(AText)='' then
    AText := Trim(FloatToStrF(0, ffCurrency, 10, 2));
end;

procedure TfbTiposImp.cbControlarImpCliClick(Sender: TObject);
begin
  inherited;
  RefreshVis;
end;

procedure TfbTiposImp.cmApagarClick(Sender: TObject);
var T: TncTipoImp;
begin
  inherited;
  with Dados do 
  if not mtTipoImp.IsEmpty then
  if SimNaoH(SncafbTiposImp_DesejaRealmenteApagarATarifaDeIm + mtTipoImpNome.Value + '?', Handle) then
  begin
    T := gTiposImp.PorID[mtTipoImpID.Value];
    if T<>nil then begin
      Dados.CM.ApagaObj(T);
      RefreshPMValorMinMax;
    end;
  end;
end;

procedure TfbTiposImp.cmCancelarClick(Sender: TObject);
begin
  inherited;
  LoadConfig;
end;

procedure TfbTiposImp.cmEditarClick(Sender: TObject);
var T : TncTipoImp;
begin
  inherited;
  if Dados.mtTipoImp.IsEmpty then Exit;
  T := gTiposImp.PorID[Dados.mtTipoImpID.Value];
  if T=nil then Exit;
  T := T.Clone;
  try
    T.AtualizaCache;
    if TFrmTipoImp.Create(nil).Editar(T, cbImpNex.Checked) then begin
      Dados.CM.SalvaAlteracoesObj(T, False);
      RefreshPMValorMinMax;
    end;
  finally
    T.Free;
  end;
end;

procedure TfbTiposImp.cmNovoClick(Sender: TObject);
var 
  T : TncTipoImp;
  ProxCod : Integer;

procedure CalcProxCod;
var I: Integer;
begin
  with gTiposImp do
  for I := 1 to 10 do 
    if PorID[I]=nil then begin
      ProxCod := I;
      Exit;
    end;
  ProxCod := 0;
end;
  
begin
  inherited;
  
  if gTiposImp.Count>10 then
    Raise ENexCafe.Create(SncafbTiposImp_ONexCafeNaoAceitaMaisQue10TiposD);

  T := TncTipoImp.Create;  
  try
    if TFrmTipoImp.Create(nil).Editar(T, cbImpNex.Checked) then begin
      CalcProxCod;
      T.ID := ProxCod;
      Dados.CM.SalvaAlteracoesObj(T, True);
      RefreshPMValorMinMax;
    end;
  finally
     T.Free;
  end;
end;

procedure TfbTiposImp.cmSalvarClick(Sender: TObject);
begin
  inherited;
  SaveConfig;
end;

procedure TfbTiposImp.cmZerarContadorClick(Sender: TObject);
begin
{  inherited;
  if SimNaoH('Deseja realmente zerar o contador de impressões "' + TabNome.Value + '" ?', Handle) then
  begin
    Tab.Edit;
    TabContador.Value := 0;
    Tab.Post;
  end;       }
end;

function TfbTiposImp.AlterouConfig: Boolean;
begin
  Result := True;
  if (cbControlarImpCli.Checked <> (gConfig.ControlaImp>0)) then Exit;
  if (cbControlarImpServ.Checked <> gConfig.DetectarImpServ) then Exit;
  if (cbCobrarImpFunc.Checked <> (not gConfig.NaoCobrarImpFunc)) then Exit;
  if (cbImpNex.Checked <> gConfig.PMPDF) then Exit;
  if (cbRevisarCli.Checked <> gConfig.PMReviewCli) then Exit;
  if (cbRevisarAdmin.Checked <> gConfig.PMReviewAdmin) then Exit;
  if (cbConfirmarCli.Checked <> gConfig.PMConfirmaImpCliente) then Exit;
  if (cbConfirmarAdmin.Checked <> gConfig.PMConfirmaImpAdmin) then Exit;
  if (FrmPMNaoPausar.edPMNaoPausar.Lines.Text <> gConfig.PMNaoPausar) then Exit;
  if (FrmConfigConfirma.edPMMostrarPaginasCli.Checked <> gConfig.PMMostrarPaginasCli) then Exit;
  if (FrmConfigConfirma.edPMMostrarValorCli.Checked <> gConfig.PMMostrarValorCli) then Exit;
  if (FrmConfigConfirma.edPMObs.Lines.Text <> gConfig.PMObsValorCli) then Exit;
  if (FrmConfigConfirma.edPMCalcValorCli.EditValue <> gConfig.PMCalcValorCli) then Exit;
  if (cbConfirmarServ.Checked <> gConfig.PMPausarServ) then Exit;
  Result := False;
end;

procedure TfbTiposImp.AtualizaDireitos;
begin
  inherited;
  barMgr.Bars[0].BorderStyle := bbsNone;
  barMgr.Bars[1].BorderStyle := bbsNone;
  panOpcoes.Top := 100;
  if FFirstLoad or (not cmSalvar.Enabled) then LoadConfig;
  RefreshVis;
  lbApagar.Visible := Permitido(daCFGPrecos);
//  cmZerarContador.Enabled := Dados.CM.UA.Admin;
end;

procedure TfbTiposImp.btnMaisConfirmarCliClick(Sender: TObject);
begin
  inherited;
  FrmConfigConfirma.Editar;
  RefreshVis;
end;

procedure TfbTiposImp.btnMaisConfirmarServClick(Sender: TObject);
begin
  inherited;
  FrmPMNaoPausar.Editar;
  RefreshVis;
end;

end.

