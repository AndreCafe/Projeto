unit uNRFrmLogin;

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
  FName := ExtractFilePath(ParamStr(0)) + 'NexReg.txt';
  if FileExists(FName) then
    FSL.LoadFromFile(FName);
  with FSL do begin  
    if Values['Servidor'] <> '' then
      edServidor.Text := Values['Servidor'];
    edUsername.Text := Values['Usuario'];
    edSenha.Text := Values['Senha'];
  end;    
end;

procedure TFrmLogin.btnLoginClick(Sender: TObject);
begin
  with DM do begin
    nxDB.Active := False;
    nxSession.Active := False;
    nxTCP.Active := False;
    nxTCP.ServerName := edServidor.Text;
    nxTCP.Active := True;
    tUsuario.Active := True;
    if not tUsuario.FindKey([edUsername.Text]) then
      Raise Exception.Create('Usuário Inexistente');

    if not SameText(edSenha.Text, tUsuarioSenha.Text) then
      Raise Exception.Create('Senha inválida'); 

    FSL.Values['Servidor'] := edServidor.Text;
    FSL.Values['Usuario']  := edUsername.Text;  
    FSL.Values['Senha']    := edSenha.Text;
    FSL.SaveToFile(FName);
    FLoginOk := True;
    UsuarioLogin := edUsername.Text;
    tCli.Open;
    tAut.Open;
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
    edUsername.SetFocus else
    edSenha.SetFocus;  
end;

end.







                                             