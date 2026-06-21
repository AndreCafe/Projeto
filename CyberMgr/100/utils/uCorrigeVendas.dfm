object Form1: TForm1
  Left = 192
  Top = 133
  Width = 627
  Height = 397
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 609
    Height = 45
    Align = alTop
    BevelOuter = bvNone
    Caption = 
      'Atualizando banco de dados de vendas para nova versão ... Aguard' +
      'e ...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 45
    Width = 609
    Height = 315
    Align = alClient
    DataSource = DataSource1
    Enabled = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = Q
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
  object DB: TffDatabase
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
      end
      item
        Name = 'Caixa'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'IEmissor'
        Fields = 'Emissor;Serie;Numero;Item'
        Options = [ixUnique, ixCaseInsensitive]
      end
      item
        Name = 'iProd'
        Fields = 'Produto;Data;NumSeq'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IContato'
        Fields = 'Contato;Data'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'ICaixa'
        Fields = 'Caixa'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'IEmissor'
    SessionName = 'Sessao'
    TableName = 'ItensME'
    Left = 328
    Top = 176
    object TNumSeq: TAutoIncField
      FieldName = 'NumSeq'
    end
    object TEmissor: TIntegerField
      FieldName = 'Emissor'
    end
    object TSerie: TStringField
      FieldName = 'Serie'
      Size = 2
    end
    object TNumero: TIntegerField
      FieldName = 'Numero'
    end
    object TProduto: TStringField
      FieldName = 'Produto'
      Size = 15
    end
    object TQuant: TFloatField
      FieldName = 'Quant'
    end
    object TUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object TTotal: TCurrencyField
      FieldName = 'Total'
    end
    object TItem: TWordField
      FieldName = 'Item'
    end
    object TDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object TData: TDateTimeField
      FieldName = 'Data'
    end
    object TMovEst: TBooleanField
      FieldName = 'MovEst'
    end
    object TEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object TCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object TEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object TTipoMov: TStringField
      FieldName = 'TipoMov'
      Size = 15
    end
    object TContato: TIntegerField
      FieldName = 'Contato'
    end
    object TCaixa: TIntegerField
      FieldName = 'Caixa'
    end
  end
  object Q: TffQuery
    DatabaseName = 'DB'
    SessionName = 'Sessao'
    SQL.Strings = (
      'select * from ME'
      'where desconto > 0.009')
    Left = 232
    Top = 184
    object QSerie: TStringField
      FieldName = 'Serie'
      Size = 2
    end
    object QNumero: TIntegerField
      FieldName = 'Numero'
    end
    object QCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object QDiaHora: TDateTimeField
      FieldName = 'DiaHora'
    end
    object QTipo: TStringField
      FieldName = 'Tipo'
      Size = 15
    end
    object QEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object QMovEst: TBooleanField
      FieldName = 'MovEst'
    end
    object QChamada: TIntegerField
      FieldName = 'Chamada'
    end
    object QContato: TIntegerField
      FieldName = 'Contato'
    end
    object QUsuario: TStringField
      FieldName = 'Usuario'
      Size = 10
    end
    object QEntregar: TBooleanField
      FieldName = 'Entregar'
    end
    object QEntregador: TWordField
      FieldName = 'Entregador'
    end
    object QCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object QFormaPagto: TStringField
      FieldName = 'FormaPagto'
      Size = 15
    end
    object QTotal: TCurrencyField
      FieldName = 'Total'
    end
    object QDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object QObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object QEndEnt: TStringField
      FieldName = 'EndEnt'
      Size = 50
    end
    object QBaiEnt: TStringField
      FieldName = 'BaiEnt'
      Size = 25
    end
    object QCidEnt: TStringField
      FieldName = 'CidEnt'
      Size = 25
    end
    object QUFEnt: TStringField
      FieldName = 'UFEnt'
      Size = 2
    end
    object QEmissor: TIntegerField
      FieldName = 'Emissor'
    end
    object QDtMovimentacao: TDateTimeField
      FieldName = 'DtMovimentacao'
    end
    object QSituacao: TStringField
      FieldName = 'Situacao'
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer1Timer
    Left = 112
    Top = 264
  end
end
