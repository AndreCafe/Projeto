unit ncMateServerThread;

interface

uses
  SysUtils, Classes, ncDebug, IdBaseComponent, IdComponent, IdTCPServer,
  uLogs, math, uJson, ncMateWriteThread, ncMateReadThread;  

const
    cmdUndef   = 0;
  	cmdByte32  = 1;
	cmdByte64  = 2;
	cmdBlock  = 244;
	cmdDisconn = 255;

	stepInit     = byte(0);
	stepInblock  = byte(1);
	stepFinished = byte(2);


type
  TReadEvent = procedure (Sender: TObject; var p: Pointer; len: uint64) of object;

  TReadTask = class(TObject)
    cmd, chanNum, step : byte;
    len, received, lenBlock : UInt64;
    bb: PByte;
    pResult: Pointer;
  end;

  TReadTaskList = class(TList)
   protected
    function  Get(Index: Integer): TReadTask;
    procedure Put(Index: Integer; Item: TReadTask);
   public
    procedure Clear; override;
    property Items[Index: Integer]: TReadTask read Get write Put; default;
    procedure DeleteTask(rt: TReadTask);
    function NewTask(chanNum: byte): TReadTask;
    function ByChanNum(chanNum: byte): TReadTask;
    destructor Destroy; override;
   end;

   EncMateBadCmd = class(Exception)
      constructor Create(cmd: byte);
   end;

   EncMateChanNotFound = class(Exception)
      constructor Create;
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
      FReadTaskList: TReadTaskList;
      function readLen32: uint64;
      function readLen64: uint64;
      function readCmd: byte;
      function readChanNum: byte;
      procedure writeLen32(len: uint64);
      procedure writeLen64(len: uint64);
      procedure writeCmd(cmd: byte);
      procedure writeChanNun(chanNum: byte);
      function readBlock(len: uint64; p: Pointer): TReadTask;
    protected
      procedure AfterRun; override;
      procedure BeforeRun; override;
      procedure Cleanup; override;
      procedure Run; override;
      procedure MateReadThreadOnRead(Sender: TObject; var p: Pointer; len: uint64);
      procedure doOnRead(Sender: TObject; var p: Pointer; len: uint64);
      procedure SyncOnRead;
    public
      property OnRead: TReadEvent read FOnRead write FOnRead;

      procedure Execute; override;
      //procedure WriteString64(s:string);
      procedure Write(var b: Pointer; len: uint64);
      procedure Read;
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

procedure TMateServerThread.doOnRead(Sender: TObject; var p: Pointer;
  len: uint64);
begin
    fp := p;
    flen := len;
    Synchronize(SyncOnRead);
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
    FReadTaskList:= TReadTaskList.create;
    //FMateReadThread.OnRead := MateReadThreadOnRead;
end;

destructor TMateServerThread.Destroy;
begin
    glog.Log(self,[lcDebug], 'TMateServerThread Destroy a' );
    FMateReadThread.Free;
    FMateWriteThread.Free;
    FReadTaskList.Free;
    glog.Log(self,[lcDebug], 'TMateServerThread Destroy b' );

    inherited;
end;

procedure TMateServerThread.Disconnect;
var
    cmd : byte;
begin
     cmd := cmdDisconn;
     Connection.WriteBuffer(cmd,1);
     Connection.Disconnect;
     glog.Log(self,[lcDebug], 'Disconnected');
end;



function TMateServerThread.readBlock(len: uint64; p: Pointer): TReadTask;
var
    chanNum, cmd: byte;
    buff : array[0..$7FFF] of byte;
begin
        cmd := readCmd;
        if cmd<>cmdBlock then
            raise EncMateBadCmd.Create(cmd);

        chanNum := readChanNum;
        result := FReadTaskList.ByChanNum(chanNum);
        if result=nil then exit;
        
        if len>0 then begin
            result.len := len;
            result.pResult := p;
        end;

        result.lenBlock := $7FFF;
        if (result.len - result.received) < $7FFF then
            result.lenBlock := result.len - result.received;

        //GetMem(result.bb, result.lenBlock);
        //fillchar(result.bb, $7FFF, 0);
        Connection.readbuffer(buff,result.lenBlock);
        glog.Log(self,[lcDebug], 'read block chan('+inttostr(result.chanNum)+') '+ inttostr(result.lenBlock));

        result.received := result.received + result.lenBlock;

end;

procedure TMateServerThread.Read;
var
   cmd, chanNum : byte;
   rt : TReadTask;
   len : uint64;
   pResult: Pointer;
begin

   repeat

      cmd := readCmd;
      chanNum := readChanNum;
      rt := FReadTaskList.ByChanNum(chanNum);
      if rt = nil then
          rt := FReadTaskList.NewTask(chanNum);
      rt.cmd := cmd;
      
      case  rt.cmd of
        cmdByte32:  begin

                  rt.len:= readLen32;
                  GetMem(rt.pResult, rt.len);
                  fillchar(rt.bb, $7FFF, 0);
                  Connection.readbuffer(rt.bb, rt.len);
                  move(rt.bb, rt.pResult^, rt.len);
                  glog.Log(self,[lcDebug], 'Read32 chan('+inttostr(chanNum)+') '+inttostr(rt.len));

                  rt.step := stepFinished;
                  doOnRead(self, rt.pResult, rt.len);
        end;

        cmdByte64: begin

                  len := readLen64;
                  GetMem(pResult, len);

                  rt := readBlock(len, pResult);
                  if rt=nil then
                      raise EncMateChanNotFound.Create;

                  if rt.received < rt.len then begin

                      move(rt.bb, rt.pResult^, rt.lenBlock);
                      inc(PByte(rt.pResult), rt.lenBlock);
                      freemem(rt.bb)

                  end else begin

                      rt.step := stepFinished;
                      doOnRead(self, rt.pResult, rt.len);

                      FReadTaskList.DeleteTask(rt);
                      //rt := nil;
                  end;

         end;

         cmdBlock:  begin

                      rt := readBlock(0, nil);
                      move(rt.bb, rt.pResult^, rt.lenBlock);
                      inc(PByte(rt.pResult), rt.lenBlock);
                      freemem(rt.bb)

         end;


       end;

 
   until FReadTaskList.Count = 0;

