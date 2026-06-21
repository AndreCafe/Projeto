unit uVersion;

interface

uses
    Classes, Types, Forms, Windows, SysUtils, IPInfo;

const
     InfoNum = 10;
     InfoStr: array[1..InfoNum] of string = ('CompanyName', 'FileDescription', 'FileVersion', 'InternalName', 'LegalCopyright', 'LegalTradeMarks', 'OriginalFileName', 'ProductName', 'ProductVersion', 'Comments');

      PROCESSOR_INTEL_386 = 386;
      PROCESSOR_INTEL_486 = 486;
      PROCESSOR_INTEL_PENTIUM = 586;
      PROCESSOR_MIPS_R4000 = 4000;
      PROCESSOR_ALPHA_21064 = 21064;

      PROCESSOR_ARCHITECTURE_INTEL = 0;
      PROCESSOR_ARCHITECTURE_MIPS = 1;
      PROCESSOR_ARCHITECTURE_ALPHA = 2;
      PROCESSOR_ARCHITECTURE_PPC  = 3;
      PROCESSOR_ARCHITECTURE_UNKNOWN = $FFFF;

      MIB_IF_TYPE_OTHER       = 1;
      MIB_IF_TYPE_ETHERNET    = 6;
      MIB_IF_TYPE_TOKENRING   = 9;
      MIB_IF_TYPE_FDDI        = 15;
      MIB_IF_TYPE_PPP         = 23;
      MIB_IF_TYPE_LOOPBACK    = 24;
      MIB_IF_TYPE_SLIP        = 28;

type
    // Major Version
    // MinorVersion
    // Release
    // Build
    TVerInfo = array[1..4] of word;

    TVersionInfoItem = record
       Name : string;
       Str  : string;
    end;
    TVersionInfoArr = array[1..InfoNum] of TVersionInfoItem;

    TProcessorInfo = class (TObject)
     private
       procedure GetProcessorInfo;
     public
       MySysInfo           :TSystemInfo;   // holds the system information

       model               : word;
       stepping            : word;
       ProcessorLevel      : word;
       ProcessorType       :string;
       Architecture        :string;
       NumberOfProcessors  :Integer;
       HasCPUID : boolean;
       CPUID    : string;
       Vendor   : string;
       function  AsString : string;
       constructor create;
    end;

    TWindowsInfo = class (TObject)
     private
       procedure GetWindowsVersion;
     public
       Version : TVerInfo;
       VersionStr : string;
       windows    : string;
       CSDVersion : string;
       IsServer   : boolean;
       PlatformId : integer;
       function  AsString : string;
       constructor create;
    end;

    TNetworkInfo = class (TObject)
     private
       procedure GetNetworkInfo;
     public
       Adaptadores : integer;
       NetAdapter1Name : string;
       NetAdapter1Description  : string;
       NetAdapter1MACNumbers   : string;
       NetAdapter1MAC          : string;
       NetAdaptersMAC          : TStringList;
       IPAssigned : boolean;
       function  AsString : string;
       constructor create;
       destructor destroy; override;
    end;

    TVersionInfo = class (TObject)
     private
      FVersinIntoExists : boolean;
      FVersionInfoArr : TVersionInfoArr;
     public
      WindowsInfo   : TWindowsInfo;
      ProcessorInfo : TProcessorInfo;
      NetWorkInfo   : TNetWorkInfo;
      FileVersion : TVerInfo;
      ProductVersion : TVerInfo;
      ExeName, ExePath : string;
      procedure add(Name,str:string);
      function  AsString : string;
      function  StringByName (s:string) : string;
      function  ProgramDisplayShortVersion : string;
      function  ProgramDisplayLongVersion : string;
      procedure LoadVersionInfo;
      function  LoadFilesInDirVersionInfo(dir,namemask:string):TStringList;
      function  VersionOfFile(fn:string):String;
      constructor create;
      destructor destroy; override;
    end;

    function  StrToVerInfo(s: string):TVerInfo;
    function  VerInfoToStrLong(vi: TVerInfo):string;
    function  VerInfoToStrShort(vi: TVerInfo):string;
    function  CompareLongVersion (s1, s2:string ) : integer;
    function  NetworkHasIPAssigned : boolean;
    function  WaitForNetworkIPAssignment(aSecs:integer) : boolean;

    var
       VersionInfo : TVersionInfo;

