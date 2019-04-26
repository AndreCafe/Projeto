unit uFileBlockStream;

interface

uses classes, sysutils, forms;


type
    TBufferEvent = procedure (Sender: TObject; var Buffer; Count: Longint; isLast:boolean) of Object;

    TFileBlockStream = class (TFileStream)
     private
        RSobraAnterior: Integer;
        WSobraAnterior: Integer;
        RBuffer: PChar;
        WBuffer: PChar;
        FMaxSize  : Longint;
        FReadBlockSize : Longint;
        FWriteBlockSize : Longint;
        FInternalWBlockSize : Longint;
        FInternalRBlockSize : Longint;
        FOnWriteBuffer : TBufferEvent;
        FOnReadBuffer : TBufferEvent;
        procedure setReadBlockSize(value:Longint);
        procedure setWriteBlockSize(value:Longint);
        procedure SetInternalRBuffer(newBufferSize:Longint);
        procedure SetInternalWBuffer(newBufferSize:Longint);
        procedure InternalRead(const Buffer; Count: Longint);
        procedure InternalWrite(const Buffer; Count: Longint);
     public
        property ReadBlockSize  :Longint read FReadBlockSize write setReadBlockSize;
        property WriteBlockSize :Longint read FWriteBlockSize write setWriteBlockSize;
        property OnReadBuffer  :TBufferEvent read FOnReadBuffer  write FOnReadBuffer;
        property OnWriteBuffer :TBufferEvent read FOnWriteBuffer write FOnWriteBuffer;
        property MaxSize :Longint read FMaxSize write FMaxSize;

        procedure ProcessarRestante;
        function Read(var Buffer; Count: Longint): Longint; override;
        function Write(const Buffer; Count: Longint): Longint; override;
        destructor Destroy; override;
    end;



implementation

destructor TFileBlockStream.Destroy;
begin
    ProcessarRestante;
    FreeMem(RBuffer, FInternalRBlockSize);
    FreeMem(WBuffer, FInternalWBlockSize);
    inherited;
end;

procedure TFileBlockStream.SetInternalWBuffer(newBufferSize:Longint);
begin
    if FInternalWBlockSize <> newBufferSize then begin
        FInternalWBlockSize := newBufferSize;
        ReallocMem(WBuffer, FInternalWBlockSize);
    end;
end;

procedure TFileBlockStream.SetInternalRBuffer(newBufferSize:Longint);
begin
    if FInternalRBlockSize <> newBufferSize then begin
        FInternalRBlockSize := newBufferSize;
        ReallocMem(RBuffer, FInternalRBlockSize);
    end;
end;

procedure TFileBlockStream.setWriteBlockSize(value:Longint);
var
    sobra : Longint;
    tBuffer: PChar;
begin
    if value<>FWriteBlockSize then begin
        FWriteBlockSize := value;
        if WSobraAnterior > value then begin
            sobra := WSobraAnterior;
            WSobraAnterior := 0;
            getmem(tBuffer, sobra);
            try
               Move( WBuffer^, tBuffer^, Sobra);
               InternalWrite (tBuffer^, sobra);
            finally
               freemem(tBuffer, sobra);
            end;
        end;
    end;
end;

procedure TFileBlockStream.setReadBlockSize(value:Longint);
var
    sobra : Longint;
    tBuffer: PChar;
begin
    if value<>FReadBlockSize then begin
        FReadBlockSize := value;
        if RSobraAnterior > value then begin
            sobra := RSobraAnterior;
            RSobraAnterior := 0;
            getmem(tBuffer, sobra);
            try
               Move( RBuffer^, tBuffer^, Sobra);
               InternalRead (tBuffer^, sobra);
            finally
               freemem(tBuffer, sobra);
            end;
        end;
    end;
end;

function TFileBlockStream.Read(var Buffer; Count: Longint): Longint;
begin
    Result := inherited Read( Buffer, Count);
    if FReadBlockSize=0 then setReadBlockSize(FWriteBlockSize);
    InternalRead (Buffer, Count);
end;

function TFileBlockStream.Write(const Buffer; Count: Longint): Longint;
begin
    Result := inherited Write( Buffer, Count);
    InternalWrite (Buffer, Count);
end;

procedure TFileBlockStream.InternalRead(const Buffer; Count: Longint);
var
    TotalPraGravar : Longint;
    Sobra          : Longint;
    gravados       : Longint;
