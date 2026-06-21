unit uCMFrmConfig;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxCntner, dxExEdtr, dxEdLib, dxEditor, ExtCtrls, StdCtrls,
  uCMFrmPri,
  lmdctrl, lmdbtn,Registry, ComCtrls, lmdstdcA, Mask, dxDBELib, dxBar,
  DbTables, Db, nxdb, lmdcctrl, dxInspct, dxDBInsp,
  dxInspRw, dxDBInRw, dxInRwEx, dxLayout, dxDBTLCl, dxGrClms, dxTL,
  dxDBCtrl, dxDBGrid, kbmMemTable, lmdgroup, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, OvcBase, OvcEF,
  OvcPB, OvcPF, DBCtrls, LMDCustomComponent, LMDVersionInfo, dxPageControl,
  dxBarDBNav, OvcAe, LMDCustomParentPanel, LMDCustomGroupBox, LMDGroupBox,
  dxBarExtItems, LMDBaseGraphicControl, LMDBaseLabel, LMDCustomSimpleLabel,
  LMDSimpleLabel, LMDControl, LMDBaseControl, LMDBaseGraphicButton,
  LMDCustomSpeedButton, LMDSpeedButton,
  LMDCustomLabel, LMDLabel, dxDBEdtr, OvcCmbx, OvcClrCb, OvcDbCCb,
  LMDCustomComboBox, LMDCustomColorComboBox, LMDDBColorComboBox,
  cxControls, cxContainer, cxEdit, cxImage, LMDButtonControl,
  LMDRadioButton, LMDColorComboBox;

type
  TFrmConfig = class(TForm)
    BarMgr: TdxBarManager;
    Layouts: TdxDBGridLayoutList;
    layoutCidades: TdxDBGridLayout;
    OvcController1: TOvcController;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    LMDSimplePanel1: TLMDSimplePanel;
    Paginas: TdxPageControl;
    dxTabSheet1: TdxTabSheet;
    tsCores: TdxTabSheet;
    Insp: TdxDBInspector;
    InspNomeProdImp: TdxInspectorLookupRow;
    InspFecharProgramas: TdxInspectorDBCheckRow;
    InspAutoExecutar: TdxInspectorDBMaskRow;
    InspPacoteTempoReal: TdxInspectorDBCheckRow;
    InspPermiteLoginSemCred: TdxInspectorDBCheckRow;
    InspRow9: TdxInspectorDBCheckRow;
    InspRow10: TdxInspectorDBTimeRow;
    InspLimiteTempoPadrao: TdxInspectorDBTimeRow;
    InspRow11: TdxInspectorDBCheckRow;
    InspRow12: TdxInspectorDBImageRow;
    InspRow13: TdxInspectorDBCheckRow;
    InspRow14: TdxInspectorDBTimeRow;
    InspRow15: TdxInspectorDBCheckRow;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edLivre: TLMDDBColorComboBox;
    edPre: TLMDDBColorComboBox;
    edPos: TLMDDBColorComboBox;
    edManutencao: TLMDDBColorComboBox;
    edAguardaPagto: TLMDDBColorComboBox;
    edPausada: TLMDDBColorComboBox;
    edFLivre: TLMDDBColorComboBox;
    edFPre: TLMDDBColorComboBox;
    edFPos: TLMDDBColorComboBox;
    edFManutencao: TLMDDBColorComboBox;
    edFAguardaPagto: TLMDDBColorComboBox;
    edFPausada: TLMDDBColorComboBox;
    Label7: TLabel;
    Label8: TLabel;
    lbLivre: TLMDSimpleLabel;
    lbPre: TLMDSimpleLabel;
    lbPos: TLMDSimpleLabel;
    lbManutencao: TLMDSimpleLabel;
    lbAguardaPagto: TLMDSimpleLabel;
    lbPausada: TLMDSimpleLabel;
    InspRow16: TdxInspectorDBImageRow;
    dxTabSheet3: TdxTabSheet;
    InspGuard: TdxInspector;
    irMenuIniciar: TdxInspectorTextCheckRow;
    InspGuardRow2: TdxInspectorTextRow;
    irPainelControle: TdxInspectorTextCheckRow;
    irCtrlAltDel: TdxInspectorTextCheckRow;
    irCmdExec: TdxInspectorTextCheckRow;
    irBloquearDownload: TdxInspectorTextCheckRow;
    InspGuardRow7: TdxInspectorTextRow;
    irPaginaInicial: TdxInspectorTextRow;
    dxTabSheet4: TdxTabSheet;
    rbPermitePrePago: TLMDRadioButton;
    rbPermitePosPago: TLMDRadioButton;
    rbBloqueioTotal: TLMDRadioButton;
    rbFecharCMGuard: TLMDRadioButton;
    LMDLabel1: TLMDLabel;
    irAlinhamento: TdxInspectorTextImageRow;
    irEsconderCronometro: TdxInspectorTextCheckRow;
    InspRow17: TdxInspectorDBCheckRow;
    cbDesktopCorFonte: TLMDColorComboBox;
    cbDesktopCor: TLMDColorComboBox;
    Label9: TLabel;
    lbDesktop: TLMDSimpleLabel;
    InspRow18: TdxInspectorDBCheckRow;
    InspEncerramentoPrePago: TdxInspectorDBImageRow;
    InspTol: TdxInspectorDBTimeRow;
    dxTabSheet2: TdxTabSheet;
    InspRec: TdxDBInspector;
    InspRecRow2: TdxInspectorDBPickRow;
    InspRecRow3: TdxInspectorDBSpinRow;
    InspRecRow4: TdxInspectorDBSpinRow;
    InspRecRow5: TdxInspectorDBMemoRow;
    InspRecRow6: TdxInspectorDBMemoRow;
    InspRecRow1: TdxInspectorDBImageRow;
    InspRow19: TdxInspectorDBCheckRow;
    irAposEncerrar: TdxInspectorTextImageRow;
    irTempoSumir: TdxInspectorTextSpinRow;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edLivreChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rbPermitePrePagoClick(Sender: TObject);
    procedure cbDesktopCorChange(Sender: TObject);
    procedure InspRecDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas;
      ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor;
      var ADone: Boolean);
  private
    { Private declarations }
  public
    FTipos : Array[1..20] of String[15];
    FNoNet : Integer;
    slGuard : TStrings;
    procedure AjustaTeste;
    { Public declarations }
  end;

