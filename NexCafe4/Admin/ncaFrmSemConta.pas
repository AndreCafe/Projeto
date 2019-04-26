unit ncaFrmSemConta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxControls, cxContainer,
  cxEdit, cxLabel, StdCtrls, cxButtons, LMDPNGImage, ExtCtrls;

type
  TFrmSemConta = class(TForm)
    Image1: TImage;
    cxButton1: TcxButton;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSemConta: TFrmSemConta;

implementation

{$R *.dfm}

procedure TFrmSemConta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
