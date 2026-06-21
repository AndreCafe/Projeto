unit cmClassesBase;

interface 

uses
  Classes,
  CacheProp,
  ClasseCS,
  SysUtils,
  Messages,
  Windows,
  Dialogs,
  DB,
  uLicenca,
  cmMsgCom,
  cmErros;

const
  eppPausarAcesso = 0;
  eppContinuarEmPosPago = 1;
  eppEncerrarAcesso = 2;


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

  // Opções de Bloqueio quando cair a rede
  obPermitePrePago = 0;
  obPermitePosPago = 1;
  obBloqueioTotal  = 2;
  obFecharCMGuard  = 3; 

  BoolStr : Array[Boolean] of Char = ('0', '1');

  mdDemo     = -1;
  mdLiberado = 0;
  MinCreditoLoginMS = 5000;

  // Status Pagamento
  spEmAndamento  = 0;
  spAguardaPagto = 1;
  spPago         = 2;
  spDebitado     = 3;
  HorasSemana = 7 * 24;
  SegundosPorDia = 60 * 60 * 24;
  MSPorDia = SegundosPorDia * 1000;
  MSPorSemana = MSPorDia * 7;

  spStrings : Array [spEmAndamento..spDebitado] of String[17] = (
    'Em Andamento',
    'Aguarda Pagamento',
    'Ok',
    'Debitado');

  // Tipos de Transação
  ttAcesso            = 0;
  ttVendaPacote       = 1;
  ttCreditoTempo      = 2;
  ttManutencao        = 3;
  ttAcessoVenda       = 4;
  ttDebitoTempo       = 5;
  ttSinal             = 6;
  ttEstVenda          = 7;
  ttEstCompra         = 8;
  ttEstEntrada        = 9;
  ttEstSaida          = 10;
  ttPagtoDebito       = 11;
  ttSuprimentoCaixa   = 12;
  ttSangriaCaixa      = 13;
  ttVendaPassaporte   = 14;

  // Modos de Pagamento
  mpgTelaPagtoAutomatica = 0;
  mpgDuploCliqueMaq      = 1;
  mpgSomenteTransacoes   = 2;

  StTipoTransacao : Array[ttAcesso..ttVendaPassaporte] of String = (
    'Acesso',
    'Pacote',
    'Crédito Tempo',
    'Manutenção',
    'Acesso + Venda',
    'Débito Tempo',
    'Sinal',
    'Venda Avulsa',
    'Compra',
    'Entrada Estoque',
    'Saida Estoque',
    'Pagamento Débito',
    'Suprimento Caixa',
    'Sangria Caixa',
    'Venda Passaporte');

  // Tipo Expiração
  teNunca       = 0;
  teDias        = 1;
  teHoras       = 2;
  teAcessos     = 3;
  teDataMarcada = 4;

  BoolToString : Array[Boolean] of String[5] = ('False', 'True');

