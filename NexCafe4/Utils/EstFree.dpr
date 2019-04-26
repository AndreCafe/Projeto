program EstFree;

uses
  Forms,
  uEstFrmPri in 'uEstFrmPri.pas' {frmPri};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPri, frmPri);
  Application.Run;
end.
