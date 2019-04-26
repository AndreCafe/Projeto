program Corrige_Debitos2;

uses
  Forms,
  uCorrige_Debitos2 in 'uCorrige_Debitos2.pas' {Form18};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm18, Form18);
  Application.Run;
end.
