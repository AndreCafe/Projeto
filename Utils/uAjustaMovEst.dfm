object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Importar CSV - ESTOQUE'
  ClientHeight = 415
  ClientWidth = 598
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PB: TProgressBar
    Left = 0
    Top = 0
    Width = 598
    Height = 16
    Align = alTop
    TabOrder = 0
  end
  object Button1: TButton
    Left = 254
    Top = 38
    Width = 75
    Height = 25
    Caption = 'Importar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 160
    Width = 598
    Height = 255
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object nxSession1: TnxSession
    ActiveDesigntime = True
    UserName = 'admin'
    Password = 'delphi9856'
    ServerEngine = nxRSE
    Left = 24
    Top = 24
  end
  object nxDB: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession1
    AliasName = 'NexCafe'
    Left = 64
    Top = 24
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 16200
    Left = 104
    Top = 24
  end
  object DataSource1: TDataSource
    Left = 136
    Top = 120
  end
  object tEst: TnxTable
    Database = nxDB
    OnCalcFields = tEstCalcFields
    TableName = 'MovEst'
    IndexName = 'IProduto'
    Left = 120
    Top = 72
    object tEstID: TAutoIncField
      FieldName = 'ID'
    end
    object tEstTran: TIntegerField
      FieldName = 'Tran'
    end
    object tEstProduto: TIntegerField
      FieldName = 'Produto'
    end
    object tEstQuant: TFloatField
      FieldName = 'Quant'
    end
    object tEstUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object tEstTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tEstCustoU: TCurrencyField
      FieldName = 'CustoU'
    end
    object tEstItem: TWordField
      FieldName = 'Item'
    end
    object tEstDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tEstPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tEstPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object tEstDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object tEstDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tEstEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object tEstCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tEstEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object tEstCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tEstCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tEstCategoria: TStringField
      FieldName = 'Categoria'
    end
    object tEstNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object tEstITran: TIntegerField
      FieldName = 'ITran'
    end
    object tEstTipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object tEstSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tEstplusID: TGuidField
      FieldName = 'plusID'
      Size = 38
    end
    object tEstplusTran: TBooleanField
      FieldName = 'plusTran'
    end
    object tEstFidResgate: TBooleanField
      FieldName = 'FidResgate'
    end
    object tEstFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
    object tEstSaldoPost: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SaldoPost'
      Calculated = True
    end
    object tEstFator: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Fator'
      Calculated = True
    end
  end
  object tProd: TnxTable
    Database = nxDB
    TableName = 'Produto'
    IndexName = 'IID'
    Left = 168
    Top = 72
    object tProdID: TAutoIncField
      FieldName = 'ID'
    end
    object tProdCodigo: TStringField
      FieldName = 'Codigo'
      Size = 15
    end
    object tProdDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object tProdUnid: TStringField
      FieldName = 'Unid'
      Size = 5
    end
    object tProdPreco: TCurrencyField
      FieldName = 'Preco'
    end
    object tProdObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tProdImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object tProdCategoria: TStringField
      FieldName = 'Categoria'
      Size = 35
    end
    object tProdFornecedor: TIntegerField
      FieldName = 'Fornecedor'
    end
    object tProdSubCateg: TStringField
      FieldName = 'SubCateg'
      Size = 35
    end
    object tProdEstoqueAtual: TFloatField
      FieldName = 'EstoqueAtual'
    end
    object tProdCustoUnitario: TCurrencyField
      FieldName = 'CustoUnitario'
    end
    object tProdEstoqueACE: TFloatField
      FieldName = 'EstoqueACE'
    end
    object tProdEstoqueACS: TFloatField
      FieldName = 'EstoqueACS'
    end
    object tProdPodeAlterarPreco: TBooleanField
      FieldName = 'PodeAlterarPreco'
    end
    object tProdNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object tProdEstoqueMin: TFloatField
      FieldName = 'EstoqueMin'
    end
    object tProdEstoqueMax: TFloatField
      FieldName = 'EstoqueMax'
    end
    object tProdAbaixoMin: TBooleanField
      FieldName = 'AbaixoMin'
    end
    object tProdAbaixoMinDesde: TDateTimeField
      FieldName = 'AbaixoMinDesde'
    end
    object tProdEstoqueRepor: TFloatField
      FieldName = 'EstoqueRepor'
    end
    object tProdplus: TBooleanField
      FieldName = 'plus'
    end
    object tProdplusURL: TnxMemoField
      FieldName = 'plusURL'
      BlobType = ftMemo
    end
    object tProdplusCodParceiro: TStringField
      FieldName = 'plusCodParceiro'
      Size = 15
    end
    object tProdplusCodProduto: TStringField
      FieldName = 'plusCodProduto'
      Size = 15
    end
    object tProdAtivo: TBooleanField
      FieldName = 'Ativo'
    end
    object tProdFidelidade: TBooleanField
      FieldName = 'Fidelidade'
    end
    object tProdFidPontos: TIntegerField
      FieldName = 'FidPontos'
    end
  end
  object nxRSE: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxTCP
    Left = 144
    Top = 24
  end
end
