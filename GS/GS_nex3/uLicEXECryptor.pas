unit uLicExeCryptor;

interface

uses
  SyncObjs,
  Classes,
  Windows,
  EXECryptor,
  Sysutils;

type

  TTipoChave = (tcTemporaria, tcDefinitiva, tcTeste, tcLocacao, tcInvalida, tcFreePremium);

  TStatusConta = (scSemConta, scAtivar, scFree, scPremium, scPremiumVenc, scOutroHD, scAnt, scBloqueada, scCybermgr);
  
  TChaveLiberacao = class
  private
    FString  : String;
    function GetVencimento: TDateTime;
  public
    constructor Create;

    function FreePremium: Boolean;

    function Status(const aCodLoja: Integer; var aCodEquip, aSN: String; var aTipo: TTipoChave): TStatusConta;

    function ChaveValida(const aCodLoja: Integer; 
                         var aCodEquip, aSN: String; 
                         var aTipo: TTipoChave): Integer; 
      // Resultado: 0 = serial invalido, caso contrário igual numero de máquinas licenciadas

    function Venceu: Boolean;
    
    property AsString: String
      read FString write FString;

    property Vencimento: TDateTime
      read GetVencimento; 
      
  end;

  TArrayChaveLiberacao = class
  private
    FItems : TList;
    function GetChaveByIndex(N: Integer): TChaveLiberacao;
    function GetString: String;
    procedure SetString(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;

    function Status(const aCodLoja: Integer; var aCodEquip, aSN: String; var aVenceEm: TDateTime): TStatusConta;
    
    procedure Add(const StrChave: String);
    function Remove(const StrChave: String): Boolean;

    function Count: Integer;

    procedure Clear;

    function Clone: TArrayChaveLiberacao;

    property Items[N: Integer]: TChaveLiberacao
      read GetChaveByIndex; Default;

    property AsString: String
      read GetString write SetString;  
  end;

  TRegistro = class
  private
    FCacheS : String;
    FChaves : TArrayChaveLiberacao;
    FLoja   : Integer;
    FEmail  : String;
    FFalhouSalvar : Boolean;
    FCS : TCriticalSection;
    FJafoiPremium : Boolean;
    FBoletosPendentes : Integer;
    function GetCodLojaAsString: String;
    procedure SetCodLojaAsString(const Value: String);
    function GetStringChaves: String;
    procedure SetStringChaves(const Value: String);
    function GetLoja: Integer;
    procedure SetLoja(const Value: Integer);

    procedure Lock;
    procedure Unlock;
    procedure SetConta(const Value: String);
    function GetConta: String;
    function GetBoletosPendentes: Integer;
    function GetJaFoiPremium: Boolean;
    procedure SetBoletosPendentes(const Value: Integer);
    procedure SetJaFoiPremium(const Value: Boolean);
  protected
    procedure Clear;
  public
    constructor Create;
    destructor Destroy; override;  

    function Status: TStatusConta;
    
    function GetSerialHD: String;
    function GetCodEquip(Serial: string) : String;

    procedure LeArq(const aNomeArq: String; const aCreate: Boolean = True; const LeCodLoja: Boolean = False);
    procedure SalvaArq(const aNomeArq: String);
    procedure LeArqPadrao(const LeCodLoja: Boolean = False);
    procedure SalvaArqPadrao;

    property Conta: String
      read GetConta write SetConta;

    property CodLoja: Integer
      read GetLoja write SetLoja;

    property Email: String
      read FEmail;  

    property CodLojaAsString: String 
      read GetCodLojaAsString write SetCodLojaAsString;  

    property JaFoiPremium: Boolean
      read GetJaFoiPremium write SetJaFoiPremium;

    property BoletosPendentes: Integer
      read GetBoletosPendentes write SetBoletosPendentes;

    function NumChaves: Integer;

    function Inexistente: Boolean;

    procedure CodEquipSerial(var aCE, aSN: String);

    function RemoveChave(const StrChave: String):  Boolean;
    
    procedure AddChave(const StrChave: String);
    
    class function ChavesOk(S: String): Boolean;

    function CloneChaves: TArrayChaveLiberacao;

    function LicencasValidas(aSomarVencidas: Boolean; aCodEquip: String = ''; aSN: String = ''): Integer;

    property StringChaves: String
      read GetStringChaves write SetStringChaves;
    
  end;

  function ObtemProxy(var aProxyIP: String; var aProxyPort: Integer): Boolean;
  function CodLojaOK(S: String): Boolean;
  function TrimCodLoja(S: String): String;

  function DateToDateLic(D: TDateTime; aFreePremium: Boolean): String;
  function DateLicToDate(D: String): TDateTime;
  function SerialToCodEquip(aSerial: String): String;
  function StrToCodLoja(S: String): Integer;
  function CodLojaToStr(I: Integer): String;
  
const
  // Tipo da Licença
  ectcTemporaria  = 0;
  ectcDefinitiva  = 2;
  ectcTeste       = 3;
  ectcLocacao     = 4;
  ectcFreePremium = 5;

  ChaveCybermgr    = '9999-9999-9999-9999-9999';
  ChaveBloqueado   = '1111-1111-1111-1111-1111';
  ChaveAtivar      = '2222-2222-2222-2222-2222';
  ChaveInexistente = '3333-3333-3333-3333-3333';
  
  LicArq     = 'lic.txt';

  TipoChaveStr : Array[TTipoChave] of String =
  ('Temporaria', 'Definitiva', 'Teste', 'Locação', 'Inválida', 'Free/Premium');
  

var   
  RegistroGlobal : TRegistro = nil;

threadvar  
  CEOK, SNOK : String;

implementation

uses 
  GetDiskSerial, uScsi, IdeSN, md5, Registry, ncDebug, ncSyncLic;


function TrimCodLoja(S: String): String;
begin
  while (Length(S)>0) and not (S[Length(S)] in ['0'..'9']) do Delete(S, Length(S), 1);
  Result := S;
end;
  
function SerialToCodEquip(aSerial: String): String;
var S: String;
begin  
{$I crypt_start.inc}
  S := S + 'n'; 
  S := S + 'e'; 
  S := S + 'x'; 
  S := S + 'c'; 
  S := S + 'a'; 
  S := S + 'f'; 
  S := S + 'e';
  S := S + 'z';
  S := S + 'i';
  S := S + 'z';
  Result := Copy(GetMD5Str(aSerial+S), 9, 16);
  Result := Copy(Result, 1, 4)+'-'+
            Copy(Result, 5, 4)+'-'+
            Copy(Result, 9, 4)+'-'+
            Copy(Result, 13, 4);
{$I crypt_end.inc}
end;
  

function ECTypeToTipoChave(const EC: Byte): TTipoChave;
begin
  case EC of
    ectcTemporaria  : Result := tcTemporaria;
    ectcDefinitiva  : Result := tcDefinitiva;
    ectcTeste       : Result := tcTeste;
    ectcLocacao     : Result := tcLocacao;
    ectcFreePremium : Result := tcFreePremium;
  else
    Result := tcInvalida;  
  end;
end;

function pathlic: String;
begin
  Result := ExtractFilePath(ParamStr(0));  
end;  

function ObtemProxy(var aProxyIP: String; var aProxyPort: Integer): Boolean;
var 
  R: TRegistry;
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
  if I=0 then
    Result := ''
  else begin
    if I>9999 then
      Result := IntToStr(I) else
      Result := NumStr(I, 4);
    Result := Copy(GetMD5Str(Result+'cyber'), 1 , 4) + '-' + Result;
  end;
end;

function StrToCodLoja(S: String): Integer;
begin
  S := TrimCodLoja(S);
  Result := StrToIntDef(TrimCodLoja(Copy(S, 6, 10)), 0);
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

function IsPremiumDateChar(C: Char): Boolean;
begin
  Result := (C in ['G'..'V']);
end;

function HexToPremium(C: Char): Char;
begin
{$I crypt_start.inc}
  case C of
    '0': Result := 'G';
    '1': Result := 'H';
    '2': Result := 'I';  
    '3': Result := 'J';  
    '4': Result := 'K';  
    '5': Result := 'L';  
    '6': Result := 'M';  
    '7': Result := 'N';  
    '8': Result := 'O';  
    '9': Result := 'P';  
    'A': Result := 'Q';  
    'B': Result := 'R';  
    'C': Result := 'S';  
    'D': Result := 'T';  
    'E': Result := 'U';  
    'F': Result := 'V';  
  else
    Result := C;  
  end;
{$I crypt_end.inc}
end;

function PremiumToHex(C: Char): Char;
begin
{$I crypt_start.inc}
  case C of
    'G': Result := '0';
    'H': Result := '1';
    'I': Result := '2';  
    'J': Result := '3';  
    'K': Result := '4';  
    'L': Result := '5';  
    'M': Result := '6';  
    'N': Result := '7';  
    'O': Result := '8';  
    'P': Result := '9';  
    'Q': Result := 'A';  
    'R': Result := 'B';  
    'S': Result := 'C';  
    'T': Result := 'D';  
    'U': Result := 'E';  
    'V': Result := 'F';  
  else
    Result := C;  
  end;
{$I crypt_end.inc}
end;

function IsPremiumDate(D: String): Boolean;
begin
  if Length(D)<4 then 
   Result := False
  else begin
    D := UpperCase(D);
    Result := IsPremiumDateChar(D[1]) and
              IsPremiumDateChar(D[2]) and
              IsPremiumDateChar(D[3]) and
              IsPremiumDateChar(D[4]);
  end;
end;

function IsFreeDate(D: String): Boolean;
begin
  Result := SameText(Copy(D, 1, 4), 'FREE');
end;

function IsPremiumOrFree(D: String): Boolean;
begin
  Result := SameText(Copy(D, 1, 4), 'FREE') or IsPremiumDate(D);
end;

function PremiumDateToDateLic(D: String): String;
begin
  if IsPremiumDate(D) then
    Result := PremiumToHex(D[1]) + PremiumToHex(D[2]) + PremiumToHex(D[3]) + PremiumToHex(D[4]) else
    Result := D;
end;

function DateLicToPremiumDate(D: String): String;
begin
  if Length(D)<4 then 
    Result := D  else 
    Result := HexToPremium(D[1]) + HexToPremium(D[2]) + HexToPremium(D[3]) + HexToPremium(D[4]);
end;

function DateLicToDate(D: String): TDateTime;
begin
  if SameText(Copy(D, 1, 4), 'FREE') then
    Result := 0 else
    Result := DataBaseLic + 
              StrToIntDef('$'+PremiumDateToDateLic(D), 0);
end;

function DateToDateLic(D: TDateTime; aFreePremium: Boolean): String;
begin
  if D<=DataBaseLic then
    Result := '0000'
  else
    Result := IntToHex(Trunc(D-DataBaseLic), 4);  

  if aFreePremium then
    if (D=0) then
      Result := 'FREE' else
      Result := DateLicToPremiumDate(Result);
end;

function TChaveLiberacao.ChaveValida(
  const aCodLoja: Integer;
  var aCodEquip, aSN: String; 
  var aTipo: TTipoChave): Integer;
var 
  SNI: TSerialNumberInfo;
  S, S2: String;
  SaveSep: Char;

procedure Checar;
begin
  S2 := Copy(FString, 6, 30);
  if DecodeSerialNumber(S, S2, SNI, aCodEquip) = vrOK then
  begin                        
    Result := SNI.UserParam;
    aTipo := ECTypeToTipoChave(SNI.LicType);
    if aTipo=tcInvalida then
      Result := 0;
  end else begin
    Result := 0;
    aTipo := tcInvalida;
  end;
end;  

begin
{$I crypt_start.inc}
  SaveSep := DateSeparator;

  if IsPremiumOrFree(FString) then 
    S := Copy(FString, 1, 4)
  else begin  
    DateSeparator := '/';
    try
      S := IntToStr(aCodLoja)+'-'+FormatDateTime('dd/mm/yyyy', Vencimento);
    finally
      DateSeparator := SaveSep;
    end;
  end;
                              
  Checar;

  if (Result > 0) and (Result<2000) and (aTipo<>tcInvalida) then begin
    CEOK := aCodEquip;
    SNOK := aSN;
  end else
  if (CEOK>'') and (SNOK>'') and (aCodEquip>'') and (aSN>'') and ((Pos(aSN, SNOK)>0) or (Pos(SNOK, aSN)>0)) then begin
    aCodEquip := CEOK;
    aSN := SNOK;
    Checar;
  end;
  
{$I crypt_end.inc}
end;

constructor TChaveLiberacao.Create;
begin
  FString := '';
end;

function TChaveLiberacao.FreePremium: Boolean;
begin
  Result := IsPremiumOrFree(Copy(FString, 1, 4));
end;

function TChaveLiberacao.GetVencimento: TDateTime;
begin
  Result := DateLicToDate(Copy(FString, 1, 4));
end;

function TChaveLiberacao.Status(const aCodLoja: Integer; var aCodEquip,
  aSN: String; var aTipo: TTipoChave): TStatusConta;
var N: Integer;  
begin
  if SameText(FString, ChaveBloqueado) then
    Result := scBloqueada
  else
  if SameText(FString, ChaveCybermgr) then
    Result := scCybermgr
  else  
  if SameText(FString, ChaveInexistente) then
    Result := scSemConta
  else
  if SameText(FString, ChaveAtivar) then
    Result := scAtivar
  else
  if FreePremium then begin
    N := ChaveValida(0, aCodEquip, aSN, aTipo);
    DebugMsg('TChaveLiberacao.Status - FREEPREMIUM');
    if (N=0) or (aTipo=tcInvalida) then 
      Result := scOutroHD
    else
    if IsFreeDate(FString) then
      Result := scFree
    else  
    if Venceu then
      Result := scPremiumVenc else
      Result := scPremium;
  end else begin
    DebugMsg('TChaveLiberacao.Status - Nova chave');
    N := ChaveValida(aCodLoja, aCodEquip, aSN, aTipo);
    if N=0 then 
      Result := scOutroHD else
      Result := scAnt;
  end;
end;

function TChaveLiberacao.Venceu: Boolean;
begin
  Result := (Date > Vencimento);
end;

{ TRegistro }

procedure TRegistro.AddChave(const StrChave: String);
begin
  Lock;
  try
    FChaves.Add(StrChave);
  finally
    Unlock;
  end;
end;

class function TRegistro.ChavesOk(S: String): Boolean;
var 
  C: String;
  P: Integer;
begin
  S := Trim(S);
  while S>'' do begin
    P := Pos(';', S);
    if P>0 then begin
      C := Trim(Copy(S, 1, P-1));
      Delete(S, 1, P);
    end else begin
      C := Trim(S);
      S := '';
    end;
    if Length(C)=24 then begin
      Result := True;
      Exit;
    end;
  end;
  Result := False;
end;

procedure TRegistro.Clear;
begin
  FChaves.Clear;
end;

function TRegistro.CloneChaves: TArrayChaveLiberacao;
begin
  Result := FChaves.Clone;
end;

constructor TRegistro.Create;
begin
  inherited;
  FEmail := '';
  FJaFoiPremium := False;
  FBoletosPendentes := 0;
  FCacheS := '';
  FChaves := TArrayChaveLiberacao.Create;
  FFalhouSalvar := False;
  FLoja := 0;
  FCS := TCriticalSection.Create;
end;

destructor TRegistro.Destroy;
begin
  Clear;
  FChaves.Free;
  FCS.Free;
  inherited;
end;

function TRegistro.GetCodLojaAsString: String;
begin
  Result := CodLojaToStr(CodLoja);
end;

function TRegistro.GetConta: String;
begin
  if FLoja>0 then
    Result := CodLojaAsString else
    Result := FEmail;
end;

function TRegistro.GetJaFoiPremium: Boolean;
begin
  Lock;
  try
    Result := FJaFoiPremium;
  finally
    Unlock;
  end;
end;

function TRegistro.GetLoja: Integer;
begin
  Lock;
  try 
    Result := FLoja;
  finally
    Unlock;
  end;
end;

function TRegistro.GetStringChaves: String;
begin
  Lock;
  try
    Result := FChaves.AsString;
  finally
    Unlock;
  end;
end;

function TRegistro.Inexistente: Boolean;
begin
  Lock;
  try
    Result := (FChaves.Count>0) and SameText(FChaves[0].AsString, ChaveInexistente);
  finally
    Unlock;
  end;
end;

procedure TRegistro.CodEquipSerial(var aCE, aSN: String);
begin
  aSN := GetSerialHD;
  aCE := GetCodEquip(aSN);
end;

function TRegistro.GetBoletosPendentes: Integer;
begin
  Lock;
  try
    Result := FBoletosPendentes;
  finally
    Unlock;
  end;
end;

function TRegistro.GetCodEquip(Serial: String): String;
begin
{$I crypt_start.inc}
//  DebugMsg('GetCodigoEquip - Serial = ' + Serial);
  Serial := Serial + 'n';
  Serial := Serial + 'e';
  Serial := Serial + 'x';
  Serial := Serial + 'c';
  Serial := Serial + 'a';
  Serial := Serial + 'f';
  Serial := Serial + 'e';
  Serial := Serial + 'z';
  Serial := Serial + 'i';
  Serial := Serial + 'z';
  
  Result := Copy(GetMD5Str(Serial), 9, 16);
  Result := Copy(Result, 1, 4)+'-'+
            Copy(Result, 5, 4)+'-'+
            Copy(Result, 9, 4)+'-'+
            Copy(Result, 13, 4);
//  DebugMsg('GetCodigoEquip = ' + Result);          
{$I crypt_end.inc}
end;

procedure TRegistro.LeArq(const aNomeArq: String; const aCreate: Boolean = True; const LeCodLoja: Boolean = False);
var 
  SL: TStrings;
  Existe: Boolean;
begin
  Lock;
  try
    Existe := FileExists(aNomeArq);
    if (not Existe) and (not aCreate) then
      raise Exception.Create('Arquivo de licenças "'+aNomeArq+'" não existe');
    SL := TStringList.Create;
    if LeCodLoja then
      FLoja := 0;
    Clear;
    try
      if Existe then begin
        SL.LoadFromFile(aNomeArq);
        if LeCodLoja then
          Conta := SL.Values['Loja'];
        StringChaves := SL.Values['Chaves'];
        FBoletosPendentes := StrToIntDef(SL.Values['BP'], 0);
        FJaFoiPremium := SameText(SL.Values['JFP'], 'S');
      end else begin
        SL.Values['Loja'] := '';
        SL.Values['Chaves'] := '';
        SL.SaveToFile(aNomeArq);
      end;
    finally
      SL.Free;
    end;
  finally
    UnLock;
  end;
end;

procedure TRegistro.LeArqPadrao(const LeCodLoja: Boolean = False);
begin
  LeArq(PathLic+LicArq, True, LeCodLoja);
end;

function TRegistro.LicencasValidas(aSomarVencidas: Boolean; aCodEquip: String = ''; aSN: String = ''): Integer;
var 
  I, N : Integer;
  Tipo : TTipoChave;
begin
{$I crypt_start.inc}
  Lock;
  try
    Result := 0;
    if aCodEquip='' then CodEquipSerial(aCodEquip, aSN);
  
    for I := 0 to NumChaves - 1 do begin
      N := FChaves[I].ChaveValida(FLoja, aCodEquip, aSN, Tipo);
      if N>2000 then N := 0;
      if (N>0) and (Tipo<>tcDefinitiva) and (Tipo<>tcFreePremium) and FChaves[I].Venceu then
        N := 0;
      Result := Result + N;
    end;
  finally
    UnLock;
  end;
{$I crypt_end.inc}
end;

procedure TRegistro.Lock;
begin
  FCS.Enter;
end;

function TRegistro.NumChaves: Integer;
begin
  Lock;
  try
    Result := FChaves.Count;
  finally
    UnLock;
  end;
end;

function TRegistro.RemoveChave(const StrChave: String): Boolean;
begin
  Lock;
  try
    Result := FChaves.Remove(StrChave);
  finally
    UnLock;
  end;
end;

procedure TRegistro.SalvaArq(const aNomeArq: String);
var SL : TStrings;
const 
  SNBool : Array[Boolean] of Char = ('N', 'S');
begin
  Lock;
  try
    SL := TStringList.Create;
    try                           
      SL.Values['Loja'] := Conta;
      SL.Values['Chaves'] := StringChaves;
      SL.Values['BP'] := IntToStr(FBoletosPendentes);
      SL.Values['JFP'] := SNBool[FJaFoiPremium];
      
      if FileIsReadOnly(aNomeArq) then
        FileSetReadOnly(aNomeArq, False);
      FileSetAttr(aNomeArq, faArchive);  
      try
        SL.SaveToFile(aNomeArq);
        FFalhouSalvar := False;
      except
        FFalhouSalvar := True;
      end;
    finally
      SL.Free;
    end;
  finally
    UnLock;
  end;
end;

procedure TRegistro.SalvaArqPadrao;
begin
  SalvaArq(LicArq);
end;

function TRegistro.GetSerialHD: String;
var 
  ds: TGetDiskSerial;
  I: Integer;
begin
{$I crypt_start.inc}
//  Debugmsg('GetSerialHD - Inicio...');
  DS := TGetDiskSerial.Create(nil);
  try
    try
//      DS.RegCode := 'E3MA2-LLT4Q-QSKH3-JHFF7-YJ7NN';
      for I := 0 to 3 do begin
        DS.DriveID := I;
        Result := Trim(DS.SerialNumber);
//        Debugmsg('GetSerialHD - Disco '+IntToStr(I)+' = '+Result);
        if Result>'' then Break;
      end;
      if Result='' then begin
        Result := GetIdeSN;
//        Debugmsg('GetSerialHD - GetIdeSN = ' + Result);
      end;
      if Result='' then begin
        Result := GetSCSISerial(pathlic[1]);
//        Debugmsg('GetSerialHD - GetScsiSerial = ' + Result);
      end;
      if Result='' then begin
        Result := IntToStr(GetHardwareID);
//        Debugmsg('GetSerialHD - GetHardwareID = ' + Result);
      end;
    finally
      DS.Free;
    end;
  except
    on E: Exception do DebugMsg('GetSerial HD - Erro = '+E.Message);
  end;
//  Debugmsg('SerialHD - Fim');
{$I crypt_end.inc}  
end;

procedure TRegistro.SetBoletosPendentes(const Value: Integer);
begin
  Lock;
  try
    FBoletosPendentes := Value;
  finally
    Unlock;
  end;
end;

procedure TRegistro.SetCodLojaAsString(const Value: String);
begin
  CodLoja := StrToCodLoja(Value);
end;

procedure TRegistro.SetConta(const Value: String);
begin
  CodLoja := StrToIntDef(Value, 0);
  if CodLoja=0 then
    CodLoja := StrToCodLoja(Value);
    
  if CodLoja=0 then
    FEmail := Value;
end;

procedure TRegistro.SetJaFoiPremium(const Value: Boolean);
begin
  Lock;
  try
    FJaFoiPremium := Value;
  finally
    Unlock;
  end;
end;

procedure TRegistro.SetLoja(const Value: Integer);
begin
  Lock;
  try
    FLoja := Value;
    if Value>0 then
      FEmail := '';
  finally
    UnLock;
  end;
end;

procedure TRegistro.SetStringChaves(const Value: String);
var 
  S, C: String;
  P: Integer;
begin
  Lock;
  try
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
  finally
    UnLock;
  end;
end;

function TRegistro.Status: TStatusConta;
var 
  I : Integer;
  aCE, aSN : String;
  aTipo : TTipoChave;
begin
  Lock;
  try
    if (Trim(Conta)='') or (NumChaves=0) then
      Result := scSemConta
    else
      for I := 0 to NumChaves - 1 do begin
        CodEquipSerial(aCE, aSN);
        Result := FChaves[I].Status(FLoja, aCE, aSN, aTipo);
        if Result<>scOutroHD then Exit;
      end;
  finally
    Unlock;
  end;
end;

procedure TRegistro.Unlock;
begin
  FCS.Leave;
end;

{ TArrayChaveLiberacao }

procedure TArrayChaveLiberacao.Add(const StrChave: String);
var C: TChaveLiberacao;
begin
  C := TChaveLiberacao.Create;
  C.AsString := StrChave;
  FItems.Add(C)
end;

procedure TArrayChaveLiberacao.Clear;
begin
  while Count>0 do begin
    TObject(FItems[0]).Free;
    FItems.Delete(0);
  end;
end;

function TArrayChaveLiberacao.Clone: TArrayChaveLiberacao;
begin
  Result := TArrayChaveLiberacao.Create;
  Result.AsString := AsString;
end;

function TArrayChaveLiberacao.Count: Integer;
begin
  Result := FItems.Count;
end;

constructor TArrayChaveLiberacao.Create;
begin
  FItems := TList.Create;                           
end;

destructor TArrayChaveLiberacao.Destroy;
begin
  Clear;
  FItems.Free;
  inherited;
end;

function TArrayChaveLiberacao.GetChaveByIndex(N: Integer): TChaveLiberacao;
begin
  Result := TChaveLiberacao(FItems[N]);
end;

function TArrayChaveLiberacao.GetString: String;
var I : Integer;
begin
  Result := '';
  for I := 0 to Count - 1 do begin
    if Result>'' then
       Result := Result + ';';
    Result := Result + Items[I].AsString;
  end;
end;

function TArrayChaveLiberacao.Remove(const StrChave: String): Boolean;
var I : Integer;
begin
  for I := 0 to Count-1 do 
  if SameText(StrChave, Items[I].AsString) then begin
    Items[I].Free;
    FItems.Delete(I);
    Result := True;
    Exit;
  end;
  Result := False;
end;

procedure TArrayChaveLiberacao.SetString(const Value: String);
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
    if Length(C)=24 then Add(C);
  end;
end;

function TArrayChaveLiberacao.Status(const aCodLoja: Integer; var aCodEquip,
  aSN: String; var aVenceEm: TDateTime): TStatusConta;
var 
  I : Integer;  
  aTipo : TTipoChave;
begin
  if Count=0 then begin
    aVenceEm := 0;
    Result := scSemConta;
  end else begin
    Result := Items[0].Status(aCodLoja, aCodEquip, aSN, aTipo);
    aVenceEm := Items[0].Vencimento;
  end;
end;

initialization
  RegistroGlobal := TRegistro.Create;
//  RegistroGlobal.LeArqPadrao;

finalization
  RegistroGlobal.Free;  

end.




 
