program TesteBrowserEmbutidoAD;

uses
  Vcl.Forms,
  uTesteBrowserEmbutidoAD in 'uTesteBrowserEmbutidoAD.pas' {FrmTestePub};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmTestePub, FrmTestePub);
  Application.Run;
end.
