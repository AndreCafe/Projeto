unit ncMateServerThread;

interface

uses
  SysUtils, Classes, ncDebug, IdBaseComponent, IdComponent, IdTCPServer,
  uLogs, math, uJson, ncMateWriteThread, ncMateReadThread;  

const
    cmdUndef   = 0;
  	cmdByte32  = 1;
	cmdByte64  = 2;
	cmdDisconn = 255;

type
   TReadEvent = procedure (Sender: TObject; var p: Pointer; len: uint64) of object;

   EncMateBadCmd = class(Exception)
      constructor Create(cmd: byte);
   end;

   EncMateClosedBeyPeer = class(Exception)
      constructor Create();
   end;

   TMateServerThread = class(TIdPeerThread)
    private
      fp : Pointer;
      flen : uint64;
      FOnRead: TReadEvent;
      FMateWriteThread : TMateWriteThread;
      FMateReadThread : TMateReadThread;
      function readLen32: uint64;
      function readLen64: uint64;
      function readCmd: byte;
      function readChanNum: byte;
      procedure writeLen32(len: uint64);
      procedure writeLen64(len: uint64);
      procedure writeCmd(cmd: byte);
      procedure writeChanNun(chanNum: byte);
    protected
      procedure AfterRun; override;
      procedure BeforeRun; override;
      procedure Cleanup; override;
      procedure Run; override;
      procedure MateReadThreadOnRead(Sender: TObject; var p: Pointer; len: uint64);
      procedure SyncOnRead;
    public
      property OnRead: TReadEvent read FOnRead write FOnRead;

      procedure Execute; override;
      //procedure WriteString64(s:string);
      procedure Write(var b: Pointer; len: uint64);
      function  Read(var pb: Pointer): uint64;
      procedure Disconnect;
      constructor Create(CreateSuspended: Boolean); override;
      destructor Destroy; override;
   end;

implementation

{ TMateServerThread }

procedure TMateServerThread.AfterRun;
begin
    inherited;
    FMateReadThread.Terminate;
    FMateReadThread.WaitFor;
    FMateWriteThread.Terminate;
    FMateWriteThread.WaitFor;
    glog.Log(self,[lcDebug], 'TMateServerThread AfterRun' );
end;

procedure TMateServerThread.BeforeRun;
begin
    inherited;
    FMateReadThread.resume;
    FMateWriteThread.resume;
    glog.Log(self,[lcDebug], 'TMateServerThread BeforeRun' );
end;

procedure TMateServerThread.Cleanup;
begin
  inherited;
  glog.Log(self,[lcDebug], 'TMateServerThread Cleanup' );
end;

procedure TMateServerThread.Run;
begin
    glog.Log(self,[lcDebug], 'TMateServerThread Run a' );
    inherited;
    glog.Log(self,[lcDebug], 'TMateServerThread Run b' );

end;

procedure TMateServerThread.Execute;
begin
    glog.Log(self,[lcDebug], 'TMateServerThread Execute a' );
    inherited;
    glog.Log(self,[lcDebug], 'TMateServerThread Execute b' );
end;

procedure TMateServerThread.SyncOnRead;
begin
   if assigned(FOnRead) then begin
       FOnRead(self, fp, flen);
   end;
end;


procedure TMateServerThread.MateReadThreadOnRead(Sender: TObject;
  var p: Pointer; len: uint64);
begin
    fp := p;
    flen := len;
    Synchronize(SyncOnRead);
end;

constructor TMateServerThread.Create(CreateSuspended: Boolean);
begin
    inherited create(CreateSuspended);
    FMateWriteThread := TMateWriteThread.Create(Self);
    FMateReadThread := TMateReadThread.Create(Self);

    FMateReadThread.OnRead := MateReadThreadOnRead;
end;

destructor TMateServerThread.Destroy;
begin
    glog.Log(self,[lcDebug], 'TMateServerThread Destroy a' );
    FMateReadThread.Free;
    FMateWriteThread.Free;
    glog.Log(self,[lcDebug], 'TMateServerThread Destroy b' );

    inherited;
end;

procedure TMateServerThread.Disconnect;
var
    cmd : byte;
begin
     cmd := cmdDisconn;
     connection.WriteBuffer(cmd,1);
     connection.Disconnect;
     glog.Log(self,[lcDebug], 'Disconnected');
end;


function TMateServerThread.Read(var pb: Pointer): uint64;
var
   cmd, chanNum : byte;
   len64, received, lenBlock : UInt64;
   bb: TByteArray;
begin
   result := 0;  received:=0;
   cmd := readCmd;
   chanNum := readChanNum;
   case cmd  of
        cmdByte32 : begin
                result := readLen32;
                GetMem(pb, result);
                fillchar(bb, $7FFF, 0);
                connection.readbuffer(bb, result);
                move(bb, pb^, result);
                glog.Log(self,[lcDebug], 'Read32 chan('+inttostr(chanNum)+') '+inttostr(result));
            end;
       cmdByte64 : begin
                len64 := readLen64;
                result := len64;
                GetMem(pb, len64);

                while received < len64 do begin
                    chanNum := readChanNum;
                    lenBlock := $7FFF;
                    if (len64 - received) < $7FFF then
                        lenBlock := len64 - received;
                    fillchar(bb, $7FFF, 0);
                    connection.readbuffer(bb,lenBlock);
                        glog.Log(self,[lcDebug], 'read block chan('+inttostr(chanNum)+') '+ inttostr(lenBlock));

                    received := received + lenBlock;

                    move(bb, pb^, lenBlock);
                    inc(PByte(pb), lenBlock);

                    sleep(0);
               end;
                dec(PByte(pb), len64);
                glog.Log(self,[lcDebug], 'Read64 chan('+inttostr(chanNum)+') '+inttostr(received));
             end;
   end;
   //glog.Log(self,[lcDebug], 'b '+pchar(pb));

