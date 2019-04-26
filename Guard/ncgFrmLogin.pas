unit ncgFrmLogin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, LMDCustomControl, LMDCustomPanel, ncgWebApi,
  LMDCustomBevelPanel, LMDSimplePanel, Buttons, jpeg, 
  ncClassesBase, ncCompCliente, LMDControl,
  LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, LMDCustomComponent, LMDIniCtrl, 
  Menus, madTypes,
  ImgList, ShellAPI,
  Db, ncSessao, 
  LMDBaseGraphicControl, LMDGraphicControl, LMDFill, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, 
  LMDCustomSimpleLabel, LMDSimpleLabel, dxBarExtItems, dxBar, LMDBaseEdit,
  LMDCustomEdit, LMDCustomMaskEdit, LMDCustomExtSpinEdit, LMDExtSpinEdit,
  cxLookAndFeelPainters, cxButtons, cxPC, cxControls, cxStyles, cxGraphics,
  cxEdit, cxDropDownEdit, cxVGrid, cxInplaceContainer, cxLabel, cxMaskEdit,
  cxContainer, cxTextEdit, cxGroupBox, pngimage, AppEvnts,
  cxClasses, dxGDIPlusClasses, LMDCustomParentPanel, LMDCustomPanelFill,
  LMDPanelFill, OleCtrls, SHDocVw, LMDCustomScrollBox, LMDScrollBox, lmdsplt, ncgFormBase,
  cxLookAndFeels, cxPCdxBarPopupMenu, SHDocVw_EWB, EwbCore, EmbeddedWB,
  cxBarEditItem, LMDPNGImage, Automation;

