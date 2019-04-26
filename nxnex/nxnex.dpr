library nxnex;

uses Windows;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

{$R *.res}

type
  TRegDataType = (rdUnknown, rdString, rdExpandString, rdInteger, rdBinary);

  TRegDataInfo = record
    RegData: TRegDataType;
    DataSize: Integer;
  end;

function DataTypeToRegData(Value: Integer): TRegDataType;
begin
  if Value = REG_SZ then Result := rdString
  else if Value = REG_EXPAND_SZ then Result := rdExpandString
  else if Value = REG_DWORD then Result := rdInteger
  else if Value = REG_BINARY then Result := rdBinary
  else Result := rdUnknown;
end;  


function MySessionID: Integer;
 // Getting the session id from the current process
type
  TProcessIdToSessionId = function(dwProcessId: DWORD; pSessionId: DWORD): BOOL; stdcall;
var
  ProcessIdToSessionId: TProcessIdToSessionId;
  Lib : THandle;
  pSessionId : DWord;
begin
  Result := 0;
  Lib := GetModuleHandle('kernel32');
  if Lib <> 0 then
  begin
    ProcessIdToSessionId := GetProcAddress(Lib, 'ProcessIdToSessionId');
    if Assigned(ProcessIdToSessionId) then
    begin
      if ProcessIdToSessionId(GetCurrentProcessId(), DWORD(@pSessionId)) then
        Result:= pSessionId;
    end;
  end;
end;

const
  TwoDigitLookup : packed array[0..99] of array[1..2] of Char =
    ('00','01','02','03','04','05','06','07','08','09',
     '10','11','12','13','14','15','16','17','18','19',
     '20','21','22','23','24','25','26','27','28','29',
     '30','31','32','33','34','35','36','37','38','39',
     '40','41','42','43','44','45','46','47','48','49',
     '50','51','52','53','54','55','56','57','58','59',
     '60','61','62','63','64','65','66','67','68','69',
     '70','71','72','73','74','75','76','77','78','79',
     '80','81','82','83','84','85','86','87','88','89',
     '90','91','92','93','94','95','96','97','98','99');

function _IntToStr32(Value: Cardinal; Negative: Boolean): string;
var
  I, J, K : Cardinal;
  Digits  : Integer;
  P       : PChar;
  NewLen  : Integer;
begin
  I := Value;
  if I >= 10000 then
    if I >= 1000000 then
      if I >= 100000000 then
        Digits := 9 + Ord(I >= 1000000000)
      else
        Digits := 7 + Ord(I >= 10000000)
    else
      Digits := 5 + Ord(I >= 100000)
  else
    if I >= 100 then
      Digits := 3 + Ord(I >= 1000)
    else
      Digits := 1 + Ord(I >= 10);
  NewLen  := Digits + Ord(Negative);
  SetLength(Result, NewLen);
  P := PChar(Result);
  P^ := '-';
  Inc(P, Ord(Negative));
  if Digits > 2 then
    repeat
      J  := I div 100;           {Dividend div 100}
      K  := J * 100;
      K  := I - K;               {Dividend mod 100}
      I  := J;                   {Next Dividend}
      Dec(Digits, 2);
      PDWord(P + Digits)^ := DWord(TwoDigitLookup[K]);
    until Digits <= 2;
  if Digits = 2 then
    PDWord(P+ Digits-2)^ := DWord(TwoDigitLookup[I])
  else
    PChar(P)^ := Char(I or ord('0'));
end;


function IntToStr(Value: Integer): string;
begin
  if Value < 0 then
    Result := _IntToStr32(-Value, True)
  else
    Result := _IntToStr32(Value, False);
end;

function GetNexDir: String;
var 
  Buf : Array[0..MAX_PATH] of CHAR;
  H : HKEY;
  Info: TRegDataInfo;
  DataType: Integer;
  S : String;
begin
  Result := '';
  if ERROR_SUCCESS = RegOpenKeyEx(HKEY_CURRENT_USER,
                                  PChar('SOFTWARE\NexCafe'),
                                  0,KEY_ALL_ACCESS, H) then 
  try                                  
    if RegQueryValueEx(H, PChar('Dir'), nil, @DataType, nil,
      @Info.DataSize) = ERROR_SUCCESS then
    begin
      Info.RegData := DataTypeToRegData(DataType);
      if RegQueryValueEx(H, PChar('Dir'), nil, @DataType, PByte(@Buf), @Info.DataSize) = ERROR_SUCCESS then begin
        Info.RegData := DataTypeToRegData(DataType);
        if (Info.RegData = rdString) or (Info.RegData = rdExpandString) then begin
          Result := Buf;
          S := '';
        end;
      end;
    end;
  finally
    RegCloseKey(H);  
  end;

  if Result='' then
    Result := 'c:\nexcafe\';
end;


function StrLen(const Str: PWideChar): Cardinal;
{$IFNDEF LEGACYSTRLEN}
begin
  Result := Length(Str);
end;
{$ELSE !LEGACYSTRLEN}
{$IFDEF X86ASM}
asm
        {Check the first byte}
        CMP WORD PTR [EAX], 0
        JE @ZeroLength
        {Get the negative of the string start in edx}
        MOV EDX, EAX
        NEG EDX
@ScanLoop:
        MOV CX, WORD PTR [EAX]
        ADD EAX, 2
        TEST CX, CX
        JNZ @ScanLoop
        LEA EAX, [EAX + EDX - 2]
        SHR EAX, 1
        RET
@ZeroLength:
        XOR EAX, EAX
end;
{$ENDIF X86ASM}
{$ENDIF !LEGACYSTRLEN}

function StrLCopy(Dest: PWideChar; const Source: PWideChar; MaxLen: Cardinal): PWideChar;
var
  Len: Cardinal;
begin
  Result := Dest;
  Len := StrLen(Source);
  if Len > MaxLen then
    Len := MaxLen;
  Move(Source^, Dest^, Len * SizeOf(WideChar));
  Dest[Len] := #0;
end;

function OEMFunction(p_wsdocname: LPWSTR; P_wsSavename: PLPWSTR): UInt; stdcall;
var 
  buf : Array[0..MAX_PATH] of char;
  s: string;
  A : TextFile;
  H : HWND;
  I : Cardinal; 
begin
  GetModuleFileName(0, @buf, sizeof(buf));

  I := GetTickCount;

  S := GetNexDir + 'print\pend\0\'+IntToStr(MySessionID)+'_'+IntToStr(I);

  AssignFile(A, S+'.ini');
  try
    Rewrite(A);
    Writeln(A, 'DocTitle='+p_wsdocname);
    Writeln(A, 'Exe='+buf);
  except
  end;
  CloseFile(A);

  S := S + '.pdf';

  StrLCopy(P_wsSaveName^, PWideChar(S), Length(S));
  Result := 0;

  H := FindWindow(PChar('FrmPrintReview_'+IntToStr(MySessionID)), nil);

  if H > 0 then
    PostMessage(H, $8000 + 5, I, 0);
end;

exports
  OEMFunction;
  
begin
end.
