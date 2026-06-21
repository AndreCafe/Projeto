unit uLicEXECryptor;

interface

uses
  SyncObjs,
  Classes,
  Windows,
  EXECryptor,
  Sysutils;

type

  TTipoChave = (tcTemporaria, tcDefinitiva, tcTeste, tcLocacao);

  TChaveLiberacao = class
  private
    FString  : String;
    function GetVencimento: TDateTime;
  public
    constructor Create;

    function ChaveValida(const aCodLoja: Integer; 
                         const aCodigoEquip: String; 
                         var aTipo: TTipoChave): Integer; 
      // Resultado: 0 = serial invalido, caso contrário igual numero de máquinas licenciadas

    function Venceu: Boolean;
    
    property AsString: String
      read FString write FString;

    property Vencimento: TDateTime
      read GetVencimento; 
      
  end;

  TRegistro = class
  private
    FChaves : TList;
    FLoja   : Integer;
    function GetChaveByIndex(N: Integer): TChaveLiberacao;
    function GetCodLojaAsString: String;
    procedure SetCodLojaAsString(const Value: String);
    function GetStringChaves: String;
    procedure SetStringChaves(const Value: String);
  protected
    procedure Clear;
  public
    constructor Create;
    destructor Destroy; override;  

    procedure LeArq(const aNomeArq: String; const aCreate: Boolean = True);
    procedure SalvaArq(const aNomeArq: String);
    procedure LeArqPadrao;
    procedure SalvaArqPadrao;

    property CodLoja: Integer
      read FLoja write FLoja;

    property CodLojaAsString: String 
      read GetCodLojaAsString write SetCodLojaAsString;  

    function NumChaves: Integer;

    function SerialHD: String;
    function CodigoEquip: String;

    function RemoveChave(const StrChave: String):  Boolean;
    
    procedure AddChave(const StrChave: String);

    property Chaves[N: Integer]: TChaveLiberacao
      read GetChaveByIndex;

    function LicencasValidas(aSomarVencidas: Boolean): Integer;

    property StringChaves: String
      read GetStringChaves write SetStringChaves;
    
  end;

  function ObtemProxy(var aProxyIP: String; var aProxyPort: Integer): Boolean;
  function CodLojaOK(S: String): Boolean;

  function DateToDateLic(D: TDateTime): String;
  function DateLicToDate(D: String): TDateTime;
  
           

const
  // Tipo da Licença
  ectcTemporaria = 0;
  ectcDefinitiva = 2;
  ectcTeste      = 3;
  ectcLocacao    = 4;
  
  LicArq     = 'lic.txt';

  TipoChaveStr : Array[TTipoChave] of String =
  ('Temporaria', 'Definitiva', 'Teste', 'Locação');
  

var   
  RegistroGlobal : TRegistro = nil;

implementation

uses 
  uScsi, IdeSN, md5, Registry;

function ECTypeToTipoChave(const EC: Byte): TTipoChave;
begin
  case EC of
    ectcTemporaria : Result := tcTemporaria;
    ectcDefinitiva : Result := tcDefinitiva;
    ectcTeste      : Result := tcTeste;
    ectcLocacao    : Result := tcLocacao;
  end;
end;

function pathlic: String;
begin
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
  Result := Copy(GetMD5Str(Result+'cyber'), 1 , 4) + '-' + Result;
end;

function StrToCodLoja(S: String): Integer;
begin
  Result := StrToIntDef(Copy(S, 6, 10), 0);
  if (Result<>0) and (CodLojaToStr(Result)<>S) then
    Result := 0;
end;

function CodLojaOK(S: String): Boolean;
begin
  Result := (StrToCodLoja(S)>0);
end;

function VolumeSerial(DriveChar: Char): string;
var
  OldErrorMode: Integer;
  Serial, NotUsed, VolFlags: DWORD;
  Buf: array [0..MAX_PATH] of Char;
begin
{$I crypt_start.inc}
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
{$I crypt_end.inc}
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
    Result := IntToHex(Trunc(D-DataBaseLic), 4);  
end;

function DateLicToDate(D: String): TDateTime;
begin
  Result := DataBaseLic + StrToIntDef('$'+D, 0);
end;

function TChaveLiberacao.ChaveValida(const aCodLoja: Integer;
  const aCodigoEquip: String; var aTipo: TTipoChave): Integer;
var 
  SNI: TSerialNumberInfo;
  S, S2: String;
begin
{$I crypt_start.inc}
  S := IntToStr(aCodLoja)+'-'+FormatDateTime('dd/mm/yyyy', Vencimento);
  S2 := Copy(FString, 6, 30);
  if DecodeSerialNumber(S, S2, SNI, aCodigoEquip) = vrOK then
  begin                        
    Result := SNI.UserParam;
    aTipo := ECTypeToTipoChave(SNI.LicType);
  end else
    Result := 0;
{$I crypt_end.inc}
end;

constructor TChaveLiberacao.Create;
begin
  FString := '';
end;

function TChaveLiberacao.GetVencimento: TDateTime;
begin
  Result := DateLicToDate(Copy(FString, 1, 4));
