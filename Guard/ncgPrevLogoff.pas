unit ncgPrevLogoff;

interface

uses
  Windows, SysUtils, ExtCtrls, Classes;

type  

   TPrevLogoff = class
   public
     procedure Prev1(Sender: TObject);
     procedure Prev2(Sender: TObject);
   end;

   TThreadPrevLogoff = class ( TThread )
   protected
     procedure Execute; override;
   end;
  

  procedure PrevLogoff;

var
  GPrevLogoff : TPrevLogoff;  

implementation

uses ncShellStart, ncDebug, madKernel;

procedure PrevLogoff;
begin
//  DebugMsg('PrevLogoff');
  try
    if (Win32MajorVersion > 5) then  
    with TTimer.Create(nil) do begin
      Interval := 200;
      OnTimer := GPrevLogoff.Prev1;
      Enabled := True;
      Tag := GetTickCount;
    end;
  except 
  end;
end;

{ TPrevLogoff }

procedure TPrevLogoff.Prev1(Sender: TObject);
var 
  W: IWindow;
begin
  Exit;
  try
    W := Window('BlockedShutdownResolver');
    if (W=nil) and ((GetTickCount-TTimer(Sender).Tag)<10000) then Exit;
  
    try
      DebugMsg('TPrevLogoff.Prev1');
      if W<>nil then W.Close;
  
{      ShellStart('shutdown.exe', '-a');
      keybd_event(VK_ESCAPE, Mapvirtualkey(VK_ESCAPE, 0), 0, 0);
      with TTimer.Create(nil) do begin
        Interval := 50;
        OnTimer := GPrevLogoff.Prev2;
        Enabled := True;
      end;}
    finally
      Sender.Free;
    end;
  except
  end;
end;

procedure TPrevLogoff.Prev2(Sender: TObject);
begin
  Exit;
  try
    try
      DebugMsg('TPrevLogoff.Prev2');
      keybd_event(VK_ESCAPE, Mapvirtualkey(VK_ESCAPE, 0), KEYEVENTF_KEYUP, 0);
    finally
      Sender.Free;
    end;
  except
  end;
end;

{ TThreadPrevLogoff }

procedure TThreadPrevLogoff.Execute;
var 
  W: IWindow;
  T: Cardinal;
begin
  try
    T := GetTickCount;
    repeat 
      W := Window('BlockedShutdownResolver');
      Sleep(0);
    until (W<>nil) or ((GetTickCount-T)>10000);
//    if W<>nil then W.Close;
  except 
    on E: Exception do 
      DebugMsg('TThreadPrevLogoff.Execute - Exception: ' + E.Message);
  end;
end;

initialization
  GPrevLogoff := TPrevLogoff.Create;

finalization
  GPrevLogoff.Free;  

end.
