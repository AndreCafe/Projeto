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
    ServerEngine = nxSE
    Left = 24
    Top = 24
  end
  object nxDB: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession1
    AliasPath = 'c:\nexcafe\dados'
    Left = 64
    Top = 24
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1:16200'
    Left = 104
    Top = 24
  end
  object nxSE: TnxServerEngine
    ActiveDesigntime = True
    ServerName = 'Nextar'
    Options = []
    TableExtension = 'nx1'
    Left = 64
    Top = 64
  end
  object DataSource1: TDataSource
    Left = 136
    Top = 120
  end
  object tEst: TnxTable
    Database = nxDB
    TableName = 'MovEst'
    Exclusive = True
    IndexName = 'IID'
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
  end
  object tProd: TnxTable
    Database = nxDB
    TableName = 'Produto'
    Exclusive = True
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
      Size = 55
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
  object tFor: TnxTable
    Database = nxDB
    TableName = 'Cliente'
    Exclusive = True
    IndexName = 'IFornecedorNome'
    Left = 248
    Top = 96
    object tForID: TAutoIncField
      FieldName = 'ID'
    end
    object tForNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tForEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object tForBairro: TStringField
      FieldName = 'Bairro'
    end
    object tForCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object tForUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tForCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object tForSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object tForObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tForCpf: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object tForRg: TStringField
      FieldName = 'Rg'
      Size = 14
    end
    object tForTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object tForEmail: TnxMemoField
      FieldName = 'Email'
      BlobType = ftMemo
    end
    object tForMinutos: TFloatField
      FieldName = 'Minutos'
    end
    object tForPassaportes: TFloatField
      FieldName = 'Passaportes'
    end
    object tForMinutosUsados: TFloatField
      FieldName = 'MinutosUsados'
    end
    object tForMinutosIniciais: TFloatField
      FieldName = 'MinutosIniciais'
    end
    object tForIsento: TBooleanField
      FieldName = 'Isento'
    end
    object tForUsername: TStringField
      FieldName = 'Username'
      Size = 40
    end
    object tForPai: TStringField
      FieldName = 'Pai'
      Size = 40
    end
    object tForMae: TStringField
      FieldName = 'Mae'
      Size = 40
    end
    object tForSenha: TStringField
      FieldName = 'Senha'
    end
    object tForUltVisita: TDateTimeField
      FieldName = 'UltVisita'
    end
    object tForDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object tForEscola: TStringField
      FieldName = 'Escola'
      Size = 40
    end
    object tForEscolaHI: TDateTimeField
      FieldName = 'EscolaHI'
    end
    object tForEscolaHF: TDateTimeField
      FieldName = 'EscolaHF'
    end
    object tForNickName: TStringField
      FieldName = 'NickName'
      Size = 30
    end
    object tForDataNasc: TDateTimeField
      FieldName = 'DataNasc'
    end
    object tForCelular: TStringField
      FieldName = 'Celular'
      Size = 15
    end
    object tForTemDebito: TBooleanField
      FieldName = 'TemDebito'
    end
    object tForLimiteDebito: TCurrencyField
      FieldName = 'LimiteDebito'
    end
    object tForFoto: TGraphicField
      FieldName = 'Foto'
      BlobType = ftGraphic
    end
    object tForIncluidoEm: TDateTimeField
      FieldName = 'IncluidoEm'
    end
    object tForAlteradoEm: TDateTimeField
      FieldName = 'AlteradoEm'
    end
    object tForIncluidoPor: TStringField
      FieldName = 'IncluidoPor'
      Size = 10
    end
    object tForAlteradoPor: TStringField
      FieldName = 'AlteradoPor'
      Size = 10
    end
    object tForTitEleitor: TStringField
      FieldName = 'TitEleitor'
      Size = 13
    end
    object tForFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
    object tForFidTotal: TFloatField
      FieldName = 'FidTotal'
    end
    object tForFidResg: TFloatField
      FieldName = 'FidResg'
    end
    object tForAniversario: TStringField
      FieldName = 'Aniversario'
      Size = 4
    end
    object tForCotaImpEspecial: TBooleanField
      FieldName = 'CotaImpEspecial'
    end
    object tForCotaImpDia: TIntegerField
      FieldName = 'CotaImpDia'
    end
    object tForCotaImpMes: TIntegerField
      FieldName = 'CotaImpMes'
    end
    object tForSemFidelidade: TBooleanField
      FieldName = 'SemFidelidade'
    end
    object tForTemCredito: TBooleanField
      FieldName = 'TemCredito'
    end
    object tForNaoGuardarCredito: TBooleanField
      FieldName = 'NaoGuardarCredito'
    end
    object tForPermiteLoginSemCred: TBooleanField
      FieldName = 'PermiteLoginSemCred'
    end
    object tForCHorario: TIntegerField
      FieldName = 'CHorario'
    end
    object tForOpCHorario: TWordField
      FieldName = 'OpCHorario'
    end
    object tForHP1: TIntegerField
      FieldName = 'HP1'
    end
    object tForHP2: TIntegerField
      FieldName = 'HP2'
    end
    object tForHP3: TIntegerField
      FieldName = 'HP3'
    end
    object tForHP4: TIntegerField
      FieldName = 'HP4'
    end
    object tForHP5: TIntegerField
      FieldName = 'HP5'
    end
    object tForHP6: TIntegerField
      FieldName = 'HP6'
    end
    object tForHP7: TIntegerField
      FieldName = 'HP7'
    end
    object tForInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object tForTipoAcessoPref: TIntegerField
      FieldName = 'TipoAcessoPref'
    end
    object tForFornecedor: TBooleanField
      FieldName = 'Fornecedor'
    end
    object tForValorCred: TCurrencyField
      FieldName = 'ValorCred'
    end
  end
end