end;


function TChaveLiberacao.Venceu: Boolean;
begin
  Result := (Date > Vencimento);
end;

{ TRegistro }

procedure TRegistro.AddChave(const StrChave: String);
var C: TChaveLiberacao;
begin
  C := TChaveLiberacao.Create;
  C.AsString := StrChave;
  FChaves.Add(C)
end;

procedure TRegistro.Clear;
begin
  while FChaves.Count>0 do begin
    TChaveLiberacao(FChaves[0]).Free;
    FChaves.Delete(0);
  end;
end;

constructor TRegistro.Create;
begin
  FChaves := TList.Create;
  FLoja := 0;
end;

destructor TRegistro.Destroy;
begin
  Clear;
  FChaves.Free;
  inherited;
end;

function TRegistro.GetChaveByIndex(N: Integer): TChaveLiberacao;
begin
  Result := TChaveLiberacao(FChaves[N]);
end;

function TRegistro.GetCodLojaAsString: String;
begin
  Result := CodLojaToStr(FLoja);
end;

function TRegistro.GetStringChaves: String;
var I : Integer;
begin
  Result := '';
  for I := 0 to FChaves.Count - 1 do begin
    if Result>'' then
      Result := Result + ';';
    Result := Result + Chaves[I].AsString;
  end;
end;

function TRegistro.CodigoEquip: String;
begin
{$I crypt_start.inc}
  Result := Copy(GetMD5Str(SerialHD+'nexcafeziz'), 9, 16);
  Result := Copy(Result, 1, 4)+'-'+
            Copy(Result, 5, 4)+'-'+
            Copy(Result, 9, 4)+'-'+
            Copy(Result, 13, 4);
{$I crypt_end.inc}
end;

procedure TRegistro.LeArq(const aNomeArq: String; const aCreate: Boolean = True);
var 
  SL: TStrings;
  Existe: Boolean;
begin
  Existe := FileExists(aNomeArq);
  if (not Existe) and (not aCreate) then
    raise Exception.Create('Arquivo de licenças "'+aNomeArq+'" não existe');
  SL := TStringList.Create;
  FLoja := 0;
  Clear;
  try
    if Existe then begin
      SL.LoadFromFile(aNomeArq);
      FLoja := StrToCodLoja(SL.Values['Loja']);
      StringChaves := SL.Values['Chaves'];
    end else begin
      SL.Values['Loja'] := '';
      SL.Values['Chaves'] := '';
      SL.SaveToFile(aNomeArq);
    end;
  finally
    SL.Free;
  end;    
end;

procedure TRegistro.LeArqPadrao;
begin
  LeArq(PathLic+LicArq);
end;

function TRegistro.LicencasValidas(aSomarVencidas: Boolean): Integer;
var 
  I, N : Integer;
  Tipo : TTipoChave;
begin
{$I crypt_start.inc}
  Result := 0;
  for I := 0 to NumChaves - 1 do begin
    N := Chaves[I].ChaveValida(FLoja, CodigoEquip, Tipo);
    if (N>0) and (Tipo<>tcDefinitiva) and Chaves[I].Venceu then N := 0;
    Result := Result + N;
  end;
{$I crypt_end.inc}
end;

function TRegistro.NumChaves: Integer;
begin
  Result := FChaves.Count;
end;

function TRegistro.RemoveChave(const StrChave: String): Boolean;
var I : Integer;
begin
  for I := 0 to NumChaves-1 do 
    if SameText(StrChave, Chaves[I].AsString) then begin
      FChaves.Delete(I);
      Exit;
    end;
end;

procedure TRegistro.SalvaArq(const aNomeArq: String);
var SL : TStrings;
begin
  SL := TStringList.Create;
  try
    SL.Values['Loja'] := CodLojaAsString;
    SL.Values['Chaves'] := StringChaves;
    SL.SaveToFile(aNomeArq);
  finally
    SL.Free;
  end;
end;

procedure TRegistro.SalvaArqPadrao;
begin
  SalvaArq(LicArq);
end;

function TRegistro.SerialHD: String;
begin
  Result := GetIdeSN;
  if Result='' then
    Result := GetSCSISerial(pathlic[1]);
  if Result='' then
    Result := IntToStr(GetHardwareID);
end;

procedure TRegistro.SetCodLojaAsString(const Value: String);
begin
  FLoja := StrToCodLoja(Value);
end;

procedure TRegistro.SetStringChaves(const Value: String);
var 
  S, C: String;
  P: Integer;
begin
  Clear;
  S := Trim(Value);
  while S>'' do begin
    P := Pos(';', S);
    if P>0 then begin
      C := Trim(Copy(S, 1, P-1));
      Delete(S, 1, P);
    end else begin
      C := Trim(S);
      S := '';
    end;
    if Length(C)=24 then AddChave(C);
  end;
end;

initialization 
  RegistroGlobal := TRegistro.Create;
  RegistroGlobal.LeArqPadrao;

finalization
  RegistroGlobal.Free;  

end.




 
