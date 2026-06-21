unit uRemoteFunc_teste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormRemoteFunc_teste = class(TForm)
    ButtonStart: TButton;
    ButtonStop: TButton;
    procedure ButtonStopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonStartClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TRegistroThread = class (TThread)
    protected
      procedure ProcessMessages;
    public
      constructor Create;
      procedure Execute; override;
  end;

var
  FormRemoteFunc_teste: TFormRemoteFunc_teste;
  RegThread : TRegistroThread;

implementation

 uses  uLogs, uRemoteFunc_dm;
    
 {$R *.dfm}

procedure TFormRemoteFunc_teste.ButtonStartClick(Sender: TObject);
begin
  RegThread := TRegistroThread.Create;
  RegThread.Resume;
  ButtonStart.Enabled := false;
  ButtonStop.Enabled := true;
end;

procedure TFormRemoteFunc_teste.ButtonStopClick(Sender: TObject);
begin
  if RegThread <> nil then 
    RegThread.Resume;

  if RegThread <> nil then  
    RegThread.Terminate;

  if RegThread <> nil then
    RegThread.WaitFor;

  ButtonStart.Enabled := true;
  ButtonStop.Enabled := false;
end;

{ TRegistroThread }

constructor TRegistroThread.Create;
begin
  inherited Create(True);
  RegThread := Self;
end;

procedure TRegistroThread.Execute;
var Dummy : Integer;
begin
  dmRemoteFunc := nil;
  try
    try
      //try Start_DBConn(nil); except end;

      dmRemoteFunc := TdmRemoteFunc.Create(nil);

      while (not Terminated) do begin
        MsgWaitForMultipleObjects(0, Dummy, False, 500, QS_ALLINPUT);
        try
          ProcessMessages;
        except
        end;
      end;
    except
      on E: Exception do
        GLog.Log (self, [lcExcept], 'TRegistroThread.Execute - E.Message: ' + E.Message);
    end;
    //if DMindy<>nil then
    //  FreeAndNil(DMindy);
    if dmRemoteFunc<>nil then
      FreeAndNil(dmRemoteFunc);
  except
  end;
end;

procedure TRegistroThread.ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;  
end;

procedure TFormRemoteFunc_teste.FormCreate(Sender: TObject);
begin
    ButtonStart.Enabled := true;
    ButtonStop.Enabled := false;
end;

procedure TFormRemoteFunc_teste.FormDestroy(Sender: TObject);
begin
    GLog.CloseLogFile;
end;

end.
