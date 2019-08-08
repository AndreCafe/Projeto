unit ncaFrmCadCli;
{
    ResourceString: Dario 10/03/13
    João: TODO List!
}

interface

{$I NEX.inc}

uses
  Windows, Variants, Messages, SysUtils, Classes, Graphics, jpeg, Controls, Forms, Dialogs,
  dxBar, StdCtrls, 
  DBCtrls, ExtCtrls,
  ComCtrls, Db, kbmMemTable, ToolWin, nxdb, 
  dxBarExtItems, 
  cxStyles, cxGraphics, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxImageComboBox, cxMemo, ufmFormBase,
  cxVGrid, cxDBVGrid, cxInplaceContainer, cxPC, cxControls,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, Mask,
  cxCheckBox, cxRadioGroup, cxTimeEdit, cxLookAndFeels, cxGroupBox, cxDBEdit,
  cxContainer, cxCurrencyEdit, cxImage, Buttons, cxLabel,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel, LMDControl,
  LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  cxClasses, cxBarEditItem, 
  dxNavBarCollns, dxNavBarBase, dxNavBar,
  dxLayoutControl, dxLayoutLookAndFeels, dxNavBarStyles,
  cxLookAndFeelPainters, ImgList, cxSpinEdit, LMDCustomImageList,
  LMDImageList, cxPCdxBarPopupMenu, dxLayoutcxEditAdapters, dxLayoutContainer,
  LMDPNGImage, Menus, cxButtons, dxBarBuiltInMenu;

