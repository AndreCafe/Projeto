program Guard;

uses
  Forms,
  SysUtils,
  Windows,
  uCMGDesliga,
  uCMGPri in 'uCMGPri.pas' {FrmPri},
  uCMGLogin in 'uCMGLogin.pas' {FrmLogin},
  uCMGPausa in 'uCMGPausa.pas' {FrmPausa},
  uCMGConta in 'uCMGConta.pas' {FrmConta},
  uCMGFrmAtualiza in 'uCMGFrmAtualiza.pas' {FrmAtualiza},
  uCMGDM in 'uCMGDM.pas' {DataModule1: TDataModule},
  uCMGConfigDesktop in 'uCMGConfigDesktop.pas' {FrmDesktop},
  uCMGFake in 'uCMGFake.pas' {FrmFake},
  uCMLVBack in 'uCMLVBack.pas',
  cmProtecao98 in '..\Protecao\cmProtecao98.pas';

{$R *.RES}

begin
  Application.Initialize;
  
  if Pos('\NGUARD.EXE', UpperCase(ParamStr(0)))>0 then
  with TFrmAtualiza.Create(nil) do begin
    try
      IsNew := True;
      ShowModal;
    finally
      Free;
    end;
    Exit;
  end;

  if UpperCase(ParamStr(1)) = 'REMOVE' then
    with TcmProtege98.Create(nil) do begin
      AutoStart(False);
      Free;
      Exit;
    end;  
  
  Application.Title := 'CyberRoom - Guard';
  Application.CreateForm(TDataModule1, DataModule1);
  if not MaisDeUm then begin
    Application.CreateForm(TFrmPri, FrmPri);
    Application.CreateForm(TFrmLogin, FrmLogin);
    Application.Run;
  end else
    DataModule1.Free; 

  if Reiniciar then begin  
    if Win32Platform=VER_PLATFORM_WIN32_NT then
      Desliga(EWX_FORCE + EWX_REBOOT)
    else
      Desliga(EWX_REBOOT);  
  end;    

end.
