unit ncPassaportes;

interface

uses
  SysUtils,
  DB,
  MD5,
  Classes,
  Windows,
  ClasseCS,
  ncClassesBase,
  ncTran;

type  


  TncPassaporte = class
  private
    function GetHoraValida(D, H: Integer): Boolean;
    procedure SetHoraValida(D, H: Integer; const Value: Boolean);
    function TempoRestante(Agora: TDateTime): Cardinal;

    function GetString: String;
    procedure SetString(S: String);
  public
    pcTipoPass      : Integer;
    pcID            : Integer;
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
    pcFidelidade    : Boolean;
    pcFidPontos     : Integer;

    pctUsadoMS      : Cardinal;
    pctExpirou      : Boolean;
    pctInicio       : TDateTime;
    pctExpirar      : TDateTime;
    pctInicioUso    : TDateTime;
    pctAux          : String;
    pctTempoRes     : Cardinal;

    pctOrdExp       : TDateTime;

    constructor Create;

    procedure Limpa;

    procedure AssignFrom(P: TncPassaporte);

    procedure AjustaInicioExpirar(Inicio: TDateTime);
    function ExpirarEm(Agora: TDateTime): TDateTime;
    procedure ZeraInicioUso;
    procedure HorasValidasFromStr(S: String);
    function HorasValidasToStr: String;
    function ObtemMinutosRestantes: Double;
    function ObtemTempo(Agora: TDateTime; Dia, H : Integer; DuracaoMS: Cardinal): Cardinal;
    procedure LoadFromDataset(D: TDataset);
    procedure SaveToDataset(D: TDataset);
    function PrimeiroUso: TDateTime;
    procedure TotalizaUso;
    function Igual(P: TncPassaporte): Boolean;
    function GeraSenha: String;
    procedure AtualizaExpirou;

    property AsString: String
      read GetString write SetString;

    property HoraValida[D, H: Integer]: Boolean
      read GetHoraValida write SetHoraValida;
  end;

  TncPassaportes = class
  private
    FItens : TList;
    SData : TDateTime;

    function GetString: String;
    procedure SetString(S: String);

    function GetItem(I: Integer): TncPassaporte;
  public
    constructor Create;
    destructor Destroy; override;
      
    function Igual(P: TncPassaportes): Boolean;

    procedure AssignFrom(B: TncPassaportes);

    procedure Limpa;
    procedure ZeraInicioUso;
    procedure Ordenar(Data: TDateTime; H: Byte);
    procedure AjustaInicioExpirar(Inicio: TDateTime);
    function Count: Integer;
    function AbateCreditos(aTipoAcesso: Integer; Agora: TDateTime; Tempo: Cardinal): Cardinal;
    function NewPassaporte: TncPassaporte;
    procedure NewFromDataset(D: TDataset);
    procedure TotalizaUso;
    function TempoUsadoTotal: Cardinal;
    function ContemPassaporte(aID: Integer): Boolean;
    procedure Add(P: TncPassaporte);

    function TempoRestanteTotal(aAgora: TDateTime): Cardinal;
    function TempoTotalDisp(aAgora: TDateTime): Cardinal;

    function PorID(aID: Integer): TncPassaporte;

    property Itens[I: Integer]: TncPassaporte
      read GetItem; default;

    property AsString: String
      read GetString write SetString;  
  end;

  procedure ObtemPassUsernameSenha(var Username, Senha: String);


var
  MaxDateExp : TDateTime;

implementation

