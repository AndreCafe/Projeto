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
  LMDCustomSimpleLabel, LMDSimpleLabel, dxBarExtItems, dxBar, LMDBaseEdit,
  LMDCustomEdit, LMDCustomMaskEdit, LMDCustomExtSpinEdit, LMDExtSpinEdit;

type
  TFrmLogin = class(TForm)
    panLoginMaq: TLMDSimplePanel;
    TimerOnTop: TTimer;
    LMDFill1: TLMDFill;
    imFundo: TImage;
    LMDFill3: TLMDFill;
    Paginas: TdxPageControl;
    tsLogin: TdxTabSheet;
    tsErro: TdxTabSheet;
    LMDLabel2: TLMDLabel;
    lbNumMaq: TLMDLabel;
    Image1: TImage;
    LMDFill2: TLMDFill;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    Label2: TLabel;
    Label1: TLabel;
    edSenha: TEdit;
    edUsername: TEdit;
    panTipoAcesso: TLMDSimplePanel;
    Label4: TLabel;
    cbTipoAcesso: TComboBox;
    BitBtn1: TBitBtn;
    LMDSimplePanel3: TLMDSimplePanel;
    lbCabErro: TLMDLabel;
    lbMsg: TLMDLabel;
    LMDSimplePanel4: TLMDSimplePanel;
    Version: TLMDVersionInfo;
    btnOk: TxpButton;
    BarMgr: TdxBarManager;
    cmConfigurar: TdxBarButton;
    cmFechar: TdxBarButton;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    dxBarDockControl1: TdxBarDockControl;
    cmNoNet: TdxBarStatic;
    cmVersao: TdxBarStatic;
    tsConexao: TdxTabSheet;
    LMDSimplePanel5: TLMDSimplePanel;
    lbErroConn: TLMDLabel;
    Label3: TLabel;
    edServidor: TEdit;
    Label5: TLabel;
    btnOkConn: TxpButton;
    btnCancelarConn: TxpButton;
    edMaquina: TLMDExtSpinEdit;
    Timer1: TTimer;
    cmErro: TdxBarStatic;
    lbCaminho: TLMDLabel;
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure TimerOnTopTimer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edUsernameContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure cmConfigurarClick(Sender: TObject);
    procedure cmFecharClick(Sender: TObject);
    procedure btnOkConnClick(Sender: TObject);
    procedure btnCancelarConnClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FExibindo : Boolean;
    FBar : TdxBar;
    { Private declarations }
    procedure OnException(Sender: TObject; E: Exception);
    procedure SetExibindo(const Value: Boolean);
  public
    procedure RefreshTipoAcesso;
    procedure RefreshConexao;
    procedure FecharLogin;
    procedure MostraErro(S: String);
    procedure MostraMsg(S: String);
    function UsuarioOpOk(Op: Integer): Boolean;

    property Exibindo: Boolean
      read FExibindo write SetExibindo;
  end;

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
  lbNumMaq.Caption := FrmPri.slConfig.Values['Maquina'];
  cbTipoAcesso.Items.Clear;

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
end;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TimerOnTop.Enabled := False;
  Action := caFree;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
var
  S : String;
begin
  RefreshConexao;

  with FrmPri do begin
    if (FundoTela>'') and FileExists(FundoTela) then
      S := FundoTela
    else
      S := ExtractFilePath(ParamStr(0)) + 'fundo.jpg';
        
    if FileExists(S) then
    try
      imFundo.Picture.LoadFromFile(S);
      imFundo.Stretch := True;
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
      CM.LoginMaq(CM.Maquina, 0, edUsername.Text, edSenha.Text, '', '', 0, 0, 
                  Integer(cbTipoAcesso.Items.Objects[cbTipoAcesso.ItemIndex])); 
      
  except
    on E: Exception do 
      MostraErro(E.Message);
  end;
end;

procedure TFrmLogin.TimerOnTopTimer(Sender: TObject);
begin
  if Exibindo then begin
    if FBar <> nil then
      FBar.Visible := not FrmPri.CM.Ativo;
    Left := 0;
    Top := 0;
    Width := Screen.Width;
    Height := Screen.Height;
    SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, (SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE));
  end;  
end;

procedure TFrmLogin.BitBtn1Click(Sender: TObject);
begin
  Paginas.ActivePage := tsLogin;
end;

