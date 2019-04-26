unit ncEspecie;

interface

uses
  SysUtils,
  DB,
  MD5,
  Dialogs,
  Classes,
  Windows,
  ClasseCS,
  ncClassesBase;

const
  tipoesp_dinheiro     = 0;
  tipoesp_cartao       = 1;
  tipoesp_cheque       = 2;
  tipoesp_outros       = 3;

type  

  TncEspecie = class ( TncClasse )
  private
    FID   : Word;
    FTipo : Byte;
    FNome : String;
    FImg  : Integer;
    FPermiteTroco   : Boolean;
    FPermiteCred    : Boolean;
    FPermiteVarios  : Boolean;
    function GetPermiteTroco: Boolean;
  protected 
    function GetChave: Variant; override;
  public
    constructor Create; 
    function TipoClasse: Integer; override;
  published
    property ID: Word
      read FID write FID;

    property Tipo: Byte
      read FTipo write FTipo;

    property Nome: String
      read FNome write FNome;
          
    property Img: Integer
      read FImg write FImg;

    property PermiteVarios: Boolean
      read FPermiteVarios write FPermiteVarios;

    property PermiteCred: Boolean
      read FPermiteCred write FPermiteCred;  

    property PermiteTroco: Boolean
      read GetPermiteTroco write FPermiteTroco;
  end;

  TncEspecies = class ( TListaClasseCS )
  private
    function GetEspecie(I: Integer): TncEspecie;
    function GetPorID(aID: Integer): TncEspecie;
  public
    constructor Create;

    procedure Assign(aFrom: TncEspecies);

    destructor Destroy; override;

    function AlgumPermiteCred: Boolean;

    function NewItem: TncEspecie;
    
    property Itens[I: Integer]: TncEspecie
      read GetEspecie; default;

    property PorID[aID: Integer]: TncEspecie
      read GetPorID;   
  end;   

  TncPagEspecie = class
  private
    function GetString: String;
    procedure SetString(S: String);
  public
    peID     : Cardinal;
    peEspecie: Word;
    peTipo   : Byte;
    peValor  : Currency;
    peTroco  : Currency;
    peDoc    : String;
    
    constructor Create;  

    function Liquido: Currency;

    function Nome: String;

    property AsString: String
      read GetString write SetString;
  end;

  TncPagEspecies = class
  private
    FItens : TList;
    FTotalPagar   : Currency;
    FCreditoAnt   : Currency;
    FCredito      : Currency;
    FCreditoUsado : Currency;
    FDebitoAnt    : Currency;
    FDebito       : Currency;
    FDebitoPago   : Currency;
    FDesconto     : Currency;
    FObs          : String;
    
    function GetString: String;
    procedure SetString(const Value: String);
    function GetItem(aIndex: Integer): TncPagEspecie;
    function GetItemsStr: String;
    procedure SetItemsStr(Value: String);
  public
    constructor Create;
    destructor Destroy; override;

    procedure Assign(aFrom: TncPagEspecies);

    procedure Clear;

    procedure ClearItems;

    procedure Delete(aIndex: Integer; aFree: Boolean = True);

    function Igual(B: TncPagEspecies): Boolean;

    function Count: Integer;

    function Pago: Currency;

    property Obs: String
      read FObs write FObs;

    property Desconto: Currency
      read FDesconto write FDesconto;

    property TotalPagar: Currency
      read FTotalPagar write FTotalPagar;

    property CreditoAnt: Currency 
      read FCreditoAnt write FCreditoAnt;  

    property Credito: Currency
      read FCredito write FCredito;

    property CreditoUsado: Currency
      read FCreditoUsado write FCreditoUsado;

    property DebitoAnt: Currency
      read FDebitoAnt write FDebitoAnt;
      
    property Debito: Currency
      read FDebito write FDebito;
      
    property DebitoPago: Currency
      read FDebitoPago write FDebitoPago;

    function NewItem: TncPagEspecie;

    function PorID(aID: Integer): TncPagEspecie;

    property ItemsStr: String
      read GetItemsStr write SetItemsStr;

    property Items[aIndex: Integer]: TncPagEspecie
      read GetItem; default;

    property AsString: String
      read GetString write SetString;
  end;