type
  TArrayTempo = Array[0..23] of Double;
  TArrayTipoTran = Array[ttAcesso..ttVendaPassaporte] of Boolean;
  PArrayTipoTran = ^TArrayTipoTran;

  TPassaporte = object
  private
    function GetHoraValida(D, H: Integer): Boolean;
    procedure SetHoraValida(D, H: Integer; const Value: Boolean);
    function TempoRestante(Agora: TDateTime): Cardinal;
  public
    pcCodigo        : Integer;
    pcNumero        : Integer;
    pcNome          : String[50];
    pcCliente       : Integer;
    pcSenha         : String;
    pcValor         : Double;
    pcTipoExp       : Byte;
    pcTipoAcesso    : Integer;
    pcExpirou       : Boolean;
    pcValido        : Boolean;
    pcExpirarEm     : TDateTime;
    pcPrimeiroUso   : TDateTime;
    pcMaxSegundos   : Cardinal;
    pcSegundos      : Cardinal;
    pcAcessos       : Cardinal;
    pcHorasValidas  : Array[1..7] of Cardinal;

    pctUsadoMS      : Cardinal;
    pctExpirou      : Boolean;
    pctInicio       : TDateTime;
    pctExpirar      : TDateTime;

    pctTempoRes     : Cardinal;

    procedure AjustaInicioExpirar(Inicio: TDateTime);
    procedure LeStr(S: String);
    function ObtemStr: String;
    procedure HorasValidasFromStr(S: String);
    function HorasValidasToStr: String;
    function ObtemTempo(Agora: TDateTime; Dia, H : Integer; DuracaoMS: Cardinal): Cardinal;
    procedure LoadFromDataset(D: TDataset);
    procedure SaveToDataset(D: TDataset);
    function PrimeiroUso: TDateTime;
    procedure TotalizaUso;
    function Igual(P: TPassaporte): Boolean;
    function GeraSenha: String;

    property HoraValida[D, H: Integer]: Boolean
      read GetHoraValida write SetHoraValida;
  end;

  PPassaporte = ^TPassaporte;

  TArrayPassaporte = Array of TPassaporte;

  TPassaportes = object
  public
    Itens : TArrayPassaporte;
    SData : TDateTime;
    function Igual(P: TPassaportes): Boolean;

    procedure Limpa;
    procedure Ordenar(Data: TDateTime; H: Byte);
    procedure LeStr(S: String);
    procedure AjustaInicioExpirar(Inicio: TDateTime);
    function ObtemStr: String;
    function Count: Integer;
    function AbateCreditos(Agora: TDateTime; Tempo: Cardinal): Cardinal;
    procedure AddPassaporte(P: TPassaporte);
    procedure TotalizaUso;
    function TempoUsadoTotal: Cardinal;
  end;

  PPassaportes = ^TPassaportes;

  TCMTipoAcesso   = class;
  TCMTarifa       = class;

  TCMTarifas = class;
  TLicencaStr     = String[90];
  
  TCMEtapa = record
    prTempo : Cardinal;
    prValor : Double;
    prValorMin : Double;
    prTolerancia : Cardinal;
  end;  

  TCMEtapas = Array of TCMEtapa;
  PCMEtapas = ^TCMEtapas;

  TCMHoraTarifa = Array[1..7, 0..23] of Integer;
  PCMHoraTarifa = ^TCMHoraTarifa;

  TCMCronometro = class
  protected 
    FInicioDT : TDateTime;
  public
  end;

  TCMTarifadorBase = class
  protected
    function GetIsento: Boolean; virtual; abstract;
    function GetNumTicks: Cardinal; virtual; abstract;
    function GetCores: TCMTarifas; virtual; abstract;
    function GetCredito: Cardinal; virtual; abstract;
    function GetHoraTarifa: PCMHoraTarifa; virtual; abstract;
    function GetInicio: TDateTime; virtual; abstract;
    function GetPassaportes: PPassaportes; virtual; abstract;
    function GetTipoAcesso: Word; virtual; abstract;
    function GetCredValor: Double; virtual; abstract;
    function GetTipoCalc: Byte; virtual; abstract;
    function GetValor: Double; virtual; abstract;
    function GetTempoCobrado: Cardinal; virtual; abstract;
    function GetCreditoTotal: Cardinal; virtual; abstract;
  
    procedure SetNumTicks(const Value: Cardinal); virtual; abstract;
    procedure SetCredito(const Value: Cardinal); virtual; abstract;
    procedure SetHoraTarifa(const Value: PCMHoraTarifa); virtual; abstract;
    procedure SetInicio(const Value: TDateTime); virtual; abstract;
    procedure SetPassaportes(const Value: PPassaportes); virtual; abstract;
    procedure SetTipoAcesso(const Value: Word); virtual; abstract;
    procedure SetCredValor(const Value: Double); virtual; abstract;
    procedure SetIsento(const Value: Boolean); virtual; abstract;
    
  public
    procedure Reset; virtual; abstract;

    function TempoCredValor: Cardinal; virtual; abstract; // Obtem o tempo correspondente ao crédito em valor (FCredValor)
    function CreditoUsado: Cardinal; virtual; abstract; // Quanto do crédito do cliente foi usado
    function Cronometro: Cardinal; virtual; abstract;
    function CronometroStr: String; virtual; abstract;

    property NumTicks: Cardinal
      read GetNumTicks write SetNumTicks; 

    property TipoAcesso: Word
      read GetTipoAcesso Write SetTipoAcesso;
       
    property HoraTarifa : PCMHoraTarifa
      read GetHoraTarifa write SetHoraTarifa;
    
    property Inicio : TDateTime
      read GetInicio write SetInicio;

    property Credito : Cardinal
      read GetCredito write SetCredito;

    property Passaportes : PPassaportes
      read GetPassaportes write SetPassaportes;

    property CredValor: Double
      read GetCredValor write SetCredValor;

    property CreditoTotal: Cardinal
      read GetCreditoTotal;  

    property TipoCalc: Byte
      read GetTipoCalc;  

    property Valor: Double
      read GetValor;

    property Isento: Boolean
      read GetIsento write SetIsento;  
  end; 
  
  TCMTipoAcesso = class ( TClasseCS )
  private
    FCodigo    : Word;
    FNome      : String;
    FHoraTarifa   : TCMHoraTarifa;
  protected   
    function GetChave: Variant; override;
    function GetPHoraTarifa: PCMHoraTarifa;
  public  
    constructor Create;

    property PHoraTarifa: PCMHoraTarifa
      read GetPHoraTarifa;

    function GetHoraTarifaStr: String;
    procedure SetHoraTarifaStr(const Valor: String);

    procedure AssignTA(TA: TCMTipoAcesso);
    
  published 
    property Codigo: Word
      read FCodigo write FCodigo;

    property Nome: String
      read FNome write FNome;

    property HoraTarifaStr: String
      read GetHoraTarifaStr write SetHoraTarifaStr;  
  end;

  TCMTarifa = class ( TClasseCS )
  private
    FTipoAcesso : Word;
    FCor        : Integer;
    FCorFonte   : Integer;
    FReinicia   : Boolean;
    FDescricao  : String;
    FPrecos     : TCMEtapas;

    function GetPPrecos: PCMEtapas;
    
  protected
    function GetChave: Variant; override;

    function GetTipoAcesso: Word; virtual;
    function GetCor: Integer; virtual;
    function GetCorFonte: Integer; virtual;
    function GetReinicia: Boolean; virtual;
    function GetDescricao: String; virtual;
    function GetPrecosStr: String; virtual;

    procedure SetTipoAcesso(Value : Word); virtual;
    procedure SetCor(Value : Integer); virtual;
    procedure SetCorFonte(Value : Integer); virtual;
    procedure SetReinicia(Value : Boolean); virtual;
    procedure SetDescricao(Value : String); virtual;
    procedure SetPrecosStr(Value: String); virtual;

  public
    constructor Create;

    property PPrecos: PCMEtapas
      read GetPPrecos;

    function ObtemIndProxPreco(TempoCorrido: Cardinal): Integer;
    function TempoTotal: Cardinal;
  published

    property TipoAcesso: Word
      read GetTipoAcesso write SetTipoAcesso;

    property Cor: Integer
      read GetCor write SetCor;
      
    property CorFonte: Integer
      read GetCorFonte write SetCorFonte;
      
    property Reinicia: Boolean
      read GetReinicia write SetReinicia;
      
    property Descricao: String
      read GetDescricao write SetDescricao;
  
    property PrecosStr: String
      read GetPrecosStr write SetPrecosStr;
  end;
  
  TCMTiposAcesso = class ( TListaClasseCS ) 
  private
    function GetTipoAcesso(I: Integer): TCMTipoAcesso;
    function GetTipoAcessoPorCodigo(N: Integer): TCMTipoAcesso;
  public
    constructor Create;

    property Itens[I: Integer]: TCMTipoAcesso
      read GetTipoAcesso; default;

    property PorCodigo[N: Integer]: TCMTipoAcesso
      read GetTipoAcessoPorCodigo;
  end;

  TCMTarifas   = class ( TListaClasseCS )
  private
    function GetTarifa(I: Integer): TCMTarifa;
    function GetTarifaPorCor(aTipoAcesso: Word; aCor: Integer): TCMTarifa;
  public
    constructor Create;

    property Itens[I: Integer]: TCMTarifa 
      read GetTarifa; default;

    property PorCor[aTipoAcesso: Word; aCor: Integer]: TCMTarifa
      read GetTarifaPorCor;
  end;

  function MenorCardinal(C1, C2: Cardinal): Cardinal;
  function TicksToHMSSt(Ticks: Cardinal): String;
  function TicksToDateTime(Ticks: Cardinal): TDateTime;
  function SegundosToHMSSt(Seg: Cardinal): String;
  function SegundosToDateTime(Seg: Cardinal): TDateTime;
  function DateTimeToTicks(D: TDateTime): Cardinal;
  function DateTimeToSegundos(D: TDateTime): Cardinal;
  
