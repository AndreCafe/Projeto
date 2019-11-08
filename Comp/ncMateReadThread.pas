unit ncMateReadThread;

interface

uses
  SysUtils, Classes, ncDebug, IdBaseComponent, IdComponent, IdTCPServer,
  IdServerIOHandler, IdSSLOpenSSL, uLogs, math, IdSocketHandle,
  SyncObjs;

type

 TReadEvent = procedure (Sender: TObject; var p: Pointer; len: uint64) of object;

 TMateReadThread = class(TThread)
  private
    fp : Pointer;
    flen : uint64;
    FOnRead: TReadEvent;
    FMateServerThread: TObject;
    procedure doOnRead(Sender: TObject; var p: Pointer; len: uint64);
    procedure SyncOnRead;
  public
    property OnRead: TReadEvent read FOnRead write FOnRead;
    procedure Execute; override;
    constructor Create(aMateServerThread : TObject);
    destructor Destroy; override;
 end;

implementation

{ TMateReadThread }

uses ncMateServerThread;

constructor TMateReadThread.Create(aMateServerThread: TObject);
begin
    FMateServerThread := aMateServerThread;
    inherited Create(true);
 end;

destructor TMateReadThread.Destroy;
begin
  inherited;
end;

procedure TMateReadThread.SyncOnRead;
begin
   if assigned(FOnRead) then begin
       doOnRead(self, fp, flen);
   end;
end;


procedure TMateReadThread.doOnRead(Sender: TObject; var p: Pointer; len: uint64);
begin
   if assigned(FOnRead) then
       FOnRead(self, p, len);
end;

procedure TMateReadThread.Execute;
var
    s : string;
      p : Pointer;
//    len : uint64;
begin

   glog.Log(self,[lcDebug], 'TMateReadThread.Execute');

   while not terminated do begin
       try

          flen := TMateServerThread(FMateServerThread).Read(p);
          fp := p;
          //try
               glog.Log(self,[lcDebug], inttostr(flen));

               SetLength(s, flen);
               move(p^, s[1], flen);

               Synchronize(SyncOnRead);

               glog.Log(self,[lcDebug], 'lidos '+inttostr(flen));
//          finally
//               freemem(b);
//          end;

          sleep(0);

       except
         on e:Exception do begin
                glog.Log(self,[lcExcept], 'TMateReadThreadExecute ' + e.Message);
                raise e;
         end;

       end;
   end;
end;


end.
