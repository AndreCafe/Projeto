program ImpDBFTimer3;

uses
  Forms,
  uImpDBF_Timer3 in 'uImpDBF_Timer3.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
