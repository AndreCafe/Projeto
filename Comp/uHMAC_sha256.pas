unit uHMAC_sha256;

interface

uses
  sysutils, DCPcrypt2, DCPsha256, strUtils;

type

  TArr64 = array[0..63] of byte;
  TArr32 = array[0..31] of byte;

  tHmac_sha256 = class(TObject)
   private
    class function sha256d(s: string): TArr32;
    class function sha256(s: string): string;
    class function tohex(s: TArr32): string;
    class function toChar(s: TArr32): string;
    class function bintostr(const bin: TArr64): string;
    class procedure XorBlock(var InData1, InData2: TArr64);
    class procedure alignSecret(var arr: TArr64; const s: string);
    { Private declarations }
   public
    class function calc(secret, msg: string): string;
    { Public declarations }
  end;


implementation

class function tHmac_sha256.calc(secret, msg: string): string;
var
    o_key_pad, i_key_pad, s_pad: TArr64;
    o,i: string;
begin

    if (length(secret) > 64) then
        secret := toChar( sha256d(secret)); // keys longer than blocksize are shortened

    fillchar( s_pad, 64, 0);
    alignSecret( s_pad, secret );
    //secret := secret + DupeString( chr(0), blocksize - length(secret)); // keys shorter than blocksize are zero-padded

    fillchar( o_key_pad, 64, $5c);
    XorBlock(o_key_pad, s_pad);

    fillchar( i_key_pad, 64, $36);
    XorBlock(i_key_pad, s_pad);

    o := bintoStr(o_key_pad);
    i := bintoStr(i_key_pad);

    result :=         sha256( o + toChar( sha256d( i + msg)));

    //HMAC_SHA256("", "") = 0x b613679a0814d9ec772f95d778c35fc5ff1697c493715653c6c712144292c5ad
    //HMAC_SHA256("key", "The quick brown fox jumps over the lazy dog") = 0x f7bc83f430538424b13298e6aa6fb143ef4d59a14946175997479dbc2d1a3cd8
end;

class procedure tHmac_sha256.XorBlock(var InData1, InData2: TArr64);
var
  i: longword;
begin
  for i:= 0 to 64-1 do
    InData1[i]:= InData1[i] xor InData2[i];
end;

class function tHmac_sha256.bintostr(const bin: TArr64): string;
var
    i: integer;
begin
    for i :=  0 to 63 do
        result := result +  char(bin[i]);
end;

class procedure tHmac_sha256.alignSecret(var arr:TArr64; const s: string);
var
    i: integer;
begin
   for i := 1 to length(s) do
        arr[i-1] := ord(s[i]);
end;

class function tHmac_sha256.tohex(s: TArr32): string;
var
    i:integer;
begin
    for I := 0 to 31 do
      Result := Result + IntToHex(s[I], 2);
    Result := LowerCase(result);
end;

class function tHmac_sha256.toChar(s: TArr32): string;
var
    i:integer;
begin
    for I := 0 to 31 do
      Result := Result + char(s[I]);
end;

class function tHmac_sha256.sha256(s: string): string;
begin
    result:=tohex(sha256d(s))
end;

class function tHmac_sha256.sha256d(s: string): TArr32;
var
  H: TDCP_sha256;
begin
  H := TDCP_sha256.Create(nil);
  try
    H.Init;
    H.UpdateStr(S);
    H.Final(Result);
  finally
    H.Free;
  end;
end;


end.
