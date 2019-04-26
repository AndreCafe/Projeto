unit ncSessao;

interface

uses
  SysUtils,
  DB,
  MD5,
  Dialogs,
  Classes,
  Windows,
  ClasseCS,
  ncClassesBase,
  ncPassaportes,
  ncTarifador,
  ncTran,
  ncMovEst,
  ncImpressao,
  ncCredTempo;

type

  TncsOcupacao = record
    eoMaq      : Word;
    eoCaixa    : Word;
    eoData     : TDateTime;
    eoHora     : Byte;
    eoTicksP   : Cardinal;
    eoTicksU   : Cardinal;
    eoTicksI   : Cardinal;
    eoTicksF   : Cardinal;
  end;

  TncsFechamentoCaixa = record
    fcCaixaFechado : Integer;
    fcTicks        : Cardinal;
  end;

  TncsTransfMaq = record
    tmMaqO : Word;
    tmMaqD : Word;
    tmTicks : Cardinal;
  end;

  TncsArrayOcupacao = Array of TncsOcupacao;
  PncsArrayOcupacao = ^TncsArrayOcupacao;

  TncsArrayFechamentoCaixa = Array of TncsFechamentoCaixa;
  PncsArrayFechamentoCaixa = ^TncsArrayFechamentoCaixa;

  TncsArrayTransfMaq = Array of TncsTransfMaq;
  PncsArrayTransfMaq = ^TncsArrayTransfMaq;

  TncSessao = class ( TncClasse )
  private
    function GetStrPassaportes: String;
    procedure SetStrPassaportes(const Value: String);
    function GetPassaportes: TncPassaportes;
    function GetPausas: TncPausas;

    function GetStrPausas: String;
    procedure SetStrPausas(const Value: String);

    function GetStrTransacoes: String;
    procedure SetStrTransacoes(const Value: String);
    function GetStrImpressoes: String;
    function GetStrTempos: String;
    function GetStrVendas: String;
    procedure SetStrImpressoes(const Value: String);
    procedure SetStrTempos(const Value: String);
    procedure SetStrVendas(const Value: String);
    function GetMinutosPrev: Double;
    function GetMinutosCli: Double;
    function GetArrOcupacao: PncsArrayOcupacao;
    function GetStrFechamentoCaixa: String;
    function GetStrTransfMaq: String;
    procedure SetStrFechamentoCaixa(const Value: String);
    procedure SetStrTransfMaq(const Value: String);
    procedure SetTipoCli(const Value: Byte);
    procedure SetCliente(const Value: Cardinal);
    procedure SetHP1(const Value: Integer);
    procedure SetHP2(const Value: Integer);
    procedure SetHP3(const Value: Integer);
    procedure SetHP4(const Value: Integer);
    procedure SetHP5(const Value: Integer);
    procedure SetHP6(const Value: Integer);
    procedure SetHP7(const Value: Integer);
    function GetValorCli: Currency;
    procedure SetValorCli(const Value: Currency);

  protected
    FID               : Cardinal;
    FTermino          : TDateTime;
    FMinutosR         : Double;
    FMinutosC         : Double;
    FMaq              : Word;
    FMaqI             : Word;
    FEncerrou         : Boolean;
    FCliente          : Cardinal;
    FTransfMaq        : Boolean;
    FTipoCli          : Byte;
    FCancelado        : Boolean;
    FTotal            : Currency;
    FDesconto         : Currency;
    FPago             : Currency;
    FNomeCliente      : String;
    FFuncI            : String;
    FFuncF            : String;
    FObs              : String;
    FCaixaI           : Integer;
    FCaixaF           : Integer;
    FTicksI           : Cardinal;
    FPausado          : Boolean;
    FInicioPausa      : Cardinal;
    FMinTicksUsados   : Cardinal;
    FFimTicksUsados   : Cardinal;
    FFimTicksTotal    : Cardinal;
    FMinTicksTotal    : Cardinal;
    FMinutosMax       : Double;
    FMinutosCliU      : Double;
    FValorCliU        : Currency;
    FTranI            : Integer;
    FTranF            : Integer;
    FDescTran         : Currency;
    FPagoTran         : Currency;
    FPermitirDownload : Boolean;
    FRecibo           : Boolean;
    FIDListaEspera    : Integer;
    FCartaoTempo      : Boolean;

    FHP1              : Integer;
    FHP2              : Integer;
    FHP3              : Integer;
    FHP4              : Integer;
    FHP5              : Integer;
    FHP6              : Integer;
    FHP7              : Integer;
    
    FUserObj          : TObject;
    FTarifador        : TncTarifador;
    FTransacoes       : TncTransacoes;
    FImpressoes       : TncImpressoes;
    FTempos           : TncCredTempos;
    FVendas           : TncItensMovEst;
    FUsernameLogin    : String;
    FSenhaLogin       : String;
    FLadoCli          : Boolean;
    FArrOcupacao       : TncsArrayOcupacao;
    FArrTransfMaq      : TncsArrayTransfMaq;
    FArrFechamentoCaixa: TncsArrayFechamentoCaixa;
    FDebitoCli         : Currency;
    FPontosCli         : Double;
    
    FVersaoRegistro    : Integer;
    FIDTipoAcesso      : Integer;

    function GetTicksTotal: Cardinal;
    procedure SetTicksTotal(const Value: Cardinal);

    procedure SetMinutosCli(Value: Double);

    procedure SetTipoAcesso(const Value: Integer);
    function GetTipoAcesso: Integer;

    function GetInicio: TDateTime;
    procedure SetInicio(const Value: TDateTime);

    function GetChave: Variant; override;
    function GetHPDia(DW: Byte): Integer;
    
  public
    constructor Create(aLadoCli: Boolean);
    destructor Destroy; override;

    procedure LeStream(S: TStream); override;

    procedure Limpa;
    
    procedure IniciaSessao;
    procedure FinalizaSessao;
    procedure Pausar;
    procedure Despausar;

    procedure SetTicksI(const Value: Cardinal);
    procedure AjustaTicksI(const Value: Cardinal);

    procedure Recalcula;
    procedure AtualizaCalculo;

    procedure CalcMinutosCli;
    procedure PausaFimTempo(aFinalizaPausaAdmin: Boolean);
    procedure GeraOcupacao;

    procedure TransferiuMaq(aOrigem, aDestino: Word);
    procedure FechouCaixa(aCaixa: Integer);

    function TipoClasse: Integer; override;

    function TempoUsado: TncTempo;
    function TempoCobrado: TncTempo;
    function FimTempo: TncTempo;
    function TempoMaximo: Tnctempo;
    function TempoMaximoTot: TncTempo;
    function MotivoPausa: Byte;
    function LimiteHP: TncTempo;
    function MinutosTotCredTempo: Double;
    function ValorTotCredTempo: Currency;
    function GetDHAtual: TDateTime;

    procedure IncVersaoRegistro;

    procedure LeDataset(Tab: TDataset); override;

    function TotalGeral: Currency;

    function TemTempoPrevisto: Boolean;

    property Passaportes: TncPassaportes
      read GetPassaportes;

    property Pausas: TncPausas
      read GetPausas;  

    property Tarifador: TncTarifador
      read FTarifador; 

    property Transacoes: TncTransacoes
      read FTransacoes;   

    property Impressoes: TncImpressoes
      read FImpressoes;

    property Vendas: TncItensMovEst 
      read FVendas;

    property Tempos: TncCredTempos
      read FTempos;

    property MinutosPrev: Double
      read GetMinutosPrev;

    property ArrOcupacao: PncsArrayOcupacao
      read GetArrOcupacao;
      
    
  published
    property TicksTotal: Cardinal
      read GetTicksTotal write SetTicksTotal;

    property ID: Cardinal
      read FID write FID;
      
    property Inicio: TDateTime
      read GetInicio write SetInicio;

    property TicksI: Cardinal
      read FTicksI write SetTicksI;

    property TipoAcesso: Integer
      read GetTipoAcesso write SetTipoAcesso;
      
    property MinutosCli: Double
      read GetMinutosCli write SetMinutosCli;
      
    property Termino: TDateTime
      read FTermino write FTermino;
      
    property MinutosR: Double
      read FMinutosR write FMinutosR;
      
    property MinutosC: Double
      read FMinutosC write FMinutosC;
      
    property Maq: Word
      read FMaq write FMaq;

    property MaqI: Word
      read FMaqI write FMaqI;   
      
    property Encerrou: Boolean
      read FEncerrou write FEncerrou;
      
    property Cliente: Cardinal
      read FCliente write SetCliente;
      
    property TransfMaq: Boolean
      read FTransfMaq write FTransfMaq;
      
    property TipoCli: Byte
      read FTipoCli write SetTipoCli;
      
    property Cancelado: Boolean
      read FCancelado write FCancelado;
      
    property Total: Currency
      read FTotal write FTotal;
      
    property Desconto: Currency
      read FDesconto write FDesconto;
      
    property Pago: Currency
      read FPago write FPago;
      
    property NomeCliente: String
      read FNomeCliente write FNomeCliente;
      
    property FuncI: String
      read FFuncI write FFuncI;
      
    property FuncF: String
      read FFuncF write FFuncF;
      
    property Obs: String
      read FObs write FObs;
      
    property CaixaI: Integer
      read FCaixaI write FCaixaI;
      
    property CaixaF: Integer
      read FCaixaF write FCaixaF;
      
    property Pausado: Boolean
      read FPausado write FPausado;
      
    property InicioPausa: Cardinal
      read FInicioPausa write FInicioPausa;
      
    property MinTicksUsados: Cardinal
      read FMinTicksUsados write FMinTicksUsados;

    property FimTicksTotal: Cardinal
      read FFimTicksTotal write FFimTicksTotal;  
      
    property FimTicksUsados: Cardinal
      read FFimTicksUsados write FFimTicksUsados;
      
    property MinTicksTotal: Cardinal
      read FMinTicksTotal write FMinTicksTotal;
      
    property MinutosMax: Double
      read FMinutosMax write FMinutosMax;
      
    property MinutosCliU: Double
      read FMinutosCliU write FMinutosCliU;

    property ValorCli: Currency
      read GetValorCli write SetValorCli;

    property DebitoCli: Currency
      read FDebitoCli write FDebitoCli; 

    property PontosCli: Double
      read FPontosCli write FPontosCli;  
      
    property ValorCliU: Currency
      read FValorCliU write FValorCliU;
      
    property TranI: Integer
      read FTranI write FTranI;
      
    property TranF: Integer
      read FTranF write FTranF;

    property DescTran: Currency
      read FDescTran write FDescTran;

    property PagoTran: Currency
      read FPagoTran write FPagoTran;  

    property PermitirDownload: Boolean
      read FPermitirDownload write FPermitirDownload;     

    property UsernameLogin: String
      read FUsernameLogin write FUsernameLogin;

    property SenhaLogin: String
      read FSenhaLogin write FSenhaLogin;

    property IDListaEspera: Integer
      read FIDListaEspera write FIDListaEspera;
      
    property Recibo: Boolean
      read FRecibo write FRecibo;  
      
    property StrPausas: String
      read GetStrPausas write SetStrPausas;

    property StrTransfMaq: String
      read GetStrTransfMaq write SetStrTransfMaq;

    property StrFechamentoCaixa: String
      read GetStrFechamentoCaixa write SetStrFechamentoCaixa;     

    property StrPassaportes: String
      read GetStrPassaportes Write SetStrPassaportes;

    property StrTransacoes: String
      read GetStrTransacoes write SetStrTransacoes;  

    property StrImpressoes: String
      read GetStrImpressoes write SetStrImpressoes;

    property StrTempos: String
      read GetStrTempos write SetStrTempos;

    property StrVendas: String
      read GetStrVendas write SetStrVendas;      

    property HP1 : Integer
      read FHP1 write SetHP1;

    property HP2 : Integer
      read FHP2 write SetHP2;  

    property HP3 : Integer
      read FHP3 write SetHP3;  

    property HP4 : Integer
      read FHP4 write SetHP4;  

    property HP5 : Integer
      read FHP5 write SetHP5;  

    property HP6 : Integer
      read FHP6 write SetHP6;  

    property HP7 : Integer
      read FHP7 write SetHP7;  

    property CartaoTempo: Boolean
      read FCartaoTempo write FCartaoTempo;  

    property VersaoRegistro: Integer
      read FVersaoRegistro write FVersaoRegistro;  
  end;

  TncSessoes = class ( TListaClasseCS ) 
  private
    function GetSessao(I: Integer): TncSessao; 
    function GetSessaoPorID(N: Integer): TncSessao;
    function GetSessaoPorCliente(C: Integer): TncSessao;
    function GetSessaoPorMaq(M: Integer): TncSessao;
    function GetSessaoPorPassaporte(N: Integer): TncSessao;
  public
    function PassaporteEmUso(aNumPass: Integer): Boolean;

    property Itens[I: Integer]: TncSessao
      read GetSessao; default;

    property PorPassaporte[N: Integer]: TncSessao 
      read GetSessaoPorPassaporte;  

    property PorID[N: Integer]: TncSessao 
      read GetSessaoPorID;

    property PorCliente[C: Integer]: TncSessao
      read GetSessaoPorCliente; 

    property PorMaq[A: Integer]: TncSessao 
      read GetSessaoPorMaq;
  end;

