unit ncaFrmPri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, 
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
  LMDSysInfo, LMDWaveComp, GrFingerComp, LMDBaseGraphicControl, 
  cxLookAndFeels, dxSkinsForm;

type
  TFrmPri = class(TForm)
    BarMgr: TdxBarManager;
    dxBarSubItem1: TdxBarSubItem;
    cmTrocarUsuario: TdxBarButton;
    cmAlterarSenha: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    cmSair: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton6: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarSubItem3: TdxBarSubItem;
    cxEditStyleController1: TcxEditStyleController;
    FM: TFormManager;
    cxHintStyleController1: TcxHintStyleController;
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
    SB: TdxSideBar;
    dpPaginas: TdxDockPanel;
    dxLayoutDockSite2: TdxLayoutDockSite;
    Paginas: TcxPageControl;
    MT: TkbmMemTable;
    MTDataHora: TDateTimeField;
    MTTexto: TMemoField;
    DataSource1: TDataSource;
    cmSubExibir: TdxBarSubItem;
    cmMaquinas: TdxBarButton;
    cmClientes: TdxBarButton;
    cmProdutos: TdxBarButton;
    cmImpressoes: TdxBarButton;
    cmCaixa: TdxBarButton;
    cmOpcoes: TdxBarButton;
    cmTarifas: TdxBarButton;
    cmUsuarios: TdxBarButton;
    cmMostrarTextoBotoes: TdxBarButton;
    Timer1: TTimer;
    cmChat: TdxBarControlContainerItem;
    btnChat: TLMDSpeedButton;
    TimerChat: TTimer;
    cmBloqueioSite: TdxBarButton;
    dpListaEspera: TdxDockPanel;
    cmVerCod: TdxBarStatic;
    Timer2: TTimer;
    dpChat: TdxDockPanel;
    dxLayoutDockSite3: TdxLayoutDockSite;
    dxLayoutDockSite4: TdxLayoutDockSite;
    im32: TcxImageList;
    imSideBar: TPngImageList;
    cmSuporteRemoto: TdxBarButton;
    ApplicationEvents1: TApplicationEvents;
    PaintBox1: TPaintBox;
    cxStyle29: TcxStyle;
    dxBarButton1: TdxBarButton;
    LMDSysInfo1: TLMDSysInfo;
    LMDSysInfo2: TLMDSysInfo;
    cxStyle30: TcxStyle;
    FingRead: TGrFingerComp;
    dxSkinController1: TdxSkinController;
    procedure Timer1Timer(Sender: TObject);
    procedure cmSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmChatClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FMChange(Sender: TObject);
    procedure cmMaquinasClick(Sender: TObject);
    procedure SBItemClick(Sender: TObject; Item: TdxSideBarItem);
    procedure SBChangeSelectedItem(Sender: TObject);
    procedure cmTrocarUsuarioClick(Sender: TObject);
    procedure cmAlterarSenhaClick(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxBarButton9Click(Sender: TObject);
    procedure cmMostrarTextoBotoesClick(Sender: TObject);
    procedure TimerChatTimer(Sender: TObject);
    procedure btnChatClick(Sender: TObject);
    procedure paActivate(Sender: TdxCustomDockControl; Active: Boolean);
    procedure dpListaEsperaCloseQuery(Sender: TdxCustomDockControl;
      var CanClose: Boolean);
    procedure Timer2Timer(Sender: TObject);
    procedure ApplicationEvents1ShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure cmSuporteRemotoClick(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure FingReadFingerPrint(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
  private
    { Private declarations }
    FChat : TFrmBaseChat;
    FEspera : TfbListaEspera;
    FBiometria : Boolean;

    procedure EnviarMsg(const aPara: Integer; const aTexto: String);
    procedure MudouAtencao(Sender: TObject);
    procedure LoadDckMgr;
    procedure SetBiometria(const Value: Boolean);

    procedure wmBiometria(var Msg: TMessage);
      message wm_biometria;

  public
    procedure MakeChatVisible(Sender: TObject);
    procedure AjustaVersao;
    procedure RegistraForms;
    
    procedure TentaConectar(Reconexao: Boolean);
    procedure AtualizaDireitos;
    
    function VersaoStr: String;

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
  ufmImagens, 
  ncafbMaquinas,
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
  ncafbImp, 
  ncaFrmSenha, 
  ncaFrmContato, 
  ncaFrmHistVer, 
  ncaFrmTempo,
  ncafbPesqCli, 
  ncafbAvisos, ncafbFiltroWeb, ncVersoes, ncDMServ, 
  ncaLocalizaCli,
  ncFrmSuporteRem, ncaFrmCliente, uWinPopUp, ncaBiometria, ncVersionInfo,
  nxptBasePooledTransport, nxllBde;

{$R *.dfm}



function SimNao(S: String): Boolean;
begin
  Result := SimNaoH(S, FrmPri.Handle);
end;                

function SimNaoH(S: String; H : HWND): Boolean;
begin
  Result := (MessageBox(H, PChar(S), 'Atenção',
             MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = IDYES)
end;                


procedure TFrmPri.TentaConectar(Reconexao: Boolean);
begin
  Caption := 'NexCafé | NexAdmin';

  with TFrmLogin.Create(Self) do
  ShowModal;

  if not Dados.CM.Ativo then Exit;

  Caption := 'NexCafé | NexAdmin | Usuário: ' + Dados.CM.Username + ' | Pasta: ' + ExtractFileDir(ParamStr(0));

//  PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);

  Dados.AbreDB;
  
  cmTrocarUsuario.Caption := 'Trocar de Usuário';
  
  cmSubExibir.Enabled := True;
  dsPri.Visible := True;
  cmImprimir.Enabled := True;
  cmExportar.Enabled := True;
  cmAlterarSenha.Enabled := True;
  cmSubExibir.Caption := 'E&xibir: Máquinas';
  SB.SelectedItem := SB.Groups[0].Items[0];
  FM.Mostrar(TfbMaquinas, 0, 0);
  AtualizaDireitos;
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
    dpChat.Show;
    dpChat.Visible := True;
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

procedure TFrmPri.FormShow(Sender: TObject);
var I : Integer;
begin
  TentaConectar(False);
  if not Dados.CM.Ativo then begin
    Application.Terminate;
    Exit;
  end;
  AjustaVersao;
  FChat := TFrmBaseChat.Create(Self);
  FChat.PrecisaVisibilidade := MakeChatVisible;
  FChat.EnviarMsg := EnviarMsg;
  FChat.NumMaq := 0;
  FChat.panPri.Parent := dpChat;
//  dpChat.Width := lbVersao.Width;

  FEspera := TfbListaEspera.Create(Self);
  FEspera.FiltraDados;
  FEspera.panPri.Parent := dpListaEspera;
  FEspera.ParentChanged;


  if not Permitido(daAtenderClientes) then begin
    dpListaEspera.Close;
    dpChat.Close;
  end else begin
    dpListaEspera.Visible := Versoes.PodeUsar(idre_listaespera);
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
    FChat.panPri.Parent := dpChat;
    FChat.MudouAtencao := Self.MudouAtencao;
    FChat.NaoPiscar := True;
  end;

  Application.CreateForm(TfbPesqCli, fbPesqCli);
  fbPesqCli.FiltraDados;

  LoadDckMgr;

  PostMessage(Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0);
end;

procedure TFrmPri.LoadDckMgr;
var S: String;
begin
  if (Versoes.Versao<250) or DckMgrLoaded then Exit;
  DckMgrLoaded := True;
                             
  S := ExtractFilePath(ParamStr(0))+'NexAdmin.lay';
  if FileExists(S) then
  try
    dckMgr.LoadLayoutFromIniFile(S);
  except
  end;

  if not Permitido(daAtenderClientes) then begin
    dpListaEspera.Close;
    dpChat.Close;
  end;
end;

procedure TFrmPri.MakeChatVisible(Sender: TObject);
begin
//  dpChat.AutoHide := False;
           
  if not Permitido(daAtenderClientes) then begin
    dpListaEspera.Close;
    dpChat.Close;
  end else begin
    dpChat.Show;
    dpChat.Visible := True;
  end;
//  Timer2.Enabled := True;
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

procedure TFrmPri.cmChatClick(Sender: TObject);
begin
{ pagChat.Visible := cmCHat.Down;
  cxSplitter2.Left := Paginas.Left + Paginas.Width - 10;}
end;

procedure TFrmPri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Timer1.Enabled then begin
    try
      FM.Clear;
    except
    end;
  end else begin
    try
      if Dados.CM.Ativo then
        dckMgr.SaveLayoutToIniFile(ExtractFilePath(ParamStr(0))+'NexAdmin.lay');
    except
    end;
    try
      FEspera.cmLaySalvarClick(nil);
    except
    end;
    Action := caNone;
    Timer1.Enabled := True;
    if Dados.CM.Ativo then
      if not (FM.FormAtivo  is TfbMaquinas) then
        FM.Mostrar(TfbMaquinas, 0, null);
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

procedure TFrmPri.cmMaquinasClick(Sender: TObject);
var F : PFrmBaseClass;
begin
  SB.SelectedItem := SB.Groups[0].Items[TdxBarItem(Sender).Tag];
  F := FM.ClassByName(SB.SelectedItem.CustomData);
  cmSubExibir.Caption := 'E&xibir: ' + TdxBarItem(Sender).Caption;
  cmSubExibir.Tag := TdxBarItem(Sender).Tag;
  if (F<>nil) then
    FM.Mostrar(F^, 0, 0);
end;

procedure TFrmPri.AjustaVersao;
var S: String;
begin
  S := IntToStr(Versoes.Versao);
  S := 'Versão ' + S[1] + '.' + S[2] + '.' + S[3] + Copy(SelfVersion, 6, 20);
  cmVerCod.Caption := S+ '  |  Cod.Loja: ' + Dados.CM.Config.CodLoja;
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
      TFrmCliente.Create(nil).Editar(tbCli, nil) else
      Raise Exception.Create('Cliente não encontrado!');
  end;
end;
  
procedure TFrmPri.AtualizaDireitos;
var SBI: TdxSideBarItem;

function SBBloqueioSiteExiste: Boolean;
var I : Integer;
begin
  Result := True;
  for I := 0 to SB.Groups[0].ItemCount-1 do
    if SB.Groups[0].Items[I].Tag = cmBloqueioSite.Tag then
      Exit;
  Result := False;
end;

begin
  Biometria := gConfig.Biometria;
  
  cmUsuarios.Enabled := Dados.CM.UA.Admin;
  cmOpcoes.Enabled := Permitido(daCFGParametros);
  
  if Dados.CM.Config.EscondeTextoBotoes then
    cmMostrarTextoBotoes.Caption := 'Mostrar Texto dos Botões' else
    cmMostrarTextoBotoes.Caption := 'Ocultar Texto dos Botões';
    
  MostrarTextoBotoes := not Dados.CM.Config.EscondeTextoBotoes;    
  SB.Groups[0].Items[cmUsuarios.Tag].Enabled := cmUsuarios.Enabled;
  SB.Groups[0].Items[cmOpcoes.Tag].Enabled := cmOpcoes.Enabled;
  SB.Groups[0].Items[cmTarifas.Tag].Enabled := cmTarifas.Enabled;
  AjustaVersao;

  if not Permitido(daAtenderClientes) then begin
    dpListaEspera.Close;
    dpChat.Close;
  end else begin
    dpListaEspera.Visible := Versoes.PodeUsar(idre_listaespera);
    dpChat.Visible := Versoes.PodeUsar(idre_chat) and (gConfig.OpcaoChat<>ochDesabilitar);
  end;

  if Versoes.PodeUsar(idre_bloqueiosite) then begin
    cmBloqueioSite.Visible := ivAlways;
    if not SBBloqueioSiteExiste then begin
      SBI := SB.Groups[0].Items.Add;
      SBI.Tag := cmBloqueioSite.Tag;
      SBI.Caption := 'Bloqueio de Sites';
      SBI.CustomData := 'TfbFiltroWeb';
      SBI.LargeImage := 67;
    end;
  end else begin
    cmBloqueioSite.Visible := ivNever;
    if SBBloqueioSiteExiste then
      SB.Groups[0].Items[cmBloqueioSite.Tag].Free;
  end;
  FM.AtualizaDireitos;
end;

procedure TFrmPri.SBItemClick(Sender: TObject; Item: TdxSideBarItem);
var F : PFrmBaseClass;
begin
  F := FM.ClassByName(Item.CustomData);
  cmSubExibir.Caption := 'E&xibir: '+ Item.Caption;
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

procedure TFrmPri.SBChangeSelectedItem(Sender: TObject);
begin
  if not SB.SelectedItem.Enabled then
    SB.SelectedItem := SB.Groups[0].Items[cmSubExibir.Tag];
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

procedure TFrmPri.btnChatClick(Sender: TObject);
begin
  dpChat.AutoHide := False;
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

procedure TFrmPri.RegistraForms;
begin
  FM.RegistraForm(TfbMaquinas);
  FM.RegistraForm(TfbClientes);
  FM.RegistraForm(TfbProdutos);
  FM.RegistraForm(TfbCaixa);
  FM.RegistraForm(TfbOpcoes);
  FM.RegistraForm(TfbTarifas);
  FM.RegistraForm(TfbUsuarios);
  FM.RegistraForm(TfbImp);
  FM.RegistraForm(TfbAvisos);
  FM.RegistraForm(TfbFiltroWeb);
end;

procedure TFrmPri.dpListaEsperaCloseQuery(Sender: TdxCustomDockControl;
  var CanClose: Boolean);
begin
  CanClose := False;
end;

procedure TFrmPri.dxBarButton1Click(Sender: TObject);
begin
  ShowMessage('A senha para suporte remoto a partir da máquina cliente é: SOS');
end;

procedure TFrmPri.dxBarButton2Click(Sender: TObject);
begin
  dpListaEspera.Close;
  dpChat.Close;
end;

procedure TFrmPri.dxBarButton6Click(Sender: TObject);
begin
  TFrmContato.Create(Self).ShowModal;
end;

procedure TFrmPri.FormCreate(Sender: TObject);
begin
  FBiometria := False;
  RegistraForms;  
  FChat := nil;
  cmVerCod.Caption := '|  Versão: ' + SelfVersion + '  |  Cod.Loja: ' + Dados.CM.Config.CodLoja + '  |';
end;

procedure TFrmPri.dxBarButton9Click(Sender: TObject);
begin
  TFrmRTF.Create(Self).Mostrar('Histórico de Versões', 'cmhist.rtf');
end;

procedure TFrmPri.EnviarMsg(const aPara: Integer; const aTexto: String);
begin
  Dados.CM.EnviaChat(aPara, aTexto);
//  FChat.MsgEnv(Now, FChat.NumMaq, aPara, aTexto);
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
  end;  
  FM.AtualizaDireitos;
end;

initialization
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
  
  
  

end.













                                                      
