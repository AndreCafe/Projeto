unit uNexAR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ncAcessoRemoto, StdCtrls;

type
  TForm19 = class(TForm)
    Timer1: TTimer;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    AR : TarThread;
  public
    { Public declarations }
  end;

var
  Form19: TForm19;

implementation

{$R *.dfm}

procedure TForm19.Button1Click(Sender: TObject);
begin
  AR := TarThread.Create(False);
  AR.FreeOnTerminate := True;
end;

procedure TForm19.Button2Click(Sender: TObject);
begin
  AR.Terminate;
end;

end.
