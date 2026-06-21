program Sample;

uses
  Forms,
  Main in 'Main.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'How to save grid settings to a BLOB field';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
