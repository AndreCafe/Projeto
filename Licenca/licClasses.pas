unit licClasses;

interface 

uses
  Classes,
  SysUtils,
  Messages,
  Windows;

const
  BitsH : Array[0..23] of Cardinal = (
   $1,
   $2,
   $4,
   $8,
   $10,
   $20,
   $40,
   $80,
   $100,
   $200,
   $400,
   $800,
   $1000,
   $2000,
   $4000,
   $8000,
   $10000,
   $20000,
   $40000,
   $80000,
   $100000,
   $200000,
   $400000,
   $800000);

  NomeArqLicenca = 'licenca.lic';
  NomeArqLicencaAntigo = 'cmservidor.ini';
  BoolStr : Array[Boolean] of Char = ('0', '1');

  mdDemo     = -1;
  mdLiberado = 0;

type
  TLicencaStr     = String[40];

  TLicenca = object
  private
    function GetString: String;
    procedure SetString(const Value: String);
  public
    liDefinitiva : Boolean;
    liMaquinas   : Integer;
    liVencimento : TDateTime;
    liSenha      : String[8];
    liNumSerie   : Integer;

    procedure LeSerialHD;
    procedure AtualizaSenha;
    procedure SalvaArquivo(NomeArq: String);
    procedure SalvaArquivoPadrao;
    procedure LeArquivo(NomeArq: String);
    procedure LeArquivoPadrao;
    procedure Limpa;
    
    function SenhaCorreta: String;
    function SenhaAntiga: String;
    function SenhaOk: Boolean;

    function EmModoDemo: Boolean;
    function Expirou: Boolean;
    function Maquinas: Integer;

    property AsString: String
      read GetString write SetString;
  end;

  function Senha(D: TDateTime; NS: Cardinal; NumMaq: Integer): String;
  function VolumeSerial(DriveChar: Char): string;
  function FormataNumVersao(St: String): String;
  function DuasCasas(D: Double): Double;
  function DataBaseLic: TDateTime;
  function LimpaTraco(S: String): String;
  function StringToBool(S: String): Boolean;

  var
    LicencaGlobal: TLicenca;
                
implementation

uses Graphics;

function StringToBool(S: String): Boolean;
begin
  S := UpperCase(S);
  Result := (S='T') or (S='TRUE') OR (S='S') or (S='SIM');
end;


function MenorCardinal(C1, C2: Cardinal): Cardinal;
begin
  if C1<C2 then
    Result := C1
  else
    Result := C2;  
end;

function DuasCasas(D: Double): Double;
begin
  Result := Int(D*100) / 100;
end;

