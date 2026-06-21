program VCLMap;

uses
  Forms,
  GoogleMap in 'GoogleMap.pas' {Form1},
  uForm2 in 'uForm2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