type
  TFrmCadCli = class(TForm)
    BarMgr: TdxBarManager;
    DS: TDataSource;
    panPri: TLMDSimplePanel;
    tAux: TnxTable;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    FMgr: TFormManager;
    MT: TkbmMemTable;
    MTNome: TStringField;
    MTEndereco: TStringField;
    MTBairro: TStringField;
    MTCidade: TStringField;
    MTUF: TStringField;
    MTCEP: TStringField;
    MTNasc: TDateTimeField;
    MTSexo: TStringField;
    MTObs: TMemoField;
    MTCpf: TStringField;
    MTRg: TStringField;
    MTTelefone: TStringField;
    MTEmail: TMemoField;
    MTIsento: TBooleanField;
    MTUsername: TStringField;
    MTSenha: TStringField;
    MTUltVisita: TDateTimeField;
    MTEscola: TStringField;
    MTNickName: TStringField;
    MTDataNasc: TDateTimeField;
    MTCelular: TStringField;
    MTTipoAcessoPref: TIntegerField;
    MTIncluidoEm: TSQLTimeStampField;
    MTAlteradoEm: TDateTimeField;
    MTIncluidoPor: TStringField;
    MTAlteradoPor: TStringField;
    MTPai: TStringField;
    MTMae: TStringField;
    MTEscolaHI: TDateTimeField;
    MTEscolaHF: TDateTimeField;
    MTInativo: TBooleanField;
    MTLimiteDebito: TCurrencyField;
    L: TcxLookAndFeelController;
    dxBarCombo1: TdxBarCombo;
    dxBarCombo2: TdxBarCombo;
    MTFoto: TGraphicField;
    MTID: TIntegerField;
    MTHP1: TIntegerField;
    MTHP2: TIntegerField;
    MTHP3: TIntegerField;
    MTHP4: TIntegerField;
    MTHP5: TIntegerField;
    MTHP6: TIntegerField;
    MTHP7: TIntegerField;
    MTNaoGuardarCredito: TBooleanField;
    BarMgrBar1: TdxBar;
    cxBarEditItem1: TcxBarEditItem;
    MTPermiteLoginSemCred: TBooleanField;
    MTTitEleitor: TStringField;
    NB: TdxNavBar;
    nbiCred: TdxNavBarItem;
    nbiFicha: TdxNavBarItem;
    nbiCensura: TdxNavBarItem;
    nbiOpcoes: TdxNavBarItem;
    NBGroup1: TdxNavBarGroup;
    nbiFid: TdxNavBarItem;
    nbiTran: TdxNavBarItem;
    nbiDebitos: TdxNavBarItem;
    Paginas: TcxPageControl;
    tsDados: TcxTabSheet;
    tsCensura: TcxTabSheet;
    tsOpcoes: TcxTabSheet;
    tsDebitos: TcxTabSheet;
    tsPass: TcxTabSheet;
    tsExtratoFid: TcxTabSheet;
    tsTran: TcxTabSheet;
    lcFicha: TdxLayoutControl;
    lcFichaItem2: TdxLayoutItem;
    edCodigo: TcxDBMaskEdit;
    edNome: TcxDBTextEdit;
    lcFichaItem3: TdxLayoutItem;
    edUsername: TcxDBTextEdit;
    lcUsername: TdxLayoutItem;
    edSenha: TcxDBTextEdit;
    lcSenha: TdxLayoutItem;
    edSexo: TcxDBImageComboBox;
    lcFichaItem6: TdxLayoutItem;
    edApelido: TcxDBTextEdit;
    lcApelido: TdxLayoutItem;
    edTelefone: TcxDBTextEdit;
    lcFichaItem8: TdxLayoutItem;
    edCelular: TcxDBTextEdit;
    lcFichaItem9: TdxLayoutItem;
    edRG: TcxDBTextEdit;
    lcFichaItem10: TdxLayoutItem;
    edNasc: TcxDBDateEdit;
    lcFichaItem11: TdxLayoutItem;
    lcFichaGroup4: TdxLayoutGroup;
    lcFichaGroup5: TdxLayoutGroup;
    edCPF: TcxDBTextEdit;
    lcFichaItem12: TdxLayoutItem;
    lcFichaGroup8: TdxLayoutGroup;
    edMae: TcxDBTextEdit;
    lcFichaItem13: TdxLayoutItem;
    edPai: TcxDBTextEdit;
    lcFichaItem14: TdxLayoutItem;
    lcFichaGroup6: TdxLayoutGroup;
    lcFichaGroup9: TdxLayoutGroup;
    edTitEleitor: TcxDBTextEdit;
    lcFichaItem15: TdxLayoutItem;
    edEscola: TcxDBComboBox;
    lcEscola: TdxLayoutItem;
    edEndereco: TcxDBTextEdit;
    lcFichaItem17: TdxLayoutItem;
    edBairro: TcxDBComboBox;
    lcFichaItem18: TdxLayoutItem;
    edCidade: TcxDBComboBox;
    lcFichaItem19: TdxLayoutItem;
    edUF: TcxDBTextEdit;
    lcFichaItem20: TdxLayoutItem;
    lcFichaGroup12: TdxLayoutGroup;
    lcFichaGroup10: TdxLayoutGroup;
    lcFichaGroup11: TdxLayoutGroup;
    edCEP: TcxDBMaskEdit;
    lcFichaItem21: TdxLayoutItem;
    edEmail: TcxDBMemo;
    lcFichaItem22: TdxLayoutItem;
    edObs: TcxDBMemo;
    lcFichaItem23: TdxLayoutItem;
    lcFichaGroup1: TdxLayoutGroup;
    pagFoto: TcxPageControl;
    lcFichaItem24: TdxLayoutItem;
    tsSemFoto: TcxTabSheet;
    tsFoto: TcxTabSheet;
    lcFichaGroup13: TdxLayoutGroup;
    lcFichaGroup7: TdxLayoutGroup;
    lcFichaGroup15: TdxLayoutGroup;
    lcFichaGroup16: TdxLayoutGroup;
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    lbSemFoto: TcxLabel;
    panFoto: TLMDSimplePanel;
    edFoto: TcxDBImage;
    NBStyleItem1: TdxNavBarStyleItem;
    LMDSimplePanel2: TLMDSimplePanel;
    lbCH1: TcxLabel;
    lbCH2: TcxLabel;
    lbCH3: TcxLabel;
    lbCH4: TcxLabel;
    panHorarios: TLMDSimplePanel;
    panDiasHoras: TLMDSimplePanel;
    LMDSimplePanel7: TLMDSimplePanel;
    hora723: TLMDSpeedButton;
    hora722: TLMDSpeedButton;
    hora721: TLMDSpeedButton;
    hora720: TLMDSpeedButton;
    hora719: TLMDSpeedButton;
    hora718: TLMDSpeedButton;
    hora717: TLMDSpeedButton;
    hora716: TLMDSpeedButton;
    hora715: TLMDSpeedButton;
    hora714: TLMDSpeedButton;
    hora70: TLMDSpeedButton;
    hora71: TLMDSpeedButton;
    hora72: TLMDSpeedButton;
    hora73: TLMDSpeedButton;
    hora74: TLMDSpeedButton;
    hora75: TLMDSpeedButton;
    hora76: TLMDSpeedButton;
    hora77: TLMDSpeedButton;
    hora78: TLMDSpeedButton;
    hora79: TLMDSpeedButton;
    hora710: TLMDSpeedButton;
    hora711: TLMDSpeedButton;
    hora712: TLMDSpeedButton;
    hora713: TLMDSpeedButton;
    LMDLabel5: TLMDLabel;
    LMDSimplePanel3: TLMDSimplePanel;
    hora623: TLMDSpeedButton;
    hora622: TLMDSpeedButton;
    hora621: TLMDSpeedButton;
    hora620: TLMDSpeedButton;
    hora619: TLMDSpeedButton;
    hora618: TLMDSpeedButton;
    hora617: TLMDSpeedButton;
    hora616: TLMDSpeedButton;
    hora615: TLMDSpeedButton;
    hora614: TLMDSpeedButton;
    hora60: TLMDSpeedButton;
    hora61: TLMDSpeedButton;
    hora62: TLMDSpeedButton;
    hora63: TLMDSpeedButton;
    hora64: TLMDSpeedButton;
    hora65: TLMDSpeedButton;
    hora66: TLMDSpeedButton;
    hora67: TLMDSpeedButton;
    hora68: TLMDSpeedButton;
    hora69: TLMDSpeedButton;
    hora610: TLMDSpeedButton;
    hora611: TLMDSpeedButton;
    hora612: TLMDSpeedButton;
    hora613: TLMDSpeedButton;
    LMDLabel1: TLMDLabel;
    LMDSimplePanel4: TLMDSimplePanel;
    hora523: TLMDSpeedButton;
    hora522: TLMDSpeedButton;
    hora521: TLMDSpeedButton;
    hora520: TLMDSpeedButton;
    hora519: TLMDSpeedButton;
    hora518: TLMDSpeedButton;
    hora517: TLMDSpeedButton;
    hora516: TLMDSpeedButton;
    hora515: TLMDSpeedButton;
    hora514: TLMDSpeedButton;
    hora50: TLMDSpeedButton;
    hora51: TLMDSpeedButton;
    hora52: TLMDSpeedButton;
    hora53: TLMDSpeedButton;
    hora54: TLMDSpeedButton;
    hora55: TLMDSpeedButton;
    hora56: TLMDSpeedButton;
    hora57: TLMDSpeedButton;
    hora58: TLMDSpeedButton;
    hora59: TLMDSpeedButton;
    hora510: TLMDSpeedButton;
    hora511: TLMDSpeedButton;
    hora512: TLMDSpeedButton;
    hora513: TLMDSpeedButton;
    LMDLabel2: TLMDLabel;
    LMDSimplePanel5: TLMDSimplePanel;
    hora423: TLMDSpeedButton;
    hora422: TLMDSpeedButton;
    hora421: TLMDSpeedButton;
    hora420: TLMDSpeedButton;
    hora419: TLMDSpeedButton;
    hora418: TLMDSpeedButton;
    hora417: TLMDSpeedButton;
    hora416: TLMDSpeedButton;
    hora415: TLMDSpeedButton;
    hora414: TLMDSpeedButton;
    hora40: TLMDSpeedButton;
    hora41: TLMDSpeedButton;
    hora42: TLMDSpeedButton;
    hora43: TLMDSpeedButton;
    hora44: TLMDSpeedButton;
    hora45: TLMDSpeedButton;
    hora46: TLMDSpeedButton;
    hora47: TLMDSpeedButton;
    hora48: TLMDSpeedButton;
    hora49: TLMDSpeedButton;
    hora410: TLMDSpeedButton;
    hora411: TLMDSpeedButton;
    hora412: TLMDSpeedButton;
    hora413: TLMDSpeedButton;
    LMDLabel3: TLMDLabel;
    LMDSimplePanel6: TLMDSimplePanel;
    hora323: TLMDSpeedButton;
    hora322: TLMDSpeedButton;
    hora321: TLMDSpeedButton;
    hora320: TLMDSpeedButton;
    hora319: TLMDSpeedButton;
    hora318: TLMDSpeedButton;
    hora317: TLMDSpeedButton;
    hora316: TLMDSpeedButton;
    hora315: TLMDSpeedButton;
    hora314: TLMDSpeedButton;
    hora30: TLMDSpeedButton;
    hora31: TLMDSpeedButton;
    hora32: TLMDSpeedButton;
    hora33: TLMDSpeedButton;
    hora34: TLMDSpeedButton;
    hora35: TLMDSpeedButton;
    hora36: TLMDSpeedButton;
    hora37: TLMDSpeedButton;
    hora38: TLMDSpeedButton;
    hora39: TLMDSpeedButton;
    hora310: TLMDSpeedButton;
    hora311: TLMDSpeedButton;
    hora312: TLMDSpeedButton;
    hora313: TLMDSpeedButton;
    LMDLabel4: TLMDLabel;
    LMDSimplePanel8: TLMDSimplePanel;
    hora223: TLMDSpeedButton;
    hora222: TLMDSpeedButton;
    hora221: TLMDSpeedButton;
    hora220: TLMDSpeedButton;
    hora219: TLMDSpeedButton;
    hora218: TLMDSpeedButton;
    hora217: TLMDSpeedButton;
    hora216: TLMDSpeedButton;
    hora215: TLMDSpeedButton;
    hora214: TLMDSpeedButton;
    hora20: TLMDSpeedButton;
    hora21: TLMDSpeedButton;
    hora22: TLMDSpeedButton;
    hora23: TLMDSpeedButton;
    hora24: TLMDSpeedButton;
    hora25: TLMDSpeedButton;
    hora26: TLMDSpeedButton;
    hora27: TLMDSpeedButton;
    hora28: TLMDSpeedButton;
    hora29: TLMDSpeedButton;
    hora210: TLMDSpeedButton;
    hora211: TLMDSpeedButton;
    hora212: TLMDSpeedButton;
    hora213: TLMDSpeedButton;
    LMDLabel6: TLMDLabel;
    LMDSimplePanel9: TLMDSimplePanel;
    hora123: TLMDSpeedButton;
    hora122: TLMDSpeedButton;
    hora121: TLMDSpeedButton;
    hora120: TLMDSpeedButton;
    hora119: TLMDSpeedButton;
    hora118: TLMDSpeedButton;
    hora117: TLMDSpeedButton;
    hora116: TLMDSpeedButton;
    hora115: TLMDSpeedButton;
    hora114: TLMDSpeedButton;
    hora10: TLMDSpeedButton;
    hora11: TLMDSpeedButton;
    hora12: TLMDSpeedButton;
    hora13: TLMDSpeedButton;
    hora14: TLMDSpeedButton;
    hora15: TLMDSpeedButton;
    hora16: TLMDSpeedButton;
    hora17: TLMDSpeedButton;
    hora18: TLMDSpeedButton;
    hora19: TLMDSpeedButton;
    hora110: TLMDSpeedButton;
    hora111: TLMDSpeedButton;
    hora112: TLMDSpeedButton;
    hora113: TLMDSpeedButton;
    LMDLabel7: TLMDLabel;
    LMDSimplePanel13: TLMDSimplePanel;
    LMDSimplePanel10: TLMDSimplePanel;
    edIsento: TcxDBCheckBox;
    edInativo: TcxDBCheckBox;
    edNaoGuardarCredito: TcxDBCheckBox;
    edTarifaEspecial: TcxDBImageComboBox;
    lbTarifaEspecial: TcxLabel;
    lbLoginSemCred: TcxLabel;
    edLoginSemCred: TcxDBImageComboBox;
    MTIdade: TIntegerField;
    MTCotaImpEspecial: TBooleanField;
    MTCotaImpDia: TIntegerField;
    MTCotaImpMes: TIntegerField;
    edCotaImpEspecial: TcxDBCheckBox;
    edCotaImpDia: TcxDBSpinEdit;
    lbCotaDiaria: TcxLabel;
    lbCotaDiaria2: TcxLabel;
    lbCotaMensal2: TcxLabel;
    edCotaImpMes: TcxDBSpinEdit;
    lbCotaMensal: TcxLabel;
    lbUsername: TcxLabel;
    lclbUsername: TdxLayoutItem;
    edSemFidelidade: TcxDBCheckBox;
    MTSemFidelidade: TBooleanField;
    MTCHorario: TIntegerField;
    edCHora: TcxDBPopupEdit;
    MTNomeCHorario: TStringField;
    cxLabel3: TcxLabel;
    rgopchSemCensura: TcxRadioButton;
    rgopchCHorario: TcxRadioButton;
    rgopchCensuraEsp: TcxRadioButton;
    btnNenhum: TLMDSpeedButton;
    btnTodos: TLMDSpeedButton;
    MTOpCHorario: TWordField;
    OpenDlg: TOpenDialog;
    lcFichaGroup18: TdxLayoutGroup;
    lcFichaGroup2: TdxLayoutGroup;
    lcFichaGroup3: TdxLayoutGroup;
    lbIdade: TcxLabel;
    lcFichaItem1: TdxLayoutItem;
    LMDSimplePanel11: TLMDSimplePanel;
    cxLabel2: TcxLabel;
    rbLimiteDeb_padrao: TcxRadioButton;
    rbLimiteDeb_Zero: TcxRadioButton;
    rbLimiteDeb_Valor: TcxRadioButton;
    edLimiteDeb: TcxDBCurrencyEdit;
    btnAlterarLimiteDeb: TcxButton;
    procedure DSStateChange(Sender: TObject);
    procedure InspNomeIsentoPropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MTAfterInsert(DataSet: TDataSet);
    procedure MTAfterEdit(DataSet: TDataSet);
    procedure hora10MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure hora10Click(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure btnNenhumClick(Sender: TObject);
    procedure InspNomeTAPropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
    procedure FMgrPageControlChange(Sender: TObject);
    procedure FMgrGetTabSheet(Sender: TObject; aClass: TFrmBaseClass;
      var aTabSheet: TcxTabSheet);
    procedure NBLinkClick(Sender: TObject; ALink: TdxNavBarItemLink);
    procedure DSDataChange(Sender: TObject; Field: TField);
    procedure edFotoPropertiesEditValueChanged(Sender: TObject);
    procedure lbSemFotoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edFotoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MTCalcFields(DataSet: TDataSet);
    procedure edCotaImpEspecialClick(Sender: TObject);
    procedure lbUsernameEnter(Sender: TObject);
    procedure lbUsernameExit(Sender: TObject);
    procedure edUsernamePropertiesEditValueChanged(Sender: TObject);
    procedure edUsernamePropertiesChange(Sender: TObject);
    procedure edUsernameExit(Sender: TObject);
    procedure edUsernameEnter(Sender: TObject);
    procedure rgopchSemCensuraClick(Sender: TObject);
    procedure rgopchCHorarioClick(Sender: TObject);
    procedure rgopchCensuraEspClick(Sender: TObject);
    procedure edCHoraPropertiesInitPopup(Sender: TObject);
    procedure edCHoraPropertiesCloseUp(Sender: TObject);
    procedure rbLimiteDeb_ValorClick(Sender: TObject);
    procedure rbLimiteDeb_ZeroClick(Sender: TObject);
    procedure rbLimiteDeb_padraoClick(Sender: TObject);
    procedure btnAlterarLimiteDebClick(Sender: TObject);

    { Private declarations }
  private
    FPai: TWinControl;

    procedure RefreshBtn;
    procedure AjustaVisCotas;
    procedure AlertaUsername(aNew: String);
    procedure AjustaVisCensuraHorario;

    //procedure OnBringToFrontTimer(Sender: TObject);

    procedure wmAtualizaStrings(var Msg: TMessage); message wm_user;

  public
    FNovo : Boolean;
    Resultado: Integer;
    FRgAnt : String;
    FUsername : String;
    FTab : TDataset;
    FCHorario : Cardinal;
    function Novo(aTab: TDataset; aPai: TWinControl): Integer;
    procedure Editar(aTab: TDataset; aPai: TWinControl);

    { Public declarations }
  end;

  TThreadStrings = class ( TThread )
  private
    FWnd : HWND;
  protected
    procedure Execute; override;
  public
    constructor Create(aWnd: HWND);  
  end;

var
  FrmCadCli: TFrmCadCli;
  
  slCamposCli,
  slCidades,
  slBairros,
  slEscolas : TStrings;

implementation

uses 
  ncaDM,
  ncErros,
  ncaFrmPri,
  ncClassesBase,
  ncIDRecursos,
  ncListaID,
  ufmImagens, 
  ncafbPass, 
  ncafbTran, ncSessao, ncafgExtratoFid, ncafbPesqCH, ncaFrmWebCam,
  ncaFrmLimiteDebPadrao;

// START resource string wizard section
resourcestring
  SHora = 'hora';
  SDataDeNascimentoNãoéVálida = 'Data de nascimento não é válida';
  SNomeNãoPodeSerDeixadoEmBranco = 'Nome não pode ser deixado em branco !';
  SJáExisteUmClienteCadastradoComEs = 'Já existe um cliente cadastrado com esse RG';
  SJáExisteOutroClienteCadastradoCo = 'Já existe outro cliente cadastrado com esse mesmo Username!';
  SÉNecessárioEscolherUmaFaixaDeHor = 'É necessário escolher uma faixa de horário para a censura de horário';
  SUsernameIndisponível = 'Username indisponível.';
  SUsernameDisponível = 'Username disponível!';
  SSeguirLimitePadrão = 'Seguir limite padrão (';
  SSeguirOpçãoPadrão = 'Seguir opção padrão ';
  SLivre = 'Livre';
  S1Ano = '1 ano';
  SAnos = ' anos';

// END resource string wizard section


{$R *.DFM}

procedure TFrmCadCli.Editar(aTab: TDataset; aPai: TWinControl);
begin
  if aTab=nil then aTab := Dados.tbCli;
  try
    FUsername := aTab.FieldByName('Username').AsString; // do not localize
    FNovo := False;
    FTab := ATab;
    MT.Insert;
    TransfDados(FTab, MT);
    if (MTSexo.Value<>'M') and (MTSexo.Value<>'F') then
      MTSexo.Value := 'M';
    if MTInativo.IsNull then
      MTInativo.Value := False;
      
    if MTIsento.IsNull then
      MTIsento.Value := False;

    cmGravar.Enabled := Permitido(daCliCadastrar);
    
    if aPai=nil then
      ShowModal
    else begin
      FPai := aPai;
      panPri.Parent := FPai;
    end;  
  finally
    if FPai=nil then Free;
  end;  
end;

procedure TFrmCadCli.edUsernameEnter(Sender: TObject);
begin
  AlertaUsername(edUsername.Text);
end;

procedure TFrmCadCli.edUsernameExit(Sender: TObject);
begin
  lclbUsername.Visible := False;
end;

procedure TFrmCadCli.edUsernamePropertiesChange(Sender: TObject);
begin
  edUsername.PostEditValue;
end;

procedure TFrmCadCli.edUsernamePropertiesEditValueChanged(Sender: TObject);
begin
  AlertaUsername(edUsername.Text);
end;

procedure TFrmCadCli.cmGravarClick(Sender: TObject);
var S: TncSessao;

procedure SalvaDia(Dia: Integer; Campo : TIntegerField);
var 
  H, Valor : Integer;
  SB : TLmdSpeedButton;
begin
  Valor := Campo.Value;
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent(SHora+IntToStr(Dia)+IntToStr(H)));
    Valor := SetBit(Valor, BitsH[H], (SB.Color=clGreen));
  end;
  Campo.Value := Valor;
