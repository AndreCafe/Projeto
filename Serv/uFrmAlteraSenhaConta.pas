unit uFrmAlteraSenhaConta;

interface

uses
  ncErros, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, PngBitBtn, pngimage, ExtCtrls, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, ncServAtualizaLic, Menus,
  cxLookAndFeelPainters, cxButtons, LMDPNGImage, cxGraphics, cxLookAndFeels;

type
  TFrmAlteraSenhaConta = class(TForm)
    btnOk: TcxButton;
    btnCancel: TcxButton;
    lbSenha: TcxLabel;
    edSenhaAtual: TcxTextEdit;
    lbEsqueci: TcxLabel;
    Image1: TImage;
    edNovaSenha: TcxTextEdit;
    cxLabel2: TcxLabel;
    edRepetir: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxEditStyleController1: TcxEditStyleController;
    lbConta: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbEsqueciClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAlteraSenhaConta: TFrmAlteraSenhaConta;

implementation

{$R *.dfm}

uses
  uLicExeCryptor;

procedure TFrmAlteraSenhaConta.lbEsqueciClick(Sender: TObject);
var   
  dmLic: TdmAtualizaLic;
  S: String;
begin
  dmLic := TdmAtualizaLic.Create(Self);
  try
    S := dmLic.ObtemSenha(RegistroGlobal.Conta);
    if S>'' then begin
      ShowMessage('A senha da sua conta foi enviada para o e-mail: '+sLineBreak+sLineBreak+S);
      ShowMessage('O e-mail pode demorar alguns minutos para chegar em sua caixa postal. Confira sua caixa de SPAM / Lixo Eletrônico');
    end else  
      raise ENexCafe.create('Não foi possível enviar a senha para o seu e-mail. Faça contato com o suporte técnico da Nextar');
  finally
    dmLic.Free;
  end;
end;

procedure TFrmAlteraSenhaConta.btnOkClick(Sender: TObject);
var dmLic: TdmAtualizaLic;
begin
  if Trim(edSenhaAtual.Text)='' then begin
    Beep;
    ShowMessage('É necessário informar sua senha atual');
    Exit;
  end;

  if Trim(edNovaSenha.Text)='' then begin
    Beep;
    ShowMessage('É necessário informar a nova senha');
    Exit;
  end;

  if not SameText(edNovaSenha.Text, edRepetir.Text) then begin
    Beep;
    ShowMessage('A senha digitada novamente está diferente da nova senha');
    Exit;
  end;

  dmLic := TdmAtualizaLic.Create(Self);
  try
    dmLic.AlterarSenha(lbConta.Caption, edSenhaAtual.Text, edNovaSenha.Text);
    ShowMessage('Senha alterada com sucesso!');
    Close;
  finally
    dmLic.Free;
  end;
end;

procedure TFrmAlteraSenhaConta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmAlteraSenhaConta.FormCreate(Sender: TObject);
begin
  lbConta.Caption := RegistroGlobal.Conta;
end;

end.