//       cmdByte64 : begin
//                len := readLen64;
//                GetMem(pb, len);
//
//                while received < len do begin
//                    chanNum := readChanNum;
//                    rt := FReadTaskList.ByChanNum(chanNum, cmd, len, pb);
//                    lenBlock := $7FFF;
//                    if (len - received) < $7FFF then
//                        lenBlock := len - received;
//                    fillchar(rt.bb, $7FFF, 0);
//                    Connection.readbuffer(rt.bb,lenBlock);
//                    glog.Log(self,[lcDebug], 'read block chan('+inttostr(chanNum)+') '+ inttostr(lenBlock));
//
//                    received := received + lenBlock;
//
//                    move(rt.bb, pb^, lenBlock);
//                    inc(PByte(pb), lenBlock);
//
//                    sleep(0);
//                end;
//                dec(PByte(pb), len);
//                glog.Log(self,[lcDebug], 'Read64 chan('+inttostr(chanNum)+') '+inttostr(received));
//             end;
//   end;
//
//   case cmd  of
//        cmdByte32 : begin
//                len := readLen32;
//                chanNum := readChanNum;
//                rt := FReadTaskList.ByChanNum(chanNum, cmd, len, PByte(pb));
//                GetMem(pb, len);
//                fillchar(rt.bb, $7FFF, 0);
//                Connection.readbuffer(rt.bb, len);
//                move(rt.bb, pb^, len);
//                glog.Log(self,[lcDebug], 'Read32 chan('+inttostr(chanNum)+') '+inttostr(len));
//            end;
//       cmdByte64 : begin
//                len := readLen64;
//                GetMem(pb, len);
//
//                while received < len do begin
//                    chanNum := readChanNum;
//                    rt := FReadTaskList.ByChanNum(chanNum, cmd, len, pb);
//                    lenBlock := $7FFF;
//                    if (len - received) < $7FFF then
//                        lenBlock := len - received;
//                    fillchar(rt.bb, $7FFF, 0);
//                    Connection.readbuffer(rt.bb,lenBlock);
//                    glog.Log(self,[lcDebug], 'read block chan('+inttostr(chanNum)+') '+ inttostr(lenBlock));
//
//                    received := received + lenBlock;
//
//                    move(rt.bb, pb^, lenBlock);
//                    inc(PByte(pb), lenBlock);
//
//                    sleep(0);
//                end;
//                dec(PByte(pb), len);
//                glog.Log(self,[lcDebug], 'Read64 chan('+inttostr(chanNum)+') '+inttostr(received));
//             end;
//   end;
//   //glog.Log(self,[lcDebug], 'b '+pchar(pb));

end;

function TMateServerThread.readChanNum: byte;
begin
    Connection.ReadBuffer(result,1);
end;

function TMateServerThread.readCmd: byte;
begin
    Connection.ReadBuffer(result,1);

    case result  of
        cmdByte32, cmdByte64, cmdBlock: ;
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
     Connection.ReadBuffer(b32, 4);
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
     Connection.ReadBuffer(b64, 8);
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
     Connection.WriteBuffer(chanNum,1);
end;

procedure TMateServerThread.writeCmd(cmd: byte);
begin
     Connection.WriteBuffer(cmd,1);
end;

procedure TMateServerThread.writeLen32(len: uint64);
var
     b32 : array[0..3] of byte;
begin
     b32[0] := len and $FF;
     b32[1] := (len shr 8) and $FF;
     b32[2] := (len shr 16) and $FF;
     b32[3] := (len shr 24) and $FF;

     Connection.WriteBuffer(b32, 4, true);
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

     Connection.WriteBuffer(b64, 8, true);
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
        Connection.WriteBuffer(b^,len, true);
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
                Connection.WriteBuffer( ba, buflen, true);
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
//     Connection.Write(s);
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

{ EncMateChanNotFound }

constructor EncMateChanNotFound.Create;
begin
   inherited Create('Channel not found')
end;


{ TReadTaskList }

procedure TReadTaskList.DeleteTask(rt: TReadTask);
var
    i : integer;
begin
     for i:=0 to count-1 do
        if rt = items[i] then begin
            Delete(i);
            break;
       end;
end;

destructor TReadTaskList.Destroy;
begin
  Clear;
  inherited;
end;

function TReadTaskList.Get(Index: Integer): TReadTask;
begin
    result := TReadTask( inherited Get(Index));
end;

function TReadTaskList.NewTask(chanNum: byte): TReadTask;
begin
    result := TReadTask.Create;
    result.chanNum := chanNum;
    result.step := stepInit;

    Add(result)
end;

procedure TReadTaskList.Put(Index: Integer; Item: TReadTask);
begin
   inherited Put(Index, Item);
end;

function TReadTaskList.ByChanNum(chanNum: byte):TReadTask;
var
    i : integer;
begin
    result := nil;
    for i:=0 to count-1 do
        if chanNum = items[i].chanNum then begin
            result := items[i];
            break;
       end;
end;

procedure TReadTaskList.Clear;
var
    i : integer;
begin
    for i:=count-1 downto 0 do begin
        TReadTask(items[i]).Free;
        delete(i);
    end;
end;


end.