var
  FrmConfig: TFrmConfig;
                       
implementation

uses cmClassesBase, uCMDados, uCMFrmCor, cmIDRecursos;

{$R *.DFM}

procedure TFrmConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
  with Dados.tbConfig do
  if State in [dsEdit, dsInsert]  then
    Cancel;
end;

procedure TFrmConfig.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfig.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter :
    if ssCtrl in Shift then 
      cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmConfig.cmGravarClick(Sender: TObject);
var St : String;
begin
  with Dados do begin
    InspGuard.PostEditor;
    Insp.PostEditor;
    slGuard.Values['CmdExec'] := irCmdExec.Text;
    slGuard.Values['MenuIniciar'] := irMenuIniciar.Text;
    slGuard.Values['PainelControle'] := irPainelControle.Text;
    slGuard.Values['CtrlAltDel'] := irCtrlAltDel.Text;
    slGuard.Values['BloquearDownload'] := irBloquearDownload.Text;
    slGuard.Values['PaginaInicial'] := irPaginaInicial.Text;
    slGuard.Values['EsconderCronometro'] := irEsconderCronometro.Text;
    slGuard.Values['AposEncerrar'] := irAposEncerrar.Text;
    slGuard.Values['AlinhaBarra'] := irAlinhamento.Text;
    slGuard.Values['NoNet'] := IntToStr(FNoNet);
    slGuard.Values['DesktopCor'] := IntToStr(cbDesktopCor.SelectedColor);
    slGuard.Values['DesktopCorFonte'] := IntToStr(cbDesktopCorFonte.SelectedColor);
    slGuard.Values['TempoSumir'] := irTempoSumir.Text;
    
    tbConfigCMGuard.Value := slGuard.Text;

    tbConfig.Post;
    CM.Config.LeDataset(tbConfig);
    CM.SalvaAlteracoesObj(CM.Config, False);
    AjustaCampoLocalizaCli;
  end;
  Close;