const
  // Motivos para Pausas
  mpNaoEstaPausado = 0;
  mpPausaAdmin     = 1;
  mpPausaFimTempo  = 2;
  mpPausaHorarioNP = 3;
  mpPausaEncerrar  = 4;

implementation

procedure TncSessao.LeDataset(Tab: TDataset);
begin
  inherited;
  if not FLadoCli then
    FTicksI := Tab.FieldByName('TicksI').AsInteger;
end;

procedure TncSessao.LeStream(S: TStream);
begin
  inherited;
  FTarifador.Reset;
end;

function TncSessao.LimiteHP: TncTempo;
var 
  I, DW, H, M, S, MS : Word;
  T : Cardinal;
begin
  if (not gConfig.BloquearUsoEmHorarioNP) or (Cliente=0) or (TipoCli=tcManutencao) then begin
    Result.Ticks := High(Cardinal);
    Exit;
  end;
  DecodeTime(Inicio, H, M, S, MS);
  I := 0;
  T := DateTimeToTicks(EncodeTime(H, M, S, MS)) - DateTimeToTicks(EncodeTime(H, 0, 0, 0));
  T := (60*60*1000) - T;
  DW := DayOfWeek(Inicio);
  while (I<24) and BitIsSet(GetHPDia(DW), BitsH[H]) do begin 
    Inc(H);
    if H=24 then begin
      H := 0;
      Inc(DW);  if DW=8 then DW := 1;
    end;
    Inc(I);
  end;
  if BitIsSet(GetHPDia(DW), BitsH[H]) then
    Result.Ticks := High(Cardinal) 
  else
  if I = 0 then
    Result.Minutos := 0 else
    Result.Ticks := T + ((I-1)*60*60*1000);