procedure TFrmLogin.MostraMsg(S: String);
begin
  Beep;
  Timer1.Enabled := False;
  lbCabErro.Caption := 'Atenção';
  Timer1.Interval := 10000;
  lbMsg.Caption := S;
  Paginas.ActivePage := tsErro;
  Timer1.Enabled := True;
end;

procedure TFrmLogin.MostraErro(S: String);
begin
  Beep;
  Timer1.Enabled := False;
  Timer1.Interval := 10000;
  lbMsg.Caption := S;
  Paginas.ActivePage := tsErro;
  Timer1.Enabled := True;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  RefreshConexao;
  FExibindo := False;
  FBar := BarMgr.BarByName('NoNet');
  cmVersao.Caption := 'Versão '+Version.FileVersion;
  Paginas.ActivePage := tsLogin;
  Application.OnException := OnException;
end;

procedure TFrmLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;
end;

procedure TFrmLogin.FecharLogin;
begin
  Close;
end;

procedure TFrmLogin.edUsernameContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  Handled := True;
end;

procedure TFrmLogin.SetExibindo(const Value: Boolean);
begin
  RefreshConexao;
  if Value=FExibindo then Exit;
  FExibindo := Value;
  TimerOnTop.Enabled := Value;
  if Value then begin
    Show;
    BorderStyle := bsNone;
    WindowState := wsMaximized;
    edUsername.Text := '';
    edSenha.Text := '';
  end else
    Hide;
end;

procedure TFrmLogin.cmConfigurarClick(Sender: TObject);
begin
  if UsuarioOpOk(taMaqFecharCMGuard) then
    Paginas.ActivePage := tsConexao;
end;

procedure TFrmLogin.cmFecharClick(Sender: TObject);
begin
  with FrmPri do
  if UsuarioOpOk(taMaqFecharCMGuard) then begin
    Fechar := True;
    if CM.Ativo then
      CM.Ativo := False
    else
      FecharCMGuard;
  end;
end;

function TFrmLogin.UsuarioOpOk(Op: Integer): Boolean;
var U: TCMUsuario;
begin
  Result := (FrmPri.CM.Usuarios.Count=0);
  if Result then Exit;

  with FrmPri.CM do
//  if Trim(edUsername.Text)>'' then
  try
    U := Usuarios.PorUsername[edUsername.Text];
    if U = nil then
      MostraErro('Nome de usuário inválido')
    else
    if U.Senha <> edSenha.Text then
      MostraErro('Senha inválida')
    else
    if not Permitido(U, reMaquinas, Op) then
      MostraErro('Você não tem permissão para executar essa operação. '+
                 'Caso seja a primeira vez que você executa o CM-Guard, '+
                 'você poderá utilizar o usuário "admin" e deixar a senha '+
                 'em branco.')
    else
      Result := True;
  except
  end;
end;

procedure TFrmLogin.btnOkConnClick(Sender: TObject);
begin
  with FrmPri do begin
    slConfig.Values['Maquina'] := edMaquina.AsString;
    slConfig.Values['Servidor'] := edServidor.Text;
    slConfig.SaveToFile(IniFName);
    if not CM.Ativo then begin
      if not tmReconectar.Enabled then begin
        try
          Conectar(False);
          Paginas.ActivePage := tsLogin;
          edUsername.Text := '';
          edSenha.Text := '';
        except
          Beep;
        end;
      end else
        tmReconectarTimer(nil);  
    end else
      MostraMsg('As alterações realizadas só terão efeito na próxima conexão '+
                'com o servidor. Se desejar ativá-las agora é necessário '+
                'fechar e re-abrir o CM-Guard.');
  end;
end;

procedure TFrmLogin.btnCancelarConnClick(Sender: TObject);
begin
  edUsername.Text := '';
  edSenha.Text := '';
  Paginas.ActivePage := tsLogin;
end;

procedure TFrmLogin.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if Paginas.ActivePage=tsErro then
    Paginas.ActivePage := tsLogin;
end;

procedure TFrmLogin.RefreshConexao;
begin
  with FrmPri.slConfig do begin
    lbCaminho.Caption := 'Arquivo usado = ' + IniFName;
    lbNumMaq.Caption := Values['Maquina'];
    edServidor.Text  := Values['Servidor'];
    edMaquina.Value  := StrToIntDef(Values['Maquina'], 0);
  end;  
end;

Initialization
  FrmLogin := nil;

end.
