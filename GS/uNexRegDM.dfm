object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 250
  Width = 283
  object nxSession: TnxSession
    ActiveDesigntime = True
    ServerEngine = nxRSE
    Left = 88
    Top = 72
  end
  object nxDB: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession
    AliasName = 'Registro'
    Left = 24
    Top = 8
  end
  object nxRSE: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxTCP
    Left = 152
    Top = 8
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    Timeout = 30000
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 16300
    Left = 88
    Top = 8
  end
  object qCli: TnxQuery
    ActiveDesigntime = True
    Database = nxDB
    Timeout = 30000
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
      Size = 50
    end
    object qCliUF: TStringField
      FieldName = 'UF'
      Size = 2
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
    object qCliContatarEm: TDateTimeField
      FieldName = 'ContatarEm'
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
    object qCliAtivado: TBooleanField
      FieldName = 'Ativado'
    end
    object qCliCodAtivacao: TStringField
      FieldName = 'CodAtivacao'
      Size = 10
    end
    object qCliEmailConta: TStringField
      FieldName = 'EmailConta'
      Size = 200
    end
    object qCliAtivadoEm: TDateTimeField
      FieldName = 'AtivadoEm'
    end
    object qCliTipoConta: TWordField
      FieldName = 'TipoConta'
    end
    object qCliPremiumAte: TDateTimeField
      FieldName = 'PremiumAte'
    end
    object qCliCodDesc: TStringField
      FieldName = 'CodDesc'
      Size = 10
    end
    object qCliCadastroCompleto: TBooleanField
      FieldName = 'CadastroCompleto'
    end
    object qCliCadastroCompletoEm: TDateTimeField
      FieldName = 'CadastroCompletoEm'
    end
    object qCliRegistroEm: TDateTimeField
      FieldName = 'RegistroEm'
    end
    object qCliCidade_geoip: TStringField
      FieldName = 'Cidade_geoip'
      Size = 50
    end
    object qCliUF_geoip: TStringField
      FieldName = 'UF_geoip'
      Size = 2
    end
    object qCliTels: TnxMemoField
      FieldName = 'Tels'
      BlobType = ftMemo
    end
    object qCliProp: TnxMemoField
      FieldName = 'Prop'
      BlobType = ftMemo
    end
    object qCliProprietario: TStringField
      FieldName = 'Proprietario'
      Size = 70
    end
    object qCliContaTrocada: TBooleanField
      FieldName = 'ContaTrocada'
    end
    object qCliCAno: TWordField
      FieldName = 'CAno'
    end
    object qCliCMes: TWordField
      FieldName = 'CMes'
    end
    object qCliCDia: TWordField
      FieldName = 'CDia'
    end
    object qCliAAno: TWordField
      FieldName = 'AAno'
    end
    object qCliAMes: TWordField
      FieldName = 'AMes'
    end
    object qCliADia: TWordField
      FieldName = 'ADia'
    end
    object qCliUAno: TWordField
      FieldName = 'UAno'
    end
    object qCliUMes: TWordField
      FieldName = 'UMes'
    end
    object qCliUDia: TWordField
      FieldName = 'UDia'
    end
    object qCliUDias: TWordField
      FieldName = 'UDias'
    end
    object qCliMotivoDesist: TStringField
      FieldName = 'MotivoDesist'
      Size = 30
    end
    object qCliLastAdminPopup: TDateTimeField
      FieldName = 'LastAdminPopup'
    end
    object qCliCampanha: TStringField
      FieldName = 'Campanha'
      Size = 50
    end
    object qCliutmccn: TIntegerField
      FieldName = 'utmccn'
    end
    object qCliutmctr: TIntegerField
      FieldName = 'utmctr'
    end
    object qCliutmcct: TIntegerField
      FieldName = 'utmcct'
    end
    object qCliutmcsr: TIntegerField
      FieldName = 'utmcsr'
    end
    object qCliutmcmd: TIntegerField
      FieldName = 'utmcmd'
    end
    object qCliOrigem: TStringField
      FieldName = 'Origem'
      Size = 50
    end
    object qCliRedirT: TIntegerField
      FieldName = 'RedirT'
    end
    object qCliRedirI: TDateTimeField
      FieldName = 'RedirI'
    end
    object qCliTel1: TStringField
      FieldName = 'Tel1'
    end
    object qCliTel2: TStringField
      FieldName = 'Tel2'
    end
    object qCliTel3: TStringField
      FieldName = 'Tel3'
    end
    object qCliTel4: TStringField
      FieldName = 'Tel4'
    end
    object qCliTipoTel1: TWordField
      FieldName = 'TipoTel1'
    end
    object qCliTipoTel2: TWordField
      FieldName = 'TipoTel2'
    end
    object qCliTipoTel3: TWordField
      FieldName = 'TipoTel3'
    end
    object qCliTipoTel4: TWordField
      FieldName = 'TipoTel4'
    end
    object qCliUpdateCad: TIntegerField
      FieldName = 'UpdateCad'
    end
    object qCliUpdateMkt: TIntegerField
      FieldName = 'UpdateMkt'
    end
    object qCliUpdateContato: TIntegerField
      FieldName = 'UpdateContato'
    end
    object qCliDBounce: TDateTimeField
      FieldName = 'DBounce'
    end
    object qCliDInativo: TDateTimeField
      FieldName = 'DInativo'
    end
    object qCliInstalouEm: TDateTimeField
      FieldName = 'InstalouEm'
    end
    object qCliBounce: TBooleanField
      FieldName = 'Bounce'
    end
    object qCliInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object qCliConfirmouLocal: TBooleanField
      FieldName = 'ConfirmouLocal'
    end
    object qCliPreRegistro: TBooleanField
      FieldName = 'PreRegistro'
    end
    object qCliPreRegistroIP: TStringField
      FieldName = 'PreRegistroIP'
      Size = 15
    end
    object qCliPreRegistroEm: TDateTimeField
      FieldName = 'PreRegistroEm'
    end
    object qCliContatoCC: TBooleanField
      FieldName = 'ContatoCC'
    end
    object qCliStatusDesde: TDateTimeField
      FieldName = 'StatusDesde'
    end
    object qCliRecente: TBooleanField
      FieldName = 'Recente'
    end
    object qCliParouRedir: TBooleanField
      FieldName = 'ParouRedir'
    end
    object qCliPremium: TBooleanField
      FieldName = 'Premium'
    end
    object qCliFezRedir: TBooleanField
      FieldName = 'FezRedir'
    end
    object qCliRedirU: TDateTimeField
      FieldName = 'RedirU'
    end
    object qCliRedirD: TWordField
      FieldName = 'RedirD'
    end
    object qCliUsou: TBooleanField
      FieldName = 'Usou'
    end
    object qCliSaiu: TBooleanField
      FieldName = 'Saiu'
    end
    object qCliVaiVoltar: TBooleanField
      FieldName = 'VaiVoltar'
    end
    object qCliVaiVoltarAte: TDateTimeField
      FieldName = 'VaiVoltarAte'
    end
    object qCliCCContatoOk: TBooleanField
      FieldName = 'CCContatoOk'
    end
    object qCliCCContatoFail: TBooleanField
      FieldName = 'CCContatoFail'
    end
    object qCliCCPContatoOk: TDateTimeField
      FieldName = 'CCPContatoOk'
    end
    object qCliCCPContatoFail: TDateTimeField
      FieldName = 'CCPContatoFail'
    end
    object qCliCCUContatoOk: TDateTimeField
      FieldName = 'CCUContatoOk'
    end
    object qCliCCUContatoFail: TDateTimeField
      FieldName = 'CCUContatoFail'
    end
    object qCliCCQContatoOK: TIntegerField
      FieldName = 'CCQContatoOK'
    end
    object qCliCCQContatoFail: TIntegerField
      FieldName = 'CCQContatoFail'
    end
    object qCliCCAgente: TIntegerField
      FieldName = 'CCAgente'
    end
    object qCliEndereco: TStringField
      FieldName = 'Endereco'
      Size = 70
    end
    object qCliStatus: TWordField
      FieldName = 'Status'
    end
  end
  object tCli: TnxTable
    Database = nxDB
    FilterTimeout = 2000
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
      Size = 50
    end
    object tCliUF: TStringField
      FieldName = 'UF'
      Size = 2
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
    object tCliAtivado: TBooleanField
      FieldName = 'Ativado'
    end
    object tCliCodAtivacao: TStringField
      FieldName = 'CodAtivacao'
      Size = 10
    end
    object tCliEmailConta: TStringField
      FieldName = 'EmailConta'
      Size = 200
    end
    object tCliAtivadoEm: TDateTimeField
      FieldName = 'AtivadoEm'
    end
    object tCliTipoConta: TWordField
      FieldName = 'TipoConta'
    end
    object tCliPremiumAte: TDateTimeField
      FieldName = 'PremiumAte'
    end
    object tCliCodDesc: TStringField
      FieldName = 'CodDesc'
      Size = 10
    end
    object tCliCadastroCompleto: TBooleanField
      FieldName = 'CadastroCompleto'
    end
    object tCliCadastroCompletoEm: TDateTimeField
      FieldName = 'CadastroCompletoEm'
    end
    object tCliRegistroEm: TDateTimeField
      FieldName = 'RegistroEm'
    end
    object tCliCidade_geoip: TStringField
      FieldName = 'Cidade_geoip'
      Size = 50
    end
    object tCliUF_geoip: TStringField
      FieldName = 'UF_geoip'
      Size = 2
    end
    object tCliEndereco: TStringField
      FieldName = 'Endereco'
      Size = 70
    end
    object tCliTels: TnxMemoField
      FieldName = 'Tels'
      BlobType = ftMemo
    end
    object tCliProp: TnxMemoField
      FieldName = 'Prop'
      BlobType = ftMemo
    end
    object tCliProprietario: TStringField
      FieldName = 'Proprietario'
      Size = 70
    end
    object tCliContaTrocada: TBooleanField
      FieldName = 'ContaTrocada'
    end
    object tCliCAno: TWordField
      FieldName = 'CAno'
    end
    object tCliCMes: TWordField
      FieldName = 'CMes'
    end
    object tCliCDia: TWordField
      FieldName = 'CDia'
    end
    object tCliAAno: TWordField
      FieldName = 'AAno'
    end
    object tCliAMes: TWordField
      FieldName = 'AMes'
    end
    object tCliADia: TWordField
      FieldName = 'ADia'
    end
    object tCliUAno: TWordField
      FieldName = 'UAno'
    end
    object tCliUMes: TWordField
      FieldName = 'UMes'
    end
    object tCliUDia: TWordField
      FieldName = 'UDia'
    end
    object tCliUDias: TWordField
      FieldName = 'UDias'
    end
    object tCliMotivoDesist: TStringField
      FieldName = 'MotivoDesist'
      Size = 30
    end
    object tCliLastAdminPopup: TDateTimeField
      FieldName = 'LastAdminPopup'
    end
    object tCliCampanha: TStringField
      FieldName = 'Campanha'
      Size = 50
    end
    object tCliutmccn: TIntegerField
      FieldName = 'utmccn'
    end
    object tCliutmctr: TIntegerField
      FieldName = 'utmctr'
    end
    object tCliutmcct: TIntegerField
      FieldName = 'utmcct'
    end
    object tCliutmcsr: TIntegerField
      FieldName = 'utmcsr'
    end
    object tCliutmcmd: TIntegerField
      FieldName = 'utmcmd'
    end
    object tCliOrigem: TStringField
      FieldName = 'Origem'
      Size = 50
    end
    object tCliRedirT: TIntegerField
      FieldName = 'RedirT'
    end
    object tCliRedirI: TDateTimeField
      FieldName = 'RedirI'
    end
    object tCliTel1: TStringField
      FieldName = 'Tel1'
    end
    object tCliTel2: TStringField
      FieldName = 'Tel2'
    end
    object tCliTel3: TStringField
      FieldName = 'Tel3'
    end
    object tCliTel4: TStringField
      FieldName = 'Tel4'
    end
    object tCliTipoTel1: TWordField
      FieldName = 'TipoTel1'
    end
    object tCliTipoTel2: TWordField
      FieldName = 'TipoTel2'
    end
    object tCliTipoTel3: TWordField
      FieldName = 'TipoTel3'
    end
    object tCliTipoTel4: TWordField
      FieldName = 'TipoTel4'
    end
    object tCliUpdateCad: TIntegerField
      FieldName = 'UpdateCad'
    end
    object tCliUpdateMkt: TIntegerField
      FieldName = 'UpdateMkt'
    end
    object tCliUpdateContato: TIntegerField
      FieldName = 'UpdateContato'
    end
    object tCliDBounce: TDateTimeField
      FieldName = 'DBounce'
    end
    object tCliDInativo: TDateTimeField
      FieldName = 'DInativo'
    end
    object tCliInstalouEm: TDateTimeField
      FieldName = 'InstalouEm'
    end
    object tCliBounce: TBooleanField
      FieldName = 'Bounce'
    end
    object tCliInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object tCliConfirmouLocal: TBooleanField
      FieldName = 'ConfirmouLocal'
    end
    object tCliPreRegistro: TBooleanField
      FieldName = 'PreRegistro'
    end
    object tCliPreRegistroIP: TStringField
      FieldName = 'PreRegistroIP'
      Size = 15
    end
    object tCliPreRegistroEm: TDateTimeField
      FieldName = 'PreRegistroEm'
    end
    object tCliContatoCC: TBooleanField
      FieldName = 'ContatoCC'
    end
    object tCliStatus: TWordField
      FieldName = 'Status'
    end
    object tCliStatusDesde: TDateTimeField
      FieldName = 'StatusDesde'
    end
    object tCliRecente: TBooleanField
      FieldName = 'Recente'
    end
    object tCliParouRedir: TBooleanField
      FieldName = 'ParouRedir'
    end
    object tCliPremium: TBooleanField
      FieldName = 'Premium'
    end
    object tCliFezRedir: TBooleanField
      FieldName = 'FezRedir'
    end
    object tCliRedirU: TDateTimeField
      FieldName = 'RedirU'
    end
    object tCliRedirD: TWordField
      FieldName = 'RedirD'
    end
    object tCliUsou: TBooleanField
      FieldName = 'Usou'
    end
    object tCliSaiu: TBooleanField
      FieldName = 'Saiu'
    end
    object tCliVaiVoltar: TBooleanField
      FieldName = 'VaiVoltar'
    end
    object tCliVaiVoltarAte: TDateTimeField
      FieldName = 'VaiVoltarAte'
    end
    object tCliCCContatoOk: TBooleanField
      FieldName = 'CCContatoOk'
    end
    object tCliCCContatoFail: TBooleanField
      FieldName = 'CCContatoFail'
    end
    object tCliCCPContatoOk: TDateTimeField
      FieldName = 'CCPContatoOk'
    end
    object tCliCCPContatoFail: TDateTimeField
      FieldName = 'CCPContatoFail'
    end
    object tCliCCUContatoOk: TDateTimeField
      FieldName = 'CCUContatoOk'
    end
    object tCliCCUContatoFail: TDateTimeField
      FieldName = 'CCUContatoFail'
    end
    object tCliCCQContatoOK: TIntegerField
      FieldName = 'CCQContatoOK'
    end
    object tCliCCQContatoFail: TIntegerField
      FieldName = 'CCQContatoFail'
    end
    object tCliCCAgente: TIntegerField
      FieldName = 'CCAgente'
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