var
  gTiposAcesso : TCMTiposAcesso = nil;
  gTarifas     : TCMTarifas = nil;  

const
  tcTiposAcesso = 1; 
  tcTarifa = 2; 

implementation

uses 
  Graphics, 
  md5, 
  cmTarifador;

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

procedure MinutosPorHora(Inicio, Fim: TDateTime; var Tempos: TArrayTempo);
var
  I : Integer;
  Hora, H, M, S, MS : Word;
  Agora, T, PH : TDateTime;
begin
  for I := 0 to 23 do Tempos[I] := 0;
  if Fim<=Inicio then Exit;
  DecodeTime(Inicio, H, M, S, MS);
  Agora := Inicio;
  Hora := H;
  I := Trunc(Inicio);
  while Agora < Fim do begin
    if H<23 then
      Inc(H)
    else begin
      H := 0;
      Inc(I);
    end;
    PH := I + EncodeTime(H, 0, 0, 0);
    if PH>Fim then PH := Fim;
    T := PH - Agora;
    Tempos[Hora] := Tempos[Hora] + (T*24*60);
    Hora := H;
    Agora := PH;
  end;
end;

function ObtemCred(I: Integer): Cardinal;
begin
  if I>0 then 
    Result := I
  else
    Result := 0;  
end;

function TempoTotalArrayPrecos(AP: TCMEtapas): Cardinal;
var I : Integer;
begin
  Result := 0;
  for I := 0 to High(AP) do 
    Result := Result + AP[I].prTempo;
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

