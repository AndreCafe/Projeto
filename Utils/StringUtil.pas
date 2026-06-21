unit StringUtil;

interface

uses
  SysUtils;

  function CustomPad(St: String; Len: Word; Ch: Char; Left: Boolean): String;
  function LeftPad(St: String; Len: Word): String;
  function Pad(St: String; Len: Word): String;
  function LeftPadCh(St: String; Len: Word; Ch: Char): String;
  function PadCh(St: String; Len: Word; Ch: Char): String;
  function IntLeftPad(I: Integer; Len: Word): String;
  function IntPad(I: Integer; Len: Word): String;
  function IntLeftPadCh(I: Integer; Len: Word; Ch: Char): String;
  function IntPadCh(I: Integer; Len: Word; Ch: Char): String;
  function IntZero(I: Integer; Len: Word): String;
  function ByteFlagIsSet(Flag: Byte; Mask: Byte): Boolean;
  
implementation

function ByteFlagIsSet(Flag: Byte; Mask: Byte): Boolean;
begin
  Result := ((Flag and Mask) = Mask);
end;

function CustomPad(St: String; Len: Word; Ch: Char; Left: Boolean): String;
begin
  Result := St;
  if Left then begin
    while Length(Result)<Len do Result := Ch + Result;
  end else begin
    while Length(Result)<Len do Result := Result + Ch;
  end;
end;

function LeftPad(St: String; Len: Word): String;
begin
  Result := CustomPad(St, Len, ' ', True);
end;

function Pad(St: String; Len: Word): String;
begin
  Result := CustomPad(St, Len, ' ', False);
end;

function LeftPadCh(St: String; Len: Word; Ch: Char): String;
begin
  Result := CustomPad(St, Len, Ch, True);
end;

function PadCh(St: String; Len: Word; Ch: Char): String;
begin
  Result := CustomPad(St, Len, Ch, False);
end;

function IntLeftPad(I: Integer; Len: Word): String;
begin
  Result := CustomPad(IntToStr(I), Len, ' ', True);
end;

function IntPad(I: Integer; Len: Word): String;
begin
  Result := CustomPad(IntToStr(I), Len, ' ', False);
end;

function IntLeftPadCh(I: Integer; Len: Word; Ch: Char): String;
begin
  Result := CustomPad(IntToStr(I), Len, Ch, True);
end;

function IntPadCh(I: Integer; Len: Word; Ch: Char): String;
begin
  Result := CustomPad(IntToStr(I), Len, Ch, False);
end;

function IntZero(I: Integer; Len: Word): String;
begin
  Result := CustomPad(IntToStr(I), Len, '0', True);
end;


end.


