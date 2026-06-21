unit IPHelperDef;

interface

uses windows;

Const
  iphlpapilib = 'iphlpapi.dll';

  MAX_HOSTNAME_LEN               = 128; { from IPTYPES.H }
  MAX_DOMAIN_NAME_LEN            = 128;
  MAX_SCOPE_ID_LEN               = 256;
  MAX_ADAPTER_NAME_LENGTH        = 256;
  MAX_ADAPTER_DESCRIPTION_LENGTH = 128;
  MAX_ADAPTER_ADDRESS_LENGTH     = 8;

  IF_TYPE_ETHERNET_CSMACD        = 6;



Type
  TIPAddressString = Array[0..4*4-1] of Char;
  PIPAddrString = ^TIPAddrString;
  TIPAddrString = Record
    Next      : PIPAddrString;
    IPAddress : TIPAddressString;
    IPMask    : TIPAddressString;
    Context   : Integer;
  End;

  PFixedInfo = ^TFixedInfo;
  TFixedInfo = Record { FIXED_INFO }
    HostName         : Array[0..MAX_HOSTNAME_LEN+3] of Char;
    DomainName       : Array[0..MAX_DOMAIN_NAME_LEN+3] of Char;
    CurrentDNSServer : PIPAddrString;
    DNSServerList    : TIPAddrString;
    NodeType         : Integer;
    ScopeId          : Array[0..MAX_SCOPE_ID_LEN+3] of Char;
    EnableRouting    : Integer;
    EnableProxy      : Integer;
    EnableDNS        : Integer;
  End;

 PIPAdapterInfo = ^TIPAdapterInfo;
 TIPAdapterInfo = Record { IP_ADAPTER_INFO }
    Next                : PIPAdapterInfo;
    ComboIndex          : Integer;
    AdapterName         : Array[0..MAX_ADAPTER_NAME_LENGTH+3] of Char;
    Description         : Array[0..MAX_ADAPTER_DESCRIPTION_LENGTH+3] of Char;
    AddressLength       : Integer;
    Address             : Array[1..MAX_ADAPTER_ADDRESS_LENGTH] of Byte;
    Index               : Integer;
    _Type               : Integer;
    DHCPEnabled         : Integer;
    CurrentIPAddress    : PIPAddrString;
    IPAddressList       : TIPAddrString;
    GatewayList         : TIPAddrString;
    DHCPServer          : TIPAddrString;
    HaveWINS            : LongBool;
    PrimaryWINSServer   : TIPAddrString;
    SecondaryWINSServer : TIPAddrString;
    LeaseObtained       : Integer;
    LeaseExpires        : Integer;
  End;


Function GetNetworkParams(FI : PFixedInfo; Var BufLen : Integer) : Integer;
         StdCall; External 'iphlpapi.dll' Name 'GetNetworkParams';

Function GetAdaptersInfo(AI : PIPAdapterInfo; Var BufLen : Integer)
: Integer;
         StdCall; External 'iphlpapi.dll' Name 'GetAdaptersInfo';

function NotifyAddrChange(var Handle: THandle; overlapped: POVERLAPPED): DWORD; stdcall;
{$EXTERNALSYM NotifyAddrChange}

function NotifyRouteChange(var Handle: THandle; overlapped: POVERLAPPED): DWORD; stdcall;
{$EXTERNALSYM NotifyRouteChange}


implementation

{$IFDEF DYNAMIC_LINK}
var
  _NotifyAddrChange: Pointer;

function NotifyAddrChange;
begin
  GetProcedureAddress(_NotifyAddrChange, iphlpapilib, 'NotifyAddrChange');
  asm
    mov esp, ebp
    pop ebp
    jmp [_NotifyAddrChange]
  end;
end;
{$ELSE}
function NotifyAddrChange; external iphlpapilib name 'NotifyAddrChange';
{$ENDIF DYNAMIC_LINK}

{$IFDEF DYNAMIC_LINK}
var
  _NotifyRouteChange: Pointer;

function NotifyRouteChange;
begin
  GetProcedureAddress(_NotifyRouteChange, iphlpapilib, 'NotifyRouteChange');
  asm
    mov esp, ebp
    pop ebp
    jmp [_NotifyRouteChange]
  end;
end;
{$ELSE}
function NotifyRouteChange; external iphlpapilib name 'NotifyRouteChange';
{$ENDIF DYNAMIC_LINK}


end.
 