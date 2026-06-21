program Client;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {Form1},
  CalcIntf in '..\CalcIntf.pas',
  CalcFrm in 'CalcFrm.pas' {frmCalc};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