end;

procedure TFrmConfig.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfig.FormCreate(Sender: TObject);
begin
  slGuard := TStringList.Create;
  slGuard.Text := Dados.CM.Config.CMGuard;
  Dados.tbConfig.Edit;
  Paginas.ActivePageIndex := 0;
  cmGravar.Enabled := Permitido(daCFGParametros);

  irCmdExec.Text := BoolToString[StringToBool(slGuard.Values['CmdExec'])];
  irMenuIniciar.Text := BoolToString[StringToBool(slGuard.Values['MenuIniciar'])];
  irPainelControle.Text := BoolToString[StringToBool(slGuard.Values['PainelControle'])];
  irCtrlAltDel.Text := BoolToString[StringToBool(slGuard.Values['CtrlAltDel'])];
  irBloquearDownload.Text := BoolToString[StringToBool(slGuard.Values['BloquearDownload'])];
  irEsconderCronometro.Text := BoolToString[StringToBool(slGuard.Values['EsconderCronometro'])];
  irTempoSumir.Text := IntToStr(StrToIntDef(slGuard.Values['TempoSumir'], 15));

  if slGuard.Values['AposEncerrar']='' then
  if StringToBool(slGuard.Values['ReiniciarMaq']) then
    slGuard.Values['AposEncerrar'] := '1'
  else 
    slGuard.Values['AposEncerrar'] := '0';
      
  irAposEncerrar.Text := slGuard.Values['AposEncerrar'];
  irAlinhamento.Text := IntToStr(StrToIntDef(slGuard.Values['AlinhaBarra'], 0));

  cbDesktopCor.SelectedColor := StrToIntDef(slGuard.Values['DesktopCor'], clBackground);
  cbDesktopCorFonte.SelectedColor := StrToIntDef(slGuard.Values['DesktopCorFonte'], clBlack);

  irPaginaInicial.Text := slGuard.Values['PaginaInicial'];
  FNoNet := StrToIntDef(slGuard.Values['NoNet'], 0);
  case FNoNet of
    obPermitePrePago : rbPermitePrePago.Checked := True;
    obPermitePosPago : rbPermitePosPago.Checked := True;
    obBloqueioTotal  : rbBloqueioTotal.Checked := True;
    obFecharCMGuard  : rbFecharCMGuard.Checked := True;
  end;
end;

procedure TFrmConfig.AjustaTeste;
begin
  lbLivre.Color := edLivre.SelectedColor;
  lbLivre.Font.Color := edFLivre.SelectedColor;
  lbPre.Color := edPre.SelectedColor;
  lbPre.Font.Color := edFPre.SelectedColor;
  lbPos.Color := edPos.SelectedColor;
  lbPos.Font.Color := edFPos.SelectedColor;
  lbManutencao.Color := edManutencao.SelectedColor;
  lbManutencao.Font.Color := edFManutencao.SelectedColor;
  lbAguardaPagto.Color := edAguardaPagto.SelectedColor;
  lbAguardaPagto.Font.Color := edFAguardaPagto.SelectedColor;
  lbPausada.Color := edPausada.SelectedColor;
  lbPausada.Font.Color := edFPausada.SelectedColor;
  lbDesktop.Color := cbDesktopCor.SelectedColor;
  lbDesktop.Font.Color := cbDesktopCorFonte.SelectedColor;
end;

procedure TFrmConfig.edLivreChange(Sender: TObject);
begin
  AjustaTeste;
end;

procedure TFrmConfig.FormDestroy(Sender: TObject);
begin
  slGuard.Free;
end;

procedure TFrmConfig.rbPermitePrePagoClick(Sender: TObject);
begin
  FNoNet := TLMDRadioButton(Sender).Tag;
end;

procedure TFrmConfig.cbDesktopCorChange(Sender: TObject);
begin
  lbDesktop.Color := cbDesktopCor.SelectedColor;
  lbDesktop.Font.Color := cbDesktopCorFonte.SelectedColor;
end;

procedure TFrmConfig.InspRecDrawCaption(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  AFont.Name := 'Tahoma';
  AFont.Size := 8;
end;

end.