var
  gEspecies : TncEspecies;
  

implementation

{ TncEspecie }

constructor TncEspecie.Create;
begin
  inherited;
  FID   := 0;
  FTipo := 0;
  FNome := '';
  FImg  := 0;
  FPermiteTroco := False;
  FPermiteVarios := False;
  FPermiteCred := False;
end;

function TncEspecie.GetChave: Variant;
begin
  Result := FID;
end;


function TncEspecie.GetPermiteTroco: Boolean;
begin
  Result := FPermiteTroco or (FTipo=tipoesp_dinheiro);
end;

function TncEspecie.TipoClasse: Integer;
begin
  Result := tcEspecie;
end;

{ TncPagEspecie }

constructor TncPagEspecie.Create;
begin
  peID     := 0;
  peEspecie:= 0;
  peTipo   := 0;
  peValor  := 0;
  peTroco  := 0;
  peDoc    := '';
end;

function TncPagEspecie.GetString: String;
begin
  Result := 
    IntToStr(peID) + sFldDelim(classid_TncPagEspecie) + 
    IntToStr(peEspecie) + sFldDelim(classid_TncPagEspecie) +
    IntToStr(peTipo) + sFldDelim(classid_TncPagEspecie) +
    FloatParaStr(peValor) + sFldDelim(classid_TncPagEspecie) + 
    FloatParaStr(peTroco) + sFldDelim(classid_TncPagEspecie) + 
    peDoc + sFldDelim(classid_TncPagEspecie);
end;

function TncPagEspecie.Liquido: Currency;
begin
  Result := peValor - peTroco;
end;

function TncPagEspecie.Nome: String;
var E: TncEspecie;
begin
  E := gEspecies.PorID[peEspecie];
  if E<>nil then
    Result := E.Nome else
    Result := '';
end;

procedure TncPagEspecie.SetString(S: String);

function _NextField: String;
begin
  Result := GetNextStrDelim(S, classid_TncPagEspecie);
end;

begin
  peID := StrToIntDef(_NextField, 0);
  peEspecie := StrToIntDef(_NextField, 0);
  peTipo := StrToIntDef(_NextField, 0);
  peValor := StrParaFloat(_NextField);
  peTroco := StrParaFloat(_NextField);
  peDoc := _NextField;
end;

{ TncPagEspecies }


procedure TncPagEspecies.Assign(aFrom: TncPagEspecies);
var S:String;
begin
  Clear;
  S := aFrom.AsString;
  AsString := S;
  FTotalPagar := aFrom.FTotalPagar;
  FObs := aFrom.FObs;
end;

procedure TncPagEspecies.Clear;
begin
  FObs          := '';
  FTotalPagar   := 0;
  FCreditoAnt   := 0;
  FCredito      := 0;
  FCreditoUsado := 0;
  FDebitoAnt    := 0;
  FDebito       := 0;
  FDebitoPago   := 0;
  ClearItems;
end;

procedure TncPagEspecies.ClearItems;
begin
  while FItens.Count>0 do begin
    TObject(FItens[0]).Free;
    FItens.Delete(0);
  end;
end;

function TncPagEspecies.Count: Integer;
begin
  Result := FItens.Count;
end;

constructor TncPagEspecies.Create;
begin
  FItens := TList.Create;
  Clear;
end;

procedure TncPagEspecies.Delete(aIndex: Integer; aFree: Boolean);
begin
  Items[aIndex].Free;
  FItens.Delete(aIndex);
end;

destructor TncPagEspecies.Destroy;
begin
  Clear;
  inherited;
end;

function TncPagEspecies.Pago: Currency;
var I: Integer;
begin
  Result := 0;
  for I := 0 to Count - 1 do
    Result := Result + Items[i].peValor;
end;

