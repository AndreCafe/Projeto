unit ncaFrmPri;

interface

{$I nex.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
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
  ncFrmChat, ncafbPrevSessao, ShellApi,
  AppEvnts, ncClassesBase,
  LMDWaveComp, GrFingerComp, LMDBaseGraphicControl, 
  cxLookAndFeels, LMDSysInfo, dxNavBarCollns, dxNavBarBase,
  dxNavBar,
  dxNavBarStyles, LMDPNGImage,
  LMDSimplePanel, dxLayoutLookAndFeels, rtcInfo, rtcConn,
  rtcDataCli, rtcHttpCli, EmbeddedWB, cxPCdxBarPopupMenu, dxScreenTip,
  dxCustomHint, Menus, ncPRTransfer, ncThreadedDownload,
  ncafbRevisarProduto, LMDGlobalHotKey;


const
  wm_atualizaadesoes = wm_user + 200;
  kTimerRevisarCadProdutoInterval = 10000;
  
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
    btnChat: TLMDSpeedButton;
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
    cmClientes: TdxBarLargeButton;
    cmProdutos: TdxBarLargeButton;
    cmCaixa: TdxBarLargeButton;
    cmUsuarios: TdxBarLargeButton;
    cxStyle31: TcxStyle;
    dxBarDockControl2: TdxBarDockControl;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cmEstatisticas: TdxBarLargeButton;
    Timer1: TTimer;
    Timer2: TTimer;
    TimerChat: TTimer;
    TimerHint: TTimer;
    TimerPlusUpdateAll: TTimer;
    TimerFirewall: TTimer;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    dxBarLargeButton1: TdxBarLargeButton;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    panPremium: TLMDSimplePanel;
    LMDSimplePanel1: TLMDSimplePanel;
    btnAss: TLMDSpeedButton;
    cmAbrirServ: TdxBarButton;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    lfPadrao: TdxLayoutStandardLookAndFeel;
    dxBarButton2: TdxBarButton;
    cxStyle44: TcxStyle;
    logos_plus: TcxImageList;
    cxStyle45: TcxStyle;
    dxBarButton7: TdxBarButton;
    cmVerCod: TdxBarButton;
    cmComprarAss: TdxBarButton;
    cxStyle46: TcxStyle;
    cmVendas: TdxBarLargeButton;
    cxStyle47: TcxStyle;
    cmFornecedores: TdxBarLargeButton;
    cmDebitos: TdxBarLargeButton;
    dpRevisarProduto: TdxDockPanel;
    dxLayoutDockSite4: TdxLayoutDockSite;
    TimerRevisarCadProduto: TTimer;
    cxEditStyleControllerTahoma10: TcxEditStyleController;
    dxBarButton5: TdxBarButton;
    cxStyle48: TcxStyle;
    styleSelecionado: TcxStyle;
    cxStyle49: TcxStyle;
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
    procedure dxBarStatic1Click(Sender: TObject);
    procedure dpCHATDock(Sender, Site: TdxCustomDockControl;
      ADockType: TdxDockingType; AIndex: Integer);
    procedure dpImpCloseQuery(Sender: TdxCustomDockControl;
      var CanClose: Boolean);
    procedure cmAbrirServClick(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure TimerPlusUpdateAllTimer(Sender: TObject);
    procedure TimerFirewallTimer(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cmComprarAssClick(Sender: TObject);
    procedure cmVerCodClick(Sender: TObject);
    procedure dxBarButton9Click(Sender: TObject);
    procedure TimerRevisarCadProdutoTimer(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure LMDGlobalHotKey1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FRevisarProduto : TfbRevisarProduto;

    FBiometria : Boolean;

    procedure LoadDckMgr;
    procedure SetBiometria(const Value: Boolean);

    procedure OnAjustaRestSpaceTimer(Sender: TObject);
    procedure NewRestSpaceTimer;

    procedure OnTimerAfterLogin(Sender: TObject);
    procedure OnTerminouUpdAll(Sender: TObject);

    procedure OnConfirmouImp(Sender: TObject; aInfo: TStrings);
    procedure OnCancelouImp(Sender: TObject; aInfo: TStrings);

    procedure AjustaBotao(B: TdxBarLargeButton);
    
    procedure AjustaSBCaptions;

    procedure OnFrmSemConta(Sender: TObject);
    procedure OnChecaSenhaMaqs(Sender: TObject);

    procedure OnChecaLimiteAdmin(Sender: TObject);

    procedure wmBiometria(var Msg: TMessage);
      message wm_biometria;

    procedure wmInfoCampanha(var Msg: TMessage);
      message wm_infocampanha;

    procedure wmAtualizaAdesoes(var Msg: TMessage);
      message wm_atualizaadesoes;  

    procedure wmAtualizaDireitosConfig(var Msg: TMessage);
      message wm_atualizadireitosconfig;  

    procedure wmVendaPlus(var Msg: TMessage);
      message wm_vendaplus; 

    procedure wmAbreAba(var Msg: TMessage);
      message wm_abreaba;

    procedure wmDownloadIntInfo(var Msg: TMessage);
      message wm_downloadIntInfo;   
  public
    procedure MakeChatVisible(Sender: TObject);
    procedure AjustaVersao;
    procedure RegistraForms;


    procedure MostraHint(X, Y: Integer; aHeader, aStr: String);
    procedure EscondeHint;

    procedure AjustaRestSpace;

    procedure TentaConectar(Reconexao: Boolean);
    procedure AtualizaDireitos;

    procedure RefreshTran;
    procedure RefreshBotoesMaq;
    procedure RefreshCacheMaq;
    procedure MostrarCaixasAnteriores;
    procedure MostrarCaixaAtual;

    procedure AjustaMsgAssinatura;

    procedure AjustaVisSenha;
    
    function VersaoStr: String;

    procedure AddWebTab(S: String);

    function FocusColor: TColor; 

    procedure UpdateAllPlus;

    procedure refreshRevisarCadProduto(const aForce:boolean=false);

   { Public declarations }

    property Biometria: Boolean
      read FBiometria write SetBiometria;
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

const
  Key_Tab        = 9;
  Key_Ins        = 45;
  Key_Del        = 46;
  Key_Enter      = 13;
  Key_Up         = 38;
  Key_Down       = 40;
  Key_Esc        = 27;
  Key_CtrlN      = $310E;
  Key_F1         = $70;
  Key_F2         = $71;
  Key_F3         = $3D00;
  Key_F4         = $3E00;
  Key_F5         = $3F00;
  Key_F6         = $4000;
  Key_F7         = $4100;
  Key_F8         = $4200;
  Key_F9         = $4300;
  Key_F10        = $4400;
  Key_F11        = $4500;
  Key_F12        = $7B;

implementation

uses
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
  ncafbFornecedores,
  ncafbProdutos, 
  ncafbCaixa, 
  ncIDRecursos,
  cxGridStrs, 
  cxGridPopupMenuConsts,
  cxFilterConsts,
  cxFilterControlStrs,
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
  ncFrmSuporteRem, uWinPopUp, ncaBiometria, ncVersionInfo,
  nxptBasePooledTransport, nxllBde, ncaFrmCadCli,
  ncafbEst, ncaFrmTarifa, ncafbTarifas2, ncaFrmSemConta, ncafbPesqFor,
  ncafbPesqCH, ncaFrmAss, ncShellStart, ncaFrmWebPopup, ncaFrmGetWebTabs,
  ncafbCXLetra, ncaFrmSenhaWiz, ncaFrmQtdMaq, ncaPlusAPI, ncaFrmConta,
  ncaFrmVendaPlus, ncaK, ncCommPlusIndy, ncDebug, ncDMcommPlus, ncaFrmTotal,
  ncaFrmCli, ncafbCHATHist, ncFirewall, 
  ncaFrmCriarConta2, ncaFrmPanTopo, ncaFrmPTProgress, ncPrintDoc, ncPRConsts,
  ncFrmPrintReview, ncPrinterInfo8, ncaFrmImp, ncafbVendas2, uLicEXECryptor,
  ncKiteApi, ncafbVendasTab, ncafbMesas;

{$R *.dfm}

resourcestring
  rsSemConta = 'Antes de testar o sistema é necessário registrar sua loja.';
  rsAtivar = 'Para usar o NEX é necessário confirmar o registro da sua loja.';
  rsOutroHD = 'O registro da sua loja está ativado para outro computador.';
  rsBloqueada = 'O registro da sua loja está bloqueado. Por favor, entre em contato com a equipe NEX!';
  
  

function PremiumOk: Boolean;
begin
  Result := False;
  case gConfig.StatusConta of
    scSemConta : begin
      ShowMessage(rsSemConta);
      TFrmCriarConta2.CreateParented(Application.ActiveFormHandle).ShowModal;
    end;
    scAtivar   : begin
      ShowMessage(rsAtivar);
      TFrmCriarConta2.CreateParented(FrmPri.Handle).Mostrar(3);
      Exit;
    end;
    scOutroHD  : begin
      ShowMessage(rsOutroHD);
      TFrmCriarConta2.CreateParented(FrmPri.Handle).Mostrar(5);
      Exit;
    end;
    scBloqueada : begin
      ShowMessage(rsBloqueada);
      Exit;
    end;
  else
    Result := True;
  end;
end;

function IndexToFormClass(aIndex: Integer): TFrmBaseClass;
begin
  case aIndex of
    0 : Result := TfbVendas2;
    1 : Result := TfbClientes;
    2 : Result := TfbProdutos;
    3 : Result := TfbFornecedores;
    5 : Result := TfbCaixa;
    6 : Result := TfbUsuarios;
    7 : Result := TfbEst;
  end;
end;

function SimNao(S: String): Boolean;
begin
  Result := SimNaoH(S, Application.ActiveFormHandle);
end;                

function SimNaoH(S: String; H : HWND): Boolean;
begin
  Result := (MessageBox(H, PChar(S), 'Atenção',
             MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = IDYES)
end;  

procedure ShowMsg(S: String; aBeep: Boolean = False);
begin
  if aBeep then Beep;
  MessageBox(Application.ActiveFormHandle, PChar(S), 'Atenção',
             MB_OK + MB_ICONINFORMATION + MB_APPLMODAL);
end;

procedure TFrmPri.TentaConectar(Reconexao: Boolean);
begin
  Caption := 'Nex | NexAdmin';

  with TFrmNexLogin.Create(Self) do
  ShowModal;

  if not Dados.CM.Ativo then Exit;


  with TTimer.Create(Self) do begin
    Interval := 1000;
    OnTimer := OnTimerAfterLogin;
    Enabled := True;
  end;

  Caption := 'Nex | NexAdmin | Usuário: ' + Dados.CM.Username + ' | Pasta: ' + ExtractFileDir(ParamStr(0));

//  PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);

  try
      Dados.AbreDB;
  except
      on e:exception do begin
        GShutingdown := true;
        Showmessage('Por favor, verifique versão do servidor.');
        glog.Log(self,[lcExcept],'TentaConectar: ' + e.Message);
        Showmessage('Este programa está sendo encerrado.');
        try                                    
           Dados.CM.Ativo := false;
        except
            on e:exception do begin
                glog.Log(self,[lcExcept],'Dados.CM.Ativo := false: ' + e.Message);
            end;
        end;
        glog.CloseLogFile;
        application.Terminate;
        exit;
      end;
  end;
    
  cmTrocarUsuario.Caption := 'Trocar de Usuário';
  cmSubExibir.Enabled := True;
  dsPri.Visible := True;
  cmImprimir.Enabled := True;
  cmExportar.Enabled := True;

  AjustaVisSenha;

  cmAlterarSenha.Enabled := True;

  FM.Mostrar(TfbVendas2, 0, 0);

end;

procedure TFrmPri.Timer1Timer(Sender: TObject);
begin
  Close;
end;
       
procedure TFrmPri.Timer2Timer(Sender: TObject);
begin
  if not Permitido(daAtenderClientes) then Exit;

  Timer2.Enabled := False;
end;

procedure TFrmPri.TimerFirewallTimer(Sender: TObject);
begin
  TimerFirewall.Enabled := False;
  try
    allowexceptionsonFirewall;
    addApplicationToFirewall('NexAdmin', ParamStr(0));
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

procedure TFrmPri.wmAtualizaDireitosConfig(var Msg: TMessage);
begin
  AtualizaDireitos;
end;

procedure TFrmPri.wmBiometria(var Msg: TMessage);
begin
  if Assigned(FM.FormAtivo) and (FM.FormAtivo is TfbClientes) then
    TfbClientes(FM.FormAtivo).Tab.Locate('ID', Msg.wParam, []);                                               
end;

procedure TFrmPri.wmDownloadIntInfo(var Msg: TMessage);
var DI : TncThDownloadInfo;
begin
  DI := TncThDownloadInfo(Msg.wParam);
  with DI do 
  try
    DebugMsg('TFrmPri.OnDownloadIntDone - aArq: ' + Arq + ' - aVersaoServ: ' + IntToStr(VersaoServ) +  ' - aErro: ' + IntToStr(Erro));
    if Erro=0 then begin
      slConfig.Values[Arq] := IntToStr(VersaoServ);
      slConfig.SaveToFile(ConfigName);
    end;
    DebugMsg('TFrmPri.OnDownloadIntDone 2');
  finally
    DI.Free;
  end;
end;

procedure TFrmPri.wmInfoCampanha(var Msg: TMessage);
var IC: TInfoCampanha;
begin
  if GShutingdown then exit;

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
//var
//  I : TAbreAba;
//  F : PfmFormInfo;
begin
  {I := TAbreAba(Msg.WParam);
  try
    F := FM.FormByClass(TfbMaq);
    if (F<>nil) and (F^.fiInstance<>nil) then
      TfbMaq(F^.fiInstance).OpenRefreshWebTab(I.Titulo, I.URL);
  finally
    I.Free;
  end;}
end;


procedure TFrmPri.cmSairClick(Sender: TObject);
begin
  ClicouSair := True;
  Close;
end;

procedure TFrmPri.cmSuporteRemotoClick(Sender: TObject);
var 
  Maq, Porta: Integer;
  S: String;
begin

  with Dados do 
  if TFrmSuporte.Create(nil).ObterSuporte(Maq, Dados.CM.Ativo, Dados.CM.Maquinas) then begin
    if CM.Ativo then 
      S := CM.UA.Nome else
      S := '';
    ChamaSuporte(S, ProgShortVer);
  end;

{  Maq := 0;
  //Porta := 0;
  if Dados.CM.Ativo then
    if not TFrmSuporte.Create(nil).ObterSuporte(Maq, Dados.CM.Ativo, Dados.CM.Maquinas) then  Exit;
    
  if Maq=0 then begin
    with Dados.CM.UA do
    S := Username + ': ' + Nome;  }

{  end else
    Dados.CM.SuporteRem(Maq, 0);    }
end;
//
procedure TFrmPri.FormShow(Sender: TObject);
begin
  TentaConectar(False);
  if GShutingdown then exit;

  if not Dados.CM.Ativo then begin
    Application.Terminate;
    Exit;
  end;

  if gConfig.Conta='' then 
    kapi_DownloadPreReg;

  with TTimer.Create(Self) do begin
    Interval := 1000;
    OnTimer := OnChecaLimiteAdmin;
    Enabled := True;
  end;

  FrmPrintReview.OnConfirmouImp := Self.OnConfirmouImp;
  FrmPrintReview.OnCancelouImp := Self.OnCancelouImp;


  FrmPTProgress_Parent := Handle;

  if Dados.tbIC.IsEmpty then
    TThreadInfoCampanha.Create(Handle);

  FrmPanTopo.Verifica;

  if FindWindow('TncServBaseClassName', nil)<>0 then
    cmAbrirServ.Visible := ivAlways else
    cmAbrirServ.Visible := ivNever;

  AjustaVersao;
  AjustaMsgAssinatura;


  FRevisarProduto := TfbRevisarProduto.Create(Self, dpRevisarProduto);
  FRevisarProduto.FiltraDados;
  FRevisarProduto.panPri.Parent := dpRevisarProduto;
  //FRevisarProduto.ParentChanged;
  TimerRevisarCadProduto.interval := 50;
  //refreshRevisarCadProduto(true);
  TimerRevisarCadProduto.Enabled := true;

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

procedure TFrmPri.LMDGlobalHotKey1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ShowMessage('OK!');
end;

procedure TFrmPri.LoadDckMgr;
var
  S: String;

begin
  if (Versoes.Versao<250) or DckMgrLoaded then Exit;
  DckMgrLoaded := True;
                             
  S := ExtractFilePath(ParamStr(0))+'NexAdmin5.lay';
  if FileExists(S) then 
    dckMgr.LoadLayoutFromIniFile(S);
end;

procedure TFrmPri.MakeChatVisible(Sender: TObject);
begin
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

procedure TFrmPri.OnChecaLimiteAdmin(Sender: TObject);
var i, t: Integer;
begin
  sender.Free;
  if gConfig.IsPremium then Exit;

  T := 0;
    
  for I := 0 to Dados.CM.Usuarios.Count-1 do
    T := T + Dados.CM.Usuarios.Itens[i].NumClientes;

  if T<2 then Exit;

  ShowMessage('Para usar o NEX em mais de 1 computador simultaneamente é necessário ser um assinante PREMIUM.');
  Close;     
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
  if SameText(Dados.CM.UA.Username, 'admin') and (Dados.CM.UA.Senha='') and (not gConfig.SenhaAdminOk) then begin
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
    Interval := 2000;
    OnTimer := OnFrmSemConta;
    Enabled := True;
  end;
end;

procedure TFrmPri.OnConfirmouImp(Sender: TObject; aInfo: TStrings);
begin
  aInfo.Values['control'] := 'liberar';
  Dados.CM.PrintDocControl(aInfo);
end;

procedure TFrmPri.OnCancelouImp(Sender: TObject; aInfo: TStrings);
begin
  aInfo.Values['control'] := 'cancelar';
  Dados.CM.PrintDocControl(aInfo);
end;

procedure TFrmPri.OnFrmSemConta(Sender: TObject);
begin
  Sender.Free;
  if Trim(gConfig.Conta)='' then
    TFrmCriarConta2.CreateParented(Self.Handle).ShowModal;
end;

procedure TFrmPri.OnTerminouUpdAll(Sender: TObject);
var
  aInterval: Cardinal;
  UA : TplusReqUpdateAll;
begin
  UA := TplusReqUpdateAll(Sender);
  if UA.Sucesso then begin
    TimerPlusUpdateAll.Interval := 1000;
    DebugMsg('TFrmPri.OnTerminouUpdAll - Sucesso = True');
    TThreadUpdateAll.Create(UA, Dados.RSE);
  end else
  try
    DebugMsg('TFrmPri.OnTerminouUpdAll - Sucesso = False');
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
      pClient.LoginUsername := 'admin'+IntToStr(Random(High(Integer)));
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
  Result := cxEditStyleController1.StyleFocused.Color;
end;

procedure TFrmPri.FormClose(Sender: TObject; var Action: TCloseAction);
var 
  S: String;
  Ini : TIniFile;
begin
  if Timer1.Enabled then begin
    try
      FM.Clear;
    except
    end;
  end else begin
    try
      if Dados.CM.Ativo then begin
        S := ExtractFilePath(ParamStr(0))+'NexAdmin5.lay';
        dckMgr.SaveLayoutToIniFile(S);
    
      end;
    except
    end;

    Action := caNone;
    Timer1.Enabled := True;
  end;
end;

procedure TFrmPri.FingReadFingerPrint(Sender: TObject);
begin
  FingRead.PrepareIdentify;
  if not Assigned(FrmBio) then
    Application.CreateForm(TFrmBio, FrmBio);
  FrmBio.SearchTPT(FingRead.Tpt, FingRead.TptSize, FingRead.TptQuality);  
end;

procedure TFrmPri.AjustaBotao(B: TdxBarLargeButton);
begin
  B.AutoGrayScale := not B.Down;
  if B.Down then
    B.Style := styleSelecionado else
    B.Style := cxStyle1;
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

  AjustaBotao(cmVendas);
  AjustaBotao(cmClientes);
  AjustaBotao(cmProdutos);
  AjustaBotao(cmFornecedores);
  AjustaBotao(cmCaixa);
  AjustaBotao(cmEstatisticas);
  AjustaBotao(cmUsuarios);  
end;

procedure TFrmPri.AddWebTab(S: String);
//var P : PfmFormInfo;
begin
  //P := FM.FormByClass(TfbMaq);
  //if Assigned(P) and (P^.fiInstance<>nil) then
  //  TfbMaq(P^.fiInstance).AddWebTab(S);
end;

procedure TFrmPri.AjustaMsgAssinatura;
var Dias: Integer;
begin
  if gConfig.AlertaAssinatura and 
     gConfig.FreePremium and 
     ((gConfig.AssinaturaVenceEm>0) or gConfig.JaFoiPremium) then
  begin
//    panPremium.Visible := True;
    if (gConfig.AssinaturaVenceEm<Date) then begin
      btnAss.Color := $00E2E7E9;
      btnAss.Caption := 'Sua assinatura Premium venceu.';
    end else begin
      Dias := Trunc(gConfig.AssinaturaVenceEm - Date);
      case Dias of
        0 : begin
          btnAss.Color := clYellow;
          btnAss.Caption := 'Sua assinatura Premium vence HOJE.';
        end;
        1 : begin
          btnAss.Color := $0093FFFF;
          btnAss.Caption := 'Sua assinatura Premium vence AMANHÃ.';
        end;
        2 : begin
          btnAss.Color := $00C1FFFF;
          btnAss.Caption := 'Sua assinatura Premium vence em 2 dias.';
        end;
        3 : begin
          btnAss.Color := $00A6F7F4;
          btnAss.Caption := 'Sua assinatura Premium vence em 3 dias.';
        end;
        4 : begin
          btnAss.Color := $00B5E8E6;
          btnAss.Caption := 'Sua assinatura Premium vence em 4 dias.';
        end;
        5 : begin
          btnAss.Color := $00BEDEDD;
          btnAss.Caption := 'Sua assinatura Premium vence em 5 dias.';
        end;
        6..7 : begin
          btnAss.Color := clSilver;
          btnAss.Caption := 'Sua assinatura Premium Premium vence em '+IntToStr(Dias)+' dias.';
        end;
        8..10 : begin
          btnAss.Color := clBtnFace;
          btnAss.Caption := 'Sua assinatura Premium vence em '+IntToStr(Dias)+' dias.';
        end
      else
        panPremium.Visible := False;
      end;
    end;
  end else begin
    panPremium.Visible := False;
  end;
end;

procedure TFrmPri.AjustaRestSpace;
var I, LastExp: Integer;
begin
  LastExp := -1;
{  for I := 0 to NavBar.Groups.Count - 1 do with NavBar.Groups[I] do 
    if Expanded and (I>LastExp) then LastExp := I;

  for I := 0 to NavBar.Groups.Count - 1 do with NavBar.Groups[I] do
    UseRestSpace := (I=LastExp);}
end;

procedure TFrmPri.AjustaSBCaptions;
begin
  cmClientes.ShowCaption := not gConfig.EscondeTextoBotoes;
  cmProdutos.ShowCaption := cmClientes.ShowCaption;
  cmCaixa.ShowCaption := cmClientes.ShowCaption;
  cmUsuarios.ShowCaption := cmClientes.ShowCaption;
  cmEstatisticas.ShowCaption := cmClientes.ShowCaption;
  cmVendas.ShowCaption := cmClientes.ShowCaption;
  cmFornecedores.ShowCaption := cmClientes.ShowCaption;
end;

procedure TFrmPri.AjustaVersao;
var S: String;
begin
  S := IntToStr(Versoes.Versao);
  S := 'Versão ' + prefixo_versao + Copy(SelfVersion, 7, 20);
  if gConfig.FreePremium then 
    if (gConfig.AssinaturaVenceEm>=Date) then
      S := S + ' PREMIUM' else
      S := S + ' FREE';
  cmVerCod.Caption := Dados.CM.Config.Conta + '  |  ' + S;
end;

procedure TFrmPri.AjustaVisSenha;
begin
  if Dados.CM.UA.Senha='' then
    cmAlterarSenha.Caption := 'Criar Senha' else
    cmAlterarSenha.Caption := 'Alterar Senha';
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
    ShowMessage('A conexão com o servidor Nex foi perdida. O NexAdmin será fechado.');
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
  else
  if (Msg.CharCode=116) and CM.Ativo then begin
    CodCli := TFrmLocalizaCli.Create(nil).Localizar;
    if CodCli>0 then
    if tbCli.Locate('ID', CodCli, []) then
      TFrmCadCli.Create(nil).Editar(tbCli, nil) else
      Raise ENexCafe.Create('Cliente não encontrado!');
  end;
end;
  
procedure TFrmPri.AtualizaDireitos;

function SBBloqueioSiteExiste: Boolean;
var I : Integer;
begin
  Result := True;
{  for I := 0 to SB.Groups[0].ItemCount-1 do
    if SB.Groups[0].Items[I].Tag = cmBloqueioSite.Tag then
      Exit;
  Result := False;}
end;

begin
  Biometria := gConfig.Biometria;

  AjustaMsgAssinatura;

  cmUsuarios.Enabled := Dados.CM.UA.Admin;
  cmEstatisticas.Enabled := Permitido(daEstatisticas);

  cmImprimir.Enabled := Permitido(daImpExp);
  cmExportar.Enabled := Permitido(daImpExp);

  if Dados.CM.Config.EscondeTextoBotoes then
    cmMostrarTextoBotoes.Caption := 'Mostrar Texto dos Botões' else
    cmMostrarTextoBotoes.Caption := 'Ocultar Texto dos Botões';

  AjustaSBCaptions;

  MostrarTextoBotoes := not Dados.CM.Config.EscondeTextoBotoes;    

  AjustaVersao;
end;

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
  cmTrocarUsuario.Caption := 'Login';
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
  S := nomeprog + ' Versão: ' + S[1] + '.' + S[2] + '.' + S[3] + Copy(SelfVersion, 6, 20);
  ShowMessage('          '+s+'          ');
end;

procedure TFrmPri.cxButton1Click(Sender: TObject);
begin
  TFrmCriarConta2.Create(Self).ShowModal;
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

procedure TFrmPri.pgMaqCanClose(Sender: TObject; var ACanClose: Boolean);
begin
  ACanClose := (pgMaq.ActivePageIndex>0);
  if ACanClose and (pgMaq.PageCount=2) then
    pgMaq.HideTabs := True;
end;

procedure TFrmPri.RefreshBotoesMaq;
//var F: TFrmBase;
begin
  //F := FM.FormAtivo;
  //if (F is TfbMaq) then
  //  TfbMaq(F).RefreshBotoes;
end;

procedure TFrmPri.RefreshCacheMaq;
//var
  //FI : PfmFormInfo;
begin
  //FI := FM.FormByClass(TfbMaq);
  //if (FI <> nil) and (FI^.fiInstance<>nil) then
  //  TfbMaq(FI^.fiInstance).RefreshCacheMaq;
end;

procedure TFrmPri.refreshRevisarCadProduto(const aForce:boolean=false);
begin
    if (screen.ActiveForm=Self) or (aForce) then begin
        LockWindowUpdate(handle);
        try
                FRevisarProduto.refreshRevisarCadProduto(dpRevisarProduto, dsPri, dtRight, 0, aForce);
        finally
            LockWindowUpdate(0);
        end;
    end;
end;

procedure TFrmPri.TimerRevisarCadProdutoTimer(Sender: TObject);
begin
    TimerRevisarCadProduto.interval := kTimerRevisarCadProdutoInterval;
    refreshRevisarCadProduto;
end;

procedure TFrmPri.RefreshTran;
var F: TFrmBase;
begin
  F := FM.FormAtivo;
  if (F is TfbCaixa) then
    TfbCaixa(F).RefreshTran;
end;

procedure TFrmPri.RegistraForms;
begin
  FM.RegistraForm(tfbVendas2);
  FM.RegistraForm(TfbClientes);
  FM.RegistraForm(TfbProdutos);
  FM.RegistraForm(TfbCaixa);
  FM.RegistraForm(TfbTiposImp);
  FM.RegistraForm(TfbTarifas2);
  FM.RegistraForm(TfbUsuarios);
  FM.RegistraForm(TfbAvisos);
  FM.RegistraForm(TfbFiltroWeb);
  FM.RegistraForm(TfbEst);
  FM.RegistraForm(TfbFornecedores);
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

procedure TFrmPri.cmLaySalvarClick(Sender: TObject);
var F: TFrmBase;
begin
  F := FM.FormAtivo;
  if Assigned(F) then F.cmLaySalvarClick(nil);
end;

procedure TFrmPri.cmAbrirServClick(Sender: TObject);
var H : HWND;
begin
  H := FindWindow('TncServBaseClassName', nil);
  if H<>0 then 
    PostMessage(H, wm_abreserv, 1, 0);
end;

procedure TFrmPri.dxBarButton2Click(Sender: TObject);
begin
  Close;
  ShellStart(ParamStr(0), 'afterlogoff');
end;

procedure TFrmPri.dxBarButton5Click(Sender: TObject);
begin
  ShellStart('http://www.programanex.com.br');
end;

procedure TFrmPri.dxBarButton6Click(Sender: TObject);
begin
  TFrmContato.Create(Self).ShowModal;
end;

procedure TFrmPri.dxBarButton9Click(Sender: TObject);
begin
  ShellStart('http://assinar.nextar.com.br?conta='+gConfig.Conta);
end;

procedure TFrmPri.cmComprarAssClick(Sender: TObject);
begin
  ShellStart('http://assinar.nextar.com.br?conta='+gConfig.Conta);
end;

procedure TFrmPri.dxBarStatic1Click(Sender: TObject);
begin
  ShowMessage('Ok');
end;

procedure TFrmPri.cmLayRestaurarClick(Sender: TObject);
var F: TFrmBase;
begin
  F := FM.FormAtivo;
  if Assigned(F) then F.cmLayRestaurarClick(nil);
end;

procedure TFrmPri.FormCreate(Sender: TObject);
begin
  Set8087CW($133f);
  VerProg := SelfVersion;
  FBiometria := False;
  RegistraForms;
  cmVerCod.Caption := '|  Versão: ' + VerProg + '  |  Conta: ' + Dados.CM.Config.Conta + '  |';
end;

procedure TFrmPri.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = KEY_F1 then
  if FM.FormAtivo is TfbMesas then
    TfbMesas(FM.FormAtivo).FocusMesa;
end;

procedure TFrmPri.FormResize(Sender: TObject);
begin
  if FM.FormAtivo<>nil then
    FM.FormAtivo.AtualizaDireitos;
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
//  cmSubExibir.Caption := 'E&xibir: ' + TdxBarItem(Sender).Caption;
  cmSubExibir.Tag := Tag;
  if (F<>nil) then
    FM.Mostrar(F, 0, 0);
end;
  
procedure TFrmPri.cmMostrarTextoBotoesClick(Sender: TObject);
begin
  MostrarTextoBotoes := not MostrarTextoBotoes;
  if MostrarTextoBotoes then
    cmMostrarTextoBotoes.Caption := 'Ocultar Textos dos Botões'
  else  
    cmMostrarTextoBotoes.Caption := 'Mostrar Textos dos Botões' ;
  with Dados, CM do begin  
    tbConfig.Edit;
    tbConfigEscondeTextoBotoes.Value := not MostrarTextoBotoes;
    tbConfig.Post;
    Config.AtualizaCache;
    Config.EscondeTextoBotoes := not MostrarTextoBotoes;
    SalvaAlteracoesObj(Config, False);
   
    AjustaSBCaptions;
  end;  

  BroadcastAtualizaDireitosConfig;
end;

initialization
  Randomize;

  cxSetResourceString(@cxSMenuItemCaptionCut, 'Recortar');
  cxSetResourceString(@cxSMenuItemCaptionCopy, '&Copiar');
  cxSetResourceString(@cxSMenuItemCaptionPaste, 'Colar');
  cxSetResourceString(@cxSMenuItemCaptionDelete, 'E&xcluir');
  cxSetResourceString(@cxSMenuItemCaptionLoad, '&Selecionar um arquivo...');
  cxSetResourceString(@cxSMenuItemCaptionSave, 'Salvar C&omo...');

        
  cxSetResourceString(@cxSGridNone, 'Nenhum');
  cxSetResourceString(@cxSGridSortColumnAsc, 'Ordenar Crescente');
  cxSetResourceString(@cxSGridSortColumnDesc, 'Ordenar Decrescente');
  cxSetResourceString(@cxSGridClearSorting, 'Não Ordenar');
  cxSetResourceString(@cxSGridGroupByThisField, 'Agrupar por esta coluna');
  cxSetResourceString(@cxSGridRemoveThisGroupItem, 'Remover do agrupamento');
  cxSetResourceString(@cxSGridGroupByBox, 'Agrupamento') ;
  cxSetResourceString(@cxSGridAlignmentSubMenu, 'Alinhamento');
  cxSetResourceString(@cxSGridAlignLeft, 'à Esquerda');
  cxSetResourceString(@cxSGridAlignRight, 'à Direita');
  cxSetResourceString(@cxSGridAlignCenter, 'ao Centro');        
  cxSetResourceString(@cxSGridRemoveColumn, 'Remover esta coluna');
  cxSetResourceString(@cxSGridFieldChooser, 'Selecionar Colunas');
  cxSetResourceString(@cxSGridBestFit, 'Tamanho ideal');
  cxSetResourceString(@cxSGridBestFitAllColumns, 'Tamanho ideal (Todas colunas)');
  cxSetResourceString(@cxSGridShowFooter, 'Rodapé');
  cxSetResourceString(@cxSGridShowGroupFooter, 'Rodapé em agrupamento');
  cxSetResourceString(@cxSGridSumMenuItem, 'Somar');
  cxSetResourceString(@cxSGridMinMenuItem, 'Min');
  cxSetResourceString(@cxSGridMaxMenuItem, 'Max');
  cxSetResourceString(@cxSGridCountMenuItem, 'Contar');
  cxSetResourceString(@cxSGridAvgMenuItem, 'Média');
  cxSetResourceString(@cxSGridNoneMenuItem, 'Nenhum');
  cxSetResourceString(@scxGridNoDataInfoText, '');
  

  cxSetResourceString(@scxGridRecursiveLevels, 'Você não pode criar niveis recursivos');

//  cxSetResourceString(@scxGridDeletingConfirmationCaption, 'Confirmar');
  cxSetResourceString(@scxGridDeletingFocusedConfirmationText, 'Apagar registro?');
  cxSetResourceString(@scxGridDeletingSelectedConfirmationText, 'Apagar todos registros selecionados?');

  cxSetResourceString(@scxGridNewItemRowInfoText, 'Clique aqui para adicionar um novo registro');

  cxSetResourceString(@scxGridFilterIsEmpty, '<Filtro está vazio>');

  cxSetResourceString(@scxGridCustomizationFormCaption, 'Customização');
  cxSetResourceString(@scxGridCustomizationFormColumnsPageCaption, 'Colunas');
  cxSetResourceString(@scxGridGroupByBoxCaption, 'Arraste aqui o cabeçalho de uma coluna para agrupar por esta coluna');
  cxSetResourceString(@scxGridFilterCustomizeButtonCaption, 'Customizar...');

  cxSetResourceString(@scxGridCustomizationFormBandsPageCaption, 'Bandas');

  cxSetResourceString(@scxGridConverterNotExistGrid, 'cxGrid não existet');
  cxSetResourceString(@scxGridConverterNotExistComponent, 'Componente não existe');
  cxSetResourceString(@scxImportErrorCaption, 'Erro de importação');

  cxSetResourceString(@scxNotExistGridView, 'Grid view não existe');
  cxSetResourceString(@scxNotExistGridLevel, 'Grid level ativo não existe');
  cxSetResourceString(@scxCantCreateExportOutputFile, 'Falha na criação do arquivo de exportação');
  
  cxSetResourceString(@cxSFilterRootButtonCaption, 'Filtro');
  cxSetResourceString(@cxSFilterAddCondition, 'Nova &Condição');
  cxSetResourceString(@cxSFilterAddGroup, 'Novo &Grupo');
  cxSetResourceString(@cxSFilterRemoveRow , '&Remover Linha');
  cxSetResourceString(@cxSFilterClearAll, 'Limpar &Tudo');
  cxSetResourceString(@cxSFilterFooterAddCondition, 'pressione o botão para adicionar uma nova condição');
  cxSetResourceString(@cxSFilterGroupCaption, 'se aplica as seguintes condições');
  cxSetResourceString(@cxSFilterRootGroupCaption , '<raiz>');
  cxSetResourceString(@cxSFilterControlNullString , '<vazio>');
  cxSetResourceString(@cxSFilterErrorBuilding, 'Não é possível montar o filtro nessa origem');
  cxSetResourceString(@cxSFilterDialogCaption, 'Filtro Customizado');
  cxSetResourceString(@cxSFilterDialogInvalidValue, 'Valor inválido');
  cxSetResourceString(@cxSFilterDialogUse, 'Usar');
  cxSetResourceString(@cxSFilterDialogSingleCharacter, 'para representar qualquer caracter');
  cxSetResourceString(@cxSFilterDialogCharactersSeries, 'para representar qualquer série de caracteres');
  cxSetResourceString(@cxSFilterDialogOperationAnd, 'E');
  cxSetResourceString(@cxSFilterDialogOperationOr, 'OU');
  cxSetResourceString(@cxSFilterDialogRows, 'Mostrar registros onde:');
  cxSetResourceString(@cxSFilterControlDialogCaption, 'Criador de Filtro');
  cxSetResourceString(@cxSFilterControlDialogNewFile, 'semtitulo.flt');
  cxSetResourceString(@cxSFilterControlDialogOpenDialogCaption, 'Abrir um filtro existente');
  cxSetResourceString(@cxSFilterControlDialogSaveDialogCaption, 'Salvar o filtro ativo para um arquivo');
  cxSetResourceString(@cxSFilterControlDialogActionSaveCaption , '&Salvar como...');
  cxSetResourceString(@cxSFilterControlDialogActionOpenCaption , '&Abrir...');
  cxSetResourceString(@cxSFilterControlDialogActionApplyCaption , 'A&plicar');
  cxSetResourceString(@cxSFilterControlDialogActionOkCaption, 'OK');
  cxSetResourceString(@cxSFilterControlDialogActionCancelCaption, 'Cancelar');
  cxSetResourceString(@cxSFilterControlDialogFileExt, 'flt');
  cxSetResourceString(@cxSFilterControlDialogFileFilter, 'Filttros (*.flt)|*.flt');

  cxSetResourceString(@cxSFilterOperatorEqual, 'seja igual a');
  cxSetResourceString(@cxSFilterOperatorNotEqual, 'seja diferente de');
  cxSetResourceString(@cxSFilterOperatorLess, 'seja menor que');
  cxSetResourceString(@cxSFilterOperatorLessEqual, 'seja menor que ou igual a');
  cxSetResourceString(@cxSFilterOperatorGreater, 'seja maior que');
  cxSetResourceString(@cxSFilterOperatorGreaterEqual, 'seja maior que ou igual a');
  cxSetResourceString(@cxSFilterOperatorLike, 'contenha');
  cxSetResourceString(@cxSFilterOperatorNotLike, 'não contenha');
  cxSetResourceString(@cxSFilterOperatorBetween, 'tenha valor entre');
  cxSetResourceString(@cxSFilterOperatorNotBetween, 'não tenha valor entre');
  cxSetResourceString(@cxSFilterOperatorInList, 'dentro de');
  cxSetResourceString(@cxSFilterOperatorNotInList, 'fora de');
  cxSetResourceString(@cxSFilterOperatorYesterday, 'seja ontem');
  cxSetResourceString(@cxSFilterOperatorToday, 'seja hoje');
  cxSetResourceString(@cxSFilterOperatorTomorrow, 'seja amanhã');
  cxSetResourceString(@cxSFilterOperatorLastWeek, 'seja semana passada');
  cxSetResourceString(@cxSFilterOperatorLastMonth, 'seja mês passado');
  cxSetResourceString(@cxSFilterOperatorLastYear, 'seja ano passado');
  cxSetResourceString(@cxSFilterOperatorThisWeek, 'seja esta semana');
  cxSetResourceString(@cxSFilterOperatorThisMonth, 'seja este mês');
  cxSetResourceString(@cxSFilterOperatorThisYear, 'seja este ano');
  cxSetResourceString(@cxSFilterOperatorNextWeek, 'seja a próxima semana');
  cxSetResourceString(@cxSFilterOperatorNextMonth, 'seja o próximo mês');
  cxSetResourceString(@cxSFilterOperatorNextYear, 'seja o próximo ano');
  cxSetResourceString(@cxSFilterAndCaption, 'e');
  cxSetResourceString(@cxSFilterOrCaption, 'ou');
  cxSetResourceString(@cxSFilterNotCaption, 'não');
  cxSetResourceString(@cxSFilterBlankCaption, 'branco');
  cxSetResourceString(@cxSFilterOperatorIsNull, 'esteja em branco');
  cxSetResourceString(@cxSFilterOperatorIsNotNull, 'nao esteja em branco');
  cxSetResourceString(@cxSFilterOperatorBeginsWith, 'comece com');
  cxSetResourceString(@cxSFilterOperatorDoesNotBeginWith, 'não comece com');
  cxSetResourceString(@cxSFilterOperatorEndsWith, 'termine com');
  cxSetResourceString(@cxSFilterOperatorDoesNotEndWith, 'não termine com');
  cxSetResourceString(@cxSFilterOperatorContains, 'contenha');
  cxSetResourceString(@cxSFilterOperatorDoesNotContain, 'nao contenha');
  cxSetResourceString(@cxSFilterBoxAllCaption , '(Todos)');
  cxSetResourceString(@cxSFilterBoxCustomCaption , '(Customizado...)');
  cxSetResourceString(@cxSFilterBoxBlanksCaption , '(Brancos)');
  cxSetResourceString(@cxSFilterBoxNonBlanksCaption , '(não Brancos)');

{  cxSetResourceString(@cxSMenuItemCaptionCut, 
      Items[1].Caption := cxGetResourceString(@cxSMenuItemCaptionCopy);
      Items[2].Caption := cxGetResourceString(@cxSMenuItemCaptionPaste);
      Items[3].Caption := cxGetResourceString(@cxSMenuItemCaptionDelete);
      Items[5].Caption := cxGetResourceString(@cxSMenuItemCaptionLoad);
      Items[6].Caption := cxGetResourceString(@cxSMenuItemCaptionSave);}
  
  
  

end.
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

                                               
