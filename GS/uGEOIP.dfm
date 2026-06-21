object Form11: TForm11
  Left = 0
  Top = 0
  Caption = 'GEO IP - Cadastros'
  ClientHeight = 327
  ClientWidth = 732
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbQtd: TLabel
    Left = 72
    Top = 239
    Width = 18
    Height = 23
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PB: TProgressBar
    Left = 0
    Top = 0
    Width = 732
    Height = 16
    Align = alTop
    TabOrder = 0
  end
  object btnGeoIP: TButton
    Left = 24
    Top = 39
    Width = 137
    Height = 25
    Caption = 'Geo IP'
    TabOrder = 1
    OnClick = btnGeoIPClick
  end
  object Memo1: TMemo
    Left = 312
    Top = 16
    Width = 420
    Height = 311
    Align = alRight
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Button1: TButton
    Left = 24
    Top = 72
    Width = 137
    Height = 25
    Caption = 'Conta Trocada'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 24
    Top = 103
    Width = 137
    Height = 25
    Caption = 'Contato CC'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 24
    Top = 136
    Width = 137
    Height = 25
    Caption = 'Soma Est.'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 24
    Top = 168
    Width = 137
    Height = 25
    Caption = 'Corrige RedirD/RedirU'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 24
    Top = 199
    Width = 137
    Height = 25
    Caption = 'Corrige UObtemLic'
    TabOrder = 7
    OnClick = Button5Click
  end
  object H: TIdHTTP
    MaxLineAction = maException
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 192
    Top = 104
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 16300
    Left = 128
    Top = 264
  end
  object nxRSE: TnxRemoteServerEngine
    Transport = nxTCP
    Left = 160
    Top = 264
  end
  object nxSE: TnxSession
    ServerEngine = nxRSE
    Left = 96
    Top = 264
  end
  object nxDB: TnxDatabase
    Session = nxSE
    AliasName = 'Registro'
    Left = 64
    Top = 264
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'cliente'
    IndexName = 'ICodigo'
    Left = 192
    Top = 264
    object tCliCodigo: TAutoIncField
      FieldName = 'Codigo'
    end
    object tCliTipo: TWordField
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
    object tCliCidade_geoip: TStringField
      FieldName = 'Cidade_geoip'
      Size = 50
    end
    object tCliUF_geoip: TStringField
      FieldName = 'UF_geoip'
      Size = 2
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
    object tCliCodEquip: TStringField
      FieldName = 'CodEquip'
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
    object tCliObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tCliEmailReg: TnxMemoField
      FieldName = 'EmailReg'
      BlobType = ftMemo
    end
    object tCliFormaPagto: TnxMemoField
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
    object tCliEmailTec: TnxMemoField
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
    object tCliMessenger: TnxMemoField
      FieldName = 'Messenger'
      BlobType = ftMemo
    end
    object tCliICQ: TnxMemoField
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
    object tCliNegociacao: TWordField
      FieldName = 'Negociacao'
    end
    object tCliContatarEm: TDateTimeField
      FieldName = 'ContatarEm'
    end
    object tCliPrograma: TWordField
      FieldName = 'Programa'
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
    object tCliRedirT: TIntegerField
      FieldName = 'RedirT'
    end
    object tCliRedirI: TDateTimeField
      FieldName = 'RedirI'
    end
    object tCliConfirmouLocal: TBooleanField
      FieldName = 'ConfirmouLocal'
    end
    object tCliContaTrocada: TBooleanField
      FieldName = 'ContaTrocada'
    end
    object tCliContatoCC: TBooleanField
      FieldName = 'ContatoCC'
    end
    object tCliOrigem: TStringField
      FieldName = 'Origem'
      Size = 50
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
    object tCliEndereco: TStringField
      FieldName = 'Endereco'
      Size = 70
    end
    object tCliStatus: TWordField
      FieldName = 'Status'
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 224
    Top = 64
  end
  object tIP: TnxTable
    Database = nxDB
    TableName = 'IPLoja'
    IndexName = 'ILoja'
    Left = 200
    Top = 152
    object tIPIP: TStringField
      FieldName = 'IP'
      Size = 15
    end
    object tIPLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tIPDH: TDateTimeField
      FieldName = 'DH'
    end
  end
  object tCli2: TnxTable
    Database = nxDB
    TableName = 'cliente'
    IndexName = 'ICodEquip'
    Left = 24
    Top = 248
    object tCli2Codigo: TAutoIncField
      FieldName = 'Codigo'
    end
    object tCli2UObtemLic: TDateTimeField
      FieldName = 'UObtemLic'
    end
    object tCli2CodEquip: TStringField
      FieldName = 'CodEquip'
      Size = 60
    end
    object tCli2EmailConta: TStringField
      FieldName = 'EmailConta'
      Size = 200
    end
    object tCli2ContatoCC: TBooleanField
      FieldName = 'ContatoCC'
    end
    object tCli2Origem: TStringField
      FieldName = 'Origem'
      Size = 50
    end
  end
  object tEstL: TnxTable
    Database = nxDB
    TableName = 'OpenStatL'
    IndexName = 'ILojaAnoMesDia'
    Left = 168
    Top = 192
    object tEstLLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tEstLAno: TWordField
      FieldName = 'Ano'
    end
    object tEstLMes: TWordField
      FieldName = 'Mes'
    end
    object tEstLDia: TWordField
      FieldName = 'Dia'
    end
    object tEstLQtd: TWordField
      FieldName = 'Qtd'
    end
  end
  object tEst: TnxTable
    Database = nxDB
    TableName = 'OpenStat'
    Left = 128
    Top = 192
    object tEstData: TDateField
      FieldName = 'Data'
    end
    object tEstIP: TStringField
      FieldName = 'IP'
      Size = 15
    end
    object tEstH2: TWordField
      FieldName = 'H'
    end
    object tEstLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tEstW: TWordField
      FieldName = 'W'
    end
    object tEstQtd: TIntegerField
      FieldName = 'Qtd'
    end
    object tEstAno: TWordField
      FieldName = 'Ano'
    end
    object tEstMes: TWordField
      FieldName = 'Mes'
    end
    object tEstDia: TWordField
      FieldName = 'Dia'
    end
  end
  object tEstH: TnxTable
    Database = nxDB
    TableName = 'OpenStatH'
    IndexName = 'IAnoMesDiaH'
    Left = 224
    Top = 192
    object tEstHH: TWordField
      FieldName = 'H'
    end
    object tEstHAno: TWordField
      FieldName = 'Ano'
    end
    object tEstHMes: TWordField
      FieldName = 'Mes'
    end
    object tEstHDia: TWordField
      FieldName = 'Dia'
    end
    object tEstHQtd: TIntegerField
      FieldName = 'Qtd'
    end
  end
  object tCliA: TnxTable
    Database = nxDB
    TableName = 'cliente_ant'
    IndexName = 'ICodigo'
    Left = 128
    Top = 224
    object tCliACodigo: TAutoIncField
      FieldName = 'Codigo'
    end
    object tCliATipoTel: TWordField
      FieldName = 'TipoTel'
    end
  end
end