end;

begin
  Paginas.ActivePageIndex := 0;
  edTelefone.SetFocus;
  edNome.SetFocus;
  edNasc.PostEditValue;
  if (not MTDataNasc.IsNull) and (mtIdade.Value<>0) then
  if (MTIdade.Value<1) or (MTIdade.Value>110) then begin
    ShowMsg(SDataDeNascimentoNãoéVálida, True);
    edNasc.SetFocus;
    Exit;
  end;
    
  if MTNome.Value = '' then
    Raise ENexCafe.Create(SNomeNãoPodeSerDeixadoEmBranco);
      
  if (FRgAnt<>MTRg.Value) and (MTRg.AsString>'') and tAux.FindKey([MTRG.Value]) then
    Raise ENexCafe.Create(SJáExisteUmClienteCadastradoComEs);
    
  if not (MT.State in [dsInsert, dsEdit]) then MT.Edit;

  {$ifdef Lan}  
  if (FUsername <> MTUsername.Value) and
     (MTUsername.Value <> '') and
     tAux.Locate('Username', MTUsername.Value, [loCaseInsensitive]) then // do not localize
  begin
    Beep;
    ShowMessage(SJáExisteOutroClienteCadastradoCo);
    Exit;
  end;   

  if rgopchSemCensura.Checked then 
    MTOpCHorario.Value := opchSemCensura
  else
  if rgopchCHorario.Checked then begin
    if MTCHorario.Value=0 then
      Raise Exception.Create(SÉNecessárioEscolherUmaFaixaDeHor);
    MTOpCHorario.Value := opchCHorario;
  end else
  if rgopchCensuraEsp.Checked then
    MTOpCHorario.Value := opchCensuraEsp;
  {$endif}

  if FNovo then begin
    FTab.Insert;
    FTab.FieldByName('IncluidoEm').AsDateTime := Now; // do not localize
    FTab.FieldByName('IncluidoPor').AsString := Dados.CM.Username; // do not localize
  end else begin
    FTab.Edit; 
    FTab.FieldByName('AlteradoEm').AsDateTime := Now; // do not localize
    FTab.FieldByName('AlteradoPor').AsString := Dados.CM.Username; // do not localize
  end;

  SalvaDia(1, MTHP1);
  SalvaDia(2, MTHP2);
  SalvaDia(3, MTHP3);
  SalvaDia(4, MTHP4);
  SalvaDia(5, MTHP5);
  SalvaDia(6, MTHP6);
  SalvaDia(7, MTHP7);
  
  TransfDadosEsp(MT, FTab, '|ID|Minutos|IncluidoEm|IncluidoPor|AlteradoEm|AlteradoPor|'); // do not localize
  FTab.FieldByName('Fornecedor').AsBoolean := False; // do not localize

  FTab.Post;
  Resultado := FTab.FieldByName('ID').AsInteger; // do not localize
  if FPai=nil then 
    Close;

  S := Dados.CM.Sessoes.PorCliente[Resultado];
  if S<>nil then Dados.CM.ForceRefreshSessao(S.ID);
