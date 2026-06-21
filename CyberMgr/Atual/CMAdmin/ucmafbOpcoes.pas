unit ucmafbOpcoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSCore, cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, dxBarExtItems,
  ExtCtrls, cxStyles, cxGraphics, cxEdit, cxCheckBox, cxDBLookupComboBox,
  cxMaskEdit, cxTimeEdit, cxImageComboBox, cxColorComboBox, cxVGrid,
  cxClasses, cxDBVGrid, cxInplaceContainer, cxPC, cxControls,
  cxDropDownEdit, cxSpinEdit, cxMemo, cxTextEdit, cxContainer, cxGroupBox,
  cxRadioGroup, cxLabel, DB, kbmMemTable, cxCheckListBox, LMDCustomComponent,
  LMDCustomHint, LMDHint, cxCurrencyEdit, cxButtonEdit;

type
  TfbOpcoes = class(TFrmBase)
    Paginas: TcxPageControl;
    tsGeral: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    tsQdoCairRede: TcxTabSheet;
    tsRec: TcxTabSheet;
    tsCores: TcxTabSheet;
    vgGeral: TcxDBVerticalGrid;
    vgGeralRegImp981: TcxDBEditorRow;
    vgGeralNomeProdImp1: TcxDBEditorRow;
    vgGeralFecharProgramas1: TcxDBEditorRow;
    vgGeralAutoExecutar1: TcxDBEditorRow;
    vgGeralLimiteTempoPadrao1: TcxDBEditorRow;
    vgGeralPacoteTempoReal1: TcxDBEditorRow;
    vgGeralPermiteLoginSemCred1: TcxDBEditorRow;
    vgGeralEncerramentoPrePago1: TcxDBEditorRow;
    vgGeralMostraPrePagoDec1: TcxDBEditorRow;
    vgGeralPermiteCapturaTela1: TcxDBEditorRow;
    vgGeralVariosTiposAcesso1: TcxDBEditorRow;
    vgGeralModoPagtoAcesso1: TcxDBEditorRow;
    vgGeralMostraCliCadAntesAvulso: TcxDBEditorRow;
    vgGeralCampoLocalizaCli1: TcxDBEditorRow;
    vgGeralManterSaldoCaixa1: TcxDBEditorRow;
    vgGeralNaoMostrarMsgDebito1: TcxDBEditorRow;
    vgGeralTolerancia1: TcxDBEditorRow;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxVerticalGridStyleSheetUserFormat2: TcxVerticalGridStyleSheet;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    vgCor: TcxDBVerticalGrid;
    vgCorMaqLivre: TcxDBEditorRow;
    vgCorCMaqLivre: TcxCategoryRow;
    vgCorFMaqLivre: TcxDBEditorRow;
    vgCorCUsoPre: TcxCategoryRow;
    vgCorMaqUsoPre: TcxDBEditorRow;
    vgCorFUsoPre: TcxDBEditorRow;
    vgCorCUsoPos: TcxCategoryRow;
    vgCorCUsoManut: TcxCategoryRow;
    vgCorCPausada: TcxCategoryRow;
    vgCorCategoryRow4: TcxCategoryRow;
    vgCorUsoPos: TcxDBEditorRow;
    vgCorFUsoPos: TcxDBEditorRow;
    vgCorManut: TcxDBEditorRow;
    vgCorFManut: TcxDBEditorRow;
    vgCorPausa: TcxDBEditorRow;
    vgCorFPausa: TcxDBEditorRow;
    vgCorDesktop: TcxDBEditorRow;
    vgCorFDesktop: TcxDBEditorRow;
    cmSalvar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    vgRec: TcxDBVerticalGrid;
    vgRecImprimirImpRec1: TcxDBEditorRow;
    vgRecPortaImpRec1: TcxDBEditorRow;
    vgRecSaltoImpRec1: TcxDBEditorRow;
    vgRecLargImpRec1: TcxDBEditorRow;
    vgRecCabecalhoImpRec1: TcxDBEditorRow;
    vgRecRodapeImpRec1: TcxDBEditorRow;
    vgMC: TcxVerticalGrid;
    vgmAlinhamento: TcxEditorRow;
    vgmEsconderCronometro: TcxEditorRow;
    vgmAposEncerrar: TcxEditorRow;
    vgmTempoSumir: TcxEditorRow;
    vgMCCategoryRow1: TcxCategoryRow;
    vgmMenuIniciar: TcxEditorRow;
    vgmPainelControle: TcxEditorRow;
    vgmCtrlAltDel: TcxEditorRow;
    vgmCmdExec: TcxEditorRow;
    vgMCCategoryRow2: TcxCategoryRow;
    vgmBloquearDownload: TcxEditorRow;
    vgmPaginaInicial: TcxEditorRow;
    rgQdoCairRede: TcxRadioGroup;
    MT: TkbmMemTable;
    DS: TDataSource;
    MTNumSeq: TAutoIncField;
    MTModulos: TMemoField;
    MTTiposLancExtra: TMemoField;
    MTProgramasPermitidos: TMemoField;
    MTCMGuard: TMemoField;
    MTJanelasExplorer: TMemoField;
    MTFecharProgramas: TBooleanField;
    MTAutoExecutar: TStringField;
    MTLimiteTempoPadrao: TDateTimeField;
    MTPacoteTempoReal: TBooleanField;
    MTPermiteLoginSemCred: TBooleanField;
    MTEncerramentoPrePago: TWordField;
    MTProdutoImpressao: TStringField;
    MTPermiteCapturaTela: TBooleanField;
    MTAlertaFimTempo: TDateTimeField;
    MTVariosTiposAcesso: TBooleanField;
    MTModoPagtoAcesso: TWordField;
    MTMostraPrePagoDec: TBooleanField;
    MTTempoMaxAlerta: TDateTimeField;
    MTMostraCliCadAntesAvulso: TBooleanField;
    MTAbre1: TDateTimeField;
    MTAbre2: TDateTimeField;
    MTAbre3: TDateTimeField;
    MTAbre4: TDateTimeField;
    MTAbre5: TDateTimeField;
    MTAbre6: TDateTimeField;
    MTAbre7: TDateTimeField;
    MTFecha1: TDateTimeField;
    MTFecha2: TDateTimeField;
    MTFecha3: TDateTimeField;
    MTFecha4: TDateTimeField;
    MTFecha5: TDateTimeField;
    MTFecha6: TDateTimeField;
    MTFecha7: TDateTimeField;
    MTCorLivre: TIntegerField;
    MTCorFLivre: TIntegerField;
    MTCorUsoPrePago: TIntegerField;
    MTCorFUsoPrePago: TIntegerField;
    MTCorUsoPosPago: TIntegerField;
    MTCorFUsoPosPago: TIntegerField;
    MTCorAguardaPagto: TIntegerField;
    MTCorFAguardaPagto: TIntegerField;
    MTCorManutencao: TIntegerField;
    MTCorFManutencao: TIntegerField;
    MTCorPausado: TIntegerField;
    MTCorFPausado: TIntegerField;
    MTCorDesktop: TIntegerField;
    MTCorFDesktop: TIntegerField;
    MTCampoLocalizaCli: TWordField;
    MTManterSaldoCaixa: TBooleanField;
    MTNaoMostrarMsgDebito: TBooleanField;
    MTTolerancia: TDateTimeField;
    MTRegImp98: TBooleanField;
    MTPortaImpRec: TStringField;
    MTSaltoImpRec: TWordField;
    MTLargImpRec: TWordField;
    MTCabecalhoImpRec: TMemoField;
    MTRodapeImpRec: TMemoField;
    MTImprimirImpRec: TBooleanField;
    cxLabel1: TcxLabel;
    vgmLiberarRede: TcxEditorRow;
    vgmEsconderDrives: TcxEditorRow;
    clbDrives: TcxCheckListBox;
    cxLabel2: TcxLabel;
    lbLivre: TcxLabel;
    lbPrePago: TcxLabel;
    lbPosPago: TcxLabel;
    lbManut: TcxLabel;
    lbPausa: TcxLabel;
    lbDesktop: TcxLabel;
    vgGeralMostraProgAtual: TcxDBEditorRow;
    MTMostraProgAtual: TBooleanField;
    MTNomeProdutoImp: TStringField;
    vgGeralMostraObs: TcxDBEditorRow;
    MTMostraObs: TBooleanField;
    MTExigirRG: TBooleanField;
    vgExigirRG: TcxDBEditorRow;
    vgGeralDesativaRegAutImp: TcxDBEditorRow;
    MTDesativaRegAutImp: TBooleanField;
    LMDHint1: TLMDHint;
    vgGeralDBEditorRow1: TcxDBEditorRow;
    MTLimitePadraoDebito: TCurrencyField;
    vgGeralEscondeTipoAcesso: TcxDBEditorRow;
    MTEscondeTipoAcesso: TBooleanField;
    vgMCFundoLogin: TcxEditorRow;
    vgMCFundoDesktop: TcxEditorRow;
    vgmMostrarApenasPIN: TcxEditorRow;
    vgmTextoPIN: TcxEditorRow;
    vgGeralAlterarSenha: TcxDBEditorRow;
    MTAlterarSenhaCli: TBooleanField;
    MTVerSenhaCli: TBooleanField;
    vgGeralVerSenha: TcxDBEditorRow;
    procedure vgMCFundoDesktopEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure vgMCEditorRow1EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure cmSalvarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FrmBasePaiDestroy(Sender: TObject);
    procedure rgQdoCairRedePropertiesEditValueChanged(Sender: TObject);
    procedure vgMCEditValueChanged(Sender: TObject;
      ARowProperties: TcxCustomEditorRowProperties);
    procedure vgGeralEditValueChanged(Sender: TObject;
      ARowProperties: TcxCustomEditorRowProperties);
    procedure vgCorEditValueChanged(Sender: TObject;
      ARowProperties: TcxCustomEditorRowProperties);
    procedure vgRecEditValueChanged(Sender: TObject;
      ARowProperties: TcxCustomEditorRowProperties);
    procedure PaginasChange(Sender: TObject);
    procedure vgmEsconderDrivesEditPropertiesCloseUp(Sender: TObject);
  private
    FAlterou : Boolean;
    procedure SetAlterou(const Value: Boolean);
    { Private declarations }
  protected
    slGuard: TStrings;
    property Alterou: Boolean
      read FAlterou write SetAlterou;  
  public
    class function Descricao: String; override;
  
    procedure Ler;
    procedure Salvar;
    procedure AtualizaCores;
    { Public declarations }
  end;