function CalcAcesso(Acesso, Sinal, Desc: Double): Double;
begin
  if Sinal > Acesso then
    Result := 0 - Desc
  else
    Result := Acesso - Sinal - Desc;  
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


function Arredonda(D: Double): Double;
var 
  I, R : Integer;
begin
  I := Trunc(D * 100);
  R := I mod 10;
  if (R>0) and (R<>5) then 
  if R < 5  then
    I := I - R
  else  
    I := I + (10-R);
  Result := I / 100;  
end;

function TCMTarifa.ObtemIndProxPreco(TempoCorrido: Cardinal): Integer;
var T : Cardinal;
begin
  if (Length(FPrecos)=0) or (TempoCorrido<0) then
    Result := -1
  else
  if Length(FPrecos)=1 then
    Result := 0 
  else begin
    if Reinicia then 
      TempoCorrido := TempoCorrido mod TempoTotal;
    Result := 0;
    T := FPrecos[0].prTempo;
    while (TempoCorrido>T) and (Result<High(FPrecos)) do begin
      Result := Result + 1;
      T := T + FPrecos[Result].prTempo;
    end;  
  end;    
end;

{ TCMTipoAcesso }

constructor TCMTipoAcesso.Create;
begin
  inherited;
  FNome := '';
  Fillchar(FHoraTarifa, SizeOf(FHoraTarifa), 0);
  FCodigo := 0;
end;

function TCMTipoAcesso.GetChave: Variant;
begin
  Result := FCodigo;
end;

function TCMTipoAcesso.GetPHoraTarifa: PCMHoraTarifa;
begin
  Result := @FHoraTarifa;
end;

function TCMTipoAcesso.GetHoraTarifaStr: String;
begin
  SetLength(Result, SizeOf(FHoraTarifa));
  Move(FHoraTarifa, Result[1], SizeOf(FHoraTarifa));
end;

procedure TCMTipoAcesso.SetHoraTarifaStr(const Valor: String);
begin
  Move(Valor[1], FHoraTarifa, Length(Valor));
end;

procedure TCMTipoAcesso.AssignTA(TA: TCMTipoAcesso);
begin
  FCodigo    := TA.FCodigo;
  FNome      := TA.FNome;
  FHoraTarifa   := TA.FHoraTarifa;
end;

{ TCMTiposAcesso }

constructor TCMTiposAcesso.Create;
begin
  inherited Create(tcTiposAcesso);
end;

function TCMTiposAcesso.GetTipoAcesso(I: Integer): TCMTipoAcesso;
begin
  Result := TCMTipoAcesso(GetItem(I));
end;

function TCMTiposAcesso.GetTipoAcessoPorCodigo(
  N: Integer): TCMTipoAcesso;
begin
  Result := TCMTipoAcesso(ItemPorChave[N]);
  if (Result=nil) and (Count>0) then
    Result := Itens[0];
end;

function TCMTarifas.GetTarifa(I: Integer): TCMTarifa;
begin
  Result := TCMTarifa(GetItem(I));
end;

function TCMTarifas.GetTarifaPorCor(aTipoAcesso: Word; aCor: Integer): TCMTarifa;
var I : Integer;
begin
  for I := 0 to pred(Count) do with Itens[I] do
  if (TipoAcesso=aTipoAcesso) and (Cor=aCor) then begin
    Result := Itens[I];
    Exit;
  end;  
  Result := nil;
end;

constructor TCMTarifas.Create;
begin
  inherited Create(tcTarifa);
end;


{ TCMTarifa }

constructor TCMTarifa.Create;
begin
  inherited;
  FTipoAcesso := 0;
  FCor        := 0;
  FCorFonte   := 0;
  FReinicia   := False;
  FDescricao  := '';
  PrecosStr := '';
end;

function TCMTarifa.GetChave: Variant;
begin
  Result := IntToStr(FTipoAcesso)+'|'+IntToStr(Cor);
end;

function TCMTarifa.GetCor: Integer;
begin
  Result := FCor;
end;

function TCMTarifa.GetCorFonte: Integer;
begin
  Result := FCorFonte;
end;

function TCMTarifa.GetDescricao: String;
begin
  Result := FDescricao;
end;

function TCMTarifa.GetPPrecos: PCMEtapas;
begin
  Result := @FPrecos;
end;

function TCMTarifa.GetPrecosStr: String;
var 
  S: String;
  P : TCMEtapas;
begin
  if Length(FPrecos)>0 then begin
    SetLength(Result, Length(FPrecos)*SizeOf(TCMEtapa));
    Move(FPrecos[0], Result[1], Length(Result));
{    S := Result;
    SetLength(P, Length(S) div SizeOf(TCMEtapa));
    Move(S[1], P, Length(S));
    Result := Result;}
  end else
    Result := '';  
end;

function TCMTarifa.GetReinicia: Boolean;
begin
  Result := FReinicia;