end;

procedure TncSessao.CalcMinutosCli;
var 
  M : Extended;
  I : Integer;
begin
  if Cliente>0 then Exit;
  M := 0;
  for I := 0 to Tempos.Count - 1 do with Tempos[I] do 
    if (not teCancelado) and (teTipo in [tctAvulso, tctPacote]) then
      M := M + teMinutos;
  MinutosCli := M; 
  FTarifador.Reset;
end;

constructor TncSessao.Create(aLadoCli: Boolean);
begin
  inherited Create;
  FIDTipoAcesso     := -1;
  FTarifador        := TncTarifador.Create;
  FTransacoes       := TncTransacoes.Create;
  FImpressoes       := TncImpressoes.Create;
  FTempos           := TncCredTempos.Create;
  FVendas           := TncItensMovEst.Create;
  SetLength(FArrOcupacao, 0);
  SetLength(FArrTransfMaq, 0);
  SetLength(FArrFechamentoCaixa, 0);
  Limpa;
  FLadoCli          := aLadoCli;
  FUserObj          := nil;
end;

procedure TncSessao.Despausar;
begin
  if FPausado then begin
    FPausado := False;
    if TicksTotal > FInicioPausa then
    with Pausas.NewPausa do begin
      pInicio := Inicio + TicksToDateTime(FInicioPausa);
      pFim    := pInicio + TicksToDateTime(TicksTotal-FInicioPausa);
    end;
    FInicioPausa := 0;
  end;
