unit ncaFrmObs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMemo;

type
  TFrmObs = class(TForm)
    meObs: TcxMemo;
    btnSalvar: TcxButton;
    cxButton2: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    function Editar(var Obs: String; aSalvar: Boolean): Boolean;
    { Public declarations }
  end;

var
  FrmObs: TFrmObs;

implementation

{$R *.dfm}

function TFrmObs.Editar(var Obs: String; aSalvar: Boolean): Boolean;
begin
  btnSalvar.Enabled := aSalvar;
  meObs.Lines.Text := Obs;
  ShowModal;
  meObs.PostEditValue;
  if ModalResult=mrOk then begin
    Obs := meObs.Lines.Text;
    Result := True;
  end else
    Result := False;
end;

procedure TFrmObs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