end;

function TCMTarifa.GetTipoAcesso: Word;
begin
  Result := FTipoAcesso;
end;

procedure TCMTarifa.SetCor(Value: Integer);
begin
  FCor := Value;
end;

procedure TCMTarifa.SetCorFonte(Value: Integer);
begin
  FCorFOnte := Value;
end;

procedure TCMTarifa.SetDescricao(Value: String);
begin
  FDescricao := Value;
end;

procedure TCMTarifa.SetPrecosStr(Value: String);
begin
  if Value > '' then begin
    SetLength(FPrecos, Length(Value) div SizeOf(TCMEtapa));
    Move(Value[1], FPrecos[0], Length(Value));
    Value := '';
    if Length(FPrecos)=4949494 then {};
  end else
    SetLength(FPrecos, 0);
end;

procedure TCMTarifa.SetReinicia(Value: Boolean);
begin
  FReinicia := Value;
end;

procedure TCMTarifa.SetTipoAcesso(Value: Word);
begin
  FTipoAcesso := Value;
end;

function TCMTarifa.TempoTotal: Cardinal;
begin
  Result := TempoTotalArrayPrecos(FPrecos);
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

procedure TPassaporte.AjustaInicioExpirar(Inicio: TDateTime);
begin
  pctExpirou := pcExpirou;
  pctInicio := Inicio;
  pctUsadoMS := 0;
  pctExpirar := 0;
  if pctExpirou then Exit;
  case pcTipoExp of
    teDias        : pctExpirar := PrimeiroUso + pcExpirarEm;
    teHoras       : pctExpirar := PrimeiroUso + (pcExpirarEm / 24);
    teDataMarcada : pctExpirar := pcExpirarEm;
    teAcessos,
    teNunca       : pctExpirar := High(Cardinal);
  end;
  pctExpirou := ((pcTipoExp=teAcessos) and (pcAcessos>=pcExpirarEm)) or (TempoRestante(pctInicio)=0);
end;

function TPassaporte.GetHoraValida(D, H: Integer): Boolean;
begin
  Result := BitIsSet(pcHorasValidas[D], BitsH[H]);
end;

function ValorParaStr(Valor: Double): String;
begin
  Str(Valor:0:10, Result);
  while (Length(Result)>0) and (Result[Length(Result)]='0') do 
    Delete(Result, Length(Result), 1);
end;

function StrParaValor(S: String): Double;
var Code: Integer;
begin
  Val(S, Result, Code);
end;

function TPassaporte.ObtemStr: String;
begin
  Result :=
    IntToStr(pcNumero) + '|' +
    IntToStr(pcCliente) + '|' +
    IntToStr(pcTipoExp)+ '|' +
    IntToStr(pcTipoAcesso) + '|' +
    FormatDateTime('ddmmyyyyhhmmss', pcExpirarEm) + '|' +
    FormatDateTime('ddmmyyyyhhmmss', pcPrimeiroUso) + '|' +
    BoolStr[pcExpirou] + '|' +
    IntToStr(pcMaxSegundos) + '|' +
    IntToStr(pcSegundos) + '|' +
    IntToStr(pcAcessos) + '|' +
    pcSenha + '|' +
    BoolStr[pcValido] + '|' +
    ValorParaStr(pcValor) + '|' +
    HorasValidasToStr;
end;

procedure TPassaporte.HorasValidasFromStr(S: String);
var I : Integer;

function GetNextStr: String;
var P : Integer;
begin
  P := Pos('|', S);
  if P>0 then begin
    Result := Copy(S, 1, P-1);
    Delete(S, 1, P);
  end else begin
    Result := S;
    S := '';
  end;  
end;

begin
  for I := 1 to 7 do
    pcHorasValidas[I] := StrToIntDef(GetNextStr, 0);
end;

function TPassaporte.HorasValidasToStr: String;
var S: Integer;
begin
  Result := '';
  for S := 1 to 7 do begin
    if S>1 then Result := Result + '|';
    Result := Result + IntToStr(pcHorasValidas[S]);
  end;
end;

