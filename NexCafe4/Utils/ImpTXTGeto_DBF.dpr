program ImpTXTGeto_DBF;

uses
  Forms,
  uImpTXTGeto_DBF in 'uImpTXTGeto_DBF.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
