unit uAFrmRel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrmTipoRel = class(TForm)
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    FResultado : Integer;
    { Private declarations }
  public
    function ObtemTipoRel: Integer;
    { Public declarations }
  end;

var
  FrmTipoRel: TFrmTipoRel;

implementation

{$R *.dfm}

{ TForm2 }

procedure TFrmTipoRel.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmTipoRel.BitBtn2Click(Sender: TObject);
begin
  FResultado := -1;
  Close;
end;

procedure TFrmTipoRel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TFrmTipoRel.ObtemTipoRel: Integer;
begin
  FResultado := 0;
  ShowModal;
  Result := FResultado;
end;

procedure TFrmTipoRel.RadioButton1Click(Sender: TObject);
begin
  FResultado := 0;
end;

procedure TFrmTipoRel.RadioButton2Click(Sender: TObject);
begin
  FResultado := 1;
end;

procedure TFrmTipoRel.RadioButton3Click(Sender: TObject);
begin
  FResultado := 2;
end;

end.