procedure TPassaporte.LoadFromDataset(D: TDataset);
var F : TField;
begin
  with D do begin
    FillChar(Self, SizeOf(Self), 0);

    F := FindField('Codigo');
    if F<>nil then pcCodigo := F.AsInteger;

    F := FindField('TipoPass');
    if F<>nil then pcCodigo := F.AsInteger;

    F := FindField('Numero');
    if F<>nil then pcNumero := F.AsInteger;

    F := FindField('Nome');
    if F<>nil then pcNome := F.AsString;

    F := FindField('Valor');
    if F<>nil then pcValor := F.AsCurrency;

    F := FindField('Cliente');
    if F<>nil then pcCliente := F.AsInteger;

    pcTipoExp := FieldByName('TipoExp').AsInteger;
    pcTipoAcesso := FieldByName('TipoAcesso').AsInteger;
    
    F := FindField('Senha');
    if F<>nil then pcSenha := F.AsString;

    F := FindField('Expirou');
    if F<>nil then pcExpirou := F.AsBoolean;

    F := FindField('Valido');
    pcValido := (F=nil) or F.AsBoolean;

    pcExpirarEm := FieldByName('ExpirarEm').AsDateTime;
    
    F := FindField('PrimeiroUso');
    if F<>nil then pcPrimeiroUso := F.AsDateTime;

    pcMaxSegundos := FieldByName('MaxSegundos').AsInteger;

    F := FindField('Segundos');
    if F<>nil then pcSegundos := F.AsInteger;

    F := FindField('Acessos');
    if F<>nil then pcAcessos := F.AsInteger;

    pcHorasValidas[1] := FieldByName('Dia1').AsInteger;
    pcHorasValidas[2] := FieldByName('Dia2').AsInteger;
    pcHorasValidas[3] := FieldByName('Dia3').AsInteger;
    pcHorasValidas[4] := FieldByName('Dia4').AsInteger;
    pcHorasValidas[5] := FieldByName('Dia5').AsInteger;
    pcHorasValidas[6] := FieldByName('Dia6').AsInteger;
    pcHorasValidas[7] := FieldByName('Dia7').AsInteger;
    
    pctExpirou := pcExpirou;
    pctUsadoMS := 0;
    pctInicio  := 0;
  end;
end;

function TPassaporte.ObtemTempo(Agora: TDateTime; Dia, H : Integer; DuracaoMS: Cardinal): Cardinal;
var TempoRes : Cardinal;
begin
  Result := 0;
  if (not HoraValida[Dia, H]) or pctExpirou or (not pcValido) then Exit;
  TempoRes := TempoRestante(Agora);
  pctExpirou := (TempoRes=0);
  if not pctExpirou then
    Result := MenorCardinal(DuracaoMS, TempoRes);
  pctUsadoMS := pctUsadoMS + Result;
end;

function TPassaporte.PrimeiroUso: TDateTime;
begin
  if (pcPrimeiroUso=0) then
    Result := pctInicio
  else
    Result := pcPrimeiroUso;  
end;

procedure TPassaporte.SaveToDataset(D: TDataset);
var F : TField;
begin
  with D do begin
    F := FindField('Cliente');
    if F<>nil then F.AsInteger := pcCliente;

    F := FindField('TipoPass');
    if F<>nil then F.AsInteger := pcCodigo;

    F := FindField('Nome');
    if F<>nil then F.AsString := pcNome;

    F := FindField('Valor');
    if F<>nil then F.AsCurrency := pcValor;

    FieldByName('TipoExp').AsInteger := pcTipoExp;
    FieldByName('TipoAcesso').AsInteger := pcTipoAcesso;
    
    F := FindField('Senha');
    if F<>nil then F.AsString := pcSenha;

    F := FindField('Expirou');
    if F<>nil then F.AsBoolean := pcExpirou;

    F := FindField('Valido');
    if F<>nil then F.AsBoolean := pcValido;
    
    FieldByName('ExpirarEm').AsDateTime := pcExpirarEm;

    F := FindField('PrimeiroUso');
    if F<>nil then F.AsDateTime := PrimeiroUso;

    FieldByName('MaxSegundos').AsInteger := pcMaxSegundos;

    F := FindField('Segundos');
    if F<>nil then F.AsInteger := pcSegundos;
    
    F := FindField('Acessos');
    if F<>nil then F.AsInteger := pcAcessos;
    
    FieldByName('Dia1').AsInteger := pcHorasValidas[1];
    FieldByName('Dia2').AsInteger := pcHorasValidas[2];
    FieldByName('Dia3').AsInteger := pcHorasValidas[3];
    FieldByName('Dia4').AsInteger := pcHorasValidas[4];
    FieldByName('Dia5').AsInteger := pcHorasValidas[5];
    FieldByName('Dia6').AsInteger := pcHorasValidas[6];
    FieldByName('Dia7').AsInteger := pcHorasValidas[7];
  end;
end;

procedure TPassaporte.SetHoraValida(D, H: Integer;
  const Value: Boolean);
begin
  pcHorasValidas[D] := SetBit(pcHorasValidas[D], BitsH[H], Value);
end;

procedure TPassaporte.LeStr(S: String);
var
  I : Integer;

function GetNextStr: String;
var P : Integer;
begin
  P := Pos('|', S);
  if P>0 then begin
    Result := Copy(S, 1, P-1);
    Delete(S, 1, P);
  end else begin
    Result := S;
    S := '';
  end;  
end;

