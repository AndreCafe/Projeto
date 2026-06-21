object dmConv15: TdmConv15
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 322
  Top = 394
  Height = 173
  Width = 376
  object tAcesso: TnxTable
    TableName = 'Acesso'
    IndexName = 'INumero'
    Left = 24
    Top = 16
    object tAcessoNumero: TAutoIncField
      FieldName = 'Numero'
    end
    object tAcessoCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tAcessoAberto: TBooleanField
      FieldName = 'Aberto'
    end
    object tAcessoTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object tAcessoInicio: TDateTimeField
      FieldName = 'Inicio'
    end
    object tAcessoFim: TDateTimeField
      FieldName = 'Fim'
    end
    object tAcessoDataPagto: TDateTimeField
      FieldName = 'DataPagto'
    end
    object tAcessoContato: TIntegerField
      FieldName = 'Contato'
    end
    object tAcessoNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tAcessoMaquina: TWordField
      FieldName = 'Maquina'
    end
    object tAcessoTipo: TWordField
      FieldName = 'Tipo'
    end
    object tAcessoFuncI: TStringField
      FieldName = 'FuncI'
      Size = 10
    end
    object tAcessoFuncF: TStringField
      FieldName = 'FuncF'
      Size = 40
    end
    object tAcessoTempo: TDateTimeField
      FieldName = 'Tempo'
    end
    object tAcessoTempoCobrado: TDateTimeField
      FieldName = 'TempoCobrado'
    end
    object tAcessoCredUsado: TIntegerField
      FieldName = 'CredUsado'
    end
    object tAcessoCredAnterior: TIntegerField
      FieldName = 'CredAnterior'
    end
    object tAcessoDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tAcessoProdutos: TCurrencyField
      FieldName = 'Produtos'
    end
    object tAcessoMotivoDesc: TWordField
      FieldName = 'MotivoDesc'
    end
    object tAcessoValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tAcessoObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tAcessoIsento: TBooleanField
      FieldName = 'Isento'
    end
    object tAcessoFormaPagto: TStringField
      FieldName = 'FormaPagto'
    end
    object tAcessoNaoUsarPacote: TBooleanField
      FieldName = 'NaoUsarPacote'
    end
    object tAcessoCodPacote: TWordField
      FieldName = 'CodPacote'
    end
    object tAcessoSinal: TCurrencyField
      FieldName = 'Sinal'
    end
    object tAcessoAcessoPago: TIntegerField
      FieldName = 'AcessoPago'
    end
    object tAcessoValorFinalAcesso: TCurrencyField
      FieldName = 'ValorFinalAcesso'
    end
    object tAcessoDescontoProduto: TCurrencyField
      FieldName = 'DescontoProduto'
    end
    object tAcessoManutencao: TBooleanField
      FieldName = 'Manutencao'
    end
  end
  object tTran: TnxTable
    TableName = 'Transacao'
    IndexName = 'INumero'
    Left = 80
    Top = 16
    object tTranNumero: TAutoIncField
      FieldName = 'Numero'
    end
    object tTranCaixaI: TIntegerField
      FieldName = 'CaixaI'
    end
    object tTranCaixaF: TIntegerField
      FieldName = 'CaixaF'
    end
    object tTranCaixaP: TIntegerField
      FieldName = 'CaixaP'
    end
    object tTranTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object tTranInicio: TDateTimeField
      FieldName = 'Inicio'
    end
    object tTranFim: TDateTimeField
      FieldName = 'Fim'
    end
    object tTranDataPagto: TDateTimeField
      FieldName = 'DataPagto'
    end
    object tTranContato: TIntegerField
      FieldName = 'Contato'
    end
    object tTranNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tTranMaquina: TWordField
      FieldName = 'Maquina'
    end
    object tTranTipo: TWordField
      FieldName = 'Tipo'
    end
    object tTranFuncI: TStringField
      FieldName = 'FuncI'
      Size = 10
    end
    object tTranFuncF: TStringField
      FieldName = 'FuncF'
      Size = 40
    end
    object tTranTempo: TDateTimeField
      FieldName = 'Tempo'
    end
    object tTranTempoCobrado: TDateTimeField
      FieldName = 'TempoCobrado'
    end
    object tTranCredUsado: TIntegerField
      FieldName = 'CredUsado'
    end
    object tTranCredAnterior: TIntegerField
      FieldName = 'CredAnterior'
    end
    object tTranDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tTranProdutos: TCurrencyField
      FieldName = 'Produtos'
    end
    object tTranValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tTranObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tTranIsento: TBooleanField
      FieldName = 'Isento'
    end
    object tTranNaoUsarPacote: TBooleanField
      FieldName = 'NaoUsarPacote'
    end
    object tTranCodPacote: TWordField
      FieldName = 'CodPacote'
    end
    object tTranSinal: TCurrencyField
      FieldName = 'Sinal'
    end
    object tTranTransacaoVinculada: TIntegerField
      FieldName = 'TransacaoVinculada'
    end
    object tTranValorFinalAcesso: TCurrencyField
      FieldName = 'ValorFinalAcesso'
    end
    object tTranDescontoProduto: TCurrencyField
      FieldName = 'DescontoProduto'
    end
    object tTranNumDoc: TStringField
      FieldName = 'NumDoc'
      Size = 15
    end
    object tTranStatusPagto: TWordField
      FieldName = 'StatusPagto'
    end
    object tTranT0: TFloatField
      FieldName = 'T0'
    end
    object tTranT1: TFloatField
      FieldName = 'T1'
    end
    object tTranT2: TFloatField
      FieldName = 'T2'
    end
    object tTranT3: TFloatField
      FieldName = 'T3'
    end
    object tTranT4: TFloatField
      FieldName = 'T4'
    end
    object tTranT5: TFloatField
      FieldName = 'T5'
    end
    object tTranT6: TFloatField
      FieldName = 'T6'
    end
    object tTranT7: TFloatField
      FieldName = 'T7'
    end
    object tTranT8: TFloatField
      FieldName = 'T8'
    end
    object tTranT9: TFloatField
      FieldName = 'T9'
    end
    object tTranT10: TFloatField
      FieldName = 'T10'
    end
    object tTranT11: TFloatField
      FieldName = 'T11'
    end
    object tTranT12: TFloatField
      FieldName = 'T12'
    end
    object tTranT13: TFloatField
      FieldName = 'T13'
    end
    object tTranT14: TFloatField
      FieldName = 'T14'
    end
    object tTranT15: TFloatField
      FieldName = 'T15'
    end
    object tTranT16: TFloatField
      FieldName = 'T16'
    end
    object tTranT17: TFloatField
      FieldName = 'T17'
    end
    object tTranT18: TFloatField
      FieldName = 'T18'
    end
    object tTranT19: TFloatField
      FieldName = 'T19'
    end
    object tTranT20: TFloatField
      FieldName = 'T20'
    end
    object tTranT21: TFloatField
      FieldName = 'T21'
    end
    object tTranT22: TFloatField
      FieldName = 'T22'
    end
    object tTranT23: TFloatField
      FieldName = 'T23'
    end
  end
  object tCaixa: TnxTable
    TableName = 'Caixa'
    IndexName = 'INumero'
    Left = 136
    Top = 16
    object tCaixaNumero: TAutoIncField
      FieldName = 'Numero'
    end
    object tCaixaAberto: TBooleanField
      FieldName = 'Aberto'
    end
    object tCaixaUsuario: TStringField
      FieldName = 'Usuario'
      Size = 10
    end
    object tCaixaAbertura: TDateTimeField
      FieldName = 'Abertura'
    end
    object tCaixaFechamento: TDateTimeField
      FieldName = 'Fechamento'
    end
    object tCaixaAcesso: TCurrencyField
      FieldName = 'Acesso'
    end
    object tCaixaAcessoNaoPago: TCurrencyField
      FieldName = 'AcessoNaoPago'
    end
    object tCaixaAcessoDebPago: TCurrencyField
      FieldName = 'AcessoDebPago'
    end
    object tCaixaAcessoQuant: TCurrencyField
      FieldName = 'AcessoQuant'
    end
    object tCaixaVenda: TCurrencyField
      FieldName = 'Venda'
    end
    object tCaixaVendaNaoPago: TCurrencyField
      FieldName = 'VendaNaoPago'
    end
    object tCaixaVendaDebPago: TCurrencyField
      FieldName = 'VendaDebPago'
    end
    object tCaixaVendaQuant: TCurrencyField
      FieldName = 'VendaQuant'
    end
    object tCaixaSuprimento: TCurrencyField
      FieldName = 'Suprimento'
    end
    object tCaixaSangria: TCurrencyField
      FieldName = 'Sangria'
    end
    object tCaixaSaldoAnt: TCurrencyField
      FieldName = 'SaldoAnt'
    end
    object tCaixaDescontos: TCurrencyField
      FieldName = 'Descontos'
    end
    object tCaixaTempoAcesso: TFloatField
      FieldName = 'TempoAcesso'
    end
    object tCaixaTempoManutencao: TFloatField
      FieldName = 'TempoManutencao'
    end
    object tCaixaObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
  end
  object tME: TnxTable
    TableName = 'ME'
    IndexName = 'IEmissorSerieNum'
    Left = 192
    Top = 16
    object tMESerie: TStringField
      FieldName = 'Serie'
      Size = 2
    end
    object tMENumero: TIntegerField
      FieldName = 'Numero'
      Required = True
    end
    object tMECaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tMEDiaHora: TDateTimeField
      FieldName = 'DiaHora'
    end
    object tMETipo: TStringField
      FieldName = 'Tipo'
      Size = 15
    end
    object tMEEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object tMEMovEst: TBooleanField
      FieldName = 'MovEst'
    end
    object tMEChamada: TIntegerField
      FieldName = 'Chamada'
    end
    object tMEContato: TIntegerField
      FieldName = 'Contato'
    end
    object tMEUsuario: TStringField
      FieldName = 'Usuario'
      Size = 10
    end
    object tMEEntregar: TBooleanField
      FieldName = 'Entregar'
    end
    object tMEEntregador: TWordField
      FieldName = 'Entregador'
    end
    object tMECancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tMEFormaPagto: TStringField
      FieldName = 'FormaPagto'
      Size = 15
    end
    object tMETotal: TCurrencyField
      FieldName = 'Total'
    end
    object tMEDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tMEObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tMEEmissor: TIntegerField
      FieldName = 'Emissor'
    end
    object tMEDtMovimentacao: TDateTimeField
      FieldName = 'DtMovimentacao'
    end
    object tMESituacao: TStringField
      FieldName = 'Situacao'
    end
  end
  object tContato: TnxTable
    TableName = 'Contato'
    IndexName = 'ICodigo'
    Left = 192
    Top = 80
  end
  object tItensME: TnxTable
    TableName = 'ItensME'
    IndexName = 'ICaixa'
    Left = 24
    Top = 80
    object tItensMENumSeq: TAutoIncField
      FieldName = 'NumSeq'
    end
    object tItensMEEmissor: TIntegerField
      FieldName = 'Emissor'
    end
    object tItensMESerie: TStringField
      FieldName = 'Serie'
      Size = 2
    end
    object tItensMENumero: TIntegerField
      FieldName = 'Numero'
    end
    object tItensMEProduto: TStringField
      FieldName = 'Produto'
      Size = 15
    end
    object tItensMEQuant: TFloatField
      FieldName = 'Quant'
    end
    object tItensMEUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object tItensMETotal: TCurrencyField
      FieldName = 'Total'
    end
    object tItensMEItem: TWordField
      FieldName = 'Item'
    end
    object tItensMEDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tItensMEData: TDateTimeField
      FieldName = 'Data'
    end
    object tItensMEMovEst: TBooleanField
      FieldName = 'MovEst'
    end
    object tItensMEEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object tItensMECancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tItensMEEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object tItensMETipoMov: TStringField
      FieldName = 'TipoMov'
      Size = 15
    end
    object tItensMEContato: TIntegerField
      FieldName = 'Contato'
    end
    object tItensMECaixa: TIntegerField
      FieldName = 'Caixa'
    end
  end
  object tMovEst: TnxTable
    TableName = 'MovEst'
    IndexName = 'ITranItem'
    Left = 80
    Top = 80
    object tMovEstNumSeq: TAutoIncField
      FieldName = 'NumSeq'
    end
    object tMovEstTransacao: TIntegerField
      FieldName = 'Transacao'
    end
    object tMovEstProduto: TStringField
      FieldName = 'Produto'
      Size = 15
    end
    object tMovEstQuant: TFloatField
      FieldName = 'Quant'
    end
    object tMovEstUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object tMovEstTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tMovEstItem: TWordField
      FieldName = 'Item'
    end
    object tMovEstDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tMovEstDataMov: TDateTimeField
      FieldName = 'DataMov'
    end
    object tMovEstDataPag: TDateTimeField
      FieldName = 'DataPag'
    end
    object tMovEstEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object tMovEstCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tMovEstEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object tMovEstTipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object tMovEstContato: TIntegerField
      FieldName = 'Contato'
    end
    object tMovEstCaixaMov: TIntegerField
      FieldName = 'CaixaMov'
    end
    object tMovEstCaixaPag: TIntegerField
      FieldName = 'CaixaPag'
    end
    object tMovEstCategoria: TStringField
      FieldName = 'Categoria'
    end
  end
  object tLE: TnxTable
    TableName = 'LancExtra'
    IndexName = 'ICaixa'
    Left = 136
    Top = 80
    object tLENumero: TAutoIncField
      FieldName = 'Numero'
    end
    object tLEDia: TDateTimeField
      FieldName = 'Dia'
    end
    object tLECaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tLEUsuario: TStringField
      FieldName = 'Usuario'
      Size = 10
    end
    object tLEEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object tLETipo: TStringField
      FieldName = 'Tipo'
      Size = 30
    end
    object tLEDescricao: TStringField
      FieldName = 'Descricao'
      Size = 40
    end
    object tLEValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tLEObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
  end
  object tProd: TnxTable
    TableName = 'Produto'
    IndexName = 'ICodigo'
    Left = 248
    Top = 16
  end
end
