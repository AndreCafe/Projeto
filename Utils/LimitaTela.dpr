program LimitaTela;

uses
  Forms,
  uLimitaTela in 'uLimitaTela.pas' {Form34},
  ncgLimiteTela in '..\Guard\ncgLimiteTela.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm34, Form34);
  Application.Run;
end.
