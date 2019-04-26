unit ncDebTempo;
{
    ResourceString: Dario 12/03/13
    Nada para fazer
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

  TncDebTempo = class (TClasseCS)
  private
    FID          : Integer;
    FDataHora    : TDateTime;
    FFunc        : String;
    FCliente     : Integer;
    FTotal       : Currency;
    FDesconto    : Currency;
    FPago        : Currency;
    FObs         : String;
    FCancelado   : Boolean;
    FCanceladoPor: String;
    FCanceladoEm : TDateTime;
    FCaixa       : Integer;
    FRecibo      : Boolean;
    FQtdTempo    : Double;
    FCredValor   : Boolean;
    function GetTipo: Integer;
    procedure SetTipo(const Value: Integer);
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
      read GetTipo write SetTipo;
      
    property Func : String
      read FFunc write FFunc;
      
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

    property QtdTempo: Double
      read FQtdTempo write FQtdTempo;

    property CredValor: Boolean
      read FCredValor write FCredValor;       

    property Cliente: Integer
      read FCliente write FCliente;   
      
    property Recibo : Boolean
      read FRecibo write FRecibo;  
  end;
 

implementation

{ TncLancExtra }

constructor TncDebTempo.Create;
begin
  inherited;
  Limpa;
end;

function TncDebTempo.GetChave: Variant;
begin
  Result := FID;
end;

function TncDebTempo.GetTipo: Integer;
begin
  Result := trDebTempo;
end;

procedure TncDebTempo.Limpa;
begin
  FID          := -1;
  FDataHora    := Now;
  FFunc        := '';
  FObs         := '';
  FCancelado   := False;
  FCanceladoPor:= '';
  FCanceladoEm := 0;
  FCaixa       := 0;
  FQtdTempo    := 0;
  FCredValor   := False;
  FRecibo      := False;
end;

procedure TncDebTempo.SetTipo(const Value: Integer);
begin
  //
end;

end.
