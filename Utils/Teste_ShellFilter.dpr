program Teste_ShellFilter;

uses
  Forms,
  ncgFrmShellFilter in '..\Guard\ncgFrmShellFilter.pas' {FrmShellFilter};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmShellFilter, FrmShellFilter);
  Application.Run;
end.
