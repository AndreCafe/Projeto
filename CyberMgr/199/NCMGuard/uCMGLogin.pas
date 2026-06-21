unit uCMGLogin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, Buttons, jpeg, 
  cmClassesBase, cmServRemoto, cmCompCliente, LMDControl,
  LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, LMDCustomComponent, LMDIniCtrl, 
  OvcPF, Menus, 
  ImgList, ShellAPI,
  Db, 
  LMDBaseGraphicControl, LMDGraphicControl, LMDFill, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, dxPageControl, LMDVersionInfo, xpButton,
  cxLookAndFeelPainters, cxButtons, LMDCustomParentPanel,
  LMDCustomPanelFill, LMDPanelFill, cxPC, cxControls, LMDCustomSimpleLabel,
  LMDSimpleLabel, cxMaskEdit, cxLabel, cxContainer, cxEdit, cxTextEdit,
  LMDBaseImage, LMDCustomLImage, LMDLImage, cxGroupBox, cxHint;

type
  TFrmLogin = class(TForm)
    panLoginMaq: TLMDSimplePanel;
    TimerOnTop: TTimer;
    LMDFill1: TLMDFill;
    imFundo: TImage;
    LMDFill3: TLMDFill;
    Version: TLMDVersionInfo;
    Paginas: TcxPageControl;
    tsLogin: TcxTabSheet;
    tsErro: TcxTabSheet;
    tsConfig: TcxTabSheet;
    btnOkErro: TcxButton;
    LMDSimplePanel3: TLMDSimplePanel;
    LMDLabel1: TLMDLabel;
    lbMsg: TLMDLabel;
    LMDSimplePanel4: TLMDSimplePanel;
    LMDFill2: TLMDFill;
    Image1: TImage;
    LMDSimplePanel2: TLMDSimplePanel;
    Label2: TLabel;
    Label1: TLabel;
    edSenha: TEdit;
    edUsername: TEdit;
    btnOk: TcxButton;
    panTipoAcesso: TLMDSimplePanel;
    Label4: TLabel;
    cbTipoAcesso: TComboBox;
    lbNumMaq: TLMDLabel;
    LMDLabel2: TLMDLabel;
    panConfig: TLMDPanelFill;
    btnFechar: TLMDSpeedButton;
    btnConfigurar: TLMDSpeedButton;
    lbVersao: TLMDLabel;
    LMDSimplePanel1: TLMDSimplePanel;
    btnRestricoes: TcxButton;
    btnDesinstalar: TcxButton;
    btnReiniciar: TcxButton;
    btnDesligar: TcxButton;
    btnVoltaLogin: TcxButton;
    LMDFill4: TLMDFill;
    imConexao: TLMDLImage;
    cxGroupBox1: TcxGroupBox;
    edServidor: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edNumMaq: TcxMaskEdit;
    cxHintStyleController1: TcxHintStyleController;
    tsPergunta: TcxTabSheet;
    lbPergunta: TLMDLabel;
    btnSim: TcxButton;
    btnNao: TcxButton;
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure TimerOnTopTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnOkErroClick(Sender: TObject);
    procedure btnVoltaLoginClick(Sender: TObject);
    procedure btnConfigurarClick(Sender: TObject);
    procedure btnOkServClick(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
    procedure btnNaoClick(Sender: TObject);
    procedure btnReiniciarClick(Sender: TObject);
  private
    FPodeFechar : Boolean;
    FRespondeu  : Boolean;
    FResSimNao  : Boolean;
    { Private declarations }
    procedure RefreshTipoAcesso;
    procedure OnException(Sender: TObject; E: Exception);
  public
    procedure FecharLogin;
    procedure MostraErro(S: String);
    function SimNao(S: String): Boolean;
    function ObtemUsuario: TCMUsuario;
    procedure AjustaPaginaAtual(aPagina: Integer);
  end;

const  
  pagLogin  = 0;
  pagErro   = 1;
  pagConfig = 2;
  pagSimNao = 3;

var
  FrmLogin: TFrmLogin;

implementation

uses uCMGPri, CMListaID, cmIDRecursos;

{$R *.DFM}

procedure TFrmLogin.FormResize(Sender: TObject);
begin
  panLoginMaq.Left := ((Width-panLoginMaq.Width) div 2) - 5; 
  panLoginMaq.Top  := ((Height-panLoginMaq.Height) div 2) - 20;
end;

procedure TFrmLogin.OnException(Sender: TObject; E: Exception);
begin
  MostraErro(E.Message);
end;    

procedure TFrmLogin.RefreshTipoAcesso;
var I : Integer;
begin
  with FrmPri, CM, TiposAcesso do
  for I := 0 to pred(Count) do with Itens[I] do
    cbTipoAcesso.Items.AddObject(Nome, TObject(Codigo));
    
  panTipoAcesso.Visible := (cbTipoAcesso.Items.Count>1);
  cbTipoAcesso.ItemIndex := 0;
  btnOk.Enabled := (cbTipoAcesso.Items.Count>0);
end;

procedure TFrmLogin.FormDestroy(Sender: TObject);
begin
  FrmPri.FDesligaAviso := False;
  Application.OnException := nil;
  FrmLogin := nil;
end;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TimerOnTop.Enabled := False;
  Action := caFree;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
var S : String;
begin
  BorderStyle := bsNone;  
  WindowState := wsMaximized;
  with FrmPri do begin
    lbNumMaq.Caption := IntToStr(CM.Maquina);
    S := slRecursos.Values['FundoTela'];
    if FileExists(S) then
    try
      imFundo.Picture.LoadFromFile(S);
      imFundo.Stretch := (slRecursos.Values['Stretch']='T');
    except
    end;    
  end;  
  edUsername.SetFocus;
end;

procedure TFrmLogin.btnOkClick(Sender: TObject);
begin
  with FrmPri do
  if Trim(edUsername.Text)>'' then
  try
    if CM.Ativo then
      CM.LoginMaq(CM.Maquina, 0, edUsername.Text, edSenha.Text, '', '', 0, 0,
                  Integer(cbTipoAcesso.Items.Objects[cbTipoAcesso.ItemIndex]))
    else
      MostraErro('O sistema não está conectado ao servidor. Impossível realizar essa operação');
  except
    on E: Exception do
      MostraErro(E.Message);
  end;  
end;

procedure TFrmLogin.TimerOnTopTimer(Sender: TObject);
begin
  Left := 0;
  Top := 0;
  Width := Screen.Width;
  Height := Screen.Height;
  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, (SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE));
  if FrmPri.CM.Ativo then
    imConexao.ListIndex := 1
  else
    imConexao.ListIndex := 0;