var
  fbOpcoes: TfbOpcoes;

implementation

uses ucmaDM, ucmaPri, ucmaFrmFundo;

{$R *.dfm}

procedure TfbOpcoes.FrmBasePaiCreate(Sender: TObject);
begin
  inherited;
  slGuard := TStringList.Create;
  MT.Active := True;
  Ler;
end;

function StrToBoolean(S: String): Boolean;
begin
  S := UpperCase(S);
  if (S='TRUE') or (S='S') or (S='Y') then
    Result := True
  else
    Result := False;  
end;

procedure TfbOpcoes.Ler;
var
  S: String;
  C: Char;
begin
  Alterou := False;
  MT.Active := True;
  MT.EmptyTable;
  MT.Insert;
  TransfDados(Dados.tbConfig, MT);
  MT.Post;
  slGuard.Text := Dados.tbConfigCMGuard.Value;
  
  vgmCmdExec.Properties.Value            := slGuard.Values['CmdExec'];
  vgmMenuIniciar.Properties.Value        := slGuard.Values['MenuIniciar'];
  vgmPainelControle.Properties.Value     := slGuard.Values['PainelControle'];
  vgmCtrlAltDel.Properties.Value         := slGuard.Values['CtrlAltDel'];
  vgmBloquearDownload.Properties.Value   := slGuard.Values['BloquearDownload'];
  vgmPaginaInicial.Properties.Value      := slGuard.Values['PaginaInicial'];
  vgmEsconderCronometro.Properties.Value := slGuard.Values['EsconderCronometro'];
  vgmAposEncerrar.Properties.Value       := StrToIntDef(slGuard.Values['AposEncerrar'], 0);
  vgmAlinhamento.Properties.Value        := StrToIntDef(slGuard.Values['AlinhaBarra'], 0);
  rgQdoCairRede.EditValue                := StrToIntDef(slGuard.Values['NoNet'], 0);
  vgmTempoSumir.Properties.Value         := StrToIntDef(slGuard.Values['TempoSumir'], 30);
  vgmLiberarRede.Properties.Value        := StrToBoolean(slGuard.Values['LiberarRede']);
  vgmEsconderDrives.Properties.Value     := slGuard.Values['EsconderDrives'];
  vgmTextoPIN.Properties.Value           := Dados.tbConfigTextoPIN.Value;
  vgmMostrarApenasPIN.Properties.Value   := Dados.tbConfigMostrarApenasPIN.Value;
  if Trim(vgmTextoPIN.Properties.Value)='' then
    vgmTextoPIN.Properties.Value := 'Nome de Usuário';
  S := slGuard.Values['EsconderDrives'];
  for C := 'A' to 'Z' do
    clbDrives.Items.Items[Ord(C) - Ord('A')].Checked := (Pos(C, S)>0);
  vgMC.Refresh;
  Alterou := False;
