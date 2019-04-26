unit ncTempo;

interface

uses
  SysUtils,
  DB,
  MD5,
  Classes,
  Windows,
  ClasseCS,
  ncClassesBase;

type

  TncTempo = class
  private
    function GetString: String;
    procedure SetString(const Value: String);
  public
    teID        : Integer;
    teDataHora  : TDateTime;
    teFunc      : String;
    teTipo      : Byte;
    teMinutos   : Double;
    teIDPacPass : Integer;
    teTotal     : Currency;
    teDesconto  : Currency;
    tePago      : Currency;
    teCliente   : Integer;
    teMaq       : Word;
    teSessao    : Integer;
    teCancelado : Boolean;
    teTran      : Integer;
    teCaixa     : Integer;
    _Operacao   : Byte;

    constructor Create;
    procedure Limpa;

    procedure AssignFrom(T: TncTempo);

    function Igual(T: TncTempo): Boolean;

    function Debito: Currency;

    procedure SaveToDataset(D: TDataset);
    procedure SaveToITranDataset(D: TDataset);
    procedure SaveToTran(D: TDataset);

    procedure SaveToStream(S: TStream);
    
    procedure LoadFromDataset(D: TDataset);       
    procedure LoadFromStream(S: TStream);
    
    property AsString: String
      read GetString write SetString;
  end;

  TncTempos = class
  private
    FItens : TList;
    function GetItem(I: Integer): TncTempo;
    function GetString: String;
    procedure SetString(Value: String);
  public
    constructor Create;
    destructor Destroy; override;

    procedure AjustaOperacao(B: TncTempos);
    
    procedure Limpa;

    function Count: Integer;

    function NewItem: TncTempo;
    
    function GetItemByID(aID: Integer): TncTempo;
    
    property Itens[I: Integer]: TncTempo 
      read GetItem; Default;

    property AsString: String
      read GetString write SetString;  
  
  end;
    

implementation


{ TncTempo }

procedure TncTempo.AssignFrom(T: TncTempo);
begin
  teID := T.teID;
  teDataHora := T.teDataHora;
  teFunc := T.teFunc;
  teTipo := T.teTipo;
  teMinutos := T.teMinutos;
  teIDPacPass := T.teIDPacPass;
  teTotal := T.teTotal;
  teDesconto := T.teDesconto;
  tePago := T.tePago;
  teCliente := T.teCliente;
  teMaq := T.teMaq;
  teSessao := T.teSessao;
  teCancelado := T.teCancelado;
  teTran := T.teTran ;
  teCaixa := T.teCaixa;
  _Operacao := T._Operacao;
end;

constructor TncTempo.Create;
begin
  Limpa;
end;                                   

function TncTempo.Debito: Currency;
begin
  Result := teTotal - teDesconto - tePago;
end;

function TncTempo.GetString: String;
begin
  Result := 
    IntToStr(teID) + sFldDelim(classid_TncTempo) +
    GetDTStr(teDataHora) + sFldDelim(classid_TncTempo) +
    teFunc + sFldDelim(classid_TncTempo) +
    IntToStr(teTipo) + sFldDelim(classid_TncTempo) + 
    FloatParaStr(teMinutos) + sFldDelim(classid_TncTempo) +
    IntToStr(teIDPacPass) + sFldDelim(classid_TncTempo) +
    FloatParaStr(teTotal) + sFldDelim(classid_TncTempo) +
    FloatParaStr(teDesconto) + sFldDelim(classid_TncTempo) +
    FloatParaStr(tePago) + sFldDelim(classid_TncTempo) +
    IntToStr(teCliente) + sFldDelim(classid_TncTempo) +
    IntToStr(teMaq) + sFldDelim(classid_TncTempo) +
    IntToStr(teSessao) + sFldDelim(classid_TncTempo) +
    BoolStr[teCancelado] + sFldDelim(classid_TncTempo) +
    IntToStr(teTran) + sFldDelim(classid_TncTempo) +
    IntToStr(teCaixa) + sFldDelim(classid_TncTempo) + 
    IntToStr(_Operacao) + sFldDelim(classid_TncTempo);
end;