function LimpaTraco(S: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(S) do 
  if S[I] <> '-' then 
    Result := Result + S[I];
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

function FormataNumVersao(St: String): String;
var I : Integer;
begin
  Result := St;
  I := Length(Result);
  while (I>0) and (Result[I]<>'.') do Dec(I);
  
  if (I>0) and (Result[I]='.') then 
    Result := Copy(Result, 1, I)+ZeroPad(Copy(Result, I+1, Length(Result)), 4);
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

function Senha(D: TDateTime; NS: Cardinal; NumMaq: Integer): String;
var
  E : Extended;
  S : String;
begin
  try
    E := NS + (Int(D)*1000) +  (NumMaq * 1000) - 3;
    E := Ln(E);
    Str(E:0:30, S);
    S := Copy(S, Pos('.', S)+4, 8);
    Result := S[2] + S[8] + S[7] + S[3] + S[1] + S[4] + S[6] + S[5];
  except
   Result := 'Kznq098s';
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
const DefinitivaSt : Array[Boolean] of Char = ('1', '2');
begin
  Result := DefinitivaSt[liDefinitiva] +
            NumStr(liMaquinas, 3) + '-' +
            DateToDateLic(liVencimento) + '-' +
            ZeroPad(Copy(liSenha, 1, 4), 4) + '-' +
            ZeroPad(Copy(liSenha, 5, 4), 4) + '-' +
            IntToHex(liNumSerie, 8);
end;

procedure TLicenca.SetString(const Value: String);
var S: String;
begin
  S := LimpaTraco(Value);
  liDefinitiva := (Copy(S, 1, 1)='2');
  liMaquinas   := StrToIntDef(Copy(S, 2, 3), 0);
  liVencimento := StrToIntDef(Copy(S, 5, 4), 0);
  if liVencimento>0 then liVencimento := liVencimento + DataBaseLic;
  liSenha      := Copy(S, 9, 8);
  S := Trim(Copy(S, 17, 50));
  if S>'' then
    liNumSerie   := StrToIntDef('$'+S, 0);
    
  if liNumSerie=0 then
    LeSerialHD;
end;

function TLicenca.SenhaAntiga: String;
begin
  if liDefinitiva then
    Result := Senha(0, liNumSerie, liMaquinas)
  else  
    Result := Senha(liVencimento, liNumSerie, liMaquinas);
end;

function TLicenca.SenhaCorreta: String;
begin
  if liDefinitiva then
    Result := Senha(liVencimento*2, liNumSerie, liMaquinas)
  else  
    Result := Senha(liVencimento, liNumSerie, liMaquinas);
end;

function TLicenca.SenhaOk: Boolean;
begin
  Result := (liNumSerie<>0) and (liSenha>'') and (SenhaCorreta=liSenha);
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
  SalvaArquivo(ExtractFilePath(ParamStr(0))+NomeArqLicenca);
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
    liDefinitiva := (Trunc(liVencimento)=0);
    liSenha      := SL.Values['Chave'];
    liMaquinas   := StrToIntDef(SL.Values['NumMaq'], 0);
  end;
  SL.Free;
end;

procedure TLicenca.Limpa;
begin
  liDefinitiva := False;
  liSenha := '';
  liMaquinas := 2;
  liVencimento := 0;
  LeSerialHD;
end;

procedure TLicenca.LeArquivoPadrao;
begin
  if FileExists(ExtractFilePath(ParamStr(0))+NomeArqLicenca) then
    LeArquivo(ExtractFilePath(ParamStr(0))+NomeArqLicenca)
  else 
  if FileExists(ExtractFilePath(ParamStr(0))+NomeArqLicencaAntigo) then
  begin
    LeArquivo(ExtractFilePath(ParamStr(0))+NomeArqLicencaAntigo);
    SalvaArquivoPadrao;
  end;  
end;

procedure TLicenca.LeSerialHD;
begin
  liNumSerie := StrToIntDef('$'+VolumeSerial(ParamStr(0)[1]), 0);
end;

procedure TLicenca.AtualizaSenha;
begin
  liSenha := SenhaCorreta;
end;

{ TCMClasse }
function Z2(I: Integer): String;
begin
  Result := IntToStr(I);
  if Length(Result)=1 then
    Result := '0' + Result;
end;

function TicksToHMSSt(Ticks: Cardinal): String;
var H, M, S : Integer;
begin
  H := Ticks div (1000 * 60 * 60);
  Ticks := Ticks mod (1000 * 60 * 60);
  M := Ticks div (1000 * 60);
  Ticks := Ticks mod (1000 * 60);
  S := Ticks div 1000;
  Result := Z2(H) + ':' + Z2(M) + ':' + Z2(S);  
end;

function TicksToDateTime(Ticks: Cardinal): TDateTime;
var H, M, S : Integer;
begin
  H := Ticks div (1000 * 60 * 60);
  Ticks := Ticks mod (1000 * 60 * 60);
  M := Ticks div (1000 * 60);
  Ticks := Ticks mod (1000 * 60);
  S := Ticks div 1000;
  
  if (H>23) then H := 23;
  
  Result := EncodeTime(H, M, S, 0);
end;  

function SegundosToHMSSt(Seg: Cardinal): String;
begin
  Result := IntToStr(Seg div (60 * 60));
  Seg := Seg mod (60 * 60);
  Result := Result + ':' + Z2(Seg div 60);
  Seg := Seg mod 60;
  Result := Result + ':' + Z2(Seg);
end;  

function SegundosToDateTime(Seg: Cardinal): TDateTime;
var H, M: Integer;
begin
  H := Seg div (60 * 60);
  Seg := Seg mod (60 * 60);
  M := Seg div 60;
  Seg := Seg mod 60;
  
  Result := EncodeTime(H, M, Seg, 0);
end;  

function DateTimeToTicks(D: TDateTime): Cardinal;
var H, M, S, MS : Word;
begin
  DecodeTime(D, H, M, S, MS);
  Result := (Trunc(Int(D)) * 24 * 60 * 60 * 1000) +
            (H * 60 * 60 * 1000) +
            (M * 60 * 1000) +
            (S * 1000) + MS;
end;  

function DateTimeToSegundos(D: TDateTime): Cardinal;
var H, M, S, MS : Word;
begin
  DecodeTime(D, H, M, S, MS);
  Result := (H * 60 * 60) + (M * 60) + S;
end;

function TLicenca.EmModoDemo: Boolean;
begin
  Result := (not SenhaOk) or Expirou;
end;

function TLicenca.Expirou: Boolean;
begin
  Result := SenhaOk and ((not liDefinitiva) and (Date>liVencimento));
end;

function TLicenca.Maquinas: Integer;
begin
  if EmModoDemo or Expirou then
    Result := 2
  else
    Result := liMaquinas;
end;

{ TPassaporte }

function StrParaData(S: String): TDateTime;
var
  Dia, Mes, Ano, Min, Seg, Hora : Integer;
begin
  Dia  := StrToIntDef(Copy(S, 1, 2), 0);
  Mes  := StrToIntDef(Copy(S, 3, 2), 0);
  Ano  := StrToIntDef(Copy(S, 5, 4), 0);
  Hora := StrToIntDef(Copy(S, 9, 2), 0);
  Min  := StrToIntDef(Copy(S, 11, 2), 0);
  Seg  := StrToIntDef(Copy(S, 13, 2), 0);
  Result := EncodeDate(Ano, Mes, Dia) + EncodeTime(Hora, Min, Seg, 0);
end;

function SetBit(I, Bits: Integer; Lig: Boolean): Integer;
begin
  if Lig then
    Result := I or Bits
  else
    Result := I and (not Bits);
end;

function BitIsSet(I, Bits: Integer): Boolean;
begin
  Result := ((I and Bits)=Bits);
end;

end.


