unit ncaFrmTipoRec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, cxRadioGroup;

type
  TFrmTipoRec = class(TForm)
    rbVendas: TcxRadioButton;
    rbSessao: TcxRadioButton;
    btnOk: TcxButton;
    btnCancelar: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    function ObtemTipoRec: Byte;
  end;

var
  FrmTipoRec: TFrmTipoRec;

implementation

{$R *.dfm}

procedure TFrmTipoRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TFrmTipoRec.ObtemTipoRec: Byte;
begin
  ShowModal;
  if ModalResult=mrOk then
    Result := Byte(rbSessao.Checked)+1 else
    Result := 0;
end;

end.
