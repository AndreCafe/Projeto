unit cmTarifador;

interface

uses
  SysUtils,
  Classes,
  cmClassesBase;

type  

  TncPausa = record
    pInicio  : Cardinal;
    pDuracao : Cardinal;
  end;

  PncPausa = ^TncPausa;

  TncArrayPausas = Array of TncPausa;

  TncPausas = class
  private 
    FPausas : TncArrayPausas;
    function GetQuantidade: Integer;
    function GetItem(Index: Integer): PncPausa;
    function GetString: String;
    
    procedure SetString(const Value: String);
  public
    constructor Create;
    destructor Destroy; override;

    function TicksTotal: Cardinal;
    function DTTotal: TDateTime;  

    procedure Adiciona(aInicio, aDuracao: Cardinal);
    
    property Itens[Index: Integer]: PncPausa
      read GetItem; default;

    property Quant: Integer
      read GetQuantidade;

  published    
    property AsString: String
      read GetString write SetString;  
  end;      
    
  TncTarifador = class ( TncTarifadorBase )
    FInicio      : TDateTime;
    FAgora       : TDateTime;
    FNumTicks    : Cardinal;
    FTicksR      : Cardinal;
    FCredito     : Cardinal;
    FTipoAcesso  : Word;
    FHoraTarifa  : PncHoraTarifa;
    FPassaportes : PPassaportes;
    FTempoCobrado: Cardinal;
    FCreditoR    : Cardinal;
    FCredValor   : Double;
    FValor       : Double;
    FDia, FHora  : Byte;
    FNumTicksI, 
    FTicksTarifa, 
    FTicksPreco  : Cardinal; 
    FTarifaAI       : Integer;
    FEtapa       : Integer;
    FRestoT      : Extended;
    FResto       : Extended;
    FTarifa,
    FTarifaA     : TncTarifa;
    FResetar     : Boolean;
    FSomandoResto: Boolean;
    FPosPago     : Boolean;
    FCreditoTotal: Cardinal;

    FTempoRes, 
    FTol        : Cardinal; 
    FPrecoRes   : Double;
    FTipoCalc   : Byte;
    FIsento     : Boolean;

  private
    procedure AtualizaDiaH;
    procedure AvancaProxHora;
    function CalculaEtapaTarifacao(aTempo, aTol: Cardinal; aPreco: Double): Boolean;
    function CalculaEtapaTempoValor(aTempo, aTol: Cardinal; aPreco: Double): Boolean;
    function CalculaEtapaTempoCred(aTempo, aTol: Cardinal; aPreco: Double): Boolean;
    function Calcular(aTempoCalc: Cardinal): Boolean;
    function CreditoUsado: Cardinal;
    

  protected  
    function GetIsento: Boolean; override;
    function GetNumTicks: Cardinal; override;
    function GetCredito: Cardinal; override;
    function GetHoraTarifa: PncHoraTarifa; override;
    function GetInicio: TDateTime; override;
    function GetPassaportes: PPassaportes; override;
    function GetTipoAcesso: Word; override;
    function GetCredValor: Double; override;
    function GetTipoCalc: Byte; override;
    function GetValor: Double; override;
    
    
    procedure SetCredito(const Value: Cardinal); override;
    procedure SetHoraTarifa(const Value: PncHoraTarifa); override;
    procedure SetInicio(const Value: TDateTime); override;
    procedure SetPassaportes(const Value: PPassaportes); override;
    procedure SetTipoAcesso(const Value: Word); override;
    procedure SetCredValor(const Value: Double); override;
    procedure SetNumTicks(const Value: Cardinal); override;
    procedure SetIsento(const Value: Boolean); override;

    procedure CalculaCreditoTotal;
    procedure ZeraVars; 
    
  public
    constructor Create;
    
    procedure Reset; override;
    function Cronometro: Cardinal; override;
    function CronometroStr: String; override;
    function TempoCredValor: Cardinal; override; // Obtem o tempo correspondente ao crédito em valor (FCredValor)
  end; 

const
  // Tipos de calculos realizados pela classe Tarifador
  tcTarifacao  = 0;
  tcTempoCred  = 1;
  tcTempoValor = 2;

