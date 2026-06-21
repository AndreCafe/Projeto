program CMGuard;

uses
  Forms,
  SysUtils,
  uCMGPri in 'uCMGPri.pas' {FrmPri},
  uCMGLogin in 'uCMGLogin.pas' {FrmLogin},
  uCMGPausa in 'uCMGPausa.pas' {FrmPausa},
  uCMGConta in 'uCMGConta.pas' {FrmConta},
  uCMGConfig in 'uCMGConfig.pas' {FrmConfig},
  uCMGFrmAtualiza in 'uCMGFrmAtualiza.pas' {FrmAtualiza};

{$R *.RES}

begin
  Application.Initialize;
  
  TThreadEnter.Create(False);
  
  if Pos('\NCMGUARD.EXE', UpperCase(ParamStr(0)))>0 then 
  with TFrmAtualiza.Create(nil) do begin
    try
      IsNew := True;
      ShowModal;
    finally
      Free;
    end;
    Exit;
  end;
  
  Application.CreateForm(TFrmPri, FrmPri);
  Application.Run;
end.
