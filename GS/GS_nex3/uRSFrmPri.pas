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
    Timer1: TTimer;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbCyber: TLabel;
    lbNex: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;

implementation

uses uRSQSRegistro100, uRSDM;

{$R *.dfm}

procedure TFrmPri.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FimApp := True;
end;

procedure TFrmPri.FormShow(Sender: TObject);
begin
  Timer1Timer(nil);
end;

procedure TFrmPri.Timer1Timer(Sender: TObject);
var
  I : Integer;  
const
  nomeprog : array [0..1] of String = ('Cyber Manager', 'NexCafé');
begin
  lbCyber.Caption := IntToStr(nRequests[0]);
  lbNex.Caption := IntToStr(nRequests[1]);
end;

end.
