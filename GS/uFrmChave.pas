unit uFrmChave;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, PngBitBtn, pngimage, ExtCtrls, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, cxMaskEdit;

type
  TFrmChave = class(TForm)
    lbSenha: TcxLabel;
    btnOk: TPngBitBtn;
    btnCanc: TPngBitBtn;
    Image1: TImage;
    edChave: TcxMaskEdit;
    cxLabel1: TcxLabel;
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    function Editar(var aChave: String): Boolean;
    { Public declarations }
  end;

var
  FrmChave: TFrmChave;

implementation

{$R *.dfm}

{ TFrmChave }

function TFrmChave.Editar(var aChave: String): Boolean;
begin
  edChave.Text := aChave;
  ShowModal;
  Result := (ModalResult = mrOk) and (edChave.Text<>aChave);
  if Result then
    aChave := edChave.Text;
end;

procedure TFrmChave.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmChave.btnOkClick(Sender: TObject);
begin
  if Length(Trim(edChave.Text))<24 then
    Raise Exception.Create('O código deve ter 20 dígitos');
end;

end.