end;

destructor TncSessao.Destroy;
begin
  FreeAndNil(FTarifador);
  FreeAndNil(FTransacoes);
  FreeAndNil(FImpressoes);
  FreeAndNil(FTempos);
  FreeAndNil(FVendas);
  SetLength(FArrOcupacao, 0);
  SetLength(FArrTransfMaq, 0);
  SetLength(FArrFechamentoCaixa, 0);
  inherited;
end;

procedure TncSessao.FechouCaixa(aCaixa: Integer);
var I: Integer;
begin
  I := Length(FArrFechamentoCaixa);
  SetLength(FArrFechamentoCaixa, I+1);
  with FArrFechamentoCaixa[I] do begin
    fcCaixaFechado := aCaixa;                                          
    fcTicks := TicksTotal;
  end;
end;

function TncSessao.FimTempo: TncTempo;
var T, TM: TncTempo;
begin
  TM.Minutos := TempoMaximo.Minutos;
  if (FMinutosMax>0) and (TM.Minutos>FMinutosMax) then
    TM.Minutos := FMinutosMax;
    
  if TM.Minutos > 0 then begin
    T.Ticks := TicksTotal - FTarifador.FPausas.TicksTotal;

    if (T.Minutos > TM.Minutos) then
      Result.Ticks := TempoUsado.Ticks + FTarifador.FPausas.TicksTotal else
      Result.Minutos := 0;
  end else
    Result.Minutos := 0;
end;

procedure TncSessao.FinalizaSessao;
begin
  FTarifador.Reset;
  FFimTicksTotal     := TicksTotal;
  FFimTicksUsados    := TempoUsado.Ticks;
  FMinTicksUsados    := FFimTicksUsados;
  FMinTicksTotal     := TicksTotal;
  FEncerrou          := True;
  FTermino           := Now;
  FTarifador.NumTicks := FFimTicksUsados;
  FTotal             := FTarifador.Valor;
  FMinutosCliU       := FTarifador.CredTempoUsado.Minutos;
  FValorCliU         := FTarifador.CredValorUsado;
  FMinutosR          := TempoUsado.Minutos;
  FMinutosC          := TempoCobrado.Minutos;
  PausaFimTempo(True);
end;

function TncSessao.GetPassaportes: TncPassaportes;
begin
  Result := FTarifador.Passaportes;
end;

function TncSessao.GetPausas: TncPausas;
begin
  Result := FTarifador.Pausas;
end;

function TncSessao.GetStrFechamentoCaixa: String;
var I: Integer;
begin
  Result := '';
  for I  := 0 to High(FArrFechamentoCaixa) do with FArrFechamentoCaixa[I] do begin
    if I>0 then Result := Result + sLineBreak;
    Result := Result +
      IntToStr(fcCaixaFechado) + sFldDelim +
      IntToStr(fcTicks) + sFldDelim;
  end;
end;

function TncSessao.GetStrImpressoes: String;
begin
  Result := FImpressoes.AsString;
end;

function TncSessao.GetStrPassaportes: String;
begin
  Result := FTarifador.Passaportes.AsString;
end;

function TncSessao.GetStrPausas: String;
begin
  Result := FTarifador.Pausas.AsString;
end;

function TncSessao.GetStrTempos: String;
begin
  Result := FTempos.AsString;
end;

function TncSessao.GetStrTransacoes: String;
begin
  Result := FTransacoes.AsString;
end;

function TncSessao.GetStrTransfMaq: String;
var I: Integer;
begin
  Result := '';
  for I  := 0 to High(FArrTransfMaq) do with FArrTransfMaq[I] do begin
    if I>0 then Result := Result + sLineBreak;
    Result := Result + 
      IntToStr(tmMaqO) + sFldDelim +
      IntToStr(tmMaqD) + sFldDelim +
      IntToStr(tmTicks) + sFldDelim;
  end;