function TncPagEspecies.PorID(aID: Integer): TncPagEspecie;
var I: Integer;
begin
  for I := 0 to Count - 1 do
    if Items[I].peID = aID then begin
      Result := Items[I];
      Exit;
    end;
  Result := nil;   
end;

function TncPagEspecies.GetItem(aIndex: Integer): TncPagEspecie;
begin
  Result := TncPagEspecie(FItens[aIndex]);
end;

function TncPagEspecies.GetItemsStr: String;
var 
  I: Integer;
  S: String;
begin
  Result := '';            
  for I := 0 to FItens.Count - 1 do 
    Result := Result + Items[I].AsString + sListaDelim(classid_TncPagEspecies);
end;

function TncPagEspecies.GetString: String;
begin
  Result := FloatParaStr(FCreditoAnt)+sFldDelim(classid_TncPagEspecies) +
            FloatParaStr(FCredito)+sFldDelim(classid_TncPagEspecies) +
            FloatParaStr(FCreditoUsado)+sFldDelim(classid_TncPagEspecies) +
            FloatParaStr(FDebitoAnt)+sFldDelim(classid_TncPagEspecies) +
            FloatParaStr(FDebito)+sFldDelim(classid_TncPagEspecies) +
            FloatParaStr(FDebitoPago)+sFldDelim(classid_TncPagEspecies) +
            ItemsStr+sFldDelim(classid_TncPagEspecies);
end;

function TncPagEspecies.Igual(B: TncPagEspecies): Boolean;
begin
  Result := (AsString = B.AsString) and (Obs = B.Obs);
end;

function TncPagEspecies.NewItem: TncPagEspecie;
begin
  Result := TncPagEspecie.Create;
  FItens.Add(Result);
end;

procedure TncPagEspecies.SetItemsStr(Value: String);
var S: String;
begin
  ClearItems;
  while GetNextListItem(Value, S, classid_TncPagEspecies) do 
    NewItem.AsString := S;
end;

procedure TncPagEspecies.SetString(const Value: String);
var S  : String;

function _NextField: String;
begin
  Result := GetNextStrDelim(S, classid_TncPagEspecies);
end;

begin
  Clear;
  
  S := Value;
  FCreditoAnt   := StrParaFloat(_NextField);
  FCredito      := StrParaFloat(_NextField);
  FCreditoUsado := StrParaFloat(_NextField);
    
  FDebitoAnt := StrParaFloat(_NextField);
  FDebito := StrParaFloat(_NextField);
  FDebitoPago := StrParaFloat(_NextField);
  ItemsStr := _NextField;
end;

{ TncEspecies }

function TncEspecies.NewItem: TncEspecie;
begin
  Result := TncEspecie.Create;
  Add(Result);
end;

function TncEspecies.AlgumPermiteCred: Boolean;
var i: integer;
begin
  for I := 0 to Count - 1 do
    if Itens[i].PermiteCred then begin
      Result := True;
      Exit;
    end;

  Result := False;
  
end;

procedure TncEspecies.Assign(aFrom: TncEspecies);
var i: integer;
begin
  Limpa;
  for I := 0 to aFrom.Count - 1 do
    NewItem.Assign(aFrom.Itens[i]);
end;

constructor TncEspecies.Create;
begin
  inherited Create(tcEspecie);
end;

function TncEspecies.GetPorID(aID: Integer): TncEspecie;
var I: Integer;
begin
  for I := 0 to Count - 1 do 
    if Itens[I].ID = aID then begin
      Result := Itens[I];
      Exit;
    end;
  Result := nil;   
end;

destructor TncEspecies.Destroy;
var i: integer;
begin
  for I := 0 to Count-1 do Itens[i].ProcNotificar := nil;

  inherited;
end;

function TncEspecies.GetEspecie(I: Integer): TncEspecie;
begin
  Result := TncEspecie(GetItem(I));
end;

initialization
  gEspecies := TncEspecies.Create;

finalization
  gEspecies.Free;  

end.
