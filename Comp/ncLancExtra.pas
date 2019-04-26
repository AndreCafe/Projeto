unit ncLancExtra;
{
    ResourceString: Dario 15/03/13
    Nara para fazer
}

interface 

uses
  SysUtils,
  DB,
  Classes,
  Windows,
  ClasseCS,
  ncClassesBase;

type

  TncLancExtra = class (TClasseCS)
  private
    FID          : Integer;
    FDataHora    : TDateTime;
    FTipo        : Integer;
    FFunc        : String;
    FTotal       : Currency;
    FDesconto    : Currency;
    FPago        : Currency;
    FObs         : String;
    FCancelado   : Boolean;
    FCanceladoPor: String;
    FCanceladoEm : TDateTime;
    FCaixa       : Integer;
    FRecibo      : Boolean;
  protected
    function GetChave: Variant; override;
  public
    constructor Create;
    procedure Limpa;

  published
    property ID : Integer
      read FID write FID;
      
    property DataHora : TDateTime
      read FDataHora write FDataHora;
      
    property Tipo : Integer
      read FTipo write FTipo;
      
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
      read FCancelado write FCancelado;
      
    property CanceladoPor : String
      read FCanceladoPor write FCanceladoPor;
      
    property CanceladoEm : TDateTime
      read FCanceladoEm write FCanceladoEm;
      
    property Caixa : Integer
      read FCaixa write FCaixa;
      
    property Recibo : Boolean
      read FRecibo write FRecibo;  
  end;
 

implementation

{ TncLancExtra }

constructor TncLancExtra.Create;
begin
  inherited;
  Limpa;
end;

function TncLancExtra.GetChave: Variant;
begin
  Result := FID;
end;

procedure TncLancExtra.Limpa;
begin
  FID          := -1;
  FDataHora    := Now;
  FTipo        := trCaixaSai;
  FFunc        := '';
  FTotal       := 0;
  FDesconto    := 0;
  FPago        := 0;
  FObs         := '';
  FCancelado   := False;
  FCanceladoPor:= '';
  FCanceladoEm := 0;
  FCaixa       := 0;
  FRecibo      := False;
end;

end.
