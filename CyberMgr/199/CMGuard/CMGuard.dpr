program CMGuard;

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
  uCMLVBack in 'uCMLVBack.pas';

{$R *.RES}

type
  THackClass = Class
  public
    procedure ShutQueryShutdown(Sender: TObject; var CanShutdown: Boolean);
  public

  end;

var
  HC : THackClass;
  shutdownFlags : Cardinal;

{ HackClass }

procedure THackClass.ShutQueryShutdown(Sender: TObject;
  var CanShutdown: Boolean);
begin
  CanShutDown := True;
end;

begin
  Application.Initialize;
  
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
  
  Application.CreateForm(TDataModule1, DataModule1);
  if not MaisDeUm then begin
    Application.CreateForm(TFrmPri, FrmPri);
    Application.CreateForm(TFrmLogin, FrmLogin);
    Application.Run;

    if glShutOp>-1 then begin
      shutdownFlags := 0;
      if Win32Platform=VER_PLATFORM_WIN32_NT then
        shutdownFlags := EWX_FORCE;
      case glShutOp of
        1 : shutdownFlags := shutdownFlags + EWX_REBOOT;
        2 : if shutdownFlags=EWX_FORCE then
              shutdownFlags := EWX_FORCE + EWX_POWEROFF
            else
              shutdownFlags := EWX_SHUTDOWN;
      end;
      Desliga(shutdownFlags);
    end;
  end else
    DataModule1.Free; 

end.
