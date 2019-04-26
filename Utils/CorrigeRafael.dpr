program CorrigeRafael;

uses
  Forms,
  uCorrige_Rafael in 'uCorrige_Rafael.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
