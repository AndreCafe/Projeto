program ImpCSV_Fornecedores;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Forms,
  uImpCSV_fornecedores in '..\..\NEX\Utils\uImpCSV_fornecedores.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
