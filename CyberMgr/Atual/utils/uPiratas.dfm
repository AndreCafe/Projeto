object Form14: TForm14
  Left = 0
  Top = 0
  Caption = 'Form14'
  ClientHeight = 414
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 56
    Width = 467
    Height = 358
    Align = alBottom
    Lines.Strings = (
      'Lojas que usavam pirata e se registraram para teste gratuito:')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 96
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 289
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 3
    OnClick = Button3Click
  end
  object nxRSE: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxTCPIP
    Left = 144
    Top = 104
  end
  object nxSession1: TnxSession
    ActiveDesigntime = True
    ServerEngine = nxRSE
    Left = 184
    Top = 104
  end
  object nxTCPIP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    ServerNameRuntime = '192.168.0.5'
    ServerNameDesigntime = '192.168.0.5'
    MaxBytesPerSecond = 0
    PingTime = 0
    Left = 184
    Top = 144
  end
  object nxDB: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession1
    AliasName = 'registro'
    Left = 144
    Top = 144
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'cliente'
    IndexName = 'ISerieHD'
    Left = 232
    Top = 104
    object tCliCodigo: TIntegerField
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
  end
  object tLog: TnxTable
    Database = nxDB
    TableName = 'Log'
    IndexName = 'IOperID'
    Left = 232
    Top = 144
    object tLogNum: TAutoIncField
      FieldName = 'Num'
    end
    object tLogDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tLogLoja: TIntegerField
      FieldName = 'Loja'
    end
    object tLogDetalhes: TMemoField
      FieldName = 'Detalhes'
      BlobType = ftMemo
    end
    object tLogIP: TStringField
      FieldName = 'IP'
    end
    object tLogOperID: TWordField
      FieldName = 'OperID'
    end
    object tLogOK: TBooleanField
      FieldName = 'OK'
    end
    object tLogSerieHD: TStringField
      FieldName = 'SerieHD'
      Size = 60
    end
    object tLogIP2: TStringField
      FieldName = 'IP2'
    end
  end
  object tLog2: TnxTable
    Database = nxDB
    TableName = 'Log'
    IndexName = 'IIPOper'
    Left = 232
    Top = 184
    object AutoIncField1: TAutoIncField
      FieldName = 'Num'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DataHora'
    end
    object IntegerField1: TIntegerField
      FieldName = 'Loja'
    end
    object MemoField1: TMemoField
      FieldName = 'Detalhes'
      BlobType = ftMemo
    end
    object StringField1: TStringField
      FieldName = 'IP'
    end
    object WordField1: TWordField
      FieldName = 'OperID'
    end
    object BooleanField1: TBooleanField
      FieldName = 'OK'
    end
    object tLog2SerieHD: TStringField
      FieldName = 'SerieHD'
      Size = 60
    end
    object tLog2IP2: TStringField
      FieldName = 'IP2'
    end
  end
end
