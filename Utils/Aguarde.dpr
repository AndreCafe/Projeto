program Aguarde;

uses
  Forms,
  uPri in 'uPri.pas' {FrmPri},
  uFrmComSombra in 'C:\projetos\utils\uFrmComSombra.pas' {FrmComSombra},
  uFrmSombra in 'C:\projetos\utils\uFrmSombra.pas' {FrmSombra},
  uFrmAguarde2 in 'uFrmAguarde2.pas' {FrmAguarde2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
