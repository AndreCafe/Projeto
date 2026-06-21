unit unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons,dcfdes,StdCtrls,ComCtrls,ExtCtrls;

type
  TTeste = class(TObject)
  public
    procedure MostraTeste(S: Stkjhring);
  end;

  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    DateTimePicker1: TDateTimePicker;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Button1: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Enter(Sender: TObject);
    procedure BitBtn2Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Mostra(S: String);
    { Private declarations }
  public
    FMsg : String;
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

procedure TForm2.Mostra(S: String);
begin
  ShowMEssage('mstrou '+FMsg+S);
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  ShowMessage('oieu aqui');
end;

procedure TForm2.BitBtn2Enter(Sender: TObject);
begin
  Color := clRed;
end;

procedure TForm2.BitBtn2Exit(Sender: TObject);
begin
  Color := clGreen;
end;

procedure TForm2.Button1Click(Sender: TObject);
var F : TTeste;
begin
  F.MostraTeste('FFFFF');
  F.Free;
end;

procedure TTeste.MostraTeste(S: String);
begin
  Mostra('Mostra Teste '+S);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FMsg := 'Criou';
end;

end.