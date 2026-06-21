program EstRedirs;

uses
  Forms,
  uEstRedirs in 'uEstRedirs.pas' {Form13};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Nextar - Estatísticas';
  Application.CreateForm(TForm13, Form13);
  Application.Run;
end.