end;

procedure TfbOpcoes.Salvar;
begin
  vgGeral.DataController.PostEditingData;
  vgCor.DataController.PostEditingData;
  vgRec.DataController.PostEditingData;
  if MT.State in [dsEdit, dsInsert] then MT.Post;
  with Dados do begin
    tbConfig.Edit;
    TransfDados(MT, tbConfig);
    slGuard.Values['CmdExec'] := vgmCmdExec.Properties.Value;
    slGuard.Values['MenuIniciar'] := vgmMenuIniciar.Properties.Value;
    slGuard.Values['PainelControle'] := vgmPainelControle.Properties.Value;
    slGuard.Values['CtrlAltDel'] := vgmCtrlAltDel.Properties.Value;
    slGuard.Values['BloquearDownload'] := vgmBloquearDownload.Properties.Value;
    slGuard.Values['PaginaInicial'] := vgmPaginaInicial.Properties.Value;
    slGuard.Values['EsconderCronometro'] := vgmEsconderCronometro.Properties.Value;
    slGuard.Values['AposEncerrar'] := vgmAposEncerrar.Properties.Value;
    slGuard.Values['AlinhaBarra'] := vgmAlinhamento.Properties.Value;
    slGuard.Values['NoNet'] := rgQdoCairRede.EditValue;
    slGuard.Values['TempoSumir'] := vgmTempoSumir.Properties.Value;
    slGuard.Values['LiberarRede'] := vgmLiberarRede.Properties.Value;
    tbConfigMostrarApenasPIN.Value := vgmMostrarApenasPIN.Properties.Value;
    tbConfigTextoPIN.Value := vgmTextoPIN.Properties.Value;
    tbConfigCMGuard.Value := slGuard.Text;    
    tbConfig.Post;
    MT.Edit;
    MTCMGuard.Value := slGuard.Text;
    MT.Post;
    CM.Config.LeDataset(tbConfig);
    CM.SalvaAlteracoesObj(CM.Config, False);
    AjustaCampoLocalizaCli;
  end;
  Alterou := False;
