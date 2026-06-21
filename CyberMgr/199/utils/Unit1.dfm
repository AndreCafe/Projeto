object Form1: TForm1
  Left = 234
  Top = 217
  Width = 522
  Height = 244
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 128
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 24
    Width = 129
    Height = 25
    Caption = 'Importar'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object F: TSQLTable
    Active = True
    IndexName = 'CLIENTES_COD'
    MaxBlobSize = -1
    SQLConnection = SQLConnection1
    TableName = 'CLIENTES'
    Left = 136
    Top = 56
    object FCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object FLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 15
    end
    object FSENHA: TStringField
      FieldName = 'SENHA'
      Size = 10
    end
    object FNOME: TStringField
      FieldName = 'NOME'
      Size = 40
    end
    object FDATANASC: TSQLTimeStampField
      FieldName = 'DATANASC'
    end
    object FENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 40
    end
    object FNUM: TStringField
      FieldName = 'NUM'
      Size = 5
    end
    object FCOMPL: TStringField
      FieldName = 'COMPL'
    end
    object FBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 25
    end
    object FCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object FCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object FUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object FDATACAD: TSQLTimeStampField
      FieldName = 'DATACAD'
    end
    object FNIVEL: TStringField
      FieldName = 'NIVEL'
      FixedChar = True
      Size = 1
    end
    object FEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 30
    end
    object FSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object FEDITAR: TStringField
      FieldName = 'EDITAR'
      FixedChar = True
      Size = 1
    end
    object FTIPO: TStringField
      FieldName = 'TIPO'
      Size = 15
    end
    object FDESCONTO: TStringField
      FieldName = 'DESCONTO'
      FixedChar = True
      Size = 5
    end
    object FTEMPODESCONTO: TIntegerField
      FieldName = 'TEMPODESCONTO'
    end
    object FOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1
    end
    object FFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 1
    end
    object FTEMPOJOGO: TIntegerField
      FieldName = 'TEMPOJOGO'
    end
    object FMONETARIO: TFMTBCDField
      FieldName = 'MONETARIO'
      Precision = 15
      Size = 2
    end
    object FTEMPOCOMPRADO: TIntegerField
      FieldName = 'TEMPOCOMPRADO'
    end
    object FCODBARRA: TStringField
      FieldName = 'CODBARRA'
    end
    object FFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object FCELULAR: TStringField
      FieldName = 'CELULAR'
      Size = 15
    end
    object FTIPOCLIENTE: TStringField
      FieldName = 'TIPOCLIENTE'
    end
    object FATIVO: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
    object FBILHETE: TStringField
      FieldName = 'BILHETE'
      FixedChar = True
      Size = 1
    end
    object FRG: TStringField
      FieldName = 'RG'
    end
    object FCPF: TStringField
      FieldName = 'CPF'
    end
    object FICQ: TStringField
      FieldName = 'ICQ'
      Size = 10
    end
    object FEMAIL2: TStringField
      FieldName = 'EMAIL2'
      Size = 30
    end
    object FESTUDANTE: TStringField
      FieldName = 'ESTUDANTE'
      FixedChar = True
      Size = 1
    end
    object FSERIE: TStringField
      FieldName = 'SERIE'
    end
    object FPERIODO: TStringField
      FieldName = 'PERIODO'
      Size = 10
    end
    object FESCOLA: TStringField
      FieldName = 'ESCOLA'
      Size = 30
    end
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'IBConnection'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'Database=c:\meus programas\cybermgr\temp\sgl.gdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'Interbase TransIsolation=ReadCommited'
      'Trim Char=False')
    VendorLib = 'gds32.dll'
    Connected = True
    Left = 200
    Top = 48
  end
  object nxRemoteServerEngine1: TnxRemoteServerEngine
    ActiveRuntime = True
    ActiveDesigntime = True
    Transport = nxWinsockTransport1
    Left = 352
    Top = 48
  end
  object nxWinsockTransport1: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveRuntime = True
    ActiveDesigntime = True
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    MaxBytesPerSecond = 0
    PingTime = 0
    Left = 392
    Top = 48
  end
  object nxSession1: TnxSession
    ActiveDesigntime = True
    ServerEngine = nxRemoteServerEngine1
    Left = 320
    Top = 48
  end
  object nxDatabase1: TnxDatabase
    ActiveRuntime = True
    ActiveDesigntime = True
    Session = nxSession1
    AliasName = 'cybermgr'
    Left = 288
    Top = 48
  end
  object D: TnxTable
    ActiveRuntime = True
    Database = nxDatabase1
    TableName = 'CONTATO'
    Left = 256
    Top = 48
    object DCodigo: TAutoIncField
      FieldName = 'Codigo'
    end
    object DNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object DEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object DBairro: TStringField
      FieldName = 'Bairro'
    end
    object DCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object DUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object DCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object DNasc: TDateTimeField
      FieldName = 'Nasc'
    end
    object DSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object DObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object DCpf: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object DRg: TStringField
      FieldName = 'Rg'
      Size = 14
    end
    object DTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object DEmail: TMemoField
      FieldName = 'Email'
      BlobType = ftMemo
    end
    object DCreditoM: TIntegerField
      FieldName = 'CreditoM'
    end
    object DTempoTotal: TIntegerField
      FieldName = 'TempoTotal'
    end
    object DTempoInicial: TIntegerField
      FieldName = 'TempoInicial'
    end
    object DIsento: TBooleanField
      FieldName = 'Isento'
    end
    object DUsername: TStringField
      FieldName = 'Username'
      Size = 40
    end
    object DSenha: TStringField
      FieldName = 'Senha'
      Size = 10
    end
    object DUltVisita: TDateTimeField
      FieldName = 'UltVisita'
    end
    object DDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object DEscola: TStringField
      FieldName = 'Escola'
      Size = 40
    end
    object DNickName: TStringField
      FieldName = 'NickName'
      Size = 30
    end
    object DDataNasc: TDateTimeField
      FieldName = 'DataNasc'
    end
    object DCelular: TStringField
      FieldName = 'Celular'
      Size = 15
    end
    object DTemDebito: TBooleanField
      FieldName = 'TemDebito'
    end
  end
  object DataSource1: TDataSource
    DataSet = F
    Left = 88
    Top = 56
  end
  object tTran: TnxTable
    ActiveRuntime = True
    Database = nxDatabase1
    TableName = 'TRANSACAO'
    IndexName = 'INumero'
    Left = 264
    Top = 96
    object tTranNumero: TAutoIncField
      FieldName = 'Numero'
    end
    object tTranCaixaI: TIntegerField
      FieldName = 'CaixaI'
    end
    object tTranCaixaF: TIntegerField
      FieldName = 'CaixaF'
    end
    object tTranCaixaP: TIntegerField
      FieldName = 'CaixaP'
    end
    object tTranTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object tTranInicio: TDateTimeField
      FieldName = 'Inicio'
    end
    object tTranFim: TDateTimeField
      FieldName = 'Fim'
    end
    object tTranDataPagto: TDateTimeField
      FieldName = 'DataPagto'
    end
    object tTranContato: TIntegerField
      FieldName = 'Contato'
    end
    object tTranNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tTranMaquina: TWordField
      FieldName = 'Maquina'
    end
    object tTranTipo: TWordField
      FieldName = 'Tipo'
    end
    object tTranFuncI: TStringField
      FieldName = 'FuncI'
      Size = 10
    end
    object tTranFuncF: TStringField
      FieldName = 'FuncF'
      Size = 40
    end
    object tTranTempo: TDateTimeField
      FieldName = 'Tempo'
    end
    object tTranTempoCobrado: TDateTimeField
      FieldName = 'TempoCobrado'
    end
    object tTranCredUsado: TIntegerField
      FieldName = 'CredUsado'
    end
    object tTranCredAnterior: TIntegerField
      FieldName = 'CredAnterior'
    end
    object tTranDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tTranProdutos: TCurrencyField
      FieldName = 'Produtos'
    end
    object tTranValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tTranObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tTranIsento: TBooleanField
      FieldName = 'Isento'
    end
    object tTranNaoUsarPacote: TBooleanField
      FieldName = 'NaoUsarPacote'
    end
    object tTranCodPacote: TWordField
      FieldName = 'CodPacote'
    end
    object tTranSinal: TCurrencyField
      FieldName = 'Sinal'
    end
    object tTranTransacaoVinculada: TIntegerField
      FieldName = 'TransacaoVinculada'
    end
    object tTranValorFinalAcesso: TCurrencyField
      FieldName = 'ValorFinalAcesso'
    end
    object tTranDescontoProduto: TCurrencyField
      FieldName = 'DescontoProduto'
    end
    object tTranNumDoc: TStringField
      FieldName = 'NumDoc'
      Size = 15
    end
    object tTranStatusPagto: TWordField
      FieldName = 'StatusPagto'
    end
    object tTranT0: TFloatField
      FieldName = 'T0'
    end
    object tTranT1: TFloatField
      FieldName = 'T1'
    end
    object tTranT2: TFloatField
      FieldName = 'T2'
    end
    object tTranT3: TFloatField
      FieldName = 'T3'
    end
    object tTranT4: TFloatField
      FieldName = 'T4'
    end
    object tTranT5: TFloatField
      FieldName = 'T5'
    end
    object tTranT6: TFloatField
      FieldName = 'T6'
    end
    object tTranT7: TFloatField
      FieldName = 'T7'
    end
    object tTranT8: TFloatField
      FieldName = 'T8'
    end
    object tTranT9: TFloatField
      FieldName = 'T9'
    end
    object tTranT10: TFloatField
      FieldName = 'T10'
    end
    object tTranT11: TFloatField
      FieldName = 'T11'
    end
    object tTranT12: TFloatField
      FieldName = 'T12'
    end
    object tTranT13: TFloatField
      FieldName = 'T13'
    end
    object tTranT14: TFloatField
      FieldName = 'T14'
    end
    object tTranT15: TFloatField
      FieldName = 'T15'
    end
    object tTranT16: TFloatField
      FieldName = 'T16'
    end
    object tTranT17: TFloatField
      FieldName = 'T17'
    end
    object tTranT18: TFloatField
      FieldName = 'T18'
    end
    object tTranT19: TFloatField
      FieldName = 'T19'
    end
    object tTranT20: TFloatField
      FieldName = 'T20'
    end
    object tTranT21: TFloatField
      FieldName = 'T21'
    end
    object tTranT22: TFloatField
      FieldName = 'T22'
    end
    object tTranT23: TFloatField
      FieldName = 'T23'
    end
  end
  object tME: TnxTable
    ActiveRuntime = True
    Database = nxDatabase1
    TableName = 'MovEst'
    Left = 304
    Top = 96
    object tMENumSeq: TAutoIncField
      FieldName = 'NumSeq'
    end
    object tMETransacao: TIntegerField
      FieldName = 'Transacao'
    end
    object tMEProduto: TStringField
      FieldName = 'Produto'
      Size = 15
    end
    object tMEQuant: TFloatField
      FieldName = 'Quant'
    end
    object tMEUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object tMETotal: TCurrencyField
      FieldName = 'Total'
    end
    object tMEItem: TWordField
      FieldName = 'Item'
    end
    object tMEDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tMEDataMov: TDateTimeField
      FieldName = 'DataMov'
    end
    object tMEDataPag: TDateTimeField
      FieldName = 'DataPag'
    end
    object tMEEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object tMECancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tMEEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object tMETipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object tMEContato: TIntegerField
      FieldName = 'Contato'
    end
    object tMECaixaMov: TIntegerField
      FieldName = 'CaixaMov'
    end
    object tMECaixaPag: TIntegerField
      FieldName = 'CaixaPag'
    end
    object tMECategoria: TStringField
      FieldName = 'Categoria'
    end
  end
end
