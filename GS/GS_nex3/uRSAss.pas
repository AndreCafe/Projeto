unit uRSAss;

interface

uses SysUtils, Variants;

type
  TAssinatura = record
    prDescr : String[200];
    prValor : Currency;
    prMeses : Byte;
  end;  

  TDadosEmissaoBol = record
    deNome   : String[100];
    deCNPJ   : String[19];
    deEnd    : String[100];
    deCidade : String[50];
    deUF     : String[2];
    deCedente: String[50];
  end;

  TDadosBoleto = record
    dbVenc   : TDateTime;
    dbLanc   : TDateTime;
    dbNum    : Integer;
    dbDescr  : String[100];
    dbValor  : Currency;
    dbPagoEm : TDateTime;
    dbCanceladoEm : TDateTime;
    dbBaixou : Boolean;
  end;

  TArrayAssinatura = Array of TAssinatura;
  TArrayBoleto = Array of TDadosBoleto;
  
  procedure VariantToAssinatura(V: Variant; var A: TAssinatura);
  procedure VariantToArrayAssinatura(V: Variant; var A: TArrayAssinatura);
  function AssinaturaToVariant(var A: TAssinatura): Variant;
  function ArrayAssinaturaToVariant(var A: TArrayAssinatura): Variant;

  procedure VariantToBoleto(V: Variant; var B: TDadosBoleto);
  procedure VariantToArrayBoleto(V: Variant; var A: TArrayBoleto);
  function BoletoToVariant(var B: TDadosBoleto): Variant;
  function ArrayBoletoToVariant(var A: TArrayBoleto): Variant;

  procedure VariantToDadosEmissaoBol(V: Variant; var D: TDadosEmissaoBol);
  function DadosEmissaoBolToVariant(var D: TDadosEmissaoBol): Variant;
  

implementation

procedure VariantToAssinatura(V: Variant; var A: TAssinatura);
begin
  A.prDescr := V[0];
  A.prValor := V[1];
  A.prMeses := V[2];
end;

procedure VariantToArrayAssinatura(V: Variant; var A: TArrayAssinatura);
var I : Integer;
begin
  if VarIsNull(V) then
    SetLength(A, 0) 
  else begin
    SetLength(A, VarArrayHighBound(V, 1)+1);
    for I := 0 to High(A) do begin
      A[i].prDescr := V[I][0];
      A[i].prValor := V[I][1];
      A[i].prMeses := V[I][2];
    end;
  end;
end;

function AssinaturaToVariant(var A: TAssinatura): Variant;
begin
  Result := VarArrayOf([A.prDescr, A.prValor, A.prMeses]);
end;

function ArrayAssinaturaToVariant(var A: TArrayAssinatura): Variant;
var I : Integer;
begin
  Result := VarArrayCreate([0, High(A)], VarVariant);
  for I := 0 to High(A) do
    Result[I] := AssinaturaToVariant(A[I]);
end;

procedure VariantToBoleto(V: Variant; var B: TDadosBoleto);
begin
  B.dbVenc        := V[0];
  B.dbLanc        := V[1];
  B.dbNum         := V[2];
  B.dbValor       := V[3];
  B.dbDescr       := V[4];
  B.dbPagoEm      := V[5];
  B.dbCanceladoEm := V[6];
  B.dbBaixou      := V[7];
end;

procedure VariantToArrayBoleto(V: Variant; var A: TArrayBoleto);
var I : Integer;
begin
  if VarIsNull(V) then
    SetLength(A, 0) 
  else begin
    SetLength(A, VarArrayHighBound(V, 1)+1);
    for I := 0 to High(A) do begin
      A[I].dbVenc   := V[I][0];
      A[I].dbLanc   := V[I][1];
      A[I].dbNum    := V[I][2];
      A[I].dbValor  := V[I][3];
      A[I].dbDescr  := V[I][4];
      A[I].dbPagoEm := V[I][5];
      A[I].dbCanceladoEm := V[I][6];
      A[I].dbBaixou := V[I][7];
    end;
  end;
end;

function BoletoToVariant(var B: TDadosBoleto): Variant;
begin
  Result := VarArrayOf([B.dbVenc, B.dbLanc, B.dbNum, B.dbValor, B.dbDescr, B.dbPagoEm, B.dbCanceladoEm, B.dbBaixou]);
end;

function ArrayBoletoToVariant(var A: TArrayBoleto): Variant;
var I : Integer;
begin
  Result := VarArrayCreate([0, High(A)], VarVariant);
  for I := 0 to High(A) do
    Result[I] := BoletoToVariant(A[I]);
end;

procedure VariantToDadosEmissaoBol(V: Variant; var D: TDadosEmissaoBol);
begin
  D.deNome    := V[0];
  D.deCNPJ    := V[1];
  D.deEnd     := V[2];
  D.deCidade  := V[3];
  D.deUF      := V[4];
  D.deCedente := V[5];
end;

function DadosEmissaoBolToVariant(var D: TDadosEmissaoBol): Variant;
begin
  Result := VarArrayOf([D.deNome, D.deCNPJ, D.deEnd, D.deCidade, D.deUF, D.deCedente]);
end;


end.
