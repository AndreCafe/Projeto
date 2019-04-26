program Imp_Ferus;

uses
  Forms,
  uImpFDB_Ferus in 'uImpFDB_Ferus.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Importar dados do ODIN';
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
