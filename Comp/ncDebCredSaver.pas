unit ncDebCredSaver;

interface

type

  TncDebCredSaverData = class
  public
    Cliente: Integer;
    Cancelado: Boolean;
    Debito: Currency;
    DebitoPago: Currency;
    Credito: Currency;
    CreditoUsado: Currency;
    
    constructor Create;

    function Igual(B: TncDebCredSaverData): Boolean;

    function MovDebito: Currency;
    function MovCredito: Currency;
  end;

  TncDebCredSaver = class
  public
    Old : TncDebCredSaverData;
    New : TncDebCredSaverData;

    constructor Create;
    destructor Destroy; override;

    function Alterou: Boolean;
    function AlterouCli: Boolean;

    function AlterouOld: Boolean;
    function AlterouNew: Boolean;

    function DifDebito_Old: Currency;
    function DifDebito_New: Currency;

    function DifCredito_Old: Currency;
    function DifCredito_New: Currency;
  end;

{ TncDebCredSaverData }

implementation

constructor TncDebCredSaverData.Create;
begin
  Cliente := 0;
  Cancelado := False;
  Debito := 0;
  DebitoPago := 0;
  Credito := 0;
  CreditoUsado := 0;
end;

function TncDebCredSaverData.Igual(B: TncDebCredSaverData): Boolean;
begin
  Result := (Cliente<>B.Cliente) or (Cancelado<>B.Cancelado) or (Debito<>B.Debito) or (Credito<>B.Credito) or (CreditoUsado<>B.CreditoUsado);
end;

function TncDebCredSaverData.MovCredito: Currency;
begin
  if (Cliente=0) or Cancelado then
    Result := 0 else
    Result := Credito - CreditoUsado;
end;

function TncDebCredSaverData.MovDebito: Currency;
begin
  if (Cliente=0) or Cancelado then
    Result := 0 else
    Result := Debito - DebitoPago;
end;

{ TncDebCredSaver }

function TncDebCredSaver.Alterou: Boolean;
begin
  Result := (not Old.Cancelado) and (not Old.Igual(New));
end;

function TncDebCredSaver.AlterouCli: Boolean;
begin
  Result := (Old.Cliente <> New.Cliente);
end;

function TncDebCredSaver.AlterouNew: Boolean;
begin
  Result := (Abs(DifDebito_New)>0) or (Abs(DifCredito_New)>0);
end;

function TncDebCredSaver.AlterouOld: Boolean;
begin
  Result := (Abs(DifDebito_Old)>0) or (Abs(DifCredito_Old)>0);
end;

constructor TncDebCredSaver.Create;
begin
  Old := TncDebCredSaverData.Create;
  New := TncDebCredSaverData.Create;
end;

destructor TncDebCredSaver.Destroy;
begin
  Old.Free;
  New.Free;
  inherited;
end;

function TncDebCredSaver.DifCredito_New: Currency;
begin
  if AlterouCli then
    Result := New.MovCredito else
    Result := New.MovCredito - Old.MovCredito;
end;

function TncDebCredSaver.DifCredito_Old: Currency;
begin
  if AlterouCli then
    Result := Old.MovCredito * -1 else
    Result := 0;
end;

function TncDebCredSaver.DifDebito_New: Currency;
begin
  if AlterouCli then
    Result := New.MovDebito else
    Result := New.MovDebito - Old.MovDebito;
end;

function TncDebCredSaver.DifDebito_Old: Currency;
begin
  if AlterouCli then
    Result := Old.MovDebito * -1 else
    Result := 0;
end;

end.
