unit cmDMConv15;

interface

uses
  SysUtils, Classes, DB, nxdb, cmClassesBase, cmServBD;

type
  TdmConv15 = class(TDataModule)
    tAcesso: TnxTable;
    tTran: TnxTable;
    tAcessoNumero: TAutoIncField;
    tAcessoCaixa: TIntegerField;
    tAcessoAberto: TBooleanField;
    tAcessoTipoAcesso: TWordField;
    tAcessoInicio: TDateTimeField;
    tAcessoFim: TDateTimeField;
    tAcessoDataPagto: TDateTimeField;
    tAcessoContato: TIntegerField;
    tAcessoNome: TStringField;
    tAcessoMaquina: TWordField;
    tAcessoTipo: TWordField;
    tAcessoFuncI: TStringField;
    tAcessoFuncF: TStringField;
    tAcessoTempo: TDateTimeField;
    tAcessoTempoCobrado: TDateTimeField;
    tAcessoCredUsado: TIntegerField;
    tAcessoCredAnterior: TIntegerField;
    tAcessoDesconto: TCurrencyField;
    tAcessoProdutos: TCurrencyField;
    tAcessoMotivoDesc: TWordField;
    tAcessoValor: TCurrencyField;
    tAcessoObs: TMemoField;
    tAcessoIsento: TBooleanField;
    tAcessoFormaPagto: TStringField;
    tAcessoNaoUsarPacote: TBooleanField;
    tAcessoCodPacote: TWordField;
    tAcessoSinal: TCurrencyField;
    tAcessoAcessoPago: TIntegerField;
    tAcessoValorFinalAcesso: TCurrencyField;
    tAcessoDescontoProduto: TCurrencyField;
    tAcessoManutencao: TBooleanField;
    tTranNumero: TAutoIncField;
    tTranCaixaI: TIntegerField;
    tTranCaixaF: TIntegerField;
    tTranCaixaP: TIntegerField;
    tTranTipoAcesso: TWordField;
    tTranInicio: TDateTimeField;
    tTranFim: TDateTimeField;
    tTranDataPagto: TDateTimeField;
    tTranContato: TIntegerField;
    tTranNome: TStringField;
    tTranMaquina: TWordField;
    tTranTipo: TWordField;
    tTranFuncI: TStringField;
    tTranFuncF: TStringField;
    tTranTempo: TDateTimeField;
    tTranTempoCobrado: TDateTimeField;
    tTranCredUsado: TIntegerField;
    tTranCredAnterior: TIntegerField;
    tTranDesconto: TCurrencyField;
    tTranProdutos: TCurrencyField;
    tTranValor: TCurrencyField;
    tTranObs: TMemoField;
    tTranIsento: TBooleanField;
    tTranNaoUsarPacote: TBooleanField;
    tTranCodPacote: TWordField;
    tTranSinal: TCurrencyField;
    tTranTransacaoVinculada: TIntegerField;
    tTranValorFinalAcesso: TCurrencyField;
    tTranDescontoProduto: TCurrencyField;
    tTranNumDoc: TStringField;
    tTranStatusPagto: TWordField;
    tTranT0: TFloatField;
    tTranT1: TFloatField;
    tTranT2: TFloatField;
    tTranT3: TFloatField;
    tTranT4: TFloatField;
    tTranT5: TFloatField;
    tTranT6: TFloatField;
    tTranT7: TFloatField;
    tTranT8: TFloatField;
    tTranT9: TFloatField;
    tTranT10: TFloatField;
    tTranT11: TFloatField;
    tTranT12: TFloatField;
    tTranT13: TFloatField;
    tTranT14: TFloatField;
    tTranT15: TFloatField;
    tTranT16: TFloatField;
    tTranT17: TFloatField;
    tTranT18: TFloatField;
    tTranT19: TFloatField;
    tTranT20: TFloatField;
    tTranT21: TFloatField;
    tTranT22: TFloatField;
    tTranT23: TFloatField;
    tCaixa: TnxTable;
    tCaixaNumero: TAutoIncField;
    tCaixaAberto: TBooleanField;
    tCaixaUsuario: TStringField;
    tCaixaAbertura: TDateTimeField;
    tCaixaFechamento: TDateTimeField;
    tCaixaAcesso: TCurrencyField;
    tCaixaAcessoNaoPago: TCurrencyField;
    tCaixaAcessoDebPago: TCurrencyField;
    tCaixaAcessoQuant: TCurrencyField;
    tCaixaVenda: TCurrencyField;
    tCaixaVendaNaoPago: TCurrencyField;
    tCaixaVendaDebPago: TCurrencyField;
    tCaixaVendaQuant: TCurrencyField;
    tCaixaSuprimento: TCurrencyField;
    tCaixaSangria: TCurrencyField;
    tCaixaSaldoAnt: TCurrencyField;
    tCaixaDescontos: TCurrencyField;
    tCaixaTempoAcesso: TFloatField;
    tCaixaTempoManutencao: TFloatField;
    tCaixaObs: TMemoField;
    tME: TnxTable;
    tMESerie: TStringField;
    tMENumero: TIntegerField;
    tMECaixa: TIntegerField;
    tMEDiaHora: TDateTimeField;
    tMETipo: TStringField;
    tMEEntrada: TBooleanField;
    tMEMovEst: TBooleanField;
    tMEChamada: TIntegerField;
    tMEContato: TIntegerField;
    tMEUsuario: TStringField;
    tMEEntregar: TBooleanField;
    tMEEntregador: TWordField;
    tMECancelado: TBooleanField;
    tMEFormaPagto: TStringField;
    tMETotal: TCurrencyField;
    tMEDesconto: TCurrencyField;
    tMEObs: TMemoField;
    tMEEmissor: TIntegerField;
    tMEDtMovimentacao: TDateTimeField;
    tMESituacao: TStringField;
    tContato: TnxTable;
    tItensME: TnxTable;
    tMovEst: TnxTable;
    tItensMENumSeq: TAutoIncField;
    tItensMEEmissor: TIntegerField;
    tItensMESerie: TStringField;
    tItensMENumero: TIntegerField;
    tItensMEProduto: TStringField;
    tItensMEQuant: TFloatField;
    tItensMEUnitario: TCurrencyField;
    tItensMETotal: TCurrencyField;
    tItensMEItem: TWordField;
    tItensMEDesconto: TCurrencyField;
    tItensMEData: TDateTimeField;
    tItensMEMovEst: TBooleanField;
    tItensMEEntrada: TBooleanField;
    tItensMECancelado: TBooleanField;
    tItensMEEstoqueAnt: TFloatField;
    tItensMETipoMov: TStringField;
    tItensMEContato: TIntegerField;
    tItensMECaixa: TIntegerField;
    tMovEstNumSeq: TAutoIncField;
    tMovEstTransacao: TIntegerField;
    tMovEstProduto: TStringField;
    tMovEstQuant: TFloatField;
    tMovEstUnitario: TCurrencyField;
    tMovEstTotal: TCurrencyField;
    tMovEstItem: TWordField;
    tMovEstDesconto: TCurrencyField;
    tMovEstDataMov: TDateTimeField;
    tMovEstDataPag: TDateTimeField;
    tMovEstEntrada: TBooleanField;
    tMovEstCancelado: TBooleanField;
    tMovEstEstoqueAnt: TFloatField;
    tMovEstTipoTran: TWordField;
    tMovEstContato: TIntegerField;
    tMovEstCaixaMov: TIntegerField;
    tMovEstCaixaPag: TIntegerField;
    tMovEstCategoria: TStringField;
    tLE: TnxTable;
    tLENumero: TAutoIncField;
    tLEDia: TDateTimeField;
    tLECaixa: TIntegerField;
    tLEUsuario: TStringField;
    tLEEntrada: TBooleanField;
    tLETipo: TStringField;
    tLEDescricao: TStringField;
    tLEValor: TCurrencyField;
    tLEObs: TMemoField;
    tProd: TnxTable;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FOnAndamento : TAndamentoConversao;
    procedure ImportaAcesso;
    procedure ImportaCaixa;
    procedure ImportaME;
    procedure ImportaMovEst;
    procedure ImportaLancExtra;
  public
    Total, Atual : Integer;
    procedure Importa(DB: TnxDatabase);

    property OnAndamento: TAndamentoConversao
      read FOnAndamento write FOnAndamento;
      
    { Public declarations }
  end;

