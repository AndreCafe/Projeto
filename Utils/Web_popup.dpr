program Web_popup;

uses
  Forms,
  uPOPUP in 'uPOPUP.pas' {Form21};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm21, Form21);
  Application.Run;
end.
