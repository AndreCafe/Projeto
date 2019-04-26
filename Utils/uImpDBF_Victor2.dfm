object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Importar DBF'
  ClientHeight = 513
  ClientWidth = 1100
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
    Width = 1100
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
    Top = 328
    Width = 1100
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
  object Button2: TButton
    Left = 520
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 3
    OnClick = Button2Click
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
  object tF: TTable
    Active = True
    DatabaseName = 'c:\meus programas\nexcafe\victor'
    TableName = 'CLIENTES.DBF'
    Left = 96
    Top = 144
    object tFCODIGO: TFloatField
      FieldName = 'CODIGO'
    end
    object tFINCLUSAO: TDateField
      FieldName = 'INCLUSAO'
    end
    object tFNOME: TStringField
      FieldName = 'NOME'
      Size = 35
    end
    object tFNASCIMENTO: TDateField
      FieldName = 'NASCIMENTO'
    end
    object tFNACIONALID: TStringField
      FieldName = 'NACIONALID'
      Size = 15
    end
    object tFNATURALIDA: TStringField
      FieldName = 'NATURALIDA'
      Size = 25
    end
    object tFPROFISSAO: TStringField
      FieldName = 'PROFISSAO'
    end
    object tFRG: TStringField
      FieldName = 'RG'
      Size = 12
    end
    object tFCPF: TStringField
      FieldName = 'CPF'
      Size = 15
    end
    object tFENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 35
    end
    object tFBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 15
    end
    object tFCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object tFTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 16
    end
    object tFCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 25
    end
    object tFUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tFENDCOM: TStringField
      FieldName = 'ENDCOM'
      Size = 35
    end
    object tFBAIRROCOM: TStringField
      FieldName = 'BAIRROCOM'
      Size = 15
    end
    object tFCEPCOM: TStringField
      FieldName = 'CEPCOM'
      Size = 9
    end
    object tFCIDADECOM: TStringField
      FieldName = 'CIDADECOM'
      Size = 25
    end
    object tFTELCOM: TStringField
      FieldName = 'TELCOM'
      Size = 16
    end
    object tFUF_COMERCI: TStringField
      FieldName = 'UF_COMERCI'
      Size = 2
    end
    object tFLIBERADO: TBooleanField
      FieldName = 'LIBERADO'
    end
    object tFLOGADO: TBooleanField
      FieldName = 'LOGADO'
    end
    object tFINICIO: TDateField
      FieldName = 'INICIO'
    end
    object tFHORA: TDateField
      FieldName = 'HORA'
    end
    object tFESTIMADO: TFloatField
      FieldName = 'ESTIMADO'
    end
    object tFJOGADAS: TFloatField
      FieldName = 'JOGADAS'
    end
    object tFGRATIS: TFloatField
      FieldName = 'GRATIS'
    end
    object tFSENHA: TStringField
      FieldName = 'SENHA'
      Size = 8
    end
    object tFDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 250
    end
    object tFMAIL: TStringField
      FieldName = 'MAIL'
      Size = 100
    end
    object tFICQ: TStringField
      FieldName = 'ICQ'
    end
    object tFVISITA: TDateField
      FieldName = 'VISITA'
    end
    object tFNICK: TStringField
      FieldName = 'NICK'
      Size = 50
    end
    object tFSENSIBILID: TFloatField
      FieldName = 'SENSIBILID'
    end
    object tFFRENTE: TStringField
      FieldName = 'FRENTE'
    end
    object tFTRAS: TStringField
      FieldName = 'TRAS'
    end
    object tFDIREITA: TStringField
      FieldName = 'DIREITA'
    end
    object tFESQUERDA: TStringField
      FieldName = 'ESQUERDA'
    end
    object tFGIRARDIREI: TStringField
      FieldName = 'GIRARDIREI'
    end
    object tFGIRARESQUE: TStringField
      FieldName = 'GIRARESQUE'
    end
    object tFAGACHAR: TStringField
      FieldName = 'AGACHAR'
    end
    object tFLENTO: TStringField
      FieldName = 'LENTO'
    end
    object tFPULAR: TStringField
      FieldName = 'PULAR'
    end
    object tFATIRAR: TStringField
      FieldName = 'ATIRAR'
    end
    object tFZOMM: TStringField
      FieldName = 'ZOMM'
    end
    object tFTROCA: TStringField
      FieldName = 'TROCA'
    end
    object tFARMA1: TStringField
      FieldName = 'ARMA1'
    end
    object tFARMA2: TStringField
      FieldName = 'ARMA2'
    end
    object tFARMA3: TStringField
      FieldName = 'ARMA3'
    end
    object tFARMA4: TStringField
      FieldName = 'ARMA4'
    end
    object tFARMA5: TStringField
      FieldName = 'ARMA5'
    end
    object tFRECARREGAR: TStringField
      FieldName = 'RECARREGAR'
    end
    object tFITENS: TStringField
      FieldName = 'ITENS'
    end
    object tFLANTERNA: TStringField
      FieldName = 'LANTERNA'
    end
    object tFSPRAY: TStringField
      FieldName = 'SPRAY'
    end
    object tFCHAT1: TStringField
      FieldName = 'CHAT1'
    end
    object tFCHAT2: TStringField
      FieldName = 'CHAT2'
    end
    object tFPRIVILEGIO: TFloatField
      FieldName = 'PRIVILEGIO'
    end
    object tFFUNC2: TFloatField
      FieldName = 'FUNC2'
    end
    object tFLOGOF: TBooleanField
      FieldName = 'LOGOF'
    end
    object tFDATAOF: TDateField
      FieldName = 'DATAOF'
    end
    object tFHORAOF: TDateField
      FieldName = 'HORAOF'
    end
    object tFBLOQUEADO: TBooleanField
      FieldName = 'BLOQUEADO'
    end
    object tFMOTIVO: TMemoField
      FieldName = 'MOTIVO'
      BlobType = ftMemo
      Size = 1
    end
    object tFFUNC3: TFloatField
      FieldName = 'FUNC3'
    end
    object tFMODOACESSO: TFloatField
      FieldName = 'MODOACESSO'
    end
    object tFHORASPRE: TFloatField
      FieldName = 'HORASPRE'
    end
    object tFFECHAMENTO: TBooleanField
      FieldName = 'FECHAMENTO'
    end
    object tFVIP: TBooleanField
      FieldName = 'VIP'
    end
    object tFLIMITE: TFloatField
      FieldName = 'LIMITE'
    end
    object tFFUNC: TStringField
      FieldName = 'FUNC'
      Size = 100
    end
    object tFPACOTE: TBooleanField
      FieldName = 'PACOTE'
    end
    object tFIDPACOTE: TFloatField
      FieldName = 'IDPACOTE'
    end
    object tFADMINISTRA: TBooleanField
      FieldName = 'ADMINISTRA'
    end
    object tFALTERADO: TBooleanField
      FieldName = 'ALTERADO'
    end
    object tFUSANDOPRE: TBooleanField
      FieldName = 'USANDOPRE'
    end
    object tFID_TARIFA: TFloatField
      FieldName = 'ID_TARIFA'
    end
    object tFLIBERADOPO: TBooleanField
      FieldName = 'LIBERADOPO'
    end
    object tFCONVENIO: TFloatField
      FieldName = 'CONVENIO'
    end
    object tFAVISADO: TBooleanField
      FieldName = 'AVISADO'
    end
    object tFSEMPRELOGA: TBooleanField
      FieldName = 'SEMPRELOGA'
    end
    object tFMASCULINO: TBooleanField
      FieldName = 'MASCULINO'
    end
    object tFLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 50
    end
    object tFGRUPOTARIF: TFloatField
      FieldName = 'GRUPOTARIF'
    end
  end
  object tH: TTable
    Active = True
    DatabaseName = 'c:\meus programas\nexcafe\victor'
    TableName = 'HORASCLI.DBF'
    Left = 184
    Top = 144
    object tHTARIFA: TFloatField
      FieldName = 'TARIFA'
    end
    object tHCLIENTE: TFloatField
      FieldName = 'CLIENTE'
    end
    object tHHORAS: TFloatField
      FieldName = 'HORAS'
    end
  end
end
