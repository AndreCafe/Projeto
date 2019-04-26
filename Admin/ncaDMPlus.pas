unit ncaDMPlus;
{
    ResourceString: Dario 10/03/13
}

interface

uses
  SysUtils, Classes, DB, nxdb, nxllComponent, uObjPool, ExtCtrls;

type
  TdmPlus = class(TDataModule)
    db: TnxDatabase;
    Session: TnxSession;
    tPlusP: TnxTable;
    tPlusPCodParceiro: TStringField;
    tPlusPNomeParceiro: TStringField;
    tPlusT: TnxTable;
    tPlusTC: TStringField;
    tPlusTN: TStringField;
    tPlusTP: TStringField;
    tPlusTT: TnxMemoField;
    tProd: TnxTable;
    tProdCodigo: TStringField;
    tProdUnid: TStringField;
    tProdPreco: TCurrencyField;
    tProdObs: TMemoField;
    tProdImagem: TGraphicField;
    tProdEstoqueAtual: TFloatField;
    tProdCustoUnitario: TCurrencyField;
    tProdEstoqueACE: TFloatField;
    tProdEstoqueACS: TFloatField;
    tProdEstoqueFinal: TFloatField;
    tProdDescricao: TStringField;
    tProdCategoria: TStringField;
    tProdSubCateg: TStringField;
    tProdPodeAlterarPreco: TBooleanField;
    tProdNaoControlaEstoque: TBooleanField;
    tProdID: TAutoIncField;
    tProdFidPontos: TIntegerField;
    tProdFidelidade: TBooleanField;
    tProdFornecedor: TIntegerField;
    tProdEstoqueMin: TFloatField;
    tProdEstoqueMax: TFloatField;
    tProdAbaixoMin: TBooleanField;
    tProdAbaixoMinDesde: TDateTimeField;
    tProdEstoqueRepor: TFloatField;
    tPlusTran: TnxTable;
    tPlusTranSeq: TAutoIncField;
    tPlusTranID: TGuidField;
    tPlusTranIDTranParceiro: TStringField;
    tPlusTranOK: TBooleanField;
    tPlusTranCaixa: TIntegerField;
    tPlusTranDataHoraParceiro: TDateTimeField;
    tPlusTranDataHoraNex: TDateTimeField;
    tPlusTrancodParceiro: TStringField;
    tPlusTranDescr: TnxMemoField;
    tPlusTranObs: TnxMemoField;
    tPlusTranFunc: TStringField;
    tPlusTranValor: TCurrencyField;
    tPlusTranCusto: TCurrencyField;
    tPlusTranSessao: TIntegerField;
    tPlusTranCliente: TIntegerField;
    tPlusTranTranID: TIntegerField;
    tPlusTranMaq: TWordField;
    tPlusTranQuant: TFloatField;
    tPlusTranPIN: TnxMemoField;
    tPlusTranEmailCliente: TStringField;
    tPlusTranIDProdutoParceiro: TStringField;
    tPlusTranIDProdutoNex: TIntegerField;
    tPlusTranImg: TGraphicField;
    tPlusTranNomeCliente: TStringField;
    tProdplus: TBooleanField;
    tProdplusURL: TnxMemoField;
    tProdplusCodParceiro: TStringField;
    tProdplusCodProduto: TStringField;
    tProdAtivo: TBooleanField;
    tPlusPurlTimeout: TStringField;
    tPlusPKeyIndex: TWordField;
    tPlusPAdesao: TBooleanField;
  private
    { Private declarations }
  public         
  
    procedure OpenDB;
    procedure SalvaToken(aCodParceiro, aToken: String);
    procedure SalvaIDLojaParceiro(aCodParceiro, aID: String);
    procedure SalvaCredenciais(aCodParceiro, aID, aToken: String);
    function obtemToken(aCodParceiro: String): String;
    function obtemIDLojaParceiro(aCodParceiro: String): String;

    procedure salvaPlusTeste;

    function criaTran(aCaixa, 
                      aSessao, 
                      aCliente, 
                      aIDProdutoNex,
                      aMaq: Integer; 
                      aCodParceiro,
                      aIDProdutoParceiro,
                      aNomeCliente,
                      aEmailCliente: String): String;

    procedure salvaTran(
      aIDTranNex : String;
      aIDTranParceiro,
      aDataTranParceiro,
      aHoraTranParceiro,
      aDescr,
      aPIN: String;
      aOK: Boolean;
      aObs: String;
      aValor: Currency;
      aImg: TMemoryStream);
    
    { Public declarations }
  end;

  TdmPlusPool = class ( TObjectPool )
  protected
    function CreateObj: TObject; override;
  public
    function Get: TdmPlus;
  end;

var
  dmPlus: TdmPlus;
  dmPlusPool : TdmPlusPool;

implementation

uses ncaDM, ncClassesBase, ncPlusTeste, ncDebug;

// START resource string wizard section
resourcestring
  STransação = 'Transação ';
  SNãoEncontradaNoBancoDeDados = ' não encontrada no banco de dados.';

// END resource string wizard section


{$R *.dfm}

{ TdmPlus }

function TdmPlus.criaTran(aCaixa, 
                          aSessao, 
                          aCliente, 
                          aIDProdutoNex,
                          aMaq: Integer; 
                          aCodParceiro,
                          aIDProdutoParceiro,
                          aNomeCliente,
                          aEmailCliente: String): String;