begin
    gravados := 0;
    if Count > 0 then begin
        repeat
            if RSobraAnterior + Count > FReadBlockSize then begin
               if RSobraAnterior > FReadBlockSize then begin
                   TotalPraGravar := FReadBlockSize;
                   Sobra  := RSobraAnterior - FReadBlockSize;
                   RSobraAnterior := FReadBlockSize;
               end else begin
                   TotalPraGravar := FReadBlockSize - RSobraAnterior;
                   Sobra  := RSobraAnterior + Count - FReadBlockSize;
               end;
            end else begin
               TotalPraGravar := Count;
               Sobra          := RSobraAnterior + Count;
            end;

            if RSobraAnterior+TotalPraGravar > FInternalRBlockSize then SetInternalRBuffer(RSobraAnterior+TotalPraGravar);
            Move(Buffer, (RBuffer + RSobraAnterior)^, TotalPraGravar);
            gravados := gravados + TotalPraGravar;

            if Count + RSobraAnterior = FReadBlockSize then begin
                if Assigned(FOnReadBuffer) then begin
                    FOnReadBuffer (Self, RBuffer^, FReadBlockSize, false );
                    RSobraAnterior := 0;
                    Sobra := 0;
                end;
            end else
            if TotalPraGravar + RSobraAnterior >= FReadBlockSize then begin
                if Assigned(FOnReadBuffer) then begin
                    FOnReadBuffer (Self, RBuffer^, FReadBlockSize, false);
                    if (Sobra>0) then begin
                        if gravados+sobra > FInternalRBlockSize then SetInternalRBuffer(gravados+sobra);
                        Move( (Pchar(@Buffer) + gravados)^, RBuffer^, Sobra);
                    end;
                    RSobraAnterior := 0;
                end;
            end else
                Sobra := TotalPraGravar;

            RSobraAnterior := RSobraAnterior + Sobra;

            Count := Count - FReadBlockSize;
            application.ProcessMessages;
        until sobra <= FReadBlockSize;
    end;
end;

procedure TFileBlockStream.InternalWrite(const Buffer; Count: Longint);
var
    TotalPraGravar : Longint;
    Sobra          : Longint;
    gravados       : Longint;
    isLast         : boolean;
begin

    //glog.log(self, ldNone, lctrace, 'InternalWrite a ' + inttostr(FWriteBlockSize)+ ' s' + inttostr(Size)+ ' Count' + inttostr(Count) + ' p' + inttostr(position)+ ' ms' + inttostr(MaxSize));
    gravados := 0;
    if Count > 0 then begin
        repeat
            isLast := (Size=MaxSize) and (WSobraAnterior=0);

            if WSobraAnterior + Count > FWriteBlockSize then begin
               if WSobraAnterior > FWriteBlockSize then begin
                   TotalPraGravar := FWriteBlockSize;
                   Sobra  := WSobraAnterior - FWriteBlockSize;
                   WSobraAnterior := FWriteBlockSize;
                   //glog.log(self, ldNone, lctrace, 'InternalWrite b '+inttostr(Sobra)+ ' ' + inttostr(WSobraAnterior));
               end else begin
                   TotalPraGravar := FWriteBlockSize - WSobraAnterior;
                   Sobra  := WSobraAnterior + Count - FWriteBlockSize;
                   //glog.log(self, ldNone, lctrace, 'InternalWrite c '+inttostr(Sobra)+ ' ' + inttostr(WSobraAnterior));
               end;
            end else begin
               TotalPraGravar := Count;
               Sobra          := WSobraAnterior + Count;
               //glog.log(self, ldNone, lctrace, 'InternalWrite d '+inttostr(Sobra)+ ' ' + inttostr(WSobraAnterior));
            end;

            if WSobraAnterior+TotalPraGravar > FInternalWBlockSize then SetInternalWBuffer(WSobraAnterior+TotalPraGravar);
            Move(Buffer, (WBuffer + WSobraAnterior)^, TotalPraGravar);
            gravados := gravados + TotalPraGravar;

            if Count + WSobraAnterior = FWriteBlockSize then begin
                if Assigned(FOnWriteBuffer) then begin
                    //glog.log(self, ldNone, lctrace, 'InternalWrite ba');
                    FOnWriteBuffer (Self, WBuffer^, FWriteBlockSize, isLast );
                    WSobraAnterior := 0;
                    Sobra := 0;
                end;
            end else
            if TotalPraGravar + WSobraAnterior >= FWriteBlockSize then begin
                if Assigned(FOnWriteBuffer) then begin
                    //glog.log(self, ldNone, lctrace, 'InternalWrite bb '+ inttostr(gravados)+ ' '+ inttostr(Sobra)+ ' ' +inttostr(TotalPraGravar)+ ' ' + inttostr(WSobraAnterior));
                    FOnWriteBuffer (Self, WBuffer^, FWriteBlockSize, isLast);
                    if (Sobra>0)  then begin
                        if gravados + sobra > FInternalWBlockSize then SetInternalWBuffer(gravados+sobra);
                        Move( (Pchar(@Buffer) + gravados)^, WBuffer^, Sobra);
                    end;
                    WSobraAnterior := 0;
                end;
            end else
                Sobra := TotalPraGravar;

            WSobraAnterior := WSobraAnterior + Sobra;

            Count := Count - FWriteBlockSize;
            application.ProcessMessages;
            //glog.log(self, ldNone, lctrace, 'InternalWrite bc '+ inttostr(sobra)+ ' '+ inttostr(FWriteBlockSize));
        until (sobra <= FWriteBlockSize);
    end;
end;

procedure TFileBlockStream.ProcessarRestante;
begin
    if WSobraAnterior > 0 then begin
       //glog.log(self, ldNone, lctrace, 'InternalWrite ca '+ inttostr(WSobraAnterior));
       if Assigned(FOnWriteBuffer) then
            FOnWriteBuffer (Self, WBuffer^, WSobraAnterior, true );
       WSobraAnterior := 0;
    end;
    if RSobraAnterior > 0 then begin
       //glog.log(self, ldNone, lctrace, 'InternalWrite cb '+ inttostr(RSobraAnterior));;
       if Assigned(FOnReadBuffer) then
           FOnReadBuffer (Self, RBuffer^, RSobraAnterior, true );
       RSobraAnterior := 0;
    end;
end;


end.
