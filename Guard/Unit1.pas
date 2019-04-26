unit Unit1;

interface

Uses Windows, WinSpool, Printers;



Function PrinterSupportsPostscript: Boolean;

procedure SendRawPostscript( const Data: string );


implementation


{: Check if the currently selected printer supports postscript.
  Only applicable on Win2K/XP! }
Function PrinterSupportsPostscript: Boolean;
  Const
    POSTSCRIPT_PASSTHROUGH = 4115;
    POSTSCRIPT_IDENTIFY    = 4117;


    Escapes: Array [0..2] of Cardinal =
      ( POSTSCRIPT_DATA, POSTSCRIPT_IDENTIFY, POSTSCRIPT_PASSTHROUGH );
  Var
    res: Integer;
    i: Integer;
  Begin
    Result := false;
    For i:= Low( Escapes ) to High( Escapes ) Do Begin
      res := ExtEscape( printer.Handle,
                        QUERYESCSUPPORT,
                        sizeof(Escapes[0]),
                        @Escapes[i], 0, nil );
      If res <> 0 Then Begin
        Result := true;
        Break;
      End;  
    End;
  End;



procedure SendRawPostscript( const Data: string );
type
  TBufferRec = packed record
    Len: Word;
    Characters: array [0..0] of Char;
  end;
  PBufferRec = ^TBufferRec;
var
  pBuf: PBufferRec;
begin
  if Data <> '' then begin
    Assert( Length(Data) <= High(Word));
    GetMem(pBuf, Length(Data)+Sizeof(Word));
    try
      pBuf^.Len := Length(Data);
      Move(Data[1], pBuf^.Characters, Length(Data));
      ExtEscape( Printer.Handle,
        POSTSCRIPT_PASSTHROUGH,
        Length(Data)+Sizeof(Word),
        PChar(pBuf),
        0, nil );
    finally
      FreeMem(pBuf);
    end;
  end;
end;

end.
