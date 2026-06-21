unit uDTAFrmApagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls;

type
  TFrmApagar = class(TForm)
    edData: TDateTimePicker;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FApagar : Boolean;
    { Private declarations }
  public
    function Apagar(var Data: TDateTime): Boolean;
    { Public declarations }
  end;

var
  FrmApagar: TFrmApagar;

implementation

{$R *.DFM}

function TFrmApagar.Apagar(var Data: TDateTime): Boolean;
begin
  FApagar := False;
  edData.MaxDate := Now - 90;
  ShowModal;
  Result := FApagar;
  if Result then
    Data := edData.DateTime;
end;

procedure TFrmApagar.BitBtn1Click(Sender: TObject);
begin
  FApagar := True;
  Close;
end;

procedure TFrmApagar.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmApagar.FormCreate(Sender: TObject);
begin
  edData.DateTime := Now - 180;
end;

procedure TFrmApagar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
