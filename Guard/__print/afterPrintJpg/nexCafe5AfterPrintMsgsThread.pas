unit nexCafe5AfterPrintMsgsThread;

interface

uses
   classes, windows, messages;

const
  WM_NEWPREINT_MESSAGE = WM_USER + 0;
  
type

TMsgsThread = class(TThread)
private
  { hidden window handle }
  FWinHandle: HWND;
  FRemoteAppHandle: HWND;
  FNomeMaquina : string;
protected
  procedure Execute; override;
  { our window procedure }
  procedure WndProc(var msg: TMessage);   
  procedure DeallocateHWnd(Wnd: HWND);
public
  constructor Create(remoteAppHandle: HWND);
  procedure AnunciarArquivo(fn:string);
  function  GetNomeMaquina:string;
  destructor Destroy; override;
end;

implementation

{ TMsgsThread }

procedure TMsgsThread.AnunciarArquivo(fn: string);
begin

end;

constructor TMsgsThread.Create(remoteAppHandle: HWND);
begin
  FRemoteAppHandle := remoteAppHandle;
  FWinHandle := AllocateHWND(WndProc);
  inherited Create(False);
end;

destructor TMsgsThread.Destroy;
begin
  DeallocateHWnd(FWinHandle);
  inherited;
end;

procedure TMsgsThread.Execute;
begin
  inherited;
  if FRemoteAppHandle>0 then begin
      repeat

          sleep(50);
      until terminated
  end;
end;

function TMsgsThread.GetNomeMaquina: string;
begin
      //FNomeMaquina := 'Maquina1';
      FNomeMaquina := '';
      SendMessage(FRemoteAppHandle
      repeat
          sleep(50);
      until terminated or FNomeMaquina>'';
      result := FNomeMaquina;
end;

procedure TMsgsThread.WndProc(var msg: TMessage);
begin

end;

procedure TMsgsThread.DeallocateHWnd(Wnd: HWND);
var
  Instance: Pointer;
begin
  Instance := Pointer(GetWindowLong(Wnd, GWL_WNDPROC));
  if Instance <> @DefWindowProc then
  begin
    { make sure we restore the default 
      windows procedure before freeing memory } 
    SetWindowLong(Wnd, GWL_WNDPROC, Longint(@DefWindowProc));
    FreeObjectInstance(Instance);
  end;
  DestroyWindow(Wnd);
end;

end.
