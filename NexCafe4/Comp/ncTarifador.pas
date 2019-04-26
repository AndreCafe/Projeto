unit ncTarifador;

{ 
Ajustar re-ordenação de passaportes a cada hora
Evitar expiração de passaportes indevidamente
}

interface

uses
  SysUtils,
  DB,
  MD5,
  Classes,
  Windows,
  ClasseCS,
  ncClassesBase,
  ncPassaportes;

type  

  TncPausa = class
    pInicio  : TDateTime;
    pFim     : TDateTime;
    constructor Create;
    
    function DuracaoT: Cardinal;
    function DuracaoM: Double;
  end;

  TncPausas = class
  private 
    FItens  : TList;
    function GetItem(Index: Integer): TncPausa;
    function GetString: String;
    
    procedure SetString(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;
    
    procedure Limpa;
    function Count : Integer;
    function NewPausa: TncPausa;

    function TicksTotal: Cardinal;
    function DTTotal: TDateTime;  

    function TicksPausaEtapa(aInicioE, aFimE: TDateTime): Cardinal;

    property Itens[Index: Integer]: TncPausa
      read GetItem; default;

    property AsString: String
      read GetString write SetString;  
  end;      

  TncTarifador = class 
    FInicio       : TDateTime;
    FAgora        : TDateTime;
    FNumTicks     : Cardinal;
    FTicksR       : Cardinal;
    FCredito      : TncTempo;
    FTipoAcessoObj: TncTipoAcesso;
    FPassaportes  : TncPassaportes;
    FPausas       : TncPausas;
    FTempoCobrado : Cardinal;
    FCreditoR     : Cardinal;
    FCredValor    : Double;
    FValor        : Double;
    FDia, FHora   : Byte;
    FNumTicksI, 
    FTicksPreco   : Cardinal; 
    FEtapa        : Integer;
    FRestoT       : Extended;
    FResto        : Extended;
    FTarifa,
    FTarifaA      : TncTarifa;
    FResetar      : Boolean;
    FSomandoResto : Boolean;
    FPosPago      : Boolean;
    FCreditoTotal : Cardinal;
    FCredTotalG   : Cardinal;
    FTicksTEtapa  : Cardinal;
    FPrimeiraEtapa: Boolean;
    FTicksResPass : Cardinal;

    FTempoRes, 
    FTol         : Cardinal; 
    FPrecoRes    : Double;
    FTipoCalc    : Byte;
    FIsento      : Boolean;
    FCredProporcional : Boolean;

    FCredValorT  : Cardinal;
    FSemTolerancia : Boolean;

  private
    procedure AtualizaDiaH;
    procedure AvancaProxHora;
    function CalculaEtapaTarifacao(aTempo, aTol: Cardinal; aPreco: Double): Boolean;
    function CalculaEtapaTempoValor(aTempo, aTol: Cardinal; aPreco: Double): Boolean;
    function CalculaEtapaTempoCred(aTempo, aTol: Cardinal; aPreco: Double): Boolean;
    function Calcular(aTempoCalc, aTempoCorrido: Cardinal): Boolean;
  protected  
    function GetIsento: Boolean;
    function GetHoraTarifa(D, H: Integer): TncTarifa;
    function GetInicio: TDateTime;
    function GetIDTipoAcesso: Integer;
    function GetCredValor: Double;
    function GetTipoCalc: Byte;
    function GetValor: Double;
    function GetCreditoTotal: TncTempo;
    function GetTempoCobrado: TncTempo;
    
    procedure SetCredito(const Value: TncTempo);
    procedure SetInicio(const Value: TDateTime);
    procedure SetTipoCalc(const Value: Byte);
    procedure SetCredValor(const Value: Double);
    procedure SetNumTicks(const Value: Cardinal);
    procedure SetIsento(const Value: Boolean);
    procedure SetIDTipoAcesso(const Value: Integer);

  public
    constructor Create;
    destructor Destroy; override;
    
    procedure Reset; 
    function Cronometro: TncTempo; 
    function CronometroStr: String;
    function CredTempoUsado: TncTempo;
    function CredValorUsado: Currency;
    function PCredito: PncTempo;
    procedure ZeraVars; 

    procedure CalculaCreditoTotal(aZeraVars: Boolean = True);

    function CredValorETempo: TncTempo;
    
    function TempoCredValor(aCredProporcional: Boolean): Cardinal; // Obtem o tempo correspondente ao crédito em valor (FCredValor)

    property TicksResPass: Cardinal read FTicksResPass;

    property CredTotalG: Cardinal read FCredTotalG;

    property NumTicks: Cardinal
      read FNumTicks write SetNumTicks;

    property IDTipoAcesso: Integer
      read GetIDTipoAcesso Write SetIDTipoAcesso;
       
    property Inicio : TDateTime
      read GetInicio write SetInicio;

    property Credito : TncTempo
      read FCredito;

    property Passaportes : TncPassaportes
      read FPassaportes;

    property Pausas : TncPausas
      read FPausas;

    property CredValor: Double
      read GetCredValor write SetCredValor;

    property CreditoTotal: TncTempo
      read GetCreditoTotal;

    property TipoCalc: Byte
      read GetTipoCalc write SetTipoCalc;  

    property Valor: Double
      read GetValor;

    property Isento: Boolean
      read GetIsento write SetIsento;  

    property TempoCobrado: TncTempo 
      read GetTempoCobrado;

    property SemTolerancia: Boolean 
      read FSemTolerancia write FSemTolerancia; 
  end; 

const
  // Tipos de calculos realizados pela classe Tarifador
  tcTarifacao  = 0;
  tcTempoCred  = 1;
  tcTempoValor = 2;

var
  HoraTarBranco : TncHoraTarifa;  

implementation

{ TncPausas }

 
constructor TncPausa.Create;
begin
  pInicio := 0;
  pFim := 0;
end;

function TncPausa.DuracaoM: Double;
begin
  Result := (pFim - pInicio) * 24 * 60;
end;

function TncPausa.DuracaoT: Cardinal;
begin
  Result := DateTimeToTicks(pFim - pInicio);
end;

procedure TncPausas.Limpa;
begin
  while FItens.Count>0 do begin
    Itens[0].Free;
    FItens.Delete(0);
  end;
end;

constructor TncPausas.Create;
begin
  FItens := TList.Create;
end;

destructor TncPausas.Destroy;
begin
  Limpa;
  FItens.Free;
  inherited;
end;

function TncPausas.NewPausa: TncPausa;
begin
  Result := TncPausa.Create;
  FItens.Add(Result);
end;

function TncPausas.DTTotal: TDateTime;
begin
  Result := TicksToDateTime(TicksTotal);
end;

function TncPausas.GetItem(Index: Integer): TncPausa;
begin
  Result := TncPausa(FItens[Index]);
end;

function TncPausas.Count: Integer;
begin
  Result := FItens.Count;
end;

function TncPausas.GetString: String;
var 
  I : Integer;
begin
  Result := '';
  for I := 0 to Count-1 do 
  with Itens[I] do begin
    if I > 0 then
      Result := Result + sLineBreak;
    Result := Result + GetDTStr(pInicio) + '@' + GetDtStr(pFim);
  end;
end;

procedure TncPausas.SetString(const Value: String);
var 
  SL : TStrings;
  S : String;
  I ,P : Integer;
  aInicio, aFim : TDateTime;
begin
  Limpa;
  SL := TStringList.Create;
  try
    SL.Text := Value;
    for I := 0 to SL.Count - 1 do begin
      S := SL[I];
      P := Pos('@', S);
      if P > 0 then begin
        aInicio := DTFromStr(Copy(S, 1, P-1));
        if aInicio>0 then begin
          aFim := DTFromStr(Copy(S, P+1, 50));
          if aFim>aInicio then with NewPausa do begin
            pInicio := aInicio;
            pFim := aFim;
          end;
        end;
      end;
    end;
  finally
    SL.Free;
  end;
end;

function TncPausas.TicksTotal: Cardinal;
var I : Integer;
begin
  Result := 0;
  for I := 0 to pred(Count) do 
    Result := Result + Itens[I].DuracaoT;
end;

function TncPausas.TicksPausaEtapa(aInicioE, aFimE: TDateTime): Cardinal;
var I : Integer;
begin
  Result := 0;
  for I := 0 to pred(Count) - 1 do
  with Itens[I] do 
  if ((aInicioE >= pInicio) and (aInicioE <= pFim)) or 
     ((aFimE >=pInicio) and (aFimE <= pFim)) or
     ((aInicioE < pInicio) and (aFimE > pFim)) then
    Result := DuracaoT;
end;

procedure CalcRestoTempo(Preco, Valor: Double; Tempo: Cardinal; var Resto: Extended; var T: Cardinal);
begin
  if Preco > 0.00001 then begin
    Resto := (Valor / Preco) * Tempo;
    T := Trunc(Resto);
    Resto := Frac(Resto);
  end else begin
    Resto := 0;
    T := Tempo;
  end;  
end;

procedure TncTarifador.AtualizaDiaH;
var Hour, Min, Sec, MSec : Word;
begin
  FDia := DayOfWeek(FAgora);
  DecodeTime(FAgora, Hour, Min, Sec, MSec);
  FHora := Hour;
end;

procedure TncTarifador.AvancaProxHora;
var Hour, Min, Sec, MSec : Word;
begin
  DecodeTime(FAgora, Hour, Min, Sec, MSec);
  if Hour=23 then begin
    FAgora := FAgora + 1;
    FHora := 0;
  end else
    FHora := Hour+1;
  FAgora := Trunc(Int(FAgora)) + EncodeTime(FHora, 0, 0, 0);
  FDia := DayOfWeek(FAgora);
end; 

function TncTarifador.CalculaEtapaTarifacao(aTempo, aTol: Cardinal; aPreco: Double): Boolean;
var
  RestoI: Integer;
  TempoR,
  TempoP : Cardinal;
  InicioE, FimE : TDateTime;
begin
  Result := False;
  
  FTempoRes   := aTempo;
  FPrecoRes   := aPreco;

  if (aTempo=0) then Exit;

  InicioE := FAgora;
  
  if not FSomandoResto then begin
    FRestoT := FRestoT + FResto;
    RestoI := Trunc(FRestoT);
    if RestoI > 0 then begin
      aTempo := aTempo + RestoI;
      FRestoT := FRestoT - RestoI;
    end;  
    FTempoCobrado := FTempoCobrado + aTempo;
    FTicksTEtapa := MenorCardinal(aTempo, FTicksR);
    aTol := glTolerancia;
    if aTol>(aTempo div 2) then  
      aTol := (aTempo div 2);
    FTol := aTol;  
  end else 
    FTicksTEtapa := FTicksTEtapa + MenorCardinal(aTempo, FTicksR);

  if FSemTolerancia then FTol := 0;
  
  if FPassaportes.Count>0 then begin
    TempoP := FPassaportes.AbateCreditos(FTipoAcessoObj.ID, FAgora, MenorCardinal(aTempo, FTicksR));
    TempoR := MenorCardinal(aTempo, FTicksR) - TempoP;
  end else begin
    TempoP := 0;
    TempoR := MenorCardinal(aTempo, FTicksR);
  end;    

  if TempoR > 0 then begin
    if FCreditoR >= TempoR then begin
       FCreditoR := FCreditoR - TempoR;
{      if (FTicksR<aTempo) then
        FCreditoR := FCreditoR - MenorCardinal(aTempo-TempoP, FCreditoR) else
        FCreditoR := FCreditoR - TempoR;  }
    end else begin
      FCreditoR := 0;
      if FPrimeiraEtapa or (FTicksTEtapa > FTol) then begin
        if (FTicksR<aTempo) and FCredProporcional then
          FValor := FValor + ((FTicksR/aTempo) * aPreco) else
          FValor := FValor + aPreco;
        FPrecoRes := 0;
        FPrimeiraEtapa := False;
      end;
    end;
  end;

  if aTempo>FTicksR then
    FTempoRes := aTempo-FTicksR else
    FTempoRes := 0;

    
  if (FTicksR<=aTempo) {or (FTicksR<(aTempo+FTol))} then begin
    FAgora := FAgora + TicksToDateTime(FTicksR);
    FTicksR := 0;
  end else begin
    FTicksR := FTicksR - aTempo;
    FAgora := FAgora + TicksToDateTime(aTempo);
  end;  
  if FTempoRes=0 then begin
    FimE := FAgora;
    FAgora := FAgora + TicksToDateTime(FPausas.TicksPausaEtapa(InicioE, FimE));
  end;
  AtualizaDiaH;
  FSomandoResto := False;
  Result := True;
end;

procedure TncTarifador.SetNumTicks(const Value: Cardinal);
begin
  if FNumTicks=Value then Exit;
  if Value<FNumTicks then Reset;

  if FResetar then 
    Reset;
    
  FTipoCalc := tcTarifacao;
    
  FTicksR := Value - FNumTicks;
  
  if (FNumTicks>0) and (FTempoRes>0) then begin
    { Estamos na continuação de um cálculo, temos então que terminar o cálculo da ultima 
      etapa que estávamos }
    FSomandoResto := True;
    try
      CalculaEtapaTarifacao(FTempoRes, FTol, FPrecoRes);
    finally
      FSomandoResto := False;
    end;
  end;  

  while (FTicksR > 50) do 
    if not Calcular(FTicksR, Value-FTicksR) then begin
      // Houve uma falha no cáculo. Zerar valor e desistir da tarifação
      FValor := 0;
      Exit;
    end;
    
  FNumTicks := Value;
end;      

function TncTarifador.Calcular(aTempoCalc, aTempoCorrido: Cardinal): Boolean;
var 
  T: Cardinal;
  Avancou, aDia, aHora : Byte;
begin
  Result := False;

  { 1a coisa é obter a Tarifa para a hora que estamos calculando. FHoraTarifa é uma matriz
    que contém a cor da tarifa a ser usada para cada hora e dia da semana. 
      
    O código de cor é guardado em FTarifaAI e é a chave para obter o objeto TncTarifa que
    contém os detalhes necessários para a tarifação. FTarifa e FTarifaA guardam a referencia
    para o TncTarifa. FTarifaA é um cache }
            
  if (FTarifaA<>nil) and (FTarifaA=GetHoraTarifa(FDia, FHora)) then
    FTarifa := FTarifaA
    { Tarifa atual igual anterior então usamos o cache }
  else begin 

    { Mudou a tarifa, temos que atualizar nosso objeto }
      
    FTarifa := GetHoraTarifa(FDia, FHora);

    { Se FTarifa=nil significa que não existe nenhuma Tarifa associada ao horário que estamos,
      portanto vamos avançando no tempo até encontrar uma hora seguinte q tenha 
      uma tarifa associada. Mas pode ser que a tabela toda não tenha nenhuma tarifa associada, 
      nesse caso temos que abortar a Tarifação para não entrar em Loop Infinito }
         
    Avancou := 0;
    aDia := FDia;
    aHora := FHora;
    while (FTarifa=nil) and (Avancou<24) do begin
      if aHora<23 then 
        Inc(aHora) else
      begin
        aHora := 0;
        if aDia<7 then
          Inc(aDia) else
          aDia := 1;
      end;  
      FTarifa := GetHoraTarifa(aDia, aHora);
      Inc(Avancou);
    end;
      
    if (FTarifa=nil) {and (Avancou>=24)} then 
      Exit;
      // Rodamos 24H e não encontramos nenhuma tarifa então desistimos da tarifação
  end;  
    
  { Uma cor pode ter várias etapas de tarifação, em qual estamos ? }
  if (FTarifa<>FTarifaA) then begin
    { Mudou de cor. Cada cor tem suas etapas e regras de tarifação.
      O Tempo Corrido na Cor Anterior ajuda a determinar em qual etapa da 
      próxima cor o sistema deve continuar a tarifacao }
        
    { Obtem o indice da etapa de preço atual }
    FEtapa := FTarifa.ObtemIndProxPreco(aTempoCorrido);
    FTicksPreco := aTempoCorrido;
  end else
  if ((aTempoCorrido-FTicksPreco) >= FTarifa.PPrecos^[FEtapa].etTempo) then begin
    { Não mudou a cor. Mas o tempo já é maior que o definido para essa etapa }
    if (FEtapa < High(FTarifa.PPrecos^)) then begin
      { Ainda existe existe mais etapas nessa tarifa. Devemos avançar para próxima então }
      Inc(FEtapa);
      FTicksPreco := aTempoCorrido;
    end else begin
    { Não existe mais etapas nessa tarifa. Obter a próxima tarifa a ser repetida }
      FEtapa := FTarifa.IndiceRepetir;
      FTicksPreco := aTempoCorrido;
    end;
  end;
    
  if (FEtapa>=0) then 
  with FTarifa.PPrecos^[FEtapa] do begin
    { Retorna em T qual é o tempo correspondente à fração mínima e tb o resto 
      dessa regra de 3 em FResto }
    CalcRestoTempo(etValor, etValorMin, etTempo, FResto, T);
      
    { Tarifar (no máximo) uma fatia de tempo de Fração Mínima }
    case FTipoCalc of
      tcTarifacao  : if not CalculaEtapaTarifacao(T, etTolerancia, etValorMin) then Exit;
      tcTempoCred  : if not CalculaEtapaTempoCred(T, etTolerancia, etValorMin) then Exit;
      tcTempoValor : if not CalculaEtapaTempoValor(T, etTolerancia, etValorMin) then Exit;
    end;  
  end else 
    // Etapa inválida entao desistimos da Tarifação
    Exit;
      
  FTarifaA := FTarifa;
  Result := True;
end;

constructor TncTarifador.Create;
begin
  FTipoAcessoObj := nil;
  FCreditoTotal := 0;
  FCredTotalG := 0;
  FPassaportes  := TncPassaportes.Create;
  FPausas := TncPausas.Create;
  FNumTicks := 0;
  FCredValor := 0;
  FIsento := False;
  FCredito.Minutos := 0;
  FTipoCalc := tcTarifacao;
  FSemTolerancia := False;
  FCredValorT := 0;
  FTicksResPass := 0;
  Reset;
end;

procedure TncTarifador.SetCredito(const Value: TncTempo);
begin
  if FCredito.Minutos=Value.Minutos then Exit;
  FCredito.Minutos := Value.Minutos;
  FResetar := True;
end;

procedure TncTarifador.SetInicio(const Value: TDateTime);
begin
  if FInicio=Value then Exit;
  FInicio := Value;
  FResetar := True;
end;

procedure TncTarifador.SetIDTipoAcesso(const Value: Integer);
begin
  FTipoAcessoObj := gTiposAcesso.PorCodigo[Value];
  FResetar := True;
end;

procedure TncTarifador.SetTipoCalc(const Value: Byte);
begin
  if FTipoCalc=Value then Exit;
  FTipoCalc := Value;
  Reset;
end;

procedure TncTarifador.SetCredValor(const Value: Double);
begin
  if FCredValor=Value then Exit;
  FCredValor := Value;
  FResetar := True;
end;

function TncTarifador.TempoCredValor(aCredProporcional: Boolean): Cardinal;
begin
  Result := 0;
  ZeraVars;
  if FCredValor < 0.00000001 then Exit;
  
  FCredProporcional := aCredProporcional;
  try
    FTipoCalc := tcTempoValor;
    FValor := 0;
    FNumTicks := 0;
    while (FValor <= FCredValor) and Calcular(0, FNumTicks) do {};
    Result := FNumTicks;
  finally
    FCredProporcional := False;
  end;
end;

function TncTarifador.CredValorETempo: TncTempo;
begin
  Result.Ticks := PCredito^.Ticks + FCredValorT;
end;

function TncTarifador.CalculaEtapaTempoValor(aTempo, aTol: Cardinal; aPreco: Double): Boolean;
var
  RestoI: Integer;
begin
  Result := False;
  if (aTempo=0) then Exit;
  
  FRestoT := FRestoT + FResto;
  RestoI := Trunc(FRestoT);
  if RestoI > 0 then begin
    aTempo := aTempo + RestoI;
    FRestoT := FRestoT - RestoI;
  end;  

  if ((FValor + aPreco) - FCredValor) >= 0.00001 then begin
    if FCredProporcional then
      FNumTicks := FNumTicks + Trunc(((FCredValor - FValor) / aPreco) * aTempo);
    FValor := FCredValor + 1;
  end else begin
    FNumTicks := FNumTicks + aTempo;
    FValor := FValor + aPreco;
  end;
  
  FAgora := FAgora + TicksToDateTime(aTempo);
  AtualizaDiaH;

  Result := True;
end;

function TncTarifador.CalculaEtapaTempoCred(aTempo, aTol: Cardinal;aPreco: Double): Boolean;
var
  RestoI: Integer;
  TempoP : Cardinal;
begin
  Result := False;
  if (aTempo=0) then Exit;
  
  FRestoT := FRestoT + FResto;
  RestoI := Trunc(FRestoT);
  if RestoI > 0 then begin
    aTempo := aTempo + RestoI;
    FRestoT := FRestoT - RestoI;
  end;  

  if FPassaportes.Count>0 then 
    TempoP := FPassaportes.AbateCreditos(FTipoAcessoObj.ID, FAgora, aTempo)
  else 
    TempoP := 0;

  if (FCreditoR+TempoP) < aTempo then begin
    FNumTicks := FNumTicks + FCreditoR + TempoP;
    FValor := 1;
    FCreditoR := 0;
  end else begin
    FNumTicks := FNumTicks + aTempo;
    FCreditoR := FCreditoR - (aTempo - TempoP);
  end;

  FAgora := FAgora + TicksToDateTime(aTempo);
  AtualizaDiaH;
  Result := True;
end;

function TncTarifador.GetCreditoTotal: TncTempo;
begin
  Result.Ticks := FCreditoTotal;
end;

function TncTarifador.GetTempoCobrado: TncTempo;
begin
  Result.Ticks := FTempoCobrado;
end;

function TncTarifador.GetCredValor: Double;
begin
  Result := FCredValor;
end;

function TncTarifador.GetHoraTarifa(D, H: Integer): TncTarifa;
begin
  if FTipoAcessoObj<>nil then
    Result := FTipoAcessoObj.TarifaHoraObj(D, H) else
    Result := nil;;
end;

function TncTarifador.GetInicio: TDateTime;
begin
  Result := FInicio;
end;

function TncTarifador.GetIDTipoAcesso: Integer;
begin
  if FTipoAcessoObj=nil then
    Result := -1 else
    Result := FTipoAcessoObj.ID;
end;

function TncTarifador.GetTipoCalc: Byte;
begin
  Result := FTipoCalc;
end;

function TncTarifador.GetValor: Double;
begin             
  if FIsento then
    Result := 0 else  
    Result := FValor;
end;

function TncTarifador.PCredito: PncTempo;
begin
  Result := @FCredito;
end;

function TncTarifador.CredTempoUsado: TncTempo;
begin
  if (FCreditoR >= FCredito.Ticks) then
    Result.Ticks := 0 else
    Result.Ticks := FCredito.Ticks - FCreditoR;
end;

function TncTarifador.CredValorUsado: Currency;
var Tar: TncTarifador;
begin
  if (FCreditoR <= FCredito.Ticks) then
    Result := FCredValor
  else begin
    Tar := TncTarifador.Create;
    try
      Tar.IDTipoAcesso := IDTipoAcesso;
      Tar.Inicio := Inicio;
      Tar.FCredProporcional := True;
      Tar.NumTicks := FCreditoR - FCredito.Ticks;
      Tar.SemTolerancia := True;
      Result := FCredValor - Tar.Valor;
    finally
      Tar.Free;
    end;
  end;
end;

function TncTarifador.GetIsento: Boolean;
begin
  Result := FIsento;
end;

procedure TncTarifador.SetIsento(const Value: Boolean);
begin
  FIsento := Value;
end;

procedure TncTarifador.CalculaCreditoTotal(aZeraVars: Boolean= True);
var FSalvaCred: Extended;
begin
  FTipoCalc := tcTempoCred;
  ZeraVars;
  FValor := 0;
  FCreditoTotal := 0;
  FCredTotalG := 0;
  FTicksResPass := 0;
  FNumTicks := 0;
  if FTipoAcessoObj<>nil then
    FCredTotalG := FPassaportes.TempoTotalDisp(FTipoAcessoObj.ID, FAgora) + FCredito.Ticks + FCredValorT;
  try
    while (FValor <= 0.01) and Calcular(0, FNumTicks) do {};
    if FTipoAcessoObj<>nil then
      FTicksResPass := FPassaportes.TempoRestanteTotal(FAgora);
    FCreditoTotal := FNumTicks;      
  finally
    if aZeraVars then ZeraVars;
  end;    
end;

function TncTarifador.Cronometro: TncTempo;
begin
  if FCreditoTotal>FNumTicks then
    Result.Ticks := FCreditoTotal - FNumTicks else
    Result.Ticks := FNumTicks - FCreditoTotal;  
end;

function TncTarifador.CronometroStr: String;
begin
  Result := FormatDateTime('hh:mm:ss', Cronometro.DateTime);
end;

destructor TncTarifador.Destroy;
begin
  FPassaportes.Free;
  FPausas.Free;
  inherited;
end;

procedure TncTarifador.Reset;
begin
  try
    FCredValorT := TempoCredValor(True);
    if FPassaportes.Count>0 then 
      CalculaCreditoTotal 
    else begin
      FCreditoTotal := FCredito.Ticks + FCredValorT;
      FCredTotalG := FCreditoTotal;
    end;
  finally
    ZeraVars;
  end;
end;

procedure TncTarifador.ZeraVars;
begin
  FTempoRes   := 0;
  FTol        := 0;
  FPrecoRes   := 0;
  FPrimeiraEtapa := True;
  FResetar := False;
  FValor := 0;
  FAgora := FInicio;
  if FPassaportes.Count>0 then
    FPassaportes.ZeraInicioUso;
  FTempoCobrado := 0;
  FCreditoR := FCredito.Ticks + FCredValorT;
  AtualizaDiaH;
  FNumTicksI := 0;
  FRestoT := 0;
  FResto := 0;
  FTarifaA := nil;
  FTicksPreco := 0;
  FTicksR := 0;
  FNumTicks := 0;
end;


initialization
  Fillchar(HoraTarBranco, SizeOf(HoraTarBranco), 0);

end.