procedure TncPassaporte.AssignFrom(P: TncPassaporte);
begin
  pcTipoPass := P.pcTipoPass;
  pcID := P.pcID;
  pcNome := P.pcNome;
  pcCliente := P.pcCliente;
  pcSenha := P.pcSenha;
  pcValor := P.pcValor;
  pcTipoExp := P.pcTipoExp;
  pcTipoAcesso := P.pcTipoAcesso;
  pcExpirou := P.pcExpirou;
  pcValido := P.pcValido;
  pcExpirarEm := P.pcExpirarEm;
  pcPrimeiroUso := P.pcPrimeiroUso; 
  pcMaxSegundos := P.pcMaxSegundos;
  pcSegundos := P.pcSegundos;
  pcAcessos := P.pcAcessos;
  pcFidelidade := P.pcFidelidade;
  pcFidPontos := P.pcFidPontos;
  
  Move(P.pcHorasValidas, pcHorasValidas, SizeOf(pcHorasValidas));
  pctUsadoMS := P.pctUsadoMS;
  pctExpirou := P.pctExpirou;
  pctInicio := P.pctInicio;
  pctExpirar := P.pctExpirar;
  pctInicioUso := P.pctInicioUso;
  pctOrdExp := P.pctOrdExp;
  pctAux := P.pctAux;
  
end;

procedure TncPassaporte.AtualizaExpirou;
begin
  pctExpirou := pcExpirou or  (
                ((pcTipoExp=teAcessos) and (pcAcessos>=pcExpirarEm)) or 
                (TempoRestante(pctInicio)=0));
end;

constructor TncPassaporte.Create;
begin
  Limpa;
end;

function TncPassaporte.ExpirarEm(Agora: TDateTime): TDateTime;

function PrimUso: TDateTime;
begin
  if pcPrimeiroUso>0 then
    Result := pcPrimeiroUso else
  if pctInicio>0 then
    Result := pctInicio else
    Result := Agora;
end;

begin
  Result := 0;
  if pctExpirou then Exit;
  case pcTipoExp of
    teDias        : Result := PrimUso + pcExpirarEm;
    teHoras       : Result := PrimUso + (pcExpirarEm / 24);
    teDataMarcada : Result := pcExpirarEm;
    teAcessos     :
    if pcAcessos<Trunc(pcExpirarEm) then
      Result := MaxDateExp else
      Result := 0;
    
    teNunca       : Result := MaxDateExp;
  end;
end;

procedure TncPassaporte.AjustaInicioExpirar(Inicio: TDateTime);
begin
{  pctExpirou := pcExpirou;
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
  pctExpirou := ((pcTipoExp=teAcessos) and (pcAcessos>=pcExpirarEm)) or (TempoRestante(pctInicio)=0);}
end;

function TncPassaporte.GetHoraValida(D, H: Integer): Boolean;
begin
  Result := BitIsSet(pcHorasValidas[D], BitsH[H]);
end;

function TncPassaporte.GetString: String;
begin
  Result :=
    IntToStr(pcID) + sFldDelim +
    Trim(pcNome) + sFldDelim +
    IntToStr(pcCliente) + sFldDelim +
    IntToStr(pcTipoExp)+ sFldDelim +
    IntToStr(pcTipoAcesso) + sFldDelim +
    GetDTStr(pcExpirarEm) + sFldDelim +
    GetDTStr(pcPrimeiroUso) + sFldDelim +
    BoolStr[pcExpirou] + sFldDelim +
    IntToStr(pcMaxSegundos) + sFldDelim +
    IntToStr(pcSegundos) + sFldDelim +
    IntToStr(pcAcessos) + sFldDelim +
    pcSenha + sFldDelim +
    BoolStr[pcValido] + sFldDelim +
    FloatParaStr(pcValor) + sFldDelim +
    HorasValidasToStr + sFldDelim;
end;

procedure TncPassaporte.HorasValidasFromStr(S: String);
var I : Integer;

function pCampo: String;
begin
  Result := GetNextStrDelim(S);
end;

begin
  for I := 1 to 7 do
    pcHorasValidas[I] := StrToIntDef(pCampo, 0);
end;

function TncPassaporte.HorasValidasToStr: String;
var S: Integer;
begin
  Result := '';
  for S := 1 to 7 do begin
    if S>1 then Result := Result + sFldDelim;
    Result := Result + IntToStr(pcHorasValidas[S]);
  end;
end;

