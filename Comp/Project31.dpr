program Project31;

uses
  Forms,
  Unit38 in 'Unit38.pas' {Form38},
  ncHash in 'ncHash.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm38, Form38);
  Application.Run;
end.
