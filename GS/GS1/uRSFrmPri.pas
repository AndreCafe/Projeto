unit uRSFrmPri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage, ExtCtrls;

type
  TFrmPri = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Label1: TLabel;
    LB: TListBox;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;

implementation

uses uRSQSRegistro100;

{$R *.dfm}

procedure TFrmPri.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPri.FormShow(Sender: TObject);
begin
  Timer1Timer(nil);
end;

procedure TFrmPri.Timer1Timer(Sender: TObject);
var I : Integer;
begin
  LB.Items.Clear;
  for I := 1 to 6 do
    LB.Items.Add(opString[I]+'='+IntToStr(nRequests[I]));
end;

end.
