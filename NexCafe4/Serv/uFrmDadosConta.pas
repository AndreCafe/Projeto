unit uFrmDadosConta;

interface

uses
  Windows, ncErros, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, PngBitBtn, pngimage, ExtCtrls, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, ncServAtualizaLic, Menus,
  cxLookAndFeelPainters, cxButtons, LMDPNGImage, cxMaskEdit, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrmDadosConta = class(TForm)
    btnOk: TcxButton;
    lbSenha: TcxLabel;
    edSenha: TcxTextEdit;
    lbEsqueci: TcxLabel;
    Image1: TImage;
    cxEditStyleController1: TcxEditStyleController;
    lbConta: TcxLabel;
    panDados: TLMDSimplePanel;
    lbLoja: TLabel;
    edLoja: TcxMaskEdit;
    edProp: TcxMaskEdit;
    lbProp: TLabel;
    btnSalvar: TcxButton;
    btnCancelar: TcxButton;
    edEndereco: TcxMaskEdit;
    edTel4: TcxMaskEdit;
    edTel3: TcxMaskEdit;
    edTel2: TcxMaskEdit;
    edTel1: TcxMaskEdit;
    Label3: TLabel;
    edCEP: TcxMaskEdit;
    Label8: TLabel;
    edUF: TcxMaskEdit;
    Label6: TLabel;
    edCidade: TcxMaskEdit;
    Label5: TLabel;
    edBairro: TcxMaskEdit;
    Label9: TLabel;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbEsqueciClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDadosConta: TFrmDadosConta;

implementation

{$R *.dfm}

uses
  uLicExeCryptor;

procedure TFrmDadosConta.lbEsqueciClick(Sender: TObject);
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

procedure TFrmDadosConta.btnOkClick(Sender: TObject);
var 
  dmLic: TdmAtualizaLic;
  SL : TStringList;
  I : Integer;
begin
  dmLic := TdmAtualizaLic.Create(Self);
  try
    SL := TStringList.Create;
    try
      SL.Text := dmLic.ObtemDadosConta(lbConta.Caption, edSenha.Text);
      edProp.Text := SL.Values['Prop'];
      edLoja.Text := SL.Values['Nome'];
      edEndereco.Text := SL.Values['Endereco'];
      edBairro.Text := SL.Values['Bairro'];
      edCEP.Text := SL.Values['CEP'];
      edCidade.Text := SL.Values['Cidade'];
      edUF.Text := SL.Values['UF'];
      edTel1.Text := SL.Values['Tel1'];
      edTel2.Text := SL.Values['Tel2'];
      edTel3.Text := SL.Values['Tel3'];
      edTel4.Text := SL.Values['Tel4'];
      for I := 0 to panDados.ControlCount - 1 do
        panDados.Controls[I].Enabled := True;
      edProp.SetFocus;
      lbSenha.Enabled := False;
      edSenha.Enabled := False;
      btnOk.Enabled := False;
      lbEsqueci.Enabled := False;  
    finally
      SL.Free;
    end;
  finally
    dmLic.Free;
  end;
end;

procedure TFrmDadosConta.btnSalvarClick(Sender: TObject);
var 
  dmLic: TdmAtualizaLic;
  SL : TStrings;
begin
  dmLic := TdmAtualizaLic.Create(Self);
  try
    SL := TStringList.Create;
    try
      SL.Values['Prop'] := edProp.Text;
      SL.Values['Nome'] := edLoja.Text;
      SL.Values['Endereco'] := edEndereco.Text;
      SL.Values['Bairro'] := edBairro.Text;
      SL.Values['CEP'] := edCEP.Text;
      SL.Values['Cidade'] := edCidade.Text;
      SL.Values['UF'] := edUF.Text;
      SL.Values['Tel1'] := edTel1.Text;
      SL.Values['Tel2'] := edTel2.Text;
      SL.Values['Tel3'] := edTel3.Text;
      SL.Values['Tel4'] := edTel4.Text;
    
      dmLic.AtualizaDadosConta(lbConta.Caption, edSenha.Text, SL.Text);
      ShowMessage('Dados atualizados com sucesso!');
      Close;
    finally
      SL.Free;
    end;
  finally
    dmLic.Free;
  end;
end;

procedure TFrmDadosConta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmDadosConta.FormCreate(Sender: TObject);
begin
  lbConta.Caption := RegistroGlobal.Conta;
end;

end.
