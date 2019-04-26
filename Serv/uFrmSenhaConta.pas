unit uFrmSenhaConta;

interface

uses
  Windows, ncErros, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, PngBitBtn, pngimage, ExtCtrls, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, ncServAtualizaLic, Menus,
  cxLookAndFeelPainters, cxButtons, LMDPNGImage, cxGraphics, cxLookAndFeels;

type
  TFrmSenhaConta = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    edSenha: TcxTextEdit;
    cxLabel1: TcxLabel;
    lbSenha: TcxLabel;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxLabel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ObtemSenha: String;
  end;

var
  FrmSenhaConta: TFrmSenhaConta;

implementation

{$R *.dfm}

uses
  uLicExeCryptor;

procedure TFrmSenhaConta.cxLabel1Click(Sender: TObject);
var   
  dmLic: TdmAtualizaLic;
  S: String;
begin
  dmLic := TdmAtualizaLic.Create(Self);
  try
    S := dmLic.ObtemSenha(RegistroGlobal.Conta);
    if S>'' then begin
      ShowMessage('A senha da sua conta foi enviada para o e-mail: '+sLineBreak+sLineBreak+S);
      ShowMessage('Confira sua caixa de SPAM ou Lixo Eletrônico');
    end else  
      raise ENexCafe.create('Não foi possível enviar a senha para o seu e-mail. Faça contato com o suporte técnico da Nextar');
  finally
    dmLic.Free;
  end;
end;

procedure TFrmSenhaConta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TFrmSenhaConta.ObtemSenha: String;
begin
  ShowModal;
  if (ModalResult=mrOk) then 
    Result := edSenha.Text else
    Result := '';
end;

end.