begin
  pcNumero        := StrToIntDef(GetNextStr, 0);
  pcCliente       := StrToIntDef(GetNextStr, 0);
  pcTipoExp       := StrToIntDef(GetNextStr, 0);
  pcTipoAcesso    := StrToIntDef(GetNextStr, 0);
  pcExpirarEm     := StrParaData(GetNextStr);
  pcPrimeiroUso   := StrParaData(GetNextStr);
  pcExpirou       := (GetNextStr=BoolStr[True]);
  pcMaxSegundos   := StrToIntDef(GetNextStr, 0);
  pcSegundos      := StrToIntDef(GetNextStr, 0);
  pcAcessos       := StrToIntDef(GetNextStr, 0);
  pcSenha         := GetNextStr;
  pcValido        := (GetNextStr=BoolStr[True]);
  pcValor         := StrParaValor(GetNextStr);
  pctExpirou      := pcExpirou;
  pctUsadoMS      := 0;
  pctInicio       := 0;
  HorasValidasFromStr(S);
end;

function TPassaporte.TempoRestante(Agora: TDateTime): Cardinal;
begin
  if ((pcMaxSegundos=0) or ((pcSegundos+(pctUsadoMS div 1000))<pcMaxSegundos)) then
  begin
    if (pcMaxSegundos=0) then
      Result := High(Cardinal)
    else
      Result := (pcMaxSegundos*1000) - (pcSegundos*1000) - pctUsadoMS
  end else
    Result := 0;

  if Agora<pctExpirar then
    Result := MenorCardinal(DateTimeToTicks(pctExpirar-Agora), Result)
  else
    Result := 0;
end;

procedure TPassaporte.TotalizaUso;
begin
  pcExpirou := pctExpirou;
  if pctUsadoMS>0 then begin
    pcSegundos := pcSegundos + (pctUsadoMS div 1000);
    pcAcessos := pcAcessos + 1;
    pcPrimeiroUso := PrimeiroUso;
  end;  
end;

function TPassaporte.Igual(P: TPassaporte): Boolean;
begin
  Result := CompareMem(@Self, @P, SizeOf(P))
end;

function TPassaporte.GeraSenha: String;
begin
  Result := IntToHex(pcNumero+1000, 0)+Copy(GetMD5Str(IntToStr(pcNumero+1000)+'cyber'), 1, 4);
end;

procedure ObtemPassUsernameSenha(var Username, Senha: String);
var 
  U, S: String;
  I : Integer;
begin
  if Length(Username)>4 then begin
    S := Copy(Username, Length(Username)-3, 4);
    U := Copy(Username, 1, Length(Username)-4);
    I := StrToIntDef('$'+U, 0);
    if (I>1000) and (S=Copy(GetMd5Str(IntToStr(I)+'cyber'), 1, 4)) then begin
      Senha := Username;
      Username := 'PREPAGO';
    end;
  end;    
end;

{ TPassaportes }

function TPassaportes.AbateCreditos(Agora: TDateTime; Tempo: Cardinal): Cardinal;
var
  Dia, H, M, S, MS: Word;
  Falta, Abater, Abateu: Cardinal;
  I: Integer;
begin
  DecodeTime(Agora, H, M, S, MS);
  Dia := DayOfWeek(Agora);

  Falta := DateTimeToTicks(Agora - (Trunc(Agora) + EncodeTime(H, 0, 0, 0)));
  Falta := (1000 * 60 * 60) - Falta;
  Result := 0;
  Ordenar(Agora, H);
  if Count=0 then Exit;
  while Tempo>0 do begin
    Falta := MenorCardinal(Falta, Tempo);
    Abater := Falta;
    for I := 0 to Count-1 do
    if Abater > 0 then begin
      Abateu := Itens[I].ObtemTempo(Agora, Dia, H, Abater);
      Result := Result + Abateu;
      Abater := Abater - Abateu;
    end;
    Tempo := Tempo - Falta;
    Inc(H);
    if H=24 then begin
      Agora := Trunc(Agora)+1;
      H := 0;
    end else
      Agora := Trunc(Agora) + EncodeTime(H, 0, 0, 0);  
    Dia := DayOfWeek(Agora);
    Falta := 1000 * 60 * 60;
  end;  
end;

procedure TPassaportes.AddPassaporte(P: TPassaporte);
begin
  SetLength(Itens, Count+1);
  Itens[Count-1] := P;
end;

procedure TPassaportes.AjustaInicioExpirar(Inicio: TDateTime);
var I : Integer;
begin
  for I := 0 to Count-1 do
    Itens[I].AjustaInicioExpirar(Inicio);
end;

function TPassaportes.Count: Integer;
begin
  Result := Length(Itens);
end;

function TPassaportes.Igual(P: TPassaportes): Boolean;
var I : Integer;
begin
  Result := False;
  if Count<>P.Count then Exit;
  for I := 0 to Count-1 do
  if not Itens[I].Igual(P.Itens[I]) then Exit;
  Result := True;
end;

procedure TPassaportes.LeStr(S: String);
var
  SL : TStrings;
  I  : Integer;
