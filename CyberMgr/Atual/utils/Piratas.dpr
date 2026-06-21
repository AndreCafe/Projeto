program Piratas;

uses
  Forms,
  uPiratas in 'uPiratas.pas' {Form14};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm14, Form14);
  Application.Run;
end.
