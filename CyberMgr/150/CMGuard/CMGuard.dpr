program CMGuard;

uses
  nxReplacementMemoryManager,
  Forms,
  SysUtils,
  abfComponents,
  Windows,
  uCMGPri in 'uCMGPri.pas' {FrmPri},
  uCMGLogin in 'uCMGLogin.pas' {FrmLogin},
  uCMGPausa in 'uCMGPausa.pas' {FrmPausa},
  uCMGConta in 'uCMGConta.pas' {FrmConta},
  uCMGConfig in 'uCMGConfig.pas' {FrmConfig},
  uCMGFrmAtualiza in 'uCMGFrmAtualiza.pas' {FrmAtualiza};

{$R *.RES}

type
  THackClass = Class
  public
    procedure ShutQueryShutdown(Sender: TObject; var CanShutdown: Boolean);
  public

  end;
var
  S : TabfShutdown;
  HC : THackClass;

{ HackClass }

procedure THackClass.ShutQueryShutdown(Sender: TObject;
  var CanShutdown: Boolean);
begin
  CanShutDown := True;
end;

begin
  Application.Initialize;
  
//  TThreadEnter.Create(False);
  
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

  if glShutOp>-1 then begin
    HC := THackClass.Create;
    S := TabfShutdown.Create(nil);
    S.OnQueryShutdown := HC.ShutQueryShutdown;
    S.Force := (Win32Platform=VER_PLATFORM_WIN32_NT);
    try
      case glShutOp of
        1 : begin
              S.ActionType := aatReboot;
              S.Execute;
            end;

        2 : begin
              if S.Force then
                S.ActionType := aatPowerOff
              else
                S.ActionType := aatShutdown;
              S.Execute;
            end;
      end;
    except
    end;
    S.Free;
    HC.Free;
  end;

    
end.
