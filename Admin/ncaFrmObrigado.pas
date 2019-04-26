unit ncaFrmObrigado;
{
    ResourceString: Dario 11/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, StdCtrls, cxButtons, LMDPNGImage, ExtCtrls,
  cxLabel;

type
  TFrmObrigado = class(TForm)
    lbMsg: TcxLabel;
    Image1: TImage;
    cxButton1: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    procedure Mostrar(aMsg: String);
    { Public declarations }
  end;

var
  FrmObrigado: TFrmObrigado;

implementation

// START resource string wizard section
resourcestring
  SSeuRegistroFoiConfirmadoComSuces = 'Seu registro foi confirmado com sucesso!';

// END resource string wizard section


{$R *.dfm}

procedure TFrmObrigado.CreateParams(var Params: TCreateParams);
begin
  inherited;
  if Owner is TWinControl then begin
    params.ExStyle := params.ExStyle or WS_EX_APPWINDOW;
    params.WndParent := TCustomForm(Owner).Handle;
  end;
end;

procedure TFrmObrigado.cxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmObrigado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmObrigado.FormCreate(Sender: TObject);
begin
  lbMsg.Caption := SSeuRegistroFoiConfirmadoComSuces;
end;

procedure TFrmObrigado.Mostrar(aMsg: String);
begin
  lbMsg.Caption := aMsg;
  ShowModal;
end;

end.

