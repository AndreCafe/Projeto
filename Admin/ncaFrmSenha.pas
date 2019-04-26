unit ncaFrmSenha;
{
    ResourceString: Dario 11/03/13
}

interface                                                                          

uses
  Windows, Messages, ncErros, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, StdCtrls,
  cxLookAndFeelPainters, cxButtons, Menus, pngimage, ExtCtrls, cxGraphics,
  cxLookAndFeels;

type
  TFrmAlteraSenha = class(TForm)
    lbSenhaAtual: TcxLabel;
    edAtual: TcxTextEdit;
    edNova: TcxTextEdit;
    lbNovaSenha: TcxLabel;
    edConfirma: TcxTextEdit;
    lbConfirmarSenha: TcxLabel;
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
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
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

uses ncaFrmPri;

// START resource string wizard section
resourcestring
  SCriarUmaSenhaPara = 'Criar uma senha para ';
  SCriarSenha = 'Criar Senha';
  SDigiteSuaSenhaAtual = 'Digite sua senha atual';
  SDigiteUmaSenha = 'Digite uma senha';
  SDigiteASenhaNovamenteParaConfirm = 'Digite a senha novamente para confirmá-la';
  SAlterarASenhaDe = 'Alterar a senha de ';
  SVocêDigitouSuaSenhaATUALIncorret = 'Você digitou sua senha ATUAL incorretamente. Certifique-se que está digitando 100% igual a senha original, ';
  SRespeitandoLetrasMaiúsculasEMinú = 'respeitando letras maiúsculas e minúsculas e também espaços.';
  SANOVASenhaDoCampo2E3TemQueSerExa = 'A NOVA senha do campo 2 e 3 tem que ser exatamente iguais. Favor re-digitar corretamente';

// END resource string wizard section


{$R *.dfm}

{ TFrmAlteraSenha }

function TFrmAlteraSenha.Editar(aSenha, aUsuario: String): String;
begin
  FSenha := aSenha;
  Caption := aUsuario;
  if aSenha = '' then begin
    Caption := SCriarUmaSenhaPara + aUsuario;
    edAtual.Enabled := False;
    btnAlterar.Caption := SCriarSenha;
    lbSenhaAtual.Enabled := False;
    lbSenhaAtual.Caption := SDigiteSuaSenhaAtual;
    lbNovaSenha.Caption := SDigiteUmaSenha;
    lbConfirmarSenha.Caption := SDigiteASenhaNovamenteParaConfirm;
  end else
    Caption := SAlterarASenhaDe + aUsuario;
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
    Raise ENexCafe.Create(SVocêDigitouSuaSenhaATUALIncorret+
                             SRespeitandoLetrasMaiúsculasEMinú);

  if edNova.Text <> edConfirma.Text then 
    Raise ENexCafe.Create(SANOVASenhaDoCampo2E3TemQueSerExa);

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
    edAtual.SetFocus else
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

procedure TFrmAlteraSenha.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Key_Enter) then 
    Perform(WM_NEXTDLGCTL,0,0);
end;

end.














