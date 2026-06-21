program ImportaArqV1;

uses
  Forms,
  uImpFF1Pri in 'uImpFF1Pri.pas' {FrmPri},
  uImpFF1EngMgr in 'uImpFF1EngMgr.pas' {FFEngMgr: TffBaseEngineManager},
  CMChecaBD in '..\Servidor\CMChecaBD.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFFEngMgr, FFEngMgr);
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
