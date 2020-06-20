unit ncDebito;
{
    ResourceString: Dario 12/03/13
}


interface

uses
  SysUtils,
  DB,
  Classes,
  Windows,
  ClasseCS,
  ncEspecie,
  ncClassesBase;

type

  TncItemDebito = class
  private
    function GetString: String;
    procedure SetString(const Value: String);
  public
    idID        : Integer;
    idTran      : Cardinal;
    idCaixa     : Cardinal;
    idDataHora  : TDateTime;
    idTipoItem  : Byte;
    idItemID    : Cardinal;
    idItemPos   : Byte;
    idTotal     : Currency;
    idDesconto  : Currency;
    idPago      : Currency;
    idCancelado : Boolean;
    _Operacao   : Byte;

    constructor Create;
    procedure Limpa;

    procedure AssignFrom(B: TncItemDebito);

    function Igual(B: TncItemDebito): Boolean;

    function ValorPagar: Currency;

    procedure SaveToITran(D: TDataset);
    procedure LoadFromITran(D: TDataset);

    procedure LoadFromDebito(D: TDataset);
    
    property AsString: String
      read GetString write SetString;
    
  end; 

  TncItensDebito = class
  private
    FItens : TList;
    function GetItem(I: Integer): TncItemDebito;
    function GetString: String;
    procedure SetString(Value: String);
  public
    constructor Create;
    destructor Destroy; override;

    procedure Remove(IME: TncItemDebito);
    procedure Delete(aIndex: Integer);
    
    procedure Limpa;

    function Count: Integer;

    function NewItem: TncItemDebito;

    function GetItemByID(aID: Integer): TncItemDebito;
    function GetItemByTran(aTran: Integer): TncItemDebito;
    
    property Itens[I: Integer]: TncItemDebito
      read GetItem; Default;

    property AsString: String
      read GetString write SetString;  
  
  end;

  TncDebito = class (TClasseCS)
  private
    FID          : Integer;
    FDataHora    : TDateTime;
    FCliente     : Integer;
    FFunc        : String;
    FTotal       : Currency;
    FDesconto    : Currency;
    FDescPerc    : Double;
    FDescPorPerc : Boolean;
    
    FPago        : Currency;
    FObs         : String;
    FCancelado   : Boolean;
    FCanceladoPor: String;
    FCanceladoEm : TDateTime;
    FCaixa       : Integer;
    FNomeCliente : String;
    FOperacao    : Byte;
    FRecibo      : Boolean;
    FPagEspecies : TncPagEspecies;
    
    FItens       : TncItensDebito;
    FPagEsp: TncPagEspecies;
    function GetStrItens: String;
    procedure SetStrItens(const Value: String);
    procedure SetCaixa(const Value: Integer);
    procedure SetCancelado(const Value: Boolean);
    procedure SetID(const Value: Integer);
    function GetPagEspStr: String;
    procedure SetPagEspStr(const Value: String);
  protected
    function GetChave: Variant; override;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Limpa;

    procedure SalvaDescPago;

    function PagouTotal: Boolean;

    property PagEsp: TncPagEspecies read FPagEsp;
    property Itens: TncItensDebito read FItens;
  published
    property ID : Integer
      read FID write SetID;
      
    property DataHora : TDateTime
      read FDataHora write FDataHora;
      
    property Cliente : Integer
      read FCliente write FCliente;
      
    property Func : String
      read FFunc write FFunc;
      
    property Total : Currency
      read FTotal write FTotal;
      
    property Desconto : Currency
      read FDesconto write FDesconto;

    property DescPerc: Double
      read FDescPerc write FDescPerc;

    property DescPorPerc: Boolean
      read FDescPorPerc write FDescPorPerc;
      
    property Pago : Currency
      read FPago write FPago;

    property Obs : String
      read FObs write FObs;
      
    property Cancelado : Boolean
      read FCancelado write SetCancelado;
      
    property CanceladoPor : String
      read FCanceladoPor write FCanceladoPor;
      
    property CanceladoEm : TDateTime
      read FCanceladoEm write FCanceladoEm;
      
    property Caixa : Integer
      read FCaixa write SetCaixa;
      
    property NomeCliente : String
      read FNomeCliente write FNomeCliente;
      
    property Operacao: Byte
      read FOperacao write FOperacao;

    property Recibo : Boolean
      read FRecibo write FRecibo;

    property PagEspStr: String
      read GetPagEspStr write SetPagEspStr;  
        
    property StrItens: String
      read GetStrItens write SetStrItens;  
  end;
  