end;

function TncSessao.GetStrVendas: String;
begin
  Result := FVendas.AsString;
end;

function TncSessao.GetTicksTotal: Cardinal;
begin
  if FFimTicksTotal>0 then
    Result := FFimTicksTotal 
  else  
  if FPausado then
    Result := FInicioPausa
  else begin  
    Result := GetTickCount - FTicksI;
    if Result<FMinTicksTotal then begin
      FTicksI := GetTickCount - FMinTicksTotal;
      Result := FMinTicksTotal;
    end;
  end;
end;

procedure TncSessao.GeraOcupacao;
var 
  TT, Falta, Ticks, InicioP, FimP : Cardinal;
  I, B, C : Integer;
  Agora : TDateTime;
  H, M, S, MS : Word;
begin
  SetLength(FArrOcupacao, 0);
  TT := TicksTotal;
  Agora := Inicio;
  DecodeTime(Agora, H, M, S, MS);
  Falta := (1000 * 60 * 60) - (M*60*1000) - (S*1000) - MS;
  I := 0;
  Ticks := 0;
  while TT > 0 do begin
    Falta := MenorCardinal(Falta, TT);
    SetLength(FArrOcupacao, I+1);
    with FArrOcupacao[I] do begin
      eoMaq      := FMaqI;
      eoCaixa    := FCaixaF;
      if eoCaixa=0 then eoCaixa := FCaixaI;
      eoData     := Trunc(Agora);
      eoHora     := H;
      eoTicksP   := 0;
      eoTicksU   := Falta;
      eoTicksI   := Ticks;
      eoTicksF   := Ticks + Falta;
      Ticks      := eoTicksF+1;
    end;
    TT := TT - Falta;
    if H=23 then begin
      Agora := Trunc(Agora) + 1;
      H := 0;
    end else begin
      Inc(H);
      Agora := Trunc(Agora) + (H/24);
    end;
    Falta := 1000 * 60 * 60;
    Inc(I);
  end;

  for I := 0 to High(FArrTransfMaq) do with FArrTransfMaq[I] do begin
    for B := 0 to High(FArrOcupacao) do with FArrOcupacao[B] do
      if (tmTicks>=eoTicksI) and (tmTicks<=eoTicksF) then begin
        SetLength(FArrOcupacao, Length(FArrOcupacao)+1);
        for C := High(FArrOcupacao) downto B+2 do
          FArrOcupacao[C] := FArrOcupacao[C-1];
        FArrOcupacao[B+1] := FArrOcupacao[B];
        FArrOcupacao[B+1].eoMaq := FArrTransfMaq[I].tmMaqD;  
        FArrOcupacao[B].eoTicksF := FArrTransfMaq[I].tmTicks;
        FArrOcupacao[B].eoTicksU := FArrOcupacao[B].eoTicksF - FArrOcupacao[B].eoTicksI;

        FArrOcupacao[B+1].eoTicksI := FArrTransfMaq[I].tmTicks;
        FArrOcupacao[B+1].eoTicksU := 
          FArrOcupacao[B+1].eoTicksF - FArrTransfMaq[I].tmTicks;
        for C := B+1 to High(FArrOcupacao) do
          FArrOcupacao[C].eoMaq := FArrTransfMaq[I].tmMaqD; 
        Break;
      end;
  end;

  for I := High(FArrFechamentoCaixa) downto 0 do 
  with FArrFechamentoCaixa[I] do begin
    for B := 0 to High(FArrOcupacao) do with FArrOcupacao[B] do
      if (fcTicks>=eoTicksI) and (fcTicks<=eoTicksF) then begin
        SetLength(FArrOcupacao, Length(FArrOcupacao)+1);
        for C := High(FArrOcupacao) downto B+2 do
          FArrOcupacao[C] := FArrOcupacao[C-1];
        FArrOcupacao[B+1] := FArrOcupacao[B];
        eoCaixa := fcCaixaFechado;
        eoTicksF := fcTicks;
        eoTicksU := eoTicksF - eoTicksI;

        FArrOcupacao[B+1].eoTicksI := fcTicks;
        FArrOcupacao[B+1].eoTicksU := 
          FArrOcupacao[B+1].eoTicksF - fcTicks;
        for C := B downto 0 do
          FArrOcupacao[B].eoCaixa := fcCaixaFechado;
        Break;
      end;
  end;
  
  for I := 0 to Pausas.Count-1 do begin
    TT := Pausas[I].DuracaoT;
    InicioP := DateTimeToTicks(Pausas[I].pInicio - Inicio);
    FimP := InicioP + TT;
    for B := 0 to Length(FArrOcupacao)-1 do with FArrOcupacao[B] do
    if (TT>0) and (eoTicksU>0) then
    if ((InicioP>=eoTicksI) and (InicioP<=eoTicksF)) or
       ((FimP>=eoTicksI) and (FimP<=eoTicksF)) then 
    begin
      Falta := MenorCardinal(eoTicksF, FimP) - MaiorCardinal(eoTicksI, InicioP);
      Falta := MenorCardinal(Falta, TT);
      Falta := MenorCardinal(Falta, eoTicksU);
      TT := TT - Falta;
      eoTicksP := eoTicksP + Falta;
      eoTicksU := eoTicksU - Falta;
    end;   
  end;
