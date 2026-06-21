object Dados: TDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 277
  Top = 163
  Height = 525
  Width = 767
  object ffClient: TffClient
    ClientName = 'ffClient'
    IsDefault = True
    OnConnectionLost = ffClientConnectionLost
    ServerEngine = RSE
    TimeOut = 30000
    Left = 120
    Top = 216
  end
  object Session: TffSession
    ClientName = 'ffClient'
    IsDefault = True
    SessionName = 'SesPad'
    Left = 64
    Top = 216
  end
  object db: TffDatabase
    AliasName = 'CyberMgr'
    DatabaseName = 'DB'
    FailSafe = True
    SessionName = 'SesPad'
    Left = 16
    Top = 216
  end
  object tbCli: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftAutoInc
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Endereco'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Bairro'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Cidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Nasc'
        DataType = ftDateTime
      end
      item
        Name = 'Sexo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Cpf'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Rg'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Telefone'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Email'
        DataType = ftMemo
      end
      item
        Name = 'CreditoM'
        DataType = ftInteger
      end
      item
        Name = 'TempoTotal'
        DataType = ftInteger
      end
      item
        Name = 'TempoInicial'
        DataType = ftInteger
      end
      item
        Name = 'Isento'
        DataType = ftBoolean
      end
      item
        Name = 'Username'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Senha'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'UltVisita'
        DataType = ftDateTime
      end
      item
        Name = 'Debito'
        DataType = ftCurrency
      end
      item
        Name = 'Escola'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NickName'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DataNasc'
        DataType = ftDateTime
      end
      item
        Name = 'Celular'
        DataType = ftString
        Size = 15
      end>
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'ICodigo'
        Fields = 'Codigo'
        Options = [ixUnique, ixCaseInsensitive]
      end
      item
        Name = 'INome'
        Fields = 'Nome'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IUsername'
        Fields = 'Username'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'ICodigo'
    SessionName = 'SesPad'
    TableName = 'Contato'
    Timeout = 10000
    Left = 72
    Top = 8
  end
  object dsCli: TDataSource
    DataSet = tbCli
    Left = 72
    Top = 56
  end
  object tbPro: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Unid'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'Preco'
        DataType = ftCurrency
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Imagem'
        DataType = ftGraphic
      end
      item
        Name = 'Categoria'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'EstoqueAtual'
        DataType = ftFloat
      end
      item
        Name = 'CustoUnitario'
        DataType = ftCurrency
      end
      item
        Name = 'EstoqueACE'
        DataType = ftFloat
      end
      item
        Name = 'EstoqueACS'
        DataType = ftFloat
      end>
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'ICodigo'
        Fields = 'Codigo'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IDescricao'
        Fields = 'Descricao'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'ICodigo'
    SessionName = 'SesPad'
    TableName = 'Produto'
    Timeout = 10000
    OnCalcFields = tbProCalcFields
    Left = 112
    Top = 8
    object tbProCodigo: TStringField
      DisplayLabel = 'Código'
      FieldName = 'Codigo'
      Size = 15
    end
    object tbProDescricao: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'Descricao'
      Size = 40
    end
    object tbProUnid: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'Unid'
      Size = 5
    end
    object tbProPreco: TCurrencyField
      DisplayLabel = 'Preço'
      FieldName = 'Preco'
    end
    object tbProObs: TMemoField
      DisplayLabel = 'Observação'
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tbProImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object tbProCategoria: TStringField
      FieldName = 'Categoria'
      LookupDataSet = tbCat
      LookupKeyFields = 'Descricao'
      LookupResultField = 'Descricao'
      KeyFields = 'Categoria'
      LookupCache = True
    end
    object tbProxCategoria: TStringField
      DisplayLabel = 'Categoria'
      FieldKind = fkLookup
      FieldName = 'xCategoria'
      LookupDataSet = tbCat
      LookupKeyFields = 'Descricao'
      LookupResultField = 'Descricao'
      KeyFields = 'Categoria'
      Lookup = True
    end
    object tbProEstoqueAtual: TFloatField
      FieldName = 'EstoqueAtual'
    end
    object tbProCustoUnitario: TCurrencyField
      FieldName = 'CustoUnitario'
    end
    object tbProEstoqueACE: TFloatField
      FieldName = 'EstoqueACE'
    end
    object tbProEstoqueACS: TFloatField
      FieldName = 'EstoqueACS'
    end
    object tbProEstoqueFinal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'EstoqueFinal'
      Calculated = True
    end
  end
  object dsPro: TDataSource
    DataSet = tbPro
    Left = 112
    Top = 56
  end
  object tbCat: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 20
      end>
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'Nome'
        Fields = 'Descricao'
        Options = [ixUnique, ixCaseInsensitive]
      end>
    IndexName = 'Nome'
    SessionName = 'SesPad'
    TableName = 'Categoria'
    Timeout = 10000
    Left = 156
    Top = 8
    object tbCatDescricao: TStringField
      FieldName = 'Descricao'
    end
  end
  object dsCat: TDataSource
    DataSet = tbCat
    Left = 156
    Top = 56
  end
  object dsME: TDataSource
    DataSet = tbME
    Left = 256
    Top = 56
  end
  object tbME: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Serie'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Numero'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Caixa'
        DataType = ftInteger
      end
      item
        Name = 'DiaHora'
        DataType = ftDateTime
      end
      item
        Name = 'Tipo'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Entrada'
        DataType = ftBoolean
      end
      item
        Name = 'MovEst'
        DataType = ftBoolean
      end
      item
        Name = 'Chamada'
        DataType = ftInteger
      end
      item
        Name = 'Contato'
        DataType = ftInteger
      end
      item
        Name = 'Usuario'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Entregar'
        DataType = ftBoolean
      end
      item
        Name = 'Entregador'
        DataType = ftWord
      end
      item
        Name = 'Cancelado'
        DataType = ftBoolean
      end
      item
        Name = 'FormaPagto'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Total'
        DataType = ftCurrency
      end
      item
        Name = 'Desconto'
        DataType = ftCurrency
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'EndEnt'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'BaiEnt'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'CidEnt'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'UFEnt'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Emissor'
        DataType = ftInteger
      end
      item
        Name = 'DtMovimentacao'
        DataType = ftDateTime
      end
      item
        Name = 'Situacao'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'IChamada'
        Fields = 'Chamada'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IEmissorSerieNum'
        Fields = 'Emissor;Serie;Numero'
        Options = [ixUnique, ixCaseInsensitive]
      end
      item
        Name = 'IEmissao'
        Fields = 'DiaHora'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IContatoSerieNum'
        Fields = 'Contato;Serie;Numero'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IMov'
        Fields = 'DtMovimentacao;DiaHora'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'IEmissorSerieNum'
    SessionName = 'SesPad'
    TableName = 'ME'
    Timeout = 10000
    AfterInsert = tbMEAfterInsert
    OnCalcFields = tbMECalcFields
    Left = 256
    Top = 8
    object tbMENumero: TAutoIncField
      FieldName = 'Numero'
      DisplayFormat = '000000'
    end
    object tbMEDiaHora: TDateTimeField
      FieldName = 'DiaHora'
    end
    object tbMEChamada: TIntegerField
      FieldName = 'Chamada'
    end
    object tbMEUsuario: TStringField
      DisplayLabel = 'Usuário'
      FieldName = 'Usuario'
      Size = 10
    end
    object tbMEEntregador: TWordField
      FieldName = 'Entregador'
    end
    object tbMEFormaPagto: TStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FormaPagto'
      Size = 15
    end
    object tbMETotal: TCurrencyField
      FieldName = 'Total'
    end
    object tbMEDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tbMEObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tbMEData: TDateField
      FieldKind = fkCalculated
      FieldName = 'Data'
      Calculated = True
    end
    object tbMEHora: TTimeField
      FieldKind = fkCalculated
      FieldName = 'Hora'
      Calculated = True
    end
    object tbMENomeContato: TStringField
      DisplayLabel = 'Contato'
      FieldKind = fkLookup
      FieldName = 'NomeContato'
      LookupDataSet = tbCli
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'Contato'
      Size = 40
      Lookup = True
    end
    object tbMEEndEnt: TStringField
      FieldName = 'EndEnt'
      LookupDataSet = tbCli
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Endereco'
      KeyFields = 'Cliente'
      Size = 50
    end
    object tbMEBaiEnt: TStringField
      FieldName = 'BaiEnt'
      Size = 25
    end
    object tbMECidEnt: TStringField
      FieldName = 'CidEnt'
      Size = 25
    end
    object tbMEUFEnt: TStringField
      FieldName = 'UFEnt'
      Size = 2
    end
    object tbMETotalFinal: TCurrencyField
      DisplayLabel = 'Total Final'
      FieldKind = fkCalculated
      FieldName = 'TotalFinal'
      Calculated = True
    end
    object tbMESerie: TStringField
      FieldName = 'Serie'
      Size = 2
    end
    object tbMETipo: TStringField
      FieldName = 'Tipo'
      Size = 15
    end
    object tbMEEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object tbMEMovEst: TBooleanField
      FieldName = 'MovEst'
    end
    object tbMEContato: TIntegerField
      FieldName = 'Contato'
    end
    object tbMEEmissor: TIntegerField
      FieldName = 'Emissor'
    end
    object tbMEDtMovimentacao: TDateTimeField
      FieldName = 'DtMovimentacao'
    end
    object tbMECancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tbMEEntregar: TBooleanField
      FieldName = 'Entregar'
    end
    object tbMESituacao: TStringField
      FieldName = 'Situacao'
    end
    object tbMECaixa: TIntegerField
      FieldName = 'Caixa'
    end
  end
  object tbItensME: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'NumSeq'
        DataType = ftAutoInc
      end
      item
        Name = 'Emissor'
        DataType = ftInteger
      end
      item
        Name = 'Serie'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Numero'
        DataType = ftInteger
      end
      item
        Name = 'Produto'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Quant'
        DataType = ftFloat
      end
      item
        Name = 'Unitario'
        DataType = ftCurrency
      end
      item
        Name = 'Total'
        DataType = ftCurrency
      end
      item
        Name = 'Item'
        DataType = ftWord
      end
      item
        Name = 'Desconto'
        DataType = ftCurrency
      end
      item
        Name = 'Data'
        DataType = ftDateTime
      end
      item
        Name = 'MovEst'
        DataType = ftBoolean
      end
      item
        Name = 'Entrada'
        DataType = ftBoolean
      end
      item
        Name = 'Cancelado'
        DataType = ftBoolean
      end
      item
        Name = 'EstoqueAnt'
        DataType = ftFloat
      end
      item
        Name = 'TipoMov'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Contato'
        DataType = ftInteger
      end>
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    IndexName = 'IEmissor'
    SessionName = 'SesPad'
    TableName = 'ItensME'
    Timeout = 10000
    Left = 303
    Top = 8
    object tbItensMENumSeq: TAutoIncField
      FieldName = 'NumSeq'
    end
    object tbItensMEEmissor: TIntegerField
      FieldName = 'Emissor'
    end
    object tbItensMESerie: TStringField
      FieldName = 'Serie'
      Size = 2
    end
    object tbItensMENumero: TIntegerField
      FieldName = 'Numero'
    end
    object tbItensMEProduto: TStringField
      FieldName = 'Produto'
      Size = 15
    end
    object tbItensMEQuant: TFloatField
      FieldName = 'Quant'
    end
    object tbItensMEUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object tbItensMETotal: TCurrencyField
      FieldName = 'Total'
    end
    object tbItensMEItem: TWordField
      FieldName = 'Item'
    end
    object tbItensMEDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tbItensMEData: TDateTimeField
      FieldName = 'Data'
    end
    object tbItensMEMovEst: TBooleanField
      FieldName = 'MovEst'
    end
    object tbItensMEEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object tbItensMECancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tbItensMEEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object tbItensMETipoMov: TStringField
      FieldName = 'TipoMov'
      Size = 15
    end
    object tbItensMEContato: TIntegerField
      FieldName = 'Contato'
    end
  end
  object dsItensME: TDataSource
    DataSet = tbItensME
    Left = 303
    Top = 56
  end
  object tbFPag: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 20
      end>
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'iDesc'
        Fields = 'Descricao'
        Options = [ixUnique, ixCaseInsensitive]
      end>
    IndexName = 'iDesc'
    SessionName = 'SesPad'
    TableName = 'FormPagto'
    Timeout = 10000
    Left = 16
    Top = 107
    object tbFPagDescricao: TStringField
      FieldName = 'Descricao'
    end
  end
  object dsFPag: TDataSource
    DataSet = tbFPag
    Left = 72
    Top = 108
  end
  object tbConfig: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'NumSeq'
        DataType = ftAutoInc
      end
      item
        Name = 'Modulos'
        DataType = ftMemo
      end
      item
        Name = 'TiposLancExtra'
        DataType = ftMemo
      end
      item
        Name = 'ProgramasPermitidos'
        DataType = ftMemo
      end
      item
        Name = 'JanelasExplorer'
        DataType = ftMemo
      end
      item
        Name = 'FecharProgramas'
        DataType = ftBoolean
      end
      item
        Name = 'AutoExecutar'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'LimiteTempoPadrao'
        DataType = ftDateTime
      end
      item
        Name = 'PacoteTempoReal'
        DataType = ftBoolean
      end
      item
        Name = 'PermiteLoginSemCred'
        DataType = ftBoolean
      end
      item
        Name = 'PausarFimPacote'
        DataType = ftBoolean
      end
      item
        Name = 'ProdutoImpressao'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'PermiteCapturaTela'
        DataType = ftBoolean
      end
      item
        Name = 'AlertaFimTempo'
        DataType = ftDateTime
      end
      item
        Name = 'VariosTiposAcesso'
        DataType = ftBoolean
      end
      item
        Name = 'ModoPagtoAcesso'
        DataType = ftWord
      end
      item
        Name = 'MostraPrePagoDec'
        DataType = ftBoolean
      end
      item
        Name = 'TempoMaxAlerta'
        DataType = ftDateTime
      end
      item
        Name = 'MostraCliCadAntesAvulso'
        DataType = ftBoolean
      end
      item
        Name = 'Abre1'
        DataType = ftDateTime
      end
      item
        Name = 'Abre2'
        DataType = ftDateTime
      end
      item
        Name = 'Abre3'
        DataType = ftDateTime
      end
      item
        Name = 'Abre4'
        DataType = ftDateTime
      end
      item
        Name = 'Abre5'
        DataType = ftDateTime
      end
      item
        Name = 'Abre6'
        DataType = ftDateTime
      end
      item
        Name = 'Abre7'
        DataType = ftDateTime
      end
      item
        Name = 'Fecha1'
        DataType = ftDateTime
      end
      item
        Name = 'Fecha2'
        DataType = ftDateTime
      end
      item
        Name = 'Fecha3'
        DataType = ftDateTime
      end
      item
        Name = 'Fecha4'
        DataType = ftDateTime
      end
      item
        Name = 'Fecha5'
        DataType = ftDateTime
      end
      item
        Name = 'Fecha6'
        DataType = ftDateTime
      end
      item
        Name = 'Fecha7'
        DataType = ftDateTime
      end
      item
        Name = 'CorLivre'
        DataType = ftInteger
      end
      item
        Name = 'CorFLivre'
        DataType = ftInteger
      end
      item
        Name = 'CorUsoPrePago'
        DataType = ftInteger
      end
      item
        Name = 'CorFUsoPrePago'
        DataType = ftInteger
      end
      item
        Name = 'CorUsoPosPago'
        DataType = ftInteger
      end
      item
        Name = 'CorFUsoPosPago'
        DataType = ftInteger
      end
      item
        Name = 'CorAguardaPagto'
        DataType = ftInteger
      end
      item
        Name = 'CorFAguardaPagto'
        DataType = ftInteger
      end
      item
        Name = 'CorManutencao'
        DataType = ftInteger
      end
      item
        Name = 'CorFManutencao'
        DataType = ftInteger
      end
      item
        Name = 'CorPausado'
        DataType = ftInteger
      end
      item
        Name = 'CorFPausado'
        DataType = ftInteger
      end>
    SessionName = 'SesPad'
    TableName = 'Config'
    Timeout = 10000
    Left = 157
    Top = 216
    object tbConfigNomeProdImp: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeProdImp'
      LookupDataSet = tbPro
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'ProdutoImpressao'
      Size = 50
      Lookup = True
    end
    object tbConfigNumSeq: TAutoIncField
      FieldName = 'NumSeq'
    end
    object tbConfigModulos: TMemoField
      FieldName = 'Modulos'
      BlobType = ftMemo
    end
    object tbConfigTiposLancExtra: TMemoField
      FieldName = 'TiposLancExtra'
      BlobType = ftMemo
    end
    object tbConfigProgramasPermitidos: TMemoField
      FieldName = 'ProgramasPermitidos'
      BlobType = ftMemo
    end
    object tbConfigJanelasExplorer: TMemoField
      FieldName = 'JanelasExplorer'
      BlobType = ftMemo
    end
    object tbConfigFecharProgramas: TBooleanField
      FieldName = 'FecharProgramas'
    end
    object tbConfigAutoExecutar: TStringField
      FieldName = 'AutoExecutar'
      Size = 200
    end
    object tbConfigLimiteTempoPadrao: TDateTimeField
      FieldName = 'LimiteTempoPadrao'
      DisplayFormat = 'hh:mm:ss'
      EditMask = 'hh:mm:ss'
    end
    object tbConfigPacoteTempoReal: TBooleanField
      FieldName = 'PacoteTempoReal'
    end
    object tbConfigPermiteLoginSemCred: TBooleanField
      FieldName = 'PermiteLoginSemCred'
    end
    object tbConfigPausarFimPacote: TBooleanField
      FieldName = 'PausarFimPacote'
    end
    object tbConfigProdutoImpressao: TStringField
      FieldName = 'ProdutoImpressao'
      Size = 15
    end
    object tbConfigPermiteCapturaTela: TBooleanField
      FieldName = 'PermiteCapturaTela'
    end
    object tbConfigAlertaFimTempo: TDateTimeField
      FieldName = 'AlertaFimTempo'
      DisplayFormat = 'hh:mm:ss'
      EditMask = 'hh:mm:ss'
    end
    object tbConfigVariosTiposAcesso: TBooleanField
      FieldName = 'VariosTiposAcesso'
    end
    object tbConfigModoPagtoAcesso: TWordField
      FieldName = 'ModoPagtoAcesso'
    end
    object tbConfigMostraPrePagoDec: TBooleanField
      FieldName = 'MostraPrePagoDec'
    end
    object tbConfigTempoMaxAlerta: TDateTimeField
      FieldName = 'TempoMaxAlerta'
      DisplayFormat = 'hh:mm:ss'
      EditMask = 'hh:mm:ss'
    end
    object tbConfigMostraCliCadAntesAvulso: TBooleanField
      FieldName = 'MostraCliCadAntesAvulso'
    end
    object tbConfigAbre1: TDateTimeField
      FieldName = 'Abre1'
    end
    object tbConfigAbre2: TDateTimeField
      FieldName = 'Abre2'
    end
    object tbConfigAbre3: TDateTimeField
      FieldName = 'Abre3'
    end
    object tbConfigAbre4: TDateTimeField
      FieldName = 'Abre4'
    end
    object tbConfigAbre5: TDateTimeField
      FieldName = 'Abre5'
    end
    object tbConfigAbre6: TDateTimeField
      FieldName = 'Abre6'
    end
    object tbConfigAbre7: TDateTimeField
      FieldName = 'Abre7'
    end
    object tbConfigFecha1: TDateTimeField
      FieldName = 'Fecha1'
    end
    object tbConfigFecha2: TDateTimeField
      FieldName = 'Fecha2'
    end
    object tbConfigFecha3: TDateTimeField
      FieldName = 'Fecha3'
    end
    object tbConfigFecha4: TDateTimeField
      FieldName = 'Fecha4'
    end
    object tbConfigFecha5: TDateTimeField
      FieldName = 'Fecha5'
    end
    object tbConfigFecha6: TDateTimeField
      FieldName = 'Fecha6'
    end
    object tbConfigFecha7: TDateTimeField
      FieldName = 'Fecha7'
    end
    object tbConfigCorLivre: TIntegerField
      FieldName = 'CorLivre'
    end
    object tbConfigCorFLivre: TIntegerField
      FieldName = 'CorFLivre'
    end
    object tbConfigCorUsoPrePago: TIntegerField
      FieldName = 'CorUsoPrePago'
    end
    object tbConfigCorFUsoPrePago: TIntegerField
      FieldName = 'CorFUsoPrePago'
    end
    object tbConfigCorUsoPosPago: TIntegerField
      FieldName = 'CorUsoPosPago'
    end
    object tbConfigCorFUsoPosPago: TIntegerField
      FieldName = 'CorFUsoPosPago'
    end
    object tbConfigCorAguardaPagto: TIntegerField
      FieldName = 'CorAguardaPagto'
    end
    object tbConfigCorFAguardaPagto: TIntegerField
      FieldName = 'CorFAguardaPagto'
    end
    object tbConfigCorManutencao: TIntegerField
      FieldName = 'CorManutencao'
    end
    object tbConfigCorFManutencao: TIntegerField
      FieldName = 'CorFManutencao'
    end
    object tbConfigCorPausado: TIntegerField
      FieldName = 'CorPausado'
    end
    object tbConfigCorFPausado: TIntegerField
      FieldName = 'CorFPausado'
    end
  end
  object dsConfig: TDataSource
    DataSet = tbConfig
    Left = 157
    Top = 264
  end
  object SoUmProg: TLMDOneInstance
    Mode = oiCustom
    OnCustom = SoUmProgCustom
    Left = 360
    Top = 156
  end
  object tbTipoMov: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Nome'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'MovEst'
        DataType = ftBoolean
      end
      item
        Name = 'Entrada'
        DataType = ftBoolean
      end
      item
        Name = 'Serie'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'PermiteAlterarSerie'
        DataType = ftBoolean
      end
      item
        Name = 'NumeroAutomatico'
        DataType = ftBoolean
      end
      item
        Name = 'ConfirmarMovEstoque'
        DataType = ftBoolean
      end
      item
        Name = 'AtualizaCusto'
        DataType = ftBoolean
      end
      item
        Name = 'Situacoes'
        DataType = ftMemo
      end>
    IndexName = 'INome'
    SessionName = 'SesPad'
    TableName = 'TipoMov'
    Timeout = 10000
    Left = 303
    Top = 107
    object tbTipoMovNome: TStringField
      FieldName = 'Nome'
      Size = 15
    end
    object tbTipoMovMovEst: TBooleanField
      FieldName = 'MovEst'
    end
    object tbTipoMovEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object tbTipoMovSerie: TStringField
      FieldName = 'Serie'
      Size = 2
    end
    object tbTipoMovPermiteAlterarSerie: TBooleanField
      FieldName = 'PermiteAlterarSerie'
    end
    object tbTipoMovNumeroAutomatico: TBooleanField
      FieldName = 'NumeroAutomatico'
    end
    object tbTipoMovConfirmarMovEstoque: TBooleanField
      FieldName = 'ConfirmarMovEstoque'
    end
    object tbTipoMovAtualizaCusto: TBooleanField
      FieldName = 'AtualizaCusto'
    end
    object tbTipoMovSituacoes: TMemoField
      FieldName = 'Situacoes'
      BlobType = ftMemo
    end
  end
  object dsTipoMov: TDataSource
    DataSet = tbTipoMov
    Left = 303
    Top = 156
  end
  object tAuxItens: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'NumSeq'
        DataType = ftAutoInc
      end
      item
        Name = 'Emissor'
        DataType = ftInteger
      end
      item
        Name = 'Serie'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Numero'
        DataType = ftInteger
      end
      item
        Name = 'Produto'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Quant'
        DataType = ftFloat
      end
      item
        Name = 'Unitario'
        DataType = ftCurrency
      end
      item
        Name = 'Total'
        DataType = ftCurrency
      end
      item
        Name = 'Item'
        DataType = ftWord
      end
      item
        Name = 'Desconto'
        DataType = ftCurrency
      end
      item
        Name = 'Data'
        DataType = ftDateTime
      end
      item
        Name = 'MovEst'
        DataType = ftBoolean
      end
      item
        Name = 'Entrada'
        DataType = ftBoolean
      end
      item
        Name = 'Cancelado'
        DataType = ftBoolean
      end
      item
        Name = 'EstoqueAnt'
        DataType = ftFloat
      end
      item
        Name = 'TipoMov'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Contato'
        DataType = ftInteger
      end>
    IndexName = 'iProd'
    SessionName = 'SesPad'
    TableName = 'ItensME'
    Timeout = 10000
    OnCalcFields = tAuxItensCalcFields
    Left = 64
    Top = 264
    object tAuxItensEmissor: TIntegerField
      FieldName = 'Emissor'
    end
    object tAuxItensSerie: TStringField
      FieldName = 'Serie'
      Size = 2
    end
    object tAuxItensNumero: TIntegerField
      FieldName = 'Numero'
    end
    object tAuxItensProduto: TStringField
      FieldName = 'Produto'
      Size = 15
    end
    object tAuxItensQuant: TFloatField
      FieldName = 'Quant'
    end
    object tAuxItensUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object tAuxItensTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tAuxItensItem: TWordField
      FieldName = 'Item'
    end
    object tAuxItensDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tAuxItensData: TDateTimeField
      FieldName = 'Data'
    end
    object tAuxItensMovEst: TBooleanField
      FieldName = 'MovEst'
    end
    object tAuxItensCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tAuxItensEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object tAuxItensTipoMov: TStringField
      FieldName = 'TipoMov'
      Size = 15
    end
    object tAuxItensContato: TIntegerField
      FieldName = 'Contato'
    end
    object tAuxItensSaldo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Saldo'
      Calculated = True
    end
    object tAuxItensFatorSaldo: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'FatorSaldo'
      Calculated = True
    end
    object tAuxItensNumSeq: TAutoIncField
      FieldName = 'NumSeq'
    end
    object tAuxItensEntrada: TBooleanField
      FieldName = 'Entrada'
    end
  end
  object RSE: TFFRemoteServerEngine
    Transport = ffLT
    Left = 368
    Top = 220
  end
  object ffLT: TffLegacyTransport
    Enabled = True
    ServerName = 'localhost'
    Protocol = ptTCPIP
    Left = 416
    Top = 220
  end
  object mtUsuario: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = -1
    FieldDefs = <
      item
        Name = 'Username'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Admin'
        DataType = ftBoolean
      end
      item
        Name = 'Senha'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Grupos'
        DataType = ftMemo
      end
      item
        Name = 'Direitos'
        DataType = ftMemo
      end>
    IndexFieldNames = 'Username'
    IndexName = 'mtUsuariosIndex1'
    IndexDefs = <
      item
        Name = 'mtUsuariosIndex1'
        Fields = 'Username'
        Options = [ixPrimary, ixCaseInsensitive]
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    Version = '4.04'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 415
    Top = 8
    object mtUsuarioUsername: TStringField
      FieldName = 'Username'
      Size = 10
    end
    object mtUsuarioNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object mtUsuarioAdmin: TBooleanField
      FieldName = 'Admin'
    end
    object mtUsuarioSenha: TStringField
      FieldName = 'Senha'
      Size = 10
    end
    object mtUsuarioGrupos: TMemoField
      FieldName = 'Grupos'
      BlobType = ftMemo
    end
    object mtUsuarioDireitos: TMemoField
      FieldName = 'Direitos'
      BlobType = ftMemo
    end
    object mtUsuarioNumClientes: TIntegerField
      FieldName = 'NumClientes'
    end
  end
  object dsUsuario: TDataSource
    DataSet = mtUsuario
    Left = 415
    Top = 56
  end
  object mtGrupo: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = -1
    FieldDefs = <
      item
        Name = 'Nome'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Usuarios'
        DataType = ftMemo
      end
      item
        Name = 'Direitos'
        DataType = ftMemo
      end>
    IndexFieldNames = 'Nome'
    IndexName = 'mtGrupoIndex1'
    IndexDefs = <
      item
        Name = 'mtGrupoIndex1'
        Fields = 'Nome'
        Options = [ixPrimary, ixCaseInsensitive]
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    Version = '4.04'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 415
    Top = 107
    object mtGrupoNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
    object mtGrupoUsuarios: TMemoField
      FieldName = 'Usuarios'
      BlobType = ftMemo
    end
    object mtGrupoDireitos: TMemoField
      FieldName = 'Direitos'
      BlobType = ftMemo
    end
  end
  object dsGrupo: TDataSource
    DataSet = mtGrupo
    Left = 415
    Top = 156
  end
  object tbLayout: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Usuario'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Grid'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Publico'
        DataType = ftBoolean
      end
      item
        Name = 'Layout'
        DataType = ftBlob
      end
      item
        Name = 'Filtro'
        DataType = ftBlob
      end
      item
        Name = 'Usuarios'
        DataType = ftMemo
      end>
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'IPubGridUsuario'
        Fields = 'Publico;Grid;Usuario'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'IPubGridUsuario'
    SessionName = 'SesPad'
    TableName = 'Layout'
    Left = 16
    Top = 8
    object tbLayoutUsuario: TStringField
      FieldName = 'Usuario'
      Size = 10
    end
    object tbLayoutGrid: TStringField
      FieldName = 'Grid'
      Size = 40
    end
    object tbLayoutNome: TStringField
      FieldName = 'Nome'
      Size = 100
    end
    object tbLayoutPublico: TBooleanField
      FieldName = 'Publico'
    end
    object tbLayoutLayout: TBlobField
      FieldName = 'Layout'
      BlobType = ftBlob
    end
    object tbLayoutFiltro: TBlobField
      FieldName = 'Filtro'
      BlobType = ftBlob
    end
    object tbLayoutUsuarios: TMemoField
      FieldName = 'Usuarios'
      BlobType = ftMemo
    end
  end
  object dsLayout: TDataSource
    DataSet = tbLayout
    Left = 16
    Top = 56
  end
  object ServRem: TCMServidorRemoto
    Ativo = False
    Left = 360
    Top = 56
  end
  object CM: TClienteCyberMgr
    Servidor = ServRem
    Ativo = False
    Username = 'proxy'
    Senha = 'proxypass'
    Maquina = 0
    FuncAtual = True
    AutoAtualizar = False
    AoDesativar = CMAoDesativar
    AoDestruirMaquina = CMAoDestruirMaquina
    AoAtualizarMaquina = CMAoAtualizarMaquina
    AoDestruirGrupo = CMAoDestruirGrupo
    AoAtualizarGrupo = CMAoAtualizarGrupo
    AoDestruirUsuario = CMAoDestruirUsuario
    AoAtualizarUsuario = CMAoAtualizarUsuario
    Left = 360
    Top = 8
  end
  object mtMaquina: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = -1
    FieldDefs = <
      item
        Name = 'Numero'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Inicio'
        DataType = ftDateTime
      end
      item
        Name = 'Contato'
        DataType = ftInteger
      end
      item
        Name = 'NomeContato'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'InicioTicks'
        DataType = ftInteger
      end
      item
        Name = 'Acesso'
        DataType = ftInteger
      end
      item
        Name = 'Cliente'
        DataType = ftInteger
      end
      item
        Name = 'ProgramaAtual'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Parado'
        DataType = ftBoolean
      end
      item
        Name = 'LimiteTempo'
        DataType = ftInteger
      end
      item
        Name = 'Menu'
        DataType = ftMemo
      end
      item
        Name = 'TipoAcesso'
        DataType = ftWord
      end>
    IndexDefs = <
      item
        Name = 'mtMaquinaIndex1'
        Fields = 'Numero'
        Options = [ixPrimary, ixCaseInsensitive]
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    Version = '4.04'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    OnCalcFields = mtMaquinaCalcFields
    Left = 200
    Top = 112
    object mtMaquinaNumero: TIntegerField
      FieldName = 'Numero'
    end
    object mtMaquinaNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object mtMaquinaInicio: TDateTimeField
      FieldName = 'Inicio'
      DisplayFormat = 'hh:mm:ss'
    end
    object mtMaquinaContato: TIntegerField
      FieldName = 'Contato'
    end
    object mtMaquinaNomeContato: TStringField
      DisplayLabel = 'Nome Usuário'
      FieldName = 'NomeContato'
      Size = 40
    end
    object mtMaquinaInicioTicks: TIntegerField
      DisplayLabel = 'Ticks Inicio'
      FieldName = 'InicioTicks'
    end
    object mtMaquinaAcesso: TIntegerField
      FieldName = 'Acesso'
    end
    object mtMaquinaCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object mtMaquinaConectado: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'Conectado'
      Calculated = True
    end
    object mtMaquinaProgramaAtual: TStringField
      FieldName = 'ProgramaAtual'
      Size = 255
    end
    object mtMaquinaParado: TBooleanField
      FieldName = 'Parado'
    end
    object mtMaquinaLimiteTempo: TIntegerField
      FieldName = 'LimiteTempo'
    end
    object mtMaquinaLimiteTempoDT: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'LimiteTempoDT'
      DisplayFormat = 'hh:mm:ss'
      Calculated = True
    end
    object mtMaquinaMenu: TMemoField
      FieldName = 'Menu'
      BlobType = ftMemo
    end
    object mtMaquinaTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object mtMaquinaNomeTipoAcesso: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeTipoAcesso'
      LookupDataSet = tbTipoAcesso
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'TipoAcesso'
      Size = 30
      Lookup = True
    end
    object mtMaquinaMostrar: TStringField
      FieldKind = fkCalculated
      FieldName = 'Mostrar'
      Size = 40
      Calculated = True
    end
    object mtMaquinaSinal: TCurrencyField
      FieldName = 'Sinal'
    end
    object mtMaquinaVendas: TFloatField
      FieldName = 'Vendas'
    end
    object mtMaquinaTotalFinal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TotalFinal'
      Calculated = True
    end
    object mtMaquinaObsAcesso: TStringField
      FieldName = 'ObsAcesso'
      Size = 255
    end
    object mtMaquinaLiberaAlemPacote: TBooleanField
      FieldName = 'LiberaAlemPacote'
    end
    object mtMaquinaComputerName: TStringField
      FieldName = 'ComputerName'
      Size = 200
    end
    object mtMaquinaAguardaPagto: TBooleanField
      FieldName = 'AguardaPagto'
    end
    object mtMaquinaManutencao: TBooleanField
      FieldName = 'Manutencao'
    end
    object mtMaquinaCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object mtMaquinaUsuarioI: TStringField
      FieldName = 'UsuarioI'
      Size = 30
    end
  end
  object dsMaquina: TDataSource
    DataSet = mtMaquina
    Left = 200
    Top = 160
  end
  object tbMotivo: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftWord
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'ICodigo'
        Fields = 'Codigo'
        Options = [ixUnique, ixCaseInsensitive]
      end>
    IndexName = 'ICodigo'
    SessionName = 'SesPad'
    TableName = 'Motivo'
    Left = 232
    Top = 216
    object tbMotivoCodigo: TWordField
      FieldName = 'Codigo'
    end
    object tbMotivoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
  end
  object dsMotivo: TDataSource
    Left = 232
    Top = 264
  end
  object tbPacote: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftWord
      end
      item
        Name = 'Horas'
        DataType = ftWord
      end
      item
        Name = 'ValorTotal'
        DataType = ftCurrency
      end
      item
        Name = 'Descr'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'ICodigo'
        Fields = 'Codigo;Codigo'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'ICodigo'
    SessionName = 'SesPad'
    TableName = 'Pacote'
    Left = 312
    Top = 224
    object tbPacoteHoras: TSmallintField
      FieldName = 'Horas'
    end
    object tbPacoteValorTotal: TCurrencyField
      FieldName = 'ValorTotal'
    end
    object tbPacoteDescr: TStringField
      FieldName = 'Descr'
      Size = 30
    end
    object tbPacoteCodigo: TWordField
      FieldName = 'Codigo'
    end
  end
  object dsPacote: TDataSource
    DataSet = tbPacote
    Left = 312
    Top = 280
  end
  object tbCaixa: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Numero'
        DataType = ftAutoInc
      end
      item
        Name = 'Abertura'
        DataType = ftDateTime
      end
      item
        Name = 'Fechamento'
        DataType = ftDateTime
      end
      item
        Name = 'Usuario'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LancExtrasE'
        DataType = ftCurrency
      end
      item
        Name = 'LancExtrasS'
        DataType = ftCurrency
      end
      item
        Name = 'Descontos'
        DataType = ftCurrency
      end
      item
        Name = 'Internet'
        DataType = ftCurrency
      end
      item
        Name = 'Pacotes'
        DataType = ftCurrency
      end
      item
        Name = 'Vendas'
        DataType = ftCurrency
      end
      item
        Name = 'SaldoAnt'
        DataType = ftCurrency
      end
      item
        Name = 'Aberto'
        DataType = ftBoolean
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'AguardandoPagto'
        DataType = ftCurrency
      end>
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'INumero'
        Fields = 'Numero'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IAberto'
        Fields = 'Aberto'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IDia'
        Fields = 'Abertura'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'IAberto'
    SessionName = 'SesPad'
    TableName = 'Caixa'
    Left = 208
    Top = 8
    object tbCaixaNumero: TAutoIncField
      FieldName = 'Numero'
    end
    object tbCaixaAbertura: TDateTimeField
      FieldName = 'Abertura'
    end
    object tbCaixaFechamento: TDateTimeField
      FieldName = 'Fechamento'
    end
    object tbCaixaUsuario: TStringField
      FieldName = 'Usuario'
      Size = 10
    end
    object tbCaixaLancExtrasE: TCurrencyField
      FieldName = 'LancExtrasE'
    end
    object tbCaixaLancExtrasS: TCurrencyField
      FieldName = 'LancExtrasS'
    end
    object tbCaixaDescontos: TCurrencyField
      FieldName = 'Descontos'
    end
    object tbCaixaInternet: TCurrencyField
      FieldName = 'Internet'
    end
    object tbCaixaPacotes: TCurrencyField
      FieldName = 'Pacotes'
    end
    object tbCaixaVendas: TCurrencyField
      FieldName = 'Vendas'
    end
    object tbCaixaSaldoAnt: TCurrencyField
      FieldName = 'SaldoAnt'
    end
    object tbCaixaAberto: TBooleanField
      FieldName = 'Aberto'
    end
    object tbCaixaObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tbCaixaAguardandoPagto: TCurrencyField
      FieldName = 'AguardandoPagto'
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1500
    OnTimer = Timer1Timer
    Left = 376
    Top = 288
  end
  object tbAcesso: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Numero'
        DataType = ftAutoInc
      end
      item
        Name = 'Caixa'
        DataType = ftInteger
      end
      item
        Name = 'Aberto'
        DataType = ftBoolean
      end
      item
        Name = 'TipoAcesso'
        DataType = ftWord
      end
      item
        Name = 'Inicio'
        DataType = ftDateTime
      end
      item
        Name = 'Fim'
        DataType = ftDateTime
      end
      item
        Name = 'DataPagto'
        DataType = ftDateTime
      end
      item
        Name = 'Contato'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Maquina'
        DataType = ftWord
      end
      item
        Name = 'Tipo'
        DataType = ftWord
      end
      item
        Name = 'FuncI'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'FuncF'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Tempo'
        DataType = ftDateTime
      end
      item
        Name = 'TempoCobrado'
        DataType = ftDateTime
      end
      item
        Name = 'CredUsado'
        DataType = ftInteger
      end
      item
        Name = 'CredAnterior'
        DataType = ftInteger
      end
      item
        Name = 'Desconto'
        DataType = ftCurrency
      end
      item
        Name = 'Produtos'
        DataType = ftCurrency
      end
      item
        Name = 'MotivoDesc'
        DataType = ftWord
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Isento'
        DataType = ftBoolean
      end
      item
        Name = 'FormaPagto'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NaoUsarPacote'
        DataType = ftBoolean
      end
      item
        Name = 'CodPacote'
        DataType = ftWord
      end
      item
        Name = 'Sinal'
        DataType = ftCurrency
      end
      item
        Name = 'AcessoPago'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'IAberto'
        Fields = 'Aberto;Maquina'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IContato'
        Fields = 'Contato;Inicio'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IData'
        Fields = 'Inicio'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IUsuario'
        Fields = 'FuncI;Inicio'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'INumero'
        Fields = 'Numero'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IPagto'
        Fields = 'Aberto;DataPagto;Fim'
        Options = [ixDescending, ixCaseInsensitive]
      end
      item
        Name = 'IFim'
        Fields = 'Fim'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'ICaixa'
        Fields = 'Caixa;Inicio'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'ICodPac'
        Fields = 'CodPacote'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'ICaixaFim'
        Fields = 'Caixa;Fim'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IAcessoPago'
        Fields = 'AcessoPago'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'INumero'
    SessionName = 'SesPad'
    TableName = 'Acesso'
    Timeout = 10000
    Left = 119
    Top = 107
  end
  object tbAuxCx: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Numero'
        DataType = ftAutoInc
      end
      item
        Name = 'Abertura'
        DataType = ftDateTime
      end
      item
        Name = 'Fechamento'
        DataType = ftDateTime
      end
      item
        Name = 'Usuario'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LancExtrasE'
        DataType = ftCurrency
      end
      item
        Name = 'LancExtrasS'
        DataType = ftCurrency
      end
      item
        Name = 'Descontos'
        DataType = ftCurrency
      end
      item
        Name = 'Internet'
        DataType = ftCurrency
      end
      item
        Name = 'Pacotes'
        DataType = ftCurrency
      end
      item
        Name = 'Vendas'
        DataType = ftCurrency
      end
      item
        Name = 'SaldoAnt'
        DataType = ftCurrency
      end
      item
        Name = 'Aberto'
        DataType = ftBoolean
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end>
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'INumero'
        Fields = 'Numero'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IAberto'
        Fields = 'Aberto'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IDia'
        Fields = 'Abertura'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'INumero'
    SessionName = 'SesPad'
    TableName = 'Caixa'
    OnCalcFields = tbAuxCxCalcFields
    Left = 96
    Top = 315
    object tbAuxCxNumero: TAutoIncField
      FieldName = 'Numero'
    end
    object tbAuxCxAbertura: TDateTimeField
      FieldName = 'Abertura'
    end
    object tbAuxCxFechamento: TDateTimeField
      FieldName = 'Fechamento'
    end
    object tbAuxCxUsuario: TStringField
      FieldName = 'Usuario'
      Size = 10
    end
    object tbAuxCxDescontos: TCurrencyField
      FieldName = 'Descontos'
    end
    object tbAuxCxInternet: TCurrencyField
      FieldName = 'Internet'
    end
    object tbAuxCxSaldoAnt: TCurrencyField
      FieldName = 'SaldoAnt'
    end
    object tbAuxCxAberto: TBooleanField
      FieldName = 'Aberto'
    end
    object tbAuxCxObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tbAuxCxSaldoFinal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SaldoFinal'
      Calculated = True
    end
    object tbAuxCxVendas: TCurrencyField
      FieldName = 'Vendas'
    end
    object tbAuxCxPacotes: TCurrencyField
      FieldName = 'Pacotes'
    end
    object tbAuxCxLancExtrasE: TCurrencyField
      FieldName = 'LancExtrasE'
    end
    object tbAuxCxLancExtrasS: TCurrencyField
      FieldName = 'LancExtrasS'
    end
  end
  object tbLancExtra: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Numero'
        DataType = ftAutoInc
      end
      item
        Name = 'Dia'
        DataType = ftDateTime
      end
      item
        Name = 'Caixa'
        DataType = ftInteger
      end
      item
        Name = 'Usuario'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Entrada'
        DataType = ftBoolean
      end
      item
        Name = 'Tipo'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end>
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'IDia'
        Fields = 'Dia'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'ICaixa'
        Fields = 'Caixa'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'IDia'
    SessionName = 'SesPad'
    TableName = 'LancExtra'
    Left = 248
    Top = 331
    object tbLancExtraNumero: TAutoIncField
      FieldName = 'Numero'
    end
    object tbLancExtraDia: TDateTimeField
      FieldName = 'Dia'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object tbLancExtraCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tbLancExtraUsuario: TStringField
      FieldName = 'Usuario'
      Size = 10
    end
    object tbLancExtraEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object tbLancExtraTipo: TStringField
      FieldName = 'Tipo'
      Size = 30
    end
    object tbLancExtraDescricao: TStringField
      FieldName = 'Descricao'
      Size = 40
    end
    object tbLancExtraValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tbLancExtraObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tbLancExtraValorFator: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorFator'
      Calculated = True
    end
  end
  object dsCaixa: TDataSource
    DataSet = tbCaixa
    Left = 208
    Top = 56
  end
  object tbHoraCor: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'TipoAcesso'
        DataType = ftWord
      end
      item
        Name = 'Dia'
        DataType = ftWord
      end
      item
        Name = 'Hora'
        DataType = ftWord
      end
      item
        Name = 'Cor'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'IPrim'
        Fields = 'TipoAcesso;Dia;Inicio'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'IPrim'
    SessionName = 'SesPad'
    TableName = 'HoraCor'
    Timeout = 10000
    Left = 31
    Top = 163
    object tbHoraCorTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object tbHoraCorDia: TWordField
      FieldName = 'Dia'
    end
    object tbHoraCorHora: TWordField
      FieldName = 'Hora'
    end
    object tbHoraCorCor: TIntegerField
      FieldName = 'Cor'
    end
  end
  object tbTipoAcesso: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftWord
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'ICodigo'
        Fields = 'TipoAcesso'
        Options = [ixUnique, ixCaseInsensitive]
      end
      item
        Name = 'INome'
        Fields = 'Dia'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'ICodigo'
    SessionName = 'SesPad'
    TableName = 'TipoAcesso'
    Timeout = 10000
    Left = 111
    Top = 163
    object tbTipoAcessoCodigo: TWordField
      FieldName = 'Codigo'
    end
    object tbTipoAcessoNome: TStringField
      FieldName = 'Nome'
      Size = 30
    end
  end
  object tbSinal: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Numero'
        DataType = ftAutoInc
      end
      item
        Name = 'Caixa'
        DataType = ftInteger
      end
      item
        Name = 'Aberto'
        DataType = ftBoolean
      end
      item
        Name = 'TipoAcesso'
        DataType = ftWord
      end
      item
        Name = 'Inicio'
        DataType = ftDateTime
      end
      item
        Name = 'Fim'
        DataType = ftDateTime
      end
      item
        Name = 'DataPagto'
        DataType = ftDateTime
      end
      item
        Name = 'Contato'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Maquina'
        DataType = ftWord
      end
      item
        Name = 'Tipo'
        DataType = ftWord
      end
      item
        Name = 'FuncI'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'FuncF'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Tempo'
        DataType = ftDateTime
      end
      item
        Name = 'TempoCobrado'
        DataType = ftDateTime
      end
      item
        Name = 'CredUsado'
        DataType = ftInteger
      end
      item
        Name = 'CredAnterior'
        DataType = ftInteger
      end
      item
        Name = 'Desconto'
        DataType = ftCurrency
      end
      item
        Name = 'Produtos'
        DataType = ftCurrency
      end
      item
        Name = 'MotivoDesc'
        DataType = ftWord
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Isento'
        DataType = ftBoolean
      end
      item
        Name = 'FormaPagto'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NaoUsarPacote'
        DataType = ftBoolean
      end
      item
        Name = 'CodPacote'
        DataType = ftWord
      end
      item
        Name = 'Sinal'
        DataType = ftCurrency
      end
      item
        Name = 'AcessoPago'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'IAberto'
        Fields = 'Aberto;Maquina'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IContato'
        Fields = 'Contato;Inicio'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IData'
        Fields = 'Inicio'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IUsuario'
        Fields = 'FuncI;Inicio'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'INumero'
        Fields = 'Numero'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IPagto'
        Fields = 'Aberto;DataPagto;Fim'
        Options = [ixDescending, ixCaseInsensitive]
      end
      item
        Name = 'IFim'
        Fields = 'Fim'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'ICaixa'
        Fields = 'Caixa;Inicio'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'ICodPac'
        Fields = 'CodPacote'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'ICaixaFim'
        Fields = 'Caixa;Fim'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IAcessoPago'
        Fields = 'AcessoPago'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'IAcessoPago'
    SessionName = 'SesPad'
    TableName = 'Acesso'
    Timeout = 10000
    Left = 39
    Top = 315
  end
  object Q: TffQuery
    DatabaseName = 'DB'
    SessionName = 'SesPad'
    SQL.Strings = (
      
        'select Sum(ValorFinalAcesso) as Acessos, Sum(Produtos) as Vendas' +
        ' from Acesso'
      'where (DataPagto is Null) and (Aberto=False)')
    Left = 320
    Top = 344
  end
  object tbCor: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'TipoAcesso'
        DataType = ftWord
      end
      item
        Name = 'Cor'
        DataType = ftInteger
      end
      item
        Name = 'CorFonte'
        DataType = ftInteger
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Reinicia'
        DataType = ftBoolean
      end>
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'IPrim'
        Fields = 'TipoAcesso;Cor'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'IPrim'
    SessionName = 'SesPad'
    TableName = 'Cor'
    Timeout = 10000
    Left = 159
    Top = 315
    object tbCorTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object tbCorCor: TIntegerField
      FieldName = 'Cor'
    end
    object tbCorCorFonte: TIntegerField
      FieldName = 'CorFonte'
    end
    object tbCorDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object tbCorReinicia: TBooleanField
      FieldName = 'Reinicia'
    end
  end
  object tbCorPrecos: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'TipoAcesso'
        DataType = ftWord
      end
      item
        Name = 'Cor'
        DataType = ftInteger
      end
      item
        Name = 'Pos'
        DataType = ftWord
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'Tempo'
        DataType = ftDateTime
      end
      item
        Name = 'ValorMin'
        DataType = ftCurrency
      end
      item
        Name = 'Tolerancia'
        DataType = ftDateTime
      end>
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'IPrim'
        Fields = 'TipoAcesso;Cor'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'IPrim'
    SessionName = 'SesPad'
    TableName = 'CorPrecos'
    Timeout = 10000
    Left = 159
    Top = 371
    object tbCorPrecosTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object tbCorPrecosCor: TIntegerField
      FieldName = 'Cor'
    end
    object tbCorPrecosPos: TWordField
      FieldName = 'Pos'
    end
    object tbCorPrecosTempo: TDateTimeField
      FieldName = 'Tempo'
    end
    object tbCorPrecosTolerancia: TDateTimeField
      FieldName = 'Tolerancia'
    end
    object tbCorPrecosValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tbCorPrecosValorMin: TCurrencyField
      FieldName = 'ValorMin'
    end
  end
  object dsTipoAcesso: TDataSource
    DataSet = tbTipoAcesso
    Left = 48
    Top = 392
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer2Timer
    Left = 368
    Top = 352
  end
end
