object Form1: TForm1
  Left = 192
  Top = 133
  Width = 620
  Height = 396
  BorderWidth = 5
  Caption = 'Aguarde'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 73
    Width = 602
    Height = 286
    Align = alClient
    DataSource = DataSource1
    Enabled = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 602
    Height = 73
    Align = alTop
    Caption = 
      'Atualizando banco de dados de acessos para nova versão ... Aguar' +
      'de ....'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object DataSource1: TDataSource
    DataSet = T
    Left = 24
    Top = 112
  end
  object ffClient1: TffClient
    ClientName = 'ffClient'
    ServerEngine = FFRemoteServerEngine1
    Left = 112
    Top = 128
  end
  object ffSession1: TffSession
    ClientName = 'ffClient'
    SessionName = 'Sessao'
    Left = 152
    Top = 128
  end
  object ffDatabase1: TffDatabase
    AliasName = 'CyberMgr'
    DatabaseName = 'DB'
    SessionName = 'Sessao'
    Left = 184
    Top = 128
  end
  object ffLT: TffLegacyTransport
    Enabled = True
    ServerName = '127.0.0.1'
    Protocol = ptTCPIP
    Left = 112
    Top = 176
  end
  object FFRemoteServerEngine1: TFFRemoteServerEngine
    Transport = ffLT
    Left = 152
    Top = 176
  end
  object T: TffTable
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
      end
      item
        Name = 'ValorFinalAcesso'
        DataType = ftCurrency
      end
      item
        Name = 'DescontoProduto'
        DataType = ftCurrency
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
    SessionName = 'Sessao'
    TableName = 'Acesso'
    Left = 200
    Top = 184
    object TNumero: TAutoIncField
      FieldName = 'Numero'
    end
    object TCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object TAberto: TBooleanField
      FieldName = 'Aberto'
    end
    object TTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object TInicio: TDateTimeField
      FieldName = 'Inicio'
    end
    object TFim: TDateTimeField
      FieldName = 'Fim'
    end
    object TDataPagto: TDateTimeField
      FieldName = 'DataPagto'
    end
    object TContato: TIntegerField
      FieldName = 'Contato'
    end
    object TNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object TMaquina: TWordField
      FieldName = 'Maquina'
    end
    object TTipo: TWordField
      FieldName = 'Tipo'
    end
    object TFuncI: TStringField
      FieldName = 'FuncI'
      Size = 10
    end
    object TFuncF: TStringField
      FieldName = 'FuncF'
      Size = 40
    end
    object TTempo: TDateTimeField
      FieldName = 'Tempo'
    end
    object TTempoCobrado: TDateTimeField
      FieldName = 'TempoCobrado'
    end
    object TCredUsado: TIntegerField
      FieldName = 'CredUsado'
    end
    object TCredAnterior: TIntegerField
      FieldName = 'CredAnterior'
    end
    object TDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object TProdutos: TCurrencyField
      FieldName = 'Produtos'
    end
    object TMotivoDesc: TWordField
      FieldName = 'MotivoDesc'
    end
    object TValor: TCurrencyField
      FieldName = 'Valor'
    end
    object TObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TIsento: TBooleanField
      FieldName = 'Isento'
    end
    object TFormaPagto: TStringField
      FieldName = 'FormaPagto'
    end
    object TNaoUsarPacote: TBooleanField
      FieldName = 'NaoUsarPacote'
    end
    object TCodPacote: TWordField
      FieldName = 'CodPacote'
    end
    object TSinal: TCurrencyField
      FieldName = 'Sinal'
    end
    object TAcessoPago: TIntegerField
      FieldName = 'AcessoPago'
    end
    object TValorFinalAcesso: TCurrencyField
      FieldName = 'ValorFinalAcesso'
    end
    object TDescontoProduto: TCurrencyField
      FieldName = 'DescontoProduto'
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 352
    Top = 240
  end
end
