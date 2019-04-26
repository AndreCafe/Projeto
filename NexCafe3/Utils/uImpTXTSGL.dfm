object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Importar TXT SGL'
  ClientHeight = 336
  ClientWidth = 426
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
    Width = 426
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
  object nxSession1: TnxSession
    ActiveDesigntime = True
    ServerEngine = nxSE
    Left = 24
    Top = 24
  end
  object nxDB: TnxDatabase
    ActiveDesigntime = True
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
    ActiveDesigntime = True
    ServerName = 'Nextar'
    Options = []
    Left = 64
    Top = 64
  end
  object nxQuery1: TnxQuery
    Left = 104
    Top = 64
  end
  object nxDatabase1: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession1
    AliasPath = 'c:\meus programas\nexcafe'
    Left = 272
    Top = 96
  end
  object tF: TnxTable
    Database = nxDatabase1
    TableName = 'CLIENTES'
    Left = 320
    Top = 48
    object tFCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tFLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 15
    end
    object tFSENHA: TStringField
      FieldName = 'SENHA'
      Size = 10
    end
    object tFNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object tFDATANASC: TDateTimeField
      FieldName = 'DATANASC'
    end
    object tFENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object tFNUM: TStringField
      FieldName = 'NUM'
      Size = 5
    end
    object tFCOMPL: TStringField
      FieldName = 'COMPL'
    end
    object tFBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 25
    end
    object tFCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object tFCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object tFUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tFDATACAD: TDateTimeField
      FieldName = 'DATACAD'
    end
    object tFNIVEL: TStringField
      FieldName = 'NIVEL'
      Size = 1
    end
    object tFEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 30
    end
    object tFSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object tFEDITAR: TStringField
      FieldName = 'EDITAR'
      Size = 1
    end
    object tFTIPO: TStringField
      FieldName = 'TIPO'
      Size = 15
    end
    object tFDESCONTO: TStringField
      FieldName = 'DESCONTO'
      Size = 5
    end
    object tFTEMPODESCONTO: TIntegerField
      FieldName = 'TEMPODESCONTO'
    end
    object tFTEMPOJOGO: TIntegerField
      FieldName = 'TEMPOJOGO'
    end
    object tFMONETARIO: TFloatField
      FieldName = 'MONETARIO'
    end
    object tFTEMPOCOMPRADO: TIntegerField
      FieldName = 'TEMPOCOMPRADO'
    end
    object tFCODBARRA: TStringField
      FieldName = 'CODBARRA'
    end
    object tFFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object tFCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 15
    end
    object tFTIPOCLIENTE: TStringField
      FieldName = 'TIPOCLIENTE'
    end
    object tFATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object tFBILHETE: TStringField
      FieldName = 'BILHETE'
      Size = 1
    end
    object tFRG: TStringField
      FieldName = 'RG'
    end
    object tFCPF: TStringField
      FieldName = 'CPF'
    end
    object tFICQ: TStringField
      FieldName = 'ICQ'
      Size = 10
    end
    object tFEMAIL2: TStringField
      FieldName = 'EMAIL2'
      Size = 30
    end
    object tFESTUDANTE: TStringField
      FieldName = 'ESTUDANTE'
      Size = 1
    end
    object tFSERIE: TStringField
      FieldName = 'SERIE'
    end
    object tFPERIODO: TStringField
      FieldName = 'PERIODO'
      Size = 10
    end
    object tFESCOLA: TStringField
      FieldName = 'ESCOLA'
      Size = 30
    end
    object tFDEL: TStringField
      FieldName = 'DEL'
      Size = 1
    end
    object tFIMPRIMIU: TStringField
      FieldName = 'IMPRIMIU'
      Size = 1
    end
    object tFLOTE: TIntegerField
      FieldName = 'LOTE'
    end
    object tFVALORBILHETE: TFloatField
      FieldName = 'VALORBILHETE'
    end
    object tFNOMEPAI: TStringField
      FieldName = 'NOMEPAI'
      Size = 40
    end
    object tFNOMEMAE: TStringField
      FieldName = 'NOMEMAE'
      Size = 40
    end
    object tFHORAINI: TStringField
      FieldName = 'HORAINI'
      Size = 5
    end
    object tFHORAFIM: TStringField
      FieldName = 'HORAFIM'
      Size = 5
    end
    object tFDATAGANHOUVIP: TDateTimeField
      FieldName = 'DATAGANHOUVIP'
    end
    object tFBONUSVALOR: TFloatField
      FieldName = 'BONUSVALOR'
    end
    object tFLIMITECREDITO: TFloatField
      FieldName = 'LIMITECREDITO'
    end
    object tFFORMAPOS: TStringField
      FieldName = 'FORMAPOS'
      Size = 1
    end
    object tFGANHOUANIVER: TDateTimeField
      FieldName = 'GANHOUANIVER'
    end
  end
end