procedure TncPassaporte.Limpa;
begin
  pctAux := '';
  pcTipoPass      := 0;
  pcID            := 0;
  pcNome          := '';
  pcFidelidade    := False;
  pcFidPontos     := 0;
  pcCliente       := 0;
  pcSenha         := '';
  pcValor         := 0;
  pcTipoExp       := 0;
  pcTipoAcesso    := 0;
  pcExpirou       := False;
  pcValido        := False;
  pcExpirarEm     := 0;
  pcPrimeiroUso   := 0;
  pcMaxSegundos   := 0;
  pcSegundos      := 0;
  pcAcessos       := 0;
  FillChar(pcHorasValidas, SizeOf(pcHorasValidas), 0);
  pctUsadoMS      := 0;
  pctExpirou      := False;
  pctInicio       := 0;
  pctExpirar      := 0;
  pctInicioUso    := 0;
  pctOrdExp       := 0;
end;

procedure TncPassaporte.LoadFromDataset(D: TDataset);
var F : TField;
begin
  with D do begin
    Limpa;

    F := FindField('TipoPass');
    if F<>nil then begin
      pcTipoPass := F.AsInteger;
      pcID := FieldByName('ID').AsInteger;
    end else
      pcTipoPass := FieldByName('ID').AsInteger;

    F := FindField('Nome');
    if F<>nil then pcNome := F.AsString;

    F := FindField('Fidelidade');
    if F<>nil then pcFidelidade := F.AsBoolean;

    F := FindField('FidPontos');
    if F<>nil then pcFidPontos := F.AsInteger;

    F := FindField('Valor');
    if F<>nil then 
      pcValor := F.AsCurrency;

    F := FindField('Cliente');
    if F<>nil then pcCliente := F.AsInteger;

    pcTipoExp := FieldByName('TipoExp').AsInteger;
    pcTipoAcesso := FieldByName('TipoAcesso').AsInteger;
    
    F := FindField('Senha');
    if F<>nil then pcSenha := F.AsString;

    F := FindField('Expirou');
    if F<>nil then 
      pcExpirou := F.AsBoolean;

    F := FindField('Valido');
    pcValido := (F=nil) or F.AsBoolean;

    pcExpirarEm := FieldByName('ExpirarEm').AsDateTime;
    
    F := FindField('PrimeiroUso');
    if F<>nil then pcPrimeiroUso := F.AsDateTime;

    pcMaxSegundos := FieldByName('MaxSegundos').AsInteger;

    F := FindField('Segundos');
    if F<>nil then pcSegundos := F.AsInteger;

    F := FindField('Acessos');
    if F<>nil then 
      pcAcessos := F.AsInteger;

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

function TncPassaporte.ObtemMinutosRestantes: Double;
begin
  if pcMaxSegundos>pcSegundos then
    Result := (pcMaxSegundos - pcSegundos) / 60 else
    Result := 0;
end;

function TncPassaporte.ObtemTempo(Agora: TDateTime; Dia, H : Integer; DuracaoMS: Cardinal): Cardinal;
var TempoRes : Cardinal;
begin
  Result := 0;
  if (not HoraValida[Dia, H]) or (not pcValido) or pctExpirou then Exit;
{  if (not Ordenando) and (pctInicioUso < 1)  then begin
    pctInicioUso := Agora;
    AjustaInicioExpirar(Agora);
  end;}
  TempoRes := TempoRestante(Agora);
  pctExpirou := (TempoRes=0);
  if not pctExpirou then
    Result := MenorCardinal(DuracaoMS, TempoRes);
  pctUsadoMS := pctUsadoMS + Result;
end;

function TncPassaporte.PrimeiroUso: TDateTime;
begin
  if (pcPrimeiroUso=0) then
    Result := pctInicio
  else
    Result := pcPrimeiroUso;  
end;

