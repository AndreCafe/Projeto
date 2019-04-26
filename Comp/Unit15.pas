unit Unit15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncClassesBase, StdCtrls;

type
  TForm15 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    
    FTempo : TncTempo;
    { Private declarations }
  public
    property Tempo: TncTempo
      read FTempo;
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

{$R *.dfm}

procedure TForm15.Button1Click(Sender: TObject);
begin
  Tempo.Horas := 2;
end;

procedure TForm15.Button2Click(Sender: TObject);
begin
  ShowMessage('Horas = ' + FloatToStr(Tempo.Horas));
  FTempo.Horas := 3;
end;

procedure TForm15.FormCreate(Sender: TObject);
begin
  Tempo.Horas := 1;
end;

end.
