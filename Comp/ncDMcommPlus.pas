unit ncDMcommPlus;
{
    ResourceString: Dario 12/03/13
}

interface

uses
  SysUtils, Classes, nxdb, nxsdServerEngine, nxreRemoteServerEngine, DB, ExtCtrls,
  nxllComponent, nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, ncCommPlusIndy;

type
  TdmCommPlus = class(TDataModule)
    nxTCPIP: TnxWinsockTransport;
    tProduto: TnxTable;
    tProdutoID: TAutoIncField;
    tProdutoCodigo: TStringField;
    tProdutoDescricao: TStringField;
    tProdutoUnid: TStringField;
    tProdutoPreco: TCurrencyField;
    tProdutoObs: TMemoField;
    tProdutoImagem: TGraphicField;
    tProdutoCategoria: TStringField;
    tProdutoSubCateg: TStringField;
    tProdutoEstoqueAtual: TFloatField;
    tProdutoCustoUnitario: TCurrencyField;
    tProdutoEstoqueACE: TFloatField;
    tProdutoEstoqueACS: TFloatField;
    tProdutoPodeAlterarPreco: TBooleanField;
    tProdutoNaoControlaEstoque: TBooleanField;
    tProdutoFidelidade: TBooleanField;
    tProdutoFidPontos: TIntegerField;
    tProdutoEstoqueMin: TFloatField;
    tProdutoEstoqueMax: TFloatField;
    tProdutoAbaixoMin: TBooleanField;
    tProdutoAbaixoMinDesde: TDateTimeField;
    tProdutoEstoqueRepor: TFloatField;
    nxRSE: TnxRemoteServerEngine;
    nxDB: TnxDatabase;
    nxSession: TnxSession;
    tParceiros: TnxTable;
    tParceirosCodParceiro: TStringField;
    tParceirosNomeParceiro: TStringField;
    tParceirosurlTimeout: TStringField;
    tParceirosAdesao: TBooleanField;
    tParceirosKeyIndex: TWordField;
    tProdutoFornecedor: TIntegerField;
    tProdutoplus: TBooleanField;
    tProdutoplusURL: TnxMemoField;
    tProdutoplusCodParceiro: TStringField;
    tProdutoplusCodProduto: TStringField;
    tProdutoAtivo: TBooleanField;
    tPlusT: TnxTable;
    tPlusTC: TStringField;
    tPlusTN: TStringField;
    tPlusTP: TStringField;
    tPlusTT: TnxMemoField;
  private
    { Private declarations }
  public
    procedure Open;
    procedure Close;

    procedure UpdateAll(aUpdateAll: TplusReqUpdateAll);
    { Public declarations }
  end;

  TThreadUpdateAll = class (TThread)
  private
    FUpd : TplusReqUpdateAll;
    FSrv : TnxBaseServerEngine;
  protected 
    procedure Execute; override;
  public
    constructor Create(aUpd: TplusReqUpdateAll; aSrv: TnxBaseServerEngine);
  end;


var
  dmCommPlus: TdmCommPlus;

implementation

uses ncClassesBase, ncDebug, ncPlusTeste;

{$R *.dfm}

{ TdmCommPlus }

procedure TdmCommPlus.UpdateAll(aUpdateAll: TplusReqUpdateAll);
var 
  SL : TStrings;
  I : Integer;
  A : Boolean;
  S : String;
  pto : TPlusTesteOptions;
