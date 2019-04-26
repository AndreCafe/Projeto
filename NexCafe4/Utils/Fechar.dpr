program Fechar;

uses
  Forms,
  uFechar in 'uFechar.pas' {Form17};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Teste Close MSN';
  Application.CreateForm(TForm17, Form17);
  Application.Run;
end.
