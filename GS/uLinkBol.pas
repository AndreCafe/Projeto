unit uLinkBol;

interface

uses sysutils, md5;

function Md5Boleto(aNumBol: String): String;

function LinkBoleto(aID: Integer; aCodBar: Boolean; aIncluirServ: Boolean): String;

implementation

function Md5Boleto(aNumBol: String): String;
begin
  Result := GetMD5Str(LowerCase('nexcafé'+aNumBol+'validaçãonexcafeboleto'));
end;

function LinkBoleto(aID: Integer; aCodBar: Boolean; aIncluirServ: Boolean): String;
const
  codbarch : Array[Boolean] of Char = ('0', '1');
begin
  Result := 'boleto?num='+IntToStr(aID)+'&chave='+MD5Boleto(IntToStr(aID))+'&codbar='+codbarch[aCodBar];
  if aIncluirServ then
    Result := 'http://contas.nextar.com.br/' + result;
end;

end.