end;

function TncSessao.GetArrOcupacao: PncsArrayOcupacao;
begin
  Result := @FArrOcupacao;
end;

function TncSessao.GetChave: Variant;
begin
  Result := FID;
end;

function TncSessao.GetDHAtual: TDateTime;
begin
  Result := Inicio + TicksToDateTime(GetTickCount - FTicksI);
end;

function TncSessao.GetHPDia(DW: Byte): Integer;
begin
  case DW of
    1 : Result := FHP1;  
    2 : Result := FHP2;
    3 : Result := FHP3;  
    4 : Result := FHP4;  
    5 : Result := FHP5;  
    6 : Result := FHP6;  
    7 : Result := FHP7;  
  end;
end;

function TncSessao.GetInicio: TDateTime;
begin
  Result := FTarifador.Inicio;
end;

function TncSessao.GetMinutosCli: Double;
begin
  Result := Tarifador.PCredito^.Minutos;
end;

function TncSessao.GetMinutosPrev: Double;
var I : Integer;
begin
  Result := 0;
  for I := 0 to Tempos.Count-1 do with Tempos[I] do
  if (not teCancelado) and (teTipo=tctPrevisao) then
    Result := Result + teMinutos;
end;

procedure TncSessao.SetCliente(const Value: Cardinal);
var I : Integer;
begin
  if Value <> FCliente then begin
    for I := 0 to Tempos.Count-1 do
      Tempos[I].teCliente := Value;
    for I := 0 to Impressoes.Count-1 do
      Impressoes[I].impCliente := Value;
    for I := 0 to Vendas.Count-1 do
      Vendas[I].imCliente := Value;
  end;
  
  FCliente := Value;
end;

procedure TncSessao.SetHP1(const Value: Integer);
begin
  FHP1 := Value;
end;

procedure TncSessao.SetHP2(const Value: Integer);
begin
  FHP2 := Value;
end;

procedure TncSessao.SetHP3(const Value: Integer);
begin
  FHP3 := Value;
end;

procedure TncSessao.SetHP4(const Value: Integer);
begin
  FHP4 := Value;
end;

procedure TncSessao.SetHP5(const Value: Integer);
begin
  FHP5 := Value;
end;

procedure TncSessao.SetHP6(const Value: Integer);
begin
  FHP6 := Value;
end;

procedure TncSessao.SetHP7(const Value: Integer);
begin
  FHP7 := Value;
end;

procedure TncSessao.SetInicio(const Value: TDateTime);
begin
  FTarifador.Inicio := Value;
end;

procedure TncSessao.SetStrFechamentoCaixa(const Value: String);
var
  SL : TStrings;
  I: Integer;
  S: String;

function pCampo: String;
begin
  Result := GetNextStrDelim(S);
end;
  
begin
  SL := TStringList.Create;
  try
    SL.Text := Value;
    SetLength(FArrFechamentoCaixa, SL.Count);
    for I := 0 to SL.Count-1 do with FArrFechamentoCaixa[I] do begin
      S := SL[I];
      fcCaixaFechado := StrToIntDef(pCampo, 0);
      fcTicks := StrToIntDef(pCampo, 0);
    end;
  finally
    SL.Free;
  end;
end;

procedure TncSessao.SetStrImpressoes(const Value: String);
begin
  FImpressoes.AsString := Value;
end;

procedure TncSessao.SetStrPassaportes(const Value: String);
begin
  FTarifador.FPassaportes.AsString := Value;
  FTarifador.FResetar := True;
end;

procedure TncSessao.SetStrPausas(const Value: String);
begin
  FTarifador.FPausas.AsString := Value;
  FTarifador.FResetar := True;
end;

procedure TncSessao.SetStrTempos(const Value: String);
begin
  FTempos.AsString := Value;
  FTarifador.FResetar := True;
  CalcMinutosCli;
end;

procedure TncSessao.SetStrTransacoes(const Value: String);
begin
  FTransacoes.AsString := Value;
end;

procedure TncSessao.SetStrTransfMaq(const Value: String);
var
  SL : TStrings;
  I: Integer;
  S: String;

function pCampo: String;
begin
  Result := GetNextStrDelim(S);
end;
  
begin
  SL := TStringList.Create;
  try
    SL.Text := Value;
    SetLength(FArrTransfMaq, SL.Count);
    for I := 0 to SL.Count-1 do with FArrTransfMaq[I] do begin
      S := SL[I];
      tmMaqO := StrToIntDef(pCampo, 0);
      tmMaqD := StrToIntDef(pCampo, 0);
      tmTicks := StrToIntDef(pCampo, 0);
    end;
  finally
    SL.Free;
  end;
end;

procedure TncSessao.SetStrVendas(const Value: String);
begin
  FVendas.AsString := Value;
end;

procedure TncSessao.SetTicksTotal(const Value: Cardinal);
begin
  if FLadoCli then
    FTicksI := GetTickCount - Value;
