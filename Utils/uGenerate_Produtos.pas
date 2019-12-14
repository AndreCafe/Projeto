unit uGenerate_Produtos;

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
    tFor: TnxTable;
    Label1: TLabel;
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
    tEstComissao: TCurrencyField;
    tEstComissaoPerc: TFloatField;
    tEstComissaoLucro: TBooleanField;
    tEstplusTran: TBooleanField;
    tEstPermSemEstoque: TBooleanField;
    tEstFidResgate: TBooleanField;
    tEstFidPontos: TFloatField;
    tEstRecVer: TIntegerField;
    tProdID: TAutoIncField;
    tProdCodigo: TStringField;
    tProdDescricao: TStringField;
    tProdUnid: TStringField;
    tProdPreco: TCurrencyField;
    tProdPrecoAuto: TBooleanField;
    tProdMargem: TFloatField;
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
    tProdPermiteVendaFracionada: TBooleanField;
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
    tProdComissaoPerc: TFloatField;
    tProdComissaoLucro: TBooleanField;
    tProdAtivo: TBooleanField;
    tProdFidelidade: TBooleanField;
    tProdFidPontos: TIntegerField;
    tProdmd5Imagem: TStringField;
    tProdlastProdModif: TDateTimeField;
    tProdCadastroRapido: TBooleanField;
    tProdIncluidoEm: TDateTimeField;
    tProdRecVer: TIntegerField;
    tProduploadVer: TWordField;
    tForID: TAutoIncField;
    tForNome: TStringField;
    tForEndereco: TStringField;
    tForBairro: TStringField;
    tForCidade: TStringField;
    tForUF: TStringField;
    tForCEP: TStringField;
    tForSexo: TStringField;
    tForObs: TnxMemoField;
    tForCpf: TStringField;
    tForRg: TStringField;
    tForTelefone: TStringField;
    tForEmail: TnxMemoField;
    tForMinutos: TFloatField;
    tForPassaportes: TFloatField;
    tForMinutosUsados: TFloatField;
    tForMinutosIniciais: TFloatField;
    tForIsento: TBooleanField;
    tForUsername: TStringField;
    tForPai: TStringField;
    tForMae: TStringField;
    tForSenha: TStringField;
    tForUltVisita: TDateTimeField;
    tForDebito: TCurrencyField;
    tForEscola: TStringField;
    tForEscolaHI: TDateTimeField;
    tForEscolaHF: TDateTimeField;
    tForNickName: TStringField;
    tForDataNasc: TDateTimeField;
    tForCelular: TStringField;
    tForTemDebito: TBooleanField;
    tForLimiteDebito: TCurrencyField;
    tForFoto: TGraphicField;
    tForIncluidoEm: TDateTimeField;
    tForAlteradoEm: TDateTimeField;
    tForIncluidoPor: TStringField;
    tForAlteradoPor: TStringField;
    tForTitEleitor: TStringField;
    tForFidPontos: TFloatField;
    tForFidTotal: TFloatField;
    tForFidResg: TFloatField;
    tForAniversario: TStringField;
    tForCotaImpEspecial: TBooleanField;
    tForCotaImpDia: TIntegerField;
    tForCotaImpMes: TIntegerField;
    tForSemFidelidade: TBooleanField;
    tForTemCredito: TBooleanField;
    tForNaoGuardarCredito: TBooleanField;
    tForPermiteLoginSemCred: TBooleanField;
    tForCHorario: TIntegerField;
    tForOpCHorario: TWordField;
    tForHP1: TIntegerField;
    tForHP2: TIntegerField;
    tForHP3: TIntegerField;
    tForHP4: TIntegerField;
    tForHP5: TIntegerField;
    tForHP6: TIntegerField;
    tForHP7: TIntegerField;
    tForInativo: TBooleanField;
    tForTipoAcessoPref: TIntegerField;
    tForFornecedor: TBooleanField;
    tForValorCred: TCurrencyField;
    tForRecVer: TIntegerField;
    procedure Button1Click(Sender: TObject);
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
//var I: Integer;
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
  //SL: TStrings;
  I, J, Min, Cod: Integer;
  S, s2, s3, sDoc: String;
  Mon : Currency;
  DT: TDateTime;
  Qtd : Integer;

  prodCod : integer;
   hours, mins, secs, milliSecs : Word;
   fornecedores : array[0..31] of string;
   myExtended : Extended;