implementation

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
begin
  Result := False;
  
  FTempoRes   := aTempo;
  FTol        := aTol;
  FPrecoRes   := aPreco;

  if (aTempo=0) then Exit;
  
  if not FSomandoResto then begin
    FRestoT := FRestoT + FResto;
    RestoI := Trunc(FRestoT);
    if RestoI > 0 then begin
      aTempo := aTempo + RestoI;
      FRestoT := FRestoT - RestoI;
    end;  
    FTempoCobrado := FTempoCobrado + aTempo;
  end;  

  if FPassaportes<>nil then begin
    TempoP := FPassaportes^.AbateCreditos(FAgora, MenorCardinal(aTempo, FTicksR));
    TempoR := MenorCardinal(aTempo, FTicksR) - TempoP;
  end else begin
    TempoP := 0;
    TempoR := aTempo;
  end;    

  if TempoR > 0 then begin
    if FCreditoR >= TempoR then begin
      if (FTicksR<aTempo) then
        FCreditoR := FCreditoR - MenorCardinal(aTempo-TempoP, FCreditoR)
      else
        FCreditoR := FCreditoR - TempoR;  
    end else begin
      FCreditoR := 0;
      FValor := FValor + aPreco;
      FPrecoRes := 0;
    end;
  end;

  if (FTicksR<=aTempo) or ((aTempo>0) and (FTicksR<(aTempo+aTol))) then begin
    FTempoRes := aTempo-FTicksR;
    FAgora := FAgora + TicksToDateTime(FTicksR);
    FTicksR := 0;
  end else begin
    FTicksR := FTicksR - aTempo;
    FAgora := FAgora + TicksToDateTime(aTempo);
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

  FNumTicks := Value;

  while (FTicksR > 50) do 
    if not Calcular(FNumTicks - FTicksR) then begin
      // Houve uma falha no cáculo. Zerar valor e desistir da tarifação
      FValor := 0;
      Exit;
    end;
end;      

function TncTarifador.Calcular(aTempoCalc: Cardinal): Boolean;
var 
  T: Cardinal;
  Avancou, aDia, aHora : Byte;
  TempoCorrido : Cardinal;
begin
  Result := False;

  { 1a coisa é obter a Tarifa para a hora que estamos calculando. FHoraTarifa é uma matriz
    que contém a cor da tarifa a ser usada para cada hora e dia da semana.
      
    O código de cor é guardado em FTarifaAI e é a chave para obter o objeto TncTarifa que
    contém os detalhes necessários para a tarifação. FTarifa e FTarifaA guardam a referencia
    para o TncTarifa. FTarifaA é um cache }
            
  if (FTarifaA<>nil) and (FTarifaAI=FHoraTarifa[FDia, FHora]) then
    FTarifa := FTarifaA
    { Tarifa atual igual anterior então usamos o cache }
  else begin 

    { Mudou a tarifa, temos que atualizar nosso objeto }
      
    FTarifaAI := FHoraTarifa[FDia, FHora];
    FTarifa := gTarifas.PorCor[FTipoAcesso, FTarifaAI];

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
      FTarifaAI := FHoraTarifa[aDia, aHora];
      FTarifa := gTarifas.PorCor[FTipoAcesso, FTarifaAI];
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
        
    TempoCorrido := aTempoCalc - FTicksTarifa;
    if (TempoCorrido>0) and (FTarifaA<>nil) and (FTarifaA.Reinicia) then
      { Só nos interessa o Tempo Corrido desde o ultimo inicio de 1a ETAPA da Cor Anterior }
      TempoCorrido := TempoCorrido mod FTarifaA.TempoTotal;

    { Obtem o indice da etapa de preço atual }
    FEtapa := FTarifa.ObtemIndProxPreco(TempoCorrido);
      
    FTicksTarifa := aTempoCalc;
    FTicksPreco := aTempoCalc;
  end else
  if ((aTempoCalc-FTicksPreco) >= FTarifa.PPrecos^[FEtapa].prTempo) then begin
    { Não mudou a cor. Mas o tempo já é maior que o definido para essa etapa }
    if (FEtapa < High(FTarifa.PPrecos^)) then begin
      { Ainda existe existe mais etapas nessa tarifa. Devemos avançar para próxima então }
      Inc(FEtapa);
      FTicksPreco := aTempoCalc;
    end else
    { Não existe mais etapas nessa tarifa. Manter-se então nessa etapa ou Reiniciar da 
      1a caso essa cor esteja marcada para isso }
    if (Length(FTarifa.PPrecos^)>0) and FTarifa.Reinicia then
      FEtapa := 0;  
  end;
    
  if (FEtapa>=0) then 
  with FTarifa.PPrecos^[FEtapa] do begin
    { Retorna em T qual é o tempo correspondente à fração mínima e tb o resto 
      dessa regra de 3 em FResto }
    CalcRestoTempo(prValor, prValorMin, prTempo, FResto, T);
      
    { Tarifar (no máximo) uma fatia de tempo de Fração Mínima }
    case FTipoCalc of
      tcTarifacao  : if not CalculaEtapaTarifacao(T, prTolerancia, prValorMin) then Exit;
      tcTempoCred  : if not CalculaEtapaTempoCred(T, prTolerancia, prValorMin) then Exit;
      tcTempoValor : if not CalculaEtapaTempoValor(T, prTolerancia, prValorMin) then Exit;
    end;  
  end else 
    // Etapa inválida entao desistimos da Tarifação
    Exit;
      
  FTarifaA := FTarifa;
  Result := True;