end;

procedure TfbOpcoes.SetAlterou(const Value: Boolean);
begin
  FAlterou := Value;
  cmSalvar.Enabled := FAlterou;
  cmCancelar.Enabled := FAlterou;
  AtualizaCores;
end;

procedure TfbOpcoes.cmSalvarClick(Sender: TObject);
begin
  inherited;
  Salvar;
end;

procedure TfbOpcoes.cmCancelarClick(Sender: TObject);
begin
  inherited;
  Ler;
  if Paginas.ActivePageIndex=1 then
    vgMC.SetFocus;
end;

procedure TfbOpcoes.FrmBasePaiDestroy(Sender: TObject);
begin
  Paginas.OnChange := nil;
  slGuard.Free;
  inherited;
end;

procedure TfbOpcoes.rgQdoCairRedePropertiesEditValueChanged(
  Sender: TObject);
begin
  Alterou := True;
end;

procedure TfbOpcoes.vgMCEditorRow1EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  TFrmFundo.Create(nil).Mostrar(False);
end;

procedure TfbOpcoes.vgMCEditValueChanged(Sender: TObject;
  ARowProperties: TcxCustomEditorRowProperties);
begin
  Alterou := True;
end;

procedure TfbOpcoes.vgMCFundoDesktopEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  TFrmFundo.Create(nil).Mostrar(True);
end;

