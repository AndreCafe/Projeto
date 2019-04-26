unit ncaFrmAddMaq;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxControls, cxContainer, cxEdit, cxLabel, LMDPNGImage,
  ExtCtrls, cxCheckBox, cxGraphics, cxLookAndFeels;

type
  TFrmAddMaq = class(TForm)
    Image1: TImage;
    cxLabel1: TcxLabel;
    edMaq: TcxSpinEdit;
    cxLabel2: TcxLabel;
    btnOk: TcxButton;
    btnCancelar: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    function AddMaq(var aNum: Integer): Boolean;
    { Public declarations }
  end;

var
  FrmAddMaq: TFrmAddMaq;

implementation

uses ncaDM;

{$R *.dfm}

function TFrmAddMaq.AddMaq(var aNum: Integer): Boolean;
begin
  edMaq.Value := aNum;
  ShowModal;
  
  if ModalResult=mrOk then begin
    aNum := edMaq.Value;
    Result := True;  
  end else
    Result := False;
end;

procedure TFrmAddMaq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