procedure TncPassaporte.SaveToDataset(D: TDataset);
var F : TField;
begin
  with D do begin
    F := FindField('Cliente');
    if F<>nil then F.AsInteger := pcCliente;

    F := FindField('TipoPass');
    if F<>nil then 
      F.AsInteger := pcTipoPass;

    F := FindField('Nome');
    if F<>nil then F.AsString := pcNome;

    F := FindField('Fidelidade');
    if F<>nil then F.AsBoolean := pcFidelidade;

    F := FindField('FidPontos');
    if F<>nil then F.AsInteger := pcFidPontos;

    F := FindField('Valor');
    if F<>nil then 
      F.AsCurrency := pcValor;

    FieldByName('TipoExp').AsInteger := pcTipoExp;
    FieldByName('TipoAcesso').AsInteger := pcTipoAcesso;
    
    F := FindField('Senha');
    if F<>nil then 
      F.AsString := pcSenha;

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

procedure TncPassaporte.SetHoraValida(D, H: Integer;
  const Value: Boolean);
begin
  pcHorasValidas[D] := SetBit(pcHorasValidas[D], BitsH[H], Value);
end;

procedure TncPassaporte.SetString(S: String);
var
  I : Integer;

function _NextField: String;
begin
  Result := GetNextStrDelim(S);
end;

begin
  pcID            := StrToIntDef(_NextField, 0);
  pcNome          := _NextField;
  pcCliente       := StrToIntDef(_NextField, 0);
  pcTipoExp       := StrToIntDef(_NextField, 0);
  pcTipoAcesso    := StrToIntDef(_NextField, 0);
  pcExpirarEm     := DTFromStr(_NextField);
  pcPrimeiroUso   := DTFromStr(_NextField);
  pcExpirou       := (_NextField=BoolStr[True]);
  pcMaxSegundos   := StrToIntDef(_NextField, 0);
  pcSegundos      := StrToIntDef(_NextField, 0);
  pcAcessos       := StrToIntDef(_NextField, 0);
  pcSenha         := _NextField;
  pcValido        := (_NextField=BoolStr[True]);
  pcValor         := StrParaFloat(_NextField);
  pctExpirou      := pcExpirou;
  pctUsadoMS      := 0;
  pctInicio       := 0;
  HorasValidasFromStr(S);
end;

function TncPassaporte.TempoRestante(Agora: TDateTime): Cardinal;
begin
  if ((pcMaxSegundos=0) or ((pcSegundos+(pctUsadoMS div 1000))<pcMaxSegundos)) then
  begin
    if (pcMaxSegundos=0) then
      Result := High(Cardinal)
    else
      Result := (pcMaxSegundos*1000) - (pcSegundos*1000) - pctUsadoMS
  end else
    Result := 0;

  if (Agora<ExpirarEm(Agora)) then
    Result := MenorCardinal(DateTimeToTicks(ExpirarEm(Agora)-Agora), Result)
  else
    Result := 0;

  if pcExpirou then
    Result := 0; 

  if Result>0 then 
  if pctInicio=0 then begin
    pctExpirou := pcExpirou;
    pctInicio := Agora;
    pctAux := IntToStr(pcID) + '-' + FormatDateTime('hh:mm:ss', pctInicio);
    pctUsadoMS := 0;
    pctExpirar := 0;
    if pctExpirou then Exit;
    case pcTipoExp of
      teDias        : pctExpirar := PrimeiroUso + pcExpirarEm;
      teHoras       : pctExpirar := PrimeiroUso + (pcExpirarEm / 24);
      teDataMarcada : pctExpirar := pcExpirarEm;
    else  
      pctExpirar := MaxDateExp;
    end;
    pctExpirou := ((pcTipoExp=teAcessos) and (pcAcessos>=Trunc(pcExpirarEm))) or (Agora>=pctExpirar);
  end;
   
end;

procedure TncPassaporte.TotalizaUso;
begin
  AtualizaExpirou;
  pcExpirou := pctExpirou;
  if pctUsadoMS>0 then begin
    pcSegundos := pcSegundos + (pctUsadoMS div 1000);
    pcAcessos := pcAcessos + 1;
    pcPrimeiroUso := PrimeiroUso;
  end;  
