program CorrigeVendas;

uses
  Forms,
  uCorrigeVendas in 'uCorrigeVendas.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
