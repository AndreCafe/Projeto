object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Importar dados do CiberControl'
  ClientHeight = 352
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 17
    Top = 71
    Width = 270
    Height = 32
    Caption = 
      '- O NexServ N'#195'O pode estar em execu'#231#227'o'#13#10'- As senhas n'#227'o s'#227'o impo' +
      'rtadas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 17
    Top = 32
    Width = 306
    Height = 19
    Caption = 'Importar clientes do CIBER CONTROL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PB: TProgressBar
    Left = 0
    Top = 0
    Width = 535
    Height = 16
    Align = alTop
    TabOrder = 0
  end
  object Button1: TButton
    Left = 17
    Top = 134
    Width = 75
    Height = 25
    Caption = 'Importar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object nxSession1: TnxSession
    ServerEngine = nxSE
    Left = 16
    Top = 264
  end
  object nxDB: TnxDatabase
    Session = nxSession1
    AliasPath = 'c:\nexcafe\dados'
    Left = 56
    Top = 264
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'Cliente'
    Exclusive = True
    IndexName = 'IID'
    Left = 16
    Top = 304
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
    object tCliCotaImpEspecial: TBooleanField
      FieldName = 'CotaImpEspecial'
    end
    object tCliCotaImpDia: TIntegerField
      FieldName = 'CotaImpDia'
    end
    object tCliCotaImpMes: TIntegerField
      FieldName = 'CotaImpMes'
    end
    object tCliSemFidelidade: TBooleanField
      FieldName = 'SemFidelidade'
    end
    object tCliCHorario: TIntegerField
      FieldName = 'CHorario'
    end
    object tCliOpCHorario: TWordField
      FieldName = 'OpCHorario'
    end
    object tCliFornecedor: TBooleanField
      FieldName = 'Fornecedor'
    end
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1:16200'
    Left = 96
    Top = 264
  end
  object nxSE: TnxServerEngine
    ServerName = 'Nextar'
    Options = []
    TableExtension = 'nx1'
    Left = 56
    Top = 304
  end
  object DataSource1: TDataSource
    DataSet = tF
    Left = 96
    Top = 304
  end
  object nxDB2: TnxDatabase
    Session = nxSession1
    AliasPath = 'c:\nexcafe'
    Left = 16
    Top = 216
  end
  object tF: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Cuentas'
    Left = 48
    Top = 184
    object tFLogin: TWideStringField
      FieldName = 'Login'
      Size = 10
    end
    object tFAlta: TDateTimeField
      FieldName = 'Alta'
    end
    object tFAviso: TWideStringField
      FieldName = 'Aviso'
      Size = 100
    end
    object tFCheckAviso: TBooleanField
      FieldName = 'CheckAviso'
    end
    object tFBloquear: TBooleanField
      FieldName = 'Bloquear'
    end
    object tFcredito: TBCDField
      FieldName = 'credito'
      Precision = 19
    end
    object tFDesactivada: TBooleanField
      FieldName = 'Desactivada'
    end
    object tFDescuento: TSmallintField
      FieldName = 'Descuento'
    end
    object tFDir: TWideStringField
      FieldName = 'Dir'
      Size = 100
    end
    object tFIntropass: TBooleanField
      FieldName = 'Intropass'
    end
    object tFNombre: TWideStringField
      FieldName = 'Nombre'
      Size = 100
    end
    object tFNomodpass: TBooleanField
      FieldName = 'Nomodpass'
    end
    object tFPass: TWideStringField
      FieldName = 'Pass'
      Size = 10
    end
    object tFTarifa: TWideStringField
      FieldName = 'Tarifa'
    end
    object tFTelf: TWideStringField
      FieldName = 'Telf'
    end
    object tFTipo: TWideStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object tFUltima: TDateTimeField
      FieldName = 'Ultima'
    end
    object tFObservaciones: TWideMemoField
      FieldName = 'Observaciones'
      BlobType = ftWideMemo
    end
    object tFBonotiempo: TIntegerField
      FieldName = 'Bonotiempo'
    end
    object tFescritorio: TWordField
      FieldName = 'escritorio'
    end
    object tFemail: TWideStringField
      FieldName = 'email'
      Size = 255
    end
    object tFfoto: TWideStringField
      FieldName = 'foto'
      Size = 150
    end
    object tFCP: TWideStringField
      FieldName = 'CP'
      Size = 10
    end
    object tFLocalidad: TWideStringField
      FieldName = 'Localidad'
      Size = 50
    end
    object tFProvincia: TWideStringField
      FieldName = 'Provincia'
      Size = 40
    end
    object tFfecha_nac: TDateTimeField
      FieldName = 'fecha_nac'
    end
    object tFEdad: TIntegerField
      FieldName = 'Edad'
    end
    object tFDNI: TWideStringField
      FieldName = 'DNI'
      Size = 15
    end
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;Password="";User ID=Admin;Data' +
      ' Source=c:\nexcafe\ciber.mdb;Mode=Read;Extended Properties="";Je' +
      't OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:' +
      'Database Password=fad0001;Jet OLEDB:Engine Type=5;Jet OLEDB:Data' +
      'base Locking Mode=0;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLED' +
      'B:Global Bulk Transactions=1;Jet OLEDB:New Database Password="";' +
      'Jet OLEDB:Create System Database=False;Jet OLEDB:Encrypt Databas' +
      'e=False;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:C' +
      'ompact Without Replica Repair=False;Jet OLEDB:SFP=False;Jet OLED' +
      'B:Support Complex Data=False'
    LoginPrompt = False
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 16
    Top = 184
  end
  object DataSource2: TDataSource
    Left = 48
    Top = 432
  end
end
