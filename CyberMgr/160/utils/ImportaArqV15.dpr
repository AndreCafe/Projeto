program ImportaArqV15;

uses
  Forms,
  uImpV15 in 'uImpV15.pas' {Form1},
  uImpV15DM in 'uImpV15DM.pas' {dmDados: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmDados, dmDados);
  Application.Run;
end.
