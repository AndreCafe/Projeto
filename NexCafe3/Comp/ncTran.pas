unit ncTran;

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
    procedure SetString(const Value: String);
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
  for I := 0 to Count - 1 do begin
    if I>0 then Result := Result + SLineBreak;
    Result := Result + Itens[I].AsString;
  end;
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

procedure TncTransacoes.SetString(const Value: String);
var 
  SL: TStrings;
  I : Integer;
begin
  Limpa;
  SL := TStringList.Create;
  try
    SL.Text := Value;
    for I := 0 to SL.Count - 1 do
      NewTran.AsString := SL[I];
  finally
    SL.Free;
  end;
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
    IntToStr(trID) + sFldDelim +
    GetDTStr(trDataHora) + sFldDelim +
    IntToStr(trTipo) + sFldDelim +
    BoolStr[trCancelado] + sFldDelim +
    trCanceladoPor + sFldDelim +
    GetDTStr(trCanceladoEm) + sFldDelim +
    trFunc + sFldDelim +
    trDescr + sFldDelim +
    FloatParaStr(trTotal) + sFldDelim +
    FloatParaStr(trDesconto) + sFldDelim +
    FloatParaStr(trPago) + sFldDelim;
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
begin
  trID := D.FieldByName('ID').AsInteger;
  trDataHora := D.FieldByName('DataHora').AsDateTime;
  trTipo := D.FieldByName('Tipo').AsInteger;
  trCancelado := D.FieldByName('Cancelado').AsBoolean;
  trCanceladoPor := D.FieldByName('CanceladoPor').AsString;
  trCanceladoEm := D.FieldByName('CanceladoEm').AsDateTime;
  trFunc := D.FieldByName('Func').AsString;
  trDescr := D.FieldByName('Descr').AsString;
  trTotal := D.FieldByName('Total').AsCurrency;
  trDesconto := D.FieldByName('Desconto').AsCurrency;
  trPago := D.FieldByName('Pago').AsCurrency;
end;

procedure TncTransacao.SaveToDataset(D: TDataset);
begin
  if trID=-1 then
    D.FieldByname('ID').Clear else
    D.FieldByName('ID').AsInteger := trID;
    
  D.FieldByName('DataHora').AsDateTime := trDataHora;
  D.FieldByName('Tipo').AsInteger := trTipo;
  D.FieldByName('Cancelado').AsBoolean := trCancelado;
  D.FieldByName('CanceladoPor').AsString := trCanceladoPor;
  D.FieldByName('CanceladoEm').AsDateTime := trCanceladoEm;
  D.FieldByName('Func').AsString := trFunc;
  D.FieldByName('Descr').AsString := trDescr;
  D.FieldByName('Total').AsCurrency := trTotal;
  D.FieldByName('Desconto').AsCurrency := trDesconto;
  D.FieldByName('Pago').AsCurrency := trPago;
end;

procedure TncTransacao.SetString(const Value: String);
var S: String;

function _NextField: String;
begin
  Result := GetNextStrDelim(S);
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
