program Project12;

uses
  Forms,
  Unit15 in 'Unit15.pas' {Form15},
  ncClassesBase in 'ncClassesBase.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm15, Form15);
  Application.Run;
end.
