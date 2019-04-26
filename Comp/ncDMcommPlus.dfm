object dmCommPlus: TdmCommPlus
  OldCreateOrder = False
  Height = 279
  Width = 366
  object nxTCPIP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 16200
    Left = 176
    Top = 16
  end
  object tProduto: TnxTable
    Database = nxDB
    TableName = 'Produto'
    IndexName = 'IplusParceiroProd'
    Left = 24
    Top = 72
    object tProdutoID: TAutoIncField
      FieldName = 'ID'
    end
    object tProdutoCodigo: TStringField
      FieldName = 'Codigo'
      Size = 15
    end
    object tProdutoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object tProdutoUnid: TStringField
      FieldName = 'Unid'
      Size = 5
    end
    object tProdutoPreco: TCurrencyField
      FieldName = 'Preco'
    end
    object tProdutoObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tProdutoImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object tProdutoCategoria: TStringField
      FieldName = 'Categoria'
      Size = 35
    end
    object tProdutoSubCateg: TStringField
      FieldName = 'SubCateg'
      Size = 35
    end
    object tProdutoEstoqueAtual: TFloatField
      FieldName = 'EstoqueAtual'
    end
    object tProdutoCustoUnitario: TCurrencyField
      FieldName = 'CustoUnitario'
    end
    object tProdutoEstoqueACE: TFloatField
      FieldName = 'EstoqueACE'
    end
    object tProdutoEstoqueACS: TFloatField
      FieldName = 'EstoqueACS'
    end
    object tProdutoPodeAlterarPreco: TBooleanField
      FieldName = 'PodeAlterarPreco'
    end
    object tProdutoNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object tProdutoFidelidade: TBooleanField
      FieldName = 'Fidelidade'
    end
    object tProdutoFidPontos: TIntegerField
      FieldName = 'FidPontos'
    end
    object tProdutoEstoqueMin: TFloatField
      FieldName = 'EstoqueMin'
    end
    object tProdutoEstoqueMax: TFloatField
      FieldName = 'EstoqueMax'
    end
    object tProdutoAbaixoMin: TBooleanField
      FieldName = 'AbaixoMin'
    end
    object tProdutoAbaixoMinDesde: TDateTimeField
      FieldName = 'AbaixoMinDesde'
    end
    object tProdutoEstoqueRepor: TFloatField
      FieldName = 'EstoqueRepor'
    end
    object tProdutoFornecedor: TIntegerField
      FieldName = 'Fornecedor'
    end
    object tProdutoplus: TBooleanField
      FieldName = 'plus'
    end
    object tProdutoplusURL: TnxMemoField
      FieldName = 'plusURL'
      BlobType = ftMemo
    end
    object tProdutoplusCodParceiro: TStringField
      FieldName = 'plusCodParceiro'
      Size = 15
    end
    object tProdutoplusCodProduto: TStringField
      FieldName = 'plusCodProduto'
      Size = 15
    end
    object tProdutoAtivo: TBooleanField
      FieldName = 'Ativo'
    end
  end
  object nxRSE: TnxRemoteServerEngine
    Transport = nxTCPIP
    Left = 120
    Top = 16
  end
  object nxDB: TnxDatabase
    Session = nxSession
    AliasPath = 'c:\meus programas\nexcafe\dados'
    Left = 72
    Top = 16
  end
  object nxSession: TnxSession
    UserName = 'admin'
    Password = 'delphi9856'
    ServerEngine = nxRSE
    Left = 24
    Top = 16
  end
  object tParceiros: TnxTable
    Database = nxDB
    TableName = 'plusP'
    Password = 'CEWk4jhsad3f'
    IndexName = 'ICodParceiro'
    Left = 96
    Top = 72
    object tParceirosCodParceiro: TStringField
      FieldName = 'CodParceiro'
      Size = 15
    end
    object tParceirosNomeParceiro: TStringField
      FieldName = 'NomeParceiro'
      Size = 40
    end
    object tParceirosurlTimeout: TStringField
      FieldName = 'urlTimeout'
      Size = 255
    end
    object tParceirosAdesao: TBooleanField
      FieldName = 'Adesao'
    end
    object tParceirosKeyIndex: TWordField
      FieldName = 'KeyIndex'
    end
  end
  object tPlusT: TnxTable
    Database = nxDB
    TableName = 'plusT'
    Password = 'CEWk4jhsad3f'
    IndexName = 'ICNP'
    Left = 88
    Top = 144
    object tPlusTC: TStringField
      FieldName = 'C'
      Size = 15
    end
    object tPlusTN: TStringField
      FieldName = 'N'
      Size = 255
    end
    object tPlusTP: TStringField
      FieldName = 'P'
      Size = 255
    end
    object tPlusTT: TnxMemoField
      FieldName = 'T'
      BlobType = ftMemo
    end
  end
end
