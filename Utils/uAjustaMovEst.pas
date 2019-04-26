unit uAjustaMovEst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, ncClassesBase, nxreRemoteServerEngine;

type
  TForm16 = class(TForm)
    nxSession1: TnxSession;
    nxDB: TnxDatabase;
    nxTCP: TnxWinsockTransport;
    PB: TProgressBar;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    tEst: TnxTable;
    tProd: TnxTable;
    tProdID: TAutoIncField;
    tProdCodigo: TStringField;
    tProdDescricao: TStringField;
    tProdUnid: TStringField;
    tProdPreco: TCurrencyField;
    tProdObs: TnxMemoField;
    tProdImagem: TGraphicField;
    tProdCategoria: TStringField;
    tProdFornecedor: TIntegerField;
    tProdSubCateg: TStringField;
    tProdEstoqueAtual: TFloatField;
    tProdCustoUnitario: TCurrencyField;
    tProdEstoqueACE: TFloatField;
    tProdEstoqueACS: TFloatField;
    tProdPodeAlterarPreco: TBooleanField;
    tProdNaoControlaEstoque: TBooleanField;
    tProdEstoqueMin: TFloatField;
    tProdEstoqueMax: TFloatField;
    tProdAbaixoMin: TBooleanField;
    tProdAbaixoMinDesde: TDateTimeField;
    tProdEstoqueRepor: TFloatField;
    tProdplus: TBooleanField;
    tProdplusURL: TnxMemoField;
    tProdplusCodParceiro: TStringField;
    tProdplusCodProduto: TStringField;
    tProdAtivo: TBooleanField;
    tProdFidelidade: TBooleanField;
    tProdFidPontos: TIntegerField;
    tEstID: TAutoIncField;
    tEstTran: TIntegerField;
    tEstProduto: TIntegerField;
    tEstQuant: TFloatField;
    tEstUnitario: TCurrencyField;
    tEstTotal: TCurrencyField;
    tEstCustoU: TCurrencyField;
    tEstItem: TWordField;
    tEstDesconto: TCurrencyField;
    tEstPago: TCurrencyField;
    tEstPagoPost: TCurrencyField;
    tEstDescPost: TCurrencyField;
    tEstDataHora: TDateTimeField;
    tEstEntrada: TBooleanField;
    tEstCancelado: TBooleanField;
    tEstEstoqueAnt: TFloatField;
    tEstCliente: TIntegerField;
    tEstCaixa: TIntegerField;
    tEstCategoria: TStringField;
    tEstNaoControlaEstoque: TBooleanField;
    tEstITran: TIntegerField;
    tEstTipoTran: TWordField;
    tEstSessao: TIntegerField;
    tEstplusID: TGuidField;
    tEstplusTran: TBooleanField;
    tEstFidResgate: TBooleanField;
    tEstFidPontos: TFloatField;
    nxRSE: TnxRemoteServerEngine;
    tEstSaldoPost: TFloatField;
    tEstFator: TIntegerField;
    procedure Button1Click(Sender: TObject);
    procedure tEstCalcFields(DataSet: TDataSet);
  private
    function Fornecedor(aNome, aObs: String): Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

{$R *.dfm}


function CodStr(I: Integer): String;
begin
  Result := IntToStr(I);
  while length(result)<3 do
    result := '0'+result;
end;

function SoDig(S: String): String;
var i: integer;
begin
  result := '';
  for i := 1 to length(S) do
    if s[i] in ['0'..'9', ',', '.'] then
      result := result + s[i];
end;

function SoDig2(S: String): String;
var i: integer;
begin
  result := '';
  for i := 1 to length(S) do
    if s[i] in ['0'..'9'] then
      result := result + s[i];
end;

function ENumero(S: String; var J: Integer): Boolean;
begin
  try
    J := StrToInt(S);
    Result := True;
  except
    Result := False;
  end;
end;

function StrToCurrency(S: String): Currency;
var 
  Code, P : Integer;
  R : Double;
