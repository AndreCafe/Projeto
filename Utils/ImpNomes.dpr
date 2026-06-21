program ImpNomes;

uses
  Forms,
  uImpNomes in 'uImpNomes.pas' {Form28};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm28, Form28);
  Application.Run;
end.