end;

procedure TFrmLogin.MostraErro(S: String);
begin
  Beep;
  lbMsg.Caption := S;
  AjustaPaginaAtual(pagErro);
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  Paginas.HideTabs := True;
  lbVersao.Caption := 'Versão '+Version.FileVersion;
  FPodeFechar := False;
  RefreshTipoAcesso;
  AjustaPaginaAtual(pagLogin);
  Application.OnException := OnException;
end;

procedure TFrmLogin.lbFecharClick(Sender: TObject);
var U: TCMUsuario;
begin
  U := ObtemUsuario;
  try
    with FrmPri do
    if ((U<>nil) and CM.Permitido(U, reMaquinas, taMaqFecharCMGuard)) then
    if CM.Ativo then
      CM.Ativo := False
    else
      FecharCMGuard;
  except
  end;    
end;

procedure TFrmLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := FPodeFechar;
end;

procedure TFrmLogin.FecharLogin;
begin
  FPodeFechar := True;
  Close;
end;

procedure TFrmLogin.btnOkErroClick(Sender: TObject);
begin
  AjustaPaginaAtual(pagLogin);
end;

procedure TFrmLogin.btnVoltaLoginClick(Sender: TObject);
begin
  AjustaPaginaAtual(pagLogin);
end;

procedure TFrmLogin.btnConfigurarClick(Sender: TObject);
var U: TCMUsuario;
begin
  if ObtemUsuario=nil then
    MostraErro('A configuração deste programa não pode ser realizada por clientes'+
               ' ou por usuários não autorizados. Caso você seja um usuário '+
               'autorizado certifique-se que tenha digitado corretamente sua Senha e seu '+
               'Nome de Usuário. '+#13#10+#13+#10+
               'Ao instalar o Cyber Manager você poderá usar o Nome de Usuário "admin" '+
               'e deixar a senha em branco até que seja definido uma nova senha ou seja'+
               ' cadastrado outro usuário.')
  else
    AjustaPaginaAtual(pagConfig);
end;

function TFrmLogin.ObtemUsuario: TCMUsuario;
begin
  Result := nil;
  if Trim(edUsername.Text)>'' then
  try
    Result := FrmPri.CM.Usuarios.PorUsername[edUsername.Text];
    if (Result<>nil) and (Result.Senha<>edSenha.Text) then
      Result := nil;
  except
  end;
end;

procedure TFrmLogin.btnOkServClick(Sender: TObject);
begin
  AjustaPaginaAtual(pagLogin);
end;

procedure TFrmLogin.AjustaPaginaAtual(aPagina: Integer);
begin
  if aPagina = Paginas.ActivePageIndex then Exit;
  tsLogin.TabVisible    := (aPagina=pagLogin);
  tsErro.TabVisible     := (aPagina=pagErro);
  tsConfig.TabVisible   := (aPagina=pagConfig);
  tsPergunta.TabVisible     := (aPagina=pagSimNao);
  Paginas.ActivePageIndex := aPagina;
  btnConfigurar.Visible := (aPagina=pagLogin);
  btnFechar.Visible := not (aPagina in [pagErro, pagSimNao]);
  btnConfigurar.Left := 5;
  if not FrmPri.CM.Ativo then
    btnRestricoes.Hint := 'Essa operação só pode ser executada depois de estar conectado ao servidor Cyber Manager'
  else
    btnRestricoes.Hint := 'Clique aqui para configurar as restrições de acesso ao Windows nesta máquina';
end;

function TFrmLogin.SimNao(S: String): Boolean;
var pagAnt: Integer;
begin
  FRespondeu := False;
  lbPergunta.Caption := S;
  pagAnt := Paginas.ActivePageIndex;
  AjustaPaginaAtual(pagSimNao);
  while not FRespondeu do Application.ProcessMessages;
  Result := FResSimNao;
  AjustaPaginaAtual(pagAnt);
end;

procedure TFrmLogin.btnSimClick(Sender: TObject);
begin
  FRespondeu := True;
  FResSimNao := True;
end;

procedure TFrmLogin.btnNaoClick(Sender: TObject);
begin
  FRespondeu := True;
  FResSimNao := False;
end;

procedure TFrmLogin.btnReiniciarClick(Sender: TObject);
begin
  if SimNao('Deseja realmente reiniciar o Windows ?') then
    AjustaPaginaAtual(pagLogin);
end;

Initialization
  FrmLogin := nil;

      end.