end;

procedure TFrmCadCli.rbLimiteDeb_padraoClick(Sender: TObject);
begin
  edLimiteDeb.Clear;
  MTLimiteDebito.Clear;
  edLimiteDeb.Enabled := False;
end;

procedure TFrmCadCli.rbLimiteDeb_ValorClick(Sender: TObject);
begin
  edLimiteDeb.Enabled := True;
  if Paginas.ActivePage = tsDebitos then
    edLimiteDeb.SetFocus;
end;

procedure TFrmCadCli.rbLimiteDeb_ZeroClick(Sender: TObject);
begin
  edLimiteDeb.Value := 0;
  MTLimiteDebito.Value := 0;
  edLimiteDeb.Enabled := False;
end;

procedure TFrmCadCli.lbSemFotoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var 
  //B : TBitmap;
  //J : TJpegImage;
  S : String;
begin
  S := TFrmWebCam.Create(Self).ObtemFoto('');
  
  if (S<>'') and (S<>'clear') then  // TODO : check string
  begin
{    S := OpenDlg.FileName;
    if SameText(ExtractFileExt(OpenDlg.FileName), '.bmp') then begin
      B := TBitmap.Create;
      J := TJpegImage.Create;
      try
        B.LoadFromFile(OpenDlg.FileName);
        J.Assign(B);
        S := ChangeFileExt(S, '.jpg');
        J.SaveToFile(S);
      finally
        J.Free;
        B.Free;
      end;
    end;     }
    MTFoto.LoadFromFile(S);
    edFoto.EditValue := MTFoto.AsVariant;
    edFoto.PostEditValue;
  end else begin
    MTFoto.Clear;
    edFoto.Clear;
    edFoto.PostEditValue;
  end;
