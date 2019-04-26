object dmRecalcPass: TdmRecalcPass
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 118
  Width = 372
  object tCli: TnxTable
    Database = nxDB
    TableName = 'Cliente'
    IndexName = 'IID'
    Left = 176
    Top = 16
    object tCliID: TAutoIncField
      FieldName = 'ID'
    end
    object tCliNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tCliEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object tCliBairro: TStringField
      FieldName = 'Bairro'
    end
    object tCliCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object tCliUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tCliCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object tCliNasc: TDateTimeField
      FieldName = 'Nasc'
    end
    object tCliSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object tCliObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tCliCpf: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object tCliRg: TStringField
      FieldName = 'Rg'
      Size = 14
    end
    object tCliTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object tCliEmail: TMemoField
      FieldName = 'Email'
      BlobType = ftMemo
    end
    object tCliMinutos: TFloatField
      FieldName = 'Minutos'
    end
    object tCliMinutosUsados: TFloatField
      FieldName = 'MinutosUsados'
    end
    object tCliMinutosIniciais: TFloatField
      FieldName = 'MinutosIniciais'
    end
    object tCliIsento: TBooleanField
      FieldName = 'Isento'
    end
    object tCliUsername: TStringField
      FieldName = 'Username'
      Size = 40
    end
    object tCliPai: TStringField
      FieldName = 'Pai'
      Size = 40
    end
    object tCliMae: TStringField
      FieldName = 'Mae'
      Size = 40
    end
    object tCliSenha: TStringField
      FieldName = 'Senha'
    end
    object tCliUltVisita: TDateTimeField
      FieldName = 'UltVisita'
    end
    object tCliDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object tCliEscola: TStringField
      FieldName = 'Escola'
      Size = 40
    end
    object tCliEscolaHI: TDateTimeField
      FieldName = 'EscolaHI'
    end
    object tCliEscolaHF: TDateTimeField
      FieldName = 'EscolaHF'
    end
    object tCliNickName: TStringField
      FieldName = 'NickName'
      Size = 30
    end
    object tCliDataNasc: TDateTimeField
      FieldName = 'DataNasc'
    end
    object tCliCelular: TStringField
      FieldName = 'Celular'
      Size = 15
    end
    object tCliTemDebito: TBooleanField
      FieldName = 'TemDebito'
    end
    object tCliLimiteDebito: TCurrencyField
      FieldName = 'LimiteDebito'
    end
    object tCliFoto: TGraphicField
      FieldName = 'Foto'
      BlobType = ftGraphic
    end
    object tCliIncluidoEm: TDateTimeField
      FieldName = 'IncluidoEm'
    end
    object tCliAlteradoEm: TDateTimeField
      FieldName = 'AlteradoEm'
    end
    object tCliIncluidoPor: TStringField
      FieldName = 'IncluidoPor'
      Size = 10
    end
    object tCliAlteradoPor: TStringField
      FieldName = 'AlteradoPor'
      Size = 10
    end
    object tCliInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object tCliTipoAcessoPref: TIntegerField
      FieldName = 'TipoAcessoPref'
    end
    object tCliValorCred: TCurrencyField
      FieldName = 'ValorCred'
    end
    object tCliHP1: TIntegerField
      FieldName = 'HP1'
    end
    object tCliHP2: TIntegerField
      FieldName = 'HP2'
    end
    object tCliHP3: TIntegerField
      FieldName = 'HP3'
    end
    object tCliHP4: TIntegerField
      FieldName = 'HP4'
    end
    object tCliHP5: TIntegerField
      FieldName = 'HP5'
    end
    object tCliHP6: TIntegerField
      FieldName = 'HP6'
    end
    object tCliHP7: TIntegerField
      FieldName = 'HP7'
    end
    object tCliNaoGuardarCredito: TBooleanField
      FieldName = 'NaoGuardarCredito'
    end
    object tCliPermiteLoginSemCred: TBooleanField
      FieldName = 'PermiteLoginSemCred'
    end
    object tCliPassaportes: TFloatField
      FieldName = 'Passaportes'
    end
  end
  object tTipoPass: TnxTable
    Database = nxDB
    TableName = 'TipoPass'
    IndexName = 'IID'
    Left = 224
    Top = 16
    object tTipoPassID: TAutoIncField
      FieldName = 'ID'
    end
    object tTipoPassNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tTipoPassValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tTipoPassTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object tTipoPassTipoExp: TWordField
      FieldName = 'TipoExp'
    end
    object tTipoPassExpirarEm: TDateTimeField
      FieldName = 'ExpirarEm'
    end
    object tTipoPassMaxSegundos: TIntegerField
      FieldName = 'MaxSegundos'
    end
    object tTipoPassObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tTipoPassDia1: TIntegerField
      FieldName = 'Dia1'
    end
    object tTipoPassDia2: TIntegerField
      FieldName = 'Dia2'
    end
    object tTipoPassDia3: TIntegerField
      FieldName = 'Dia3'
    end
    object tTipoPassDia4: TIntegerField
      FieldName = 'Dia4'
    end
    object tTipoPassDia5: TIntegerField
      FieldName = 'Dia5'
    end
    object tTipoPassDia6: TIntegerField
      FieldName = 'Dia6'
    end
    object tTipoPassDia7: TIntegerField
      FieldName = 'Dia7'
    end
  end
  object tPassaporte: TnxTable
    Database = nxDB
    TableName = 'Passaporte'
    IndexName = 'IID'
    Left = 120
    Top = 16
    object tPassaporteID: TAutoIncField
      FieldName = 'ID'
    end
    object tPassaporteTipoPass: TIntegerField
      FieldName = 'TipoPass'
    end
    object tPassaporteCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tPassaporteExpirou: TBooleanField
      FieldName = 'Expirou'
    end
    object tPassaporteSenha: TStringField
      FieldName = 'Senha'
    end
    object tPassaportePrimeiroUso: TDateTimeField
      FieldName = 'PrimeiroUso'
    end
    object tPassaporteTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object tPassaporteTipoExp: TWordField
      FieldName = 'TipoExp'
    end
    object tPassaporteExpirarEm: TDateTimeField
      FieldName = 'ExpirarEm'
    end
    object tPassaporteMaxSegundos: TIntegerField
      FieldName = 'MaxSegundos'
    end
    object tPassaporteSegundos: TIntegerField
      FieldName = 'Segundos'
    end
    object tPassaporteAcessos: TIntegerField
      FieldName = 'Acessos'
    end
    object tPassaporteDia1: TIntegerField
      FieldName = 'Dia1'
    end
    object tPassaporteDia2: TIntegerField
      FieldName = 'Dia2'
    end
    object tPassaporteDia3: TIntegerField
      FieldName = 'Dia3'
    end
    object tPassaporteDia4: TIntegerField
      FieldName = 'Dia4'
    end
    object tPassaporteDia5: TIntegerField
      FieldName = 'Dia5'
    end
    object tPassaporteDia6: TIntegerField
      FieldName = 'Dia6'
    end
    object tPassaporteDia7: TIntegerField
      FieldName = 'Dia7'
    end
    object tPassaporteTran: TIntegerField
      FieldName = 'Tran'
    end
    object tPassaporteDataCompra: TDateTimeField
      FieldName = 'DataCompra'
    end
    object tPassaporteValido: TBooleanField
      FieldName = 'Valido'
    end
    object tPassaporteValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tPassaporteSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tPassaporteNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
  end
  object nxDB: TnxDatabase
    AliasPath = 'c:\meus programas\nexcafe\dados'
    Left = 72
    Top = 16
  end
  object tSessaoCli: TnxTable
    Database = nxDB
    TableName = 'Sessao'
    IndexName = 'IEncerrouCli'
    Left = 288
    Top = 16
    object tSessaoCliID: TAutoIncField
      FieldName = 'ID'
    end
    object tSessaoCliInicio: TDateTimeField
      FieldName = 'Inicio'
    end
    object tSessaoCliTermino: TDateTimeField
      FieldName = 'Termino'
    end
    object tSessaoCliMinutosR: TFloatField
      FieldName = 'MinutosR'
    end
    object tSessaoCliMinutosC: TFloatField
      FieldName = 'MinutosC'
    end
    object tSessaoCliMaq: TWordField
      FieldName = 'Maq'
    end
    object tSessaoCliMaqI: TWordField
      FieldName = 'MaqI'
    end
    object tSessaoCliEncerrou: TBooleanField
      FieldName = 'Encerrou'
    end
    object tSessaoCliCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tSessaoCliTransfMaq: TBooleanField
      FieldName = 'TransfMaq'
    end
    object tSessaoCliTipoCli: TWordField
      FieldName = 'TipoCli'
    end
    object tSessaoCliCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tSessaoCliTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tSessaoCliDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tSessaoCliPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object tSessaoCliDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object tSessaoCliPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tSessaoCliNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 50
    end
    object tSessaoCliFuncI: TStringField
      FieldName = 'FuncI'
      Size = 30
    end
    object tSessaoCliFuncF: TStringField
      FieldName = 'FuncF'
      Size = 30
    end
    object tSessaoCliObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tSessaoCliTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object tSessaoCliCaixaI: TIntegerField
      FieldName = 'CaixaI'
    end
    object tSessaoCliCaixaF: TIntegerField
      FieldName = 'CaixaF'
    end
    object tSessaoCliTicksI: TIntegerField
      FieldName = 'TicksI'
    end
    object tSessaoCliPausado: TBooleanField
      FieldName = 'Pausado'
    end
    object tSessaoCliInicioPausa: TIntegerField
      FieldName = 'InicioPausa'
    end
    object tSessaoCliMinTicksUsados: TIntegerField
      FieldName = 'MinTicksUsados'
    end
    object tSessaoCliMinTicksTotal: TIntegerField
      FieldName = 'MinTicksTotal'
    end
    object tSessaoCliFimTicksUsados: TIntegerField
      FieldName = 'FimTicksUsados'
    end
    object tSessaoCliFimTicksTotal: TIntegerField
      FieldName = 'FimTicksTotal'
    end
    object tSessaoCliStrPausas: TMemoField
      FieldName = 'StrPausas'
      BlobType = ftMemo
    end
    object tSessaoCliStrTransfMaq: TMemoField
      FieldName = 'StrTransfMaq'
      BlobType = ftMemo
    end
    object tSessaoCliStrFechamentoCaixa: TMemoField
      FieldName = 'StrFechamentoCaixa'
      BlobType = ftMemo
    end
    object tSessaoCliMinutosCli: TFloatField
      FieldName = 'MinutosCli'
    end
    object tSessaoCliMinutosPrev: TFloatField
      FieldName = 'MinutosPrev'
    end
    object tSessaoCliMinutosMax: TFloatField
      FieldName = 'MinutosMax'
    end
    object tSessaoCliMinutosCliU: TFloatField
      FieldName = 'MinutosCliU'
    end
    object tSessaoCliValorCli: TCurrencyField
      FieldName = 'ValorCli'
    end
    object tSessaoCliValorCliU: TFloatField
      FieldName = 'ValorCliU'
    end
    object tSessaoCliTranI: TIntegerField
      FieldName = 'TranI'
    end
    object tSessaoCliTranF: TIntegerField
      FieldName = 'TranF'
    end
    object tSessaoCliPermitirDownload: TBooleanField
      FieldName = 'PermitirDownload'
    end
    object tSessaoCliVersaoRegistro: TIntegerField
      FieldName = 'VersaoRegistro'
    end
    object tSessaoCliCartaoTempo: TBooleanField
      FieldName = 'CartaoTempo'
    end
    object tSessaoCliHP1: TIntegerField
      FieldName = 'HP1'
    end
    object tSessaoCliHP2: TIntegerField
      FieldName = 'HP2'
    end
    object tSessaoCliHP3: TIntegerField
      FieldName = 'HP3'
    end
    object tSessaoCliHP4: TIntegerField
      FieldName = 'HP4'
    end
    object tSessaoCliHP5: TIntegerField
      FieldName = 'HP5'
    end
    object tSessaoCliHP6: TIntegerField
      FieldName = 'HP6'
    end
    object tSessaoCliHP7: TIntegerField
      FieldName = 'HP7'
    end
  end
end
