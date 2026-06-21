program geckotest;

uses
  Forms,
  f_GeckoTest in 'f_GeckoTest.pas' {fGeckoTest};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfGeckoTest, fGeckoTest);
  Application.Run;
end.
