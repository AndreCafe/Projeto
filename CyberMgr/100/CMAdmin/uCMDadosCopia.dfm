object Dados: TDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 55
  Top = 116
  Height = 436
  Width = 704
  object ffClient: TffClient
    ClientName = 'ffClient'
    IsDefault = True
    OnConnectionLost = ffClientConnectionLost
    ServerEngine = RSE
    TimeOut = 30000
    Left = 112
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
    object tbMENomeEntregador: TStringField
      DisplayLabel = 'Entregador'
      FieldKind = fkLookup
      FieldName = 'NomeEntregador'
      LookupDataSet = tbEntre
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'Entregador'
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
  object tbEntre: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftAutoInc
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end>
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'iCod'
        Fields = 'Codigo'
        Options = [ixUnique, ixCaseInsensitive]
      end
      item
        Name = 'iNome'
        Fields = 'Nome'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'iCod'
    SessionName = 'SesPad'
    TableName = 'Entregador'
    Timeout = 10000
    Left = 16
    Top = 107
    object tbEntreCodigo: TAutoIncField
      FieldName = 'Codigo'
    end
    object tbEntreNome: TStringField
      FieldName = 'Nome'
      Required = True
      Size = 30
    end
    object tbEntreObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
  end
  object dsEntre: TDataSource
    DataSet = tbEntre
    Left = 16
    Top = 156
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
    Left = 112
    Top = 107
    object tbFPagDescricao: TStringField
      FieldName = 'Descricao'
    end
  end
  object dsFPag: TDataSource
    DataSet = tbFPag
    Left = 112
    Top = 156
  end
  object tbConfig: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'NumSeq'
        DataType = ftAutoInc
      end
      item
        Name = 'PrecoPor'
        DataType = ftInteger
      end
      item
        Name = 'Tolerancia'
        DataType = ftInteger
      end
      item
        Name = 'Preco'
        DataType = ftCurrency
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
      end>
    SessionName = 'SesPad'
    TableName = 'Config'
    Timeout = 10000
    Left = 157
    Top = 216
    object tbConfigPrecoPor: TWordField
      FieldName = 'PrecoPor'
    end
    object tbConfigPreco: TCurrencyField
      FieldName = 'Preco'
    end
    object tbConfigModulos: TMemoField
      FieldName = 'Modulos'
      BlobType = ftMemo
    end
    object tbConfigTolerancia: TIntegerField
      FieldName = 'Tolerancia'
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
    object tbConfigNumSeq: TAutoIncField
      FieldName = 'NumSeq'
    end
    object tbConfigLimiteTempoPadrao: TDateTimeField
      FieldName = 'LimiteTempoPadrao'
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
    Version = '3.05'
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
    Version = '3.05'
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
    FieldDefs = <>
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
    Version = '3.05'
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
      DisplayFormat = 'hh:mm'
      Calculated = True
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
    Top = 224
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
    Top = 280
  end
  object tbPacote: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Horas'
        DataType = ftSmallint
      end
      item
        Name = 'ValorTotal'
        DataType = ftCurrency
      end>
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'IHora'
        Fields = 'Horas'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'IHora'
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
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1500
    OnTimer = Timer1Timer
    Left = 376
    Top = 288
  end
end
