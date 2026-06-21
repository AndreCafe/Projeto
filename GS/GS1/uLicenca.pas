unit uLicenca;

interface

uses
  SyncObjs,
  Classes,
  Windows,
  Sysutils;

type

  TLicenca = object
  private
    function GetString: String;
    procedure SetString(const Value: String);

    function GetVersaoMax: String;
    procedure SetVersaoMax(const Value: String);
    function GetStringSemHD: String;
    procedure SetStringSemHD(const Value: String);
    
  public
    liTipo       : Byte;
    liMaquinas   : Integer;
    liVencimento : TDateTime;
    liSenha      : String[8];
    liSerialHD   : String[60];
    liCodLoja    : Integer;
    
    procedure LeSerialHD;
    procedure AtualizaSenha;
    procedure SalvaArquivo(NomeArq: String);
    procedure SalvaArquivoPadrao;
    procedure LeArquivo(NomeArq: String);
    procedure LeArquivoPadrao;
    procedure Limpa;
    
    function SenhaCorreta: String;
    function SenhaOk: Boolean;

    function EmModoDemo: Boolean;
    function Expirou: Boolean;
    function Maquinas: Integer;
    function CodLojaAsString: String;

    function TipoStr: String;

    property VersaoMax: String
      read GetVersaoMax write SetVersaoMax;

    property AsStringSemHD: String
      read GetStringSemHD write SetStringSemHD;

    property AsString: String
      read GetString write SetString;
  end; 

  function CodLojaToStr(I: Integer): String;
  function StrToCodLoja(S: String): Integer;
  function LimpaTraco(S: String): String;
  function ObtemProxy(var aProxyIP: String; var aProxyPort: Integer): Boolean;
  function pathlic: String;

const
  // Tipo da Licença
  tlTemporaria = 1;
  tlDefinitiva = 2;
  tlTeste      = 3;
  
  LicArq     = 'lic.txt';
  LicAntigo1 = 'cmservidor.ini';
  LicAntigo2 = 'cybermanager.lic';

var   
  LicencaGlobal: TLicenca;
  controlx: Boolean;

implementation

uses 
  uScsi, IdeSN, md5, Registry;

function pathlic: String;
begin
  if ControlX then
    Result := 'C:\'
  else
    Result := ExtractFilePath(ParamStr(0));  
end;  

function ObtemProxy(var aProxyIP: String; var aProxyPort: Integer): Boolean;
var 
  R: TRegistry;
  S: String;
begin
  try
    Result := False;
    R := TRegistry.Create;
    R.RootKey := HKEY_CURRENT_USER;
    R.Access := KEY_READ;
    if R.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Internet Settings', False) then begin
      Result := (R.ReadInteger('ProxyEnable')=1);
      aProxyIP := R.ReadString('ProxyServer');
      aProxyPort := StrToIntDef(Copy(aProxyIP, Pos(':', aProxyIP)+1, 5), 8080);
      Delete(aProxyIP, Pos(':', aProxyIP), 10);
      R.CloseKey;
    end;
  except
    Result := False;
  end;
  R.Free;
end;
  
function ZeroPad(St: String; Len: Integer): String;
begin
  Result := St;
  while Length(Result)<Len do Result := '0'+Result;
end;

function NumStr(I, Tam: Integer): String;
begin
  Result := ZeroPad(IntToStr(I), Tam);
end;