end;

constructor TncTarifador.Create;
begin
  FCreditoTotal := 0;
  FPassaportes := nil;
  FNumTicks := 0;
  FCredValor := 0;
  FIsento := False;
  FCredito := 0;
  Reset;
end;

procedure TncTarifador.SetCredito(const Value: Cardinal);
begin
  if FCredito=Value then Exit;
  FCredito := Value;
  FResetar := True;
end;

procedure TncTarifador.SetHoraTarifa(const Value: PncHoraTarifa);
begin
  if FHoraTarifa=Value then Exit;
  FHoraTarifa := Value;
  FResetar := True;
end;

procedure TncTarifador.SetInicio(const Value: TDateTime);
begin
  if FInicio=Value then Exit;
  FInicio := Value;
  FResetar := True;
end;

procedure TncTarifador.SetPassaportes(const Value: PPassaportes);
begin
  if FPassaportes=Value then Exit;
  FPassaportes := Value;
  FResetar := True;
end;

procedure TncTarifador.SetTipoAcesso(const Value: Word);
begin
  if FTipoAcesso=Value then Exit;
  FTipoAcesso := Value;
  FResetar := True;
end;

procedure TncTarifador.SetCredValor(const Value: Double);
begin
  if FCredValor=Value then Exit;
  FCredValor := Value;
  FResetar := True;
end;

function TncTarifador.TempoCredValor: Cardinal;
begin
  FTipoCalc := tcTempoValor;
  Reset;
  FValor := 0;
  Result := 0;
  FNumTicks := 0;
  while (FValor <= FCredValor) and Calcular(FNumTicks) do {};
  Result := FNumTicks;      
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

  if ((FValor + aPreco) - FCredValor) >= 0.00001 then
    FValor := FCredValor + 1
  else begin
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

  if FPassaportes<>nil then 
    TempoP := FPassaportes^.AbateCreditos(FAgora, MenorCardinal(aTempo, FTicksR))
  else 
    TempoP := 0;

  if (FCredito+TempoP) < aTempo then begin
    FNumTicks := FNumTicks + FCredito + TempoP;
    FValor := 1;
    FCredito := 0;
  end else begin
    FNumTicks := FNumTicks + aTempo;
    FCredito := FCredito - (aTempo - TempoP);
  end;

  FAgora := FAgora + TicksToDateTime(aTempo);
  AtualizaDiaH;
  Result := True;
end;

function TncTarifador.GetCredito: Cardinal;
begin
  Result := FCredito;
end;

function TncTarifador.GetCredValor: Double;
begin
  Result := FCredValor;
end;

function TncTarifador.GetHoraTarifa: PncHoraTarifa;
begin
  Result := FHoraTarifa;
end;

function TncTarifador.GetInicio: TDateTime;
begin
  Result := FInicio;
end;

function TncTarifador.GetNumTicks: Cardinal;
begin
  Result := FNumTicks;
end;

function TncTarifador.GetPassaportes: PPassaportes;
begin
  Result := FPassaportes;
