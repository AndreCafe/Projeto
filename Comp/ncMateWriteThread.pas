unit ncMateWriteThread;

interface

uses
  SysUtils, Classes, ncDebug, IdBaseComponent, IdComponent, IdTCPServer,
  IdServerIOHandler, IdSSLOpenSSL, uLogs, math, IdSocketHandle,
  SyncObjs;

type

 TMateWriteThread = class(TThread)
  private
    FMateServerThread: TObject;
  public
    mandave : boolean;
    procedure Execute; override;
    constructor Create(aMateServerThread : TObject);
    destructor Destroy; override;
 end;

implementation

{ TMateSendThread }

uses ncMateServerThread;

constructor TMateWriteThread.Create(aMateServerThread: TObject);
begin
    FMateServerThread := aMateServerThread;
    inherited Create(true);
 end;

destructor TMateWriteThread.Destroy;
begin
  inherited;
end;


procedure TMateWriteThread.Execute;
var
    sl : TStringList;
    b : Pointer;
    len : uint64;

begin
    glog.Log(self,[lcDebug], 'TMateWriteThread.Execute' );

    sl := TStringList.Create();
    sl.LoadFromFile('C:\925600.txt');

    while not terminated do begin

        len := length(sl.Text);
        Getmem(b,len);
        try
          move(sl.Text[1], b^, len);
          TMateServerThread(FMateServerThread).Write(b, len);
        finally
          freemem(b);
        end;

        sleep(0);

    end;

    glog.Log(self,[lcDebug], 'TMateWriteThread ends execution' );
 end;

end.