begin
  Open;
  pto := TPlusTesteOptions.LoadFromIni;
  sl := TStringList.Create;
  with aUpdateAll do 
  try
    tParceiros.First;
    while not tParceiros.Eof do begin
      if (pto<>nil) or (not ReqParceiros.ParceiroExiste(tParceirosCodParceiro.Value)) then
        sl.Add(tParceirosCodParceiro.Value);
      tParceiros.Next;
    end;

    for I := 0 to sl.Count-1 do 
      if tParceiros.FindKey([sl[i]]) and ((pto=nil) or (not SameText(pto.ptoCodParceiro, sl[i]))) then tParceiros.Delete;

    if pto=nil then  
    for I := 1 to ReqParceiros.ItemCount do begin
      if tParceiros.FindKey([ReqParceiros.Codigo(I)]) then
        tParceiros.Edit else
        tParceiros.Insert;
      try;
        tParceirosCodParceiro.Value := ReqParceiros.Codigo(I);
        tParceirosNomeParceiro.Value := ReqParceiros.Nome(I);
        tParceirosKeyIndex.Value := StrToIntDef(ReqParceiros.KeyIndex(I), 0);
        tParceirosUrlTimeout.Value := ReqParceiros.url_timeout(I);
        tParceirosAdesao.Value := ReqAdesoes.AdesaoExiste(tParceirosCodParceiro.Value);
        tParceiros.Post;
      except 
        on E: Exception do begin
          S := E.Message;
          if S='asdasdasdasdassad' then Exit; // do not localize
          raise;
        end;
      end;

      if (not tParceirosAdesao.Value) then
        while tPlusT.FindKey([tParceirosCodParceiro.Value]) do tPlusT.Delete;
    end;

    tProduto.SetRange([True], [True]);
    try
      while not tProduto.Eof do begin
        with aUpdateAll do 
        if (pto<>nil) or (not ReqProdutos.ProdutoExiste(tProdutoplusCodParceiro.Value, tProdutoplusCodProduto.Value)) {and ((pto=nil) or (not SameText(pto.ptoCodParceiro, tProdutoplusCodParceiro.Value)) )} then begin
          tProduto.Edit;
          tProdutoAtivo.Value := False;
          tProduto.Post;
        end;
        tProduto.Next;
      end;
    finally
      tProduto.CancelRange;
    end;

    if pto=nil then
    for I := 1 to ReqProdutos.ItemCount do  begin
      if tProduto.FindKey([True, ReqProdutos.CodParceiro(I), ReqProdutos.Codigo(I)]) then
        tProduto.Edit else
        tProduto.Insert;

      tProdutoplus.Value := True;
      tProdutoDescricao.Value := ReqProdutos.Nome(I);
      tProdutoplusCodParceiro.Value := ReqProdutos.CodParceiro(I);
      tProdutoplusCodProduto.Value := ReqProdutos.Codigo(I);
      tProdutoplusUrl.Value := ReqProdutos.url_vendas(I);
      tProdutoAtivo.Value := ReqAdesoes.AdesaoExiste(tProdutoplusCodParceiro.Value) or ((pto<>nil) and SameText(pto.ptoCodParceiro, tProdutoplusCodParceiro.Value));
      tProdutoNaoControlaEstoque.Value := True;

      tProduto.Post;
    end;

    if pto<>nil then 
      SalvaPlusTeste(tParceiros, tProduto, pto);
  finally
    if assigned(pto) then pto.Free;
    sl.Free;
  end;
end;

procedure TdmCommPlus.Close;
begin
  nxDB.Close;
  nxSession.Close;
end;

procedure TdmCommPlus.Open;
var I: Integer;
begin
  nxDB.AliasPath := '';
  nxDB.AliasName := 'NexCafe'; // do not localize
  nxSession.Username := SessionUser;
  nxSession.Password := SessionPass;
  nxSession.Active := True;
  nxDB.Active := True;
  
  for I := 0 to nxDB.DataSetCount-1 do nxDB.DataSets[I].Active := True;
end;

{ TThreadUpdateAll }

constructor TThreadUpdateAll.Create(aUpd: TplusReqUpdateAll;
  aSrv: TnxBaseServerEngine);
begin
  FSrv := aSrv;
  FUpd := aUpd;
  inherited Create(False);
end;

procedure TThreadUpdateAll.Execute;
var DM : TdmCommPlus;
begin
  DM := nil;
  try
    DM := TdmCommPlus.Create(nil);
    DM.nxSession.ServerEngine := FSrv;
    DM.Open;
    DM.UpdateAll(FUpd);
  except
    on E: Exception do 
      DebugMsgEsp('TThreadUpdateAll.Execute - E.Message: '+E.Message, False, True); // do not localize
  end;
  if DM<>nil then DM.Free;
  FUpd.Free;
end;

end.

