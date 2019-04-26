object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Importar dados do ODIN'
  ClientHeight = 211
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object PB: TProgressBar
    Left = 0
    Top = 0
    Width = 524
    Height = 16
    Align = alTop
    TabOrder = 0
  end
  object Button3: TButton
    Left = 8
    Top = 157
    Width = 75
    Height = 25
    Caption = 'Importar'
    TabOrder = 1
    OnClick = Button3Click
  end
  object cbLoginCod: TCheckBox
    Left = 16
    Top = 32
    Width = 241
    Height = 17
    Caption = 'Login por c'#243'digo'
    TabOrder = 2
  end
  object cxLabel1: TcxLabel
    Left = 16
    Top = 88
    Caption = 'NexServ tem que estar em execu'#231#227'o no mesmo PC'
    Style.TextColor = clGreen
    Style.TextStyle = [fsBold]
  end
  object nxSe: TnxSession
    ActiveDesigntime = True
    UserName = 'admin'
    Password = 'delphi9856'
    ServerEngine = nxRSE
    Left = 176
    Top = 72
  end
  object nxDB: TnxDatabase
    ActiveDesigntime = True
    Session = nxSe
    AliasName = 'NexCafe'
    Left = 232
    Top = 64
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'Cliente'
    Left = 24
    Top = 64
    object tCliID: TUnsignedAutoIncField
      FieldName = 'ID'
    end
    object tCliNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tCliEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object tCliBairro: TStringField
      FieldName = 'Bairro'
    end
    object tCliCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object tCliUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tCliCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object tCliSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object tCliObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tCliCpf: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object tCliRg: TStringField
      FieldName = 'Rg'
      Size = 14
    end
    object tCliTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object tCliEmail: TnxMemoField
      FieldName = 'Email'
      BlobType = ftMemo
    end
    object tCliMinutos: TFloatField
      FieldName = 'Minutos'
    end
    object tCliPassaportes: TFloatField
      FieldName = 'Passaportes'
    end
    object tCliMinutosUsados: TFloatField
      FieldName = 'MinutosUsados'
    end
    object tCliMinutosIniciais: TFloatField
      FieldName = 'MinutosIniciais'
    end
    object tCliIsento: TBooleanField
      FieldName = 'Isento'
    end
    object tCliUsername: TStringField
      FieldName = 'Username'
      Size = 40
    end
    object tCliPai: TStringField
      FieldName = 'Pai'
      Size = 40
    end
    object tCliMae: TStringField
      FieldName = 'Mae'
      Size = 40
    end
    object tCliSenha: TStringField
      FieldName = 'Senha'
    end
    object tCliUltVisita: TDateTimeField
      FieldName = 'UltVisita'
    end
    object tCliDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object tCliEscola: TStringField
      FieldName = 'Escola'
      Size = 40
    end
    object tCliEscolaHI: TDateTimeField
      FieldName = 'EscolaHI'
    end
    object tCliEscolaHF: TDateTimeField
      FieldName = 'EscolaHF'
    end
    object tCliNickName: TStringField
      FieldName = 'NickName'
      Size = 30
    end
    object tCliDataNasc: TDateTimeField
      FieldName = 'DataNasc'
    end
    object tCliCelular: TStringField
      FieldName = 'Celular'
      Size = 15
    end
    object tCliTemDebito: TBooleanField
      FieldName = 'TemDebito'
    end
    object tCliLimiteDebito: TCurrencyField
      FieldName = 'LimiteDebito'
    end
    object tCliFoto: TGraphicField
      FieldName = 'Foto'
      BlobType = ftGraphic
    end
    object tCliIncluidoEm: TDateTimeField
      FieldName = 'IncluidoEm'
    end
    object tCliAlteradoEm: TDateTimeField
      FieldName = 'AlteradoEm'
    end
    object tCliIncluidoPor: TStringField
      FieldName = 'IncluidoPor'
      Size = 10
    end
    object tCliAlteradoPor: TStringField
      FieldName = 'AlteradoPor'
      Size = 10
    end
    object tCliTitEleitor: TStringField
      FieldName = 'TitEleitor'
      Size = 13
    end
    object tCliFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
    object tCliFidTotal: TFloatField
      FieldName = 'FidTotal'
    end
    object tCliFidResg: TFloatField
      FieldName = 'FidResg'
    end
    object tCliAniversario: TStringField
      FieldName = 'Aniversario'
      Size = 4
    end
    object tCliCotaImpEspecial: TBooleanField
      FieldName = 'CotaImpEspecial'
    end
    object tCliCotaImpDia: TLongWordField
      FieldName = 'CotaImpDia'
    end
    object tCliCotaImpMes: TLongWordField
      FieldName = 'CotaImpMes'
    end
    object tCliSemFidelidade: TBooleanField
      FieldName = 'SemFidelidade'
    end
    object tCliTemCredito: TBooleanField
      FieldName = 'TemCredito'
    end
    object tCliNaoGuardarCredito: TBooleanField
      FieldName = 'NaoGuardarCredito'
    end
    object tCliPermiteLoginSemCred: TBooleanField
      FieldName = 'PermiteLoginSemCred'
    end
    object tCliCHorario: TLongWordField
      FieldName = 'CHorario'
    end
    object tCliOpCHorario: TByteField
      FieldName = 'OpCHorario'
    end
    object tCliHP1: TLongWordField
      FieldName = 'HP1'
    end
    object tCliHP2: TLongWordField
      FieldName = 'HP2'
    end
    object tCliHP3: TLongWordField
      FieldName = 'HP3'
    end
    object tCliHP4: TLongWordField
      FieldName = 'HP4'
    end
    object tCliHP5: TLongWordField
      FieldName = 'HP5'
    end
    object tCliHP6: TLongWordField
      FieldName = 'HP6'
    end
    object tCliHP7: TLongWordField
      FieldName = 'HP7'
    end
    object tCliInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object tCliTipoAcessoPref: TIntegerField
      FieldName = 'TipoAcessoPref'
    end
    object tCliFornecedor: TBooleanField
      FieldName = 'Fornecedor'
    end
    object tCliValorCred: TCurrencyField
      FieldName = 'ValorCred'
    end
    object tCliRecVer: TLongWordField
      FieldName = 'RecVer'
    end
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 16200
    Left = 136
    Top = 120
  end
  object IBDB: TIBDatabase
    DatabaseName = 'localhost:C:\NexCafe\ODIN.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    ServerType = 'IBServer'
    Left = 184
    Top = 160
  end
  object tOdin: TIBTable
    Database = IBDB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ENTIDADEID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ENTIDADEGRUPOID'
        DataType = ftInteger
      end
      item
        Name = 'USUARIOID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CODIGOBARRA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 70
      end
      item
        Name = 'APELIDO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SEXO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'CELULAR'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ESTADO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PAIS'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NASCIMENTO'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'CADASTRO'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'ULTIMAVISITA'
        DataType = ftDateTime
      end
      item
        Name = 'ENTIDADETIPO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'FUNCIONARIOLIMITE'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'COBRARTIPO'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'COBRARVALORHORA'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'COBRARCORTESIA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'SENHA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PROFISSAO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'BLOQUEADO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'MOTIVO'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'SALDO'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'BANCOHORA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'MILHAGEM'
        Attributes = [faRequired]
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'NOMEPAI'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NOMEMAE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ICQ'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'MSN'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ESCOLA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ESCOLAREGISTRO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'AULAINICIO'
        DataType = ftDateTime
      end
      item
        Name = 'AULAFINAL'
        DataType = ftDateTime
      end
      item
        Name = 'AUTORIZACAOMENOR'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'PERMISSOES'
        DataType = ftBlob
        Size = 8
      end
      item
        Name = 'DIGITAL'
        DataType = ftBlob
        Size = 8
      end>
    IndexDefs = <
      item
        Name = 'PK_ENTIDADES'
        Fields = 'ENTIDADEID'
        Options = [ixUnique]
      end
      item
        Name = 'FK_ENTIDADES2'
        Fields = 'USUARIOID'
      end
      item
        Name = 'FK_ENTIDADES1'
        Fields = 'ENTIDADEGRUPOID'
      end>
    StoreDefs = True
    TableName = 'ENTIDADES'
    UniDirectional = False
    Left = 264
    Top = 136
    object tOdinENTIDADEID: TIntegerField
      FieldName = 'ENTIDADEID'
      Required = True
    end
    object tOdinENTIDADEGRUPOID: TIntegerField
      FieldName = 'ENTIDADEGRUPOID'
    end
    object tOdinUSUARIOID: TIntegerField
      FieldName = 'USUARIOID'
      Required = True
    end
    object tOdinCODIGOBARRA: TIBStringField
      FieldName = 'CODIGOBARRA'
    end
    object tOdinNOME: TIBStringField
      FieldName = 'NOME'
      Required = True
      Size = 70
    end
    object tOdinAPELIDO: TIBStringField
      FieldName = 'APELIDO'
    end
    object tOdinSEXO: TSmallintField
      FieldName = 'SEXO'
      Required = True
    end
    object tOdinDOCUMENTO: TIBStringField
      FieldName = 'DOCUMENTO'
      Size = 14
    end
    object tOdinTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Size = 14
    end
    object tOdinCELULAR: TIBStringField
      FieldName = 'CELULAR'
      Size = 14
    end
    object tOdinENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 70
    end
    object tOdinBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object tOdinESTADO: TIBStringField
      FieldName = 'ESTADO'
      Size = 30
    end
    object tOdinCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object tOdinCEP: TIBStringField
      FieldName = 'CEP'
      Size = 10
    end
    object tOdinPAIS: TIBStringField
      FieldName = 'PAIS'
      Size = 30
    end
    object tOdinEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 50
    end
    object tOdinNASCIMENTO: TDateTimeField
      FieldName = 'NASCIMENTO'
      Required = True
    end
    object tOdinCADASTRO: TDateTimeField
      FieldName = 'CADASTRO'
      Required = True
    end
    object tOdinULTIMAVISITA: TDateTimeField
      FieldName = 'ULTIMAVISITA'
    end
    object tOdinENTIDADETIPO: TSmallintField
      FieldName = 'ENTIDADETIPO'
      Required = True
    end
    object tOdinFUNCIONARIOLIMITE: TIBBCDField
      FieldName = 'FUNCIONARIOLIMITE'
      Precision = 9
      Size = 2
    end
    object tOdinCOBRARTIPO: TSmallintField
      FieldName = 'COBRARTIPO'
      Required = True
    end
    object tOdinCOBRARVALORHORA: TIBBCDField
      FieldName = 'COBRARVALORHORA'
      Required = True
      Precision = 9
      Size = 2
    end
    object tOdinCOBRARCORTESIA: TIntegerField
      FieldName = 'COBRARCORTESIA'
      Required = True
    end
    object tOdinSENHA: TIBStringField
      FieldName = 'SENHA'
      Size = 50
    end
    object tOdinPROFISSAO: TIBStringField
      FieldName = 'PROFISSAO'
      Size = 30
    end
    object tOdinBLOQUEADO: TIntegerField
      FieldName = 'BLOQUEADO'
      Required = True
    end
    object tOdinMOTIVO: TIBStringField
      FieldName = 'MOTIVO'
      Size = 200
    end
    object tOdinSALDO: TIBBCDField
      FieldName = 'SALDO'
      Required = True
      Precision = 9
      Size = 2
    end
    object tOdinBANCOHORA: TIntegerField
      FieldName = 'BANCOHORA'
      Required = True
    end
    object tOdinMILHAGEM: TIBBCDField
      FieldName = 'MILHAGEM'
      Required = True
      Precision = 9
      Size = 2
    end
    object tOdinNOMEPAI: TIBStringField
      FieldName = 'NOMEPAI'
      Size = 50
    end
    object tOdinNOMEMAE: TIBStringField
      FieldName = 'NOMEMAE'
      Size = 50
    end
    object tOdinICQ: TIBStringField
      FieldName = 'ICQ'
      Size = 15
    end
    object tOdinMSN: TIBStringField
      FieldName = 'MSN'
      Size = 50
    end
    object tOdinESCOLA: TIBStringField
      FieldName = 'ESCOLA'
      Size = 50
    end
    object tOdinESCOLAREGISTRO: TIBStringField
      FieldName = 'ESCOLAREGISTRO'
      Size = 15
    end
    object tOdinAULAINICIO: TDateTimeField
      FieldName = 'AULAINICIO'
    end
    object tOdinAULAFINAL: TDateTimeField
      FieldName = 'AULAFINAL'
    end
    object tOdinAUTORIZACAOMENOR: TSmallintField
      FieldName = 'AUTORIZACAOMENOR'
      Required = True
    end
    object tOdinPERMISSOES: TBlobField
      FieldName = 'PERMISSOES'
      Size = 8
    end
    object tOdinDIGITAL: TBlobField
      FieldName = 'DIGITAL'
      Size = 8
    end
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDB
    Left = 64
    Top = 96
  end
  object tDeb: TnxTable
    Database = nxDB
    TableName = 'Debito'
    Left = 24
    Top = 96
    object tDebData: TDateTimeField
      FieldName = 'Data'
    end
    object tDebCliente: TLongWordField
      FieldName = 'Cliente'
    end
    object tDebValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tDebTipo: TByteField
      FieldName = 'Tipo'
    end
    object tDebID: TLongWordField
      FieldName = 'ID'
    end
    object tDebRecVer: TLongWordField
      FieldName = 'RecVer'
    end
  end
  object tMovEst: TnxTable
    Database = nxDB
    TableName = 'MovEst'
    IndexName = 'IID'
    Left = 136
    Top = 48
    object tMovEstID: TUnsignedAutoIncField
      FieldName = 'ID'
    end
    object tMovEstTran: TLongWordField
      FieldName = 'Tran'
    end
    object tMovEstProduto: TLongWordField
      FieldName = 'Produto'
    end
    object tMovEstQuant: TFloatField
      FieldName = 'Quant'
    end
    object tMovEstUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object tMovEstTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tMovEstCustoU: TCurrencyField
      FieldName = 'CustoU'
    end
    object tMovEstItem: TByteField
      FieldName = 'Item'
    end
    object tMovEstDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tMovEstPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tMovEstPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object tMovEstDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object tMovEstDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tMovEstEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object tMovEstCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tMovEstEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object tMovEstCliente: TLongWordField
      FieldName = 'Cliente'
    end
    object tMovEstCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tMovEstCategoria: TStringField
      FieldName = 'Categoria'
    end
    object tMovEstNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object tMovEstITran: TIntegerField
      FieldName = 'ITran'
    end
    object tMovEstTipoTran: TByteField
      FieldName = 'TipoTran'
    end
    object tMovEstSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tMovEstplusID: TGuidField
      FieldName = 'plusID'
      Size = 38
    end
    object tMovEstComissao: TCurrencyField
      FieldName = 'Comissao'
    end
    object tMovEstComissaoPerc: TFloatField
      FieldName = 'ComissaoPerc'
    end
    object tMovEstComissaoLucro: TBooleanField
      FieldName = 'ComissaoLucro'
    end
    object tMovEstplusTran: TBooleanField
      FieldName = 'plusTran'
    end
    object tMovEstPermSemEstoque: TBooleanField
      FieldName = 'PermSemEstoque'
    end
    object tMovEstFidResgate: TBooleanField
      FieldName = 'FidResgate'
    end
    object tMovEstFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
    object tMovEstRecVer: TLongWordField
      FieldName = 'RecVer'
    end
  end
  object nxRSE: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxTCP
    Left = 64
    Top = 64
  end
end