implementation
  
{ TncItemDebito }

procedure TncItemDebito.AssignFrom(B: TncItemDebito);
begin
  idID        := B.idID;
  idTran      := B.idTran;
  idCaixa     := B.idCaixa;
  idDataHora  := B.idDataHora;
  idTipoItem  := B.idTipoItem;
  idItemID    := B.idItemID;
  idItemPos   := B.idItemPos;
  idTotal     := B.idTotal;
  idDesconto  := B.idDesconto;
  idPago      := B.idPago;
  idCancelado := B.idCancelado;
  _Operacao   := B._Operacao;
end;

constructor TncItemDebito.Create;
begin
  Limpa;
end;

function TncItemDebito.GetString: String;
begin
  Result :=
    IntToStr(idID) + sFlddelim(classid_TncItemDebito) +
    IntToStr(idTran) + sFlddelim(classid_TncItemDebito) +
    IntToStr(idCaixa) + sFldDelim(classid_TncItemDebito) +
    GetDTStr(idDataHora) + sFldDelim(classid_TncItemDebito) + 
    IntToStr(idTipoItem) + sFldDelim(classid_TncItemDebito) +
    IntToStr(idItemID) + sFldDelim(classid_TncItemDebito) +
    IntToStr(idItemPos) + sFldDelim(classid_TncItemDebito) +
    FloatParaStr(idTotal) + sFldDelim(classid_TncItemDebito) +
    FloatParaStr(idDesconto) + sFldDelim(classid_TncItemDebito) +
    FloatParaStr(idPago) + sFldDelim(classid_TncItemDebito) +
    BoolStr[idCancelado] + sFldDelim(classid_TncItemDebito) +
    IntToStr(_Operacao) + sFldDelim(classid_TncItemDebito);
end;

function TncItemDebito.Igual(B: TncItemDebito): Boolean;
begin
  Result := False;
  if idID        <> B.idID then Exit;
  if idTran      <> B.idTran then Exit;
  if idCaixa     <> B.idCaixa then Exit;
  if idDataHora  <> B.idDataHora then Exit;
  if idTipoItem  <> B.idTipoItem then Exit;
  if idItemID    <> B.idItemID then Exit;
  if idItemPos   <> B.idItemPos then Exit;
  if idTotal     <> B.idTotal then Exit;
  if idDesconto  <> B.idDesconto then Exit;
  if idPago      <> B.idPago then Exit;
  if idCancelado <> B.idCancelado then Exit;
  Result := True;
end;

procedure TncItemDebito.Limpa;
begin
  idID        := -1;
  idTran      := 0;
  idCaixa     := 0;
  idDataHora  := 0;
  idTipoItem  := 0;
  idItemID    := 0;
  idItemPos   := 0;
  idTotal     := 0;
  idDesconto  := 0;
  idPago      := 0;
  idCancelado := False;
  _Operacao   := osNenhuma;
end;

procedure TncItemDebito.LoadFromDebito(D: TDataset);
var S: String;
begin
  idID := -1;
  idTran := 0;
  idCaixa := 0;
  idDataHora := 0;
  S := D.FieldByName('ID').AsString;
  if S='-39383' then Exit;
  
  idTipoItem := D.FieldByName('Tipo').AsInteger;
  idItemID   := D.FieldByName('ID').AsInteger;
  idItemPos := 0;
  idTotal    := D.FieldByName('Valor').AsCurrency; // do not localize
  idDesconto := 0;
  idPago := 0;
  idCancelado := False;
