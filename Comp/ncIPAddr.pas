unit ncIPAddr;
{Object to retrieve local IP addresses}

{Note:
  - Each thread is permited to have a single HostEnt structure. Therefore
    we need to copy the info we need.
}


interface

uses
  WinSock,
  Classes, SysUtils;


type

  pPInAddr = ^PInAddr;
  TIPAddress = String[35];
  pTIPAddress = ^TIPAddress;

  TLocalIPObj = class(TObject)
  private
    IPList : TList;

    {property vars}
    fHostName : String;
    fIsIpAddresses : Boolean;

    function GetIPCount : Integer;

  public

    constructor Create;
    destructor Destroy; override;

    function GetLocalIPAddress : String;
    function GetIPFromList(ThisIPIndex:Integer) : String;

    property IPCount : Integer read GetIpCount;
    property HostName : String read fHostName;
    property HaveIP : Boolean read fIsIPAddresses;

  end;

implementation

constructor TLocalIPObj.Create;
var
  pIPAddress : pTIPAddress;
  aHostName : TIPAddress;
  apHostENT : PHostEnt;
  Ptr : pPInAddr;


{ struct hostent {
    char FAR * h_name;
    char FAR * FAR * h_aliases;
    short h_addrtype;
    short h_length;
    char FAR * FAR * h_addr_list;
}
begin
  inherited;
  IPList:= TList.Create;
  fHostName:= '';
  fIsIPAddresses:= false;

  {Retrieve the local IP addresses for this machine}
  aHostName:= ' ' +#0; {20 blanks and one #0}
  if (GetHostName(@aHostName[1], 20) = 0) then
  begin
    fHostName:= StrPas(@aHostName[1]);
    apHostEnt:= GetHostByName(@aHostName[1]);

    if (apHostEnt <> nil) then
    begin
      Ptr:= Pointer(apHostEnt^.h_addr_list);
      while (Ptr <> nil) and (Ptr^ <> nil) do
      begin
        {}
        new(pIPAddress);
        pIPAddress^:= StrPas(inet_ntoa(Ptr^^));
        IPList.Add(pIPAddress);
        inc(Ptr);
      end; {while}
      fIsIPAddresses:= true;
    end
    else
      fIsIPAddresses:= false;
  end;


// Pchar(inet_ntoa(pinaddr(apHostEnt^.h_addr_list^)^));

  // IntToStr(ORd(Pchar(apHostEnt^.h_addr^)[0]))+'.'+
  // IntToStr(ORd(Pchar(apHostEnt^.h_addr^)[1]))+'.'+
  // IntToStr(ORd(Pchar(apHostEnt^.h_addr^)[2]))+'.'+
  // IntToStr(ORd(Pchar(apHostEnt^.h_addr^)[3]));
end; {Create}


destructor TLocalIPObj.Destroy;
begin
  while (IPList.Count > 0) do
  begin
    Dispose(pTIPAddress(IPList[0]));
    IPList.Delete(0);
  end; {while}
  IPList.Free;
  inherited;
end; {Destroy}


{ ***** Property rtns ***** }
function TLocalIPObj.GetIPCount : Integer;
begin
  result:= IPList.Count;
end; {Get IP Count}



{ ***** Other Rtns ***** }
function TLocalIPObj.GetLocalIPAddress : String;
{Get the first IP address from the list}
begin
  result:= GetIPFromList(0);
end; {Get Local IP Address}


function TLocalIPObj.GetIPFromList(ThisIPIndex:Integer) : String;
{Get the IP address from the list at index ThisIPIndex}
begin
  if (ThisIPIndex < IPList.Count) then
    result:= pTIPAddress(IPList[ThisIPIndex])^
  else
    result:= '000.000.000.000';
end; {Get IP From List}


end.unit Unit1;

interface

implementation

end.