end;

procedure TFrmCadCli.lbUsernameEnter(Sender: TObject);
begin
  AlertaUsername(edUsername.Text);
end;

procedure TFrmCadCli.lbUsernameExit(Sender: TObject);
begin
  lclbUsername.Visible := False;
end;

procedure AjustaFontRB(RB: TcxRadioButton);
begin
  if RB.Checked then
    RB.Font.Style := [fsBold] else
    RB.Font.Style := [];
end;

procedure TFrmCadCli.wmAtualizaStrings(var Msg: TMessage); 
begin
  edBairro.Properties.Items.Text := slBairros.Text;
  edCidade.Properties.Items.Text := slCidades.Text;
  edEscola.Properties.Items.Text := slEscolas.Text;
end;

procedure TFrmCadCli.AjustaVisCensuraHorario;
begin
  edCHora.Enabled := rgopchCHorario.Checked;
  lbCH1.Visible := rgopchCensuraEsp.Checked;
  lbCH2.Visible := rgopchCensuraEsp.Checked;
  lbCH3.Visible := rgopchCensuraEsp.Checked;
  lbCH4.Visible := rgopchCensuraEsp.Checked;
  panHorarios.Visible := rgopchCensuraEsp.Checked;
  AjustaFontRB(rgopchCHorario);
  AjustaFontRB(rgopchCensuraEsp);
  AjustaFontRB(rgopchSemCensura);
end;

procedure TFrmCadCli.AjustaVisCotas;
begin
  edCotaImpEspecial.Visible := gConfig.PMCotas and gConfig.PMCotasPorCli;
  edCotaImpEspecial.Properties.ReadOnly := not Permitido(daAlterarCotasCli);
  edCotaImpDia.Properties.ReadOnly := not Permitido(daALterarCotasCli);
  edCotaImpMes.Properties.ReadOnly := not Permitido(daAlterarCotasCli);
  
  lbCotaDiaria.Visible := edCotaImpEspecial.Visible and edCotaImpEspecial.Checked;
  lbCotaDiaria2.Visible := edCotaImpEspecial.Visible and edCotaImpEspecial.Checked;
  lbCotaMensal.Visible := edCotaImpEspecial.Visible and edCotaImpEspecial.Checked;
  lbCotaMensal2.Visible := edCotaImpEspecial.Visible and edCotaImpEspecial.Checked;
  edCotaImpDia.Visible := edCotaImpEspecial.Visible and edCotaImpEspecial.Checked;
  edCotaImpMes.Visible := edCotaImpEspecial.Visible and edCotaImpEspecial.Checked;
end;

procedure TFrmCadCli.AlertaUsername(aNew: String);
begin
  if (not edUsername.Focused) or (aNew=FUsername) then begin
    lclbUsername.Visible := False;
    Exit;
  end else
    lclbUsername.Visible := True;

  if tAux.Locate('Username', aNew, [loCaseInsensitive]) then begin // do not localize
    lbUsername.Style.TextColor := clRed;
    lbUsername.Caption := SUsernameIndisponível;
  end else begin
    lbUsername.Style.TextColor := clGreen;
    lbUsername.Caption := SUsernameDisponível;
  end;
end;

procedure TFrmCadCli.btnAlterarLimiteDebClick(Sender: TObject);
begin
  TFrmLimiteDeb.Create(Self).ShowModal;
  rbLimiteDeb_Padrao.Caption := SSeguirLimitePadrão+Trim(FloatToStrF(gConfig.LimitePadraoDebito, ffCurrency, 10, 2))+')';
end;

procedure TFrmCadCli.btnNenhumClick(Sender: TObject);
var
  Dia, H : Integer;
  SB : TLmdSpeedButton;
begin
  for Dia := 1 to 7 do
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent(SHora+IntToStr(Dia)+IntToStr(H)));
    SB.Color := clRed;
    SB.Font.Color := clWhite;
  end;
end;

procedure TFrmCadCli.btnTodosClick(Sender: TObject);
var
  Dia, H : Integer;
  SB : TLmdSpeedButton;
begin
  for Dia := 1 to 7 do
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent(SHora+IntToStr(Dia)+IntToStr(H)));
    SB.Color := clGreen;
    SB.Font.Color := clWhite;
  end;
end;

procedure TFrmCadCli.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadCli.FMgrGetTabSheet(Sender: TObject; aClass: TFrmBaseClass;
  var aTabSheet: TcxTabSheet);
begin
  if aClass = TfbTran then
    aTabSheet := tsTran
  else
  if aClass = TfbPassaportes then
    aTabSheet := tsPass
  else
  if aClass = TfbExtratoFid then
    aTabSheet := tsExtratoFid; 
end;