end;

procedure TncSessao.SetMinutosCli(Value: Double);
begin
  if (Value*60) < 5 then Value := 0;
  if FTarifador.PCredito^.Minutos = Value then Exit;
  FTarifador.PCredito^.Minutos := Value;
  FTarifador.Reset;
end;

procedure TncSessao.SetTicksI(const Value: Cardinal);
begin
{  if not FLadoCli then
    FTicksI := Value;}
end;

function TncSessao.TempoUsado: TncTempo;
var TotPausas : Integer;
begin
  if FFimTicksUsados>0 then
    Result.Ticks := FFimTicksUsados
  else begin  
    TotPausas := FTarifador.Pausas.TicksTotal;
    Result.Ticks := TicksTotal - TotPausas;
    if (TempoMaximo.Minutos>0) and 
       (Result.Minutos > TempoMaximo.Minutos) then
      Result.Minutos := TempoMaximo.Minutos;
    if (FMinutosMax>0) and (Result.Minutos>FMinutosMax) then
      Result.Minutos := FMinutosMax;
    if (Result.Ticks + TotPausas) > LimiteHP.Ticks then
      Result.Ticks := LimiteHP.Ticks - TotPausas;
    if FMinTicksUsados>Result.Ticks then
      Result.Ticks := FMinTicksUsados;
  end;
end;

function TncSessao.TemTempoPrevisto: Boolean;
var I : Integer;
begin
  Result := True;
  for I := 0 to Tempos.Count - 1 do 
    if (not Tempos[I].teCancelado) and (Tempos[I].teTipo=tctPrevisao) then
      Exit;
  Result := False;    
end;

function TncSessao.TempoCobrado: TncTempo;
begin
  Result.Minutos := FTarifador.TempoCobrado.Minutos;
end;

function TncSessao.TempoMaximo: TncTempo;
begin
  Result.Minutos := FTarifador.CreditoTotal.Minutos + MinutosPrev;
end;

function TncSessao.TempoMaximoTot: TncTempo;
begin
  Result.Minutos := (FTarifador.CredTotalG/1000/60) + MinutosPrev;
end;

procedure TncSessao.SetTipoAcesso(const Value: Integer);
begin
  if Value=FIDTipoAcesso then Exit;
  FIDTipoAcesso := Value;
  FTarifador.IDTipoAcesso := Value;
end;

procedure TncSessao.SetTipoCli(const Value: Byte);
begin
  FTipoCli := Value;
  FTarifador.Isento := (Value<>0);
end;

procedure TncSessao.SetValorCli(const Value: Currency);
begin
  FTarifador.CredValor := Value;
end;

function TncSessao.GetTipoAcesso: Integer;
begin
  Result := FIDTipoAcesso;
end;

function TncSessao.GetValorCli: Currency;
begin
  Result := FTarifador.CredValor;
end;

procedure TncSessao.IncVersaoRegistro;
begin
  if LadoServidor then
    VersaoRegistro := VersaoRegistro + 1;
end;

procedure TncSessao.IniciaSessao;
begin
  Inicio := Now;
  FTicksI := GetTickCount;
  FTermino := 0;
  FCancelado := False;
  FEncerrou := False;
  FMinTicksUsados := 0;
  FMinTicksTotal  := 0;
  FFimTicksUsados := 0;
  FFimTicksTotal  := 0;
end;

procedure TncSessao.Limpa;
begin
  FRecibo           := False;
  FIDListaEspera    := 0;
  FID               := 0;
  Inicio            := 0;
  FTermino          := 0;
  FMinutosR         := 0;
  FMinutosC         := 0;
  FFimTicksTotal    := 0;
  FMaq              := 0;
  FMaqI             := 0;
  FEncerrou         := False;
  FCliente          := 0;
  FTransfMaq        := False;
  FTipoCli          := tcNormal;
  FCancelado        := False;
  FTotal            := 0;
  FDesconto         := 0;
  FPago             := 0;
  FNomeCliente      := '';
  FFuncI            := '';
  FFuncF            := '';
  FObs              := '';
  FCaixaI           := 0;
  FCaixaF           := 0;
  FTicksI           := 0;
  FPausado          := False;
  FInicioPausa      := 0;
  FMinTicksUsados   := 0;
  FFimTicksUsados   := 0;
  FMinTicksTotal    := 0;
  FMinutosMax       := 0;
  FMinutosCliU      := 0;
  FValorCliU        := 0;
  FDebitoCli        := 0;
  FPontosCli        := 0;
  FTranI            := 0;
  FTranF            := 0;
  FDescTran         := 0;
  FPagoTran         := 0;
  FPermitirDownload := False;
  FCartaoTempo      := False;
  FVersaoRegistro   := 0;
  ValorCli := 0;
  MinutosCli := 0;

  FTransacoes.Limpa;
  FImpressoes.Limpa;
  FVendas.Limpa;
  FTempos.Limpa;
  Passaportes.Limpa;
end;

function TncSessao.MinutosTotCredTempo: Double;
var I : Integer;
begin
  Result := 0;
  for I := 0 to Tempos.Count-1 do with Tempos[I] do
    if (not teCancelado) and (teTipo=tctAvulso) then
      Result := Result + teMinutos;
