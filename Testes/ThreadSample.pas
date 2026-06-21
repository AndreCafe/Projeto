unit ThreadSample;

interface

uses Classes, Windows;

type
  IFlasher = interface
    ['{14C78CB1-69E5-11D6-9239-0004AC5359AE}']
    procedure Flash;
  end;
  TFlasher = class(TInterfacedObject,IFlasher)
  private
    FHandle : HWND;
  public
    constructor Create(AHandle: THandle);
    destructor Destroy; override;
    // IFlasher
    procedure Flash;
  end;
  TFlashThread = class(TThread)
  private
    FFlasher : IFlasher;
  protected
    procedure CallFlasher;
    procedure Execute; override;
  public
    constructor Create(const AFlasher: IFlasher);
  end;

implementation

{ TFlasher }

constructor TFlasher.Create(AHandle: THandle);
begin
  inherited Create;
  FHandle := AHandle;
end;

destructor TFlasher.Destroy;
begin
  // You can put a breakpoint in here yourself to show that the flasher
  // object DOES get destroyed once the thread is done
  inherited;
end;

procedure TFlasher.Flash;
begin
  FlashWindow(FHandle,True);
  Sleep(500);
  FlashWindow(FHandle,False);
  Sleep(500);
  FlashWindow(FHandle,True);
  Sleep(500);
  FlashWindow(FHandle,False);
  Sleep(500);
  FlashWindow(FHandle,True);
  Sleep(500);
  FlashWindow(FHandle,False);
end;

{ TFlashThread }

procedure TFlashThread.CallFlasher;
begin
  FFlasher.Flash;
end;

constructor TFlashThread.Create(const AFlasher: IFlasher);
begin
  Assert(AFlasher<>nil,'FlashThread.Create cannot be created with a nil Flasher');
  inherited Create(False);
  FreeOnTerminate := True;
  FFlasher := AFlasher;
  Resume;
end;

procedure TFlashThread.Execute;
begin
  Sleep(8000);
  CallFlasher;
end;

end.