procedure TFrmCadCli.FMgrPageControlChange(Sender: TObject);
begin
  if Paginas.ActivePage=tsPass then begin
    if FMgr.FormByClass(TfbPassaportes)=nil then begin
      FMgr.RegistraForm(TfbPassaportes);
      LockWindowUpdate(Handle);
      try
        FMgr.Mostrar(TfbPassaportes, fpass_Cliente, MTID.Value);
      finally
        LockWindowUpdate(0);
      end;
    end;
  end else
  if Paginas.ActivePage=tsTran then begin
    if FMgr.FormByClass(TfbTran)=nil then begin
      FMgr.RegistraForm(TfbTran);
      LockWindowUpdate(Handle);
      try
        FMgr.Mostrar(TfbTran, ftran_Cliente, MTID.Value);
        TfbTran(FMgr.FormAtivo).panTran.AlignWithMargins := False;
      finally
        LockWindowUpdate(0);
      end;
    end;
  end else
  if Paginas.ActivePage=tsExtratoFid then begin
    if FMgr.FormByClass(TfbExtratoFid)=nil then begin
      FMgr.RegistraForm(TfbExtratoFid);
      LockWindowUpdate(Handle);
      try
        FMgr.Mostrar(TfbExtratoFid, ftran_Cliente, MTID.Value);
      finally
        LockWindowUpdate(0);
      end;
    end;
  end;
end;

procedure TFrmCadCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FMgr.Clear;
  Action := caFree;
end;

procedure TFrmCadCli.FormCreate(Sender: TObject);
var 
  II : TcxImageComboBoxItem;
const
  SNStr : Array[Boolean] of String[5] = ('(não)', '(sim)');

function GetCharCase(aField: String): TEditCharCase;
var P: Integer;
begin
  P := StrToIntDef(gConfig.slCamposCliCC.Values[aField], 0);
  case P of
    1 : Result := ecUpperCase;
    2 : Result := ecLowerCase;
  else
    Result := ecNormal;
  end;
end;  

begin
  Paginas.Properties.HideTabs := true;
  lbIdade.caption := '';

  btnAlterarLimiteDeb.Enabled := Dados.CM.UA.Admin;

  {$ifdef LOJA}
  lcUsername.Visible := False;
  lcSenha.Visible := False;
  lcApelido.Visible := False;
  lcEscola.Visible := False;
  nbiCensura.Visible := False;
  nbiOpcoes.Visible := False;
  nbiCred.Visible := False;
  {$endif}

  rbLimiteDeb_Padrao.Caption := SSeguirLimitePadrão+Trim(FloatToStrF(gConfig.LimitePadraoDebito, ffCurrency, 10, 2))+')';

  edNome.Properties.CharCase := GetCharCase('Nome'); // do not localize
  edUsername.Properties.CharCase := GetCharCase('Username'); // do not localize
  edApelido.Properties.CharCase := GetCharCase('Nickname'); // do not localize
  edSenha.Properties.CharCase := GetCharCase('Senha'); // do not localize
  edTelefone.Properties.CharCase := GetCharCase('Telefone'); // do not localize
  edCelular.Properties.CharCase := GetCharCase('Celular'); // do not localize
  edRG.Properties.CharCase := GetCharCase('Rg'); // do not localize
  edCPF.Properties.CharCase := GetCharCase('CPF'); // do not localize
  edTitEleitor.Properties.CharCase := GetCharCase('TitEleitor'); // do not localize
  edEndereco.Properties.CharCase := GetCharCase('Endereco'); // do not localize
  edBairro.Properties.CharCase := GetCharCase('Bairro'); // do not localize
  edCidade.Properties.CharCase := GetCharCase('Cidade'); // do not localize
  edPai.Properties.CharCase := GetCharCase('Pai'); // do not localize
  edMae.Properties.CharCase := GetCharCase('Mae'); // do not localize
  edEscola.Properties.CharCase := GetCharCase('Escola'); // do not localize
  edObs.Properties.CharCase := GetCharCase('Obs'); // do not localize
  edEmail.Properties.CharCase := GetCharCase('Email'); // do not localize
  
  TThreadStrings.Create(Handle);

  pagFoto.ActivePageIndex := 0;
  with edLoginSemCred.Properties do begin
    Items[0].Description := SSeguirOpçãoPadrão + SNStr[gConfig.PermiteLoginSemCred];
    if not gConfig.AlteraLoginSemCred then begin
      Items[1].Description := Items[0].Description;
      Items[2].Description := Items[0].Description;
      ReadOnly := True;
      edLoginSemCred.Enabled := False;
    end;
  end;

  edSenha.Properties.ReadOnly := not Dados.CM.Config.AlterarSenhaCli;
  
  edIsento.Properties.ReadOnly := not Permitido(daCliMarcarIsento);
  edInativo.Properties.ReadOnly := not Permitido(daInativarContas);
  edLimiteDeb.Properties.ReadOnly := not Permitido(daAlterarLimiteDebito);

  FPai := nil;
  Paginas.ActivePageIndex := 0;
  with Dados, edTarifaEspecial.Properties do begin
    Items.Clear;
    II := TcxImageComboBoxItem(Items.Add);
    II.Value := -1;
    II.Description := SLivre;

    if tbTipoAcesso.RecordCount<2 then begin
      lbTarifaEspecial.Enabled := False;
      edTarifaEspecial.Enabled := False;
    end;

    tbTipoAcesso.First;
    while not tbTipoAcesso.Eof do begin
      II := TcxImageComboBoxItem(Items.Add);
      II.Description := tbTipoAcessoNome.Value;
      II.Value := tbTipoAcessoID.Value;
      tbTipoAcesso.Next;
    end;
  end;

  FrmCadCli := Self;
  MT.Open;
  tAux.Open;
  Paginas.ActivePageIndex:= 0;
  
  with edSenha.Properties do 
  if Dados.CM.Config.VerSenhaCli then
    EchoMode := eemNormal else
    EchoMode := eemPassword;
end;

procedure TFrmCadCli.FormShow(Sender: TObject);

procedure LeDia(Dia: Integer; Valor: Integer);
var 
  H : Integer;
  SB : TLmdSpeedButton;
begin
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent(SHora+IntToStr(Dia)+IntToStr(H)));
    if BitIsSet(Valor, BitsH[H]) then
      SB.Color := clGreen else
      SB.Color := clRed;
    SB.Font.Color := clWhite;  
  end;
end;

