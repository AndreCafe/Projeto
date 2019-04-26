unit ncsFrmRecuperaReg;

interface

uses
  Windows, ncErros, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, StdCtrls,
  cxRadioGroup, Menus, cxLookAndFeelPainters, cxButtons, cxGraphics,
  cxLookAndFeels;

type
  TFrmRecReg = class(TForm)
    rbEmail: TcxRadioButton;
    rbComputador: TcxRadioButton;
    Label1: TLabel;
    edEmail: TcxTextEdit;
    cxLabel1: TcxLabel;
    btnCancelar: TcxButton;
    btnOk: TcxButton;
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRecReg: TFrmRecReg;

implementation

uses ncServAtualizaLic, uLicEXECryptor;

{$R *.dfm}

procedure TFrmRecReg.btnOkClick(Sender: TObject);
var   
  dmLic: TdmAtualizaLic;
  S: String;
begin
  if rbEmail.Checked then begin
    if Trim(edEmail.Text)='' then
      raise ENexCafe.Create('É necessário informar o seu endereço de e-mail');
    dmLic := TdmAtualizaLic.Create(Self);
    try
      if dmLic.ObtemContaPorEmail(Trim(edEmail.Text)) then begin
        ShowMessage('As informações de registros foram enviadas para o e-mail informado');
        ShowMessage('Caso não receba o e-mail em sua caixa de entrada confira se não está em sua caixa de SPAM ou Lixo Eletrônico');
      end else
        raise ENexCafe.create('Não foi encontrado um registro de loja com o e-mail informado');
    finally
      dmLic.Free;
    end;
  end else begin
    dmLic := TdmAtualizaLic.Create(Self);
    try
      S := RegistroGlobal.GetCodEquip(RegistroGlobal.GetSerialHD);
      S := dmLic.ObtemContaPorEquip(S);
      if S>'' then begin
        ShowMessage('As informações de registros foram enviadas para: '+sLineBreak+sLineBreak+S);
        ShowMessage('Caso não receba o e-mail em sua caixa de entrada confira se não está em sua caixa de SPAM ou Lixo Eletrônico');
      end else
        raise ENexCafe.create('Não foi encontrado um registro anterior do NexCafé para esse computador');
    finally
      dmLic.Free;
    end;
  end;
  Close;
end;

procedure TFrmRecReg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
