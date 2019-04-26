unit ncTran;
{
    ResourceString: Dario 13/03/13
}

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

  TncTransacao = class
  public
    trID            : Integer;
    trDataHora      : TDateTime;
    trTipo          : Byte;
    trCancelado     : Boolean;
    trCanceladoPor  : String;
    trCanceladoEm   : TDateTime;
    trFunc          : String;
    trDescr         : String;
    trTotal         : Currency;
    trDesconto      : Currency;
    trPago          : Currency;
  private  
    procedure SetString(const Value: String);
    function GetString: String;
  public  
    constructor Create;
    
    procedure Limpa;
    function Igual(Tran: TncTransacao): Boolean;
    procedure LoadFromDataset(D: TDataset);
    procedure SaveToDataset(D: TDataset);
    property AsString: String
      read GetString write SetString;
  end;

  TncTransacoes = class
  private
    FItens: TList;

    function GetItem(I: Integer): TncTransacao;
    function GetString: String;
    procedure SetString(Value: String);
    function GetCount: Integer;
  public
    constructor Create;

    destructor Destroy; override;

    procedure Limpa;

    function Remove(Tran: TncTransacao): Integer;
    procedure Delete(Index: Integer);
    procedure RemoveByID(const aID: Integer);
    
    function NewTran: TncTransacao;

    property Itens[I: Integer]: TncTransacao
      read GetItem; default;

    property AsString: String
      read GetString write SetString;  

    property Count: Integer
      read GetCount;  

    function TranByID(const aID: Integer): TncTransacao; 

    procedure Totaliza(var aValor, aDesc, aPago: Currency);

    function TotalPendente(aTipoTran: Integer): Currency;
    function Total(aTipoTran: Integer): Currency;
    
  end;
  

implementation

{ TncTransacoes }

constructor TncTransacoes.Create;
begin
  FItens := TList.Create;
end;

procedure TncTransacoes.Delete(Index: Integer);
begin
  FItens.Delete(Index);
end;

destructor TncTransacoes.Destroy;
begin
  Limpa;
  FItens.Free;
  inherited;
end;

function TncTransacoes.GetCount: Integer;
begin
  Result := FItens.Count;
end;

function TncTransacoes.GetItem(I: Integer): TncTransacao;
begin
  Result := TncTransacao(FItens[I]);
end;

function TncTransacoes.GetString: String;
var I : Integer;
begin
  Result := '';
  for I := 0 to Count - 1 do 
    Result := Result + Itens[I].AsString + sListaDelim(classid_TncTransacoes);
end;

procedure TncTransacoes.Limpa;
begin
  while Count>0 do begin
    Itens[0].Free;
    FItens.Delete(0);
  end;
end;

function TncTransacoes.NewTran: TncTransacao;
begin
  Result := TncTransacao.Create;
  FItens.Add(Result)
end;

function TncTransacoes.Remove(Tran: TncTransacao): Integer;
begin
  Result := FItens.Remove(Tran);
end;

procedure TncTransacoes.RemoveByID(const aID: Integer);
var T: TncTransacao;
begin
  T := TranByID(aID);
  if T<>nil then Remove(T);
end;

procedure TncTransacoes.SetString(Value: String);
var S: String;
begin
  Limpa;
  while GetNextListItem(Value, S, classid_TncTransacoes) do
    NewTran.AsString := S;
end;

function TncTransacoes.Total(aTipoTran: Integer): Currency;
var I : Integer;
begin
  Result := 0;
  for I := 0 to Count - 1 do with Itens[I] do 
    if ((aTipoTran=-1) or (trTipo=aTipoTran)) and (not trCancelado) then
      Result := Result + (trTotal-trDesconto);
end;

procedure TncTransacoes.Totaliza(var aValor, aDesc, aPago: Currency);
var I : Integer;
begin
  aValor := 0;
  aDesc  := 0;
  aPago  := 0;
  for I := 0 to Count - 1 do begin
    aValor := aValor + Itens[I].trTotal;
    aDesc  := aDesc + Itens[I].trDesconto;
    aPago  := aPago + Itens[I].trPago;
  end;
end;

function TncTransacoes.TotalPendente(aTipoTran: Integer): Currency;
var I : Integer;
begin
  Result := 0;
  for I := 0 to Count - 1 do with Itens[I] do 
    if ((aTipoTran=-1) or (trTipo=aTipoTran)) and (not trCancelado) then
      Result := Result + (trTotal-trDesconto-trPago);
end;

function TncTransacoes.TranByID(const aID: Integer): TncTransacao;
var I : Integer;
begin
  Result := nil;
  for I := 0 to Count-1 do
  if Itens[I].trID=aID then begin
    Result := Itens[I];
    Exit;
  end;
end;

{ TncTransacao }

constructor TncTransacao.Create;
begin
  Limpa;
end;

