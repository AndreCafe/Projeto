unit ncDebCredValidator;

interface

uses Variants;

type
  TncDebCredValidator = class
  private
    FOldCli: Integer;
    FOldCliDebitoAtual: Currency;
    FOldCliCreditoAtual: Currency;
    FOldCliCredUsado: Currency;
    FOldCliCreditado: Currency;
 
    FNewCli: Integer;
    FNewCliDebitoAtual: Currency;
    FNewCliMaxDeb: Variant;
    FNewCliCreditoAtual: Currency;
 
    FOldDebito: Currency;
    FNewDebito: Currency;
 
    FOldCredito: Currency;
    FNewCredito: Currency;
 
  public
    constructor Create;

    procedure Assign(aFrom: TncDebCredValidator);
    
    function Selecionar: Boolean;
    function DebitoOk: Boolean;
    function CreditoOk: Boolean; 

    function CalcCredDisp: Currency;

    function TudoOk: Boolean;  

    function MaxDeb: Currency;

    procedure SetOldCli(aOldCli: Integer; aDebAtual, aCredAtual, aCredUsado, aCreditado: Currency);
    procedure SetNewCli(aNewCli: Integer; aDebAtual, aCredAtual: Currency; aMaxDeb: Variant);

    property NewCli: Integer read FNewCli;

    property OldCliCreditado: Currency read FOldCliCreditado;

    property OldDebito: Currency read FOldDebito write FOldDebito;
    property NewDebito: Currency read FNewDebito write FNewDebito;

    property OldCredito: Currency read FOldCredito write FOldCredito;
    property NewCredito: Currency read FNewCredito write FNewCredito;
  end;

implementation

uses ncClassesBase;

{ TncDebCredValidator }

procedure TncDebCredValidator.Assign(aFrom: TncDebCredValidator);
begin
  FOldCli := aFrom.FOldCli;
  FOldCliDebitoAtual := aFrom.FOldCliDebitoAtual;
  FOldCliCreditoAtual := aFrom.FOldCliCreditoAtual;
  FOldCliCredUsado := aFrom.FOldCliCredUsado;
  FOldCliCreditado := aFrom.FOldCliCreditado;
 
  FNewCli := aFrom.FNewCli;
  FNewCliDebitoAtual := aFrom.FNewCliDebitoAtual;
  FNewCliMaxDeb := aFrom.FNewCliMaxDeb;
  FNewCliCreditoAtual := aFrom.FNewCliCreditoAtual;
 
  FOldDebito := aFrom.OldDebito;
  FNewDebito := aFrom.NewDebito;
 
  FOldCredito := aFrom.OldCredito;
  FNewCredito := aFrom.NewCredito;
end;

function TncDebCredValidator.CalcCredDisp: Currency;
begin
  if FNewCli=FOldCli then begin
    Result := (FNewCliCreditoAtual-FOldCliCreditado) + FOldCliCredUsado;
    if Result < FOldCliCredUsado then Result := FOldCliCredUsado;
  end else begin
    Result := FNewCliCreditoAtual;
    if Result<0 then Result := 0;
  end;
end;

constructor TncDebCredValidator.Create;
begin
  FOldCli := 0;
  FOldCliDebitoAtual := 0;
  FOldCliCreditoAtual := 0;
  FOldCliCredUsado := 0;
  FOldCliCreditado := 0;
 
  FNewCli := 0;
  FNewCliDebitoAtual := 0;
  FNewCliMaxDeb := null;
  FNewCliCreditoAtual := 0;
 
  FOldDebito := 0;
  FNewDebito := 0;
 
  FOldCredito := 0;
  FNewCredito := 0;
end;

function TncDebCredValidator.CreditoOk: Boolean;
var Creditar: Currency;
begin
  if FNewCli=FOldCli then
    Creditar := FNewCredito - FOldCredito else
    Creditar := FNewCredito;

  if (Creditar>=0) or ((FNewCliCreditoAtual + Creditar) > 0) then
    Result := True else
    Result := False; 
end;

function TncDebCredValidator.DebitoOk: Boolean;
var Debitar: Currency;
begin
  if FNewCli=FOldCli then
    Debitar := FNewDebito - FOldDebito else
    Debitar := FNewDebito;

  if (Debitar<0.001) or ((MaxDeb-FNewCliDebitoAtual)>=Debitar) then
    Result := True else
    Result := False;
end;

function TncDebCredValidator.MaxDeb: Currency;
begin
  if VarIsNull(FNewCliMaxDeb) then
    Result := gConfig.LimitePadraoDebito else
    Result := FNewCliMaxDeb;
end;

function TncDebCredValidator.Selecionar: Boolean;
begin
  Result := (FNewCli=0) and ((FNewCredito>0.001) or (FNewDebito>0.001));
end;

procedure TncDebCredValidator.SetNewCli(aNewCli: Integer; aDebAtual, aCredAtual: Currency;
  aMaxDeb: Variant);
begin
  FNewCli := aNewCli;
  FNewCliDebitoAtual := aDebAtual;
  FNewCliCreditoAtual := aCredAtual;
  FNewCliMaxDeb := aMaxDeb;
end;

procedure TncDebCredValidator.SetOldCli(aOldCli: Integer; aDebAtual,
  aCredAtual, aCredUsado, aCreditado: Currency);
begin
  FOldCli := aOldCli;
  FOldCliDebitoAtual := aDebAtual;
  FOldCliCreditoAtual := aCredAtual;
  FOldCliCredUsado := aCredUsado;
  FOldCliCreditado := aCreditado;
end;

function TncDebCredValidator.TudoOk: Boolean;
begin
  Result := (not Selecionar) and DebitoOk and CreditoOk;
end;

end.
                                                                      