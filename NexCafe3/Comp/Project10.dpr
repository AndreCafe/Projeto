program Project10;

uses
  Forms,
  Unit14 in 'Unit14.pas' {Form14},
  GrFinger in 'GrFinger.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm14, Form14);
  Application.Run;
end.
