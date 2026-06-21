unit uFrmTransfReg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, PngBitBtn, pngimage, ExtCtrls, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, ncServAtualizaLic, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters;

type
  TFrmTransfReg = class(TForm)
    lbCab: TcxLabel;
    edSenhaLj: TcxTextEdit;
    lbSenha: TcxLabel;
    Panel1: TPanel;
    Image1: TImage;
    cxLabel2: TcxLabel;
    btnOk: TPngBitBtn;
    btnCancel: TPngBitBtn;
    rgModoDemo: TRadioButton;
    rgTransferir: TRadioButton;
    cxLabel1: TcxLabel;
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure cxLabel1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FOper: Byte;
    FdmLic : TdmAtualizaLic;
    { Private declarations }
  public
    { Public declarations }
    function Transferir(Oper: Byte; aDMLic: TdmAtualizaLic = nil): String;
  end;

var
  FrmTransfReg: TFrmTransfReg;

implementation

uses uLicEXECryptor;

{$R *.dfm}

procedure TFrmTransfReg.btnOkClick(Sender: TObject);
var MR: Integer; S: String;
begin
  if rgTransferir.Checked and (Trim(edSenhaLj.Text)='') then begin
    edSenhaLj.SetFocus;
    raise exception.Create('É necessário digitar sua senha de registro');
  end;

  if rgTransferir.Checked and (FOper<>0) then begin
    Beep;
    MR := MessageDlg('Ao transferir suas licenças para o NexCafé, o Cyber Manager passará a funcionar em '+
                  'Modo Demonstração. '+sLineBreak+sLineBreak+
                  'Deseja realmente transferir as licenças para o NexCafé ?', mtWarning, [mbYes, mbNo], 0, mbNo);
    if MR<>mrYes then
      rgModoDemo.Checked := True;
  end;

  if FdmLic<>nil then begin
    S := FdmLic.UpgradeNex((FOper=0), edSenhaLj.Text);
    RegistroGlobal.StringChaves := S;
  end;

  Close;
  ModalResult := mrYes;
  
end;

procedure TFrmTransfReg.cxLabel1Click(Sender: TObject);
var   
  dmLic: TdmAtualizaLic;
  S: String;
begin
  dmLic := TdmAtualizaLic.Create(Self);
  try
    S := dmLic.ObtemSenha(RegistroGlobal.Conta);
    if S>'' then begin
      ShowMessage('Sua senha de registro foi enviada para o e-mail: '+sLineBreak+sLineBreak+S);
      ShowMessage('Caso não receba o e-mail em sua caixa de entrada confira se não está em sua caixa de SPAM ou Lixo Eletrônico');
    end else  
      raise exception.create('Não foi possível enviar sua senha para seu e-mail. Faça contato com o suporte técnico da Nextar');
  finally
    dmLic.Free;
  end;
end;

procedure TFrmTransfReg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTransfReg.FormCreate(Sender: TObject);
begin
  FdmLic := nil;
end;

procedure TFrmTransfReg.btnCancelClick(Sender: TObject);
begin
  Close;
end;

function TFrmTransfReg.Transferir(Oper: Byte; aDMLic: TdmAtualizaLic = nil): String;
begin
  FOper := Oper;
  FdmLic := aDMLic;
  if Oper<>0 then begin
    Caption := 'Transferir Licenças';
    rgTransferir.Caption := '2. Transferir licenças para o NexCafé';
    lbCab.Caption := 'Upgrade do Cyber Manager para o NexCafé';
  end;
  ShowModal;
  
  if (ModalResult=mrYes) and rgTransferir.Checked then
    Result := edSenhaLj.Text else
    Result := '';
end;

end.
