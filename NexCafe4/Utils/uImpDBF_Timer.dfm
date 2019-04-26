object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Importar DBF'
  ClientHeight = 548
  ClientWidth = 968
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
    Width = 968
    Height = 16
    Align = alTop
    TabOrder = 0
  end
  object Button1: TButton
    Left = 168
    Top = 54
    Width = 75
    Height = 25
    Caption = 'Importar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 363
    Width = 968
    Height = 185
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
    ServerEngine = nxSE
    Left = 24
    Top = 24
  end
  object nxDB: TnxDatabase
    Session = nxSession1
    AliasPath = 'c:\meus programas\nexcafe\dados'
    Left = 64
    Top = 24
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'Cliente'
    Exclusive = True
    IndexName = 'IID'
    Left = 24
    Top = 64
    object tCliID: TAutoIncField
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
    object tCliMinutos: TFloatField
      FieldName = 'Minutos'
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
    object tCliInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object tCliTipoAcessoPref: TIntegerField
      FieldName = 'TipoAcessoPref'
    end
    object tCliValorCred: TCurrencyField
      FieldName = 'ValorCred'
    end
    object tCliObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tCliEmail: TMemoField
      FieldName = 'Email'
      BlobType = ftMemo
    end
    object tCliPassaportes: TFloatField
      FieldName = 'Passaportes'
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
    object tCliNaoGuardarCredito: TBooleanField
      FieldName = 'NaoGuardarCredito'
    end
    object tCliPermiteLoginSemCred: TBooleanField
      FieldName = 'PermiteLoginSemCred'
    end
    object tCliHP1: TIntegerField
      FieldName = 'HP1'
    end
    object tCliHP2: TIntegerField
      FieldName = 'HP2'
    end
    object tCliHP3: TIntegerField
      FieldName = 'HP3'
    end
    object tCliHP4: TIntegerField
      FieldName = 'HP4'
    end
    object tCliHP5: TIntegerField
      FieldName = 'HP5'
    end
    object tCliHP6: TIntegerField
      FieldName = 'HP6'
    end
    object tCliHP7: TIntegerField
      FieldName = 'HP7'
    end
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1:16200'
    Left = 104
    Top = 24
  end
  object nxSE: TnxServerEngine
    ServerName = 'Nextar'
    Options = []
    TableExtension = 'nx1'
    Left = 64
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = tF
    Left = 360
    Top = 80
  end
  object tVC: TDbf
    FilePath = 'C:\Meus Programas\NexCafe\Timer\'
    IndexDefs = <
      item
        IndexFile = 'CODIGOINDE'
        SortField = 'CODIGO'
        Options = [ixExpression]
      end>
    TableName = 'Venda_Co.DBF'
    TableLevel = 4
    Active = True
    Left = 208
    Top = 144
    object tVCCODIGO_ACE: TStringField
      FieldName = 'CODIGO_ACE'
      Size = 12
    end
    object tVCNICK: TStringField
      FieldName = 'NICK'
      Size = 35
    end
  end
  object tCA: TDbf
    FilePath = 'C:\Meus Programas\NexCafe\Timer\'
    IndexDefs = <
      item
        IndexFile = 'CODIGO_ACE'
        SortField = 'CODIGO_ACE'
        Options = [ixUnique, ixExpression]
      end>
    TableName = 'Codigo_A.DBF'
    TableLevel = 4
    Active = True
    Left = 264
    Top = 144
    object tCACODIGO_ACE: TStringField
      FieldName = 'CODIGO_ACE'
      Size = 12
    end
    object tCASTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object tCAVALOR_DISP: TStringField
      FieldName = 'VALOR_DISP'
      Size = 8
    end
    object tCADATA_CRIAC: TStringField
      FieldName = 'DATA_CRIAC'
      Size = 10
    end
    object tCAURL: TStringField
      FieldName = 'URL'
      Size = 254
    end
    object tCATIPO_CODIG: TStringField
      FieldName = 'TIPO_CODIG'
      Size = 1
    end
    object tCAVENDIDO: TBooleanField
      FieldName = 'VENDIDO'
    end
    object tCAVINCULADO: TBooleanField
      FieldName = 'VINCULADO'
    end
  end
  object dVC: TnxTable
    Database = nxDatabase1
    TableName = 'Venda_Codigos'
    Exclusive = True
    IndexName = 'ICodigo_Ace'
    Left = 24
    Top = 112
    object dVCCodigo_Ace: TStringField
      FieldName = 'Codigo_Ace'
      Size = 12
    end
    object dVCNick: TStringField
      FieldName = 'Nick'
      Size = 35
    end
  end
  object nxDatabase1: TnxDatabase
    Session = nxSession1
    AliasPath = 'c:\meus programas\nexcafe'
    Left = 272
    Top = 32
  end
  object tF: TDbf
    FilePath = 'C:\Meus Programas\NexCafe\Timer\'
    IndexDefs = <
      item
        IndexFile = 'CODIGOINDE'
        SortField = 'CODIGO'
        Options = [ixExpression]
      end>
    TableName = 'CLIENTES.DBF'
    TableLevel = 3
    Left = 136
    Top = 136
    object tFCODIGO: TFloatField
      FieldName = 'CODIGO'
    end
    object tFNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object tFDATA_NASC: TStringField
      FieldName = 'DATA_NASC'
      Size = 10
    end
    object tFRUA: TStringField
      FieldName = 'RUA'
      Size = 33
    end
    object tFNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 6
    end
    object tFCOMPLEMENT: TStringField
      FieldName = 'COMPLEMENT'
      Size = 13
    end
    object tFBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 33
    end
    object tFCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 33
    end
    object tFUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tFTEL_RESIDE: TStringField
      FieldName = 'TEL_RESIDE'
      Size = 17
    end
    object tFTEL_COMERC: TStringField
      FieldName = 'TEL_COMERC'
      Size = 17
    end
    object tFTEL_CELULA: TStringField
      FieldName = 'TEL_CELULA'
      Size = 17
    end
    object tFE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Size = 30
    end
    object tFOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
    end
    object tFCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object tFGRUPO: TStringField
      FieldName = 'GRUPO'
      Size = 30
    end
    object tFNICK: TStringField
      FieldName = 'NICK'
      Size = 35
    end
    object tFFILIACAO: TStringField
      FieldName = 'FILIACAO'
      Size = 60
    end
    object tFDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 30
    end
    object tFAUTORIZADO: TBooleanField
      FieldName = 'AUTORIZADO'
    end
  end
end