var
  dmConv15: TdmConv15;

implementation

uses cmTotCaixa, cmChecaBD15, cmChecaBD10;

{$R *.dfm}

{ TdmConv15 }

function ZeroPad(S: String; Tam: Integer): String;
begin
  Result := S;
  while Length(Result)<Tam do Result := '0' + Result;
end;

procedure TdmConv15.ImportaAcesso;
var
  AT : TArrayTempo;
  I  : Integer;
begin
  tAcesso.First;
  Atual := 0;
  Total := tAcesso.RecordCount;
  while not tAcesso.Eof do begin
    Inc(Atual);
    tTran.Append;
    tTranNumero.Value := tAcessoNumero.Value;
    tTranCaixaI.Value := tAcessoCaixa.Value;
    tTranCaixaF.Value := tAcessoCaixa.Value;
    tTranCaixaP.Value := tAcessoCaixa.Value;
    tTranTipoAcesso.Value := tAcessoTipoAcesso.Value;
    tTranInicio.Value := tAcessoInicio.Value;
    tTranFim.Value := tAcessoFim.Value;
    tTranDataPagto.Value := tAcessoDataPagto.Value;
    tTranContato.Value := tAcessoContato.Value;
    tTranNome.Value := tAcessoNome.Value;
    tTranMaquina.Value := tAcessoMaquina.Value;
    if tAcessoManutencao.Value then
      tTranTipo.Value := ttManutencao
    else
      tTranTipo.Value := tAcessoTipo.Value;
    tTranFuncI.Value := tAcessoFuncI.Value;
    tTranFuncF.Value := tAcessoFuncF.Value;
    tTranTempo.Value := tAcessoTempo.Value;
    tTranTempoCobrado.Value := tAcessoTempoCobrado.Value;
    tTranCredUsado.Value := tAcessoCredUsado.Value;
    tTranCredAnterior.Value := tAcessoCredAnterior.Value;
    tTranDesconto.Value := tAcessoDesconto.Value;
    tTranProdutos.Value := tAcessoProdutos.Value;
    tTranValor.Value := tAcessoValor.Value;
    tTranObs.Value := tAcessoObs.Value;
    tTranIsento.Value := tAcessoIsento.Value;
    tTranNaoUsarPacote.Value := tAcessoNaoUsarPacote.Value;
    tTranCodPacote.Value := tAcessoCodPacote.Value;
    tTranSinal.Value := tAcessoSinal.Value;
    tTranTransacaoVinculada.Value := tAcessoAcessoPago.Value;
    tTranValorFinalAcesso.Value := tAcessoValorFinalAcesso.Value;
    tTranDescontoProduto.Value := tAcessoDescontoProduto.Value;
    tTranStatusPagto.Value := spPago;

    if (tTranTipo.Value in [ttAcesso, ttAcessoVenda]) and (not tTranIsento.Value) then begin
      MinutosPorHora(tTranInicio.Value, tTranFim.Value, AT);
      for I := 0 to 23 do
        tTran.FieldByName('T'+IntToStr(I)).AsFloat := AT[I];
    end;
    tTran.Post;
    tAcesso.Next;

    if Assigned(FOnAndamento) then
      FOnAndamento('Acessos', Total, Atual);
  end;
