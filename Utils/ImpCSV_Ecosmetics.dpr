program ImpCSV_Ecosmetics;

uses
  Forms,
  uImpCSV_ECosmetics in 'uImpCSV_ECosmetics.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
