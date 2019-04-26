object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Importar TXT - ODIN'
  ClientHeight = 415
  ClientWidth = 947
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
    Width = 947
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
    Top = 160
    Width = 947
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
    object tCliNasc: TDateTimeField
      FieldName = 'Nasc'
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
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1:16200'
    MaxBytesPerSecond = 0
    PingTime = 0
    Left = 104
    Top = 24
  end
  object nxSE: TnxServerEngine
    ServerName = 'Nextar'
    Options = []
    Left = 64
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = tEnt
    Left = 136
    Top = 120
  end
  object tEnt: TnxTable
    Database = nxDB
    TableName = 'ENTIDADES'
    Left = 24
    Top = 104
    object tEntENTIDADEID: TIntegerField
      DisplayWidth = 12
      FieldName = 'ENTIDADEID'
    end
    object tEntENTIDADEGRUPOID: TIntegerField
      DisplayWidth = 19
      FieldName = 'ENTIDADEGRUPOID'
    end
    object tEntUSUARIOID: TIntegerField
      DisplayWidth = 12
      FieldName = 'USUARIOID'
    end
    object tEntCODIGOBARRA: TStringField
      DisplayWidth = 24
      FieldName = 'CODIGOBARRA'
    end
    object tEntNOME: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Size = 70
    end
    object tEntAPELIDO: TStringField
      DisplayWidth = 24
      FieldName = 'APELIDO'
    end
    object tEntSEXO: TSmallintField
      DisplayWidth = 12
      FieldName = 'SEXO'
    end
    object tEntDOCUMENTO: TStringField
      DisplayWidth = 17
      FieldName = 'DOCUMENTO'
      Size = 14
    end
    object tEntTELEFONE: TStringField
      DisplayWidth = 17
      FieldName = 'TELEFONE'
      Size = 14
    end
    object tEntCELULAR: TStringField
      DisplayWidth = 17
      FieldName = 'CELULAR'
      Size = 14
    end
    object tEntENDERECO: TStringField
      DisplayWidth = 84
      FieldName = 'ENDERECO'
      Size = 70
    end
    object tEntBAIRRO: TStringField
      DisplayWidth = 36
      FieldName = 'BAIRRO'
      Size = 30
    end
    object tEntESTADO: TStringField
      DisplayWidth = 36
      FieldName = 'ESTADO'
      Size = 30
    end
    object tEntCIDADE: TStringField
      DisplayWidth = 36
      FieldName = 'CIDADE'
      Size = 30
    end
    object tEntCEP: TStringField
      DisplayWidth = 12
      FieldName = 'CEP'
      Size = 10
    end
    object tEntPAIS: TStringField
      DisplayWidth = 36
      FieldName = 'PAIS'
      Size = 30
    end
    object tEntEMAIL: TStringField
      DisplayWidth = 60
      FieldName = 'EMAIL'
      Size = 50
    end
    object tEntNASCIMENTO: TDateTimeField
      DisplayWidth = 22
      FieldName = 'NASCIMENTO'
    end
    object tEntCADASTRO: TDateTimeField
      DisplayWidth = 22
      FieldName = 'CADASTRO'
    end
    object tEntULTIMAVISITA: TDateTimeField
      DisplayWidth = 22
      FieldName = 'ULTIMAVISITA'
    end
    object tEntENTIDADETIPO: TSmallintField
      DisplayWidth = 15
      FieldName = 'ENTIDADETIPO'
    end
    object tEntFUNCIONARIOLIMITE: TFloatField
      DisplayWidth = 21
      FieldName = 'FUNCIONARIOLIMITE'
    end
    object tEntCOBRARTIPO: TSmallintField
      DisplayWidth = 13
      FieldName = 'COBRARTIPO'
    end
    object tEntCOBRARVALORHORA: TFloatField
      DisplayWidth = 21
      FieldName = 'COBRARVALORHORA'
    end
    object tEntCOBRARCORTESIA: TIntegerField
      DisplayWidth = 19
      FieldName = 'COBRARCORTESIA'
    end
    object tEntSENHA: TStringField
      DisplayWidth = 60
      FieldName = 'SENHA'
      Size = 50
    end
    object tEntPROFISSAO: TStringField
      DisplayWidth = 36
      FieldName = 'PROFISSAO'
      Size = 30
    end
    object tEntBLOQUEADO: TIntegerField
      DisplayWidth = 13
      FieldName = 'BLOQUEADO'
    end
    object tEntMOTIVO: TStringField
      DisplayWidth = 240
      FieldName = 'MOTIVO'
      Size = 200
    end
    object tEntSALDO: TFloatField
      DisplayWidth = 12
      FieldName = 'SALDO'
    end
    object tEntBANCOHORA: TIntegerField
      DisplayWidth = 13
      FieldName = 'BANCOHORA'
    end
    object tEntMILHAGEM: TFloatField
      DisplayWidth = 12
      FieldName = 'MILHAGEM'
    end
    object tEntNOMEPAI: TStringField
      DisplayWidth = 60
      FieldName = 'NOMEPAI'
      Size = 50
    end
    object tEntNOMEMAE: TStringField
      DisplayWidth = 60
      FieldName = 'NOMEMAE'
      Size = 50
    end
    object tEntICQ: TStringField
      DisplayWidth = 18
      FieldName = 'ICQ'
      Size = 15
    end
    object tEntMSN: TStringField
      DisplayWidth = 60
      FieldName = 'MSN'
      Size = 50
    end
    object tEntESCOLA: TStringField
      DisplayWidth = 60
      FieldName = 'ESCOLA'
      Size = 50
    end
    object tEntESCOLAREGISTRO: TStringField
      DisplayWidth = 18
      FieldName = 'ESCOLAREGISTRO'
      Size = 15
    end
    object tEntAULAINICIO: TDateTimeField
      DisplayWidth = 22
      FieldName = 'AULAINICIO'
    end
    object tEntAULAFINAL: TDateTimeField
      DisplayWidth = 22
      FieldName = 'AULAFINAL'
    end
    object tEntAUTORIZACAOMENOR: TSmallintField
      DisplayWidth = 22
      FieldName = 'AUTORIZACAOMENOR'
    end
  end
end