end;

procedure TdmConv15.DataModuleCreate(Sender: TObject);
begin
  FOnAndamento := nil;
end;

procedure TdmConv15.ImportaCaixa;
var
  Acesso,
  AcessoNaoPago,
  AcessoDebPago,
  Venda,
  VendaNaoPago,
  VendaDebPago,
  Suprimento,
  Sangria,
  Descontos,
  TempoAcesso,
  TempoManut : Extended;
  
  QuantAcesso,
  QuantVenda : Integer;
begin
  Total := tCaixa.RecordCount;
  Atual := 0;
  tCaixa.First;
  while not tCaixa.Eof do begin
    Inc(Atual);
    try
      TotalizaCaixa(tCaixa.Database,
                    tCaixaNumero.Value, 0, 0,
                    Acesso,
                    AcessoNaoPago,
                    AcessoDebPago,
                    Venda,
                    VendaNaoPago,
                    VendaDebPago,
                    Suprimento,
                    Sangria,
                    Descontos,
                    TempoAcesso,
                    TempoManut,
                    QuantAcesso,
                    QuantVenda);
      tCaixa.Edit;
      tCaixaAcesso.Value := Acesso;
      tCaixaAcessoNaoPago.Value := AcessoNaoPago;
      tCaixaAcessoDebPago.Value := AcessoDebPago;
      tCaixaVenda.Value := Venda;
      tCaixaVendaNaoPago.Value := VendaNaoPago;
      tCaixaVendaDebPago.Value := VendaDebPago;
      tCaixaSuprimento.Value := Suprimento;
      tCaixaSangria.Value := Sangria;
      tCaixaDescontos.Value := Descontos;
      tCaixaTempoAcesso.Value := TempoAcesso;
      tCaixaTempoManutencao.Value := TempoManut;
      tCaixaAcessoQuant.Value := QuantAcesso;
      tCaixaVendaQUant.Value := QuantVenda;
      tCaixa.Post;                    
    except
    end;
    tCaixa.Next;
    if Assigned(FOnAndamento) then
      FOnAndamento('Recalculando Caixas ('+IntToStr(Atual)+'/'+IntToStr(Atual)+')', Total, Atual);
  end;
