program ImpDBFTimer;

uses
  Forms,
  uImpDBF_Timer in 'uImpDBF_Timer.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