function TncTempo.Igual(T: TncTempo): Boolean;
begin
  Result := False;
  if teID <> T.teID then Exit;
  if teDataHora <> T.teDataHora then Exit;
  if teFunc <> T.teFunc then Exit;
  if teTipo <> T.teTipo then Exit;
  if teMinutos <> T.teMinutos then Exit;
  if teIDPacPass <> T.teIDPacPass then Exit;
  if teTotal <> T.teTotal then Exit;
  if teDesconto <> T.teDesconto then Exit;
  if tePago <> T.tePago then Exit;
  if teCliente <> T.teCliente then Exit;
  if teMaq <> T.teMaq then Exit;
  if teSessao <> T.teSessao then Exit;
  if teCancelado <> T.teCancelado then Exit;
  if teTran <> T.teTran  then Exit;
  if teCaixa <> T.teCaixa then Exit;
  if _Operacao <> T._Operacao then Exit;
  Result := True;
end;

procedure TncTempo.Limpa;
begin
  teID        := -1;
  teDataHora  := 0;
  teFunc      := '';
  teTipo      := tctPrevisao;
  teMinutos   := 0;
  teIDPacPass := 0;
  teTotal     := 0;
  teDesconto  := 0;
  tePago      := 0;
  teCliente   := 0;
  teMaq       := 0;
  teSessao    := 0;
  teCancelado := False;
  teTran      := -1;
  teCaixa     := 0;
  _Operacao   := osNenhuma;
end;

procedure TncTempo.LoadFromDataset(D: TDataset);
begin
  teID := D.FieldByName('ID').AsInteger;
  teDataHora := D.FieldByName('DataHora').AsDateTime;
  teFunc := D.FieldByName('Func').AsString;
  teTipo := D.FieldByName('Tipo').AsInteger;
  teMinutos := D.FieldByName('Minutos').AsFloat;
  teIDPacPass := D.FieldByName('IDPacPass').AsInteger;
  teTotal := D.FieldByName('Total').AsCurrency;
  teDesconto := D.FieldByName('Desconto').AsCurrency;
  tePago := D.FieldByName('Pago').AsCurrency;
  teCliente := D.FieldByName('Cliente').AsInteger;
  teMaq := D.FieldByName('Maq').AsInteger;
  teSessao := D.FieldByName('Sessao').AsInteger;
  teCancelado := D.FieldByName('Cancelado').AsBoolean;
  teTran := D.FieldByName('Tran').AsInteger;
  teCaixa := D.FieldByName('Caixa').AsInteger;
  _Operacao := osNenhuma;
end;

procedure TncTempo.LoadFromStream(S: TStream);
var
  Str: String;
  I: Integer;
begin
  S.Read(I, SizeOf(I));
  if I>0 then begin
    SetLength(Str, I);
    S.Read(Str[1], I);
    AsString := Str;
  end else
    Limpa;
end;

procedure TncTempo.SaveToDataset(D: TDataset);
begin
  if teID<>-1 then
    D.FieldByName('ID').AsInteger := teID else
    D.FieldByName('ID').Clear;
    
  D.FieldByName('DataHora').AsDateTime := teDataHora;
  D.FieldByName('Func').AsString := teFunc;
  D.FieldByName('Tipo').AsInteger := teTipo;
  D.FieldByName('Minutos').AsFloat := teMinutos;
  D.FieldByName('IDPacPass').AsInteger := teIDPacPass;
  D.FieldByName('Total').AsCurrency := teTotal;
  D.FieldByName('Desconto').AsCurrency := teDesconto;
  D.FieldByName('Pago').AsCurrency := tePago;
  D.FieldByName('Cliente').AsInteger := teCliente;
  D.FieldByName('Maq').AsInteger := teMaq;
  D.FieldByName('Sessao').AsInteger := teSessao;
  D.FieldByName('Cancelado').AsBoolean := teCancelado;
  D.FieldByName('Tran').AsInteger := teTran;
  D.FieldByName('Caixa').AsInteger := teCaixa;
end;

procedure TncTempo.SaveToITranDataset(D: TDataset);
begin
  D.FieldByName('Tran').AsInteger := teTran;
  D.FieldByName('Caixa').AsInteger := teCaixa;
  D.FieldByName('DataHora').AsDateTime := teDataHora;
  D.FieldByName('Caixa').AsInteger := teCaixa;
  D.FieldByName('TipoItem').AsInteger := itMovEst;
  D.FieldByName('ItemID').AsInteger := teID;
  D.FieldByname('ItemPos').AsInteger := 1;
  D.FieldByName('Total').AsCurrency := teTotal;
  D.FieldByName('Desconto').AsCurrency := teDesconto;
  D.FieldByName('Pago').AsCurrency := tePago;
  D.FieldByName('Cancelado').AsBoolean := teCancelado;
  D.FieldByName('Sessao').AsInteger := teSessao;