end;

procedure TdmConv15.ImportaME;
begin
  Total := tME.RecordCount;
  Atual := 0;
  while not tME.Eof do begin
    Inc(Atual);
    tTran.Append;
    tTranCaixaI.Value := tMECaixa.Value;
    tTranCaixaF.Value := tMECaixa.Value;
    tTranCaixaP.Value := tMECaixa.Value;
    if tMETipo.Value='VENDA' then
      tTranTipo.Value := ttEstVenda
    else
    if tMETipo.Value='COMPRA' then
      tTranTipo.Value := ttEstCompra
    else
    if tMETipo.Value='ENTRADA' then
      tTranTipo.Value := ttEstEntrada
    else
      tTranTipo.Value := ttEstSaida;

    tTranInicio.Value := tMEDiaHora.Value;
    tTranFim.Value := tMEDiaHora.Value;
    tTranDataPagto.Value := tMEDiaHora.Value;
    tTranContato.Value := tMEContato.Value;
    if tContato.FindKey([tTranContato.Value]) then
      tTranNome.Value := tContato.FieldByName('Nome').AsString;
    tTranFuncI.Value := tMEUsuario.Value;
    tTranFuncF.Value := tMEUsuario.Value;
    tTranDesconto.Value := tMEDesconto.Value;
    tTranProdutos.Value := tMETotal.Value;
    tTranObs.Value := tMEObs.Value;
    tTranIsento.Value := False;
    tTranValorFinalAcesso.Value := 0;
    tTranNumDoc.Value := tMESerie.Value+ZeroPad(tMENumero.AsString, 6);
    tTranStatusPagto.Value := spPago;
    tTran.Post;
    tME.Next;

    if Assigned(FOnAndamento) then
      FOnAndamento('Movimentação de Estoque', Total, Atual);
  end;
end;

