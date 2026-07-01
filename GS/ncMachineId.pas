unit ncMachineId;

{===============================================================================
  Identificador de maquina para o CodEquip (x216+), compativel com Windows XP / D7.

  GetMacFingerprint: concatena os MAC(s) de adaptadores com endereco de 6 bytes
    (ordenados, sem duplicados; ignora loopback/sem-MAC e MAC zerado). Unico por
    maquina, estavel, SOBREVIVE A CLONAGEM de disco (a placa e diferente em cada
    PC fisico). Retorna '' se nao houver MAC utilizavel.

  GetPersistedMachineGuid: GUID gerado uma vez e persistido no registro.
    Ultimo recurso para NUNCA retornar vazio (maquina sem placa/serial).

  Usado por uLicEXECryptor.GetSerialHD na geracao do CodEquip.
===============================================================================}

interface

function GetMacFingerprint: String;
function GetPersistedMachineGuid: String;

implementation

uses Windows, SysUtils, Classes, Registry, ncDebug;

const
  MAX_ADAPTER_NAME_LENGTH         = 256;
  MAX_ADAPTER_DESCRIPTION_LENGTH  = 128;
  MAX_ADAPTER_ADDRESS_LENGTH      = 8;

type
  PIP_ADDR_STRING = ^IP_ADDR_STRING;
  IP_ADDR_STRING = packed record
    Next: PIP_ADDR_STRING;
    IpAddress: array[0..15] of AnsiChar;
    IpMask: array[0..15] of AnsiChar;
    Context: DWORD;
  end;

  PIP_ADAPTER_INFO = ^IP_ADAPTER_INFO;
  IP_ADAPTER_INFO = packed record
    Next: PIP_ADAPTER_INFO;
    ComboIndex: DWORD;
    AdapterName: array[0..MAX_ADAPTER_NAME_LENGTH + 3] of AnsiChar;
    Description: array[0..MAX_ADAPTER_DESCRIPTION_LENGTH + 3] of AnsiChar;
    AddressLength: UINT;
    Address: array[0..MAX_ADAPTER_ADDRESS_LENGTH - 1] of Byte;
    Index: DWORD;
    Type_: UINT;
    DhcpEnabled: UINT;
    CurrentIpAddress: PIP_ADDR_STRING;
    IpAddressList: IP_ADDR_STRING;
    GatewayList: IP_ADDR_STRING;
    DhcpServer: IP_ADDR_STRING;
    HaveWins: BOOL;
    PrimaryWinsServer: IP_ADDR_STRING;
    SecondaryWinsServer: IP_ADDR_STRING;
    LeaseObtained: LongInt;
    LeaseExpires: LongInt;
  end;

function GetAdaptersInfo(pAdapterInfo: PIP_ADAPTER_INFO;
  var pOutBufLen: DWORD): DWORD; stdcall;
  external 'iphlpapi.dll' name 'GetAdaptersInfo'; // do not localize

function MacToHex(const Addr: array of Byte; Len: Integer): String;
var
  i: Integer;
begin
  Result := '';
  if Len <> 6 then Exit;
  for i := 0 to Len - 1 do
    Result := Result + IntToHex(Addr[i], 2);
end;

// True se o MAC parece de adaptador VIRTUAL (VMware/VBox/Hyper-V) ou
// "locally-administered" (VPN/TAP/randomizado). Esses vao e vem -> instaveis.
function IsVirtualMac(const Addr: array of Byte): Boolean;
begin
  Result := True;
  // bit "locally administered" (2o bit do 1o byte) -> tipicamente virtual/VPN
  if (Addr[0] and $02) <> 0 then Exit;
  // OUIs conhecidas de virtualizacao
  if (Addr[0]=$00) and (Addr[1]=$05) and (Addr[2]=$69) then Exit; // VMware
  if (Addr[0]=$00) and (Addr[1]=$0C) and (Addr[2]=$29) then Exit; // VMware
  if (Addr[0]=$00) and (Addr[1]=$1C) and (Addr[2]=$14) then Exit; // VMware
  if (Addr[0]=$00) and (Addr[1]=$50) and (Addr[2]=$56) then Exit; // VMware
  if (Addr[0]=$08) and (Addr[1]=$00) and (Addr[2]=$27) then Exit; // VirtualBox
  if (Addr[0]=$00) and (Addr[1]=$15) and (Addr[2]=$5D) then Exit; // Hyper-V
  if (Addr[0]=$00) and (Addr[1]=$03) and (Addr[2]=$FF) then Exit; // MS virtual
  Result := False;