const MaxProd = 100000;


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

function alignInt(i, sz:integer):string;
begin
     result := StringOfChar('0', sz) + inttostr(i);
     result := copy(result, length(result)-sz+1,  sz);

end;

function genword:string;
var
    q: integer;
begin
    result := '';
    for q:=0  to 4 + random(10) do begin
//      randomize;
       result := result + char( 65 + random( 26 ) )
    end;
end;

function genwords:string;
var
    q : integer;
begin
    result := '';
    for q:=0  to 2 + random(3) do
       result := trim( result + ' ' + genword)
end;

procedure genfornecedores;
var
    q : integer;
begin
    for q:=0  to 31 do
       fornecedores[q] := genwords;
end;

function getFornecedor:string;
begin
    result := fornecedores[random(32)]
end;



function genProdLine:string;
begin
    inc(prodCod);
    myExtended := 1000 * random;
    result := alignInt(prodCod, 8) + ';' +    // cod
        '"' + genwords + '"' + ';'  + //  desc
        '"' + getFornecedor + '"' + ';'  + //  fornece
        '"' + genwords + '"' + ';'  + //  obs
        '"' + genwords + '"' + ';'  + //  desc
        '"' + genwords + '"' + ';'  + //
        '"' + genwords + '"' + ';'  + //
        '"' + genwords + '"' + ';'  + //
        inttostr( 10 + random(100) )+ ';'  + //   tProdEstoqueAtual
        floattostr(myExtended) + ';'  + // tProdCustoUnitario
        floattostr(myExtended*1.5) + ';'  + //   tProdPreco

        '';
end;


begin
   DecodeTime(now, hours, mins, secs, milliSecs);

  RandSeed := milliSecs;
  //SL := TStringList.Create;
  //SL.LoadFromFile('c:\nexcafe\produtos.csv');

  genfornecedores;

  PB.Max := MaxProd;
  PB.Position := 0;
  tProd.Open;
  tEst.Open;
  tFor.Open;
  tProd.EmptyTable;
  tEst.EmptyTable;
  tFor.EmptyTable;
  ShortDateFormat := 'dd/mm/yyyy';
//  for J := 1 to 2 do
  for I := 0 to MaxProd-1 do begin
    PB.Position := I + 1;
    Application.ProcessMessages;
    //S := SL[I];
    S := genProdLine; // + chr(13)+char(10) + genProdLine;
    tProd.Append;
    tProdCodigo.Value := ProxCampo;
    tProdDescricao.Value := ProxCampo;
    tProdFornecedor.Value := Fornecedor(ProxCampo, ProxCampo);

    if tProdFornecedor.Value=0 then tProdFornecedor.Clear;
    AddDescr(ProxCampo);
    s2 := ProxCampo;
    if s2>'' then AddDescr('Tam.'+s2);
    s2 := ProxCampo;
    AddDescr(ProxCampo);
    AddDescr(s2);
    tProdEstoqueAtual.Value := StrToIntDef(ProxCampo, 0);
    tProdCustoUnitario.Value := StrToCurrency(ProxCampo);
    tProdPreco.Value := StrToCurrency(ProxCampo);
    tProdAtivo.Value := True;
    tProd.Post;
    if tProdEstoqueAtual.Value>0 then begin
      tEst.Append;
      tEstProduto.Value := tProdID.Value;
      tEstQuant.Value := tProdEstoqueAtual.Value;
      tEstDataHora.Value := Now;
      tEstEntrada.Value := True;
      tEstEstoqueAnt.Value := 0;
      tEstCaixa.Value := -1;
      tEstNaoControlaEstoque.Value := False;
      tEstTipoTran.Value := trEstEntrada;
      tEst.Post;
    end;
    
  end;

  Label1.caption := 'ok';
end;

function TForm16.Fornecedor(aNome, aObs: String): Integer;
begin
  if Trim(aNome)='' then begin
    Result := 0;
    Exit;
  end;
  if not tFor.FindKey([True, aNome]) then begin
    tFor.Insert;
    tForFornecedor.Value := True;
    tForNome.Value := aNome;
    tForObs.Value := aObs;
    tFor.Post;
  end;
  Result := tForID.Value;
end;

end.