procedure TfbOpcoes.vgGeralEditValueChanged(Sender: TObject;
  ARowProperties: TcxCustomEditorRowProperties);
begin
  Alterou := True;
end;

procedure TfbOpcoes.vgCorEditValueChanged(Sender: TObject;
  ARowProperties: TcxCustomEditorRowProperties);
begin
  Alterou := True;
end;

procedure TfbOpcoes.vgRecEditValueChanged(Sender: TObject;
  ARowProperties: TcxCustomEditorRowProperties);
begin
  Alterou := True;
end;

class function TfbOpcoes.Descricao: String;
begin
  Result := 'Opções';
end;

procedure TfbOpcoes.PaginasChange(Sender: TObject);
begin
  case Paginas.ActivePageIndex of 
    0 : vgGeral.SetFocus;
    1 : vgMC.SetFocus;
    2 : rgQdoCairRede.SetFocus;
    3 : vgCor.SetFocus;
    4 : vgRec.SetFocus;
  end;  
end;

procedure TfbOpcoes.vgmEsconderDrivesEditPropertiesCloseUp(
  Sender: TObject);
var
  I: Integer;
  S: String;
begin
  S := '';
  for I := 0 to clbDrives.Items.Count-1 do
  if clbDrives.Items[I].Checked then 
    S := S + Char(Ord('A') + I);
  slGuard.Values['EsconderDrives'] := S;  
  vgmEsconderDrives.Properties.Value := S;
  vgMC.InplaceEditor.EditValue := S;
  vgMC.InplaceEditor.PostEditValue;
end;

procedure TfbOpcoes.AtualizaCores;
begin
  lbLivre.Style.Color := MTCorLivre.Value;
  lbPrePago.Style.Color := MTCorUsoPrePago.Value;
  lbPosPago.Style.Color := MTCorUsoPosPago.Value;
  lbManut.Style.Color := MTCorManutencao.Value;
  lbPausa.Style.Color := MTCorPausado.Value;
  lbDesktop.Style.Color := MTCorDesktop.Value;

  lbLivre.Style.TextColor := MTCorFLivre.Value;
  lbPrePago.Style.TextColor := MTCorFUsoPrePago.Value;
  lbPosPago.Style.TextColor := MTCorFUsoPosPago.Value;
  lbManut.Style.TextColor := MTCorFManutencao.Value;
  lbPausa.Style.TextColor := MTCorFPausado.Value;
  lbDesktop.Style.TextColor := MTCorFDesktop.Value;
end;

end.