begin
  if MTLimiteDebito.IsNull then
    rbLimiteDeb_padrao.Checked := True
  else
  if MTLimiteDebito.Value<0.01 then
    rbLimiteDeb_zero.Checked := True
  else begin
    rbLimiteDeb_Valor.Checked := True;
    edLimiteDeb.Enabled := True;
  end;
  edNaoGuardarCredito.Properties.ReadOnly := not Permitido(daAlterarNaoGuardarCred);
  edSemFidelidade.Properties.ReadOnly := not Permitido(daAlterarNaoGuardarCred);
  edLoginSemCred.Properties.ReadOnly := not Permitido(daAlterarLoginSemCred);
  edCotaImpEspecial.Properties.ReadOnly := not Permitido(daAlterarCotasCli);

  if MTIsento.Value then
    tsCensura.Enabled := Permitido(daAlterarCensuraHGratis) else
    tsCensura.Enabled := Permitido(daAlterarCensuraH);
    
  AjustaVisCotas;

  rgopchSemCensura.Checked := not (MTOpCHorario.Value in [opchCensuraEsp, opchCHorario]);
  rgopchCensuraEsp.Checked := (MTOpCHorario.Value=opchCensuraEsp);
  rgopchCHorario.Checked := (MTOpCHorario.Value=opchCHorario);
  
  AjustaVisCensuraHorario;
  
  FRGAnt := MTRG.Value;
  Paginas.ActivePage := tsDados;
  edNome.SetFocus;
  LeDia(1, MTHP1.Value);
  LeDia(2, MTHP2.Value);
  LeDia(3, MTHP3.Value);
  LeDia(4, MTHP4.Value);
  LeDia(5, MTHP5.Value);
  LeDia(6, MTHP6.Value);
  LeDia(7, MTHP7.Value);

  pagFoto.ActivePageIndex := 1;

  if mtFoto.IsNull then 
    pagFoto.ActivePageIndex := 0 else
    pagFoto.ActivePageIndex := 1;

  if (Screen.Width=640) then
    PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
end;

procedure TFrmCadCli.hora10Click(Sender: TObject);
begin
  with TLMDSpeedButton(Sender) do
  if Color=clGreen then
    Color := clRed
  else
    Color := clGreen;
end;

procedure TFrmCadCli.hora10MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ssCtrl in Shift then 
    TLMDSpeedButton(Sender).Color := clGreen
  else
  if ssAlt in Shift then
    TLMDSpeedButton(Sender).Color := clRed;
end;

procedure TFrmCadCli.InspNomeIsentoPropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := not Permitido(daCliMarcarIsento);
end;

procedure TFrmCadCli.InspNomeTAPropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := not Permitido(daAlterarTipoAcesso);
end;

procedure TFrmCadCli.NBLinkClick(Sender: TObject; ALink: TdxNavBarItemLink);
begin
  Paginas.ActivePageIndex := ALink.Index;
end;

function TFrmCadCli.Novo(aTab: TDataset; aPai: TwinControl): Integer;
begin
  Result := -1; 
  if aTab=nil then aTab := Dados.tbCli;
  nbiCred.Enabled := False;
  nbiFid.Enabled := False;
  nbiTran.Enabled := False;
  FTab := aTab;
  FNovo := True;
  FUsername := '';
  MT.Insert;
  MTUF.Value := Dados.tbConfigUFPadrao.AsString;
  MTCidade.Value := Dados.tbConfigCidadePadrao.AsString;
  MTIsento.Value := False;
  MTInativo.Value := False;
  MTNaoGuardarCredito.Value := gConfig.NaoGuardarCreditoCli;
  MTSexo.Value := 'M';
  MTHP1.Value := $FFFFFF;
  MTHP2.Value := $FFFFFF;
  MTHP3.Value := $FFFFFF;
  MTHP4.Value := $FFFFFF;
  MTHP5.Value := $FFFFFF;
  MTHP6.Value := $FFFFFF;
  MTHP7.Value := $FFFFFF;
  Resultado := -1;
  RefreshBtn;
  if aPai = nil  then
  begin
    try
      ShowModal;
    finally
      Result := Resultado;
      Free;
    end;
  end else begin
    FPai := aPai;
    panPri.Parent := FPai;
  end;
end;


function ForceForegroundWindow(hwnd: THandle): boolean;
const
  SPI_GETFOREGROUNDLOCKTIMEOUT = $2000;
  SPI_SETFOREGROUNDLOCKTIMEOUT = $2001;
var
  ForegroundThreadID: DWORD;
  ThisThreadID : DWORD;
  timeout : DWORD;
begin
  if IsIconic(hwnd) then ShowWindow(hwnd, SW_RESTORE);
  if GetForegroundWindow = hwnd then 
    Result := true
  else begin

  // Windows 98/2000 doesn't want to foreground a window when some other
  // window has keyboard focus
  
    if ((Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion > 4)) or
        ((Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and
        ((Win32MajorVersion > 4) or ((Win32MajorVersion = 4) and
        (Win32MinorVersion > 0)))) then
    begin
  
  // Code from Karl E. Peterson, www.mvps.org/vb/sample.htm
  // Converted to Delphi by Ray Lischner
  // Published in The Delphi Magazine 55, page 16
  
      Result := false;
      ForegroundThreadID := GetWindowThreadProcessID(GetForegroundWindow,nil);
      ThisThreadID := GetWindowThreadPRocessId(hwnd,nil);
      if AttachThreadInput(ThisThreadID, ForegroundThreadID, true) then
      begin
        BringWindowToTop(hwnd); // IE 5.5 related hack
        SetForegroundWindow(hwnd);
        AttachThreadInput(ThisThreadID, ForegroundThreadID, false);
        Result := (GetForegroundWindow = hwnd);
      end;
      if not Result then begin
  // Code by Daniel P. Stasinski
        SystemParametersInfo(SPI_GETFOREGROUNDLOCKTIMEOUT, 0, @timeout, 0);
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(0),  SPIF_SENDCHANGE);
        BringWindowToTop(hwnd); // IE 5.5 related hack
        SetForegroundWindow(hWnd);
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0,
        TObject(timeout), SPIF_SENDCHANGE);
      end;
    end
    else begin
      BringWindowToTop(hwnd); // IE 5.5 related hack
      SetForegroundWindow(hwnd);
    end;
  
    Result := (GetForegroundWindow = hwnd);
  end;
end; { ForceForegroundWindow }

{procedure TFrmCadCli.OnBringToFrontTimer(Sender: TObject);
begin
  try
    ForceForegroundWindow(Handle);
  finally
    Sender.Free;
  end;
end;}

procedure TFrmCadCli.RefreshBtn;
begin
  cmGravar.Enabled := ((FPai=nil) or MT.Modified) and  Permitido(daCliCadastrar);
  cmCancelar.Enabled := cmGravar.Enabled;
end;

procedure TFrmCadCli.rgopchCensuraEspClick(Sender: TObject);
begin
  AjustaVisCensuraHorario;
end;

procedure TFrmCadCli.rgopchCHorarioClick(Sender: TObject);
begin
  AjustaVisCensuraHorario;
  if Paginas.ActivePage=tsCensura then begin 
    edCHora.SetFocus;
    edCHora.DroppedDown := True;
  end;
end;

procedure TFrmCadCli.rgopchSemCensuraClick(Sender: TObject);
begin
  AjustaVisCensuraHorario;