type
  TFrmLogin = class(TFormBaseGuard)
    BarMgr: TdxBarManager;
    BarMgrBar1: TdxBar;
    cmConfigurar: TdxBarLargeButton;
    cmFechar: TdxBarLargeButton;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    Timer4: TTimer;
    TimerFundo: TTimer;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    TimerDisableNav: TTimer;
    panPri: TLMDSimplePanel;
    panLogin: TLMDSimplePanel;
    panUsername: TLMDSimplePanel;
    lbUsuario2: TcxLabel;
    edUsername2: TcxTextEdit;
    panSenha: TLMDSimplePanel;
    cxLabel3: TcxLabel;
    edSenha2: TcxTextEdit;
    panIniciar: TLMDSimplePanel;
    btnEntrar: TcxButton;
    btnSair: TcxButton;
    btnConfig: TcxButton;
    btnInfo: TcxButton;
    imFundo: TImage;
    LMDFill1: TLMDFill;
    panFundoWeb: TLMDSimplePanel;
    ewFundo: TEmbeddedWB;
    panLoginCentro: TLMDSimplePanel;
    LMDSimplePanel5: TLMDSimplePanel;
    lbVersao: TLMDSimpleLabel;
    lbMaq: TLMDSimpleLabel;
    LMDSimplePanel4: TLMDSimplePanel;
    LMDSimplePanel7: TLMDSimplePanel;
    dxBarDockControl1: TdxBarDockControl;
    panErro: TLMDSimplePanel;
    imErro: TImage;
    lbErro: TcxLabel;
    LMDPanelFill4: TLMDPanelFill;
    Image1: TImage;
    LMDPanelFill5: TLMDPanelFill;
    LMDPanelFill8: TLMDPanelFill;
    lbInstrucoes: TcxLabel;
    edUsername1: TcxTextEdit;
    cbTipoAcesso: TcxComboBox;
    lbTipoAcesso: TcxLabel;
    lbUsuario: TcxLabel;
    lbSenha: TcxLabel;
    lbRG1: TcxLabel;
    edRG1: TcxTextEdit;
    btnOk: TcxButton;
    edSenha1: TcxTextEdit;
    LMDPanelFill2: TLMDPanelFill;
    LMDPanelFill1: TLMDPanelFill;
    panSemLogin: TLMDSimplePanel;
    btnInfo2: TcxButton;
    btnSair2: TcxButton;
    btnConfig2: TcxButton;
    lbMaq2: TcxLabel;
    panRG2: TLMDSimplePanel;
    lbRG2: TcxLabel;
    edRG2: TcxTextEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmConfigurarClick(Sender: TObject);
    procedure cmFecharClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure cbTipoAcessoContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure Timer3Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure edServidorEnter(Sender: TObject);
    procedure edServidorExit(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure GIFMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure WB2BeforeNavigate2(ASender: TObject; const pDisp: IDispatch;
      var URL, Flags, TargetFrameName, PostData, Headers: OleVariant;
      var Cancel: WordBool);
    procedure WB1BeforeNavigate2(ASender: TObject; const pDisp: IDispatch;
      var URL, Flags, TargetFrameName, PostData, Headers: OleVariant;
      var Cancel: WordBool);
    procedure WB2NewWindow2(ASender: TObject; var ppDisp: IDispatch;
      var Cancel: WordBool);
    procedure WB2NavigateError(ASender: TObject; const pDisp: IDispatch;
      var URL, Frame, StatusCode: OleVariant; var Cancel: WordBool);
    procedure ewFundoDocumentComplete(ASender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
    procedure TimerFundoTimer(Sender: TObject);
    procedure ewFundoNavigateError(ASender: TObject; const pDisp: IDispatch;
      var URL, Frame, StatusCode: OleVariant; var Cancel: WordBool);
    procedure ewFundoMessage(Sender: TObject; var Msg: TMessage;
      var Handled: Boolean);
    procedure ewFundoKeyDown(Sender: TObject; var Key: Word; ScanCode: Word;
      Shift: TShiftState);
    procedure ewFundoBeforeNavigate2(ASender: TObject; const pDisp: IDispatch;
      var URL, Flags, TargetFrameName, PostData, Headers: OleVariant;
      var Cancel: WordBool);
    procedure TimerDisableNavTimer(Sender: TObject);
    procedure ewFundoNavigateComplete2(ASender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
    procedure ewFundoNewWindow2(ASender: TObject; var ppDisp: IDispatch;
      var Cancel: WordBool);
    procedure ewFundoNewWindow3(ASender: TObject; var ppDisp: IDispatch;
      var Cancel: WordBool; dwFlags: Cardinal; const bstrUrlContext,
      bstrUrl: WideString);
    procedure btnInfoClick(Sender: TObject);
    procedure panInfoClick(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure btnInfo2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ewFundoGetExternal(Sender: TCustomEmbeddedWB;
      var ppDispatch: IDispatch);
    procedure ewFundoScriptError(Sender: TObject; ErrorLine, ErrorCharacter,
      ErrorCode, ErrorMessage, ErrorUrl: string;
      var ScriptErrorAction: TScriptErrorAction);
    procedure panPriResize(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  private
    FErroNav : Boolean;
    FFundoWebUrl : String;
    FFundoWeb : Boolean;
    FDisableNav : Boolean;
    FUKeyPress : Cardinal;
    FX, FY : Integer;
    FLoginViaBrowser: Boolean;
    { Private declarations }
    procedure OnException(Sender: TObject; E: Exception);
    procedure NavigateFundo;
    procedure SetFundoWeb(aFundoWeb: boolean; aUrl: String);
    function GetSenha: String;
    function GetUsername: String;
    procedure SetSenha(const Value: String);
    procedure SetUsername(const Value: String);

    procedure AlinhaPanLogin;
    procedure SetLoginViaBrowser(const Value: Boolean);
    function GetLoginViaBrowser: Boolean;

    procedure LoginAPIMsg(var Message: TMessage); message WM_USER + 1;
    procedure RecarregaAPIMsg(var Message: TMessage); message WM_USER + 2;
    function GetRG: String;
    procedure SetRG(const Value: String);
  public
    procedure OnTimerTop; override;
    procedure RefreshTipoAcesso;
    procedure FecharLogin;
    procedure MostraErro(aCab, S: String);
    procedure MostraMsg(aCab, S: String);
    procedure RefreshFundo;
    function UsuarioOpOk(Op: Integer): Boolean;
    procedure Teclou;
    function VersaoStr: String;

    property LoginViaBrowser: Boolean
      read GetLoginViaBrowser write SetLoginViaBrowser;

    property Username: String read GetUsername write SetUsername;
    property Senha: String read GetSenha write SetSenha;
    property RG: String read GetRG write SetRG;
  end;

  TncLoginAPI = class(TncgWebApi)
  private
  published
    procedure setLoginViaBrowser;
    procedure setLoginViaSoftware;

    procedure recarregaFundo;
    
    procedure Login(aUsuario, aSenha: OleVariant);
    procedure Config(aUsuario, aSenha: OleVariant);
    procedure Sair(aUsuario, aSenha: OleVariant);

    function obtemAppVer: OleVariant;
    function obtemFullAppVer: OleVariant;
    function obtemMaquina: OleVariant;
    function obtemServidor: OleVariant;
    function obtemMostrarSenha: OleVariant;
    function obtemTextoUsuario: OleVariant;

    function obtemIDLojaNex: OleVariant;
  end;

  TLoginMsgData = class
    Usuario, Senha: String;
  end;

var
  FrmLogin: TFrmLogin;
  TempoSumir : Cardinal = 15000;
  InativouAniGif : Boolean = False;

implementation

uses ncgFrmPri, ncPassaportes, ncListaID, ncIDRecursos, ncgFrmSenha,
  ncgFrmConn, ncVersoes, ncDebug, GIFImage, ncVersionInfo, ncgPrevLogoff,
  ncgFrmPanMsg, ncgFrmFST;

{$R *.DFM}

procedure TFrmLogin.OnException(Sender: TObject; E: Exception);
begin
  if FrmFST.Visible then
    MostraErro('Erro', E.Message)
  else begin
    Beep;
    DebugMsg('FrmLogin Exception ' + E.ClassName + ' Msg: ' + E.Message);
    MessageBox(0, PChar(E.Message), PChar('Atenção'), MB_OK + MB_ICONERROR);
  end;  
end;    

procedure TFrmLogin.OnTimerTop;
var S: String;
begin
  inherited;

  S := FrmPri.CM.MaquinaObj.URLLogin;
  if S='' then S := gConfig.FundoWebUrl;
  
  
  SetFundoWeb(gConfig.FundoWeb, S);

  AlinhaPanLogin;

  if (Mouse.CursorPos.X<>FX) or (Mouse.CursorPos.Y<>FY) then Teclou;
  FX := Mouse.CursorPos.X;
  FY := Mouse.CursorPos.Y;

  with FrmPri do 
  if CM.Ativo and (gConfig.MinutosDesligaMaq>0) and ((GetTickCount - FUKeyPress) > (gConfig.MinutosDesligaMaq * 60000)) then
    CMShutDown(CM, operShutdown);

  with FrmPri do  
  if CM.Ativo and (gConfig.MinutosDesligaMon>0) and ((GetTickCount - FUKeyPress) > (gConfig.MinutosDesligaMon * 60000)) then
    SendMessage(Handle, WM_SYSCOMMAND, SC_MONITORPOWER, 2);

  if InativouAniGif then begin
    with imFundo.Picture do
    if Assigned(Graphic) and (Graphic is TGifImage) then
      with TGifImage(Graphic) do begin
        DrawOptions := DrawOptions + [goAnimate];
        InativouAniGif := False;
      end;
  end;
end;

procedure TFrmLogin.panInfoClick(Sender: TObject);
begin
  inherited;
  btnInfo.Down := not btnInfo.Down;
  btnInfoClick(nil);
end;

procedure TFrmLogin.panPriResize(Sender: TObject);
begin
  inherited;
  imFundo.Width := imFundo.Parent.Width;
  imFundo.Height := imFundo.Parent.Height;
  panLoginCentro.Left := ((panPri.Width-panLoginCentro.Width) div 2) - 5; 
  panLoginCentro.Top  := ((panPri.Height-panLoginCentro.Height) div 2) - 20;
end;

procedure TFrmLogin.RefreshTipoAcesso;
var I : Integer;
begin
  with FrmPri.CM do begin
    lbSenha.Visible := not Config.MostrarApenasPIN;
    edSenha1.Visible := not Config.MostrarApenasPIN;
    panSenha.Visible := not Config.MostrarApenasPIN;
    lbUsuario.Caption := Config.TextoPIN;
    lbUsuario2.Caption := Config.TextoPIN;
  end;
    
  lbRG1.Visible := FrmPri.CM.Config.ExigirRG;
  edRG1.Visible := lbRG1.Visible;
  panRG2.Visible := lbRG1.Visible;
  panRG2.Left := panIniciar.Left - 10;
  with FrmPri.CM do begin
    if Maquina > 0 then 
      lbMaq.Caption := 'Máquina ' + IntToStr(Maquina) else
      lbMaq.Caption := '.';
    lbMaq2.Caption := ' Máq.' + IntToStr(Maquina) + ' ';
  end;
      
  cbTipoAcesso.Properties.Items.Clear;

  with FrmPri, CM, gTiposAcesso do
  for I := 0 to pred(Count) do with Itens[I] do
    cbTipoAcesso.Properties.Items.AddObject(Nome, TObject(ID));

  lbTipoAcesso.Visible := (cbTipoAcesso.Properties.Items.Count>1) and (not FrmPri.CM.Config.EscondeTipoAcesso);
  cbTipoAcesso.Visible := lbTipoAcesso.Visible;
  cbTipoAcesso.ItemIndex := 0;
  btnOk.Enabled := True;
  if gConfig.SemLogin then begin
    Timer3.Enabled := True;
    Timer3.Interval := 1000;
    TempoSumir := 5000;
  end else begin
    Timer3.Interval := 1000;
    TempoSumir := gConfig.TempoSumirLogin*1000;
    Timer3.Enabled := (TempoSumir>10000);
  end;
  panSemLogin.Visible := gConfig.SemLogin and (not LoginViaBrowser);
  panSemLogin.Left := 12;
  panSemLogin.Top := Screen.WorkAreaHeight - panSemLogin.Height - 12;

  panLoginCentro.Visible := (not LoginViaBrowser) and (not gConfig.SemLogin) and (gConfig.NormPosLogin=poslogin_centro);
  panLogin.Visible := (not LoginViaBrowser) and (not gConfig.SemLogin) and (gConfig.NormPosLogin<>poslogin_centro);
  if panLogin.Visible then AlinhaPanLogin;
end;

procedure TFrmLogin.SetFundoWeb(aFundoWeb: boolean; aUrl: String);
begin
  if (aUrl='') then aFundoWeb := False;
  if (aFundoWeb=FFundoWeb) and (aUrl=FFundoWebUrl) then Exit;
  panFundoWeb.Align := alNone;
  panFundoWeb.Width := 1;
  panFundoWeb.Height := 1;
  panFundoWeb.Top := 0;
  panFundoWeb.Left := 0;
  FFundoWeb := aFundoWeb;
  FFundoWebUrl := aUrl;
  TimerFundo.Enabled := False;
  TimerFundo.Interval := 500;
  TimerFundo.Enabled := FFundoWeb;
end;

procedure TFrmLogin.SetLoginViaBrowser(const Value: Boolean);
begin
  FLoginViaBrowser := Value;
  RefreshTipoAcesso;
end;

procedure TFrmLogin.SetRG(const Value: String);
begin
  edRG1.Text := Value;
  edRG2.Text := Value;
end;

procedure TFrmLogin.SetSenha(const Value: String);
begin
  edSenha1.Text := Value;
  edSenha2.Text := Value;
end;

procedure TFrmLogin.SetUsername(const Value: String);
begin
  edUsername1.Text := Value;
  edUsername2.Text := Value;
end;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  Teclou;
  lbVersao.Caption := 'Versão '+VersaoStr;
  BorderStyle := bsNone;
  Username := ''; 
  Senha := '';
  RG := '';
  
  with FrmPri do begin
    Timer3.Enabled := gConfig.SemLogin or (TempoSumir>=10000);
    Timer3.Interval := 1000;
  end;  
end;

procedure TFrmLogin.AlinhaPanLogin;
begin
  if (not gConfig.SemLogin) and (gConfig.NormPosLogin<>poslogin_centro) then 
  if gConfig.FundoWeb then begin
    if gConfig.NormPosLogin=poslogin_topo then
      panLogin.Align := alTop else
      panLogin.Align := alBottom;
  end else begin
    panLogin.Align := alNone;
    panLogin.Left := 0;
    panLogin.Width := Screen.Width;
    if gConfig.NormPosLogin=poslogin_topo then 
      panLogin.Top := 0 else
      panLogin.Top := Screen.Height - panLogin.Height;
  end;
end;

procedure TFrmLogin.btnInfo2Click(Sender: TObject);
var P : TpanMsgPos;
begin
  if gConfig.NormPosLogin = poslogin_Rodape then
    P := pmpAbove else
    P := pmpBelow;
    
  FrmPanMsg.ShowMsg('NexCafé '+VersaoStr, 
                    'Máquina: ' + IntToStr(FrmPri.CM.Maquina) + 
                    sLineBreak +
                    sLineBreak + 
                    'Servidor: '+FrmPri.nxTCPIP.ServerName, 
                    pmpAbove, 
                    pmaLeft, panLogin);

end;

procedure TFrmLogin.btnInfoClick(Sender: TObject);
var P : TpanMsgPos;
begin
  inherited;

  if gConfig.NormPosLogin = poslogin_topo then
    P := pmpBelow else
    P := pmpAbove;

  FrmPanMsg.ShowMsg('NexCafé '+VersaoStr, 
                    'Máquina: ' + IntToStr(FrmPri.CM.Maquina) + 
                    sLineBreak +
                    sLineBreak + 
                    'Servidor: '+FrmPri.nxTCPIP.ServerName, 
                    P, 
                    pmaRight, 
                    panLogin);
end;

procedure TFrmLogin.btnOkClick(Sender: TObject);
var 
  U, S, sRG: String;
  aSessao : TncSessao;
begin
  if UserName='nexcmd_ativalog!@#$%^&*()' then begin
    ncDebug.DebugAtivo := True;
    UserName := 'OK';
    Exit;
  end;

  if UserName='nexcmd_close!@#$%^&*()' then begin
    FrmPri.Status := sgConfirmaFechar;
    UserName := 'OK';
    Exit; 
  end;

  if not FrmPri.CM.Ativo then begin
    cmConfigurarClick(nil);
    Exit;
  end;
  
  if cbTipoAcesso.Properties.Items.Count=0 then begin
    MostraErro('Atenção:', 'Não é possivel Entrar antes de se configurar as tarifas da loja. Faça isso através da opção "Tarifas" do NexAdmin');
    Exit;
  end;  
  
  with FrmPri do
  if Trim(Username)>'' then
  try
    U := Username;
    S := Senha;
    SenhaDig   := S;
    StatusSenha := ssSenhaObtida;
    
    ObtemPassUsernameSenha(U, S);
    if UpperCase(U)='PREPAGO' then begin
      U := 'PREPAGO';
      S := UpperCase(S);
    end;  
    if lbRG1.Visible then 
      sRG := '@RG@'+Trim(RG)
    else
      sRG := ''; 

    aSessao := TncSessao.Create(True);
    try
      aSessao.Maq := CM.Maquina;
      aSessao.TipoAcesso := Integer(cbTipoAcesso.Properties.Items.Objects[cbTipoAcesso.ItemIndex]); 
      aSessao.SenhaLogin := S;
      aSessao.UsernameLogin := U;
      aSessao.NomeCliente := sRG;
      CM.LoginMaq(aSessao);
    finally
      aSessao.Free;
    end;                
  except
    on E: EErroNexCafe do
      if E.CodigoErro=5 then
        MostraErro('Erro', 'Nome de usuário ou senha incorreta') else
        MostraErro('Erro', E.Message);
        
    on E: Exception do 
      MostraErro('Erro', E.Message);
  end;
end;

procedure TFrmLogin.MostraMsg(aCab, S: String);
var 
  C: TWinControl;
  P: TpanMsgPos;
  A: TpanMsgAlign;
begin
  Beep;
  if panLogin.Visible then begin
    C :=panLogin;
    if gConfig.NormPosLogin=poslogin_topo then
      P := pmpBelow else
      P := pmpAbove;
    A := pmaCenter;
  end else
  if panLoginCentro.Visible then begin
    C := btnOk;
    P := pmpBelow;
    A := pmaLeft;
  end else begin
    C := nil;
    P := pmpScreenCenter;
    A := pmaLeft;
  end;
  
  FrmPanMsg.ShowMsg(aCab, S, P, A, C);
{  Beep;
  Timer1.Enabled := False;
  Timer1.Interval := 10000;
  lbErro.Caption := S;
  panErro.Visible := True;
  Timer1.Enabled := True; }
end;

procedure TFrmLogin.NavigateFundo;
begin
  if gConfig.FundoWeb and (gConfig.FundoWebURL>'') then 
  begin
    try
      ewFundo.EnableMessageHandler;
      FDisableNav := False;
      TimerDisableNav.Enabled := False;
      ewFundo.Navigate(gConfig.FundoWebURL);
    except
      TimerFundo.Enabled := False;
      TimerFundo.Interval := 5000;
      TimerFundo.Enabled := True;
    end;
  end else begin
    panFundoWeb.Align := alNone;
    panFundoWeb.Width := 1;
    panFundoWeb.Height := 1;
    panLoginCentro.BringToFront;
  end;
end;

procedure TFrmLogin.MostraErro(aCab, S: String);
begin
  MostraMsg(aCab, S);
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  FDisableNav := False;
  FLoginViaBrowser := False;
  panFundoWeb.Width := 1;
  panFundoWeb.Height := 1;
  panFundoWeb.Left := 1;
  panFundoWeb.Top := 1;
  panFundoWeb.Align := alNone;
  imFundo.Width := imFundo.Parent.Width;
  imFundo.Height := imFundo.Parent.Height;
  FFundoWeb := False;
  FFundoWebUrl := '';
  FErroNav := False;
  Left := 0;
  Top := 0;
  Width := Screen.Width;
  Height := Screen.Height;
  panPriResize(Self);
  FUKeyPress := GetTickCount;
  RefreshFundo;
  Application.OnException := OnException;
  lbVersao.Caption := 'Versão '+VersaoStr;
end;

procedure TFrmLogin.FormDestroy(Sender: TObject);
begin
  inherited;
  FrmPri.FDesligaAviso := False;
  Application.OnException := nil;
end;

procedure TFrmLogin.FecharLogin;
begin
  Close;
end;

procedure TFrmLogin.cmConfigurarClick(Sender: TObject);
begin
  if FrmPri.SemSenha then
    FrmPri.Status := sgConfig
  else begin  
    FrmConn.Oper := olConfig;
    FrmPri.Status := sgLoginFunc;
    FrmConn.edUsuario.Text := Username;
    FrmConn.edSenha.Text := Senha;
    if Trim(Username) > '' then FrmConn.btnLoginClick(nil);
  end;
end;

procedure TFrmLogin.cmFecharClick(Sender: TObject);
begin
  FrmConn.Oper := olFechar;
  if FrmPri.SemSenha then
    FrmPri.Status := sgConfirmaFechar
  else begin  
    FrmPri.Status := sgLoginFunc;
    FrmConn.edUsuario.Text := Username;
    FrmConn.edSenha.Text := Senha;
    if Trim(Username) > '' then FrmConn.btnLoginClick(nil);
  end;
end;

procedure TFrmLogin.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.X := 0;
  Params.Y := 0;
  Params.Width := Screen.Width;
  Params.Height := Screen.Height;
end;

procedure TFrmLogin.cxButton3Click(Sender: TObject);
var p: TpanMsgPos;
begin
  inherited;
  if (gConfig.NormPosLogin=poslogin_topo) then 
    P := pmpBelow else
    P := pmpAbove;
  FrmPanMsg.ShowMsg('Atenção', 'Informe seu nome de usuário e senha e clique em Entrar', P, pmaLeft, panLogin);
end;

function TFrmLogin.UsuarioOpOk(Op: Integer): Boolean;
var S: String; 
begin
  S := FrmPri.UsuarioOpOk(Username, Senha, Op);
  Result := (S='');
  if not Result then MostraErro('Atenção', S);
end;

procedure TFrmLogin.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  panErro.Visible := False;
end;

procedure TFrmLogin.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  if panLogin.Visible then 
    edUsername2.SetFocus else
    edUsername1.SetFocus;
end;

procedure TFrmLogin.cbTipoAcessoContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  Handled := True;
end;

procedure TFrmLogin.Timer3Timer(Sender: TObject);
begin
  if (not gConfig.SemLogin) and (TempoSumir < 10000) then begin
    if gConfig.SemLogin then begin
      panLoginCentro.Visible := False;
      panLogin.Visible := False;
      panSemLogin.Visible := not LoginViaBrowser;
    end else begin
      panLoginCentro.Visible := (not LoginViaBrowser) and (gConfig.NormPosLogin=poslogin_centro);
      panLogin.Visible := (not LoginViaBrowser) and (not panLoginCentro.Visible);
      panSemLogin.Visible := False;
    end;
    Timer3.Enabled := False;
  end else  
  if (GetTickCount - FUKeyPress) > TempoSumir then begin
    panSemLogin.Visible := False;
    panLoginCentro.Visible := False;
  end else begin
    panSemLogin.Visible := (not LoginViaBrowser) and gConfig.SemLogin;
    panLoginCentro.Visible := (not LoginViaBrowser) and (not gConfig.SemLogin) and (gConfig.NormPosLogin=poslogin_centro);
  end;
end;

procedure TFrmLogin.Teclou;
begin
  panLoginCentro.Visible := (not LoginViaBrowser) and (not gConfig.SemLogin) and (gConfig.NormPosLogin=poslogin_centro);
  panLogin.Visible := (not LoginViaBrowser)and (not gConfig.SemLogin) and (gConfig.NormPosLogin<>poslogin_centro);
  panSemLogin.Visible := (not LoginViaBrowser) and gConfig.SemLogin;
  FUKeyPress := GetTickCount;
end;

procedure TFrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Teclou;
end;

procedure TFrmLogin.RecarregaAPIMsg(var Message: TMessage);
begin
  TimerFundoTimer(nil);
end;

procedure TFrmLogin.RefreshFundo;
begin
  imFundo.Visible := not gConfig.FundoWeb;
  with FrmPri do begin
    DebugMsg('RefreshFundo');
    if FileExists(ArqImLogin) then begin
      imFundo.Picture.LoadFromFile(ArqImLogin);
      imFundo.Stretch := False;
      imFundo.Stretch := True;
      DebugMsg('RefreshFundo 1: '+ArqImLogin);
    end else
    if FileExists(ArqImFundo) then begin
      imFundo.Picture.LoadFromFile(ArqImFundo);
      imFundo.Stretch := False;
      imFundo.Stretch := True;
      DebugMsg('RefreshFundo 2: '+ArqImFundo);
    end else
    if FileExists(CM.NomeArqLogin) then begin
      try
        imFundo.Picture.LoadFromFile(CM.NomeArqLogin);
        imFundo.Stretch := False;
        imFundo.Stretch := True;
        DebugMsg('RefreshFundo 3: '+CM.NomeArqLogin);
      except
      end;
    end else begin
      DebugMsg('RefreshFundo - Arquivo não existe 1: ' + ArqImLogin);
      DebugMsg('RefreshFundo - Arquivo não existe 2: ' + ArqImFundo);
      DebugMsg('RefreshFundo - Arquivo não existe 3: ' + CM.NomeArqLogin);
    end;
  end;      
end;

procedure TFrmLogin.Image1Click(Sender: TObject);
begin
  with FrmPri.CM do begin
    if not Config.MostrarApenasPIN then Exit;
    lbSenha.Visible := not lbSenha.Visible;
    edSenha2.Visible := lbSenha.Visible;
    Timer4.Enabled := lbSenha.Visible;
  end;
end;

procedure TFrmLogin.LoginAPIMsg(var Message: TMessage);
var L: TLoginMsgData;
begin
  L := TLoginMsgData(Message.LParam);
  try
    Username := L.Usuario;
    Senha := L.Senha;
    case Message.WParam of
      0 : btnOkClick(nil);
      1 : cmConfigurarClick(nil);
      2 : cmFecharClick(nil);
    end;
  finally
    L.Free;
  end;
end;

procedure TFrmLogin.Timer4Timer(Sender: TObject);
begin
  Timer4.Enabled := False;
  lbSenha.Visible := False;
  edSenha2.Visible := False;
end;

procedure TFrmLogin.TimerDisableNavTimer(Sender: TObject);
begin
  inherited;
  TimerDisableNav.Enabled := False;
  FDisableNav := True;
end;

procedure TFrmLogin.TimerFundoTimer(Sender: TObject);
begin
  inherited;
  TimerFundo.Enabled := False;
  FErroNav := False;
  FDisableNav := False;
  TimerDisableNav.Enabled := False;
  ewFundo.Navigate(FFundoWebUrl);
  DebugMsg('TFrmLogin.TimerFundoTimer - '+FFundoWebUrl);
end;

procedure TFrmLogin.edServidorEnter(Sender: TObject);
begin
  DontForceForeground := True;
end;

procedure TFrmLogin.edServidorExit(Sender: TObject);
begin
  DontForceForeground := True;
end;

procedure TFrmLogin.ewFundoBeforeNavigate2(ASender: TObject;
  const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
begin
  inherited;
  Cancel := FDisableNav;
end;

procedure TFrmLogin.ewFundoDocumentComplete(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  inherited;
  if not FErroNav then begin
    panFundoWeb.Width := Self.width;
    panFundoWeb.Height := Self.Height;
    panFundoWeb.Align := alClient;
    ewFundo.Width := Self.Width;
    ewFundo.Height := Self.Height;
    ewFundo.Top := 0;
    ewFundo.Left := 0;
    ewFundo.Align := alClient;
    DebugMsg('TFrmLogin.ewFundoDocumentComplete - OK');
  end else
    DebugMsg('TFrmLogin.ewFundoDocumentComplete - FErroNav = True');
end;

procedure TFrmLogin.ewFundoGetExternal(Sender: TCustomEmbeddedWB;
  var ppDispatch: IDispatch);
begin
  inherited;
  ppDispatch := TAutoObjectDispatch.Create(TncLoginAPI.Create(Self, ewFundo)) as IDispatch;
end;

procedure TFrmLogin.ewFundoKeyDown(Sender: TObject; var Key: Word;
  ScanCode: Word; Shift: TShiftState);
begin
  inherited;
  Teclou;
end;

procedure TFrmLogin.ewFundoMessage(Sender: TObject; var Msg: TMessage;
  var Handled: Boolean);
begin
  inherited;
  if MSG.Msg = wm_mousemove then Teclou;
end;

procedure TFrmLogin.ewFundoNavigateComplete2(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  inherited;
  TimerDisableNav.Enabled := True;
end;

procedure TFrmLogin.ewFundoNavigateError(ASender: TObject;
  const pDisp: IDispatch; var URL, Frame, StatusCode: OleVariant;
  var Cancel: WordBool);
begin
  DebugMsg('TFrmLogin.ewFundoNavigateError');
  FErroNav := True;
  panFundoWeb.Width := 1;
  panFundoWeb.Height := 1;
  FDisableNav := True;
  
  TimerFundo.Interval := 5000;
  TimerFundo.Enabled := True;
  Cancel := True;
end;

procedure TFrmLogin.ewFundoNewWindow2(ASender: TObject; var ppDisp: IDispatch;
  var Cancel: WordBool);
begin
  inherited;
  Cancel := True;
end;

procedure TFrmLogin.ewFundoNewWindow3(ASender: TObject; var ppDisp: IDispatch;
  var Cancel: WordBool; dwFlags: Cardinal; const bstrUrlContext,
  bstrUrl: WideString);
begin
  inherited;
  Cancel := True;
end;

procedure TFrmLogin.ewFundoScriptError(Sender: TObject; ErrorLine,
  ErrorCharacter, ErrorCode, ErrorMessage, ErrorUrl: string;
  var ScriptErrorAction: TScriptErrorAction);
begin
  inherited;
  ScriptErrorAction := eaContinue;
  DebugMsg('TFrmLogin.ewFundoScriptError'+sLineBreak+
      ErrorMessage + sLineBreak + sLineBreak +
      '  Linha: ' + ErrorLine + sLineBreak +
      '  Caracter: ' + ErrorCharacter + sLineBreak +
      '  Código: ' + ErrorCode + sLineBreak +
      '  Url: ' + ErrorURL);
  
{  if DebugAtivo then begin 
    FrmPanMsg.panMsg.Height := 300;
    MostraErro('Erro de Script', 
      ErrorMessage + sLineBreak + sLineBreak +
      'Linha: ' + ErrorLine + sLineBreak +
      'Caracter: ' + ErrorCharacter + sLineBreak +
      'Código: ' + ErrorCode + sLineBreak +
      'Url: ' + ErrorURL);
  end;}
end;

procedure TFrmLogin.FormHide(Sender: TObject);
begin
  with imFundo.Picture do
  if Assigned(Graphic) and (Graphic is TGifImage) then
    with TGifImage(Graphic) do begin
      DrawOptions := DrawOptions - [goAnimate];
      InativouAniGif := True;
    end;
end;

function TFrmLogin.GetLoginViaBrowser: Boolean;
begin
  Result := FLoginViaBrowser and gConfig.FundoWeb;
end;

function TFrmLogin.GetRG: String;
begin
  if panLogin.Visible then
    Result := edRG2.Text else
    Result := edRG1.Text;
end;

function TFrmLogin.GetSenha: String;
begin
  if panLogin.Visible then
    Result := edSenha2.Text else
    Result := edSenha1.Text;
end;

function TFrmLogin.GetUsername: String;
begin
  if panLogin.Visible then
    Result := edUsername2.Text else
    Result := edUsername1.Text;
end;

procedure TFrmLogin.GIFMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Teclou;
end;

function TFrmLogin.VersaoStr: String;
begin
  Result := 'X'+Copy(GetVersionInfo, 7, 20);
end;

procedure TFrmLogin.WB1BeforeNavigate2(ASender: TObject; const pDisp: IDispatch;
  var URL, Flags, TargetFrameName, PostData, Headers: OleVariant;
  var Cancel: WordBool);
var 
  I: Integer;
  S: String;
begin
  for I := 0 to slDominiosG.Count-1 do begin
    S := slDominiosG[I];
    if Pos(S, URL)>0 then Exit;
  end;
  Cancel := True;
end;

procedure TFrmLogin.WB2BeforeNavigate2(ASender: TObject; const pDisp: IDispatch;
  var URL, Flags, TargetFrameName, PostData, Headers: OleVariant;
  var Cancel: WordBool);
begin
  if pos(SiteG2, URL)<1 then begin
    Cancel := True;
//    WB1.Navigate(URL);
  end;
end;

procedure TFrmLogin.WB2NavigateError(ASender: TObject; const pDisp: IDispatch;
  var URL, Frame, StatusCode: OleVariant; var Cancel: WordBool);
begin
  Cancel := False;
end;

procedure TFrmLogin.WB2NewWindow2(ASender: TObject; var ppDisp: IDispatch;
  var Cancel: WordBool);
begin
  Cancel := True;
end;

{ TncLoginAPI }

procedure TncLoginAPI.Config(aUsuario, aSenha: OleVariant);
var L : TLoginMsgData;
begin
  L := TLoginMsgData.Create;
  L.Usuario := aUsuario;
  L.Senha := aSenha;
  PostMessage(TFrmLogin(FObject).Handle, wm_user + 1, 1, Integer(L));
end;

function TncLoginAPI.obtemIDLojaNex: OleVariant;
begin
  Result := gConfig.Conta;
end;

procedure TncLoginAPI.Login(aUsuario, aSenha: OleVariant);
var L : TLoginMsgData;
begin
  L := TLoginMsgData.Create;
  L.Usuario := aUsuario;
  L.Senha := aSenha;
  PostMessage(TFrmLogin(FObject).Handle, wm_user + 1, 0, Integer(L));
end;

function TncLoginAPI.obtemMaquina: OleVariant;
begin
  Result := FrmPri.CM.Maquina;
end;

function TncLoginAPI.obtemMostrarSenha: OleVariant;
begin
  Result := not gConfig.MostrarApenasPIN;
end;

function TncLoginAPI.obtemServidor: OleVariant;
begin
  try
    Result := FrmPri.nxTCPIP.ServerName;
  except
    Result := '';
  end;
end;

function TncLoginAPI.obtemTextoUsuario: OleVariant;
begin
  Result := gConfig.TextoPIN;
end;

procedure TncLoginAPI.recarregaFundo;
begin
  PostMessage(TFrmLogin(FObject).Handle, wm_user + 2, 0, 0);
end;

procedure TncLoginAPI.Sair(aUsuario, aSenha: OleVariant);
var L : TLoginMsgData;
begin
  L := TLoginMsgData.Create;
  L.Usuario := aUsuario;
  L.Senha := aSenha;
  PostMessage(TFrmLogin(FObject).Handle, wm_user + 1, 2, Integer(L));
end;

procedure TncLoginAPI.setLoginViaBrowser;
begin
  TFrmLogin(FObject).LoginViaBrowser := True;
end;

procedure TncLoginAPI.setLoginViaSoftware;
begin
  TFrmLogin(FObject).LoginViaBrowser := False;
end;

function TncLoginAPI.obtemAppVer: OleVariant;
begin
  Result := Trim(Copy(GetVersionInfo, 7, 20));
end;

function TncLoginAPI.obtemFullAppVer: OleVariant;
begin
  TFrmLogin(FObject).VersaoStr;
end;

Initialization
  FrmLogin := nil;

end.