end;

procedure TncPassaporte.ZeraInicioUso;
begin
  pctInicioUso  := 0;
  pctUsadoMS    := 0;
  pctExpirou    := False;
  pctInicio     := 0;
  pctExpirar    := 0;
end;

function TncPassaporte.Igual(P: TncPassaporte): Boolean;
begin
  Result := CompareMem(@Self, @P, SizeOf(P))
end;

function TncPassaporte.GeraSenha: String;
begin
  Result := IntToHex(pcID+1000, 0)+Copy(GetMD5Str(IntToStr(pcID+1000)+'cyber'), 1, 4);
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
    if (I>1000) and (UpperCase(S)=Copy(GetMd5Str(IntToStr(I)+'cyber'), 1, 4)) then begin
      Senha := UpperCase(Username);
      Username := 'PREPAGO';
    end;
  end;    
end;

function TncPassaportes.AbateCreditos(aTipoAcesso: Integer; Agora: TDateTime; Tempo: Cardinal): Cardinal;
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
  if count=0 then Exit;
  while Tempo>0 do begin
    Ordenar(Agora, H);
    Falta := MenorCardinal(Falta, Tempo);
    Abater := Falta;
    I := 0;
    while (Abater > 0) and (I<Count) do begin
      with Itens[I] do
      if (pcTipoAcesso=-1) or (pcTipoAcesso=aTipoAcesso) then begin
        Abateu := Itens[I].ObtemTempo(Agora, Dia, H, Abater);
        Agora := Agora + TicksToDateTime(Abateu);
        Result := Result + Abateu;
        Abater := Abater - Abateu;
      end;
      Inc(I);
    end;
    Tempo := Tempo - Falta;
    Agora := Agora + TicksToDateTime(Abater);
    DecodeTime(Agora, H, M, S, MS);
    Dia := DayOfWeek(Agora);
    Falta := 1000 * 60 * 60;
  end;  
end;

procedure TncPassaportes.Add(P: TncPassaporte);
begin
  FItens.Add(P);
end;

procedure TncPassaportes.AjustaInicioExpirar(Inicio: TDateTime);
var I : Integer;
begin
  for I := 0 to Count-1 do
    Itens[I].AjustaInicioExpirar(Inicio);
end;

procedure TncPassaportes.AssignFrom(B: TncPassaportes);
var I: Integer;
begin
  for I := 0 to B.Count - 1 do
    NewPassaporte.AssignFrom(B.Itens[i]);
end;

function TncPassaportes.ContemPassaporte(aID: Integer): Boolean;
var I : Integer;
begin
  Result := True;
  for I := 0 to pred(Count) do 
  if Itens[I].pcID = aID then 
    Exit;
  Result := False;  
end;

function TncPassaportes.Count: Integer;
begin
  Result := FItens.Count
end;

constructor TncPassaportes.Create;
begin
  FItens := TList.Create;
end;

destructor TncPassaportes.Destroy;
begin
  Limpa;
  FItens.Free;
  inherited;
end;

function TncPassaportes.Igual(P: TncPassaportes): Boolean;
var I : Integer;
begin
  Result := False;
  if Count<>P.Count then Exit;
  for I := 0 to Count-1 do
  if not Itens[I].Igual(P.Itens[I]) then Exit;
  Result := True;
end;

procedure TncPassaportes.SetString(S: String);
var
  SL : TStrings;
  I  : Integer;
begin
  Limpa;
  SData := 0;
  SL := TStringList.Create;
  try
    SL.Text := S;
    for I := 0 to SL.Count-1 do
      NewPassaporte.AsString := SL[I];
  finally
    SL.Free;
  end;
end;

procedure TncPassaportes.Limpa;
begin
  while not (Count=0) do begin
    Itens[0].Free;
    FItens.Delete(0);
  end;
end;

