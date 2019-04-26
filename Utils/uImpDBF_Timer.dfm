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
    Left = 432
    Top = 62
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
  object tCA: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Codigo_Acesso'
    Left = 544
    Top = 288
    object tCACodigo_Acesso: TWideStringField
      FieldName = 'Codigo_Acesso'
      Size = 12
    end
    object tCAstatus: TWideStringField
      FieldName = 'status'
      Size = 1
    end
    object tCAValor_Disponivel: TWideStringField
      FieldName = 'Valor_Disponivel'
      Size = 8
    end
    object tCAData_Criacao: TWideStringField
      FieldName = 'Data_Criacao'
      Size = 10
    end
    object tCAURL: TWideStringField
      FieldName = 'URL'
      Size = 255
    end
    object tCATipo_Codigo: TWideStringField
      FieldName = 'Tipo_Codigo'
      Size = 1
    end
    object tCAVendido: TBooleanField
      FieldName = 'Vendido'
    end
    object tCAVinculado: TBooleanField
      FieldName = 'Vinculado'
    end
    object tCAStatusRecarga: TWideStringField
      FieldName = 'StatusRecarga'
      Size = 1
    end
  end
  object tVC: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Venda_Codigos'
    Left = 480
    Top = 304
    object tVCCodigo: TFloatField
      FieldName = 'Codigo'
    end
    object tVCData: TWideStringField
      FieldName = 'Data'
      Size = 10
    end
    object tVCHora: TWideStringField
      FieldName = 'Hora'
      Size = 8
    end
    object tVCCodigo_Acesso: TWideStringField
      FieldName = 'Codigo_Acesso'
      Size = 12
    end
    object tVCNome: TWideStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tVCNick: TWideStringField
      FieldName = 'Nick'
      Size = 35
    end
    object tVCValor: TWideStringField
      FieldName = 'Valor'
      Size = 8
    end
    object tVCRecarregamento: TBooleanField
      FieldName = 'Recarregamento'
    end
    object tVCAvulsa: TBooleanField
      FieldName = 'Avulsa'
    end
    object tVCDesconto: TWideStringField
      FieldName = 'Desconto'
      Size = 12
    end
    object tVCMotivo_Desconto: TWideStringField
      FieldName = 'Motivo_Desconto'
      Size = 30
    end
    object tVCID_Caixa: TFloatField
      FieldName = 'ID_Caixa'
    end
  end
  object tF: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Clientes'
    Left = 352
    Top = 344
    object tFCodigo: TFloatField
      FieldName = 'Codigo'
    end
    object tFNome: TWideStringField
      FieldName = 'Nome'
      Size = 50
    end
    object tFData_Nasc: TWideStringField
      FieldName = 'Data_Nasc'
      Size = 10
    end
    object tFRua: TWideStringField
      FieldName = 'Rua'
      Size = 33
    end
    object tFNumero: TWideStringField
      FieldName = 'Numero'
      Size = 6
    end
    object tFComplemento: TWideStringField
      FieldName = 'Complemento'
      Size = 13
    end
    object tFBairro: TWideStringField
      FieldName = 'Bairro'
      Size = 33
    end
    object tFCidade: TWideStringField
      FieldName = 'Cidade'
      Size = 33
    end
    object tFUF: TWideStringField
      FieldName = 'UF'
      Size = 2
    end
    object tFTel_Residencial: TWideStringField
      FieldName = 'Tel_Residencial'
      Size = 17
    end
    object tFTel_Comercial: TWideStringField
      FieldName = 'Tel_Comercial'
      Size = 17
    end
    object tFTel_Celular: TWideStringField
      FieldName = 'Tel_Celular'
      Size = 17
    end
    object tFE_mail: TWideStringField
      FieldName = 'E_mail'
      Size = 60
    end
    object tFObs: TWideMemoField
      FieldName = 'Obs'
      BlobType = ftWideMemo
    end
    object tFCEP: TWideStringField
      FieldName = 'CEP'
      Size = 10
    end
    object tFGrupo: TWideStringField
      FieldName = 'Grupo'
      Size = 30
    end
    object tFNick: TWideStringField
      FieldName = 'Nick'
      Size = 35
    end
    object tFFiliacao: TWideStringField
      FieldName = 'Filiacao'
      Size = 255
    end
    object tFDocumento: TWideStringField
      FieldName = 'Documento'
      Size = 30
    end
    object tFAutorizado: TBooleanField
      FieldName = 'Autorizado'
    end
    object tFIDADE: TSmallintField
      FieldName = 'IDADE'
    end
    object tFCaminhoFoto: TWideStringField
      FieldName = 'CaminhoFoto'
      Size = 255
    end
    object tFMsgObs: TBooleanField
      FieldName = 'MsgObs'
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;Password="";User ID=Admin;Data' +
      ' Source=c:\meus programas\nexcafe\timercafe.mdb;Mode=Read;Extend' +
      'ed Properties="";Jet OLEDB:System database="";Jet OLEDB:Registry' +
      ' Path="";Jet OLEDB:Database Password=fad0001;Jet OLEDB:Engine Ty' +
      'pe=5;Jet OLEDB:Database Locking Mode=0;Jet OLEDB:Global Partial ' +
      'Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New Da' +
      'tabase Password="";Jet OLEDB:Create System Database=False;Jet OL' +
      'EDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on Compac' +
      't=False;Jet OLEDB:Compact Without Replica Repair=False;Jet OLEDB' +
      ':SFP=False;Jet OLEDB:Support Complex Data=False'
    LoginPrompt = False
    Mode = cmRead
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 216
    Top = 304
  end
end
