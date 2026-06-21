object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Imp VS'
  ClientHeight = 398
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
  object Button1: TButton
    Left = 48
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object nxSe: TnxSession
    ActiveDesigntime = True
    ServerEngine = nxRSE
    Left = 144
    Top = 160
  end
  object Tab: TnxTable
    ActiveRuntime = True
    Database = nxDB
    TableName = 'Contato'
    IndexName = 'ICodigo'
    Left = 176
    Top = 160
    object TabCodigo: TAutoIncField
      FieldName = 'Codigo'
    end
    object TabNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object TabEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object TabBairro: TStringField
      FieldName = 'Bairro'
    end
    object TabCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object TabUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object TabCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object TabNasc: TDateTimeField
      FieldName = 'Nasc'
    end
    object TabSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object TabObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TabCpf: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object TabRg: TStringField
      FieldName = 'Rg'
      Size = 14
    end
    object TabTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object TabEmail: TMemoField
      FieldName = 'Email'
      BlobType = ftMemo
    end
    object TabCreditoM: TIntegerField
      FieldName = 'CreditoM'
    end
    object TabTempoTotal: TIntegerField
      FieldName = 'TempoTotal'
    end
    object TabTempoInicial: TIntegerField
      FieldName = 'TempoInicial'
    end
    object TabIsento: TBooleanField
      FieldName = 'Isento'
    end
    object TabUsername: TStringField
      FieldName = 'Username'
      Size = 40
    end
    object TabPai: TStringField
      FieldName = 'Pai'
      Size = 40
    end
    object TabMae: TStringField
      FieldName = 'Mae'
      Size = 40
    end
    object TabSenha: TStringField
      FieldName = 'Senha'
    end
    object TabUltVisita: TDateTimeField
      FieldName = 'UltVisita'
    end
    object TabDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object TabEscola: TStringField
      FieldName = 'Escola'
      Size = 40
    end
    object TabEscolaHI: TDateTimeField
      FieldName = 'EscolaHI'
    end
    object TabEscolaHF: TDateTimeField
      FieldName = 'EscolaHF'
    end
    object TabNickName: TStringField
      FieldName = 'NickName'
      Size = 30
    end
    object TabDataNasc: TDateTimeField
      FieldName = 'DataNasc'
    end
    object TabCelular: TStringField
      FieldName = 'Celular'
      Size = 15
    end
    object TabTemDebito: TBooleanField
      FieldName = 'TemDebito'
    end
    object TabLimiteDebito: TCurrencyField
      FieldName = 'LimiteDebito'
    end
    object TabFoto: TGraphicField
      FieldName = 'Foto'
      BlobType = ftGraphic
    end
    object TabIncluidoEm: TDateTimeField
      FieldName = 'IncluidoEm'
    end
    object TabAlteradoEm: TDateTimeField
      FieldName = 'AlteradoEm'
    end
    object TabIncluidoPor: TStringField
      FieldName = 'IncluidoPor'
      Size = 10
    end
    object TabAlteradoPor: TStringField
      FieldName = 'AlteradoPor'
      Size = 10
    end
    object TabInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object TabTipoAcessoPref: TIntegerField
      FieldName = 'TipoAcessoPref'
    end
  end
  object nxRSE: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxTCP
    Left = 48
    Top = 160
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    MaxBytesPerSecond = 0
    PingTime = 0
    Left = 112
    Top = 160
  end
  object nxDB: TnxDatabase
    Session = nxSe
    AliasName = 'Cybermgr'
    Left = 80
    Top = 160
  end
  object tPessoa: TDbf
    FilePath = 'C:\Meus Programas\Cybermgr\'
    Indexes = <>
    TableName = 'PESSOA.dbf'
    Active = True
    Left = 184
    Top = 96
    object tPessoaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object tPessoaNOMEFANTAS: TStringField
      FieldName = 'NOMEFANTAS'
      Size = 22
    end
    object tPessoaNOMECOMPLE: TStringField
      FieldName = 'NOMECOMPLE'
      Size = 52
    end
    object tPessoaTPPESSOA: TStringField
      FieldName = 'TPPESSOA'
      Size = 3
    end
    object tPessoaBINATIVA: TFloatField
      FieldName = 'BINATIVA'
    end
    object tPessoaIDINC: TFloatField
      FieldName = 'IDINC'
    end
    object tPessoaDHINC: TDateField
      FieldName = 'DHINC'
    end
    object tPessoaIDALT: TFloatField
      FieldName = 'IDALT'
    end
    object tPessoaDHALT: TDateField
      FieldName = 'DHALT'
    end
  end
  object tLogin: TDbf
    FilePath = 'C:\Meus Programas\Cybermgr\'
    Indexes = <>
    TableName = 'LOGIN.dbf'
    Active = True
    Left = 216
    Top = 96
    object tLoginIDLOGIN: TFloatField
      FieldName = 'IDLOGIN'
    end
    object tLoginLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 34
    end
  end
  object tCred: TDbf
    FilePath = 'C:\Meus Programas\Cybermgr\'
    Indexes = <>
    TableName = 'SLDCLI.dbf'
    Active = True
    Left = 248
    Top = 96
    object tCredIDCLI: TFloatField
      FieldName = 'IDCLI'
    end
    object tCredSLD: TFloatField
      FieldName = 'SLD'
    end
  end
end