implementation

const
        ID_BIT  =       $200000;                        // EFLAGS ID bit
type
        TCPUID  = array[1..4] of Longint;
        TVendor = array [0..11] of char;


function IsCPUID_Available : Boolean; register;
asm
        PUSHFD                                                  {direct access to flags no possible, only via stack}
  POP     EAX                                   {flags to EAX}
  MOV     EDX,EAX                       {save current flags}
  XOR     EAX,ID_BIT    {not ID bit}
  PUSH    EAX                                   {onto stack}
  POPFD                                                         {from stack to flags, with not ID bit}
  PUSHFD                                                        {back to stack} 
  POP     EAX                                   {get back to EAX} 
  XOR     EAX,EDX                       {check if ID bit affected} 
  JZ      @exit                         {no, CPUID not availavle} 
  MOV     AL,True                       {Result=True} 
@exit: 
end; 


function GetCPUID : TCPUID; assembler; register; 
asm 
  PUSH    EBX         {Save affected register} 
  PUSH    EDI 
  MOV     EDI,EAX     {@Resukt}
  MOV     EAX,1 
  DW      $A20F       {CPUID Command} 
  STOSD                           {CPUID[1]} 
  MOV     EAX,EBX 
  STOSD               {CPUID[2]} 
  MOV     EAX,ECX 
  STOSD               {CPUID[3]} 
  MOV     EAX,EDX 
  STOSD               {CPUID[4]} 
  POP     EDI                                   {Restore registers} 
  POP     EBX 
end; 


function GetCPUVendor : TVendor; assembler; register; 
asm 
  PUSH    EBX                                   {Save affected register} 
  PUSH    EDI 
  MOV     EDI,EAX                       {@Result (TVendor)} 
  MOV     EAX,0 
  DW      $A20F                         {CPUID Command} 
  MOV     EAX,EBX 
  XCHG  EBX,ECX     {save ECX result} 
  MOV   ECX,4 
@1: 
  STOSB 
  SHR     EAX,8 
  LOOP    @1 
  MOV     EAX,EDX
  MOV   ECX,4 
@2: 
  STOSB 
  SHR     EAX,8 
  LOOP    @2 
  MOV   EAX,EBX 
  MOV   ECX,4 
@3: 
  STOSB 
  SHR     EAX,8 
  LOOP    @3 
  POP     EDI                                   {Restore registers} 
  POP     EBX 
end; 

constructor TVersionInfo.create;
var
     i : integer;
begin
     inherited;
     for i:=1 to InfoNum do
         FVersionInfoArr[i].Name := InfoStr[i];
     WindowsInfo   := TWindowsInfo.create;
     ProcessorInfo := TProcessorInfo.create;
     NetWorkInfo   := TNetWorkInfo.create;
end;

destructor TVersionInfo.destroy;
begin
     inherited;
     ProcessorInfo.Free;
     WindowsInfo.Free;
     NetWorkInfo.Free;
end;

procedure TVersionInfo.LoadVersionInfo;
var
     S: string;
     n, Len, i: DWORD;
     Buf: PChar;
     Value: PChar;