end;

procedure TFrmCadCli.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_F2    : cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmCadCli.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Paginas.ActivePageIndex=0 then
  if (Key = KEY_Enter) and (not edObs.Focused) and (not edEmail.Focused) then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TFrmCadCli.DSDataChange(Sender: TObject; Field: TField);
begin
  if MTFoto.IsNull then
    pagFoto.ActivePageIndex := 0 else
    pagFoto.ActivePageIndex := 1;
end;

procedure TFrmCadCli.DSStateChange(Sender: TObject);
begin
  RefreshBtn;
end;

procedure TFrmCadCli.MTAfterInsert(DataSet: TDataSet);
begin
  FRgAnt := '';
  MTTipoAcessoPref.Value := -1;
end;

procedure TFrmCadCli.MTCalcFields(DataSet: TDataSet);
var
  I, Y1, M1, D1, Y2, M2, D2 : Word;
begin
  if (not MTDataNasc.IsNull) and (MTDataNasc.Value<Date) then 
  begin
    DecodeDate(MTDataNasc.Value, Y1, M1, D1);
    DecodeDate(Date, Y2, M2, D2);

    I := Y2 - Y1;
    if (Y2>Y1) and ((M2<M1) or ((M2=M1) and (D2<D1))) then
      Dec(I);
                                
    MTIdade.Value := I;
    if I=1 then
      lbIdade.Caption := S1Ano
    else
    if I>1 then
      lbIdade.Caption := IntToStr(I) + SAnos
    else
      lbIdade.Caption := '';
    
  end;
end;

procedure TFrmCadCli.MTAfterEdit(DataSet: TDataSet);
begin
  FRgAnt := MTRG.Value;
end;

type THackMouse = class (TcxCustomImage);

procedure TFrmCadCli.edCHoraPropertiesCloseUp(Sender: TObject);
begin
  if MT.State<>dsEdit then MT.Edit;
  MTCHorario.Value := FCHorario;
  TcxCustomDropDownEdit(Sender).Text := MTNomeCHorario.Value;
end;

procedure TFrmCadCli.edCHoraPropertiesInitPopup(Sender: TObject);
begin
  FCHorario := MTCHorario.Value;
  TcxPopupEdit(Sender).Properties.PopupControl := fbPesqCH;
  fbPesqCH.PreparaBusca(FCHorario, TcxCustomDropDownEdit(Sender));
end;

procedure TFrmCadCli.edCotaImpEspecialClick(Sender: TObject);
begin
  AjustaVisCotas;
end;

procedure TFrmCadCli.edFotoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var 
    I : THackMouse;
    P : TPoint;
    Handled: Boolean;
begin
  if Button=mbLeft then begin
    P.X := X;
    P.Y := Y;
    I := THackMouse(edFoto);
    I.DoContextPopup(P, Handled);
  end;
end;

function IsPictureEmpty(APicture: TPicture): Boolean;
begin
  Result := not Assigned(APicture.Graphic) or APicture.Graphic.Empty;
end;

procedure TFrmCadCli.edFotoPropertiesEditValueChanged(Sender: TObject);
begin
  if IsPictureEmpty(edFoto.Picture) then
    pagFoto.ActivePageIndex := 0 else
    pagFoto.ActivePageIndex := 1;
end;

{ TThreadStrings }

constructor TThreadStrings.Create(aWnd: HWND);
begin
  FWnd := aWnd;
  inherited Create(False);
  FreeOnTerminate := True;
end;

procedure TThreadStrings.Execute;
var
  S: TnxSession;
  Q: TnxQuery;
  Str : String;
  
begin
  inherited;
  //S := nil;
  Q := nil;
  S := TnxSession.Create(nil);
  try
    S.ServerEngine := Dados.RSE;
    S.Username := 'admin'; // do not localize
    S.Password := 'delphi9856'; // do not localize
    S.Active := True;
    
    Q := TnxQuery.Create(nil);
    Q.Session := S;
    Q.AliasName := 'NexCafe'; // do not localize
    Q.SQL.Text := 'select distinct(Escola) as Escola from Cliente'; // do not localize
    Q.Active := True;

    slEscolas.Clear;
    Q.First;
    while not Q.Eof do begin
      Str := Trim(Q.FieldByName('Escola').AsString); // do not localize
      if Str>'' then slEscolas.Add(Str);
      Q.Next;
    end;
    
    Q.Active := False;
    Q.SQL.Text := 'select distinct(Bairro) as Bairro from Cliente'; // do not localize
    Q.Active := True;

    slBairros.Clear;
    Q.First;
    while not Q.Eof do begin
      Str := Trim(Q.FieldByName('Bairro').AsString); // do not localize
      if Str>'' then slBairros.Add(Str);
      Q.Next;
    end;

    Q.Active := False;
    Q.SQL.Text := 'select distinct(Cidade) as Cidade from Cliente'; // do not localize
    Q.Active := True;

    slCidades.Clear;
    Q.First;
    while not Q.Eof do begin
      Str := Trim(Q.FieldByName('Cidade').AsString); // do not localize
      if Str>'' then slCidades.Add(Str);
      Q.Next;
    end;
    PostMessage(FWnd, wm_user, 0, 0);
  except
  end;
  if Q<>nil then Q.Free;
  if S<>nil then S.Free;
end;

initialization
  slCamposCli := TStringList.Create;
  slCamposCli.Add('Nome=Nome'); // do not localize
  slCamposCli.Add('Username=Username'); // do not localize
  slCamposCli.Add('Nickname=Apelido'); // do not localize
  slCamposCli.Add('Senha=Senha'); // do not localize
  slCamposCli.Add('Telefone=Telefone'); // do not localize
  slCamposCli.Add('Celular=Celular'); // do not localize
  slCamposCli.Add('Rg=RG'); // do not localize
  slCamposCli.Add('Cpf=CPF'); // do not localize
  slCamposCli.Add('TitEleitor=Tit.Eleitor'); // do not localize
  slCamposCli.Add('Endereco=Endereço'); // do not localize
  slCamposCli.Add('Bairro=Bairro'); // do not localize
  slCamposCli.Add('Cidade=Cidade'); // do not localize
  slCamposCli.Add('UF=UF (Estado)'); // do not localize
  slCamposCli.Add('Pai=Pai'); // do not localize
  slCamposCli.Add('Mae=Mãe'); // do not localize
  slCamposCli.Add('Escola=Escola'); // do not localize
  slCamposCli.Add('Email=E-mail'); // do not localize
  slCamposCli.Add('Obs=Observações'); // do not localize
  
  slCidades := TStringList.Create;
  slBairros := TStringList.Create;
  slEscolas := TStringList.Create;

finalization
  slCamposCli.Free;
  slCidades.Free;
  slBairros.Free;
  slEscolas.Free;  

end.

