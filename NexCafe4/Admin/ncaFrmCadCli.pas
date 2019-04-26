unit ncaFrmCadCli;

interface

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
  cxContainer, cxCurrencyEdit, cxImage, Buttons, PngSpeedButton, cxLabel,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel, LMDControl,
  LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton, LMDSpeedButton,
  cxClasses, cxBarEditItem, 
  dxNavBarCollns, dxNavBarBase, dxNavBar,
  dxLayoutControl, dxLayoutLookAndFeels, LMDPNGImage, dxNavBarStyles,
  cxLookAndFeelPainters, ImgList, cxSpinEdit, PngImageList, LMDCustomImageList,
  LMDImageList;

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
    MTTemDebito: TBooleanField;
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
    lcFichaGroup_Root: TdxLayoutGroup;
    lcFicha: TdxLayoutControl;
    lcFichaItem2: TdxLayoutItem;
    edCodigo: TcxDBMaskEdit;
    edNome: TcxDBTextEdit;
    lcFichaItem3: TdxLayoutItem;
    edUsername: TcxDBTextEdit;
    lcFichaItem4: TdxLayoutItem;
    edSenha: TcxDBTextEdit;
    lcFichaItem5: TdxLayoutItem;
    lcFichaGroup3: TdxLayoutGroup;
    edSexo: TcxDBImageComboBox;
    lcFichaItem6: TdxLayoutItem;
    edApelido: TcxDBTextEdit;
    lcFichaItem7: TdxLayoutItem;
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
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    edEscola: TcxDBComboBox;
    lcFichaItem16: TdxLayoutItem;
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
    lcFichaGroup14: TdxLayoutGroup;
    lcFichaGroup7: TdxLayoutGroup;
    lcFichaGroup15: TdxLayoutGroup;
    lcFichaGroup16: TdxLayoutGroup;
    LMDSimplePanel1: TLMDSimplePanel;
    Image1: TImage;
    lbSemFoto: TcxLabel;
    panFoto: TLMDSimplePanel;
    edFoto: TcxDBImage;
    NBStyleItem1: TdxNavBarStyleItem;
    dxLayoutWebLookAndFeel1: TdxLayoutWebLookAndFeel;
    dxLayoutStandardLookAndFeel1: TdxLayoutStandardLookAndFeel;
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
    cxLabel1: TcxLabel;
    edLimiteDeb: TcxDBCurrencyEdit;
    edTarifaEspecial: TcxDBImageComboBox;
    lbTarifaEspecial: TcxLabel;
    lbLoginSemCred: TcxLabel;
    edLoginSemCred: TcxDBImageComboBox;
    MTIdade: TIntegerField;
    lbIdade: TdxLayoutItem;
    lcFichaGroup2: TdxLayoutGroup;
    edIdade: TcxDBSpinEdit;
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
    LMDImageList1: TLMDImageList;
    PngImageList1: TPngImageList;
    btnNenhum: TLMDSpeedButton;
    btnTodos: TLMDSpeedButton;
    MTOpCHorario: TWordField;
    OpenDlg: TOpenDialog;
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

    { Private declarations }
  private
    FPai: TWinControl;

    procedure RefreshBtn;
    procedure AjustaVisCotas;
    procedure AlertaUsername(aNew: String);
    procedure AjustaVisCensuraHorario;

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
  ncafbTran, ncSessao, ncafgExtratoFid, ncafbPesqCH;

{$R *.DFM}

procedure TFrmCadCli.Editar(aTab: TDataset; aPai: TWinControl);
begin
  if aTab=nil then aTab := Dados.tbCli;
  try
    FUsername := aTab.FieldByName('Username').AsString;
    FNovo := False;
    FTab := ATab;
    nbiDebitos.Enabled := (FTab.FieldByName('Debito').AsCurrency>=0.01);
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
    SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
    Valor := SetBit(Valor, BitsH[H], (SB.Color=clGreen));
  end;
  Campo.Value := Valor;
end;

