unit ncsFrmLogin;

interface

uses Windows, ncErros, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons,Dialogs, dxBar, DBCtrls, Db,
  kbmMemTable, ExtCtrls,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, LMDCustomComponent, LMDIniCtrl, jpeg,
  LMDCustomHint, LMDCustomShapeHint, LMDMessageHint, LMDShapeHint,
  LMDApplicationCtrl, cxLookAndFeelPainters, cxButtons, Menus, LMDControl,
  cxGraphics, cxLookAndFeels;

type
  TFrmLogin = class(TForm)
    LMDSimplePanel6: TLMDSimplePanel;
    lbusuario: TLabel;
    edUsuario: TEdit;
    lbSenha: TLabel;
    edSenha: TEdit;
    Image1: TImage;
    cbDesligar: TCheckBox;
    btnOk: TcxButton;
    btnCancelar: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    FResultado: Integer;
    function PodeFechar(ALogin: Boolean; ACaption: String): Integer;
  end;

var
  FrmLogin : TFrmLogin;  

implementation

uses 
  ncClassesBase, ncsFrmPri, ncIDRecursos;

{$R *.DFM}

procedure TFrmLogin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FrmLogin := nil;
  Action:= caFree;
end;

procedure TFrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and 
     (not btnOk.Focused) and 
     (not btnCancelar.Focused) then 
  begin
    SelectNext(ActiveControl as TWinControl, True, True);
    Key := #0;
  end;
end;

procedure TFrmLogin.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLogin.btnOkClick(Sender: TObject);
var U : TncUsuario;
begin
  with FrmPri.Serv do
  if edUsuario.Enabled then begin
    U := Usuarios.PorUsername[edUsuario.Text];
    if U=nil then
      Raise ENexCafe.Create('Nome de usuário não existe!');

    if U.Senha <> edSenha.Text then
      Raise ENexCafe.Create('Senha incorreta!');

    if not Permitido(U, daMaqFecharCMServer) then begin
      Beep;
      ShowMessage('Você não possui direito de realizar essa operação');
      FResultado := -1;
      Close;
      Exit;
    end;

  end;

  if cbDesligar.Checked then
    FResultado := 1
  else
    FResultado := 0;

  Close;
end;

function TFrmLogin.PodeFechar(ALogin: Boolean; ACaption: String): Integer;
begin
  edUsuario.Enabled := ALogin;
  edSenha.Enabled := ALogin;
  edUsuario.Visible := ALogin;
  lbUsuario.Visible := ALogin;
  edSenha.Visible := ALogin;
  lbSenha.Visible := ALogin;

  cbDesligar.Visible := False;

  Caption := ACaption;
  btnOk.Caption := ACaption;
  ShowModal;
  Result := FResultado;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  FResultado := -1;
end;

end.

