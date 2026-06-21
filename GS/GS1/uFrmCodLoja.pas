unit uFrmCodLoja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, PngBitBtn, pngimage, ExtCtrls, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, cxMaskEdit;

type
  TFrmCodLoja = class(TForm)
    lbSenha: TcxLabel;
    btnOK: TPngBitBtn;
    btnCancelar: TPngBitBtn;
    Image1: TImage;
    edChave: TcxMaskEdit;
    cxLabel1: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    function Editar(var aChave: String): Boolean;
    { Public declarations }
  end;

var
  FrmCodLoja: TFrmCodLoja;

implementation

uses uLicEXECryptor;

{$R *.dfm}

{ TFrmChave }

procedure TFrmCodLoja.btnOKClick(Sender: TObject);
begin
  if not CodLojaOK(edChave.Text) then
    Raise Exception.Create('O Código informado não é válido!');
end;

function TFrmCodLoja.Editar(var aChave: String): Boolean;
begin
  edChave.Text := aChave;
  ShowModal;
  Result := (ModalResult = mrOk);
  if Result then
    aChave := edChave.Text;
end;

procedure TFrmCodLoja.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