function TncTransacao.GetString: String;
begin
  Result :=
    IntToStr(trID) + sFldDelim(classid_TncTransacao) +
    GetDTStr(trDataHora) + sFldDelim(classid_TncTransacao) +
    IntToStr(trTipo) + sFldDelim(classid_TncTransacao) +
    BoolStr[trCancelado] + sFldDelim(classid_TncTransacao) +
    trCanceladoPor + sFldDelim(classid_TncTransacao) +
    GetDTStr(trCanceladoEm) + sFldDelim(classid_TncTransacao) +
    trFunc + sFldDelim(classid_TncTransacao) +
    trDescr + sFldDelim(classid_TncTransacao) +
    FloatParaStr(trTotal) + sFldDelim(classid_TncTransacao) +
    FloatParaStr(trDesconto) + sFldDelim(classid_TncTransacao) +
    FloatParaStr(trPago) + sFldDelim(classid_TncTransacao);
end;

function TncTransacao.Igual(Tran: TncTransacao): Boolean;
begin
  Result := False;
  if trID <> Tran.trID then Exit;
  if trDataHora <> Tran.trDataHora then Exit;
  if trTipo <> Tran.trTipo then Exit;
  if trCancelado <> Tran.trCancelado then Exit;
  if trCanceladoPor <> Tran.trCanceladoPor then Exit;
  if trCanceladoEm <> Tran.trCanceladoEm then Exit;
  if trFunc <> Tran.trFunc then Exit;
  if trDescr <> Tran.trDescr then Exit;
  if trTotal <> Tran.trTotal then Exit;
  if trDesconto <> Tran.trDesconto then Exit;
  if trPago <> Tran.trPago then Exit;
  
  Result := True;
end;

procedure TncTransacao.Limpa;
begin
  trID            := -1;
  trDataHora      := 0;
  trTipo          := 0;
  trCancelado     := False;
  trCanceladoPor  := '';
  trCanceladoEm   := 0;
  trFunc          := '';
  trDescr         := '';
  trTotal         := 0;
  trDesconto      := 0;
  trPago          := 0;
end;

procedure TncTransacao.LoadFromDataset(D: TDataset);
var S: String;
begin
  trID := D.FieldByName('ID').AsInteger; // do not localize
  trDataHora := D.FieldByName('DataHora').AsDateTime; // do not localize
  trTipo := D.FieldByName('Tipo').AsInteger; // do not localize
  trCancelado := D.FieldByName('Cancelado').AsBoolean; // do not localize
  trCanceladoPor := D.FieldByName('CanceladoPor').AsString; // do not localize
  trCanceladoEm := D.FieldByName('CanceladoEm').AsDateTime; // do not localize
  trFunc := D.FieldByName('Func').AsString; // do not localize
  trDescr := D.FieldByName('Descr').AsString; // do not localize
  trTotal := D.FieldByName('Total').AsCurrency; // do not localize
  trDesconto := D.FieldByName('Desconto').AsCurrency; // do not localize
  trPago := D.FieldByName('Pago').AsCurrency; // do not localize
end;

procedure TncTransacao.SaveToDataset(D: TDataset);
begin
  if trID=-1 then
    D.FieldByname('ID').Clear else // do not localize
    D.FieldByName('ID').AsInteger := trID; // do not localize
    
  D.FieldByName('DataHora').AsDateTime := trDataHora; // do not localize
  D.FieldByName('Tipo').AsInteger := trTipo; // do not localize
  D.FieldByName('Cancelado').AsBoolean := trCancelado; // do not localize
  D.FieldByName('CanceladoPor').AsString := trCanceladoPor; // do not localize
  D.FieldByName('CanceladoEm').AsDateTime := trCanceladoEm; // do not localize
  D.FieldByName('Func').AsString := trFunc; // do not localize
  D.FieldByName('Descr').AsString := trDescr; // do not localize
  D.FieldByName('Total').AsCurrency := trTotal; // do not localize
  D.FieldByName('Desconto').AsCurrency := trDesconto; // do not localize
  D.FieldByName('Pago').AsCurrency := trPago; // do not localize
end;

procedure TncTransacao.SetString(const Value: String);
var S: String;

function _NextField: String;
begin
  Result := GetNextStrDelim(S, classid_TncTransacao);
end;

begin
  S := Value;
  trID := StrToIntDef(_NextField, -1);
  trDataHora := DTFromStr(_NextField);
  trTipo := StrToIntDef(_NextField, 0);
  trCancelado     := (_NextField = BoolStr[True]);
  trCanceladoPor  := _NextField;
  trCanceladoEm   := DTFromStr(_NextField);
  trFunc          := _NextField;
  trDescr         := _NextField;
  trTotal         := StrParaFloat(_NextField);
  trDesconto      := StrParaFloat(_NextField);
  trPago          := StrParaFloat(_NextField);
end;

end.