procedure TncPassaportes.NewFromDataset(D: TDataset);
var I : Integer;
begin
  for I := 0 to Count-1 do 
    if Itens[i].pcID = D.FieldByName('ID').AsInteger then Exit;
    
  NewPassaporte.LoadFromDataset(D);
end;

function TncPassaportes.NewPassaporte: TncPassaporte;
begin
  Result := TncPassaporte.Create;
  FItens.Add(Result);
end;

function TncPassaportes.GetItem(I: Integer): TncPassaporte;
begin
  Result := TncPassaporte(FItens[I]);
end;

function TncPassaportes.GetString: String;
var I  : Integer;
begin
  Result := '';
  for I := 0 to Count-1 do begin
    if I>0 then Result := Result + SLineBreak;
    Result := Result + Itens[I].AsString;
  end;
end;

procedure TncPassaportes.Ordenar(Data: TDateTime; H: Byte);
var 
  A : TncPassaportes;
  I, Prox, Qtd : Integer;
  AuxD : TDateTime;

function ExpiraMaisCedo: Integer;
var 
  Em: TDateTime;
  x : Integer;
begin
  Result := -1;
  Em := 0;
  for x := 0 to Qtd-1 do 
  if (A[x].pcID<>-1) and ((A[x].pctOrdExp<Em) or (Result=-1)) then begin
    Result := x;
    Em := A[x].pctOrdExp;
  end;  
end;

begin
  AuxD := Trunc(Data) + (H/24);
  if SData=AuxD then Exit;
  SData := AuxD;
  A := TncPassaportes.Create;
  try
    Qtd := Count;
    for I := 0 to Qtd-1 do begin
      A.NewPassaporte.AssignFrom(Itens[I]);
      AuxD := A[I].ExpirarEm(Data);
      A[I].pctOrdExp := AuxD;
    end;  
    for I := 0 to Qtd-1 do begin
      Prox := ExpiraMaisCedo;
      Itens[I].AssignFrom(A[Prox]);
      A[Prox].pcID := -1;
    end;
  finally
    A.Free;
  end;
end;

function TncPassaportes.PorID(aID: Integer): TncPassaporte;
var I: Integer;
begin
  for I := 0 to Count - 1 do
    if Itens[I].pcID = aID then begin
      Result := Itens[I];
      Exit;
    end;
  Result := nil;
end;

function TncPassaportes.TempoRestanteTotal(aAgora: TDateTime): Cardinal;
var 
  B : TncPassaportes;
  I : Integer;
  T : Cardinal;
begin
  B := TncPassaportes.Create;
  try
    B.AssignFrom(Self);
    B.TotalizaUso;
    Result := 0;
    for I := 0 to Count-1 do 
    with B.Itens[i] do begin
      ZeraInicioUso;
      T := TempoRestante(aAgora);
      Self.Itens[i].pctTempoRes := T;
      Result := Result + T;
    end;
  finally
    B.Free;
  end;
end;

function TncPassaportes.TempoTotalDisp(aAgora: TDateTime): Cardinal;
var I: Integer;
begin
  Result := 0;
  for I := 0 to Count - 1 do with Itens[I] do
    if (ExpirarEm(aAgora)>=aAgora) and (pcMaxSegundos>pcSegundos) then
      Result := Result + ((pcMaxSegundos-pcSegundos)*1000);
end;

function TncPassaportes.TempoUsadoTotal: Cardinal;
var I : Integer;
begin
  Result := 0;
  for I := 0 to Count-1 do 
    Result := Result + Itens[I].pctUsadoMS;
end;

procedure TncPassaportes.TotalizaUso;
var I : Integer;
begin
  for I := 0 to Count-1 do 
    Itens[I].TotalizaUso;
end;

procedure TncPassaportes.ZeraInicioUso;
var I : Integer;
begin
  for I  := 0 to Count - 1 do
    Itens[I].ZeraInicioUso;
end;


initialization
  MaxDateExp := EncodeDate(2100, 1, 1);

end.