end;

procedure TncItemDebito.LoadFromITran(D: TDataset);
begin
  idID        := D.FieldByName('ID').AsInteger; // do not localize
  idTran      := D.FieldByName('Tran').AsInteger; // do not localize
  idCaixa     := D.FieldByName('Caixa').AsInteger; // do not localize
  idDataHora  := D.FieldByName('DataHora').AsDateTime; // do not localize
  idTipoItem  := D.FieldByName('TipoItem').AsInteger; // do not localize
  idItemID    := D.FieldByName('ItemID').AsInteger; // do not localize
  idItemPos   := D.FieldByName('ItemPos').AsInteger; // do not localize
  idTotal     := D.FieldByName('Total').AsCurrency; // do not localize
  idDesconto  := D.FieldByName('Desconto').AsCurrency; // do not localize
  idPago      := D.FieldByName('Pago').AsCurrency; // do not localize
  idCancelado := D.FieldByName('Cancelado').AsBoolean; // do not localize
end;

procedure TncItemDebito.SaveToITran(D: TDataset);
begin
  D.FieldByName('Tran').AsInteger := idTran; // do not localize
  D.FieldByName('Caixa').AsInteger := idCaixa    ; // do not localize
  D.FieldByName('Sessao').AsInteger := 0; // do not localize
  D.FieldByName('DataHora').AsDateTime := idDataHora; // do not localize
  D.FieldByName('TipoTran').AsInteger := trPagDebito; // do not localize
  D.FieldByName('TipoItem').AsInteger := idTipoItem; // do not localize
  D.FieldByName('ItemID').AsInteger := idItemID; // do not localize
  D.FieldByName('ItemPos').AsInteger := idItemPos; // do not localize
  D.FieldByName('Total').AsCurrency := idTotal; // do not localize
  D.FieldByName('Desconto').AsCurrency := idDesconto; // do not localize
  D.FieldByName('Pago').AsCurrency := idPago; // do not localize
  D.FieldByName('Cancelado').AsBoolean := idCancelado; // do not localize
end;

procedure TncItemDebito.SetString(const Value: String);
var 
  S, Str: String;
  I64 : Int64;

function pCampo: String;
begin
  Result := GetNextStrDelim(S, classid_TncItemDebito);
end;

begin
  S := Value;
  idID := StrToIntDef(pCampo, -1);
  idTran := StrToIntDef(pCampo, 0);
  idCaixa := StrToIntDef(pCampo, 0);
  idDataHora := DTFromStr(pCampo);
  idTipoItem := StrToIntDef(pCampo, 0);
  Str := pCampo;
  I64 := StrToInt64Def(Str, 0);
  idItemID := I64;
  idItemPos := StrToIntDef(pCampo, 0);
  idTotal := StrParaFloat(pCampo);
  idDesconto := StrParaFloat(pCampo);
  idPago := StrParaFloat(pCampo);
  idCancelado := (pCampo = BoolStr[True]);
  _Operacao := StrToIntDef(pCampo, 0);
end;

function TncItemDebito.ValorPagar: Currency;
begin
  Result := idTotal - idDesconto;
end;

{ TncItensDebito }

function TncItensDebito.Count: Integer;
begin
  Result := FItens.Count;
end;

constructor TncItensDebito.Create;
begin
  FItens := TList.Create;
end;

procedure TncItensDebito.Delete(aIndex: Integer);
begin
  FItens.Delete(aIndex);
end;

destructor TncItensDebito.Destroy;
begin
  Limpa;
  FItens.Free;
  inherited;
end;

function TncItensDebito.GetItem(I: Integer): TncItemDebito;
begin
  Result := TncItemDebito(FItens[I]);
end;

function TncItensDebito.GetItemByID(aID: Integer): TncItemDebito;
var i: Integer;
begin
  for i := 0 to Count-1 do 
    if aID = Itens[I].idID then begin
      Result := Itens[i];
      Exit;
    end;
  Result := nil;  
end;

