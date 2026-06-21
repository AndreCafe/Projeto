object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 250
  Width = 283
  object nxSession: TnxSession
    ServerEngine = nxRSE
    Left = 88
    Top = 72
  end
  object nxDB: TnxDatabase
    Session = nxSession
    AliasName = 'Registro'
    Left = 24
    Top = 8
  end
  object nxRSE: TnxRemoteServerEngine
    Transport = nxTCP
    Left = 152
    Top = 8
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 16300
    Left = 88
    Top = 8
  end
  object qCli: TnxQuery
    Database = nxDB
    OnCalcFields = qCliCalcFields
    SQL.Strings = (
      'select * from cliente')
    Left = 24
    Top = 72
    object qCliCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object qCliTipo: TWordField
      FieldName = 'Tipo'
    end
    object qCliSenha: TStringField
      FieldName = 'Senha'
      Size = 30
    end
    object qCliCadastroEm: TDateTimeField
      FieldName = 'CadastroEm'
    end
    object qCliCadastroPor: TStringField
      FieldName = 'CadastroPor'
      Size = 30
    end
    object qCliAtualizadoEm: TDateTimeField
      FieldName = 'AtualizadoEm'
    end
    object qCliAtualizadoPor: TStringField
      FieldName = 'AtualizadoPor'
      Size = 30
    end
    object qCliLoja: TStringField
      FieldName = 'Loja'
      Size = 50
    end
    object qCliRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 50
    end
    object qCliPais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
    object qCliCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object qCliUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object qCliEndereco: TMemoField
      FieldName = 'Endereco'
      BlobType = ftMemo
    end
    object qCliCEP: TStringField
      FieldName = 'CEP'
      Size = 50
    end
    object qCliBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object qCliSerieHD: TStringField
      FieldName = 'SerieHD'
      Size = 60
    end
    object qCliNumMaq: TWordField
      FieldName = 'NumMaq'
    end
    object qCliCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 19
    end
    object qCliIE: TStringField
      FieldName = 'IE'
      Size = 15
    end
    object qCliObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object qCliTelefones: TMemoField
      FieldName = 'Telefones'
      BlobType = ftMemo
    end
    object qCliEmailReg: TMemoField
      FieldName = 'EmailReg'
      BlobType = ftMemo
    end
    object qCliFormaPagto: TMemoField
      FieldName = 'FormaPagto'
      BlobType = ftMemo
    end
    object qCliLicMaq: TWordField
      FieldName = 'LicMaq'
    end
    object qCliLicTipo: TWordField
      Alignment = taLeftJustify
      FieldName = 'LicTipo'
    end
    object qCliLicVenc: TDateField
      FieldName = 'LicVenc'
    end
    object qCliManInicio: TDateField
      FieldName = 'ManInicio'
    end
    object qCliManVenc: TDateField
      FieldName = 'ManVenc'
    end
    object qCliProprietarios: TMemoField
      FieldName = 'Proprietarios'
      BlobType = ftMemo
    end
    object qCliGerente: TStringField
      FieldName = 'Gerente'
      Size = 50
    end
    object qCliTipoLoja: TWordField
      FieldName = 'TipoLoja'
    end
    object qCliEmailTec: TMemoField
      FieldName = 'EmailTec'
      BlobType = ftMemo
    end
    object qCliValor: TCurrencyField
      FieldName = 'Valor'
    end
    object qCliValorRec: TCurrencyField
      FieldName = 'ValorRec'
    end
    object qCliEmitirNF: TBooleanField
      FieldName = 'EmitirNF'
    end
    object qCliMessenger: TMemoField
      FieldName = 'Messenger'
      BlobType = ftMemo
    end
    object qCliICQ: TMemoField
      FieldName = 'ICQ'
      BlobType = ftMemo
    end
    object qCliUObtemLic: TDateTimeField
      FieldName = 'UObtemLic'
    end
    object qCliUVersao: TStringField
      FieldName = 'UVersao'
      Size = 10
    end
    object qCliNegociacao: TWordField
      FieldName = 'Negociacao'
    end
    object qCliStatus: TIntegerField
      FieldName = 'Status'
    end
    object qCliContatarEm: TDateTimeField
      FieldName = 'ContatarEm'
    end
    object qCliDescrStatus: TStringField
      FieldKind = fkLookup
      FieldName = 'DescrStatus'
      LookupDataSet = tStatus
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Status'
      Size = 30
      Lookup = True
    end
    object qCliFonteStatus: TIntegerField
      FieldKind = fkLookup
      FieldName = 'FonteStatus'
      LookupDataSet = tStatus
      LookupKeyFields = 'Codigo'
      LookupResultField = 'CorFonte'
      KeyFields = 'Status'
      Lookup = True
    end
    object qCliFundoStatus: TIntegerField
      FieldKind = fkLookup
      FieldName = 'FundoStatus'
      LookupDataSet = tStatus
      LookupKeyFields = 'Codigo'
      LookupResultField = 'CorFundo'
      KeyFields = 'Status'
      Lookup = True
    end
    object qCliCodEquip: TStringField
      FieldName = 'CodEquip'
      Size = 60
    end
    object qCliPrograma: TWordField
      Alignment = taLeftJustify
      FieldName = 'Programa'
    end
    object qCliCodLoja: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CodLoja'
      Calculated = True
    end
    object qCliBloqueado: TBooleanField
      FieldName = 'Bloqueado'
    end
    object qCliCliente: TBooleanField
      FieldName = 'Cliente'
    end
    object qCliCodigoComp: TStringField
      FieldKind = fkCalculated
      FieldName = 'CodigoComp'
      Size = 10
      Calculated = True
    end
    object qCliTipoAut: TWordField
      Alignment = taLeftJustify
      FieldKind = fkCalculated
      FieldName = 'TipoAut'
      Calculated = True
    end
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'cliente'
    IndexName = 'ICodigo'
    Left = 152
    Top = 144
    object tCliCodigo: TAutoIncField
      FieldName = 'Codigo'
    end
    object tCliTipo: TWordField
      Alignment = taLeftJustify
      FieldName = 'Tipo'
    end
    object tCliSenha: TStringField
      FieldName = 'Senha'
      Size = 30
    end
    object tCliCadastroEm: TDateTimeField
      FieldName = 'CadastroEm'
    end
    object tCliCadastroPor: TStringField
      FieldName = 'CadastroPor'
      Size = 30
    end
    object tCliAtualizadoEm: TDateTimeField
      FieldName = 'AtualizadoEm'
    end
    object tCliAtualizadoPor: TStringField
      FieldName = 'AtualizadoPor'
      Size = 30
    end
    object tCliLoja: TStringField
      FieldName = 'Loja'
      Size = 50
    end
    object tCliRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 50
    end
    object tCliPais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
    object tCliCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object tCliUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tCliEndereco: TMemoField
      FieldName = 'Endereco'
      BlobType = ftMemo
    end
    object tCliCEP: TStringField
      FieldName = 'CEP'
      Size = 50
    end
    object tCliBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object tCliSerieHD: TStringField
      FieldName = 'SerieHD'
      Size = 60
    end
    object tCliNumMaq: TWordField
      FieldName = 'NumMaq'
    end
    object tCliCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 19
    end
    object tCliIE: TStringField
      FieldName = 'IE'
      Size = 15
    end
    object tCliObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tCliTelefones: TMemoField
      FieldName = 'Telefones'
      BlobType = ftMemo
    end
    object tCliEmailReg: TMemoField
      FieldName = 'EmailReg'
      BlobType = ftMemo
    end
    object tCliFormaPagto: TMemoField
      FieldName = 'FormaPagto'
      BlobType = ftMemo
    end
    object tCliLicMaq: TWordField
      FieldName = 'LicMaq'
    end
    object tCliLicTipo: TWordField
      FieldName = 'LicTipo'
    end
    object tCliLicVenc: TDateField
      FieldName = 'LicVenc'
    end
    object tCliManInicio: TDateField
      FieldName = 'ManInicio'
    end
    object tCliManVenc: TDateField
      FieldName = 'ManVenc'
    end
    object tCliProprietarios: TMemoField
      FieldName = 'Proprietarios'
      BlobType = ftMemo
    end
    object tCliGerente: TStringField
      FieldName = 'Gerente'
      Size = 50
    end
    object tCliTipoLoja: TWordField
      FieldName = 'TipoLoja'
    end
    object tCliEmailTec: TMemoField
      FieldName = 'EmailTec'
      BlobType = ftMemo
    end
    object tCliValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tCliValorRec: TCurrencyField
      FieldName = 'ValorRec'
    end
    object tCliEmitirNF: TBooleanField
      FieldName = 'EmitirNF'
    end
    object tCliMessenger: TMemoField
      FieldName = 'Messenger'
      BlobType = ftMemo
    end
    object tCliICQ: TMemoField
      FieldName = 'ICQ'
      BlobType = ftMemo
    end
    object tCliUObtemLic: TDateTimeField
      FieldName = 'UObtemLic'
    end
    object tCliUVersao: TStringField
      FieldName = 'UVersao'
      Size = 10
    end
    object tCliNegociacao: TWordField
      FieldName = 'Negociacao'
    end
    object tCliStatus: TIntegerField
      FieldName = 'Status'
    end
    object tCliContatarEm: TDateTimeField
      FieldName = 'ContatarEm'
    end
    object tCliPrograma: TWordField
      FieldName = 'Programa'
    end
    object tCliCodEquip: TStringField
      FieldName = 'CodEquip'
      Size = 60
    end
    object tCliBloqueado: TBooleanField
      FieldName = 'Bloqueado'
    end
    object tCliCliente: TBooleanField
      FieldName = 'Cliente'
    end
  end
  object tUsuario: TnxTable
    Database = nxDB
    TableName = 'Usuario'
    IndexName = 'IUsername'
    Left = 152
    Top = 72
    object tUsuarioUsername: TStringField
      FieldName = 'Username'
    end
    object tUsuarioSenha: TStringField
      FieldName = 'Senha'
    end
    object tUsuarioNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tUsuarioAdmin: TBooleanField
      FieldName = 'Admin'
    end
    object tUsuarioDireitos: TMemoField
      FieldName = 'Direitos'
      BlobType = ftMemo
    end
    object tUsuarioNomeCHAT: TStringField
      FieldName = 'NomeCHAT'
      Size = 50
    end
    object tUsuarioStatusCHAT: TStringField
      FieldName = 'StatusCHAT'
      Size = 30
    end
    object tUsuarioCHAT: TBooleanField
      FieldName = 'CHAT'
    end
  end
  object dsCli: TDataSource
    DataSet = qCli
    Left = 24
    Top = 144
  end
  object tStatus: TnxTable
    Database = nxDB
    TableName = 'Status'
    IndexName = 'ICodigo'
    Left = 88
    Top = 144
    object tStatusCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tStatusDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object tStatusCorFonte: TIntegerField
      FieldName = 'CorFonte'
    end
    object tStatusCorFundo: TIntegerField
      FieldName = 'CorFundo'
    end
  end
  object tAut: TnxTable
    Database = nxDB
    TableName = 'Autorizacao'
    IndexName = 'ILoja'
    Left = 216
    Top = 144
    object tAutID: TAutoIncField
      FieldName = 'ID'
    end
    object tAutPrograma: TWordField
      FieldName = 'Programa'
    end
    object tAutLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tAutAutorizacao: TStringField
      FieldName = 'Autorizacao'
      Size = 30
    end
    object tAutVencimento: TDateField
      FieldName = 'Vencimento'
    end
    object tAutCodigoEquip: TStringField
      FieldName = 'CodigoEquip'
      Size = 30
    end
    object tAutMaquinas: TWordField
      FieldName = 'Maquinas'
    end
    object tAutTipo: TWordField
      FieldName = 'Tipo'
    end
    object tAutCriadaEm: TDateTimeField
      FieldName = 'CriadaEm'
    end
    object tAutCriadaPor: TStringField
      FieldName = 'CriadaPor'
      Size = 30
    end
    object tAutInativadaEm: TDateTimeField
      FieldName = 'InativadaEm'
    end
    object tAutInativadaPor: TStringField
      FieldName = 'InativadaPor'
      Size = 30
    end
    object tAutAtiva: TBooleanField
      FieldName = 'Ativa'
    end
    object tAutObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tAutGerar: TBooleanField
      FieldName = 'Gerar'
    end
    object tAutEnviouCli: TBooleanField
      FieldName = 'EnviouCli'
    end
  end
end