begin
  Paginas.ActivePageIndex := 0;
  edUsername.SetFocus;
  edNome.SetFocus;
  edNasc.PostEditValue;
  if (not MTDataNasc.IsNull) and (not VarIsNull(edIdade.Value)) then
  if (edIdade.Value<1) or (edIdade.Value>110) then begin
    ShowMsg('Data de nascimento não é válida', True);
    edNasc.SetFocus;
    Exit;
  end;
    
  if MTNome.Value = '' then
    Raise ENexCafe.Create('Nome não pode ser deixado em branco !');
      
  if (FRgAnt<>MTRg.Value) and (MTRg.AsString>'') and tAux.FindKey([MTRG.Value]) then
    Raise ENexCafe.Create('Já existe um cliente cadastrado com esse RG');

  if (FUsername <> MTUsername.Value) and
     (MTUsername.Value <> '') and
     tAux.Locate('Username', MTUsername.Value, [loCaseInsensitive]) then
  begin
    Beep;
    ShowMessage('Já existe outro cliente cadastrado com esse mesmo Username!');
    Exit;
  end;   

  if not (MT.State in [dsInsert, dsEdit]) then MT.Edit;
  
  if rgopchSemCensura.Checked then 
    MTOpCHorario.Value := opchSemCensura
  else
  if rgopchCHorario.Checked then begin
    if MTCHorario.Value=0 then
      Raise Exception.Create('É necessário escolher uma faixa de horário para a censura de horário');
    MTOpCHorario.Value := opchCHorario;
  end else
  if rgopchCensuraEsp.Checked then
    MTOpCHorario.Value := opchCensuraEsp;

  if FNovo then begin
    FTab.Insert;
    FTab.FieldByName('IncluidoEm').AsDateTime := Now;
    FTab.FieldByName('IncluidoPor').AsString := Dados.CM.Username;
  end else begin
    FTab.Edit; 
    FTab.FieldByName('AlteradoEm').AsDateTime := Now;
    FTab.FieldByName('AlteradoPor').AsString := Dados.CM.Username;
  end;

  
  SalvaDia(1, MTHP1);
  SalvaDia(2, MTHP2);
  SalvaDia(3, MTHP3);
  SalvaDia(4, MTHP4);
  SalvaDia(5, MTHP5);
  SalvaDia(6, MTHP6);
  SalvaDia(7, MTHP7);
  
  TransfDadosEsp(MT, FTab, '|ID|Minutos|IncluidoEm|IncluidoPor|AlteradoEm|AlteradoPor|');

  FTab.Post;
  Resultado := FTab.FieldByName('ID').AsInteger;
  if FPai=nil  then Close;

  S := Dados.CM.Sessoes.PorCliente[Resultado];
  if S<>nil then Dados.CM.ForceRefreshSessao(S.ID);
end;

procedure TFrmCadCli.lbSemFotoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var 
  B : TBitmap;  
  J : TJpegImage;
  S : String;
begin
  if OpenDlg.Execute(Handle) and 
     (OpenDlg.FileName>'') then 
  begin
    S := OpenDlg.FileName;
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
    end;
    MTFoto.LoadFromFile(S);
    edFoto.EditValue := MTFoto.AsVariant;
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

  if tAux.Locate('Username', aNew, []) then begin
    lbUsername.Style.TextColor := clRed;
    lbUsername.Caption := 'Username indisponível.';
  end else begin
    lbUsername.Style.TextColor := clGreen;
    lbUsername.Caption := 'Username disponível!';
  end;
end;

procedure TFrmCadCli.btnNenhumClick(Sender: TObject);
var
  Dia, H : Integer;
  SB : TLmdSpeedButton;
