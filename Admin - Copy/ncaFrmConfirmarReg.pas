unit ncaFrmConfirmarReg;
{
    ResourceString: Dario 11/03/13
    Nada para para fazer
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, StdCtrls, cxButtons, LMDPNGImage, ExtCtrls,
  cxLabel;

type
  TFrmConfirmarReg = class(TForm)
    cxLabel1: TcxLabel;
    Image1: TImage;
    cxButton1: TcxButton;
    cxLabel2: TcxLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public declarations }
  end;

var
  FrmConfirmarReg: TFrmConfirmarReg;

implementation

{$R *.dfm}

procedure TFrmConfirmarReg.CreateParams(var Params: TCreateParams);
begin
  inherited;
  if Owner is TWinControl then begin
    params.ExStyle := params.ExStyle or WS_EX_APPWINDOW;
    params.WndParent := TCustomForm(Owner).Handle;
  end;
end;

procedure TFrmConfirmarReg.cxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmConfirmarReg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
