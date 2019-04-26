unit ncaFrmEditContatoPeqMsg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaFrmEditContatoPeq, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Menus, StdCtrls, cxButtons,
  ImgList, ncMyImage, cxLabel, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, ncDebCredValidator;

type
  TFrmEditContatoValidar = class(TFrmEditContatoPeq)
    lbMsg: TcxLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    btnSalvar: TcxButton;
    btnCancelar: TcxButton;
  private
    { Private declarations }
    FVal : TncDebCredValidator;
  public
    function Editar(aValidator: TncDebCredValidator): Boolean;
    { Public declarations }
  end;

var
  FrmEditContatoValidar: TFrmEditContatoValidar;

implementation

{$R *.dfm}

{ TFrmEditContatoValidar }

function TFrmEditContatoValidar.Editar(
  aValidator: TncDebCredValidator): Boolean;
begin
  ShowModal;
end;

end.
