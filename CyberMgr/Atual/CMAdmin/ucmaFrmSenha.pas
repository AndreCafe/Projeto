unit ucmaFrmSenha;

interface                                                                          

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, StdCtrls,
  cxLookAndFeelPainters, cxButtons, Menus, pngimage, ExtCtrls;

type
  TFrmAlteraSenha = class(TForm)
    cxLabel1: TcxLabel;
    edAtual: TcxTextEdit;
    edNova: TcxTextEdit;
    cxLabel2: TcxLabel;
    edConfirma: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    btnAlterar: TcxButton;
    btnCancelar: TcxButton;
    Image1: TImage;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FSenha: String;
  public
    function Editar(aSenha, aUsuario: String): String;
    { Public declarations }
  end;

var
  FrmAlteraSenha: TFrmAlteraSenha;

implementation

{$R *.dfm}

{ TFrmAlteraSenha }

function TFrmAlteraSenha.Editar(aSenha, aUsuario: String): String;
begin
  FSenha := aSenha;
  Caption := aUsuario;
  if aSenha = '' then begin
    Caption := 'Criar uma senha para ' + aUsuario;
    edAtual.Enabled := False;
    btnAlterar.Caption := 'Criar Senha';
  end else
    Caption := 'Alterar a senha de ' + aUsuario;
  ShowModal;
  Result := FSenha;
end;

procedure TFrmAlteraSenha.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAlteraSenha.btnAlterarClick(Sender: TObject);
begin
  if edAtual.Text <> FSenha then 
    Raise Exception.Create('Você digitou sua senha ATUAL incorretamente. Certifique-se que está digitando 100% igual a senha original, '+
                             'respeitando letras maiúsculas e minúsculas e também espaços.');

  if edNova.Text <> edConfirma.Text then 
    Raise Exception.Create('A NOVA senha do campo 2 e 3 tem que ser exatamente iguais. Favor re-digitar corretamente');

  FSenha := edNova.Text;

  Close;    
end;

procedure TFrmAlteraSenha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmAlteraSenha.FormShow(Sender: TObject);
begin
  if edAtual.Enabled then 
    edAtual.SetFocus
  else
    edNova.SetFocus;  
end;

procedure TFrmAlteraSenha.FormCreate(Sender: TObject);
begin
  FrmAlteraSenha := Self;
end;

procedure TFrmAlteraSenha.FormDestroy(Sender: TObject);
begin
  FrmAlteraSenha := nil;
end;

end.













