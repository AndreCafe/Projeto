unit ncaFrmPri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles, 
  ExtCtrls, 
  kbmMemTable, kbmMemBinaryStreamFormat, DB, 
  cxPC, cxControls, dxBar, 
  dxsbar, cxContainer, cxEdit,
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
  cxRadioGroup, cxDBData, cxGridDBTableView, 
  LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDCustomGroupBox, LMDGroupBox,
  StdCtrls, 
  LMDControl,
  LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, 
  ufmFormBase, LMDCustomComponent, LMDContainerComponent, 
  PngImageList, 
  pngimage,
  Buttons, chfrBase, chfrPadrao, chBase, chKBM, 
  LMDBaseDialog, 
  ncFrmChat, ncafbListaEspera, ShellApi,
  AppEvnts, ncClassesBase,
  LMDWaveComp, GrFingerComp, LMDBaseGraphicControl, 
  cxLookAndFeels, LMDSysInfo, dxNavBarCollns, dxNavBarBase,
  dxNavBar, ncafbImp, 
  dxNavBarStyles, LMDPNGImage,
  LMDSimplePanel, ncafbMaquinas, dxSkinsForm;

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
    cmVerCod: TdxBarStatic;
    Timer2: TTimer;
    im32: TcxImageList;
    cmSuporteRemoto: TdxBarButton;
    ApplicationEvents1: TApplicationEvents;
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
    dxSkinController1: TdxSkinController;
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
    NavBar: TdxNavBar;
    nbgChat: TdxNavBarGroup;
    nbgImp: TdxNavBarGroup;
    nbgListaEsp: TdxNavBarGroup;
    nbgChatControl: TdxNavBarGroupControl;
    nbgImpControl: TdxNavBarGroupControl;
    nbgListaEspControl: TdxNavBarGroupControl;
    im24: TcxImageList;
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
    panPremium: TLMDSimplePanel;
    cmPremium: TdxBarControlContainerItem;
    LMDSimplePanel1: TLMDSimplePanel;
    btnAss: TLMDSpeedButton;
    cmAss: TdxBarButton;
    dpCHAT: TdxDockPanel;
    dxLayoutDockSite5: TdxLayoutDockSite;
    dpImp: TdxDockPanel;
    dpListaEsp: TdxDockPanel;
    dxLayoutDockSite8: TdxLayoutDockSite;
    dxLayoutDockSite6: TdxLayoutDockSite;
    procedure Timer1Timer(Sender: TObject);
    procedure cmSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmChatClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FMChange(Sender: TObject);
    procedure SBItemClick(Sender: TObject; Item: TdxSideBarItem);
    procedure cmTrocarUsuarioClick(Sender: TObject);
    procedure cmAlterarSenhaClick(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmMostrarTextoBotoesClick(Sender: TObject);
    procedure TimerChatTimer(Sender: TObject);
    procedure btnChatClick(Sender: TObject);
    procedure paActivate(Sender: TdxCustomDockControl; Active: Boolean);
    procedure Timer2Timer(Sender: TObject);
    procedure ApplicationEvents1ShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure cmSuporteRemotoClick(Sender: TObject);
    procedure FingReadFingerPrint(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
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
    procedure btnAssClick(Sender: TObject);
    procedure dpCHATDock(Sender, Site: TdxCustomDockControl;
      ADockType: TdxDockingType; AIndex: Integer);
    procedure dpImpCloseQuery(Sender: TdxCustomDockControl;
      var CanClose: Boolean);
  private
    { Private declarations }
    FChat : TFrmBaseChat;
    FEspera : TfbListaEspera;
    FImp    : TfbImp;
    FBiometria : Boolean;

    procedure EnviarMsg(const aPara: Integer; const aTexto: String);
    procedure MudouAtencao(Sender: TObject);
    procedure LoadDckMgr;
    procedure SetBiometria(const Value: Boolean);

    procedure OnAjustaRestSpaceTimer(Sender: TObject);
    procedure NewRestSpaceTimer;

    procedure OnTimerAfterLogin(Sender: TObject);

    procedure AjustaSBCaptions;

    procedure OnFrmSemConta(Sender: TObject);
    procedure OnChecaSenhaMaqs(Sender: TObject);

    procedure wmBiometria(var Msg: TMessage);
      message wm_biometria;
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


    property FrmImp: TfbImp 
      read FImp;

    property FrmChat: TFrmBaseChat
      read FChat;

    property ListaEspera: TfbListaEspera
      read FEspera;  
    { Public declarations }

    property Biometria: Boolean
      read FBiometria write SetBiometria;
  end;

  function SimNao(S: String): Boolean;
  function SimNaoH(S: String; H : HWND): Boolean;
  procedure ShowMsg(S: String; aBeep: Boolean = False);
                                                     

var
  FrmPri: TFrmPri;
  DckMgrLoaded : Boolean = False;
  ClicouSair : Boolean = False;
  

const
  Key_Tab        = 9;
  Key_Ins        = 45;
  Key_Del        = 46;
  Key_Enter      = 13;
  Key_Up         = 38;
  Key_Down       = 40;
  Key_Esc        = 27;
  Key_CtrlN      = $310E;
  Key_F8         = $4200;
  Key_F9         = $4300;

implementation

uses 
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
  ncafbAvisos, ncafbFiltroWeb, ncVersoes, ncDMServ, 
  ncaLocalizaCli,
  ncFrmSuporteRem, uWinPopUp, ncaBiometria, ncVersionInfo,
  nxptBasePooledTransport, nxllBde, ncaFrmCadCli, ncafbMaq, ncafbMaqConfig,
  ncafbEst, ncaFrmTarifa, ncafbTarifas2, ncaFrmSemConta, ncafbPesqFor,
  ncafbPesqCH, ncaFrmAss, ncShellStart, ncaFrmWebMsg, ncaFrmGetWebTabs,
  ncafbCXLetra, ncaFrmSenhaWiz, ncaFrmQtdMaq;

{$R *.dfm}

function IndexToFormClass(aIndex: Integer): TFrmBaseClass;
begin
  case aIndex of
    0 : Result := TfbMaq;
    1 : Result := TfbClientes;
    2 : Result := TfbProdutos;
    3 : Result := TfbImp;
    4 : Result := TfbCaixa;
    5 : Result := TfbOpcoes;
    6 : Result := TfbTarifas2;
    7 : Result := TfbUsuarios;
    8 : Result := TfbFiltroWeb;
    9 : Result := TfbEst;
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
  Caption := 'NexCafé 4 | NexAdmin';

  with TFrmLogin.Create(Self) do
  ShowModal;

  if not Dados.CM.Ativo then Exit;

  with TTimer.Create(Self) do begin
    Interval := 1000;
    OnTimer := OnTimerAfterLogin;
    Enabled := True;
  end;

  Caption := 'NexCafé 4 | NexAdmin | Usuário: ' + Dados.CM.Username + ' | Pasta: ' + ExtractFileDir(ParamStr(0));

//  PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);

  Dados.AbreDB;
  
  cmTrocarUsuario.Caption := 'Trocar de Usuário';
  
  cmSubExibir.Enabled := True;
  dsPri.Visible := True;
  cmImprimir.Enabled := True;
  cmExportar.Enabled := True;

  AjustaVisSenha;

  cmAlterarSenha.Enabled := True;
  cmSubExibir.Caption := 'E&xibir: Máquinas';
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
    nbgChat.Visible := True;
    FChat.meTexto.SetFocus;
  end;
end;

procedure TFrmPri.TimerChatTimer(Sender: TObject);
begin
  cmChat.Visible := ivAlways;
  if btnChat.Color = clYellow then
    btnChat.Color := clBtnFace else
    btnChat.Color := clYellow;
end;

procedure TFrmPri.TimerHintTimer(Sender: TObject);
begin
  TimerHint.Enabled := False;
  HC.HideHint;
end;

function TFrmPri.VersaoStr: String;
begin
  Result := IntToStr(Versoes.Versao);
  Result := Result[1] + '.' + Result[2] + '.' + Result[3] + Copy(SelfVersion, 6, 20);
end;

procedure TFrmPri.wmBiometria(var Msg: TMessage);
begin
  if Assigned(FM.FormAtivo) and (FM.FormAtivo is TfbClientes) then
    TfbClientes(FM.FormAtivo).Tab.Locate('ID', Msg.wParam, []);                                               
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
  Maq := 0;
  Porta := 0;
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
var I : Integer;
begin
  TentaConectar(False);
  if not Dados.CM.Ativo then begin
    Application.Terminate;
    Exit;
  end;
  AjustaVersao;
  AjustaMsgAssinatura;
  FChat := TFrmBaseChat.Create(Self);
  FChat.PrecisaVisibilidade := MakeChatVisible;
  FChat.EnviarMsg := EnviarMsg;
  FChat.NumMaq := 0;
//  FChat.panPri.Parent := nbgChatControl;
  FChat.panPri.Parent := dpChat;
  
//  dpChat.Width := lbVersao.Width;

  FEspera := TfbListaEspera.Create(Self);
  FEspera.FiltraDados;
//  FEspera.panPri.Parent := nbgListaEspControl;
  FEspera.panPri.Parent := dpListaEsp;
  FEspera.ParentChanged;

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
    edMaq.Properties.Items.Add('Todos');
    for I := 0 to Maquinas.Count - 1 do
      edMaq.Properties.Items.Add(IntToStr(Maquinas[I].Numero));
    edMaq.ItemIndex := 0;
//    FChat.panPri.Parent := nbgChatControl;
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

  if Trim(gConfig.Conta)='' then 
  with TTimer.Create(Self) do begin
    Interval := 1000;
    OnTimer := OnFrmSemConta;
    Enabled := True;
  end;

  PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
  AtualizaDireitos;

  TFrmWebMsg.Create(Self).Show;
  TFrmGetWebTabs.Create(Self).Show;  
end;

procedure TFrmPri.LoadDckMgr;
var 
  S: String;
  Ini : TIniFile;
begin
  if (Versoes.Versao<250) or DckMgrLoaded then Exit;
  DckMgrLoaded := True;
                             
  try
    S := ExtractFilePath(ParamStr(0))+'NexAdmin4.lay2';
    if FileExists(S) then 
      dckMgr.LoadLayoutFromIniFile(S);
  except
  end;

  try    
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
  end;
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

  if Alterou then Dados.CM.SalvaAlteracoesObj(gConfig, False);
end;

procedure TFrmPri.OnFrmSemConta(Sender: TObject);
begin
  Sender.Free;
  if Trim(gConfig.Conta)='' then
    TFrmSemConta.Create(Self).ShowModal;
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
        S := ExtractFilePath(ParamStr(0))+'NexAdmin4.lay2';
        dckMgr.SaveLayoutToIniFile(S);
        S := ExtractFilePath(ParamStr(0))+'Atalhos.lay';
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
        end;
        
      end;
    except
    end;
    try
      FEspera.cmLaySalvarClick(nil);
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

procedure TFrmPri.AjustaMsgAssinatura;
var Dias: Integer;
begin
  if gConfig.FreePremium then
    cmAss.Visible := ivAlways else
    cmAss.Visible := ivNever;
    
  if gConfig.AlertaAssinatura and 
     gConfig.FreePremium and 
     ((gConfig.AssinaturaVenceEm>0) or gConfig.JaFoiPremium) then
  begin
    panPremium.Visible := True;
    cmPremium.Visible := ivAlways;
    if (gConfig.AssinaturaVenceEm<Date) then begin
      btnAss.Color := $00E2E7E9;
      btnAss.Caption := 'Sua assinatura Premium venceu. Saiba mais ...';
    end else begin
      Dias := Trunc(gConfig.AssinaturaVenceEm - Date);
      case Dias of
        0 : begin
          btnAss.Color := clYellow;
          btnAss.Caption := 'Sua assinatura Premium vence HOJE. Saiba mais...';
        end;
        1 : begin
          btnAss.Color := $0093FFFF;
          btnAss.Caption := 'Sua assinatura Premium vence AMANHÃ. Saiba mais...';
        end;
        2 : begin
          btnAss.Color := $00C1FFFF;
          btnAss.Caption := 'Sua assinatura Premium vence em 2 dias. Saiba mais...';
        end;
        3 : begin
          btnAss.Color := $00A6F7F4;
          btnAss.Caption := 'Sua assinatura Premium vence em 3 dias. Saiba mais...';
        end;
        4 : begin
          btnAss.Color := $00B5E8E6;
          btnAss.Caption := 'Sua assinatura Premium vence em 4 dias. Saiba mais...';
        end;
        5 : begin
          btnAss.Color := $00BEDEDD;
          btnAss.Caption := 'Sua assinatura Premium vence em 5 dias. Saiba mais...';
        end;
        6..7 : begin
          btnAss.Color := clSilver;
          btnAss.Caption := 'Sua assinatura Premium Premium vence em '+IntToStr(Dias)+' dias. Saiba mais...';
        end;
        8..10 : begin
          btnAss.Color := clBtnFace;
          btnAss.Caption := 'Sua assinatura Premium vence em '+IntToStr(Dias)+' dias. Saiba mais...';
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
end;

procedure TFrmPri.AjustaRestSpace;
var I, LastExp: Integer;
begin
  LastExp := -1;
  for I := 0 to NavBar.Groups.Count - 1 do with NavBar.Groups[I] do 
    if Expanded and (I>LastExp) then LastExp := I;

  for I := 0 to NavBar.Groups.Count - 1 do with NavBar.Groups[I] do
    UseRestSpace := (I=LastExp);
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
begin
  S := IntToStr(Versoes.Versao);
  S := 'Versão ' + S[1] + '.' + S[2] + '.' + S[3] + Copy(SelfVersion, 6, 20);
  if gConfig.FreePremium then 
    if (gConfig.AssinaturaVenceEm>=Date) then
      S := S + ' PREMIUM' else
      S := S + ' FREE';
  cmVerCod.Caption := S+ '  |  Conta: ' + Dados.CM.Config.Conta;
end;

procedure TFrmPri.AjustaVisSenha;
begin
  if Dados.CM.UA.Senha='' then
    cmAlterarSenha.Caption := 'Criar Senha' else
    cmAlterarSenha.Caption := 'Alterar Senha';
end;

procedure TFrmPri.ApplicationEvents1Exception(Sender: TObject; E: Exception);
begin
  if (E is EnxPooledTransportException) and
     (EnxPooledTransportException(E).ErrorCode = DBIERR_SERVERCOMMLOST) then
  begin
    Dados.mtMaquina.Active := False;
    Dados.CM.Ativo := False;
    Dados.ServRem.Ativo := False;
    Dados.nxTCPIP.Active := False;
    Close;   
    ShowMessage('A conexão com o servidor NexCafé foi perdida. O NexAdmin será fechado.');
  end else
    Application.ShowException(E);
end;

procedure TFrmPri.ApplicationEvents1ShortCut(var Msg: TWMKey; var Handled: Boolean);
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
var SBI: TdxSideBarItem;

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

  cmRemoveAddMaq.Enabled := Dados.CM.UA.Admin;
  cmRemoveAddMaq.Down := SameText(slConfig.Values['RemoveAddMaq'], 'S');
  
  cmUsuarios.Enabled := Dados.CM.UA.Admin;
  cmOpcoes.Enabled := Permitido(daCFGParametros);
  cmEstatisticas.Enabled := Permitido(daEstatisticas);

  cmImprimir.Enabled := Permitido(daImpExp);
  cmExportar.Enabled := Permitido(daImpExp);

  
  
  if Dados.CM.Config.EscondeTextoBotoes then
    cmMostrarTextoBotoes.Caption := 'Mostrar Texto dos Botões' else
    cmMostrarTextoBotoes.Caption := 'Ocultar Texto dos Botões';

  AjustaSBCaptions;

  MostrarTextoBotoes := not Dados.CM.Config.EscondeTextoBotoes;    
  
  AjustaVersao;

  if not Permitido(daAtenderClientes) then 
//    dpAtalhosDir.Close 
  else begin
    nbgListaEsp.Visible := Versoes.PodeUsar(idre_listaespera);
    nbgChat.Visible := Versoes.PodeUsar(idre_chat) and (gConfig.OpcaoChat<>ochDesabilitar);
//    dpAtalhosDir.Visible := (nbgListaEspera.Visible or nbgChat.Visible);
  end;

  cmFiltroWeb.Enabled := Versoes.PodeUsar(idre_bloqueiosite);
  if Assigned(FrmImp) then
    FrmImp.AtualizaDireitos;
  
  FM.AtualizaDireitos;
end;

procedure TFrmPri.SBItemClick(Sender: TObject; Item: TdxSideBarItem);
var F : PFrmBaseClass;
begin
  F := FM.ClassByName(Item.CustomData);
  cmSubExibir.Caption := 'E&xibir: '+ Item.Hint;
  cmSubExibir.Tag := Item.Tag;
  if (F<>nil) then
    FM.Mostrar(F^, 0, 0);
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

procedure TFrmPri.btnAssClick(Sender: TObject);
begin
  ShellStart('http://contas.nextar.com.br/assinar?conta='+gConfig.Conta);
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

procedure TFrmPri.RegistraForms;
begin
  FM.RegistraForm(TfbMaq);
  FM.RegistraForm(TfbClientes);
  FM.RegistraForm(TfbProdutos);
  FM.RegistraForm(TfbCaixa);
  FM.RegistraForm(TfbOpcoes);
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

procedure TFrmPri.cmLaySalvarClick(Sender: TObject);
var F: TFrmBase;
begin
  F := FM.FormAtivo;
  if Assigned(F) then F.cmLaySalvarClick(nil);
end;

procedure TFrmPri.dxBarButton6Click(Sender: TObject);
begin
  TFrmContato.Create(Self).ShowModal;
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
  VerProg := SelfVersion;
  FBiometria := False;
  RegistraForms;  
  FChat := nil;
  cmVerCod.Caption := '|  Versão: ' + VerProg + '  |  Conta: ' + Dados.CM.Config.Conta + '  |';
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
  cmSubExibir.Caption := 'E&xibir: ' + TdxBarItem(Sender).Caption;
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
  if Assigned(fbImp) then 
    fbImp.AtualizaDireitos;
  
  FM.AtualizaDireitos;
end;

procedure TFrmPri.cmRemoveAddMaqClick(Sender: TObject);
begin
  if cmRemoveAddMaq.Down then
    slConfig.Values['RemoveAddMaq'] := 'S' else
    slConfig.Values['RemoveAddMaq'] := '';
  SaveConfig;
  FM.AtualizaDireitos;
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

  cxSetResourceString(@scxGridDeletingConfirmationCaption, 'Confirmar');
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













                                                      