begin
  S := SoDig(S);
  P := Pos(',', S);
  if P>0 then S[P] := '.';
  Result := 0;
  if (Trim(S)>'') then begin
    Val(S, R, Code);
    if Code=0 then
      REsult := R;
  end;
end;

function LimpaRG(S: String): String;
var I: Integer;
begin
  Result := '';
  while (Length(S)>0) and (not (S[1] in ['0'..'9'])) do
    Delete(S, 1, 1);
  Result := Trim(S);  
end;

function MeuTrim(S: String): String;
var 
   I: Integer; 
begin
  Result := '';
  for I := 1 to Length(S) do 
    if Ord(S[i])=160 then
      Result := Result + ' ' else
      Result := Result + S[i];
end;

procedure TForm16.Button1Click(Sender: TObject);
var 
  SL: TStrings;
  I, J, Min, Cod: Integer;
  S, s1, s2, s3, sDoc, sCateg: String;
  Mon : Currency;
  DT: TDateTime;
  Qtd : Integer;
  Est: Double;
  Entrada : Boolean;

function ProxCampo: String;
var 
  P: Integer;
  C: Char;
begin
  if S='' then begin
    Result := '';
    Exit;
  end;
  
  if S[1]='"' then begin
    Delete(S, 1, 1);
    C := '"';
  end else 
    C := ';';
  
  P := Pos(C, S);
  if P>0 then begin
    Result := Trim(Copy(S, 1, P-1));
    Delete(S, 1, P);
  end else begin
    Result := Trim(S);
    S := '';
  end;
  S := Trim(S);
  if (C='"') and (S>'') and (S[1]=';') then Delete(S, 1, 1);

  for P := Length(Result) downto 1 do 
    if Result[P]='"' then Delete(Result, P, 1);
  Result := Trim(MeuTrim(Result));
end;

procedure proxn(n: Integer);
begin
  while n>0 do begin
    ProxCampo;
    dec(n);
  end;
end;

procedure AddDescr(D: String);
begin
  if Trim(D)='' then Exit;
  tProdDescricao.Value := tProdDescricao.Value + ' ' + D;
end;

begin
  tProd.Open;
  tProd.IndexName := 'ICodigo';
  tEst.Open;
  
  PB.Max := tProd.RecordCount;
  PB.Position := 0;
  sCateg := '';
  ShortDateFormat := 'dd/mm/yyyy';
//  for J := 1 to 2 do 

  tProd.First;
  while not tProd.Eof do begin
    Est := 0;
    tEst.SetRange([tProdID.Value], [tProdID.Value]);
    if not tEst.IsEmpty then begin
      tEst.Last;
      Est := tEstSaldoPost.Value;
    end;

    if Abs(Est-tProdEstoqueAtual.Value)>0.0001  then begin
      Entrada := (tProdEstoqueAtual.Value>Est);
      tEst.Append;
      tEstProduto.Value := tProdID.Value;
      tEstDataHora.Value := Now;
      tEstEntrada.Value := Entrada;
      tEstQuant.Value := Abs(Est-tProdEstoqueAtual.Value);
      tEstEstoqueAnt.Value := Est;
      if Entrada then
        tEstTipoTran.Value := trEstEntrada else
        tEstTipoTran.Value := trEstSaida;
      tEst.Post;
    end;

    tProd.Next;
    
    PB.Position := I + 1;
    Application.ProcessMessages;
  end;
end;

function TForm16.Fornecedor(aNome, aObs: String): Integer;
begin
end;

procedure TForm16.tEstCalcFields(DataSet: TDataSet);
begin
  if tEstCancelado.Value or tEstNaoControlaEstoque.Value then
    tEstFator.Value := 0
  else
  if tEstEntrada.Value then
    tEstFator.Value := 1 else
    tEstFator.Value := -1;
  tEstSaldoPost.Value := tEstEstoqueAnt.Value + (tEstFator.Value * tEstQuant.Value);
end;

end.
