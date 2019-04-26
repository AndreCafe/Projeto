object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Importar DBF'
  ClientHeight = 470
  ClientWidth = 841
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
    Width = 841
    Height = 16
    Align = alTop
    TabOrder = 0
  end
  object Button1: TButton
    Left = 0
    Top = 16
    Width = 841
    Height = 25
    Align = alTop
    Caption = 'Importar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 0
    Top = 61
    Width = 841
    Height = 409
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
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
    DataSet = tTempo
    Left = 360
    Top = 80
  end
  object tTempo: TDbf
    FilePath = 'C:\Meus Programas\NexCafe\opti\'
    IndexDefs = <>
    TableName = 'TEMPOAGE.DBF'
    TableLevel = 4
    Active = True
    Left = 472
    Top = 64
    object tTempoOBJUSUARIO: TFloatField
      FieldName = 'OBJUSUARIO'
    end
    object tTempoSTEMPOESTI: TStringField
      FieldName = 'STEMPOESTI'
      Size = 50
    end
    object tTempoDINICIO: TDateField
      FieldName = 'DINICIO'
    end
    object tTempoDFIM: TDateField
      FieldName = 'DFIM'
    end
    object tTempoBCRASHSERV: TBooleanField
      FieldName = 'BCRASHSERV'
    end
  end
  object tF: TDbf
    FilePath = 'C:\Meus Programas\NexCafe\opti\'
    IndexDefs = <
      item
        IndexFile = 'IDIASVALID'
        SortField = 'IDIAS'
        Options = [ixExpression]
      end
      item
        IndexFile = 'PRIMARYKEY'
        SortField = 'OBJUSUARIO'
        Options = [ixExpression]
      end>
    TableName = 'USUARIOS.DBF'
    TableLevel = 4
    Left = 152
    Top = 192
    object tFOBJUSUARIO: TFloatField
      FieldName = 'OBJUSUARIO'
    end
    object tFSLOGIN: TStringField
      FieldName = 'SLOGIN'
    end
    object tFSNOME: TStringField
      FieldName = 'SNOME'
      Size = 15
    end
    object tFSSOBRENOME: TStringField
      FieldName = 'SSOBRENOME'
      Size = 50
    end
    object tFSENDERECO: TStringField
      FieldName = 'SENDERECO'
      Size = 100
    end
    object tFSBAIRRO: TStringField
      FieldName = 'SBAIRRO'
      Size = 50
    end
    object tFSCIDADE: TStringField
      FieldName = 'SCIDADE'
      Size = 50
    end
    object tFICEP: TFloatField
      FieldName = 'ICEP'
    end
    object tFSSENHA: TStringField
      FieldName = 'SSENHA'
      Size = 10
    end
    object tFDCADASTRO: TDateField
      FieldName = 'DCADASTRO'
    end
    object tFITELEFONED: TFloatField
      FieldName = 'ITELEFONED'
    end
    object tFITELEFONE: TFloatField
      FieldName = 'ITELEFONE'
    end
    object tFBSTATUS: TBooleanField
      FieldName = 'BSTATUS'
    end
    object tFIACESSOS: TFloatField
      FieldName = 'IACESSOS'
    end
    object tFMDEBITO: TFloatField
      FieldName = 'MDEBITO'
    end
    object tFSOBS: TMemoField
      FieldName = 'SOBS'
      BlobType = ftMemo
    end
    object tFSEMAIL: TStringField
      FieldName = 'SEMAIL'
      Size = 50
    end
    object tFBCORTESIA: TBooleanField
      FieldName = 'BCORTESIA'
    end
    object tFBPOSPAGO: TBooleanField
      FieldName = 'BPOSPAGO'
    end
    object tFBTICKET: TBooleanField
      FieldName = 'BTICKET'
    end
    object tFIDIAS: TFloatField
      FieldName = 'IDIAS'
    end
    object tFIDESC: TFloatField
      FieldName = 'IDESC'
    end
    object tFMVALORDIF: TFloatField
      FieldName = 'MVALORDIF'
    end
    object tFSIDENTIDAD: TStringField
      FieldName = 'SIDENTIDAD'
    end
    object tFDDATANASC: TDateField
      FieldName = 'DDATANASC'
    end
    object tFOBJFUNCION: TFloatField
      FieldName = 'OBJFUNCION'
    end
    object tFBLOCKUSER: TBooleanField
      FieldName = 'BLOCKUSER'
    end
    object tFSPAI: TStringField
      FieldName = 'SPAI'
      Size = 100
    end
    object tFSMAE: TStringField
      FieldName = 'SMAE'
      Size = 100
    end
    object tFSESCOLA: TStringField
      FieldName = 'SESCOLA'
      Size = 100
    end
    object tFSHORARIO1: TStringField
      FieldName = 'SHORARIO1'
      Size = 8
    end
    object tFSHORARIO2: TStringField
      FieldName = 'SHORARIO2'
      Size = 8
    end
  end
  object Database1: TDatabase
    DatabaseName = 'c:\meus programas\nexcafe\cyber.mdb'
    DriverName = 'MSACCESS'
    Exclusive = True
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=')
    SessionName = 'Default'
    Left = 344
    Top = 216
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=c:\meus programas\' +
      'nexcafe\cyber.mdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 216
    Top = 304
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Usuarios'
    Left = 352
    Top = 344
    object ADOTable1objUsuario: TAutoIncField
      FieldName = 'objUsuario'
      ReadOnly = True
    end
    object ADOTable1sLogin: TWideStringField
      FieldName = 'sLogin'
    end
    object ADOTable1sNome: TWideStringField
      FieldName = 'sNome'
      Size = 15
    end
    object ADOTable1sSobrenome: TWideStringField
      FieldName = 'sSobrenome'
      Size = 50
    end
    object ADOTable1sEndereco: TWideStringField
      FieldName = 'sEndereco'
      Size = 100
    end
    object ADOTable1sBairro: TWideStringField
      FieldName = 'sBairro'
      Size = 50
    end
    object ADOTable1sCidade: TWideStringField
      FieldName = 'sCidade'
      Size = 50
    end
    object ADOTable1iCep: TIntegerField
      FieldName = 'iCep'
    end
    object ADOTable1sSenha: TWideStringField
      FieldName = 'sSenha'
      Size = 10
    end
    object ADOTable1dCadastro: TDateTimeField
      FieldName = 'dCadastro'
    end
    object ADOTable1iTelefoneDDD: TSmallintField
      FieldName = 'iTelefoneDDD'
    end
    object ADOTable1iTelefone: TIntegerField
      FieldName = 'iTelefone'
    end
    object ADOTable1bStatus: TBooleanField
      FieldName = 'bStatus'
    end
    object ADOTable1iAcessos: TIntegerField
      FieldName = 'iAcessos'
    end
    object ADOTable1mDebito: TBCDField
      FieldName = 'mDebito'
      Precision = 19
    end
    object ADOTable1sObs: TWideMemoField
      FieldName = 'sObs'
      BlobType = ftWideMemo
    end
    object ADOTable1sEmail: TWideStringField
      FieldName = 'sEmail'
      Size = 50
    end
    object ADOTable1bCortesia: TBooleanField
      FieldName = 'bCortesia'
    end
    object ADOTable1bPosPago: TBooleanField
      FieldName = 'bPosPago'
    end
    object ADOTable1bTicket: TBooleanField
      FieldName = 'bTicket'
    end
    object ADOTable1iDias: TIntegerField
      FieldName = 'iDias'
    end
    object ADOTable1iDesc: TIntegerField
      FieldName = 'iDesc'
    end
    object ADOTable1mValorDif: TBCDField
      FieldName = 'mValorDif'
      Precision = 19
    end
    object ADOTable1sIdentidade: TWideStringField
      FieldName = 'sIdentidade'
    end
    object ADOTable1dDataNasc: TDateTimeField
      FieldName = 'dDataNasc'
    end
    object ADOTable1objFuncionario: TIntegerField
      FieldName = 'objFuncionario'
    end
    object ADOTable1bLockUser: TBooleanField
      FieldName = 'bLockUser'
    end
    object ADOTable1sPai: TWideStringField
      FieldName = 'sPai'
      Size = 100
    end
    object ADOTable1sMae: TWideStringField
      FieldName = 'sMae'
      Size = 100
    end
    object ADOTable1sEscola: TWideStringField
      FieldName = 'sEscola'
      Size = 100
    end
    object ADOTable1sHorario1: TWideStringField
      FieldName = 'sHorario1'
      Size = 8
    end
    object ADOTable1sHorario2: TWideStringField
      FieldName = 'sHorario2'
      Size = 8
    end
  end
  object ADOTable2: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'TempoAgendado'
    Left = 480
    Top = 304
    object ADOTable2objUsuario: TIntegerField
      FieldName = 'objUsuario'
    end
    object ADOTable2sTempoEstimado: TWideStringField
      FieldName = 'sTempoEstimado'
      Size = 50
    end
    object ADOTable2dInicio: TDateTimeField
      FieldName = 'dInicio'
    end
    object ADOTable2dFim: TDateTimeField
      FieldName = 'dFim'
    end
    object ADOTable2bCrashServer: TBooleanField
      FieldName = 'bCrashServer'
    end
  end
end
