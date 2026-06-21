unit cmCredUtils;

interface

uses
  SysUtils, Classes, DB, nxdb, nxllComponent;

type
  TMovCredito = object
    mcCliente: Integer;
    mcUsuario: String;
    mcMinutos: Double;
    mcOper   : Byte;    // Venda de Crédito
  end;
  
  TCredUtils = class(TDataModule)
    T: TnxTable;
    TNumSeq: TAutoIncField;
    TCliente: TIntegerField;
    TTransacao: TIntegerField;
    TTipoTran: TWordField;
    TDataHora: TDateTimeField;
    TTempoAnt: TFloatField;
    TTempo: TFloatField;
  private
    { Private declarations }
    function LocalizaTran(aTran: Integer): Boolean;
  public
    { Public declarations }
    procedure Inicializa(aDB: TnxDatabase);
    function SaldoCliMin(aCliente: Integer): Double;
    function SaldoCliMS(aCliente: Integer): Cardinal;

    procedure SalvaTran(aCliente: Integer;
                        aMinutos: Double;                     
                        aDataHora: TDateTime;
                        aTran: Integer;
                        aTipoTran: Byte);

    function MinToMS(aMinutos: Double): Integer;
    function MSToMin(aMS: Integer): Double;
    function HToMin(aHoras: Integer): Double;
    function DateTimeToMin(aDH: TDateTime): Double;
    function DateTimeToMS(aDH: TDateTime): Integer;
                        
  end;

var
  CredUtils: TCredUtils;

implementation

uses cmServBD;

{$R *.dfm}

{ TCredUtils }

function TCredUtils.DateTimeToMin(aDH: TDateTime): Double;
begin

end;

function TCredUtils.DateTimeToMS(aDH: TDateTime): Integer;
begin

end;

function TCredUtils.HToMin(aHoras: Integer): Double;
begin

end;

procedure TCredUtils.Inicializa(aDB: TnxDatabase);
begin
  T.Database := aDB;
  T.Active := True;
end;

function TCredUtils.LocalizaTran(aTran: Integer): Boolean;
begin
  T.IndexName := 'ITranNumSeq';
  T.SetRange([aTran], [aTran]);
  T.Last;
  Result := not T.IsEmpty;
end;

function TCredUtils.MinToMS(aMinutos: Double): Integer;
begin

end;

function TCredUtils.MSToMin(aMS: Integer): Double;
begin

end;

function TCredUtils.SaldoCliMin(aCliente: Integer): Double;
begin

end;

function TCredUtils.SaldoCliMS(aCliente: Integer): Cardinal;
begin

end;

procedure TCredUtils.SalvaTran(aCliente: Integer; aMinutos: Double;
  aDataHora: TDateTime; aTran: Integer; aTipoTran: Byte);
begin
  if LocalizaTran(aTran) then begin
  end else begin
    
  
  end;
end;

initialization
  CredUtils := TCredUtils.Create(nil);

finalization
  CredUtils.Free;

end.

-500
