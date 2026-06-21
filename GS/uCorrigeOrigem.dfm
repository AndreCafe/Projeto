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
    Top = 144
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
  object Button1: TButton
    Left = 272
    Top = 39
    Width = 137
    Height = 25
    Caption = 'Corrige UTF8'
    TabOrder = 2
    OnClick = Button1Click
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
    ActiveDesigntime = True
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 16300
    Left = 128
    Top = 264
  end
  object nxRSE: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxTCP
    Left = 160
    Top = 264
  end
  object nxSE: TnxSession
    ActiveDesigntime = True
    ServerEngine = nxRSE
    Left = 96
    Top = 264
  end
  object nxDB: TnxDatabase
    ActiveDesigntime = True
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
    object tCliEndereco: TnxMemoField
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
    object tCliTelefones: TnxMemoField
      FieldName = 'Telefones'
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
    object tCliProprietarios: TnxMemoField
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
    object tCliStatus: TIntegerField
      FieldName = 'Status'
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
    object tCliTipoTel: TWordField
      FieldName = 'TipoTel'
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
    Left = 136
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
    Top = 200
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
  object T: TnxTable
    Database = nxDB
    TableName = 'utmccn'
    IndexName = 'IID'
    Left = 456
    Top = 80
    object TID: TAutoIncField
      FieldName = 'ID'
    end
    object TNome: TStringField
      FieldName = 'Nome'
      Size = 250
    end
  end
end