end;

function TMateServerThread.readChanNum: byte;
begin
    connection.ReadBuffer(result,1);
end;

function TMateServerThread.readCmd: byte;
begin
    connection.ReadBuffer(result,1);

    case result  of
        cmdByte32, cmdByte64: ;
        cmdDisconn : begin
          raise EncMateClosedBeyPeer.Create;
        end;
        else begin
          raise EncMateBadCmd.Create(result);
        end;
    end;
    glog.Log(self,[lcDebug], 'readCmd ' + inttostr(result));

end;

function TMateServerThread.readLen32: uint64;
var
  b32 : array[0..3] of byte;
  s : string;
begin
     connection.ReadBuffer(b32, 4);
     result := b32[0] + b32[1] * $100 +
            b32[2] * $10000 + b32[3] * $1000000 ;
     FmtStr (s, '%u', [result]);
     glog.Log(self,[lcDebug], 'readLen32 ' + s);

end;

function TMateServerThread.readLen64: uint64;
var
  b64 : array[0..7] of byte;
  s : string;
begin
     connection.ReadBuffer(b64, 8);
     result := b64[0] + b64[1] * $100 +
            b64[2] * $10000 + b64[3] * $1000000 +
            b64[4] * $100000000  + b64[5] * $10000000000 +
            b64[6] * $1000000000000  + b64[7] * $100000000000000;

     FmtStr (s, '%u', [result]);
     glog.Log(self,[lcDebug], 'readLen64 ' + s);

end;


// -----------------------------------------------------------------------------

procedure TMateServerThread.writeChanNun(chanNum: byte);
begin
     connection.WriteBuffer(chanNum,1);
end;

procedure TMateServerThread.writeCmd(cmd: byte);
begin
     connection.WriteBuffer(cmd,1);
end;

procedure TMateServerThread.writeLen32(len: uint64);
var
     b32 : array[0..3] of byte;
begin
     b32[0] := len and $FF;
     b32[1] := (len shr 8) and $FF;
     b32[2] := (len shr 16) and $FF;
     b32[3] := (len shr 24) and $FF;

     connection.WriteBuffer(b32, 4, true);
     glog.Log(self,[lcDebug], 'writeLen32: '+inttostr(len ));
end;

procedure TMateServerThread.writeLen64(len: uint64);
var
     b64 : array[0..7] of byte;
begin
     b64[0] := len and $FF;
     b64[1] := (len shr 8) and $FF;
     b64[2] := (len shr 16) and $FF;
     b64[3] := (len shr 24) and $FF;
     b64[4] := (len shr 32) and $FF;
     b64[5] := (len shr 40) and $FF;
     b64[6] := (len shr 48) and $FF;
     b64[7] := (len shr 56) and $FF;

     connection.WriteBuffer(b64, 8, true);
     glog.Log(self,[lcDebug], 'writeLen64: '+inttostr(len ));
end;


procedure TMateServerThread.Write(var b: Pointer; len: uint64);
var
    sent, buflen: uint64;
    ba : TByteArray;
    chanNum: byte;
 begin

    chanNum := 1;

    if len<$8000 then begin
    
        writeCmd(cmdByte32);
        writeChanNun(chanNum);
        writeLen32(len);
        connection.WriteBuffer(b^,len, true);
        glog.Log(self,[lcDebug], 'Write32 chan('+inttostr(chanNum)+') '+inttostr(len));

    end else begin

        writeCmd(cmdByte64);
        writeChanNun(chanNum);
        writeLen64(len);

        sent := uint64(0);
        try
            while sent < len do begin
                writeChanNun(chanNum);
                buflen := (len - sent);
                if buflen > $7FFF then begin
                    buflen := $7FFF;
                end;

                fillchar(ba, buflen, 0);
                move(b^, ba, buflen);
                connection.WriteBuffer( ba, buflen, true);
                glog.Log(self,[lcDebug], 'write block chan('+inttostr(chanNum)+') '+inttostr(buflen));
                inc(PByte(b), buflen);
                sent := sent + buflen;

                sleep(0);
            end;
            dec(PByte(b), len);

            glog.Log(self,[lcDebug], 'Write64 chan('+inttostr(chanNum)+') '+inttostr(sent));
        except
            on e:exception do
                 glog.Log(self,[lcExcept], 'Write64  chan('+inttostr(chanNum)+') error: '+inttostr(sent)+'/'+inttostr(len));
        end;
    end;

end;

//procedure TMateServerThread.WriteString64(s: string);
//begin
//     writeCmd(cmdByte64);
//     writeLen64(length(s));
//     connection.Write(s);
//end;

{ EmateBadCmd }

// -----------------------------------------------------------------------------

constructor EncMateBadCmd.Create(cmd: byte);
begin
   inherited Create('ncMate Bad commend cmd='+inttostr(cmd)+' '+ char(cmd))

end;

constructor EncMateClosedBeyPeer.Create;
begin
   inherited Create('Closed by peer cmd=255')

end;

end.
