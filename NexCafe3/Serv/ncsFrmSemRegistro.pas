unit ncsFrmSemRegistro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxLabel, pngimage, ExtCtrls, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, StdCtrls, cxButtons, cxRadioGroup,
  LMDControl;

type
  TFrmSemReg = class(TForm)
    rbTeste: TcxRadioButton;
    rbCliente: TcxRadioButton;
    rbNaoRegistrar: TcxRadioButton;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    LMDSimplePanel1: TLMDSimplePanel;
    ImageIconeGrande: TImage;
    LMDSimplePanel2: TLMDSimplePanel;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    function OpcaoRegistro: Integer;
  end;

var
  FrmSemReg: TFrmSemReg;

implementation

{$R *.dfm}

{ TFrmSemReg }

procedure TFrmSemReg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TFrmSemReg.OpcaoRegistro: Integer;
begin
  Result := 3;
  ShowModal;
  if ModalResult=mrOk then
  if rbTeste.Checked then
    Result := 1
  else
  if rbCliente.Checked then
    Result := 2;
end;

end.
