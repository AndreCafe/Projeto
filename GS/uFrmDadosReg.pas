unit uFrmDadosReg;

interface

uses
  Windows, ncErros, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, StdCtrls, Buttons, PngBitBtn, cxTextEdit, cxDBEdit,
  cxLabel, cxSpinEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxControls,
  cxContainer, cxEdit, cxGroupBox, DB, kbmMemTable, ExtCtrls, cxMemo, pngimage,
  cxLookAndFeelPainters;

type
  TFrmDadosReg = class(TForm)
    cxLabel11: TcxLabel;
    btnOK: TPngBitBtn;
    btnCancelar: TPngBitBtn;
    edSenha: TcxTextEdit;
    edRSenha: TcxTextEdit;
    cxLabel14: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel2: TcxLabel;
    edREmail: TcxTextEdit;
    Label13: TLabel;
    Label12: TLabel;
    edEmail: TcxMaskEdit;
    edEstado: TcxMaskEdit;
    Label6: TLabel;
    edCidade: TcxMaskEdit;
    Label5: TLabel;
    edProp: TcxMaskEdit;
    Label4: TLabel;
    edNome: TcxMaskEdit;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Resultado : TStringList;
    { Private declarations }
  public
     function Editar(S: String): String;
    { Public declarations }
  end;

var
  FrmDadosReg: TFrmDadosReg;

implementation

uses uLicExeCryptor, ncServAtualizaLic, uFrmContaCriada, ncsFrmPri;

{$R *.dfm}

procedure TFrmDadosReg.btnOKClick(Sender: TObject);
var 
  dmLic: TdmAtualizaLic;
begin
  if Trim(edNome.Text)='' then begin
    edNome.SetFocus;
    Raise ENexCafe.Create('É necessário informar o nome da loja');
  end;

  if Trim(edProp.Text)='' then begin
    edProp.SetFocus;
    Raise ENexCafe.Create('É necessário informar o nome do proprietário da loja');
  end;

  if Trim(edSenha.Text)='' then begin
    edSenha.SetFocus;
    Raise ENexCafe.Create('É necessário informar uma senha de registro');
  end;

  if Trim(edEmail.Text)='' then begin
    edEmail.SetFocus;
    Raise ENexCafe.Create('É necessário informar o seu E-mail');
  end;

  if edEmail.Text <> edREmail.Text then begin
    edREmail.SetFocus;
    Raise ENexCafe.Create('Você digitou 2 e-mails diferentes. É necessário repetir o seu e-mail corretamente');
  end;

  if edSenha.Text <> edRSenha.Text then begin
    edSenha.SetFocus;
    Raise ENexCafe.Create('As senhas informadas estão diferentes. Certifique-se de digitar de forma idêntica a senha e a repetição da senha');
  end;

  Resultado.Values['Nome'] := edNome.Text;
  Resultado.Values['Prop'] := edProp.Text;
  Resultado.Values['Pais'] := 'Brasil';
  Resultado.Values['Cidade'] := edCidade.Text;
  Resultado.Values['UF'] := edEstado.Text;
  Resultado.Values['Email'] := edEmail.Text;
  Resultado.Values['Senha'] := edSenha.Text;
  Resultado.Values['CodEquip'] := RegistroGlobal.GetCodEquip(RegistroGlobal.GetSerialHD);

  dmLic := TdmAtualizaLic.Create(Self);
  try
    dmLic.CriarConta(Resultado.Text);
    FrmPri.DadosLicenca;
    TFrmContaCriada.Create(Self).ShowModal;
  finally
    dmLic.Free;
  end;
  
  Close;
end;

function TFrmDadosReg.Editar(S: String): String;
begin
  if S>'' then begin
    Resultado.Text := S;
    edNome.Text := Resultado.Values['Nome'];
    edProp.Text := Resultado.Values['Prop'];
    edCidade.Text := Resultado.Values['Cidade'];
    edEstado.Text := Resultado.Values['Estado'];
    edEmail.Text := Resultado.Values['Email'];
    edREmail.Text := edEmail.Text;
    edSenha.Text := Resultado.Values['Senha'];
    edRSenha.Text := edSenha.Text;
  end;
  Resultado.Text := '';
  ShowModal;
  Result := Resultado.Text;
end;

procedure TFrmDadosReg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmDadosReg.FormCreate(Sender: TObject);
begin
  Resultado := TStringList.Create;
end;

procedure TFrmDadosReg.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

end.