end;

function TncSessao.MotivoPausa: Byte;
begin
  if FPausado then
    Result := mpPausaAdmin
  else
  if FimTempo.Ticks>0 then
    Result := mpPausaFimTempo
  else
  if TicksTotal>LimiteHP.Ticks then
    Result := mpPausaHorarioNP 
  else
  if FimTicksUsados>0 then
    Result := mpPausaEncerrar
  else
    Result := mpNaoEstaPausado;
end;

procedure TncSessao.PausaFimTempo(aFinalizaPausaAdmin: Boolean);
var 
  aInicio, TT : Cardinal;
  S : String;
begin
  case MotivoPausa of
    mpPausaAdmin : if aFinalizaPausaAdmin then Despausar;
    
    mpPausaFimTempo : begin
      TT := TicksTotal;
      aInicio := FimTempo.Ticks;
      if (aInicio>0) and (TT>aInicio) then
      with Pausas.NewPausa do begin
        pInicio := Inicio + TicksToDateTime(aInicio);
        pFim    := Inicio + TicksToDateTime(TT);
      end;
    end; 

    mpPausaHorarioNP : begin
      TT := TicksTotal;
      aInicio := LimiteHP.Ticks;
      if aInicio < FMinTicksUsados+Pausas.TicksTotal then
        aInicio := FMinTicksUsados+Pausas.TicksTotal+1;
        
      if (TT>aInicio) then 
      with Pausas.NewPausa do begin
        pInicio := Inicio + TicksToDateTime(aInicio);
        pFim := Inicio + TicksToDateTime(TT);
        S := FormatDateTime('dd/mm/yyyy hh:mm:ss', pInicio) + ' a ' + 
             FormatDateTime('dd/mm/yyyy hh:mm:ss', pFim);
      end;
    end;
  end;
end;

procedure TncSessao.Pausar;
begin
  Despausar;
  if (FimTempo.Minutos=0) then begin
    FInicioPausa := TicksTotal;
    FPausado := True;
  end;
end;

procedure TncSessao.Recalcula;
begin
  FTarifador.TipoCalc := tcTarifacao;
  FTarifador.Reset;
  FTarifador.NumTicks := TempoUsado.Ticks;
end;

procedure TncSessao.AjustaTicksI(const Value: Cardinal);
begin
  FTicksI := Value;
end;

procedure TncSessao.AtualizaCalculo;
begin
  FTarifador.TipoCalc := tcTarifacao;
  FTarifador.NumTicks := TempoUsado.Ticks;
end;

function TncSessao.TipoClasse: Integer;
begin
  Result := tcSessao;
end;

function TncSessao.TotalGeral: Currency;
begin
  Result := Total + 
            Transacoes.TotalPendente(trEstVenda) +
            Transacoes.TotalPendente(trCredTempo) +
            Transacoes.TotalPendente(trImpressao);
end;

procedure TncSessao.TransferiuMaq(aOrigem, aDestino: Word);
var I: Integer;
begin
  I := Length(FArrTransfMaq);
  SetLength(FArrTransfMaq, I+1);
  with FArrTransfMaq[I] do begin
    tmMaqO := aOrigem;
    tmMaqD := aDestino;
    tmTicks := TicksTotal;
  end;
end;

function TncSessao.ValorTotCredTempo: Currency;
var I : Integer;
begin
  Result := 0;
  for I := 0 to Tempos.Count-1 do with Tempos[I] do
    if (not teCancelado) and (teTipo=tctAvulso) then
      Result := Result + teTotal;
end;

function TncSessoes.GetSessaoPorMaq(M: Integer): TncSessao;
var I : Integer;
begin
  for I := 0 to Count - 1 do
    if GetSessao(I).Maq=M then begin
      Result := GetSessao(I);
      Exit;
    end;
  Result := nil;   
end;

function TncSessoes.GetSessaoPorID(N: Integer): TncSessao;
var I : Integer;
begin
  for I := 0 to Count - 1 do
    if GetSessao(I).ID=N then begin
      Result := GetSessao(I);
      Exit;
    end;
  Result := nil;   
end;

function TncSessoes.GetSessao(I: Integer): TncSessao;
begin
  Result := TncSessao(GetItem(I));
end;

function TncSessoes.GetSessaoPorCliente(C: Integer): TncSessao;
var I : Integer;
begin
  Result := nil;
  for I := 0 to Pred(GetCount) do 
  if (GetSessao(I).Cliente=C) then begin
    Result := GetSessao(I);
    Exit;
  end;
end;

function TncSessoes.PassaporteEmUso(aNumPass: Integer): Boolean;
begin
  Result := (PorPassaporte[aNumPass]<>nil);
end;

function TncSessoes.GetSessaoPorPassaporte(N: Integer): TncSessao;
var I : Integer;
begin
  for I := 0 to Pred(Count) do 
  if Itens[I].Passaportes.ContemPassaporte(N) then begin
    Result := Itens[I];
    Exit;
  end;
    
  Result := nil;
end;


end.