function LimpaTraco(S: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(S) do 
  if S[I] <> '-' then 
    Result := Result + S[I];
end;

function Inverte(S: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    Result := S[I] + Result;
end;

function CodLojaToStr(I: Integer): String;
begin
  Result := NumStr(I, 4);
  Result := Copy(GetMD5Str(Result + 'cyber'), 1 , 4) + '-' + Result;
end;

function StrToCodLoja(S: String): Integer;
begin
  Result := StrToIntDef(Copy(LimpaTraco(S), 5, 4), 0);
  if (Result<>0) and (CodLojaToStr(Result)<>S) then
    Result := 0;
end;

function VolumeSerial(DriveChar: Char): string;
var
  OldErrorMode: Integer;
  Serial, NotUsed, VolFlags: DWORD;
  Buf: array [0..MAX_PATH] of Char;
begin
  OldErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);
  try
    Buf[0] := #$00;
    if GetVolumeInformation(PChar(DriveChar + ':\'), nil, 0, @Serial,
      NotUsed, VolFlags, nil, 0) then
      Result := IntToHex(Integer(Serial), 0)
    else Result := '';
  finally
    SetErrorMode(OldErrorMode);
  end;
end;

function DataBaseLic: TDateTime;
begin
  Result := EncodeDate(2003, 1, 1);
end;

function DateToDateLic(D: TDateTime): String;
begin
  if D<=DataBaseLic then
    Result := '0000'
  else
    Result := NumStr(Trunc(D-DataBaseLic), 4);  
end;

function TLicenca.GetString: String;
begin
  Result := Copy(IntToStr(liTipo), 1, 1) + 
            NumStr(liMaquinas, 3) + '-' +
            DateToDateLic(liVencimento) + '-' +
            ZeroPad(Copy(liSenha, 1, 4), 4) + '-' +
            ZeroPad(Copy(liSenha, 5, 4), 4) + '-' +
            ZeroPad(IntToStr(liCodLoja), 4) + '-' +
            liSerialHD;    
end;

procedure TLicenca.SetString(const Value: String);
var S: String;
begin
  S := LimpaTraco(Value);
  liTipo       := StrToIntDef(Copy(S, 1, 1), tlTeste);
  liMaquinas   := StrToIntDef(Copy(S, 2, 3), 0);
  liVencimento := StrToIntDef(Copy(S, 5, 4), 0);
  if liVencimento>0 then liVencimento := liVencimento + DataBaseLic;
  liSenha      := Copy(S, 9, 8);
  liCodLoja    := StrToIntDef(Copy(S, 17, 4), 0);
  liSerialHD   := Trim(Copy(S, 21, 60));
end;

function TLicenca.GetStringSemHD: String;
begin
  Result := GetString;
end;

procedure TLicenca.SetStringSemHD(const Value: String);
var S: String;
begin
  S := LimpaTraco(Value);
  liTipo       := StrToIntDef(Copy(S, 1, 1), tlTeste);
  liMaquinas   := StrToIntDef(Copy(S, 2, 3), 0);
  liVencimento := StrToIntDef(Copy(S, 5, 4), 0);
  if liVencimento>0 then liVencimento := liVencimento + DataBaseLic;
  liSenha      := Copy(S, 9, 8);
end;

function TLicenca.SenhaCorreta: String;
begin
  Result := LimpaTraco(AsString);
  Result := Copy(Result, 1, 8) + Copy(Result, 17, 64);
  Result := Copy(IntToStr(Trunc(Abs(StrToInt('$'+Copy(GetMD5Str(Result+'_cybermanager__'), 1, 8))))), 1, 8);
end;

function TLicenca.SenhaOk: Boolean;
var S: String;
begin
  S := SenhaCorreta;
  Result := (liSerialHD>'') and (liCodLoja>0) and (liSenha>'') and (S=liSenha);
end;

procedure TLicenca.SalvaArquivo(NomeArq: String);
var SL: TStrings;
begin
  SL := TStringList.Create;
  try
    SL.Values['Licenca'] := AsString;
    SL.SaveToFile(NomeArq);
  except
  end;  
  SL.Free;
end;

procedure TLicenca.SalvaArquivoPadrao;
begin
  SalvaArquivo(pathlic+LicArq);
end;

procedure TLicenca.LeArquivo(NomeArq: String);
var SL: TStrings;
begin
  Limpa;
  SL := TStringList.Create;
  try
    SL.LoadFromFile(NomeArq);
  except
  end;  
  if SL.Values['Licenca']>'' then
    AsString := SL.Values['Licenca']
  else begin  
    liVencimento := StrToIntDef(SL.Values['Data'], 0);
    if Trunc(liVencimento)=0 then
      liTipo := tlDefinitiva
    else
      liTipo := tlTemporaria;  
    liSenha      := SL.Values['Chave'];
    liMaquinas   := StrToIntDef(SL.Values['NumMaq'], 0);
  end;
  SL.Free;
end;

procedure TLicenca.Limpa;
begin
  liTipo := tlTeste;
  liSenha := '';
  liMaquinas := 2;
  liVencimento := 0;
  liCodLoja := 0;
  LeSerialHD;
end;

procedure TLicenca.LeArquivoPadrao;
begin
  if FileExists(PathLic+LicArq) then
    LeArquivo(PathLic+LicArq)
  else 
  if FileExists(pathlic+LicAntigo1) then
  begin
    LeArquivo(pathlic+LicAntigo1);
    SalvaArquivoPadrao;
  end else
  if FileExists(pathlic+LicAntigo2) then
  begin
    LeArquivo(pathlic+LicAntigo2);
    SalvaArquivoPadrao;
  end;  
end;

procedure TLicenca.LeSerialHD;
begin
  liSerialHD := GetIdeSN;
  if liSerialHD='' then
    liSerialHD := GetSCSISerial(pathlic[1]);
  if liSerialHD='' then
    liSerialHD := VolumeSerial(pathlic[1]);
end;

procedure TLicenca.AtualizaSenha;
begin
  liSenha := LimpaTraco(SenhaCorreta);
end;

function TLicenca.EmModoDemo: Boolean;
begin
  Result := (not SenhaOk) or Expirou;
end;

function TLicenca.Expirou: Boolean;
begin
  Result := SenhaOk and ((liTipo<>tlDefinitiva) and (Date>liVencimento));
end;

function TLicenca.Maquinas: Integer;
begin
  if EmModoDemo or Expirou then
    Result := 2
  else
    Result := liMaquinas;
end;

function TLicenca.GetVersaoMax: String;
begin
  Result := DateToDateLic(liVencimento);
end;

procedure TLicenca.SetVersaoMax(const Value: String);
begin
  liVencimento := StrToIntDef(Value, 0) + DataBaseLic;
end;

function TLicenca.CodLojaAsString: String;
begin
  Result := CodLojaToStr(liCodLoja);
end;

function TLicenca.TipoStr: String;
begin
  case liTipo of
    tlTemporaria : Result := 'Temporária';
    tlDefinitiva : Result := 'Definitiva';
  else  
    Result := 'Teste Gratuito';
  end;
end;

initialization
  controlx := SameText(ExtractFileName(ParamStr(0)), 'cxreg.exe');

end.




 