end;

function TncTarifador.GetTipoAcesso: Word;
begin
  Result := FTipoAcesso;
end;

function TncTarifador.GetTipoCalc: Byte;
begin
  Result := FTipoCalc;
end;

function TncTarifador.GetValor: Double;
begin             
  if FIsento then
    Result := 0
  else  
    Result := FValor;
end;

function TncTarifador.CreditoUsado: Cardinal;
begin
  Result := FCredito - FCreditoR;
end;

function TncTarifador.GetIsento: Boolean;
begin
  Result := FIsento;
end;

procedure TncTarifador.SetIsento(const Value: Boolean);
begin
  FIsento := Value;
end;

procedure TncTarifador.CalculaCreditoTotal;
var FSalvaCred: Cardinal;
begin
  FTipoCalc := tcTempoCred;
  ZeraVars;
  FValor := 0;
  FCreditoTotal := 0;
  FNumTicks := 0;
  FSalvaCred := FCredito;
  try
    while (FValor <= 0.01) and Calcular(FNumTicks) do {};
    FCreditoTotal := FNumTicks;      
  finally
    FCredito := FSalvaCred;
  end;    
  ZeraVars;
end;

function TncTarifador.Cronometro: Cardinal;
begin
  if FCreditoTotal>FNumTicks then
    Result := FCreditoTotal - FNumTicks
  else
    Result := FNumTicks - FCreditoTotal;  
end;

function TncTarifador.CronometroStr: String;
begin

end;

procedure TncTarifador.Reset;
begin
  if FPassaportes<>nil then
    CalculaCreditoTotal
  else begin
    ZeraVars;
    FCreditoTotal := FCredito;
  end;  
end;

procedure TncTarifador.ZeraVars;
begin
  FTempoRes   := 0;
  FTol        := 0;
  FPrecoRes   := 0;
  FResetar := False;
  FValor := 0;
  FAgora := FInicio;
  if FPassaportes<>nil then
    FPassaportes^.AjustaInicioExpirar(FInicio);
  FTempoCobrado := 0;
  FCreditoR := FCredito;
  AtualizaDiaH;
  FNumTicksI := 0;
  FRestoT := 0;
  FResto := 0;
  FTarifaA := nil;
  FTicksTarifa := 0;
  FTicksPreco := 0;
  FTicksR := 0;
  FNumTicks := 0;
end;

{ TncPausas }

procedure TncPausas.Adiciona(aInicio, aDuracao: Cardinal);
begin
  SetLength(FPausas, Quant+1);
  FPausas[Quant].pInicio := aInicio;
  FPausas[Quant].pDuracao := aDuracao;
end;

constructor TncPausas.Limpa;
begin
  SetLength(FPausas, 0);
end;

function TncPausas.DTTotal: TDateTime;
begin
  Result := TicksToDateTime(TicksTotal);
end;

function TncPausas.GetItem(Index: Integer): PncPausa;
begin
  Result := @FPausas[pred(Index)];
end;

function TncPausas.GetQuantidade: Integer;
begin
  Result := Length(FPausas);
end;

function TncPausas.GetString: String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Quant do with Itens[I]^ do 
    Result := IntToStr(pInicio) + ',' +
              IntToStr(pDuracao)+ '|';
end;

procedure TncPausas.SetString(const Value: String);
var 
  S : String;
  P, Q : Integer;
  sInicio, sDur : String;
begin
  SetLength(FPausas, 0);
  S := Value;
  P := Pos('|', S);
  Q := 0;
  while P > 0 do begin 
    Inc(Q);
    SetLength(FPausas, Q);
    P := Pos(',', S);
    sInicio := Copy(S, 1, P-1);
    FPausas[Q-1].pInicio := StrToIntDef(sInicio, 0);
    Delete(S, 1, P);
    P := Pos('|', S);
    sDur := Copy(S, 1, P-1);
    FPausas[Q-1].pDuracao := StrToIntDef(sDur, 0);
    Delete(S, 1, P);
    P := Pos('|', S);
  end;  
end;

function TncPausas.TicksTotal: Cardinal;
var I : Integer;
begin
  Result := 0;
  for I := 0 to pred(Quant) do 
    Result := Result + FPausas[I].pDuracao;
end;

end.
