program TestaProt;

uses
  Forms,
  UnitT in '..\..\..\Arquivos de programas\Borland\Delphi5\Projects\UnitT.pas' {Form1},
  cmProtecao98 in '..\Protecao\cmProtecao98.pas',
  cmProxyProt in '..\Protecao\cmProxyProt.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
