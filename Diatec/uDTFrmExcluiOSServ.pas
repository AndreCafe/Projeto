unit uDTFrmExcluiOSServ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFrmExcluiOSServ = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FResultado : Boolean;
  public
    function ExcluirOS: Boolean;
    { Public declarations }
  end;

var
  FrmExcluiOSServ: TFrmExcluiOSServ;

implementation

{$R *.dfm}

procedure TFrmExcluiOSServ.BitBtn1Click(Sender: TObject);
begin
  FResultado := True;
  Close;
end;

procedure TFrmExcluiOSServ.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

function TFrmExcluiOSServ.ExcluirOS: Boolean;
begin
  FResultado := False;
  ShowModal;
  Result := FResultado;
end;

procedure TFrmExcluiOSServ.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