begin
  for Dia := 1 to 7 do
  for H := 0 to 23 do begin
    SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
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
    SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
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
  case Paginas.ActivePageIndex of
    4 : if FMgr.FormByClass(TfbPassaportes)=nil then begin
      FMgr.RegistraForm(TfbPassaportes);
      LockWindowUpdate(Handle);
      try
        FMgr.Mostrar(TfbPassaportes, fpass_Cliente, MTID.Value);
      finally
        LockWindowUpdate(0);
      end;
    end;
    6 : if FMgr.FormByClass(TfbTran)=nil then begin
      FMgr.RegistraForm(TfbTran);
      LockWindowUpdate(Handle);
      try
        FMgr.Mostrar(TfbTran, ftran_Cliente, MTID.Value);
        TfbTran(FMgr.FormAtivo).panTran.AlignWithMargins := False;
      finally
        LockWindowUpdate(0);
      end;
    end;
    5 : if FMgr.FormByClass(TfbExtratoFid)=nil then begin
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
  edNome.Properties.CharCase := GetCharCase('Nome');
  edUsername.Properties.CharCase := GetCharCase('Username');
  edApelido.Properties.CharCase := GetCharCase('Nickname');
  edSenha.Properties.CharCase := GetCharCase('Senha');
  edTelefone.Properties.CharCase := GetCharCase('Telefone');
  edCelular.Properties.CharCase := GetCharCase('Celular');
  edRG.Properties.CharCase := GetCharCase('Rg');
  edCPF.Properties.CharCase := GetCharCase('CPF');
  edTitEleitor.Properties.CharCase := GetCharCase('TitEleitor');
  edEndereco.Properties.CharCase := GetCharCase('Endereco');
  edBairro.Properties.CharCase := GetCharCase('Bairro');
  edCidade.Properties.CharCase := GetCharCase('Cidade');
  edPai.Properties.CharCase := GetCharCase('Pai');
  edMae.Properties.CharCase := GetCharCase('Mae');
  edEscola.Properties.CharCase := GetCharCase('Escola');
  edObs.Properties.CharCase := GetCharCase('Obs');
  edEmail.Properties.CharCase := GetCharCase('Email');
  
  TThreadStrings.Create(Handle);

  pagFoto.ActivePageIndex := 0;
  with edLoginSemCred.Properties do begin
    Items[0].Description := 'Seguir opção padrão ' + SNStr[gConfig.PermiteLoginSemCred];
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
    II.Description := 'Livre';

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
    SB := TLMDSpeedButton(Self.FindComponent('hora'+IntToStr(Dia)+IntToStr(H)));
    if BitIsSet(Valor, BitsH[H]) then
      SB.Color := clGreen else
      SB.Color := clRed;
    SB.Font.Color := clWhite;  
  end;
end;

begin
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
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
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
  S := nil;
  Q := nil;
  S := TnxSession.Create(nil);
  try
    S.ServerEngine := Dados.RSE;
    S.Username := 'admin';
    S.Password := 'delphi9856';
    S.Active := True;
    
    Q := TnxQuery.Create(nil);
    Q.Session := S;
    Q.AliasName := 'NexCafe';
    Q.SQL.Text := 'select distinct(Escola) as Escola from Cliente';
    Q.Active := True;

    slEscolas.Clear;
    Q.First;
    while not Q.Eof do begin
      Str := Trim(Q.FieldByName('Escola').AsString);
      if Str>'' then slEscolas.Add(Str);
      Q.Next;
    end;
    
    Q.Active := False;
    Q.SQL.Text := 'select distinct(Bairro) as Bairro from Cliente';
    Q.Active := True;

    slBairros.Clear;
    Q.First;
    while not Q.Eof do begin
      Str := Trim(Q.FieldByName('Bairro').AsString);
      if Str>'' then slBairros.Add(Str);
      Q.Next;
    end;

    Q.Active := False;
    Q.SQL.Text := 'select distinct(Cidade) as Cidade from Cliente';
    Q.Active := True;

    slCidades.Clear;
    Q.First;
    while not Q.Eof do begin
      Str := Trim(Q.FieldByName('Cidade').AsString);
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
  slCamposCli.Add('Nome=Nome');
  slCamposCli.Add('Username=Username');
  slCamposCli.Add('Nickname=Apelido');
  slCamposCli.Add('Senha=Senha');
  slCamposCli.Add('Telefone=Telefone');
  slCamposCli.Add('Celular=Celular');
  slCamposCli.Add('Rg=RG');
  slCamposCli.Add('Cpf=CPF');
  slCamposCli.Add('TitEleitor=Tit.Eleitor');
  slCamposCli.Add('Endereco=Endereço');
  slCamposCli.Add('Bairro=Bairro');
  slCamposCli.Add('Cidade=Cidade');
  slCamposCli.Add('Pai=Pai');
  slCamposCli.Add('Mae=Mãe');
  slCamposCli.Add('Escola=Escola');
  slCamposCli.Add('Email=E-mail');
  slCamposCli.Add('Obs=Observações');
  
  slCidades := TStringList.Create;
  slBairros := TStringList.Create;
  slEscolas := TStringList.Create;

finalization
  slCamposCli.Free;
  slCidades.Free;
  slBairros.Free;
  slEscolas.Free;  

end.
