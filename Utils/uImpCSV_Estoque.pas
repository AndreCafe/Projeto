unit uImpCSV_Estoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, ncClassesBase;

type
  TForm16 = class(TForm)
    nxSession1: TnxSession;
    nxDB: TnxDatabase;
    nxTCP: TnxWinsockTransport;
    nxSE: TnxServerEngine;
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
    tProdIncluidoEm: TDateTimeField;
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
    procedure Button1Click(Sender: TObject);
  private
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


function StrToCurrency(S: String): Currency;
var 
  Code, P : Integer;
  Res: Real;
begin
  S := SoDig(S);
  P := Pos(',', S);
  if P>0 then S[P] := '.';
  Result := 0;
  if (Trim(S)>'') then begin
    Val(S, Res, Code);
    if Code=0 then
      REsult := Res;
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
  S, s2, s3, sDoc: String;
  Mon : Currency;
  DT: TDateTime;
  Qtd : Integer;

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

begin
  SL := TStringList.Create;
  SL.LoadFromFile('c:\nexcafe\estoque.csv');
  PB.Max := SL.Count;
  PB.Position := 0;
  tProd.Open;
  tProd.EmptyTable;
  tEst.Open;
  ShortDateFormat := 'dd/mm/yyyy';
//  for J := 1 to 2 do 
  for I := 1 to SL.Count-1 do begin
    PB.Position := I + 1;
    Application.ProcessMessages;
    S := SL[I];
    tProd.Append;
    tProdCodigo.Value := IntToStr(I);
    tProdDescricao.Value := Trim(ProxCampo);
    s2 := Trim(ProxCampo);
    if s2>'' then
      tProdDescricao.Value := tProdDescricao.Value + ' ' + s2;
    
    Qtd := StrToIntDef(ProxCampo, 0);
//    tProdCustoUnitario.Value := StrToCurrency(ProxCampo);
    tProdPreco.Value := StrToCurrency(ProxCampo); 
    tProdEstoqueAtual.Value := Qtd;
    tProd.Post;
    if Qtd>0 then begin
      tEst.Append;
      tEstProduto.Value := tProdID.Value;
      tEstQuant.Value := Qtd;
      tEstDataHora.Value := Now;
      tEstEntrada.Value := True;
      tEstEstoqueAnt.Value := 0;
      tEstCaixa.Value := -1;
      tEstNaoControlaEstoque.Value := False;
      tEstTipoTran.Value := trEstEntrada;
      tEst.Post;
    end;
  end;
end;

end.
