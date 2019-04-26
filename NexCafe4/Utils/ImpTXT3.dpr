program ImpTXT3;

uses
  Forms,
  uImpTXT3 in 'uImpTXT3.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
