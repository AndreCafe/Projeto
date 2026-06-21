program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  ufmFormBase in 'ufmFormBase.pas' {FrmBase},
  Unit2 in 'Unit2.pas' {FrmTeste},
  Unit3 in 'Unit3.pas' {FrmBase3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
