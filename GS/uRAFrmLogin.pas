unit uRAFrmLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, cxControls, cxContainer,
  cxEdit, cxLabel, pngimage, ExtCtrls, StdCtrls, cxButtons, cxCheckBox,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDCustomPanelFill, LMDPanelFill, Menus;

type
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    edUsername: TcxTextEdit;
    edSenha: TcxTextEdit;
    cxLabel3: TcxLabel;
    edServidor: TcxTextEdit;
    cbLembrarUsuario: TcxCheckBox;
    cbLembrarSenha: TcxCheckBox;
    LMDPanelFill1: TLMDPanelFill;
    Image2: TImage;
    btnLogin: TcxButton;
    btnCancelar: TcxButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FLoginOk : Boolean;
    FSL: TStrings;
    FName: String;
    { Private declarations }
  public
    function Login: Boolean;
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

uses uNexRegDM;

{$R *.dfm}

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  FLoginOk := False;
  FSL := TStringList.Create;
  FName := ExtractFilePath(ParamStr(0)) + 'RegAdmin.txt';
  if FileExists(FName) then
    FSL.LoadFromFile(FName);
  with FSL do begin  
    if Values['Servidor'] <> '' then
      edServidor.Text := Values['Servidor'];
    edUsername.Text := Values['Usuario'];
    edSenha.Text := Values['Senha'];
    cbLembrarUsuario.Checked := (Values['Usuario']>'');
    cbLembrarSenha.Checked := (edSenha.Text>'');
  end;    
end;

procedure TFrmLogin.btnLoginClick(Sender: TObject);
begin
  with DM do begin
    nxTCP.Active := False;
    mwCli.Password := edSenha.Text;
    mwTCPIP.Active := False;
    mwTCPIP.Host := edServidor.Text;
    mwTCPIP.Active := True;
    
    mwCli.Request(SvcName, SvcVersion, 'LOGIN', []);
    qMenu.Open;
    FSL.Values['Servidor'] := edServidor.Text;
    if cbLembrarUsuario.Checked then
      FSL.Values['Usuario'] := edUsername.Text
    else
      FSL.Values['Usuario'] := '';  
    if cbLembrarSenha.Checked then
      FSL.Values['Senha'] := edSenha.Text
    else
      FSL.Values['Senha'] := '';  
    FSL.SaveToFile(FName);  
    FLoginOk := True;
  end;
  Close;
end;

procedure TFrmLogin.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TFrmLogin.Login: Boolean;
begin
  ShowModal;
  Result := FLoginOK;
end;

procedure TFrmLogin.FormDestroy(Sender: TObject);
begin
  FSL.Free
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  if edUsername.Text = ''then
    edUsername.SetFocus
  else
    edSenha.SetFocus;  
end;

end.







                                             