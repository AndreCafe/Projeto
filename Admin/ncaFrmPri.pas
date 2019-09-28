unit ncaFrmPri;
{
    ResourceString: Dario 09/03/13
}

interface

{$I nex.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, idHttp, Controls, Forms,
  Dialogs, IniFiles,
  ExtCtrls, 
  kbmMemTable, kbmMemBinaryStreamFormat, DB, 
  cxPC, cxControls, dxBar,
  cxContainer, cxEdit,
  dxBarExtItems, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxGridCustomView,
  cxGridLevel, cxGrid, cxMaskEdit, 
  ComCtrls, ImgList, 
  cxGroupBox, cxVGrid,
  cxInplaceContainer, 
  cxGridCardView, 
  cxHint,
  cxSplitter, 
  dxDockPanel, dxDockControl, cxLabel,
  cxLookAndFeelPainters, cxButtons, 
  cxTextEdit, cxMemo, 
  dxPScxGridLnk, 
  cxRadioGroup, cxDBData, cxGridDBTableView,  
  LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDCustomGroupBox, LMDGroupBox,
  StdCtrls, 
  LMDControl,
  LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, 
  ufmFormBase, LMDCustomComponent, LMDContainerComponent, 
  pngimage,
  Buttons, chfrBase, chfrPadrao, chBase, chKBM, 
  LMDBaseDialog, 
  ncFrmChat, ncafbPrevSessao, ncafbListaEspera, ShellApi,
  AppEvnts, ncClassesBase,
  LMDWaveComp, GrFingerComp, LMDBaseGraphicControl, 
  cxLookAndFeels, LMDSysInfo, dxNavBarCollns, dxNavBarBase,
  dxNavBar, ncafbImp, 
  dxNavBarStyles, LMDPNGImage, cxGridCommon,
  LMDSimplePanel, ncafbMaquinas, dxLayoutLookAndFeels, rtcInfo, rtcConn,
  rtcDataCli, rtcHttpCli, EmbeddedWB, cxPCdxBarPopupMenu, dxScreenTip,
  dxCustomHint, Menus, ncPRTransfer, ncThreadedDownload, LMDBaseController,
  LMDCustomContainer, LMDGenericList, dxBarBuiltInMenu, dxGDIPlusClasses;

const
  wm_atualizaadesoes = wm_user + 200;
  wm_alignpanplano   = wm_user + 201;
  wm_atualizalic     = wm_user + 202;
  
type
  TFrmPri = class(TForm)
    pgMaq : TcxPageControl;
    tsNexAdmin : TcxTabSheet;
    BarMgr: TdxBarManager;
    dxBarSubItem1: TdxBarSubItem;
    cmTrocarUsuario: TdxBarButton;
    cmAlterarSenha  : TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    cmSair: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton6: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarSubItem3: TdxBarSubItem;
    cxEditStyleController1: TcxEditStyleController;
    FM: TFormManager;
    HC: TcxHintStyleController;
    cxStyleRepository1: TcxStyleRepository;
    GridTableViewStyleSheetEggplant: TcxGridTableViewStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxVerticalGridStyleSheetEggplant: TcxVerticalGridStyleSheet;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    GridTableViewStyleSheetMaple: TcxGridTableViewStyleSheet;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cmExibir: TdxBarImageCombo;
    cmExportar: TdxBarButton;
    cmImprimir: TdxBarButton;
    dsPri: TdxDockSite;
    dckMgr: TdxDockingManager;
    dpAtalhos: TdxDockPanel;
    dxLayoutDockSite1: TdxLayoutDockSite;
    dpPaginas: TdxDockPanel;
    dxLayoutDockSite2: TdxLayoutDockSite;
    Paginas: TcxPageControl;
    MT: TkbmMemTable;
    MTDataHora: TDateTimeField;
    MTTexto: TMemoField;
    DataSource1: TDataSource;
    cmSubExibir: TdxBarSubItem;
    cmMostrarTextoBotoes: TdxBarButton;
    Timer1: TTimer;
    cmChat: TdxBarControlContainerItem;
    btnChat: TLMDSpeedButton;
    TimerChat: TTimer;
    Timer2: TTimer;
    cmSuporteRemoto: TdxBarButton;
    AE: TApplicationEvents;
    cxStyle29: TcxStyle;
    dxBarButton1: TdxBarButton;
    cxStyle30: TcxStyle;
    FingRead: TGrFingerComp;
    dxBarDockControl1: TdxBarDockControl;
    cxTabSheet1: TcxTabSheet;
    dxBarSubItem4: TdxBarSubItem;
    dxBarSubItem5: TdxBarSubItem;
    cmLayoutAddRemCols: TdxBarButton;
    cmLaySalvar: TdxBarButton;
    cmLayRestaurar: TdxBarButton;
    dpAtalhosDir2: TdxDockPanel;
    dxLayoutDockSite3: TdxLayoutDockSite;
    BarMgrBar3: TdxBar;
    cmMaquinas: TdxBarLargeButton;
    cmClientes: TdxBarLargeButton;
    cmProdutos: TdxBarLargeButton;
    cmCaixa: TdxBarLargeButton;
    cmOpcoes: TdxBarLargeButton;
    cmTarifas: TdxBarLargeButton;
    cmUsuarios: TdxBarLargeButton;
    cmFiltroWeb: TdxBarLargeButton;
    cxStyle31: TcxStyle;
    dxBarDockControl2: TdxBarDockControl;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cmEstatisticas: TdxBarLargeButton;
    TimerHint: TTimer;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cmRemoveAddMaq: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cmPremium: TdxBarControlContainerItem;
    dpCHAT: TdxDockPanel;
    dxLayoutDockSite5: TdxLayoutDockSite;
    dpImp: TdxDockPanel;
    dpListaEsp: TdxDockPanel;
    dxLayoutDockSite8: TdxLayoutDockSite;
    dpPrevisao: TdxDockPanel;
    dxLayoutDockSite4: TdxLayoutDockSite;
    dxVertContainerDockSite1: TdxVertContainerDockSite;
    cmAbrirServ: TdxBarButton;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    lfPadrao: TdxLayoutStandardLookAndFeel;
    dxBarButton2: TdxBarButton;
    cxStyle44: TcxStyle;
    TimerPlusUpdateAll: TTimer;
    logos_plus: TcxImageList;
    TimerFirewall: TTimer;
    cxStyle45: TcxStyle;
    dxBarButton7: TdxBarButton;
    cmComprarAss: TdxBarButton;
    cxStyle46: TcxStyle;
    cmVendas: TdxBarLargeButton;
    cxStyle47: TcxStyle;
    cmImpressoes: TdxBarLargeButton;
    glArqs: TLMDGenericList;
    TimerAvisoAss: TTimer;
    panPlanos: TLMDSimplePanel;
    imgConta: TImage;
    Shape1: TShape;
    Shape2: TShape;
    lbConta: TcxLabel;
    lbVersao: TcxLabel;
    lbPromptVersao: TcxLabel;
    lbPlano: TcxLabel;
    lbPromptPlano: TcxLabel;
    lbVenc: TcxLabel;
    lbPromptVenc: TcxLabel;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    pmRegistro: TdxBarPopupMenu;
    cmNovoReg: TdxBarButton;
    cmOutroReg: TdxBarButton;
    cmAtualizaLic: TdxBarButton;
    procedure Timer1Timer(Sender: TObject);
    procedure cmSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmChatClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FMChange(Sender: TObject);
    procedure cmTrocarUsuarioClick(Sender: TObject);
    procedure cmAlterarSenhaClick(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmMostrarTextoBotoesClick(Sender: TObject);
    procedure TimerChatTimer(Sender: TObject);
    procedure btnChatClick(Sender: TObject);
    procedure paActivate(Sender: TdxCustomDockControl; Active: Boolean);
    procedure Timer2Timer(Sender: TObject);
    procedure AEShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure cmSuporteRemotoClick(Sender: TObject);
    procedure FingReadFingerPrint(Sender: TObject);
    procedure AEException(Sender: TObject; E: Exception);
    procedure FormResize(Sender: TObject);
    procedure pgMaqCanClose(Sender: TObject; var ACanClose: Boolean);
    procedure cmImprimirClick(Sender: TObject);
    procedure cmExportarClick(Sender: TObject);
    procedure cmLayoutAddRemColsClick(Sender: TObject);
    procedure cmLaySalvarClick(Sender: TObject);
    procedure cmLayRestaurarClick(Sender: TObject);
    procedure NavBarGroupClick(Sender: TObject; AGroup: TdxNavBarGroup);
    procedure NavBarActiveGroupChanged(Sender: TObject);
    procedure NavBarGroupPress(Sender: TObject; AGroup: TdxNavBarGroup);
    procedure cmMaquinasClick(Sender: TObject);
    procedure TimerHintTimer(Sender: TObject);
    procedure dpAtalhosDir2Resize(Sender: TObject);
    procedure dpAtalhosDir2RestoreDockPosition(Sender: TdxCustomDockControl;
      var APosition: TdxDockPosition);
    procedure dpAtalhosDir2VisibleChanged(Sender: TdxCustomDockControl);
    procedure cmRemoveAddMaqClick(Sender: TObject);
    procedure dxBarStatic1Click(Sender: TObject);
    procedure dpCHATDock(Sender, Site: TdxCustomDockControl;
      ADockType: TdxDockingType; AIndex: Integer);
    procedure dpImpCloseQuery(Sender: TdxCustomDockControl;
      var CanClose: Boolean);
    procedure dpPrevisaoDock(Sender, Site: TdxCustomDockControl;
      ADockType: TdxDockingType; AIndex: Integer);
    procedure dpPrevisaoVisibleChanged(Sender: TdxCustomDockControl);
    procedure dpPrevisaoVisibleChanging(Sender: TdxCustomDockControl);
    procedure cmAbrirServClick(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure TimerPlusUpdateAllTimer(Sender: TObject);
    procedure TimerFirewallTimer(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cmComprarAssClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cmVerCodClick(Sender: TObject);
    procedure cxEditStyleController1StyleChanged(Sender: TObject);
    procedure TimerAvisoAssTimer(Sender: TObject);
    procedure lbPromptPlanoClick(Sender: TObject);
    procedure lbContaClick(Sender: TObject);
    procedure cmNovoRegClick(Sender: TObject);
    procedure cmOutroRegClick(Sender: TObject);
    procedure cmAtualizaLicClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    {$IFNDEF LOJA}
    FChat : TFrmBaseChat;
    FEspera : TfbListaEspera;
    FPrevSessao : TfbPrevSessao;
    FImp    : TfbImp;
    FPrintTransfer : TncPrintTransfer;
    {$ENDIF}
    FBiometria : Boolean;

    {$IFNDEF LOJA}
    procedure EnviarMsg(const aPara: Integer; const aTexto: String);
    procedure MudouAtencao(Sender: TObject);
    {$ENDIF}

    procedure LoadDckMgr;
    procedure SetBiometria(const Value: Boolean);

    procedure OnAjustaRestSpaceTimer(Sender: TObject);
    procedure NewRestSpaceTimer;

    procedure OnTimerAfterLogin(Sender: TObject);
    procedure OnTerminouUpdAll(Sender: TObject);

    procedure OnConfirmouImp(Sender: TObject; aInfo: TStrings);
    procedure OnCancelouImp(Sender: TObject; aInfo: TStrings);
    
    procedure AjustaSBCaptions;

    {$IFNDEF LOJA}
    procedure OnChatHist(Sender: TObject);
    procedure OnPRTransferProgress(Sender: TObject; Arq: TGUID; aPos, aTotal: Cardinal; aFailed: Boolean);
    {$ENDIF}


    procedure OnFrmSemConta(Sender: TObject);
    procedure OnChecaSenhaMaqs(Sender: TObject);

    procedure wmBiometria(var Msg: TMessage);
      message wm_biometria;

    procedure wmInfoCampanha(var Msg: TMessage);
      message wm_infocampanha;

    procedure wmAtualizaAdesoes(var Msg: TMessage);
      message wm_atualizaadesoes;  

    procedure wmAlignPanPlano(var Msg: TMessage);
      message wm_alignpanplano;

    procedure wmAtualizaLic(var Msg: TMessage);
      message wm_atualizalic;  

    procedure wmVendaPlus(var Msg: TMessage);
      message wm_vendaplus;

    procedure wmAbreAba(var Msg: TMessage);
      message wm_abreaba;

    procedure wmDownloadIntInfo(var Msg: TMessage);
      message wm_downloadIntInfo;

  public
    procedure AtualizaBar; // dario 09/2009

    procedure MakeChatVisible(Sender: TObject);
    procedure AjustaVersao;
    procedure RegistraForms;


    procedure DownloadPrintDoc(aArq: String);

    procedure MostraHint(X, Y: Integer; aHeader, aStr: String);
    procedure EscondeHint;

    procedure AjustaRestSpace;

    procedure Refresh_dpImp;

    procedure TentaConectar(Reconexao: Boolean);
    procedure AtualizaDireitos;

//    procedure DownloadNexAP;

    procedure RefreshTran;
    procedure RefreshBotoesMaq;
    procedure RefreshCacheMaq;
    procedure MostrarCaixasAnteriores;
    procedure MostrarCaixaAtual;

//    procedure AjustaMsgAssinatura;

    procedure AjustaVisSenha;

    function VersaoStr: String;

    function FocusColor: TColor;

    procedure AddWebTab(S: String);

    procedure UpdateAllPlus;

    property FrmImp: TfbImp
      read FImp;

    property FrmChat: TFrmBaseChat
      read FChat;

    property ListaEspera: TfbListaEspera
      read FEspera;

    property PrevSessao: TfbPrevSessao
      read FPrevSessao;

   { Public declarations }

    property Biometria: Boolean
      read FBiometria write SetBiometria;

  public
    procedure CustomDrawGridHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);    
        
  end;

  TMYcxGridColumnHeaderFilterButtonViewInfo = class( TcxGridColumnHeaderFilterButtonViewInfo)
  public
    function GetVisible: Boolean; override;
  end;
  
  TThread_AbriuAdmin = class ( TThread )
  protected
    constructor Create;
    procedure Execute; override;
  end; 
   
  function SimNao(S: String): Boolean;
  function SimNaoH(S: String; H : HWND): Boolean;
  procedure ShowMsg(S: String; aBeep: Boolean = False);

  function PremiumOk: Boolean;


                                                     

var
  FrmPri: TFrmPri;
  DckMgrLoaded : Boolean = False;
  ClicouSair : Boolean = False;
  GShutingdown : Boolean = False;
  LastGetApp : Cardinal = 0;

const
  Key_Tab        = 9;
  Key_Ins        = 45;
  Key_Del        = 46;
  Key_Enter      = 13;
  Key_Up         = 38;
  Key_Down       = 40;
  Key_Esc        = 27;
  Key_CtrlN      = $310E;
  Key_F2         = $71;
  Key_F3         = $72;
  Key_F4         = $73;
  Key_F5         = $74;
  Key_F6         = $75;
  Key_F7         = $76;
  Key_F8         = $77;
  Key_F9         = $78;
  Key_F10        = $79;
  Key_F11        = $7A;
  Key_F12        = $7B;  

implementation

uses 
  dxCore,
  clipbrd,
  uLogs,
  cxEditConsts,
  ncErros,
  ufmImagens, 
  ncaFrmLogin, 
  ncaDM,
  ncafbTran, 
  ncafbClientes, 
  Consts, 
  ncafbProdutos, 
  ncafbCaixa, 
  ncIDRecursos,
  cxGridStrs, 
  cxGridPopupMenuConsts,
  cxFilterConsts,
  cxFilterControlStrs,
  ncafbOpcoes, 
  ncafbTarifas, 
  ncafbUsuarios,
  ncaFrmSenha, 
  ncaFrmContato,
  ncaFrmHistVer, 
  ncaFrmTempo,
  ncafbPesqCli,
  ncafbTiposImp,
  ncafbAvisos, ncafbFiltroWeb, ncVersoes, ncDMServ, 
  ncaLocalizaCli,
  ncFrmSuporteRem, uWinPopUp, ncaBiometria, uVersionInfo,
  nxptBasePooledTransport, nxllBde, ncaFrmCadCli, ncafbMaq, ncafbMaqConfig,
  ncafbEst, ncaFrmTarifa, ncafbTarifas2, ncaFrmSemConta, ncafbPesqFor,
  ncafbPesqCH, ncaFrmAss, ncShellStart, ncaFrmWebPopup, ncaFrmGetWebTabs,
  ncafbCXLetra, ncaFrmSenhaWiz, ncaFrmQtdMaq, ncaPlusAPI, ncaFrmConta,
  ncaFrmVendaPlus, ncaK, ncCommPlusIndy, ncDebug, ncDMcommPlus, ncaFrmTotal,
  ncaFrmCli, ncafbCHATHist, ncFirewall, 
  ncFrmCriarConta, ncaFrmCriarConta2, ncaFrmPanTopo, ncaFrmPTProgress, ncPrintDoc, ncPRConsts,
  ncFrmPrintReview, ncPrinterInfo8, ncaFrmImp, uNexTransResourceStrings_PT,
  ncaFrmPopupAss, nexUrls, ncGuidUtils, ncServAtualizaLic_Indy;

// START resource string wizard section
const
  SNexAdmin = 'NexAdmin';
  STodos = 'Todos';
  SNexAdmin4Lay3 = 'NexAdmin4.lay3';
  SAdmin = 'admin';
  SControl = 'control';
  SLiberar = 'liberar';
  SCancelar = 'cancelar';
  SIni = '.ini';
  SPREMIUM = ' PREMIUM';
  SFREE = ' FREE';
  SNexapExe = 'nexap.exe';
  SAfterlogoff = 'afterlogoff';

// END resource string wizard section


// START resource string wizard section
// MMX resource string wizard section REMOVIDA - 08/04/13 12:58



{$R *.dfm}

function PremiumOk: Boolean;
begin
  Result := False;
  if Trim(gConfig.Conta)='' then
    TFrmCriarConta2.Create(nil).ShowModal
  else
  if not gConfig.IsPremium then
    ShowMessage(SncaFrmPri_VocêDeveSerUmAssinanteDoNexParaU) else
    Result := True;
end;

function IndexToFormClass(aIndex: Integer): TFrmBaseClass;
begin
 Result := nil;
  case aIndex of
    0 : Result := TfbMaq;
    2 : Result := TfbClientes;
    3 : Result := TfbProdutos;
//    4 : Result := TfbImp;
    4 : Result := TfbCaixa;
    5 : Result := TfbOpcoes;
    6 : Result := TfbTiposImp;
    7 : Result := TfbTarifas2;
    8 : Result := TfbUsuarios;
    9 : Result := TfbFiltroWeb;
   10 : Result := TfbEst;
  end;
end;

function SimNao(S: String): Boolean;
begin
  Result := SimNaoH(S, Application.ActiveFormHandle);
end;                

function SimNaoH(S: String; H : HWND): Boolean;
begin
  Result := (MessageBox(H, PChar(S), PChar(SncaFrmPri_Atenção),
             MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = IDYES)
end;  

procedure ShowMsg(S: String; aBeep: Boolean = False);
begin
  if aBeep then Beep;
  MessageBox(Application.ActiveFormHandle, PChar(S), PChar(SncaFrmPri_Atenção),
             MB_OK + MB_ICONINFORMATION + MB_APPLMODAL);
end;

procedure TFrmPri.TentaConectar(Reconexao: Boolean);
begin
  Caption := SncaFrmPri_NexNexAdmin;

  with TFrmNexLogin.Create(Self) do
    ShowModal;

  if not Dados.CM.Ativo then Exit;


  with TTimer.Create(Self) do begin
    Interval := 1000;
    OnTimer := OnTimerAfterLogin;
    Enabled := True;
  end;

  TimerAvisoAss.Enabled := True;

  Caption := SncaFrmPri_NexNexAdminUsuário + Dados.CM.Username + SncaFrmPri_Pasta + ExtractFileDir(ParamStr(0));

//  PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);

  Dados.AbreDB;
  
  cmTrocarUsuario.Caption := SncaFrmPri_TrocarDeUsuário;
  cmSubExibir.Enabled := True;
  dsPri.Visible := True;
  cmImprimir.Enabled := True;
  cmExportar.Enabled := True;

  AjustaVisSenha;

  cmAlterarSenha.Enabled := True;
//  cmSubExibir.Caption := 'E&xibir: Máquinas';
  FM.Mostrar(TfbMaq, 0, 0);
//  Tfbmaq(FM.FormAtivo).Paginas.ActivePageIndex := 1;
end;

procedure TFrmPri.Timer1Timer(Sender: TObject);
begin
  Close;
end;
       
procedure TFrmPri.Timer2Timer(Sender: TObject);
begin
  if not Permitido(daAtenderClientes) then Exit;

  Timer2.Enabled := False;
  if Versoes.Podeusar(idre_chat) and (gConfig.OpcaoChat<>ochDesabilitar) then begin
    //nbgChat.Visible := True;
    FChat.meTexto.SetFocus;
  end;
end;

procedure TFrmPri.TimerAvisoAssTimer(Sender: TObject);
begin
  TimerAvisoAss.Enabled := False;
  TFrmPopupAss.Mostrar;
end;

procedure TFrmPri.TimerChatTimer(Sender: TObject);
begin
  cmChat.Visible := ivAlways;
  if btnChat.Color = clYellow then
    btnChat.Color := clBtnFace else
    btnChat.Color := clYellow;
end;

procedure TFrmPri.TimerFirewallTimer(Sender: TObject);
begin
  TimerFirewall.Enabled := False;
  try
    allowexceptionsonFirewall;
    addApplicationToFirewall(SNexAdmin, ParamStr(0));
  finally
    TimerFirewall.Interval := 60000 * 5;
    TimerFirewall.Enabled := True;
  end;
end;

procedure TFrmPri.TimerHintTimer(Sender: TObject);
begin
  TimerHint.Enabled := False;
  HC.HideHint;
end;

procedure TFrmPri.TimerPlusUpdateAllTimer(Sender: TObject);
begin
  TimerPlusUpdateAll.Enabled := False;
  with TplusReqUpdateAll.Create do begin
    OnTerminate := OnTerminouUpdAll;
    Executar;
  end;
end;

procedure TFrmPri.UpdateAllPlus;
begin
  PostMessage(Handle, wm_atualizaadesoes, 0, 0);
end;

function TFrmPri.VersaoStr: String;
begin
  Result := IntToStr(Versoes.Versao);
  Result := Result[1] + '.' + Result[2] + '.' + Result[3] + Copy(SelfVersion, 6, 20);
end;

procedure TFrmPri.wmAtualizaAdesoes(var Msg: TMessage);
begin
  TimerPlusUpdateAll.Enabled := True;
end;

procedure TFrmPri.wmAtualizaLic(var Msg: TMessage);
begin
  try
    ObtemRegistroNex;
  finally
  end;
end;

procedure TFrmPri.wmBiometria(var Msg: TMessage);
begin
  if Assigned(FM.FormAtivo) and (FM.FormAtivo is TfbClientes) then
    TfbClientes(FM.FormAtivo).Tab.Locate('ID', Msg.wParam, []);                                                // do not localize
end;

procedure TFrmPri.wmDownloadIntInfo(var Msg: TMessage);
var 
  DI : TncThDownloadInfo;
begin
  DI := TncThDownloadInfo(Msg.wParam);
  with DI do 
  try
    DebugMsg('TFrmPri.OnDownloadIntDone - aArq: ' + Arq + ' - aVersaoServ: ' + IntToStr(VersaoServ) +  ' - aErro: ' + IntToStr(Erro)); // do not localize
    if Erro=0 then begin
      slConfig.Values[Arq] := IntToStr(VersaoServ);
      slConfig.SaveToFile(ConfigName);
    end else 
    if Erro=ncerrFalhaDownloadInt then 
      with TTimer.Create(Self) do begin
        Interval := 10000+Random(10000);
//        OnTimer := OnTimerRedownload;
        Enabled := True;
      end;
  finally
    DI.Free;
  end;
end;

procedure TFrmPri.wmInfoCampanha(var Msg: TMessage);
var IC: TInfoCampanha;
begin
  IC := TinfoCampanha(Msg.WParam);
  try
    DM.SalvaInfoCampanha(IC);
  finally
    IC.Free;
  end;
end;

procedure TFrmPri.wmVendaPlus(var Msg: TMessage);
var I : TVendaPlusInfo;
begin
  I := TVendaPlusInfo(Msg.wParam);
  try
    if CaixaFechado then Exit;
    if PodeVenderPlus then begin
      TFrmVendaPlus.Create(Self).Vender(0, False, I.CodParceiro);
      if I.Refresh then
        try I.Browser.Refresh; except end;
    end;
  finally
    I.Free;
  end;
end;

procedure TFrmPri.wmAbreAba(var Msg: TMessage);
var 
  I : TAbreAba;
  F : PfmFormInfo;
begin
  I := TAbreAba(Msg.WParam);
  try
    F := FM.FormByClass(TfbMaq);
    if (F<>nil) and (F^.fiInstance<>nil) then 
      TfbMaq(F^.fiInstance).OpenRefreshWebTab(I.Titulo, I.URL);
  finally
    I.Free;
  end;
end;

procedure TFrmPri.wmAlignPanPlano(var Msg: TMessage);
begin
  lbPromptPlano.Left := 2000;
  lbPromptPlano.Realign;
  lbPlano.Left := 2000;
  lbPlano.Realign;
  lbPromptVenc.Left := 2000;
  lbPromptVenc.Realign;
  lbVenc.Left := 2000;
  lbVenc.Realign;
  shape2.Left := 2000;
  lbPromptVersao.Left := 2000;
  lbPromptVersao.Realign;
  lbVersao.Left := 2000;
  lbVersao.Realign;
  shape1.Left := 2000;
  imgConta.Left := 2000;
  lbConta.Left := 2000;
  lbConta.Realign;
end;

procedure TFrmPri.cmSairClick(Sender: TObject);
begin
  ClicouSair := True;
  Close;
end;

procedure TFrmPri.cmSuporteRemotoClick(Sender: TObject);
var 
  Maq{, Porta}: Integer;
  S: String;
begin
  Maq := 0;
  //Porta := 0;
  if Dados.CM.Ativo then
    if not TFrmSuporte.Create(nil).ObterSuporte(Maq, Dados.CM.Ativo, Dados.CM.Maquinas) then  Exit;
    
  if Maq=0 then begin
    with Dados.CM.UA do
    S := Username + ': ' + Nome;

    ChamaSuporte(S, VersaoStr);
  end else
    Dados.CM.SuporteRem(Maq, 0);    
end;
//
procedure TFrmPri.FormShow(Sender: TObject);
var
  I : Integer;
begin
  TentaConectar(False);
  if not Dados.CM.Ativo then begin
    Application.Terminate;
    Exit;
  end;

  if not SameText(ParamStr(1), 'afterinst') then 
    TThread_AbriuAdmin.Create;

  FrmPrintReview.OnConfirmouImp := Self.OnConfirmouImp;
  FrmPrintReview.OnCancelouImp := Self.OnCancelouImp;
  

  FPrintTransfer.SetTransp(Dados.nxTCPIP);

  FrmPTProgress_Parent := Handle;

  if Dados.tbIC.IsEmpty then 
    TThreadInfoCampanha.Create(Handle);

  FrmPanTopo.Verifica;
  
  if FindWindow('TncServBaseClassName', nil)<>0 then  // do not localize
    cmAbrirServ.Visible := ivAlways else
    cmAbrirServ.Visible := ivNever;
  
  AjustaVersao;
  FChat := TFrmBaseChat.Create(Self);
  FChat.PrecisaVisibilidade := MakeChatVisible;
  FChat.EnviarMsg := EnviarMsg;
  FChat.NumMaq := 0;
  FChat.btnHist.Visible := Dados.CM.UA.Admin;
  FChat.OnHistClick := Self.OnChatHist;

  //FChat.panPri.Parent := nbgChatControl;
  FChat.panPri.Parent := dpChat;
  //dpChat.Width := lbVersao.Width;

  FEspera := TfbListaEspera.Create(Self);
  FEspera.FiltraDados;
//  FEspera.panPri.Parent := nbgListaEspControl;
  FEspera.panPri.Parent := dpListaEsp;
  FEspera.ParentChanged;

  FPrevSessao := TfbPrevSessao.Create(Self);
  FPrevSessao.FiltraDados;
  FPrevSessao.panPri.Parent := dpPrevisao;
  FPrevSessao.ParentChanged;

{  with Dados, CM.Jobs do begin
    mtImp.Active := False;
    mtImp.Active := True;
    SalvaDataset(mtImp);
  end;}

  FImp := TfbImp.Create(Self);
//  FImp.panPri.Parent := nbgImpControl;
  FImp.panPri.Parent := dpImp;
  
  FImp.ParentChanged;
  FImp.FiltraDados;

  if not Permitido(daAtenderClientes) then
    dpAtalhos.Close
  else begin
{    nbgListaEsp.Visible := Versoes.PodeUsar(idre_listaespera);
    nbgChat.Visible := Versoes.PodeUsar(idre_chat) and (gConfig.OpcaoChat<>ochDesabilitar);}

    dpListaEsp.Visible := Versoes.PodeUsar(idre_listaespera);
    dpChat.Visible := Versoes.PodeUsar(idre_chat) and (gConfig.OpcaoChat<>ochDesabilitar);
  end;


  // dario 09/2009
  AtualizaBar;

  with Dados do begin
    tbChat.SetRange([Now-1], [Now+1]);
    tbChat.First;
    while not tbChat.Eof do begin
      if tbChatID.Value>UChat then
        FChat.MsgEnv(tbChatDataHora.Value, tbChatDe.Value, tbChatPara.Value, tbChatTexto.Value);
      tbChat.Next;
    end;
    if tbChatID.Value>UChat then
      UChat := tbChatID.Value;
  end;
  with FChat, Dados.CM do begin
    edMaq.Properties.Items.Clear;
    edMaq.Properties.Items.Add(STodos);
    for I := 0 to Maquinas.Count - 1 do
      edMaq.Properties.Items.Add(IntToStr(Maquinas[I].Numero));
    edMaq.ItemIndex := 0;
    //FChat.panPri.Parent := nbgChatControl;
    FChat.panPri.Parent := dpChat;
    FChat.MudouAtencao := Self.MudouAtencao;
    FChat.NaoPiscar := True;
  end;

  Application.CreateForm(TfbPesqCli, fbPesqCli);
  Application.CreateForm(TfbPesqFor, fbPesqFor);
  Application.CreateForm(TfbPesqCH, fbPesqCH);
  Application.CreateForm(TfbCXLetra, fbCXLetra);
  
  fbPesqCli.FiltraDados;

  LoadDckMgr;

  with TTimer.Create(Self) do begin
    Interval := 50;
    OnTimer := Self.OnChecaSenhaMaqs;
    Enabled := True;
  end;

  PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
  AtualizaDireitos;

  TAdminFrmWebPopup.Create(Self).Show;
  TFrmGetWebTabs.Create(Self).Show; 

end;

procedure TFrmPri.lbContaClick(Sender: TObject);
var P : TPoint;
begin
  P.X := 0;
  P.Y := 0;
  P := lbConta.ClientToScreen(P);
  P.Y := P.Y + lbConta.Height;
  P.X := FrmPri.Left + FrmPri.Width;
  pmRegistro.Popup(P.X, P.Y);
end;

procedure TFrmPri.lbPromptPlanoClick(Sender: TObject);
begin
  OpenTrack('assinar', 'menupri');
end;

procedure TFrmPri.LoadDckMgr;
var
  S: String;
  //Ini : TIniFile;

begin
  if (Versoes.Versao<250) or DckMgrLoaded then Exit;
  DckMgrLoaded := True;
                             
  try
    S := ExtractFilePath(ParamStr(0))+SNexAdmin4Lay3;
    if FileExists(S) then 
      dckMgr.LoadLayoutFromIniFile(S);
    dpPrevisao.CaptionButtons := [cbHide];
    Refresh_dpImp;
  except
  end;

{  try    
    S := ExtractFilePath(ParamStr(0))+'Atalhos.lay';
    if FileExists(S) then begin
      NavBar.LoadFromIniFile(S);
      Ini := TIniFile.Create(S);
      try
        nbgChat.Expanded := Ini.ReadBool('Chat', 'Expanded', True);
        nbgListaEsp.Expanded := Ini.ReadBool('ListaEsp', 'Expanded', True);
        nbgImp.Expanded := Ini.ReadBool('Impressao', 'Expanded', True);
        nbgChatControl.Height := Ini.ReadInteger('Chat', 'Height', 190);
        nbgListaEspControl.Height := Ini.ReadInteger('ListaEsp', 'Height', 150);
        nbgImpControl.Height := Ini.ReadInteger('Impressao', 'Height', 218);
        NewRestSpaceTimer;
      finally
        Ini.Free;
      end;
    end;
  except
  end;

  if not Permitido(daAtenderClientes) then begin
    nbgChatControl.Enabled := False;
    nbgImpControl.Enabled := False;
  end;}
end;

procedure TFrmPri.MakeChatVisible(Sender: TObject);
begin
//  dpAtalhosDir.AutoHide := False;
  dpChat.AutoHide := False;
           
  if not Permitido(daAtenderClientes) then 
//    dpAtalhosDir.Close 
  else begin
//    dpAtalhosDir.Visible := True;
{    nbgChat.Visible := True;
    nbgChat.Expanded := True;}
    dpChat.Visible := True;
  end;
//  Timer2.Enabled := True;
end;

procedure TFrmPri.MostraHint(X, Y: Integer; aHeader, aStr: String);
begin
  HC.ShowHint(X, Y, aHeader, aStr);
  TimerHint.Enabled := False;
  TimerHint.Enabled := True;
end;

procedure TFrmPri.MostrarCaixaAtual;
begin
  TfbCaixa(FM.FormAtivo).MostrarAtual;
end;

procedure TFrmPri.MostrarCaixasAnteriores;
begin
  TfbCaixa(FM.FormAtivo).MostrarAnteriores;
end;

procedure TFrmPri.MudouAtencao(Sender: TObject);
begin
  if FChat.Atencao then
    TimerChat.Enabled := True
  else begin
    TimerChat.Enabled := False;
    cmChat.Visible := ivNever;
  end;
end;

procedure TFrmPri.NavBarActiveGroupChanged(Sender: TObject);
begin
  NewRestSpaceTimer;
end;

procedure TFrmPri.NavBarGroupClick(Sender: TObject; AGroup: TdxNavBarGroup);
begin
  NewRestSpaceTimer;
end;

procedure TFrmPri.NavBarGroupPress(Sender: TObject; AGroup: TdxNavBarGroup);
begin
  NewRestSpaceTimer;
end;

procedure TFrmPri.NewRestSpaceTimer;
begin
  with TTimer.Create(Self) do begin
    Interval := 50;
    Enabled := True;
    OnTimer := OnAjustaRestSpaceTimer;
  end;
end;

procedure TFrmPri.OnAjustaRestSpaceTimer(Sender: TObject);
begin
  try
    AjustaRestSpace;
  finally
    Sender.Free;
  end;
end;

procedure TFrmPri.OnChatHist(Sender: TObject);
begin
  TfbChatHist.Create(Self).ShowModal;
end;

procedure TFrmPri.OnChecaSenhaMaqs(Sender: TObject);
var 
  S: String;
  Alterou : Boolean;
  I, N : Integer;
  M : TncMaquina;
begin
  Sender.Free;
  S := '';
  Alterou := False;
  gConfig.AtualizaCache;
  if SameText(Dados.CM.UA.Username, SAdmin) and (Dados.CM.UA.Senha='') and (not gConfig.SenhaAdminOk) then begin
    if TFrmSenhaWiz.Create(Self).Editar(S) then begin
      Dados.tbConfig.Edit;
      Dados.tbConfigSenhaAdminOk.Value := True;
      Dados.tbConfig.Post;
      
      Alterou := True;
      gConfig.SenhaAdminOk := True;
      if S>'' then begin
        Dados.CM.UA.AtualizaCache;
        Dados.CM.UA.Senha := S;
        Dados.CM.SalvaAlteracoesObj(Dados.CM.UA, False);
      end;
    end;
  end;

  {$IFDEF LAN}
  if (Dados.CM.Maquinas.Count=2) and (not gConfig.QtdMaqOk) then begin
    N := TFrmQtdMaq.Create(nil).Editar;
    Dados.tbConfig.Edit;
    Dados.tbConfigQtdMaqOk.Value := True;
    Dados.tbConfig.Post; 
    gConfig.QtdMaqOk := True;
    
    Alterou := True;
    
    if N>0 then begin
      M := TncMaquina.Create;
      try 
        for I := 3 to N do begin
          M.Numero := I;
          Dados.CM.SalvaAlteracoesObj(M, True);
        end;
      finally
        M.Free;
      end;
    end;  
  end;
  {$ENDIF}   

  if Alterou then Dados.CM.SalvaAlteracoesObj(gConfig, False);

  if Trim(gConfig.Conta)='' then 
  with TTimer.Create(Self) do begin
    Interval := 1000;
    OnTimer := OnFrmSemConta;
    Enabled := True;
  end;
end;

procedure TFrmPri.OnConfirmouImp(Sender: TObject; aInfo: TStrings);
begin
  aInfo.Values[SControl] := SLiberar;
  Dados.CM.PrintDocControl(aInfo);
end;

procedure TFrmPri.OnCancelouImp(Sender: TObject; aInfo: TStrings);
begin
  aInfo.Values[SControl] := SCancelar;
  Dados.CM.PrintDocControl(aInfo);
end;

procedure TFrmPri.OnFrmSemConta(Sender: TObject);
begin
  Sender.Free;
  if Trim(gConfig.Conta)='' then
    TFrmCriarConta2.Create(Self).ShowModal;
end;

procedure TFrmPri.OnPRTransferProgress(Sender: TObject; Arq: TGUID; aPos,
  aTotal: Cardinal; aFailed: Boolean);
var D: TncPrintDoc; S: String;
begin
  FrmPTProgress.PB.Properties.Max := aTotal;
  FrmPTProgress.PB.Position := aPos;
  FrmPTProgress.Centraliza;
  FrmPTProgress.Show;
  FrmPTProgress.TimerHide.Enabled := aFailed or (aPos=aTotal);

  with Dados do
  if (not aFailed) and (aPos=aTotal) then begin
    S := GuidtoString(Arq);
    if mtPrintDoc.FindKey([S]) then begin
      D := CM.PrintDocs.PorArq[S];
      if Assigned(D) then begin
        ForceDirectories(PRFolder(#0));
        D.DocInfo.SaveToFile(PRFolder(#0)+S+SIni);
        FrmPrintReview.ShowDoc(D.DocInfo);
      end;
    end;
  end;
end; 

procedure TFrmPri.OnTerminouUpdAll(Sender: TObject);
var
  //aInterval: Cardinal;
  UA : TplusReqUpdateAll;
begin
  UA := TplusReqUpdateAll(Sender);
  if UA.Sucesso then begin
    TimerPlusUpdateAll.Interval := 1000;
    DebugMsg('TFrmPri.OnTerminouUpdAll - Sucesso = True'); // do not localize
    TThreadUpdateAll.Create(UA, Dados.RSE);
  end else
  try
    DebugMsg('TFrmPri.OnTerminouUpdAll - Sucesso = False'); // do not localize
    if TimerPlusUpdateAll.Enabled then Exit;
    TimerPlusUpdateAll.Interval := TimerPlusUpdateAll.Interval + 10000;
    if TimerPlusUpdateAll.Interval > 600000 then 
      TimerPlusUpdateAll.Interval := 600000;
    TimerPlusUpdateAll.Enabled := True;   
  finally
    Sender.Free;  
  end;
end;

procedure TFrmPri.OnTimerAfterLogin(Sender: TObject);
begin
  try
    with Dados do begin
      pClient.Active := False;
      pClient.GateAddr := nxTCPIP.ServerName;
      pClient.LoginUsername := SAdmin+IntToStr(Random(High(Integer)));
      pClient.Active := True;
    end;
    Sender.Free;
  finally

  end;
end;


procedure TFrmPri.cmChatClick(Sender: TObject);
begin
{ pagChat.Visible := cmCHat.Down;
  cxSplitter2.Left := Paginas.Left + Paginas.Width - 10;}
end;

procedure TFrmPri.cmExportarClick(Sender: TObject);
var F: TFrmBase;
begin
  F := FM.FormAtivo;
  if Assigned(F) then F.cmExportarClick(nil);
end;

procedure TFrmPri.cmImprimirClick(Sender: TObject);
var F: TFrmBase;
begin
  F := FM.FormAtivo;
  if Assigned(F) then F.cmImprimirClick(nil);
end;

procedure TFrmPri.cmLayoutAddRemColsClick(Sender: TObject);
var F: TFrmBase;
begin
  F := FM.FormAtivo;
  if Assigned(F) then F.cmLayCustomizeClick(nil);
end;

function TFrmPri.FocusColor: TColor;
begin
  Result := Self.cxEditStyleController1.StyleFocused.Color;
end;

procedure TFrmPri.FormClose(Sender: TObject; var Action: TCloseAction);
var 
  S: String;
  //Ini : TIniFile;
begin
  if Timer1.Enabled then begin
    try
      FM.Clear;
    except
    end;
  end else begin
    try
      if Dados.CM.Ativo then begin
        S := ExtractFilePath(ParamStr(0))+SNexAdmin4Lay3;
        dckMgr.SaveLayoutToIniFile(S);
{        S := ExtractFilePath(ParamStr(0))+'Atalhos.lay';
        NavBar.SaveToIniFile(S);
        Ini := TIniFile.Create(S);
        try
          Ini.WriteBool('Chat', 'Expanded', nbgChat.Expanded);
          Ini.WriteBool('ListaEsp', 'Expanded', nbgListaEsp.Expanded);
          Ini.WriteBool('Impressao', 'Expanded', nbgImp.Expanded);
          Ini.WriteInteger('Chat', 'Height', nbgChatControl.Height);
          Ini.WriteInteger('ListaEsp', 'Height', nbgListaEspControl.Height);
          Ini.WriteInteger('Impressao', 'Height', nbgImpControl.Height);
          Ini.UpdateFile;
        finally
          Ini.Free;
        end;}
        
      end;
    except
    end;

    try
      FEspera.cmLaySalvarClick(nil);
      FPrevSessao.cmLaySalvarClick(nil);
     except
    end;
    
    Action := caNone;
    Timer1.Enabled := True;

    if Dados.CM.Ativo then
      if not (FM.FormAtivo  is TfbMaq) then
        FM.Mostrar(TfbMaq, 0, null);

  end;
end;

procedure TFrmPri.FingReadFingerPrint(Sender: TObject);
begin
  FingRead.PrepareIdentify;
  if not Assigned(FrmBio) then
    Application.CreateForm(TFrmBio, FrmBio);
  FrmBio.SearchTPT(FingRead.Tpt, FingRead.TptSize, FingRead.TptQuality);  
end;

procedure TFrmPri.FMChange(Sender: TObject);
var F: TFrmBase;
begin
  if FM.FormAtivo is TfbCaixa then begin
    FM.FormAtivo.FiltraDados;
    F := TfbCaixa(FM.FormAtivo).FM.FormAtivo;
    if F is TfbTran then
      TfbTran(F).Refresh;
  end else
  if FM.FormAtivo is TfbClientes then 
    TfbClientes(FM.FormAtivo).Timer2.Enabled := True
  else
  if FM.FormAtivo is TfbProdutos then
    TfbProdutos(FM.FormAtivo).Timer2.Enabled := True;
end;

procedure TFrmPri.AddWebTab(S: String);
var P : PfmFormInfo;
begin
  P := FM.FormByClass(TfbMaq);
  if Assigned(P) and (P^.fiInstance<>nil) then 
    TfbMaq(P^.fiInstance).AddWebTab(S);
end;

{procedure TFrmPri.AjustaMsgAssinatura;
var Dias: Integer;
begin
  if gConfig.AlertaAssinatura and 
     gConfig.FreePremium and 
     ((gConfig.AssinaturaVenceEm>0) or gConfig.JaFoiPremium) then
  begin
    panPremium.Visible := True;
    cmPremium.Visible := ivAlways;
    if (gConfig.AssinaturaVenceEm<Date) then begin
      btnAss.Color := $00E2E7E9;
      btnAss.Caption := SncaFrmPri_SuaAssinaturaPremiumVenceu;
    end else begin
      Dias := Trunc(gConfig.AssinaturaVenceEm - Date);
      case Dias of
        0 : begin
          btnAss.Color := clYellow;
          btnAss.Caption := SncaFrmPri_SuaAssinaturaPremiumVenceHOJE;
        end;
        1 : begin
          btnAss.Color := $0093FFFF;
          btnAss.Caption := SncaFrmPri_SuaAssinaturaPremiumVenceAMANHÃ;
        end;
        2 : begin
          btnAss.Color := $00C1FFFF;
          btnAss.Caption := SncaFrmPri_SuaAssinaturaPremiumVenceEm2Dias;
        end;
        3 : begin
          btnAss.Color := $00A6F7F4;
          btnAss.Caption := SncaFrmPri_SuaAssinaturaPremiumVenceEm3Dias;
        end;
        4 : begin
          btnAss.Color := $00B5E8E6;
          btnAss.Caption := SncaFrmPri_SuaAssinaturaPremiumVenceEm4Dias;
        end;
        5 : begin
          btnAss.Color := $00BEDEDD;
          btnAss.Caption := SncaFrmPri_SuaAssinaturaPremiumVenceEm5Dias;
        end;
        6..7 : begin
          btnAss.Color := clSilver;
          btnAss.Caption := SncaFrmPri_SuaAssinaturaPremiumPremiumVence+IntToStr(Dias)+SncaFrmPri_Dias;
        end;
        8..10 : begin
          btnAss.Color := clBtnFace;
          btnAss.Caption := SncaFrmPri_SuaAssinaturaPremiumVenceEm+IntToStr(Dias)+SncaFrmPri_Dias;
        end
      else
        cmPremium.Visible := ivNever;
        panPremium.Visible := False;
      end;
    end;
  end else begin
    cmPremium.Visible := ivNever;
    panPremium.Visible := False;
  end;
end;}

procedure TFrmPri.AjustaRestSpace;
//var I, LastExp: Integer;
begin
//  LastExp := -1;
{  for I := 0 to NavBar.Groups.Count - 1 do with NavBar.Groups[I] do 
    if Expanded and (I>LastExp) then LastExp := I;

  for I := 0 to NavBar.Groups.Count - 1 do with NavBar.Groups[I] do
    UseRestSpace := (I=LastExp);}
end;

procedure TFrmPri.AjustaSBCaptions;
begin
  cmMaquinas.ShowCaption := not gConfig.EscondeTextoBotoes;
  cmClientes.ShowCaption := cmMaquinas.ShowCaption;
  cmProdutos.ShowCaption := cmMaquinas.ShowCaption;
  cmCaixa.ShowCaption := cmMaquinas.ShowCaption;
  cmOpcoes.ShowCaption := cmMaquinas.ShowCaption;
  cmTarifas.ShowCaption := cmMaquinas.ShowCaption;
  cmUsuarios.ShowCaption := cmMaquinas.ShowCaption;
  cmFiltroWeb.ShowCaption := cmMaquinas.ShowCaption;
  cmEstatisticas.ShowCaption := cmMaquinas.ShowCaption;
{  with SB.Groups[0] do 
  for I := 0 to ItemCount - 1 do
    if gConfig.EscondeTextoBotoes then
      Items[I].Caption := '' else
      Items[I].Caption := Items[I].Hint;}
end;

procedure TFrmPri.AjustaVersao;
var S: String;

procedure UpdDataLic(D: TDateTime);
begin
  lbVenc.Caption := FormatDateTime('dd/mm/yyyy', D);
  if D<=Date then
    lbVenc.Style.TextColor := clRed else
    lbVenc.Style.TextColor := clBlack;
end;

begin
  PostMessage(handle, wm_alignpanplano, 0, 0);

  if gConfig.IsPremium then begin
    if gConfig.DVA>0 then 
      UpdDataLic(gConfig.DVA) else
      UpdDataLic(gConfig.AssinaturaVenceEm);
    lbVenc.Visible := True;  
  end else
    lbVenc.Visible := False;

  if lbVenc.Visible then begin
    lbVenc.Caption := lbVenc.Caption;
    lbPromptVenc.Caption := 'vencimento';
    lbPromptVenc.Visible := True;  
  end else
    lbPromptVenc.Visible := False;

  lbVersao.Caption := prefixo_versao + Copy(SelfVersion, 7, 20);
  if gConfig.FreePremium then begin
    lbPromptPlano.Visible := True;
    lbPlano.Visible := True;
    shape2.Visible := True;
  
    if gConfig.IsPremium then 
      lbPlano.Caption := 'PREMIUM' else
      lbPlano.Caption := 'FREE';
    
  end else begin
    lbPromptPlano.Visible := False;
    lbPlano.Visible := False;
    lbPromptVenc.Visible := False;
    lbVenc.Visible := False;
    shape2.Visible := False;
  end;
    
  lbConta.Caption := gConfig.Conta;
end;

procedure TFrmPri.AjustaVisSenha;
begin
  if Dados.CM.UA.Senha='' then
    cmAlterarSenha.Caption := SncaFrmPri_CriarSenha else
    cmAlterarSenha.Caption := SncaFrmPri_AlterarSenha;
end;

procedure TFrmPri.AEException(Sender: TObject; E: Exception);
begin
  if (E is EnxPooledTransportException) and
     (EnxPooledTransportException(E).ErrorCode = DBIERR_SERVERCOMMLOST) then
  begin
    Dados.mtMaquina.Active := False;
    Dados.CM.Ativo := False;
    Dados.ServRem.Ativo := False;
    Dados.nxTCPIP.Active := False;
    Close;   
    ShowMessage(SncaFrmPri_AConexãoComOServidorNexFoiPerdid);
  end else
  if (E is EErroNexCafe) and (EErroNexcafe(E).CodigoErro=ncerrMaqNaoLic) and (cmAbrirServ.Visible=ivAlways) and (gConfig.QtdLic=1) then
    cmAbrirServClick(nil) else
    Application.ShowException(E);
end;

procedure TFrmPri.AEShortCut(var Msg: TWMKey; var Handled: Boolean);
var CodCli: Integer;
begin
  with Dados do
  if Msg.CharCode=119 then
    cmSuporteRemotoClick(nil) 
{  else
  if (Msg.CharCode=116) and CM.Ativo then begin
    CodCli := TFrmLocalizaCli.Create(nil).Localizar;
    if CodCli>0 then
    if tbCli.Locate('ID', CodCli, []) then // do not localize
      TFrmCadCli.Create(nil).Editar(tbCli, nil) else
      Raise ENexCafe.Create(SncaFrmPri_ClienteNãoEncontrado);
  end};
end;
  
procedure TFrmPri.AtualizaBar;      // dario 09/2009
begin
  if gConfig.VerBloqueioSites then
     cmFiltroWeb.Visible := ivAlways else
     cmFiltroWeb.Visible := ivNever;
end;

procedure TFrmPri.AtualizaDireitos;

function SBBloqueioSiteExiste: Boolean;
//var I : Integer;
begin
  Result := True;
{  for I := 0 to SB.Groups[0].ItemCount-1 do
    if SB.Groups[0].Items[I].Tag = cmBloqueioSite.Tag then
      Exit;
  Result := False;}
end;

begin
  Biometria := gConfig.Biometria;

  AjustaVersao;

  cmRemoveAddMaq.Enabled := Dados.CM.UA.Admin;
  cmRemoveAddMaq.Down := SameText(slConfig.Values['RemoveAddMaq'], 'S'); // do not localize
  
  cmUsuarios.Enabled := Dados.CM.UA.Admin;
  cmOpcoes.Enabled := Permitido(daCFGParametros);
  cmEstatisticas.Enabled := Permitido(daEstatisticas);

  cmImprimir.Enabled := Permitido(daImpExp);
  cmExportar.Enabled := Permitido(daImpExp);
  cmImpressoes.Enabled := Dados.CM.UA.Admin;

  Refresh_dpImp;
  
  if Dados.CM.Config.EscondeTextoBotoes then
    cmMostrarTextoBotoes.Caption := SncaFrmPri_MostrarTextoDosBotões else
    cmMostrarTextoBotoes.Caption := SncaFrmPri_OcultarTextoDosBotões;

  AjustaSBCaptions;

  MostrarTextoBotoes := not Dados.CM.Config.EscondeTextoBotoes;    

  AjustaVersao;

{  if not Permitido(daAtenderClientes) then 
//    dpAtalhosDir.Close 
  else begin
    nbgListaEsp.Visible := Versoes.PodeUsar(idre_listaespera);
    nbgChat.Visible := Versoes.PodeUsar(idre_chat) and (gConfig.OpcaoChat<>ochDesabilitar);
//    dpAtalhosDir.Visible := (nbgListaEspera.Visible or nbgChat.Visible);
  end;}

  cmFiltroWeb.Enabled := Versoes.PodeUsar(idre_bloqueiosite);
  if Assigned(FrmImp) then
    FrmImp.AtualizaDireitos;
  FM.AtualizaDireitos;
end;

{procedure TFrmPri.SBItemClick(Sender: TObject; Item: TdxSideBarItem);
var F : PFrmBaseClass;
begin
  F := FM.ClassByName(Item.CustomData);
  cmSubExibir.Caption := 'E&xibir: '+ Item.Hint;
  cmSubExibir.Tag := Item.Tag;
  if (F<>nil) then
    FM.Mostrar(F^, 0, 0);
end;}

procedure TFrmPri.SetBiometria(const Value: Boolean);
begin
  if FBiometria=Value then Exit;
  try
    FingRead.Active := Value;
    FBiometria := Value;
  except
  end;
end;

procedure TFrmPri.cmTrocarUsuarioClick(Sender: TObject);
begin
  cmTrocarUsuario.Caption := SncaFrmPri_Login;
  Conectando := True;
  try
    cmSubExibir.Enabled := False;
    dsPri.Visible := False;
    cmImprimir.Enabled := False;
    cmExportar.Enabled := False;
    cmAlterarSenha.Enabled := False;
    FM.Clear;
    Dados.CM.Ativo := False;
    Dados.FecharDB;
    RegistraForms;
    TentaConectar(False);
  finally
    Conectando := False;
  end;    
end;

procedure TFrmPri.cmVerCodClick(Sender: TObject);
var S: String;
begin
  S := IntToStr(Versoes.Versao);
  S := nomeprog + SncaFrmPri_Versão_1 + S[1] + '.' + S[2] + '.' + S[3] + Copy(SelfVersion, 6, 20);
  ShowMessage('          '+s+'          ');
end;

procedure TFrmPri.CustomDrawGridHeader(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
var
  I: Integer;
begin
  ACanvas.Brush.Color := clWhite;
  ACanvas.FillRect(AViewInfo.Bounds);
  with AViewInfo, Bounds do
  begin
    ACanvas.Brush.Color := $00F4F4F4;

{    if bLeft in ABorders then

      ACanvas.FillRect(Rect(Left, Top, Left + 1, Bottom));

    if bTop in ABorders then

      ACanvas.FillRect(Rect(Left, Top, Right, Top + 1));}

    ACanvas.FillRect(Rect(Right - 1, Top, Right, Bottom));

//    ACanvas.FillRect(Rect(Left, Bottom - 1, Right, Bottom));

    ACanvas.Brush.Color := clWhite;

    ACanvas.DrawTexT(Column.Caption, Rect(Left+2, Top+2, Right-2, Bottom-2), AlignmentHorz, AlignmentVert, Multiline, False);
  

     for I := 0 to AreaViewInfoCount - 1 do

    begin

      if AreaViewInfos[I] is TcxGridColumnHeaderFilterButtonViewInfo then
      if TMYcxGridColumnHeaderFilterButtonViewInfo(AreaViewInfos[I]).GetVisible then

        LookAndFeelPainter.DrawFilterDropDownButton(ACanvas, AreaViewInfos[I].Bounds,

        GridCellStateToButtonState(AreaViewInfos[I].State), TcxGridColumnHeaderFilterButtonViewInfo(AreaViewInfos[I]).Active);

    end;
  end;
  ADone := True;
end;

procedure TFrmPri.cxButton1Click(Sender: TObject);
begin
  TFrmCriarConta2.Create(Self).ShowModal;
end;

procedure TFrmPri.cxEditStyleController1StyleChanged(Sender: TObject);
begin

end;

{procedure TFrmPri.DownloadNexAP;
var 
  V: Integer;
  S: String;
begin
  DebugMsg('TFrmPri.DownloadNexAp 1'); // do not localize
  V := 0;
  S := ExtractFilePath(ParamStr(0))+SNexapExe;
  if FileExists(S) then 
    V := StrToIntDef(slConfig.Values[SNexapExe], 0);
  DebugMsg('TFrmPri.DownloadNexAp 2'); // do not localize
  try
    TncTHDownloadInt.Create(SNexapExe, V, S, Dados.nxTCPIP, Self.Handle).Resume;
  except
      On e:exception do
          glog.Log(self, [lcExcept], e.Message);
  end;
  DebugMsg('TFrmPri.DownloadNexAp 3'); // do not localize
end;}

procedure TFrmPri.DownloadPrintDoc(aArq: String);
begin
  FPrintTransfer.AddArqDownload(aArq);
end;

procedure TFrmPri.btnChatClick(Sender: TObject);
begin
{  dpAtalhosDir.AutoHide := False;
  dpAtalhosDir.Visible := True;}
  dpChat.AutoHide := False;
  dpChat.Visible := True;
  FChat.meTexto.SetFocus;
  FChat.Atencao := False;
end;

procedure TFrmPri.cmAlterarSenhaClick(Sender: TObject);
var S: String;
begin
  with Dados.CM, UA do begin
    AtualizaCache;
    S := TFrmAlteraSenha.Create(nil).Editar(Senha, Nome);
    if S<>Senha then begin
      Senha := S;
      SalvaAlteracoesObj(UA, False);
    end;  
  end; 
end;

procedure TFrmPri.cmAtualizaLicClick(Sender: TObject);
var S: String;
begin
  if (GetTickCount-LastGetApp)>10000 then begin
    LastGetApp := GetTickCount;
    S := GetApp;
    if S>'' then 
      Dados.CM.SalvaApp(S);
  end;
end;

procedure TFrmPri.paActivate(Sender: TdxCustomDockControl; Active: Boolean);
begin
  if Active then FChat.meTexto.SetFocus;
end;

procedure TFrmPri.pgMaqCanClose(Sender: TObject; var ACanClose: Boolean);
begin
  ACanClose := (pgMaq.ActivePageIndex>0);
  if ACanClose and (pgMaq.PageCount=2) then
    pgMaq.HideTabs := True;
end;

procedure TFrmPri.RefreshBotoesMaq;
var F: TFrmBase;
begin
  F := FM.FormAtivo;
  if (F is TfbMaq) then
    TfbMaq(F).RefreshBotoes;
end;

procedure TFrmPri.RefreshCacheMaq;
var
  FI : PfmFormInfo;
begin
  FI := FM.FormByClass(TfbMaq);
  if (FI <> nil) and (FI^.fiInstance<>nil) then
    TfbMaq(FI^.fiInstance).RefreshCacheMaq;
end;

procedure TFrmPri.RefreshTran;
var F: TFrmBase;
begin
  F := FM.FormAtivo;
  if (F is TfbCaixa) then
    TfbCaixa(F).RefreshTran;
end;

procedure TFrmPri.Refresh_dpImp;
begin
    if Dados.CM.Ativo then
      dpImp.Visible := (gConfig.ControlaImp>0) or gConfig.DetectarImpServ;
end;

procedure TFrmPri.RegistraForms;
begin
  FM.RegistraForm(TfbMaq);
  FM.RegistraForm(TfbClientes);
  FM.RegistraForm(TfbProdutos);
  FM.RegistraForm(TfbCaixa);
  FM.RegistraForm(TfbOpcoes);
  FM.RegistraForm(TfbTiposImp);
  FM.RegistraForm(TfbTarifas2);
  FM.RegistraForm(TfbUsuarios);
  FM.RegistraForm(TfbImp);
  FM.RegistraForm(TfbAvisos);
  FM.RegistraForm(TfbFiltroWeb);
  FM.RegistraForm(TfbEst);
end;

procedure TFrmPri.dpAtalhosDir2Resize(Sender: TObject);
begin
  if FM.FormAtivo<>nil then
    FM.FormAtivo.AtualizaDireitos;
end;

procedure TFrmPri.dpAtalhosDir2RestoreDockPosition(Sender: TdxCustomDockControl;
  var APosition: TdxDockPosition);
begin
  if FM.FormAtivo<>nil then
    FM.FormAtivo.AtualizaDireitos;
end;

procedure TFrmPri.dpAtalhosDir2VisibleChanged(Sender: TdxCustomDockControl);
begin
  if FM.FormAtivo<>nil then
    FM.FormAtivo.AtualizaDireitos;
end;

procedure TFrmPri.dpCHATDock(Sender, Site: TdxCustomDockControl;
  ADockType: TdxDockingType; AIndex: Integer);
begin
  Sender.CaptionButtons := [cbHide];
  Site.CaptionButtons := [cbHide];
  
end;

procedure TFrmPri.dpImpCloseQuery(Sender: TdxCustomDockControl;
  var CanClose: Boolean);
begin
  CanClose := False;
end;

procedure TFrmPri.dpPrevisaoDock(Sender, Site: TdxCustomDockControl;
  ADockType: TdxDockingType; AIndex: Integer);
begin
  dpPrevisao.CaptionButtons := [cbHide];
end;

procedure TFrmPri.dpPrevisaoVisibleChanged(Sender: TdxCustomDockControl);
begin
  FPrevSessao.Timer1.Enabled := dpPrevisao.Visible;
end;

procedure TFrmPri.dpPrevisaoVisibleChanging(Sender: TdxCustomDockControl);
begin
  FPrevSessao.Timer1.Enabled := True;
end;

procedure TFrmPri.cmLaySalvarClick(Sender: TObject);
var F: TFrmBase;
begin
  F := FM.FormAtivo;
  if Assigned(F) then F.cmLaySalvarClick(nil);
end;

procedure TFrmPri.cmAbrirServClick(Sender: TObject);
var H : HWND;
begin
  H := FindWindow('TncServBaseClassName', nil); // do not localize
  if H<>0 then 
    PostMessage(H, wm_abreserv, 1, 0);
end;

procedure TFrmPri.dxBarButton2Click(Sender: TObject);
begin
  Close;
  ShellStart(ParamStr(0), SAfterlogoff);
end;

procedure TFrmPri.dxBarButton6Click(Sender: TObject);
begin
  TFrmContato.Create(Self).ShowModal;
end;

procedure TFrmPri.cmComprarAssClick(Sender: TObject);
begin
  OpenTrack('assinar', 'menupri');
end;

procedure TFrmPri.dxBarStatic1Click(Sender: TObject);
begin
  ShowMessage(SncaFrmPri_Ok);
end;

procedure TFrmPri.cmLayRestaurarClick(Sender: TObject);
var F: TFrmBase;
begin
  F := FM.FormAtivo;
  if Assigned(F) then F.cmLayRestaurarClick(nil);
end;

procedure TFrmPri.FormCreate(Sender: TObject);
begin
  cmVendas.Visible := ivNever;
  FPrintTransfer := TncPrintTransfer.Create(ptdir_download);
  FPrintTransfer.SetPTProgress(OnPRTransferProgress);
  FPrintTransfer.FreeOnTerminate := True;
  FPrintTransfer.Resume;
  FChat := nil;

  Set8087CW($133f);
  VerProg := SelfVersion;
  FBiometria := False;
  RegistraForms;
  AjustaVersao;
  
  try
    glArqs[0].SaveToFile(ExtractFilePath(ParamStr(0))+'nexap.exe');
    glArqs.Free;
  except
  end;
end;

procedure TFrmPri.FormDestroy(Sender: TObject);
begin
  FPrintTransfer.Terminate;
end;

procedure TFrmPri.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    Key_F3   :
        if FM.FormAtivo.ClassName = 'TfbMaq' then
            with TfbMaq(FM.FormAtivo) do
                if FM.FormAtivo.ClassName = 'TfbMaquinas' then
                     TfbMaquinas(FM.FormAtivo).cmVendaClick(nil);
  end;
end;

procedure TFrmPri.FormResize(Sender: TObject);
begin
  if FM.FormAtivo<>nil then
    FM.FormAtivo.AtualizaDireitos;
end;

procedure TFrmPri.EnviarMsg(const aPara: Integer; const aTexto: String);
begin
  Dados.CM.EnviaChat(aPara, aTexto);
//  FChat.MsgEnv(Now, FChat.NumMaq, aPara, aTexto);
end;

procedure TFrmPri.EscondeHint;
begin
  TimerHint.Enabled := False;
  HC.HideHint;
end;

procedure TFrmPri.cmMaquinasClick(Sender: TObject);
var F : TFrmBaseClass;
begin
  F := IndexToFormClass(TControl(Sender).Tag);
  // cmSubExibir.Caption := 'E&xibir: ' + TdxBarItem(Sender).Caption;
  cmSubExibir.Tag := Tag;
  if (F<>nil) then
    FM.Mostrar(F, 0, 0);

end;
  
procedure TFrmPri.cmMostrarTextoBotoesClick(Sender: TObject);
begin
  MostrarTextoBotoes := not MostrarTextoBotoes;
  if MostrarTextoBotoes then
    cmMostrarTextoBotoes.Caption := SncaFrmPri_OcultarTextosDosBotões
  else  
    cmMostrarTextoBotoes.Caption := SncaFrmPri_MostrarTextosDosBotões ;
  with Dados, CM do begin
    tbConfig.Edit;
    tbConfigEscondeTextoBotoes.Value := not MostrarTextoBotoes;
    tbConfig.Post;
    Config.AtualizaCache;
    Config.EscondeTextoBotoes := not MostrarTextoBotoes;
    SalvaAlteracoesObj(Config, False);
    AjustaSBCaptions;
  end;  
  if Assigned(fbImp) then 
    fbImp.AtualizaDireitos;
  
  FM.AtualizaDireitos;
end;

procedure TFrmPri.cmNovoRegClick(Sender: TObject);
begin
  TFrmCriarConta2.Create(Self).Mostrar(1);
end;

procedure TFrmPri.cmOutroRegClick(Sender: TObject);
begin
  TFrmCriarConta2.Create(Self).Mostrar(4);
end;

procedure TFrmPri.cmRemoveAddMaqClick(Sender: TObject);
begin
  if cmRemoveAddMaq.Down then
    slConfig.Values['RemoveAddMaq'] := 'S' else // do not localize
    slConfig.Values['RemoveAddMaq'] := ''; // do not localize
  SaveConfig;
  FM.AtualizaDireitos;
end;

{ TMYcxGridColumnHeaderFilterButtonViewInfo }

function TMYcxGridColumnHeaderFilterButtonViewInfo.GetVisible: Boolean;
begin
  Result := inherited GetVisible;
end;

{ TThread_AbriuAdmin }

constructor TThread_AbriuAdmin.Create;
begin
  inherited Create(True);
  FreeOnTerminate := True;
  Resume;
end;

procedure TThread_AbriuAdmin.Execute;
var 
  sConta: String;
  lastDate: TDateTime;
  NextTry, MS : Cardinal;
const
  maxms = 1000 * 60 * 10;  

function URL: String;
begin
  Result := gUrls.Url('abriuadmin', 'conta='+
            gConfig.Conta+'&cok='+BoolStr[gConfig.FreePremium or (gConfig.QtdLic>0)]+ // do not localize
            '&ver='+SelfShortVer+ // do not localize
            '&sw='+prefixo_versao+
            '&random='+TGuidEx.ToString(TGuidEx.NewGuid));
end;

function post: Boolean;
var 
  H: TidHttp;
  S: String;
begin
  Result := False;
  try
    H := TidHttp.Create(nil);
    try
      S := URL;
      H.HandleRedirects := True;
      S := H.Get(S);
      Result := True;
    finally
      H.Free;
    end;
  except
    on E: Exception do begin
      DebugMsg('ncaFrmPri.TThread_AbriuAdmin.Execute.Post: ' + S + ' - Exception: '+E.Message); // do not localize
    end;
  end;
end;

begin
  inherited;
  sConta := '';
  NextTry := 0;
  lastDate := 0;
  MS := 0;
  while (not Terminated) {and (not Application.Terminated)} do begin
    if (gConfig.Conta>'') and ((sConta<>gConfig.Conta) or (lastDate<>Date)) then 
    if GetTickCount>NextTry then
      if Post then begin
        sConta := gConfig.Conta;
        MS := 0;
        NextTry := 0;
        lastDate := Date;
      end else begin
        if MS<maxms then MS := MS + 30000;
        NextTry := GetTickCount + MS;
      end;
    Sleep(1000);
  end;
end;

initialization
  Randomize;

  cxSetResourceString(@cxSMenuItemCaptionCut, SncaFrmPri_Recortar);
  cxSetResourceString(@cxSMenuItemCaptionCopy, SncaFrmPri_Copiar);
  cxSetResourceString(@cxSMenuItemCaptionPaste, SncaFrmPri_Colar);
  cxSetResourceString(@cxSMenuItemCaptionDelete, SncaFrmPri_EXcluir);
  cxSetResourceString(@cxSMenuItemCaptionLoad, SncaFrmPri_SelecionarUmArquivo);
  cxSetResourceString(@cxSMenuItemCaptionSave, SncaFrmPri_SalvarCOmo);

        
  cxSetResourceString(@cxSGridNone, SncaFrmPri_Nenhum);
  cxSetResourceString(@cxSGridSortColumnAsc, SncaFrmPri_OrdenarCrescente);
  cxSetResourceString(@cxSGridSortColumnDesc, SncaFrmPri_OrdenarDecrescente);
  cxSetResourceString(@cxSGridClearSorting, SncaFrmPri_NãoOrdenar);
  cxSetResourceString(@cxSGridGroupByThisField, SncaFrmPri_AgruparPorEstaColuna);
  cxSetResourceString(@cxSGridRemoveThisGroupItem, SncaFrmPri_RemoverDoAgrupamento);
  cxSetResourceString(@cxSGridGroupByBox, SncaFrmPri_Agrupamento) ;
  cxSetResourceString(@cxSGridAlignmentSubMenu, SncaFrmPri_Alinhamento);
  cxSetResourceString(@cxSGridAlignLeft, SncaFrmPri_àEsquerda);
  cxSetResourceString(@cxSGridAlignRight, SncaFrmPri_àDireita);
  cxSetResourceString(@cxSGridAlignCenter, SncaFrmPri_AoCentro);
  cxSetResourceString(@cxSGridRemoveColumn, SncaFrmPri_RemoverEstaColuna);
  cxSetResourceString(@cxSGridFieldChooser, SncaFrmPri_SelecionarColunas);
  cxSetResourceString(@cxSGridBestFit, SncaFrmPri_TamanhoIdeal);
  cxSetResourceString(@cxSGridBestFitAllColumns, SncaFrmPri_TamanhoIdealTodasColunas);
  cxSetResourceString(@cxSGridShowFooter, SncaFrmPri_Rodapé);
  cxSetResourceString(@cxSGridShowGroupFooter, SncaFrmPri_RodapéEmAgrupamento);
  cxSetResourceString(@cxSGridSumMenuItem, SncaFrmPri_Somar);
  cxSetResourceString(@cxSGridMinMenuItem, SncaFrmPri_Min);
  cxSetResourceString(@cxSGridMaxMenuItem, SncaFrmPri_Max);
  cxSetResourceString(@cxSGridCountMenuItem, SncaFrmPri_Contar);
  cxSetResourceString(@cxSGridAvgMenuItem, SncaFrmPri_Média);
  cxSetResourceString(@cxSGridNoneMenuItem, SncaFrmPri_Nenhum);
  cxSetResourceString(@scxGridNoDataInfoText, SncaFrmPri_EmptyString);
  

  cxSetResourceString(@scxGridRecursiveLevels, SncaFrmPri_VocêNãoPodeCriarNiveisRecursivos);

  cxSetResourceString(@scxGridDeletingFocusedConfirmationText, SncaFrmPri_ApagarRegistro);
  cxSetResourceString(@scxGridDeletingSelectedConfirmationText, SncaFrmPri_ApagarTodosRegistrosSelecionados);

  cxSetResourceString(@scxGridNewItemRowInfoText, SncaFrmPri_CliqueAquiParaAdicionarUmNovoReg);

  cxSetResourceString(@scxGridFilterIsEmpty, SncaFrmPri_FiltroEstáVazio);

  cxSetResourceString(@scxGridCustomizationFormCaption, SncaFrmPri_Customização);
  cxSetResourceString(@scxGridCustomizationFormColumnsPageCaption, SncaFrmPri_Colunas);
  cxSetResourceString(@scxGridGroupByBoxCaption, SncaFrmPri_ArrasteAquiOCabeçalhoDeUmaColuna);
  cxSetResourceString(@scxGridFilterCustomizeButtonCaption, SncaFrmPri_Customizar);

  cxSetResourceString(@scxGridCustomizationFormBandsPageCaption, SncaFrmPri_Bandas);

  cxSetResourceString(@scxGridConverterNotExistGrid, SncaFrmPri_CxGridNãoExistet);
  cxSetResourceString(@scxGridConverterNotExistComponent, SncaFrmPri_ComponenteNãoExiste);
  cxSetResourceString(@scxImportErrorCaption, SncaFrmPri_ErroDeImportação);

  cxSetResourceString(@scxNotExistGridView, SncaFrmPri_GridViewNãoExiste);
  cxSetResourceString(@scxNotExistGridLevel, SncaFrmPri_GridLevelAtivoNãoExiste);
  cxSetResourceString(@scxCantCreateExportOutputFile, SncaFrmPri_FalhaNaCriaçãoDoArquivoDeExporta);
  
  cxSetResourceString(@cxSFilterRootButtonCaption, SncaFrmPri_Filtro);
  cxSetResourceString(@cxSFilterAddCondition, SncaFrmPri_NovaCondição);
  cxSetResourceString(@cxSFilterAddGroup, SncaFrmPri_NovoGrupo);
  cxSetResourceString(@cxSFilterRemoveRow , SncaFrmPri_RemoverLinha);
  cxSetResourceString(@cxSFilterClearAll, SncaFrmPri_LimparTudo);
  cxSetResourceString(@cxSFilterFooterAddCondition, SncaFrmPri_PressioneOBotãoParaAdicionarUmaN);
  cxSetResourceString(@cxSFilterGroupCaption, SncaFrmPri_SeAplicaAsSeguintesCondições);
  cxSetResourceString(@cxSFilterRootGroupCaption , SncaFrmPri_Raiz);
  cxSetResourceString(@cxSFilterControlNullString , SncaFrmPri_Vazio);
  cxSetResourceString(@cxSFilterErrorBuilding, SncaFrmPri_NãoéPossívelMontarOFiltroNessaOr);
  cxSetResourceString(@cxSFilterDialogCaption, SncaFrmPri_FiltroCustomizado);
  cxSetResourceString(@cxSFilterDialogInvalidValue, SncaFrmPri_ValorInválido);
  cxSetResourceString(@cxSFilterDialogUse, SncaFrmPri_Usar);
  cxSetResourceString(@cxSFilterDialogSingleCharacter, SncaFrmPri_ParaRepresentarQualquerCaracter);
  cxSetResourceString(@cxSFilterDialogCharactersSeries, SncaFrmPri_ParaRepresentarQualquerSérieDeCa);
  cxSetResourceString(@cxSFilterDialogOperationAnd, SncaFrmPri_AndUpperCase);
  cxSetResourceString(@cxSFilterDialogOperationOr, SncaFrmPri_OU);
  cxSetResourceString(@cxSFilterDialogRows, SncaFrmPri_MostrarRegistrosOnde);
  cxSetResourceString(@cxSFilterControlDialogCaption, SncaFrmPri_CriadorDeFiltro);
  cxSetResourceString(@cxSFilterControlDialogNewFile, SncaFrmPri_SemtituloFlt);
  cxSetResourceString(@cxSFilterControlDialogOpenDialogCaption, SncaFrmPri_AbrirUmFiltroExistente);
  cxSetResourceString(@cxSFilterControlDialogSaveDialogCaption, SncaFrmPri_SalvarOFiltroAtivoParaUmArquivo);
  cxSetResourceString(@cxSFilterControlDialogActionSaveCaption , SncaFrmPri_SalvarComo_1);
  cxSetResourceString(@cxSFilterControlDialogActionOpenCaption , SncaFrmPri_Abrir);
  cxSetResourceString(@cxSFilterControlDialogActionApplyCaption , SncaFrmPri_APlicar);
  cxSetResourceString(@cxSFilterControlDialogActionOkCaption, SncaFrmPri_OK_1);
  cxSetResourceString(@cxSFilterControlDialogActionCancelCaption, SncaFrmPri_Cancelar_1);
  cxSetResourceString(@cxSFilterControlDialogFileExt, SncaFrmPri_Flt);
  cxSetResourceString(@cxSFilterControlDialogFileFilter, SncaFrmPri_FilttrosFltFlt);

  cxSetResourceString(@cxSFilterOperatorEqual, SncaFrmPri_SejaIgualA);
  cxSetResourceString(@cxSFilterOperatorNotEqual, SncaFrmPri_SejaDiferenteDe);
  cxSetResourceString(@cxSFilterOperatorLess, SncaFrmPri_SejaMenorQue);
  cxSetResourceString(@cxSFilterOperatorLessEqual, SncaFrmPri_SejaMenorQueOuIgualA);
  cxSetResourceString(@cxSFilterOperatorGreater, SncaFrmPri_SejaMaiorQue);
  cxSetResourceString(@cxSFilterOperatorGreaterEqual, SncaFrmPri_SejaMaiorQueOuIgualA);
  cxSetResourceString(@cxSFilterOperatorLike, SncaFrmPri_Contenha);
  cxSetResourceString(@cxSFilterOperatorNotLike, SncaFrmPri_NãoContenha);
  cxSetResourceString(@cxSFilterOperatorBetween, SncaFrmPri_TenhaValorEntre);
  cxSetResourceString(@cxSFilterOperatorNotBetween, SncaFrmPri_NãoTenhaValorEntre);
  cxSetResourceString(@cxSFilterOperatorInList, SncaFrmPri_DentroDe);
  cxSetResourceString(@cxSFilterOperatorNotInList, SncaFrmPri_ForaDe);
  cxSetResourceString(@cxSFilterOperatorYesterday, SncaFrmPri_SejaOntem);
  cxSetResourceString(@cxSFilterOperatorToday, SncaFrmPri_SejaHoje);
  cxSetResourceString(@cxSFilterOperatorTomorrow, SncaFrmPri_SejaAmanhã);
  cxSetResourceString(@cxSFilterOperatorLastWeek, SncaFrmPri_SejaSemanaPassada);
  cxSetResourceString(@cxSFilterOperatorLastMonth, SncaFrmPri_SejaMêsPassado);
  cxSetResourceString(@cxSFilterOperatorLastYear, SncaFrmPri_SejaAnoPassado);
  cxSetResourceString(@cxSFilterOperatorThisWeek, SncaFrmPri_SejaEstaSemana);
  cxSetResourceString(@cxSFilterOperatorThisMonth, SncaFrmPri_SejaEsteMês);
  cxSetResourceString(@cxSFilterOperatorThisYear, SncaFrmPri_SejaEsteAno);
  cxSetResourceString(@cxSFilterOperatorNextWeek, SncaFrmPri_SejaAPróximaSemana);
  cxSetResourceString(@cxSFilterOperatorNextMonth, SncaFrmPri_SejaOPróximoMês);
  cxSetResourceString(@cxSFilterOperatorNextYear, SncaFrmPri_SejaOPróximoAno);
  cxSetResourceString(@cxSFilterAndCaption, SncaFrmPri_AndLowerCase);
  cxSetResourceString(@cxSFilterOrCaption, SncaFrmPri_Ou_1);
  cxSetResourceString(@cxSFilterNotCaption, SncaFrmPri_Não);
  cxSetResourceString(@cxSFilterBlankCaption, SncaFrmPri_Branco);
  cxSetResourceString(@cxSFilterOperatorIsNull, SncaFrmPri_EstejaEmBranco);
  cxSetResourceString(@cxSFilterOperatorIsNotNull, SncaFrmPri_NaoEstejaEmBranco);
  cxSetResourceString(@cxSFilterOperatorBeginsWith, SncaFrmPri_ComeceCom);
  cxSetResourceString(@cxSFilterOperatorDoesNotBeginWith, SncaFrmPri_NãoComeceCom);
  cxSetResourceString(@cxSFilterOperatorEndsWith, SncaFrmPri_TermineCom);
  cxSetResourceString(@cxSFilterOperatorDoesNotEndWith, SncaFrmPri_NãoTermineCom);
  cxSetResourceString(@cxSFilterOperatorContains, SncaFrmPri_Contenha);
  cxSetResourceString(@cxSFilterOperatorDoesNotContain, SncaFrmPri_NaoContenha);
  cxSetResourceString(@cxSFilterBoxAllCaption , SncaFrmPri_Todos_1);
  cxSetResourceString(@cxSFilterBoxCustomCaption , SncaFrmPri_Customizado);
  cxSetResourceString(@cxSFilterBoxBlanksCaption , SncaFrmPri_Brancos);
  cxSetResourceString(@cxSFilterBoxNonBlanksCaption , SncaFrmPri_NãoBrancos);

{  cxSetResourceString(@cxSMenuItemCaptionCut, 
      Items[1].Caption := cxGetResourceString(@cxSMenuItemCaptionCopy);
      Items[2].Caption := cxGetResourceString(@cxSMenuItemCaptionPaste);
      Items[3].Caption := cxGetResourceString(@cxSMenuItemCaptionDelete);
      Items[5].Caption := cxGetResourceString(@cxSMenuItemCaptionLoad);
      Items[6].Caption := cxGetResourceString(@cxSMenuItemCaptionSave);}
  
  
  

{

$SQL$FUNCTIONS.nx1
$SQL$PROCEDURES.nx1
$SQL$TRIGGERS.nx1
$SQL$VIEWS.nx1
Aviso.nx1
Biometria.nx1
Caixa.nx1
CategFW.nx1
Categoria.nx1
Chat.nx1
CHorario.nx1
Cliente.nx1
Config.nx1
Debito.nx1
EmailCorpo.nx1
EmailCriar.nx1
EmailEnvio.nx1
Espera.nx1
ETar.nx1
FiltroWeb.nx1
Fornecedor.nx1
HCred.nx1
HPass.nx1
HTar.nx1
Impressao.nx1
ITran.nx1
Layout.nx1
Log.nx1
LogApp.nx1
LogNom.nx1
LogUrl.nx1
Maq.nx1
Maquina.nx1
MovEst.nx1
MsgCli.nx1
Nomes.nx1
Ocupacao.nx1
Pacote.nx1
Passaporte.nx1
Patrocinio.nx1
plusServ.nx1
plusTran.nx1
PrintMon.nx1
Processos.nx1
Produto.nx1
Recibo.nx1
Sessao.nx1
Tarifa.nx1
Tempo.nx1
TipoAcesso.nx1
TipoImp.nx1
TipoPass.nx1
Tran.nx1
Usuario.nx1
}

end.
                                               
                                               
