unit ncaFrmEditObs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMemo, StdCtrls, cxButtons, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrmEditObs = class(TForm)
    LMDSimplePanel2: TLMDSimplePanel;
    btnSalvar: TcxButton;
    btnCancelar: TcxButton;
    edObs: TcxMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    function Editar(aObs: String): String;
    { Public declarations }
  end;

var
  FrmEditObs: TFrmEditObs;

implementation

uses ncaFrmPri;

{$R *.dfm}

{ TForm1 }

function TFrmEditObs.Editar(aObs: String): String;
begin
  edObs.Lines.Text := aObs;
  ShowModal;
  if ModalResult=mrOk then begin
    if Trim(edObs.Lines.Text)='' then 
      Result := '' else
      Result := edObs.Lines.Text;
  end else
    Result := aObs;
end;

procedure TFrmEditObs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmEditObs.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key  of
    Key_F2    : if btnSalvar.Enabled then btnSalvar.Click;
    Key_Esc   : Close;
  end;
end;

end.