function TncItensDebito.GetItemByTran(aTran: Integer): TncItemDebito;
var i: Integer;
begin
  for i := 0 to Count-1 do 
    if aTran = Itens[I].idTran then begin
      Result := Itens[i];
      Exit;
    end;
  Result := nil;  
end;

function TncItensDebito.GetString: String;
var i: Integer;
begin
  Result := '';
  for I := 0 to Count - 1 do 
    Result := Result + Itens[i].AsString + sListaDelim(classid_TncItensDebito);
end;

procedure TncItensDebito.Limpa;
begin
  while Count>0 do begin
    Itens[0].Free;
    FItens.Delete(0);
  end;
end;

function TncItensDebito.NewItem: TncItemDebito;
begin
  Result := TncItemDebito.Create;
  FItens.Add(Result);
end;

procedure TncItensDebito.Remove(IME: TncItemDebito);
begin
  FItens.Remove(IME);
end;

procedure TncItensDebito.SetString(Value: String);
var S: String;
begin
  while GetNextListItem(Value, S, classid_TncItensDebito) do
    NewItem.AsString := S;
end;

{ TncDebito }

constructor TncDebito.Create;
begin
  inherited;
  FItens := TncItensDebito.Create;
  FPagEsp := TncPagEspecies.Create;
  Limpa;
end;

destructor TncDebito.Destroy;
begin
  Limpa;
  FPagEsp.Free;
  FItens.Free;
  inherited;
end;

function TncDebito.GetChave: Variant;
begin
  Result := FID;
end;

function TncDebito.GetPagEspStr: String;
begin
  Result := FPagEsp.AsString;
end;

function TncDebito.GetStrItens: String;
begin
  Result := FItens.AsString;
end;

procedure TncDebito.Limpa;
begin
  FID          := -1;
  FDataHora    := 0;
  FCliente     := 0;
  FFunc        := '';
  FTotal       := 0;
  FDesconto    := 0;
  FDescperc    := 0;
  FDescPorPerc := False;
  FPago        := 0;
  FObs         := '';
  FCancelado   := False;
  FCanceladoPor:= '';
  FCanceladoEm := 0;
  FCaixa       := 0;
  FNomeCliente := '';
  FOperacao    := osNenhuma;
  FRecibo      := False;
  FItens.Limpa;
  FPagEsp.Clear;
end;

function TncDebito.PagouTotal: Boolean;
begin

end;

procedure TncDebito.SalvaDescPago;
var
  PercDesc: Extended;
  vPago, vDesc : Currency;
  I : Integer;
begin
  vPago := Pago;
  vDesc := Desconto;
  if (Total=0) or (Desconto < 0.01) then
    PercDesc := 0 else
    PercDesc := Desconto / Total;
    
  for I := 0 to Itens.Count - 1 do 
  with Itens[I] do begin
    if I=(Itens.Count-1) then
      idDesconto := vDesc else
      idDesconto := DuasCasas(PercDesc * idTotal);
    vDesc := vDesc - idDesconto;  
    if vPago>=ValorPagar then
      idPago := ValorPagar else
      idPago := vPago;
    vPago := vPago - idPago;
  end;
end;

procedure TncDebito.SetCaixa(const Value: Integer);
var i: Integer;
begin
  FCaixa := Value;
  for I := 0 to Itens.Count - 1 do
    Itens[I].idCaixa := Value;
end;

procedure TncDebito.SetCancelado(const Value: Boolean);
var I: Integer;
begin
  FCancelado := Value;
  for I := 0 to Itens.Count - 1 do
    Itens[I].idCancelado := Value;
end;

procedure TncDebito.SetID(const Value: Integer);
var
  I: Integer;
begin
  FID := Value;
  for I := 0 to Itens.Count - 1 do
    Itens[I].idTran := Value;
end;

procedure TncDebito.SetPagEspStr(const Value: String);
begin
  FPagEsp.AsString := Value;
end;

procedure TncDebito.SetStrItens(const Value: String);
begin
  FItens.AsString := Value;
end;

end.