end;

function GetMacFingerprint: String;
var
  Buf, Adapter: PIP_ADAPTER_INFO;
  Len, ret: DWORD;
  phys, todos: TStringList;
  mac: String;
begin
  Result := '';
  phys := TStringList.Create;
  todos := TStringList.Create;
  try
    phys.Sorted := True;  phys.Duplicates := dupIgnore;
    todos.Sorted := True; todos.Duplicates := dupIgnore;
    try
      Len := 0;
      // 1a chamada (buffer nil): descobre o tamanho necessario.
      GetAdaptersInfo(nil, Len);
      if Len = 0 then
      begin
        DebugMsg('ncMachineId.GetMacFingerprint - GetAdaptersInfo len=0'); // do not localize
        Exit;
      end;
      GetMem(Buf, Len);
      try
        ret := GetAdaptersInfo(Buf, Len);
        if ret <> 0 then
        begin // ERROR_SUCCESS = 0
          DebugMsg('ncMachineId.GetMacFingerprint - GetAdaptersInfo erro=' + IntToStr(ret)); // do not localize
          Exit;
        end;
        Adapter := Buf;
        while Adapter <> nil do
        begin
          if Adapter^.AddressLength = 6 then
          begin
            mac := MacToHex(Adapter^.Address, Adapter^.AddressLength);
            if (mac <> '') and (mac <> '000000000000') then
            begin
              todos.Add(mac);
              if not IsVirtualMac(Adapter^.Address) then
                phys.Add(mac);
            end;
          end;
          Adapter := Adapter^.Next;
        end;
      finally
        FreeMem(Buf);
      end;
    except
      on E: Exception do
        DebugMsg('ncMachineId.GetMacFingerprint - excecao: ' + E.Message); // do not localize
    end;

    // Usa SO o menor MAC fisico (estavel). Se nao houver fisico, o menor de todos.
    if phys.Count > 0 then
      Result := phys[0]
    else if todos.Count > 0 then
      Result := todos[0];

    DebugMsg('ncMachineId.GetMacFingerprint - fisicos=' + IntToStr(phys.Count) +
      ' todos=' + IntToStr(todos.Count) + ' -> ' + Result); // do not localize
  finally
    phys.Free;
    todos.Free;
  end;
end;

function NewGuidStr: String;
var
  g: TGUID;
  i: Integer;
begin
  Result := '';
  if CreateGUID(g) <> 0 then Exit;
  Result := IntToHex(g.D1, 8) + IntToHex(g.D2, 4) + IntToHex(g.D3, 4);
  for i := 0 to 7 do
    Result := Result + IntToHex(g.D4[i], 2);
end;

function ReadOrCreateGuid(RootKey: HKEY): String;
const
  REG_PATH = 'Software\NexCafe'; // do not localize
  REG_VAL  = 'MID';              // do not localize
var
  Reg: TRegistry;
begin
  Result := '';
  Reg := TRegistry.Create(KEY_READ or KEY_WRITE);
  try
    Reg.RootKey := RootKey;
    try
      if Reg.OpenKey(REG_PATH, True) then
      begin
        if Reg.ValueExists(REG_VAL) then
          Result := Reg.ReadString(REG_VAL);
        if Result = '' then
        begin
          Result := NewGuidStr;
          if Result <> '' then
            Reg.WriteString(REG_VAL, Result);
        end;
        Reg.CloseKey;
      end;
    except
      Result := '';
    end;
  finally
    Reg.Free;
  end;
end;

function GetPersistedMachineGuid: String;
begin
  // HKLM (por maquina); se nao tiver permissao, HKCU.
  Result := ReadOrCreateGuid(HKEY_LOCAL_MACHINE);
  if Result = '' then
    Result := ReadOrCreateGuid(HKEY_CURRENT_USER);
end;

end.
