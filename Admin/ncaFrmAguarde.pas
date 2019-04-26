unit ncaFrmAguarde;
{
    ResourceString: Dario 10/03/13  Nada pra fazer
}


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxLabel, Menus, StdCtrls, cxButtons, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrmAguarde = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    btnCancelar: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAguarde: TFrmAguarde;

implementation

{$R *.dfm}

procedure TFrmAguarde.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
