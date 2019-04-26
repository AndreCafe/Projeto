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
    cxButton1: TcxButton;
    LMDSimplePanel1: TLMDSimplePanel;
    ImageIconeGrande: TImage;
    LMDSimplePanel2: TLMDSimplePanel;
    cxLabel2: TcxLabel;
    rbCliente: TcxRadioButton;
    rbCriar: TcxRadioButton;
    cxLabel1: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    function CriarConta: Boolean;
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

function TFrmSemReg.CriarConta: Boolean;
begin
  ShowModal;
  Result := (ModalResult=mrOk) and rbCriar.Checked;
end;

end.
