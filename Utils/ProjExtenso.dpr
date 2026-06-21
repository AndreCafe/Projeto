program ProjExtenso;

uses
  Forms,
  Unit1 in '..\..\Program Files\Borland\Delphi5\Projects\Unit1.pas' {Form1},
  Extenso in 'Extenso.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
