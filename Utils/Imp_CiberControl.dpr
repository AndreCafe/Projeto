program Imp_CiberControl;

uses
  Forms,
  uImpCiber in 'uImpCiber.pas' {Form16},
  ncClassesBase in '..\Comp\ncClassesBase.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
