object dmPlus: TdmPlus
  OldCreateOrder = False
  Height = 253
  Width = 215
  object db: TnxDatabase
    Session = Session
    AliasName = 'nexcafe'
    FailSafe = True
    Left = 72
    Top = 16
  end
  object Session: TnxSession
    UserName = 'admin'
    Password = 'delphi9856'
    ServerEngine = Dados.RSE
    Left = 24
    Top = 16
  end
  object tPlusP: TnxTable
    Database = db
    TableName = 'plusP'
    Password = 'CEWk4jhsad3f'
    IndexName = 'ICodParceiro'
    Left = 24
    Top = 80
    object tPlusPCodParceiro: TStringField
      FieldName = 'CodParceiro'
      Size = 15
    end
    object tPlusPNomeParceiro: TStringField
      FieldName = 'NomeParceiro'
      Size = 40
    end
    object tPlusPurlTimeout: TStringField
      FieldName = 'urlTimeout'
      Size = 255
    end
    object tPlusPKeyIndex: TWordField
      FieldName = 'KeyIndex'
    end
    object tPlusPAdesao: TBooleanField
      FieldName = 'Adesao'
    end
  end
  object tPlusT: TnxTable
    Database = db
    TableName = 'plusT'
    Password = 'CEWk4jhsad3f'
    IndexName = 'ICNP'
    Left = 72
    Top = 80
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
  object tProd: TnxTable
    Database = db
    Timeout = 10000
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    TableName = 'Produto'
    IndexName = 'IID'
    Left = 120
    Top = 80
    object tProdCodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      Size = 15
    end
    object tProdUnid: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'Unid'
      Size = 5
    end
    object tProdPreco: TCurrencyField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'Preco'
    end
    object tProdObs: TMemoField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tProdImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
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
    object tProdEstoqueFinal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'EstoqueFinal'
      Calculated = True
    end
    object tProdDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object tProdCategoria: TStringField
      FieldName = 'Categoria'
      Size = 35
    end
    object tProdSubCateg: TStringField
      FieldName = 'SubCateg'
      Size = 35
    end
    object tProdPodeAlterarPreco: TBooleanField
      FieldName = 'PodeAlterarPreco'
    end
    object tProdNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object tProdID: TAutoIncField
      FieldName = 'ID'
    end
    object tProdFidPontos: TIntegerField
      FieldName = 'FidPontos'
    end
    object tProdFidelidade: TBooleanField
      FieldName = 'Fidelidade'
    end
    object tProdFornecedor: TIntegerField
      FieldName = 'Fornecedor'
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
  end
  object tPlusTran: TnxTable
    Database = db
    Timeout = 10000
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    TableName = 'plusTran'
    IndexName = 'ITranIDOK'
    Left = 24
    Top = 136
    object tPlusTranSeq: TAutoIncField
      FieldName = 'Seq'
    end
    object tPlusTranID: TGuidField
      FieldName = 'ID'
      Size = 38
    end
    object tPlusTranIDTranParceiro: TStringField
      FieldName = 'IDTranParceiro'
      Size = 50
    end
    object tPlusTranOK: TBooleanField
      FieldName = 'OK'
    end
    object tPlusTranCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tPlusTranDataHoraParceiro: TDateTimeField
      FieldName = 'DataHoraParceiro'
    end
    object tPlusTranDataHoraNex: TDateTimeField
      FieldName = 'DataHoraNex'
    end
    object tPlusTrancodParceiro: TStringField
      FieldName = 'codParceiro'
      Size = 15
    end
    object tPlusTranDescr: TnxMemoField
      FieldName = 'Descr'
      BlobType = ftMemo
    end
    object tPlusTranObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tPlusTranFunc: TStringField
      FieldName = 'Func'
    end
    object tPlusTranValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tPlusTranCusto: TCurrencyField
      FieldName = 'Custo'
    end
    object tPlusTranSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tPlusTranCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tPlusTranTranID: TIntegerField
      FieldName = 'TranID'
    end
    object tPlusTranMaq: TWordField
      FieldName = 'Maq'
    end
    object tPlusTranQuant: TFloatField
      FieldName = 'Quant'
    end
    object tPlusTranPIN: TnxMemoField
      FieldName = 'PIN'
      BlobType = ftMemo
    end
    object tPlusTranEmailCliente: TStringField
      FieldName = 'EmailCliente'
      Size = 100
    end
    object tPlusTranIDProdutoParceiro: TStringField
      FieldName = 'IDProdutoParceiro'
      Size = 40
    end
    object tPlusTranIDProdutoNex: TIntegerField
      FieldName = 'IDProdutoNex'
    end
    object tPlusTranImg: TGraphicField
      FieldName = 'Img'
      BlobType = ftGraphic
    end
    object tPlusTranNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 50
    end
  end
end
