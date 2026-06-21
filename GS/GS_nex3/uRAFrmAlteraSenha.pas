unit uRAFrmAlteraSenha;

interface                                                                          

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, StdCtrls,
  cxLookAndFeelPainters, cxButtons;

type
  TFrmAlteraSenha = class(TForm)
    Label1: TLabel;
    cxLabel1: TcxLabel;
    edAtual: TcxTextEdit;
    edNova: TcxTextEdit;
    cxLabel2: TcxLabel;
    edConfirma: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    btnAlterar: TcxButton;
    btnCancelar: TcxButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    Raise Exception.Create('Senha atual incorreta');

  if edNova.Text <> edConfirma.Text then
    Raise Exception.Create('Senha de confirmação diferente da nova senha');

  FSenha := edNova.Text;

  Close;    
end;

procedure TFrmAlteraSenha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.













