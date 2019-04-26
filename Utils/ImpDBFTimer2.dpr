program ImpDBFTimer2;

uses
  Forms,
  uImpDBF_Timer2 in 'uImpDBF_Timer2.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