procedure TdmConv15.ImportaMovEst;
begin
  tTran.IndexName := 'INumDoc';
  Total := tItensME.RecordCount;
  Atual := 0;
  tItensME.First;
  while not tItensME.Eof do begin
    Inc(Atual);
    if tItensMESerie.Value='AC' then begin
      tMovEstTransacao.Value := tItensMENumero.Value;
      tMovEstTipoTran.Value := ttAcessoVenda;
    end else begin
      if tTran.FindKey([tItensMESerie.Value+ZeroPad(tItensMENumero.AsString, 6)]) then begin
        tMovEstTransacao.Value := tTranNumero.Value;
        tMovEstTipoTran.Value := tTranTipo.Value;
      end else
      if tItensMETipoMov.Value = 'VENDA' then
        tMovEstTipoTran.Value := ttEstVenda
      else
      if tItensMETipoMov.Value = 'COMPRA' then
        tMovEstTipoTran.Value := ttEstCompra
      else
      if tItensMETipoMov.Value = 'ENTRADA' then
        tMovEstTipoTran.Value := ttEstEntrada
      else
        tMovEstTipoTran.Value := ttEstSaida;
    end;

    tMovEstProduto.Value := tItensMEProduto.Value;
    tMovEstQuant.Value := tItensMEQuant.Value;

    tMovEstUnitario.Value := tItensMEUnitario.Value;
    tMovEstTotal.Value := tItensMETotal.Value;
    tMovEstItem.Value := tItensMEItem.Value;
    tMovEstDesconto.Value := tItensMEDesconto.Value;

    tMovEstDataMov.Value := tItensMEData.Value;
    tMovEstDataPag.Value := tItensMEData.Value;
    tMovEstEntrada.Value := tItensMEEntrada.Value;
    tMovEstCancelado.Value := False;
    tMovEstEstoqueAnt.Value := tItensMEEstoqueAnt.Value;

    tMovEstContato.Value := tItensMEContato.Value;
    tMovEstCaixaMov.Value := tItensMECaixa.Value;
    tMovEstCaixaPag.Value := tItensMECaixa.Value;

    if tProd.FindKey([tMovEstProduto.Value]) then
      tMovEstCategoria.Value := tMovEst.FieldByName('Categoria').AsString;

    tItensME.Next;
    if Assigned(FOnAndamento) then
      FOnAndamento('Itens de Movimentação de Estoque', Total, Atual);
  end;
end;

procedure TdmConv15.ImportaLancExtra;
begin
  Total := tLE.RecordCount;
  Atual := 0;
  tLE.First;
  while not tLE.Eof do begin
    Inc(Atual);

    tTran.Append;
    tTranCaixaI.Value := TLECaixa.Value;
    tTranCaixaF.Value := tLECaixa.Value;
    tTranCaixaP.Value := tLECaixa.Value;
    tTranInicio.Value := tLEDia.Value;
    tTranFim.Value := tLEDia.Value;
    tTranDataPagto.Value := tLEDia.Value;
    if tLEEntrada.Value then
      tTranTipo.Value := ttSuprimentoCaixa
    else
      tTranTipo.Value := ttSangriaCaixa;
    tTranFuncI.Value := tLEUsuario.Value;
    tTranFuncF.Value := tLEUsuario.Value;
    tTranValor.Value := tLEValor.Value;
    tTranObs.Value := tLEObs.Value;
    tTranIsento.Value := False;
    tTranStatusPagto.Value := spPago;
    tTran.Post;

    tLE.Next;
    if Assigned(FOnAndamento) then
      FOnAndamento('Lançamentos Extras', Total, Atual);
  end;

end;

procedure TdmConv15.Importa(DB: TnxDatabase);
begin
  cmChecaBD10.RestructureCybermgrDatabase(DB);
  cmChecaBD15.RestructureCybermgrDatabase(DB);
  
  tAcesso.Database := DB;
  tTran.Database := DB;
  tCaixa.Database := DB;
  tItensME.Database := DB;
  tMovEst.Database := DB;
  tME.Database := DB;
  tLE.Database := DB;
  tContato.Database := DB;

  tAcesso.Open;
  tTran.Open;
  tCaixa.Open;
  tItensME.Open;
  tMovEst.Open;
  tME.Open;
  tLE.Open;
  tContato.Open;

  try
    ImportaAcesso;
  except
  end;

  try
    ImportaLancExtra;
  except
  end;

  try
    ImportaME;
  except
  end;

  try
    ImportaMovEst;
  except
  end;

  try
    ImportaCaixa;
  except
  end;

  tTran.IndexName := 'INumero';
  tTran.Last;
  tTran.SetAutoIncValue(tTranNumero.Value);

  tCaixa.IndexName := 'INumero';
  tCaixa.Last;
  tCaixa.SetAutoIncValue(tCaixaNumero.Value);  
end;

end.