end;

procedure TncTempo.SaveToStream(S: TStream);
var
  Str: String;
  I: Integer;
begin
  Str := AsString;
  I := Length(Str);
  S.Write(I, SizeOf(I));
  if I>0 then 
    S.Write(Str[1], I);
end;

procedure TncTempo.SaveToTran(D: TDataset);
begin
  D.FieldByName('Caixa').AsInteger := teCaixa;
  D.FieldByName('DataHora').AsDateTime := teDataHora;
  D.FieldByName('Caixa').AsInteger := teCaixa;
  D.FieldByName('Total').AsCurrency := teTotal;
  D.FieldByName('Desconto').AsCurrency := teDesconto;
  D.FieldByName('Pago').AsCurrency := tePago;
  D.FieldByName('Cancelado').AsBoolean := teCancelado;
  D.FieldByName('Sessao').AsInteger := teSessao;
end;

procedure TncTempo.SetString(const Value: String);
var S: String;

function _NextField: String;
begin
  Result := GetNextStrDelim(S, classid_TncTempo);
   
end;

begin
  Limpa;
  teID := StrToIntDef(_NextField, -1);
  teDataHora := DTFromStr(_NextField);
  teFunc := _NextField;
  teTipo := StrToIntDef(_NextField, 0);
  teMinutos := StrParaFloat(_NextField);
  teIDPacPass := StrToIntDef(_NextField, 0);
  teTotal := StrParaFloat(_NextField);
  teDesconto := StrParaFloat(_NextField);
  tePago := StrParaFloat(_NextField);
  teCliente := StrToIntDef(_NextField, 0);
  teMaq := StrToIntDef(_NextField, 0);
  teSessao := StrToIntDef(_NextField, 0);
  teCancelado := (BoolStr[True]=_NextField);
  teTran := StrToIntDef(_NextField, -1);
  teCaixa := StrToIntDef(_NextField, 0);
  _Operacao := osNenhuma;
end;

{ TncTempos }

procedure TncTempos.AjustaOperacao(B: TncTempos);
var 
  I, N : Integer;
  T : TncTempo;
begin
  N := 0;
  for I := 0 to B.Count - 1 do 
  if not B[I]._Operacao<>osExcluir then begin
    Inc(N);
    B[I].teID := N;
  end;
    
  for I := 0 to Count - 1 do with Itens[I] do 
  if (teID<>-1) and (B.GetItemByID(teID)=nil) then
    _Operacao := osExcluir;

  for I := 0 to B.Count - 1 do
    if (B[I].teID=-1) then begin
      B[I]._Operacao := osIncluir;
      NewItem.AssignFrom(B[I]);
    end
    else begin
      T := GetItemByID(B[I].teID);
      if T<>nil then begin
        if T.Igual(B[I]) then
          B[I]._Operacao := osNenhuma else
          B[I]._Operacao := osAlterar;
        T.AssignFrom(B[I]);
      end;
    end;

  for I := Count-1 downto 0 do
  if Itens[I]._Operacao=osNenhuma then begin
    Itens[I].Free;
    FItens.Delete(I);
  end;  
end;

function TncTempos.Count: Integer;
begin
  Result := FItens.Count;
end;

constructor TncTempos.Create;
begin
  FItens := TList.Create;
end;

destructor TncTempos.Destroy;
begin
  Limpa;
  FItens.Free;
  inherited;
end;

function TncTempos.GetItem(I: Integer): TncTempo;
begin
  Result := TncTempo(FItens[I]);
end;

function TncTempos.GetItemByID(aID: Integer): TncTempo;
var I : Integer;
begin
  for I := 0 to FItens.Count - 1 do with Itens[I] do 
  if teID=aID then begin
    Result := Itens[I];
    Exit;
  end;
  Result := nil;
end;

function TncTempos.GetString: String;
var I : Integer;
begin
  Result := '';
  for I := 0 to Count - 1 do 
    Result := Result + Itens[I].AsString + sListaDelim(classid_TncTempos);
end;

procedure TncTempos.Limpa;
begin
  while Count>0 do begin
    Itens[0].Free;
    FItens.Delete(0);
  end;
end;

function TncTempos.NewItem: TncTempo;
begin
  Result := TncTempo.Create;
  FItens.Add(Result);
end;

procedure TncTempos.SetString(Value: String);
var S: String;
begin
  Limpa;
  while GetNextListItem(Value, S, classid_TncTempos) do
    NewItem.AsString := S;
end;

end.
