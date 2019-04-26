unit ncaFrmConn;
{
    ResourceString: Dario 11/03/13
    Nada para para fazer
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Menus, StdCtrls, cxButtons, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLabel, cxClasses, cxRadioGroup;

type
  TFrmConn = class(TForm)
    cxEditStyleController1: TcxEditStyleController;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConn: TFrmConn;

implementation

{$R *.dfm}

procedure TFrmConn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
