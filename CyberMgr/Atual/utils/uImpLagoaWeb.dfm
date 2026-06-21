object Form1: TForm1
  Left = 2
  Top = 107
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 296
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object PB: TProgressBar
    Left = 72
    Top = 248
    Width = 481
    Height = 16
    TabOrder = 1
  end
  object DataSource1: TDataSource
    Left = 192
    Top = 112
  end
  object Origem: TTable
    DatabaseName = 'c:\'
    TableName = 'produto.dbf'
    Left = 152
    Top = 112
    object OrigemCODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 10
    end
    object OrigemCODREF: TStringField
      FieldName = 'CODREF'
      Size = 15
    end
    object OrigemDESCR: TStringField
      FieldName = 'DESCR'
      Size = 52
    end
    object OrigemCATEG: TStringField
      FieldName = 'CATEG'
      Size = 18
    end
    object OrigemSUBCATEG: TStringField
      FieldName = 'SUBCATEG'
      Size = 32
    end
    object OrigemESTOQ: TFloatField
      FieldName = 'ESTOQ'
    end
    object OrigemPRECO: TFloatField
      FieldName = 'PRECO'
    end
    object OrigemPRECOVEN: TFloatField
      FieldName = 'PRECOVEN'
    end
    object OrigemLUCRO: TFloatField
      FieldName = 'LUCRO'
    end
    object OrigemOBS: TStringField
      FieldName = 'OBS'
      Size = 35
    end
  end
  object Dest: TnxTable
    Database = nxDatabase1
    TableName = 'Produto'
    Left = 216
    Top = 48
    object DestCodigo: TStringField
      FieldName = 'Codigo'
      Size = 15
    end
    object DestDescricao: TStringField
      FieldName = 'Descricao'
      Size = 55
    end
    object DestUnid: TStringField
      FieldName = 'Unid'
      Size = 5
    end
    object DestPreco: TCurrencyField
      FieldName = 'Preco'
    end
    object DestObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object DestImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object DestCategoria: TStringField
      FieldName = 'Categoria'
      Size = 35
    end
    object DestSubCateg: TStringField
      FieldName = 'SubCateg'
      Size = 35
    end
    object DestEstoqueAtual: TFloatField
      FieldName = 'EstoqueAtual'
    end
    object DestCustoUnitario: TCurrencyField
      FieldName = 'CustoUnitario'
    end
    object DestEstoqueACE: TFloatField
      FieldName = 'EstoqueACE'
    end
    object DestEstoqueACS: TFloatField
      FieldName = 'EstoqueACS'
    end
  end
  object nxDatabase1: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession1
    AliasName = 'Cybermgr'
    Left = 256
    Top = 48
  end
  object nxSession1: TnxSession
    ActiveDesigntime = True
    ServerEngine = nxRemoteServerEngine1
    Left = 296
    Top = 48
  end
  object nxRemoteServerEngine1: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxWinsockTransport1
    Left = 336
    Top = 48
  end
  object nxWinsockTransport1: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    MaxBytesPerSecond = 0
    PingTime = 0
    Left = 376
    Top = 48
  end
  object ME: TnxTable
    Database = nxDatabase1
    TableName = 'MovEst'
    Left = 176
    Top = 48
    object MENumSeq: TAutoIncField
      FieldName = 'NumSeq'
    end
    object METransacao: TIntegerField
      FieldName = 'Transacao'
    end
    object MEProduto: TStringField
      FieldName = 'Produto'
      Size = 15
    end
    object MEQuant: TFloatField
      FieldName = 'Quant'
    end
    object MEUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object METotal: TCurrencyField
      FieldName = 'Total'
    end
    object MEItem: TWordField
      FieldName = 'Item'
    end
    object MEDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object MEDataMov: TDateTimeField
      FieldName = 'DataMov'
    end
    object MEDataPag: TDateTimeField
      FieldName = 'DataPag'
    end
    object MEEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object MECancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object MEEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object METipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object MEContato: TIntegerField
      FieldName = 'Contato'
    end
    object MECaixaMov: TIntegerField
      FieldName = 'CaixaMov'
    end
    object MECaixaPag: TIntegerField
      FieldName = 'CaixaPag'
    end
    object MECategoria: TStringField
      FieldName = 'Categoria'
    end
  end
end
