program Project15;

uses
  Forms,
  Unit22 in 'Unit22.pas' {Form22},
  ncFrmImp in 'ncFrmImp.pas' {FrmImp},
  ncFrmShade in 'ncFrmShade.pas' {FrmShade};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm22, Form22);
  Application.CreateForm(TFrmImp, FrmImp);
  Application.CreateForm(TFrmShade, FrmShade);
  Application.Run;
end.
