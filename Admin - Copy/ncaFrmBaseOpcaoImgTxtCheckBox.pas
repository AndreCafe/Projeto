unit ncaFrmBaseOpcaoImgTxtCheckBox;
{
    ResourceString: Dario 09/03/13   Nada pra fazer
}


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaFrmBaseOpcaoImgTxt, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Menus, StdCtrls, cxButtons,
  cxLabel, ExtCtrls, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, cxCheckBox;

type
  TFrmBaseOpcaoImgTxtCheckBox = class(TFrmBaseOpcaoImgTxt)
    CB: TcxCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }

    procedure Renumera; override;
  end;

var
  FrmBaseOpcaoImgTxtCheckBox: TFrmBaseOpcaoImgTxtCheckBox;

implementation

{$R *.dfm}

{ TFrmBaseOpcaoImgTxtCheckBox }

procedure TFrmBaseOpcaoImgTxtCheckBox.Renumera;
begin
  CB.Caption := IntToStr(InicioNumItem)+'. '+CB.Caption;
end;

end.
