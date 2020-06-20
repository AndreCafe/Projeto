unit  ncMovEst;
{
    ResourceString: Dario 13/03/13
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

  TncMovEst = class;


  TncItemMovEst = class
  private
    FMovEst: TncMovEst;
    function GetString: String;
    procedure SetString(const Value: String);
    function GetPagEspStr: String;
    procedure SetPagEspStr(const Value: String);
  public
    imID : Integer;
    imTran : Cardinal;
    imProduto : Cardinal;
    imQuant : Double;
    imUnitario : Currency;
    imTotal : Currency;
    imCustoU : Currency;
    imItem : Byte;
    imDesconto : Currency;
    imPago : Currency;
    imDataHora : TDateTime;
    imCancelado : Boolean;
    imEstoqueAnt : Double;
    imTipoTran : Byte;
    imCliente : Cardinal;
    imSessao : Integer;
    imCaixa : Integer;
    imCategoria : String;
    imNaoControlaEstoque : Boolean;
    imITran: Integer;
    imPermSemEstoque : Boolean;
    imFidResgate : Boolean;
    imFidPontos : Double;
    imObs: String;
    imPagEsp: TncPagEspecies;
    
    _Recibo : Boolean;
    _Operacao : Byte;

    constructor Create(aMovEst: TncMovEst);
    destructor Destroy; override;
    procedure Limpa;

    procedure AssignFrom(IM: TncItemMovEst);

    function Igual(IM: TncItemMovEst): Boolean;

    function Entrada: Boolean;
    function Fator: Integer;
    function SaldoPost: Double;
    function Debito: Currency;
    function ValorPagar: Currency;
    function UnitarioLiq: Currency; 

    function PagPend: Boolean;
    function CaixaPag: Integer;

    procedure CriaPagEsp;
    procedure DestroiPagEsp;

    procedure SaveToDataset(D: TDataset);
    procedure SaveToITranDataset(D: TDataset);
    
    procedure LoadFromDataset(tMovEst: TDataset);

    procedure AtualizaTipoTran(aTipo: Byte);

    property PagEspStr: String read GetPagEspStr write SetPagEspStr;
    
    property AsString: String
      read GetString write SetString;
  end;

  TncItensMovEst = class
  private
    FMovEst: TncMovEst;
    FItens : TList;
    function GetItem(I: Integer): TncItemMovEst;
    function GetString: String;
    procedure SetString(Value: String);
  public
    constructor Create(aMovEst: TncMovEst);
    destructor Destroy; override;

    procedure AjustaOperacao(B: TncItensMovEst; const AssignB: Boolean = True);

    procedure Remove(IME: TncItemMovEst);
    procedure Delete(aIndex: Integer);

    procedure AtualizaTipoTran(aTipo: Byte);
    
    procedure Limpa;

    function QuantProduto(aProduto: Integer): Double;

    function Count: Integer;

    function NewItem: TncItemMovEst;

    function GetItemByID(aID: Integer): TncItemMovEst;
    function GetItemByTran(aTran: Integer): TncItemMovEst;
    
    property Itens[I: Integer]: TncItemMovEst
      read GetItem; Default;

    property AsString: String
      read GetString write SetString;  
  
  end;

  TncMovEst = class (TClasseCS)
  private
    FID          : Integer;
    FDataHora    : TDateTime;
    FCliente     : Integer;
    FTipo        : Integer;
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
    FCaixaPag    : Integer;
    FMaq         : Word;
    FNomeCliente : String;
    FSessao      : Integer;
    FDescr       : String;
    FplusID      : String;
    FOperacao    : Byte;
    FRecibo      : Boolean;
    FFidResgate  : Boolean;
    FPagPend     : Boolean;
    FPagFunc     : String;
    FPagEsp      : TncPagEspecies;
    
    FItens       : TncItensMovEst;
    function GetStrItens: String;
    procedure SetStrItens(const Value: String);
    procedure SetCaixa(const Value: Integer);
    procedure SetCancelado(const Value: Boolean);
    procedure SetID(const Value: Integer);
    procedure SetSessao(const Value: Integer);
    procedure SetTipo(const Value: Integer);
    procedure SetFidResgate(const Value: Boolean);
    function GetPagEspStr: String;
    procedure SetPagEspStr(const Value: String);
    function GetCaixaPag: Integer;
  protected
    function GetChave: Variant; override;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Limpa;

    procedure SalvaDescPago;
    procedure SalvaTipoTran;

    function PodeSalvarSemCaixa: Boolean;

    function PagEsp: TncPagEspecies;

    function NewIME: TncItemMovEst;

    function ValorDebitado: Currency;

    function PagouTotal: Boolean;

    property Itens: TncItensMovEst read FItens;
  published
    property ID : Integer
      read FID write SetID;
      
    property DataHora : TDateTime
      read FDataHora write FDataHora;
      
    property Cliente : Integer
      read FCliente write FCliente;
      
    property Tipo : Integer
      read FTipo write SetTipo;
      
    property Func : String
      read FFunc write FFunc;
      
    property Total : Currency
      read FTotal write FTotal;
      
    property Desconto : Currency
      read FDesconto write FDesconto;

    property DescPerc : Double
      read FDescPerc write FDescPerc;

    property DescPorPerc : Boolean
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

    property CaixaPag: Integer
      read GetCaixaPag write FCaixaPag;
      
    property Maq : Word
      read FMaq write FMaq;
      
    property NomeCliente : String
      read FNomeCliente write FNomeCliente;
      
    property Sessao : Integer
      read FSessao write SetSessao;

    property plusID: String
      read FplusID write FplusID;  
      
    property Descr : String
      read FDescr write FDescr;
      
    property Operacao: Byte
      read FOperacao write FOperacao;

    property Recibo : Boolean
      read FRecibo write FRecibo;  
        
    property StrItens: String
      read GetStrItens write SetStrItens;  

    property FidResgate : Boolean
      read FFidResgate write SetFidResgate; 

    property PagPend: Boolean
      read FPagPend write FPagPend;
      
    property PagFunc: String
      read FPagFunc write FPagFunc;
       
    property PagEspStr: String
      read GetPagEspStr write SetPagEspStr;
  end;

implementation

{ TncItemMovEst }

procedure TncItemMovEst.AssignFrom(IM: TncItemMovEst);
begin
  imID := IM.imID;
  imTran := IM.imTran;
  imProduto := IM.imProduto;
  imQuant := IM.imQuant;
  imUnitario := IM.imUnitario;
  imTotal := IM.imTotal;
  imCustoU := IM.imCustoU;
  imItem := IM.imItem;
  imDesconto := IM.imDesconto;
  imPago := IM.imPago;
  imDataHora := IM.imDataHora;
  imCancelado := IM.imCancelado;
  imEstoqueAnt := IM.imEstoqueAnt;
  imTipoTran := IM.imTipoTran;
  imCliente := IM.imCliente;
  imCaixa := IM.imCaixa;
  imCategoria := IM.imCategoria;
  imNaoControlaEstoque := IM.imNaoControlaEstoque;
  imITran := IM.imITran;
  imFidResgate := IM.imFidResgate;
  imFidPontos := IM.imFidPontos;
  imSessao := IM.imSessao;
  imObs := IM.imObs;
  imPermSemEstoque := IM.imPermSemEstoque;
  _Recibo := IM._Recibo;
  _Operacao := IM._Operacao;
end;

function TncItemMovEst.CaixaPag: Integer;
begin
  if (FMovEst=nil) or PagPend then
    result := 0 else
    Result := FMovEst.FCaixaPag;
end;

constructor TncItemMovEst.Create(aMovEst: TncMovEst);
begin
  inherited Create;
  FMovEst := aMovEst;
  imPagEsp := nil;
  Limpa;
end;

procedure TncItemMovEst.CriaPagEsp;
begin
  if imPagEsp=nil then
    imPagEsp := TncPagEspecies.Create;
end;

function TncItemMovEst.Debito: Currency;
begin
  if imCancelado or (imTipoTran<>trEstVenda) then
    Result := 0 else
    Result := imTotal-imDesconto-imPago;
end;

procedure TncItemMovEst.DestroiPagEsp;
begin
  if imPagEsp<>nil then FreeAndNil(imPagEsp);
end;

destructor TncItemMovEst.Destroy;
begin
  DestroiPagEsp;

  inherited;
end;

function TncItemMovEst.Entrada: Boolean;
begin
  Result := (imTipoTran in [trEstCompra, trEstEntrada]);
end;

function TncItemMovEst.Fator: Integer;
begin
  if imCancelado then
    Result := 0 
  else  
  if Entrada then
    Result := 1 else
    Result := -1;
end;

function TncItemMovEst.GetPagEspStr: String;
begin
  if imPagEsp=nil then
    Result := '' else
    Result := imPagEsp.AsString;
end;

function TncItemMovEst.GetString: String;
begin
  Result := 
    IntToStr(imID) + sFldDelim(classid_TncItemMovEst) +
    IntToStr(imTran) + sFldDelim(classid_TncItemMovEst) +
    IntToStr(imProduto) + sFldDelim(classid_TncItemMovEst) +
    FloatParaStr(imQuant) + sFldDelim(classid_TncItemMovEst) +
    FloatParaStr(imUnitario) + sFldDelim(classid_TncItemMovEst) +
    FloatParaStr(imTotal) + sFldDelim(classid_TncItemMovEst) +
    FloatParaStr(imCustoU) + sFldDelim(classid_TncItemMovEst) +
    IntToStr(imItem) + sFldDelim(classid_TncItemMovEst) +
    FloatParaStr(imDesconto) + sFldDelim(classid_TncItemMovEst) +
    FloatParaStr(imPago) + sFldDelim(classid_TncItemMovEst) +
    GetDTStr(imDataHora) + sFldDelim(classid_TncItemMovEst) +
    BoolStr[imCancelado] + sFldDelim(classid_TncItemMovEst) +
    FloatParaStr(imEstoqueAnt) + sFldDelim(classid_TncItemMovEst) +
    IntToStr(imTipoTran) + sFldDelim(classid_TncItemMovEst) +
    IntToStr(imCliente) + sFldDelim(classid_TncItemMovEst) +
    IntToStr(imSessao) + sFldDelim(classid_TncItemMovEst) +
    IntToStr(imCaixa) + sFldDelim(classid_TncItemMovEst) +
    imCategoria + sFldDelim(classid_TncItemMovEst) +
    BoolStr[imNaoControlaEstoque] + sFldDelim(classid_TncItemMovEst) +
    IntToStr(imITran) + sFldDelim(classid_TncItemMovEst) +
    BoolStr[imPermSemEstoque] + sFldDelim(classid_TncItemMovEst) +
    BoolStr[imFidResgate] + sFldDelim(classid_TncItemMovEst) +
    FloatParaStr(imFidPontos) + sFldDelim(classid_TncItemMovEst) +
    imObs + sFldDelim(classid_TncItemMovEst) + 
    PagEspStr + sFldDelim(classid_TncItemMovEst) +
    BoolStr[_Recibo] + sFldDelim(classid_TncItemMovEst) + 
    IntToStr(_Operacao) + sFldDelim(classid_TncItemMovEst);
end;

function TncItemMovEst.Igual(IM: TncItemMovEst): Boolean;
begin
  Result := False;
  if imID <> IM.imID then Exit;
  if imTran <> IM.imTran then Exit;
  if imProduto <> IM.imProduto then Exit;
  if imQuant <> IM.imQuant then Exit;
  if imUnitario <> IM.imUnitario then Exit;
  if imTotal <> IM.imTotal then Exit;
  if imCustoU <> IM.imCustoU then Exit;
  if imItem <> IM.imItem then Exit;
  if imDesconto <> IM.imDesconto then Exit;
  if imPago <> IM.imPago then Exit;
  if imDataHora <> IM.imDataHora then Exit;
  if imCancelado <> IM.imCancelado then Exit;
  if imEstoqueAnt <> IM.imEstoqueAnt then Exit;
  if imTipoTran <> IM.imTipoTran then Exit;
  if imCliente <> IM.imCliente then Exit;
  if imSessao <> IM.imSessao then Exit;
  if imCaixa <> IM.imCaixa then Exit;
  if imCategoria <> IM.imCategoria then Exit;
  if imNaoControlaEstoque <> IM.imNaoControlaEstoque then Exit;
  if imITran <> IM.imITran then Exit;
  if imFidResgate<>IM.imFidResgate then Exit;
  if imFidPontos<>IM.imFidPontos then Exit;
  if imObs<>IM.imObs then Exit;
  if imPermSemEstoque <> IM.imPermSemEstoque then Exit;
  if (imPagEsp=nil) <> (IM.imPagEsp=nil) then Exit;
  if (imPagEsp<>nil)  and (not imPagEsp.Igual(IM.imPagEsp)) then Exit;

  if _Operacao <> IM._Operacao then Exit;
  Result := True;
end;

procedure TncItemMovEst.Limpa;
begin
  imID := -1;
  imTran := 0;
  imProduto := 0;
  imQuant := 0;
  imUnitario := 0;
  imTotal := 0;
  imCustoU := 0;
  imItem := 0;
  imDesconto := 0;
  imPago := 0;
  imDataHora := 0;
  imCancelado := False;
  imEstoqueAnt := 0;
  imTipoTran := 0;
  imCliente := 0;
  imSessao := 0;
  imCaixa := 0;
  imCategoria := '';
  imITran := -1;
  imFidResgate := False;
  imFidPontos := 0;
  imNaoControlaEstoque := False;

  if imPagEsp<>nil then imPagEsp.Clear;
  
  _Recibo := False;
  _Operacao := osNenhuma;
end;

procedure TncItemMovEst.LoadFromDataset(tMovEst: TDataset);
begin
  imID := tMovEst.FieldByName('ID').AsInteger; // do not localize
  imTran := tMovEst.FieldByName('Tran').AsInteger; // do not localize
  imTipoTran := tMovEst.FieldByName('TipoTran').AsInteger; // do not localize
  imProduto := tMovEst.FieldByName('Produto').AsInteger; // do not localize
  imQuant := tMovEst.FieldByName('Quant').AsFloat; // do not localize

  imUnitario := tMovEst.FieldByName('Unitario').AsCurrency; // do not localize
  imTotal := tMovEst.FieldByName('Total').AsCurrency; // do not localize
  imCustoU := tMovEst.FieldByName('CustoU').AsCurrency; // do not localize
  imItem := tMovEst.FieldByName('Item').AsInteger; // do not localize
  imDesconto := tMovEst.FieldByName('Desconto').AsCurrency; // do not localize
  imPago := tMovEst.FieldByName('Pago').AsCurrency; // do not localize
  imDataHora := tMovEst.FieldByName('DataHora').AsDateTime; // do not localize
  imCancelado := tMovEst.FieldByName('Cancelado').AsBoolean; // do not localize
  imEstoqueAnt := tMovEst.FieldByName('EstoqueAnt').AsFloat; // do not localize
  imCliente := tMovEst.FieldByName('Cliente').AsInteger; // do not localize
  imSessao := tMovEst.FieldByName('Sessao').AsInteger; // do not localize
  imCaixa := tMovEst.FieldByName('Caixa').AsInteger; // do not localize
  imCategoria := tMovEst.FieldByName('Categoria').AsString; // do not localize
  imNaoControlaEstoque := tMovEst.FieldByName('NaoControlaEstoque').AsBoolean; // do not localize
  imITran := tMovEst.FieldByName('ITran').AsInteger; // do not localize
  imPermSemEstoque := tMovEst.FieldByName('PermSemEstoque').AsBoolean; // do not localize
  imFidResgate := tMovEst.FieldByName('FidResgate').AsBoolean; // do not localize
  imFidPontos := tMovEst.FieldByName('FidPontos').AsFloat; // do not localize
  _Recibo := False;
  _Operacao := osNenhuma;
end;

function TncItemMovEst.PagPend: Boolean;
begin
  Result := (FMovEst<>nil) and FMovEst.PagPend;
end;

function TncItemMovEst.SaldoPost: Double;
begin
  Result := imEstoqueAnt + (Fator * imQuant);
end;

procedure TncItemMovEst.SaveToDataset(D: TDataset);
begin
  D.FieldByName('Tran').AsInteger := imTran; // do not localize
  D.FieldByName('Produto').AsInteger := imProduto; // do not localize
  D.FieldByName('Quant').AsFloat := imQuant; // do not localize
  D.FieldByName('CustoU').AsCurrency := imCustoU; // do not localize
  if imFidResgate then begin
    D.FieldByName('Unitario').Clear; // do not localize
    D.FieldByName('Total').Clear; // do not localize
    D.FieldByName('Desconto').Clear; // do not localize
    D.FieldByName('Pago').Clear; // do not localize
    D.FieldByName('FidPontos').AsFloat := imFidPontos; // do not localize
  end else begin
    D.FieldByName('Unitario').AsCurrency := imUnitario; // do not localize
    D.FieldByName('Total').AsCurrency := imTotal; // do not localize
    D.FieldByName('Desconto').AsCurrency := imDesconto; // do not localize
    D.FieldByName('Pago').AsCurrency := imPago; // do not localize
    D.FieldByName('FidPontos').Clear; // do not localize
  end;
  D.FieldByName('Item').AsInteger := imItem; // do not localize
  D.FieldByName('DataHora').AsDateTime := imDataHora; // do not localize
  D.FieldByName('Entrada').AsBoolean := Entrada; // do not localize
  D.FieldByName('Cancelado').AsBoolean := imCancelado; // do not localize
  D.FieldByName('EstoqueAnt').AsFloat := imEstoqueAnt; // do not localize
  D.FieldByName('TipoTran').AsInteger := imTipoTran; // do not localize
  D.FieldByName('Cliente').AsInteger := imCliente; // do not localize
  D.FieldByName('Sessao').AsInteger := imSessao; // do not localize
  D.FieldByName('Caixa').AsInteger := imCaixa; // do not localize
  D.FieldByName('Categoria').AsString := imCategoria; // do not localize
  D.FieldByName('NaoControlaEstoque').AsBoolean := imNaoControlaEstoque; // do not localize
  D.FieldByName('ITran').AsInteger := imITran; // do not localize    
  D.FieldByName('PermSemEstoque').AsBoolean := imPermSemEstoque;
  D.FieldByName('FidResgate').AsBoolean := imFidResgate; // do not localize
end;

procedure TncItemMovEst.SaveToITranDataset(D: TDataset);
begin
  D.FieldByName('PagPend').AsBoolean := PagPend;
  D.FieldByName('Tran').AsInteger := imTran; // do not localize
  D.FieldByName('Caixa').AsInteger := imCaixa; // do not localize
  D.FieldByName('DataHora').AsDateTime := imDataHora; // do not localize
  D.FieldByName('Caixa').AsInteger := imCaixa; // do not localize
  D.FieldByName('TipoItem').AsInteger := itMovEst; // do not localize
  D.FieldByName('ItemID').AsInteger := imID; // do not localize
  D.FieldByname('ItemPos').AsInteger := imItem; // do not localize
  D.FieldByName('Cancelado').AsBoolean := imCancelado; // do not localize
  D.FieldByName('TipoTran').AsInteger := imTipoTran; // do not localize
  D.FieldByName('Sessao').AsInteger := imSessao; // do not localize
  D.FieldByName('Cliente').AsInteger := imCliente; // do not localize

  if FMovEst=nil then
    D.FieldByName('CaixaPag').Clear else
    D.FieldByName('CaixaPag').AsInteger := CaixaPag;
  
  if imFidResgate then begin
    D.FieldByName('Total').Clear; // do not localize
    D.FieldByName('Desconto').Clear; // do not localize
    D.FieldByName('Pago').Clear; // do not localize
    D.FieldByName('FidFator').AsInteger := -1; // do not localize
    D.FieldByName('FidPontos').AsFloat := imFidPontos; // do not localize
  end else begin
    D.FieldByName('Total').AsCurrency := imTotal; // do not localize
    D.FieldByName('Desconto').AsCurrency := imDesconto; // do not localize
    D.FieldByName('Pago').AsCurrency := imPago; // do not localize
    D.FieldByName('FidFator').Clear; // do not localize
    D.FieldByName('FidPontos').Clear; // do not localize
  end;
end;

procedure TncItemMovEst.SetPagEspStr(const Value: String);
begin
  if Value='' then 
    DestroiPagEsp
  else begin
    CriaPagEsp;
    imPagEsp.AsString := Value;
  end;
end;

procedure TncItemMovEst.SetString(const Value: String);
var S: String;

function pCampo: String;
begin
  Result := GetNextStrDelim(S, classid_TncItemMovEst);
end;

begin
  S := Value;
  imID := StrToIntDef(pCampo, -1);
  imTran := StrToIntDef(pCampo, 0);
  imProduto := StrToIntDef(pCampo, 0);
  imQuant := StrParaFloat(pCampo);
  imUnitario := StrParaFloat(pCampo);
  imTotal := StrParaFloat(pCampo);
  imCustoU := StrParaFloat(pCampo);
  imItem := StrToIntDef(pCampo, 0);
  imDesconto := StrParaFloat(pCampo);
  imPago := StrParaFloat(pCampo);
  imDataHora := DTFromStr(pCampo);
  imCancelado := (BoolStr[True]=pCampo);
  imEstoqueAnt := StrParaFloat(pCampo);
  imTipoTran := StrToIntDef(pCampo, 0);
  imCliente := StrToIntDef(pCampo, 0);
  imSessao := StrToIntDef(pCampo, 0);
  imCaixa := StrToIntDef(pCampo, 0);
  imCategoria := pCampo; 
  imNaoControlaEstoque := (BoolStr[True]=pCampo);
  imITran := StrToIntDef(pCampo, -1);
  imPermSemEstoque := (BoolStr[True] = pCampo);
  imFidResgate := (BoolStr[True] = pCampo);
  imFidPontos := StrParaFloat(pCampo);
  imObs := pCampo;
  PagEspStr := pCampo;
  _Recibo := (BoolStr[True] = pCampo);
  _Operacao := StrToIntDef(pCampo, 0);
end;

function TncItemMovEst.UnitarioLiq: Currency;
begin
  if (imTotal>0.001) and  (imDesconto>0.001) then 
    Result := (ValorPagar/imTotal) * imUnitario else
    Result := imUnitario;
end;

function TncItemMovEst.ValorPagar: Currency;
begin
  Result := imTotal - imDesconto;
end;

procedure TncItemMovEst.AtualizaTipoTran(aTipo: Byte);
begin
  imTipoTran := aTipo;
  case aTipo of
    trEstEntrada, trEstSaida :
    begin
      imDesconto := 0;
      imUnitario := 0;
      imTotal := 0;
      imCustoU := 0;
      imDesconto := 0;
      imPago := 0;
    end;
    trEstCompra : begin
      imPago := 0;
    end;
  end;
end;

{ TncItensMovEst }

procedure TncItensMovEst.AjustaOperacao(B: TncItensMovEst; const AssignB: Boolean = True);
var 
  I : Integer;
  IM : TncItemMovEst;
begin
  for I := 0 to Count - 1 do with Itens[I] do 
  if (imID<>-1) and (B.GetItemByID(imID)=nil) then
    _Operacao := osExcluir;

  for I := 0 to B.Count - 1 do
    if (B[I].imID=-1) then begin
      if B[I]._Operacao<>osCancelar then begin
        B[I]._Operacao := osIncluir;
        if AssignB then
          NewItem.AssignFrom(B[I]);
      end;
    end
    else begin
      IM := GetItemByID(B[I].imID);
      if (IM<>nil) and (FMovEst<>nil) then
        IM.imCliente := FMovEst.Cliente;
      if IM<>nil then begin
        if B[I]._Operacao=osCancelar then
          IM._Operacao := osCancelar
        else 
        if IM.Igual(B[I]) then
          IM._Operacao := osNenhuma 
        else begin
          if AssignB then
            IM.AssignFrom(B[I]);
          IM._Operacao := osAlterar;
        end;
      end;
    end;

{ for I := Count-1 downto 0 do
  if Itens[I]._Operacao=osNenhuma then begin
    Itens[I].Free;
    FItens.Delete(I);
  end;  }
end;

procedure TncItensMovEst.AtualizaTipoTran(aTipo: Byte);
var I : Integer;
begin
  for I := 0 to Count - 1 do Itens[i].AtualizaTipoTran(aTipo);
end;

function TncItensMovEst.Count: Integer;
begin
  Result := FItens.Count;
end;

constructor TncItensMovEst.Create(aMovEst: TncMovEst);
begin
  FMovEst := aMovEst;
  FItens := TList.Create;
end;


procedure TncItensMovEst.Delete(aIndex: Integer);
begin
  FItens.Delete(aIndex);
end;

destructor TncItensMovEst.Destroy;
begin
  Limpa;
  FItens.Free;
  inherited;
end;

function TncItensMovEst.GetItem(I: Integer): TncItemMovEst;
begin
  Result := TncItemMovEst(FItens[I]);
end;

function TncItensMovEst.GetItemByID(aID: Integer): TncItemMovEst;
var I : Integer;
begin
  for I := 0 to Count - 1 do
  if Itens[I].imID=aID then begin
    Result := Itens[I];
    Exit;
  end;
  Result := nil;
end;

function TncItensMovEst.GetItemByTran(aTran: Integer): TncItemMovEst;
var I : Integer;
begin
  for I := 0 to Count - 1 do
  if Itens[I].imTran=aTran then begin
    Result := Itens[I];
    Exit;
  end;
  Result := nil;
end;

function TncItensMovEst.GetString: String;
var I : Integer;
begin
  Result := '';
  for I := 0 to Count - 1 do 
    Result := Result + Itens[I].AsString + sListaDelim(classid_TncItensMovEst);
end;

procedure TncItensMovEst.Limpa;
begin
  while Count>0 do begin
    Itens[0].Free;
    FItens.Delete(0);
  end;
end;

function TncItensMovEst.NewItem: TncItemMovEst;
begin
  Result := TncItemMovEst.Create(FMovEst);
  FItens.Add(Result);
end;

function TncItensMovEst.QuantProduto(aProduto: Integer): Double;
var i: integer;
begin
  Result := 0;
  for I := 0 to Count-1 do with Itens[i] do
    if imProduto=aProduto then
      Result := Result + imQuant;
end;

procedure TncItensMovEst.Remove(IME: TncItemMovEst);
begin
  FItens.Remove(IME);
end;

procedure TncItensMovEst.SetString(Value: String);
var S: String;
begin
  Limpa;
  while GetNextListItem(Value, S, classid_TncItensMovEst) do
    NewItem.AsString := S;
end;

{ TncMovEst }

constructor TncMovEst.Create;
begin
  inherited;
  FItens := TncItensMovEst.Create(Self);
  FPagEsp := TncPagEspecies.Create;
  Limpa;
end;

destructor TncMovEst.Destroy;
begin
  FItens.Free;
  FPagEsp.Free;
  inherited;
end;

function TncMovEst.GetCaixaPag: Integer;
begin
  if PagPend then
    Result := 0 else
    Result := FCaixaPag;
end;

function TncMovEst.GetChave: Variant;
begin
  Result := FID;
end;

function TncMovEst.GetPagEspStr: String;
begin
  Result := FPagEsp.AsString;
end;

function TncMovEst.GetStrItens: String;
begin
  Result := FItens.AsString;
end;

procedure TncMovEst.Limpa;
begin
  FID          := -1;
  FDataHora    := 0;
  FCliente     := 0;
  FTipo        := 0;
  FFunc        := '';
  FTotal       := 0;
  FDesconto    := 0;
  FDescPerc    := 0;
  FDescPorPerc := False;
  FPago        := 0;
  FObs         := '';
  FCancelado   := False;
  FCanceladoPor:= '';
  FCanceladoEm := 0;
  FCaixa       := 0;
  FCaixaPag    := 0;
  FMaq         := 0;
  FNomeCliente := '';
  FSessao      := 0;
  FDescr       := '';
  FplusID      := '';
  FOperacao    := osNenhuma;
  FRecibo      := False;
  FFidResgate  := False;
  FPagPend     := False;
  FPagFunc     := '';
  
  FItens.Limpa;
end;

function TncMovEst.NewIME: TncItemMovEst;
begin
  Result := Itens.NewItem;
  Result.imTran := FID;
  Result.imTipoTran := Tipo;
  Result.imCancelado := FCancelado;
  Result.imCaixa := FCaixa;
  Result.imFidResgate := FFidResgate;
  Result.imCliente := FCliente;
end;

function TncMovEst.PagEsp: TncPagEspecies;
begin
  Result := FPagEsp;
end;

function TncMovEst.PagouTotal: Boolean;
begin
  Result := (Abs(Total - Desconto - Pago) < 0.001);
end;

function TncMovEst.PodeSalvarSemCaixa: Boolean;
begin
  Result := (FTipo in [trEstEntrada, trEstSaida]) and (FItens.Count=1);
end;

function DuasCasas(Value: Currency): Currency;
begin
  Result := Trunc(Value * 100) / 100;
end;

procedure TncMovEst.SalvaDescPago;
var
  PercDesc: Extended;
  vPago, vDesc : Currency;
  I : Integer;
begin
  vPago := Pago + PagEsp.CreditoUsado;
  vDesc := Desconto;
  if (Total=0) or (Desconto < 0.01) then
    PercDesc := 0 else
    PercDesc := Desconto / Total;
    
  for I := 0 to Itens.Count - 1 do 
  with Itens[I] do begin
  
    if I=(Itens.Count-1) then
      imDesconto := vDesc else
      imDesconto := DuasCasas(PercDesc * imTotal);
    vDesc := vDesc - imDesconto;  
    if vPago>=ValorPagar then
      imPago := ValorPagar else
      imPago := vPago;
    vPago := vPago - imPago;
  end;
end;

procedure TncMovEst.SalvaTipoTran;
var I: Integer;
begin
  Itens.AtualizaTipoTran(Tipo);
  case Tipo of
    trEstSaida, trEstEntrada: begin
      Total := 0; Desconto := 0; Pago := 0;
    end;
    trEstCompra : Pago := 0;
  end;
end;

procedure TncMovEst.SetCaixa(const Value: Integer);
var I: Integer;
begin
  for I := 0 to Itens.Count - 1 do
    Itens[I].imCaixa := Value;
  FCaixa := Value;
end;

procedure TncMovEst.SetCancelado(const Value: Boolean);
var I : Integer;
begin
  if FCancelado=Value then Exit;
  for I := 0 to Itens.Count - 1 do
    Itens[I].imCancelado := Value;
  FCancelado := Value;
end;

procedure TncMovEst.SetFidResgate(const Value: Boolean);
var I : Integer;
begin
  FFidResgate := Value;
  for I := 0 to Itens.Count - 1 do
    Itens[I].imFidResgate := Value;
end;

procedure TncMovEst.SetID(const Value: Integer);
var I : Integer;
begin
  if FID=Value then Exit;
  for I := 0 to Itens.Count - 1 do
    Itens[I].imTran := Value;
  FID := Value;
end;

procedure TncMovEst.SetSessao(const Value: Integer);
var I : Integer;
begin
  FSessao := Value;
  for I := 0 to Itens.Count - 1 do
    Itens[I].imSessao := Value;
end;

procedure TncMovEst.SetPagEspStr(const Value: String);
begin
  FPagEsp.AsString := Value;
end;

procedure TncMovEst.SetStrItens(const Value: String);
begin
  FItens.AsString := Value;
end;

procedure TncMovEst.SetTipo(const Value: Integer);
var I : Integer;
begin
  FTipo := Value;
  for I := 0 to Itens.Count - 1 do
    Itens[I].imTipoTran := Value;
end;

function TncMovEst.ValorDebitado: Currency;
begin
  if Cancelado or (Sessao<>0) or FidResgate or PagPend then
    Result := 0 else
    Result := Total - Desconto - Pago - FPagEsp.CreditoUsado;

   if Result<0 then Result := 0;
end;

end.