begin
  tPlusTran.Insert;
  tPlusTranFunc.Value := Dados.CM.UA.Username;
  tPlusTranCaixa.Value := NumAberto;
  tPlusTranCodParceiro.Value := aCodParceiro;
  tPlusTranMaq.Value := aMaq;
  tPlusTranCliente.Value := aCliente;
  tPlusTranSessao.Value := aSessao;
  tPlusTranEmailCliente.Value := aEmailCliente;
  tPlusTranIDProdutoNex.Value := aIDProdutoNex;
  tPlusTranIDProdutoParceiro.Value := aIDProdutoParceiro;
  tPlusTranNomeCliente.Value := aNomeCliente;
  tPlusTran.Post;

  Result := GuidStringClean(tPlusTranID.Value);
end;

function TdmPlus.obtemIDLojaParceiro(aCodParceiro: String): String;
begin
  if tPlusT.FindKey([aCodParceiro, gConfig.Conta]) then
    Result := tPlusTP.Value else
    Result := '';
end;

function TdmPlus.obtemToken(aCodParceiro: String): String;
begin
  if tPlusT.FindKey([aCodParceiro, gConfig.Conta]) then
    Result := tPlusTT.Value else
    Result := '';
end;

procedure TdmPlus.OpenDB;
begin
  tPlusP.Open;
  tPlusT.Open;
  tPlusTran.Open;
  tProd.Open;
end;

procedure TdmPlus.SalvaCredenciais(aCodParceiro, aID, aToken: String);
begin
  if not tPlusT.FindKey([aCodParceiro, gConfig.Conta]) then begin
    tPlusT.Insert;
    tPlusTC.Value := aCodParceiro;
    tPlusTN.Value := gConfig.Conta;
  end else
    tPlusT.Edit;
  tPlusTP.Value := aID;
  tPlusTT.Value := aToken;
  tPlusT.Post;  
end;

procedure TdmPlus.SalvaIDLojaParceiro(aCodParceiro, aID: String);
begin
  if not tPlusT.FindKey([aCodParceiro, gConfig.Conta]) then begin
    tPlusT.Insert;
    tPlusTC.Value := aCodParceiro;
    tPlusTN.Value := gConfig.Conta;
  end else
    tPlusT.Edit;
  tPlusTP.Value := aID;
  tPlusT.Post;  
end;

procedure TdmPlus.salvaPlusTeste;
begin
  ncPlusTeste.SalvaPlusTeste(tPlusP, tProd, nil);
end;

procedure TdmPlus.SalvaToken(aCodParceiro, aToken: String);
begin
  if not tPlusT.FindKey([aCodParceiro, gConfig.Conta]) then begin
    tPlust.Insert;
    tPlusTC.Value := aCodParceiro;
    tPlusTN.Value := gConfig.Conta;
  end else
    tPlusT.Edit;
  tPlusTT.Value := aToken;
  tPlusT.Post;  
end;

function SoDig(S: String): String;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do 
    if S[I] in ['0'..'9'] then
      Result := Result + S[I];
end;

function yyyymmdd_todate(S: String): TDateTime;
begin
  S := SoDig(S);
  if S='' then
    Result := 0 else
    Result := EncodeDate(StrToInt(Copy(S, 5, 4)),
                         StrToInt(Copy(S, 3, 2)),
                         StrToInt(Copy(S, 1, 2)));
end;

function hhmmss_totime(S: String): TDateTime;
begin
  S := SoDig(S);
  if S='' then
    Result := 0 else
    Result := EncodeTime(StrToInt(Copy(S, 1, 2)),
                         StrToInt(Copy(S, 3, 2)),
                         StrToInt(Copy(S, 5, 2)), 0);
end;

procedure TdmPlus.salvaTran(aIDTranNex: String; aIDTranParceiro,
  aDataTranParceiro, aHoraTranParceiro, aDescr, aPIN: String; aOK: Boolean;
  aObs: String; aValor: Currency; aImg: TMemoryStream);
var S: String;  
begin
  DebugMsg('TdmPlus.salvaTran 1'); // do not localize
  tPlusTran.IndexName := 'IID'; // do not localize
  S := GuidStringFmt(aIDTranNex);
  if not tPlusTran.FindKey([S]) then 
    Raise Exception.Create(STransação+aIDTranNex+SNãoEncontradaNoBancoDeDados);
  DebugMsg('TdmPlus.salvaTran 2'); // do not localize
  tPlusTran.Edit;
  tPlusTranIDTranParceiro.Value := aIDTranParceiro;
  tPlusTranDataHoraParceiro.Value := yyyymmdd_todate(aDataTranParceiro) + hhmmss_totime(aHoraTranParceiro);
  tPlusTranDescr.Value := aDescr;
  tPlusTranObs.Value := aObs;
  tPlusTranValor.Value := aValor;
  tPlusTranOk.Value := aOk;
  tPlusTranPIN.Value := aPIN;
  aImg.Position := 0;
  tPlusTranImg.LoadFromStream(aImg);
  tPlusTran.Post;  
  DebugMsg('TdmPlus.salvaTran 3'); // do not localize
end;


{ TdmPlusPool }

function TdmPlusPool.CreateObj: TObject;
begin
  Result := TdmPlus.Create(nil);
  try
    TdmPlus(Result).OpenDB;
  except
    Result.Free;
    Raise;
  end;
end;

function TdmPlusPool.Get: TdmPlus;
begin
  Result := TdmPlus(Self.GetObjFromPool);
end;

initialization
  dmPlusPool := TdmPlusPool.Create;

finalization
  dmPlusPool.Free;  

end.

