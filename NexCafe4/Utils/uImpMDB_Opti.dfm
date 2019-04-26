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
    DataSet = tF
    Left = 360
    Top = 80
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
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;User ID=Admin;Data Source=c:\m' +
      'eus programas\nexcafe\cyber.mdb;Mode=Read;Persist Security Info=' +
      'False;Jet OLEDB:System database="";Jet OLEDB:Registry Path="";Je' +
      't OLEDB:Database Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:D' +
      'atabase Locking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet O' +
      'LEDB:Global Bulk Transactions=1;Jet OLEDB:New Database Password=' +
      '"";Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Data' +
      'base=False;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLED' +
      'B:Compact Without Replica Repair=False;Jet OLEDB:SFP=False;Jet O' +
      'LEDB:Support Complex Data=False'
    LoginPrompt = False
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 216
    Top = 304
  end
  object tF: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Usuarios'
    Left = 352
    Top = 344
    object tFobjUsuario: TAutoIncField
      FieldName = 'objUsuario'
      ReadOnly = True
    end
    object tFsLogin: TWideStringField
      FieldName = 'sLogin'
    end
    object tFsNome: TWideStringField
      FieldName = 'sNome'
      Size = 15
    end
    object tFsSobrenome: TWideStringField
      FieldName = 'sSobrenome'
      Size = 50
    end
    object tFsEndereco: TWideStringField
      FieldName = 'sEndereco'
      Size = 100
    end
    object tFsBairro: TWideStringField
      FieldName = 'sBairro'
      Size = 50
    end
    object tFsCidade: TWideStringField
      FieldName = 'sCidade'
      Size = 50
    end
    object tFiCep: TIntegerField
      FieldName = 'iCep'
    end
    object tFsSenha: TWideStringField
      FieldName = 'sSenha'
      Size = 10
    end
    object tFdCadastro: TDateTimeField
      FieldName = 'dCadastro'
    end
    object tFiTelefoneDDD: TSmallintField
      FieldName = 'iTelefoneDDD'
    end
    object tFiTelefone: TIntegerField
      FieldName = 'iTelefone'
    end
    object tFbStatus: TBooleanField
      FieldName = 'bStatus'
    end
    object tFiAcessos: TIntegerField
      FieldName = 'iAcessos'
    end
    object tFmDebito: TBCDField
      FieldName = 'mDebito'
      Precision = 19
    end
    object tFsObs: TWideMemoField
      FieldName = 'sObs'
      BlobType = ftWideMemo
    end
    object tFsEmail: TWideStringField
      FieldName = 'sEmail'
      Size = 50
    end
    object tFbCortesia: TBooleanField
      FieldName = 'bCortesia'
    end
    object tFbPosPago: TBooleanField
      FieldName = 'bPosPago'
    end
    object tFbTicket: TBooleanField
      FieldName = 'bTicket'
    end
    object tFiDias: TIntegerField
      FieldName = 'iDias'
    end
    object tFiDesc: TIntegerField
      FieldName = 'iDesc'
    end
    object tFmValorDif: TBCDField
      FieldName = 'mValorDif'
      Precision = 19
    end
    object tFsIdentidade: TWideStringField
      FieldName = 'sIdentidade'
    end
    object tFdDataNasc: TDateTimeField
      FieldName = 'dDataNasc'
    end
    object tFobjFuncionario: TIntegerField
      FieldName = 'objFuncionario'
    end
    object tFbLockUser: TBooleanField
      FieldName = 'bLockUser'
    end
    object tFsPai: TWideStringField
      FieldName = 'sPai'
      Size = 100
    end
    object tFsMae: TWideStringField
      FieldName = 'sMae'
      Size = 100
    end
    object tFsEscola: TWideStringField
      FieldName = 'sEscola'
      Size = 100
    end
    object tFsHorario1: TWideStringField
      FieldName = 'sHorario1'
      Size = 8
    end
    object tFsHorario2: TWideStringField
      FieldName = 'sHorario2'
      Size = 8
    end
  end
  object tTempo: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'TempoAgendado'
    Left = 480
    Top = 304
    object tTempoobjUsuario: TIntegerField
      FieldName = 'objUsuario'
    end
    object tTemposTempoEstimado: TWideStringField
      FieldName = 'sTempoEstimado'
      Size = 50
    end
    object tTempodInicio: TDateTimeField
      FieldName = 'dInicio'
    end
    object tTempodFim: TDateTimeField
      FieldName = 'dFim'
    end
    object tTempobCrashServer: TBooleanField
      FieldName = 'bCrashServer'
    end
  end
  object qMov: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'select * from Movimentacao'
      
        'where (objUsuario =151) and (bAgendado = true) and (bAtivo = Fal' +
        'se)')
    Left = 552
    Top = 200
    object qMovobjUsuario: TIntegerField
      FieldName = 'objUsuario'
    end
    object qMovobjMaquina: TIntegerField
      FieldName = 'objMaquina'
    end
    object qMovdEntrada: TDateTimeField
      FieldName = 'dEntrada'
    end
    object qMovdSaida: TDateTimeField
      FieldName = 'dSaida'
    end
    object qMovbAtivo: TBooleanField
      FieldName = 'bAtivo'
    end
    object qMovbFechado: TBooleanField
      FieldName = 'bFechado'
    end
    object qMovbAgendado: TBooleanField
      FieldName = 'bAgendado'
    end
    object qMovbCrashServer: TBooleanField
      FieldName = 'bCrashServer'
    end
    object qMovbFragNight: TBooleanField
      FieldName = 'bFragNight'
    end
  end
end
