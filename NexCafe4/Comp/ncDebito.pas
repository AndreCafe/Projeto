unit ncDebito;

interface

uses
  SysUtils,
  DB,
  Classes,
  Windows,
  ClasseCS,
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
    procedure SetString(const Value: String);
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
    FPago        : Currency;
    FObs         : String;
    FCancelado   : Boolean;
    FCanceladoPor: String;
    FCanceladoEm : TDateTime;
    FCaixa       : Integer;
    FNomeCliente : String;
    FOperacao    : Byte;
    FRecibo      : Boolean;
    
    FItens       : TncItensDebito;
    function GetStrItens: String;
    procedure SetStrItens(const Value: String);
    procedure SetCaixa(const Value: Integer);
    procedure SetCancelado(const Value: Boolean);
    procedure SetID(const Value: Integer);
  protected
    function GetChave: Variant; override;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Limpa;

    procedure SalvaDescPago;

    function PagouTotal: Boolean;

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
    IntToStr(idID) + sFlddelim +
    IntToStr(idTran) + sFlddelim +
    IntToStr(idCaixa) + sFldDelim +
    GetDTStr(idDataHora) + sFldDelim + 
    IntToStr(idTipoItem) + sFldDelim +
    IntToStr(idItemID) + sFldDelim +
    IntToStr(idItemPos) + sFldDelim +
    FloatParaStr(idTotal) + sFldDelim +
    FloatParaStr(idDesconto) + sFldDelim +
    FloatParaStr(idPago) + sFldDelim +
    BoolStr[idCancelado] + sFldDelim +
    IntToStr(_Operacao) + sFldDelim;
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
begin
  idID := -1;
  idTran := 0;
  idCaixa := 0;
  idDataHora := 0;
  idTipoItem := D.FieldByName('Tipo').AsInteger;
  idItemID   := D.FieldByName('ID').AsInteger;
  idItemPos := 0;
  idTotal    := D.FieldByName('Valor').AsCurrency;
  idDesconto := 0;
  idPago := 0;
  idCancelado := False;
end;

procedure TncItemDebito.LoadFromITran(D: TDataset);
begin
  idID        := D.FieldByName('ID').AsInteger;
  idTran      := D.FieldByName('Tran').AsInteger;
  idCaixa     := D.FieldByName('Caixa').AsInteger;
  idDataHora  := D.FieldByName('DataHora').AsDateTime;
  idTipoItem  := D.FieldByName('TipoItem').AsInteger;
  idItemID    := D.FieldByName('ItemID').AsInteger;
  idItemPos   := D.FieldByName('ItemPos').AsInteger;
  idTotal     := D.FieldByName('Total').AsCurrency;
  idDesconto  := D.FieldByName('Desconto').AsCurrency;
  idPago      := D.FieldByName('Pago').AsCurrency;
  idCancelado := D.FieldByName('Cancelado').AsBoolean;
end;

procedure TncItemDebito.SaveToITran(D: TDataset);
begin
  D.FieldByName('Tran').AsInteger := idTran;
  D.FieldByName('Caixa').AsInteger := idCaixa    ;
  D.FieldByName('Sessao').AsInteger := 0;
  D.FieldByName('DataHora').AsDateTime := idDataHora;
  D.FieldByName('TipoTran').AsInteger := trPagDebito;
  D.FieldByName('TipoItem').AsInteger := idTipoItem;
  D.FieldByName('ItemID').AsInteger := idItemID;
  D.FieldByName('ItemPos').AsInteger := idItemPos;
  D.FieldByName('Total').AsCurrency := idTotal;
  D.FieldByName('Desconto').AsCurrency := idDesconto;
  D.FieldByName('Pago').AsCurrency := idPago;
  D.FieldByName('Cancelado').AsBoolean := idCancelado;
end;

procedure TncItemDebito.SetString(const Value: String);
var S: String;

function pCampo: String;
begin
  Result := GetNextStrDelim(S);
end;

begin
  S := Value;
  idID := StrToIntDef(pCampo, -1);
  idTran := StrToIntDef(pCampo, 0);
  idCaixa := StrToIntDef(pCampo, 0);
  idDataHora := DTFromStr(pCampo);
  idTipoItem := StrToIntDef(pCampo, 0);
  idItemID := StrToIntDef(pCampo, 0);
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
  for I := 0 to Count - 1 do begin
    if I>0 then Result := Result + sLineBreak;
    Result := Result + Itens[i].AsString;
  end;
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

procedure TncItensDebito.SetString(const Value: String);
var 
  SL: TStrings;
  i: Integer;
begin
  SL := TStringList.Create;
  try
    SL.Text := Value;
    for i := 0 to SL.Count - 1 do
      NewItem.AsString := SL[i];
  finally
    SL.Free;
  end;
end;

{ TncDebito }

constructor TncDebito.Create;
begin
  inherited;
  FItens := TncItensDebito.Create;
  Limpa;
end;

destructor TncDebito.Destroy;
begin
  Limpa;
  FItens.Free;
  inherited;
end;

function TncDebito.GetChave: Variant;
begin
  Result := FID;
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

procedure TncDebito.SetStrItens(const Value: String);
begin
  FItens.AsString := Value;
end;

end.
