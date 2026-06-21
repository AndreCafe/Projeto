unit uFrmCodLoja;

interface

uses
  Windows, ncErros, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, cxMaskEdit, Menus,
  cxLookAndFeelPainters, cxButtons, cxRadioGroup, LMDPNGImage, cxGraphics,
  cxLookAndFeels;

type
  TFrmCodLoja = class(TForm)
    Image1: TImage;
    edChave: TcxMaskEdit;
    cxLabel2: TcxLabel;
    rbEmail: TcxRadioButton;
    rbCodLoja: TcxRadioButton;
    edEmail: TcxTextEdit;
    btnOk: TcxButton;
    cxButton1: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rbEmailClick(Sender: TObject);
    procedure rbCodLojaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxLabel2Click(Sender: TObject);
  private
    { Private declarations }
    FShowing : Boolean;
    procedure Ajusta;
  public
    function Editar: Boolean;
    { Public declarations }
  end;

var
  FrmCodLoja: TFrmCodLoja;

implementation

uses uLicEXECryptor, ncShellStart;

{$R *.dfm}

{ TFrmChave }

procedure TFrmCodLoja.Ajusta;
begin
  edEmail.Enabled := rbEmail.Checked;
  edChave.Enabled := rbCodLoja.Checked;
  if rbEmail.Checked then begin
    rbEmail.Font.Style := [fsBold];
    rbCodLoja.Font.Style := [];
  end else begin
    rbEmail.Font.Style := [];
    rbCodLoja.Font.Style := [fsBold];
  end;

end;

procedure TFrmCodLoja.btnOKClick(Sender: TObject);
begin
  if rbCodLoja.Checked then begin
    if not CodLojaOK(edChave.Text) then
      Raise ENexCafe.Create('O código informado não é válido!');
  end;
  ModalResult := mrOk;
end;

procedure TFrmCodLoja.cxLabel2Click(Sender: TObject);
begin
  ShellStart('http://contas.nextar.com.br/recuperaconta');
end;

function TFrmCodLoja.Editar: Boolean;
var S: String;
begin
  if RegistroGlobal.CodLoja>0 then begin
    edChave.Text := RegistroGlobal.CodLojaAsString;
    rbCodLoja.Checked := True;
  end else begin
    edEmail.Text := RegistroGlobal.Conta;
    rbEmail.Checked := True;
  end;
  Ajusta;
  ShowModal;
  
  if ModalResult=mrOk then begin
    if rbEmail.Checked then
      S := edEmail.Text else
      S := edChave.Text;
      
    if S<>RegistroGlobal.Conta then begin  
      RegistroGlobal.Conta := S;
      RegistroGlobal.StringChaves := '';
      RegistroGlobal.SalvaArqPadrao;
    end;
  end else
    Result := False;
end;

procedure TFrmCodLoja.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCodLoja.FormCreate(Sender: TObject);
begin
  FShowing := False;
end;

procedure TFrmCodLoja.FormShow(Sender: TObject);
begin
  FShowing := True;
  if rbEmail.Checked then
    edEmail.SetFocus else
    edChave.SetFocus;
end;

procedure TFrmCodLoja.rbCodLojaClick(Sender: TObject);
begin
  Ajusta;
  if FShowing then
    edChave.SetFocus;
end;

procedure TFrmCodLoja.rbEmailClick(Sender: TObject);
begin
  Ajusta;
  if FShowing then
    edEmail.SetFocus;
end;

end.
