unit ncaFrmErroNav;
{
    ResourceString: Dario 11/03/13
    Nada pra fazer
}


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxLabel, Menus, StdCtrls, cxButtons, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrmErroNav = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    btnCancelar: TcxButton;
    cxLabel2: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmErroNav: TFrmErroNav;

implementation

{$R *.dfm}

procedure TFrmErroNav.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