begin
  SL := TStringList.Create;
  try
    SL.Text := S;
    SetLength(Itens, SL.Count);
    for I := 0 to SL.Count-1 do
      Itens[I].LeStr(SL[I]);
  finally
    SL.Free;
  end;
end;

procedure TPassaportes.Limpa;
begin
  SetLength(Itens, 0);
end;

function TPassaportes.ObtemStr: String;
var
  SL : TStrings;
  I  : Integer;
begin
  SL := TStringList.Create;
  try
    for I := 0 to Count-1 do
      SL.Add(Itens[I].ObtemStr);
    Result := SL.Text;  
  finally
    SL.Free;
  end;
end;

procedure TPassaportes.Ordenar(Data: TDateTime; H: Byte);
var 
  P : TPassaporte;
  A : TArrayPassaporte;
  I, Prox, Qtd : Integer;
  DS : Byte;

function MenorTempoRes: Integer;
var 
  Restam: Cardinal;
  x : Integer;
begin
  Result := -1;
  Restam := High(Cardinal);
  for x := 0 to Qtd-1 do with A[x] do 
  if (pcNumero<>-1) and ((pctTempoRes<Restam) or (Result=-1)) then begin
    Result := x;
    Restam := pctTempoRes;
  end;  
end;

begin
  Data := Trunc(Data) + EncodeTime(H, 0, 0, 0);
  if SData=Data then Exit;
  SData := Data;
  DS := DayOfWeek(SData);
  Qtd := Count;
  SetLength(A, Qtd);
  for I := 0 to Qtd-1 do with A[I] do begin
    A[I] := Itens[I];
    pctTempoRes := ObtemTempo(SData, DS, H, High(Cardinal));
    pctUsadoMS  := pctUsadoMS - pctTempoRes;
  end;  
  for I := 0 to Qtd-1 do begin
    Prox := MenorTempoRes;
    Itens[I] := A[Prox];
    A[Prox].pcNumero := -1;
  end;
end;

function TPassaportes.TempoUsadoTotal: Cardinal;
var I : Integer;
begin
  Result := 0;
  for I := 0 to Count-1 do Result := Result + Itens[I].pctUsadoMS;
end;

procedure TPassaportes.TotalizaUso;
var I : Integer;
begin
  for I := 0 to Count-1 do Itens[I].TotalizaUso;
end;

end.

TCMPausa
  Inicio   Ticks
  Duracao  Ticks

TCMArrayPausa : Array of TCMPausa;  
  
Maquina
  Num           001
  IP            192.168.0.123
  ComputerName
  Grupo         XXXX
  Desktop       Programas Permitidos
  Status        Livre, Ocupada, Em Manutencao
  Sessao        Integer

Sessao
  Maquina      : 
  InicioTicks  : 
  Cliente      :
  Obs          :
  Passaportes  :
  Pausas       : TCMArrayPausa;
  
  TempoTotal   :
  TempoPausado : 
  TempoPrePago :
  TempoPosPago :
  TempoGratis  : 

  ValorPosPago : $$$$

SessaoHorario
  Sessao : ID
  Isento : Boolean
  Data   : Date
  Hora   : Byte;
  Minutos: Double;

  
  FInicio           : TDateTime;
    FContato          : Integer;
    FObsAcesso        : String;
    FNomeContato      : String;
    FInicioTicks      : Cardinal;
    FTempoTicks       : Cardinal;
    FCliente          : Integer;
    FAcesso           : Integer;
    FIsento           : Boolean;
    FCreditoCli       : Cardinal;
    FFimTicks         : Cardinal;
    FLimiteTempo      : Cardinal;
    FProgramaAtual    : String;
    FPediuTela        : Boolean;
    FUserObj          : TObject;
    FParadoTicks      : Cardinal;
    FParadoTicksAtual : Cardinal;
    FParado           : Boolean;
    FParadoInicio     : Cardinal;
    FMenu             : String;
    FRecursos         : String;
    FTipoAcesso       : Word;
    FSinal            : Double;
    FVendas           : Double;
    FLiberaAlemPacote : Boolean;
    FTicksParadoPac   : Cardinal;
    FComputerName     : String;
    FAguardaPagto     : Boolean;
    FUsuarioI         : String;
    FCaixa            : Integer;
    FTipoTran         : Byte;
    FPassaportes      : TPassaportes;
    FPrePago          : Boolean;
   


Ordem de uso de pré-pago
1. Usar primeiro pre-pagos que expiram

Tipo de Crédito:
0 - Crédito de Tempo Pré-Determinado
1 - Crédito de Valor Pré-Determinado
2 - Crédito de Valor Pós-Determinado


1$ = 1t

Sessao 
  Pausas     
  Tarifador

  Tipos de Pausa  
  - Limite de Tempo
  - Fim de Crédito
  - Manual


