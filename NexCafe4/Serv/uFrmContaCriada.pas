unit uFrmContaCriada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, LMDPNGImage,
  ExtCtrls, cxControls, cxContainer, cxEdit, cxLabel, cxGraphics, cxLookAndFeels;

type
  TFrmContaCriada = class(TForm)
    lbProduto: TcxLabel;
    cxLabel1: TcxLabel;
    Image1: TImage;
    cxButton1: TcxButton;
    cxLabel2: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmContaCriada: TFrmContaCriada;

implementation

{$R *.dfm}

procedure TFrmContaCriada.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