begin

  S := Application.ExeName;
  ExeName := ExtractFileName(s);
  ExePath := ExtractFilePath(s);
  n := GetFileVersionInfoSize(PChar(S), n);
  FVersinIntoExists := n > 0;
  if FVersinIntoExists then begin
    Buf := AllocMem(n);
    GetFileVersionInfo(PChar(S), 0, n, Buf);
    for i := 1 to InfoNum do
      if VerQueryValue(Buf, PChar('\StringFileInfo\041604E4\' + InfoStr[i]), Pointer(Value), Len) then
        if trim(value)<>'' then
          VersionInfo.Add(InfoStr[i],Value);
    FreeMem(Buf, n);
  end;
end;


procedure TVersionInfo.add(Name, str:string);
var
     i : integer;
begin
     for i:=1 to InfoNum do
         if comparetext(FVersionInfoArr[i].Name,Name)=0 then begin
            FVersionInfoArr[i].Str := Str;
            if name = 'FileVersion' then
               FileVersion := StrToVerInfo(Str);
            if name = 'ProductVersion' then
               ProductVersion := StrToVerInfo(Str);
            break;
         end;
end;

function  TVersionInfo.StringByName (s:string) : string;
var
     i : integer;
begin
     result := '';
     for i:=1 to InfoNum do
         if comparetext(FVersionInfoArr[i].Name,s)=0 then begin
            result := FVersionInfoArr[i].Str;
            break;
         end;
end;

function  TVersionInfo.AsString : string;
var
     i : integer;
begin
    if FVersinIntoExists then begin
       result := '';
       for i:=1 to InfoNum do
           if comparetext( FVersionInfoArr[i].Str, '' ) <>  0 then
               result := result + FVersionInfoArr[i].Name + ' = ' + FVersionInfoArr[i].Str + #13#10  ;
    end else
       result := 'Não há informações de versão disponíveis.';
end;

function  StrToVerInfo(s: string):TVerInfo;
var
     i : integer;
     v : integer;
     dws : string;
begin
     if trim(s)='' then begin
         result[1] := 0;
         result[2] := 0;
         result[3] := 0;
         result[4] := 0;
         exit;
     end;
     v := 0;
     for i:=1 to length(s) do begin
         if s[i]='.' then begin
            inc(v);
            result[v] := strtoint(dws);
            dws := '';
         end;
         if s[i] in ['0'..'9'] then
            dws := dws+s[i];
     end;
     inc(v);
     result[v] := strtoint(dws);
end;

function  VerInfoToStrLong(vi: TVerInfo):string;
begin
     // min = 0.0.0.0 = char(7)
     // max = 65535.65535.65535.65535 = char(23)
     result := IntTostr(vi[1]) + '.' +
               IntTostr(vi[2]) + '.' +
               IntTostr(vi[3]) + '.' +
               IntTostr(vi[4]);
end;

function  VerInfoToStrShort(vi: TVerInfo):string;
begin
     // min = 0.0 = char(3)
     // max = 65535.65535 = char(11)
     result := IntTostr(vi[1]) + '.' +
               IntTostr(vi[2]);
end;

function  TVersionInfo.ProgramDisplayLongVersion : string;
begin
     result := VersionInfo.StringByName('FileVersion');
end;

function  TVersionInfo.ProgramDisplayShortVersion : string;
var
     i,c : integer;
     s : string;
begin
     s := VersionInfo.StringByName('FileVersion');
     result := ''; c:=0;
     for i := 1 to length(s) do begin
         if s[i]='.' then inc(c);
         if c=2 then break;
         result := result + s[i];
     end;

end;

function  TVersionInfo.VersionOfFile(fn:string):String;
var
     n, Len: DWORD;
     Buf: PChar;
     Value: PChar;
begin
  result :='';
  n := GetFileVersionInfoSize(PChar(fn), n);
  if n > 0 then
  begin
    Buf := AllocMem(n);
    GetFileVersionInfo(PChar(fn), 0, n, Buf);
    if VerQueryValue(Buf, PChar('\StringFileInfo\041604E4\FileVersion'), Pointer(Value), Len) then
        if trim(value)<>'' then
          result := Value;
    FreeMem(Buf, n);
  end
end;

function  TVersionInfo.LoadFilesInDirVersionInfo(dir,namemask:string):TStringList;
var
   sr: TSearchRec;
begin
    result := TStringList.Create;
    if FindFirst(dir + '*.exe"', faAnyFile	, sr) = 0 then begin
      repeat
            if pos(namemask, sr.Name)=1 then begin
               result.add(sr.Name + '=' +  VersionOfFile(dir+sr.Name));
            end;
      until FindNext(sr) <> 0;
      FindClose(sr);
    end;
end;

function  CompareLongVersion (s1, s2:string ) : integer;
var
      v1, v2 :TVerInfo;
begin
     v1 := StrToVerInfo(s1);
     v2 := StrToVerInfo(s2);
     if v1[1]>v2[1] then begin
        result := 1;
        exit;
     end;
     if v1[1]<v2[1] then begin
        result := -1;
        exit;
     end;
     if v1[2]>v2[2] then begin
        result := 1;
        exit;
     end;
     if v1[2]<v2[2] then begin
        result := -1;
        exit;
     end;
     if v1[3]>v2[3] then begin
        result := 1;
        exit;
     end;
     if v1[3]<v2[3] then begin
        result := -1;
        exit;
     end;
     if v1[4]>v2[4] then begin
        result := 1;
        exit;
     end;
     if v1[4]<v2[4] then
         result := -1
     else
         result := 0;
end;

// -----------------------------------------------------------------------------

constructor TWindowsInfo.create;
begin
     inherited;

     GetWindowsVersion;
end;

function TWindowsInfo.AsString: string;
begin
     result := windows + ' ';
     if CSDVersion <> '' then
         result := result + CSDVersion + ' ';
     result := result + 'Version ' + VersionStr;
end;

procedure TWindowsInfo.GetWindowsVersion;
var
    VerInfo: TOSVersionInfo;
begin
    VerInfo.dwOSVersionInfoSize := SizeOf(VerInfo);
    GetVersionEx(VerInfo);

    case VerInfo.dwMajorVersion of
         2 : case VerInfo.dwMinorVersion of
                  0 : windows := 'Win 95';
                  10 : windows := 'Win 98';
                  90 : windows := 'Win ME';
             end;

         3 : case VerInfo.dwMinorVersion of
                  51 : windows := 'NT 3.51';
             end;
         4 : case VerInfo.dwMinorVersion of
                  0 : windows  := 'NT 4';
             end;
         5 : case VerInfo.dwMinorVersion of
                  0 : windows := 'Win 2000';
                  1 : windows := 'Win XP';
                  2 : windows := 'Win 2003';
             end;
    end;

    IsServer := false;
    case VerInfo.dwMajorVersion of
         3, 4 : IsServer := true;
         5 : case VerInfo.dwMinorVersion of
                  0, 2 : IsServer := true;
             end;
    end;

    CSDVersion := VerInfo.szCSDVersion;
    PlatformId := VerInfo.dwPlatformId;
    Version[1] := VerInfo.dwMajorVersion;
    Version[2] := VerInfo.dwMinorVersion;
    Version[3] := 0;
    Version[4] := VerInfo.dwBuildNumber;
    VersionStr := inttostr(Version[1]) + '.' + inttostr(Version[2]) + '.0.' + inttostr(Version[4]);
{
Druga okresla numer wersji:
  dla Win 95, 98 i ME jest to 4
  dla Win NT 3.x jest to 3
  dla Win NT 4 jest to 4
  dla Win 2000, XP, 2003 jest to 5
Trzecia okresla numer podwersji:
  dla Win 95 jest to 0
  dla Win 98 jest to 10
  dla Win ME jest to 90
  dla Win NT 3.51 jest to 51
  dla Win NT 4 jest to 0
  dla Win 2000 jest to 0
  dla Win XP jest to 1
  dla Win 2003 jest to 2

}
end;

// -----------------------------------------------------------------------------

constructor TProcessorInfo.create;
begin
     inherited;
     GetProcessorInfo;
end;

function TProcessorInfo.AsString: string;
begin
     result := 'Processador: ' + Vendor + #13#10;
     if HasCPUID then
         result := result + 'CPUID: '+ CPUID
     else
         result := result + 'Sem CPUID';

     result := result + #13#10 + inttostr(NumberOfProcessors) + ' ' +Architecture + #13#10 +
               'Type: ' + ProcessorType +
               ' Model: ' + inttostr(model) +
               ' Stepping: ' + inttostr(Stepping) +
               ' Level: ' + inttostr(ProcessorLevel) ;

end;

procedure TProcessorInfo.GetProcessorInfo;
var 
  _CPUID : TCPUID;
  I     : Integer; 
begin
  for I := Low(_CPUID) to High(_CPUID)  do _CPUID[I] := -1;
  HasCPUID := IsCPUID_Available;
  if HasCPUID then begin
    _CPUID:= GetCPUID;
    CPUID := IntToHex(_CPUID[1],8) + '-' +
             IntToHex(_CPUID[2],8) + '-' +
             IntToHex(_CPUID[3],8) + '-' +
             IntToHex(_CPUID[4],8);
    Vendor := GetCPUVendor;
  end else begin
    CPUID := '';
  end;

  GetSystemInfo(MySysInfo);
  case MySysInfo.wProcessorArchitecture of
    PROCESSOR_ARCHITECTURE_INTEL: begin
      Architecture := 'Intel Processor Architecture';
    end;
    PROCESSOR_ARCHITECTURE_MIPS:
      Architecture := 'MIPS Processor Architecture';
    PROCESSOR_ARCHITECTURE_ALPHA:
      Architecture := 'DEC ALPHA Processor Architecture';
    PROCESSOR_ARCHITECTURE_PPC:
      Architecture := 'PPC Processor Architecture';
    PROCESSOR_ARCHITECTURE_UNKNOWN:
      Architecture := 'Unknown Processor Architecture';
  end;
  NumberOfProcessors := MySysInfo.dwNumberOfProcessors;
  ProcessorType      := inttostr(MySysInfo.dwProcessorType);
  model              := (MySysInfo.wProcessorRevision and $FF00) shr 8;
  stepping           := MySysInfo.wProcessorRevision and $00FF;
  ProcessorLevel     := MySysInfo.wProcessorLevel

end;

// -------------------------------------- T N e t W o r k  I n f o

function  NetworkHasIPAssigned : boolean;
var
     IPnfo: TIPInfo;
     i, j : integer;
     qAdaptadores : integer;
begin
     Result := false;
     try
         IPnfo := TIPInfo.Create;
         try
             qAdaptadores := IPnfo.MaxAdapters;
             if qAdaptadores>0 then begin
                  for i:=0 to qAdaptadores-1 do begin
                      for j:=0 to IPnfo.Adapters[i].MaxIPAddresses-1 do begin
                          if IPnfo.Adapters[i].IPAddresses[j].Address<>'0.0.0.0' then begin
                             result := true;
                             exit;
                          end;
                      end;
                  end;
             end;
         finally
            IPnfo.Free;
         end;
     except
     on e:exception do
     end;
end;

// aSecs Segundos para Timeout
// result = timeout
function  WaitForNetworkIPAssignment(aSecs:integer) : boolean;
var
   fim : boolean;
   seg : integer;
begin
    seg := 0;
    result := false;
    repeat
         fim := NetworkHasIPAssigned;
         if not fim then begin
             result := seg>aSecs;
             sleep(1000);
             inc(seg);
         end;
    until fim or result;
    if fim then result := false;
end;

constructor TNetworkInfo.create;
begin
     inherited;
     NetAdaptersMAC := TStringList.create;
     GetNetworkInfo;
end;

destructor TNetworkInfo.destroy;
begin
     NetAdaptersMAC.free;
     inherited;
end;

procedure TNetworkInfo.GetNetworkInfo;
var
     IPnfo: TIPInfo;
     i, j : integer;
begin
     try
         IPnfo := TIPInfo.Create;
         NetAdaptersMAC.Clear;
         try
             Adaptadores := IPnfo.MaxAdapters;

             if Adaptadores>0 then begin
                  IPAssigned := false;
                  for i:=0 to Adaptadores-1 do begin
                      for j:=0 to IPnfo.Adapters[i].MaxIPAddresses-1 do begin
                          NetAdaptersMAC.Add(IPnfo.Adapters[i].HWAddress);
                          if IPnfo.Adapters[i].IPAddresses[j].Address <> '0.0.0.0' then begin
                              IPAssigned := true;
                              break;
                          end;
                      end;
                  end;
                  NetAdapter1Name := IPnfo.Adapters[0].Name;
                  NetAdapter1Description := IPnfo.Adapters[0].Description;
                  NetAdapter1MAC := IPnfo.Adapters[0].HWAddress;
                  NetAdapter1MACNumbers := copy(NetAdapter1MAC, 1,2) +
                                    copy(NetAdapter1MAC, 4,2) +
                                    copy(NetAdapter1MAC, 7,2) +
                                    copy(NetAdapter1MAC, 10,2) +
                                    copy(NetAdapter1MAC, 13,2) +
                                    copy(NetAdapter1MAC, 16,2) ;

             end;
         finally
            IPnfo.Free;
         end;
     except
     end;
end;

function  TNetworkInfo.AsString : string;
var
     IPnfo: TIPInfo;
     i, j : integer;
     SType : string;
begin
     try
         IPnfo := TIPInfo.Create;
         try
             Result := 'Adaptadores : ' + inttostr(Adaptadores) + #13#10;
             if Adaptadores>0 then begin
                  for i:=0 to Adaptadores-1 do begin

                      Result := Result + 'Adaptador '+inttostr(i+1) + ': ' +
                                         IPnfo.Adapters[i].Name + #13#10;

                      case IPnfo.Adapters[i].AType of
                          MIB_IF_TYPE_OTHER       : SType := 'OTHER';
                          MIB_IF_TYPE_ETHERNET    : SType := 'ETHERNET';
                          MIB_IF_TYPE_TOKENRING   : SType := 'TOKENRING';
                          MIB_IF_TYPE_FDDI        : SType := 'FDDI';
                          MIB_IF_TYPE_PPP         : SType := 'PPP';
                          MIB_IF_TYPE_LOOPBACK    : SType := 'LOOPBACK';
                          MIB_IF_TYPE_SLIP        : SType := 'SLIP';
                      end;

                      Result := Result + 'Tipo: '+SType + #13#10;

                      if trim(IPnfo.Adapters[i].Description) <> '' then
                         Result := Result + 'Descrição: ' + IPnfo.Adapters[i].Description + #13#10;
                      Result := Result + 'Endereço MAC: '+IPnfo.Adapters[i].HWAddress + #13#10;

                      for j:=0 to IPnfo.Adapters[i].MaxIPAddresses-1 do begin

                          Result := Result + '  Endereço IP ' + inttostr(j+1) + ': ' +
                             IPnfo.Adapters[i].IPAddresses[j].Address + #13#10;
                          Result := Result + '   Máscara IP ' + inttostr(j+1) + ': ' +
                             IPnfo.Adapters[i].IPAddresses[j].Netmask + #13#10;

                      end;
                      if IPnfo.Adapters[i].DHCPServer.Address <> '' then
                         Result := Result + 'DHCPServer: '+ IPnfo.Adapters[i].DHCPServer.Address + #13#10;
                      if IPnfo.Adapters[i].HaveWINS then begin
                         Result := Result + 'PrimaryWINSServer: '+ IPnfo.Adapters[i].PrimaryWINSServer.Address + #13#10;
                         Result := Result + 'SecondaryWINSServer: '+ IPnfo.Adapters[i].SecondaryWINSServer.Address + #13#10;
                      end;

                  end;
             end;
         finally
            IPnfo.Free;
         end;
     except
         Result := 'Não há adaptadores de rede presentes.';
     end;
end;

initialization
      VersionInfo := TVersionInfo.create;

finalization
      VersionInfo.free;

end.
