object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Importar dados do F'#201'RUS'
  ClientHeight = 169
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 504
    Height = 54
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alTop
    AutoSize = False
    Caption = 
      'ATEN'#199#195'O: Ao realizar a importa'#231#227'o qualquer cliente que  j'#225' tenha' +
      ' cadastrado no programa NexCaf'#233' ser'#225' apagado e substitu'#237'do pelos' +
      ' clientes contidos no banco de dados do F'#233'rus.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
    ExplicitLeft = 3
    ExplicitTop = 3
    ExplicitWidth = 518
  end
  object Label2: TLabel
    Left = 10
    Top = 128
    Width = 504
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Aguarde ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Button3: TButton
    Left = 224
    Top = 77
    Width = 75
    Height = 25
    Caption = 'Importar'
    TabOrder = 0
    OnClick = Button3Click
  end
  object nxSe: TnxSession
    ActiveDesigntime = True
    UserName = 'admin'
    Password = 'delphi9856'
    ServerEngine = nxRSE
    Left = 24
    Top = 24
  end
  object nxDB: TnxDatabase
    ActiveDesigntime = True
    Session = nxSe
    AliasName = 'NexCafe'
    Left = 64
    Top = 24
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
    Left = 104
    Top = 24
  end
  object IBDB: TIBDatabase
    DatabaseName = 'localhost:C:\Nexcafe\F'#233'rus.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    ServerType = 'IBServer'
    Left = 144
    Top = 24
  end
  object tOdin: TIBTable
    Database = IBDB
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
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
    TableName = 'PERFIL'
    UniDirectional = False
    Left = 104
    Top = 96
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
  end
  object tMovEst: TnxTable
    Database = nxDB
    TableName = 'MovEst'
    IndexName = 'IID'
    Left = 104
    Top = 64
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
  end
  object nxRSE: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxTCP
    Left = 64
    Top = 64
  end
  object OpenDlg: TOpenDialog
    Filter = 'Arquivo F'#233'rus|F'#233'rus.FDB'
    Options = [ofEnableSizing]
    Left = 352
    Top = 64
  end
end
