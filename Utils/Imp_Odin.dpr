program Imp_Odin;

uses
  Forms,
  uImpFDB_odin in 'uImpFDB_odin.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Importar dados do ODIN';
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
