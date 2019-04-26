object Form45: TForm45
  Left = 0
  Top = 0
  Caption = 'Form45'
  ClientHeight = 208
  ClientWidth = 508
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 17
    Width = 508
    Height = 13
    Align = alTop
    Alignment = taCenter
    Caption = '...'
    ExplicitLeft = 232
    ExplicitTop = 32
    ExplicitWidth = 12
  end
  object PB: TProgressBar
    Left = 0
    Top = 0
    Width = 508
    Height = 17
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 24
    ExplicitTop = 24
    ExplicitWidth = 441
  end
  object Button1: TButton
    Left = 16
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 296
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Tab: TnxTable
    Session = nxSe
    AliasName = 'NexCafe'
    TableName = 'Cliente'
    IndexName = 'IID'
    Left = 104
    Top = 88
    object TabID: TAutoIncField
      FieldName = 'ID'
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
    object TabSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object TabObs: TnxMemoField
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
    object TabEmail: TnxMemoField
      FieldName = 'Email'
      BlobType = ftMemo
    end
    object TabMinutos: TFloatField
      FieldName = 'Minutos'
    end
    object TabPassaportes: TFloatField
      FieldName = 'Passaportes'
    end
    object TabMinutosUsados: TFloatField
      FieldName = 'MinutosUsados'
    end
    object TabMinutosIniciais: TFloatField
      FieldName = 'MinutosIniciais'
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
    object TabTitEleitor: TStringField
      FieldName = 'TitEleitor'
      Size = 13
    end
    object TabFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
    object TabFidTotal: TFloatField
      FieldName = 'FidTotal'
    end
    object TabFidResg: TFloatField
      FieldName = 'FidResg'
    end
    object TabAniversario: TStringField
      FieldName = 'Aniversario'
      Size = 4
    end
    object TabCotaImpEspecial: TBooleanField
      FieldName = 'CotaImpEspecial'
    end
    object TabCotaImpDia: TIntegerField
      FieldName = 'CotaImpDia'
    end
    object TabCotaImpMes: TIntegerField
      FieldName = 'CotaImpMes'
    end
    object TabSemFidelidade: TBooleanField
      FieldName = 'SemFidelidade'
    end
    object TabNaoGuardarCredito: TBooleanField
      FieldName = 'NaoGuardarCredito'
    end
    object TabPermiteLoginSemCred: TBooleanField
      FieldName = 'PermiteLoginSemCred'
    end
    object TabCHorario: TIntegerField
      FieldName = 'CHorario'
    end
    object TabOpCHorario: TWordField
      FieldName = 'OpCHorario'
    end
    object TabHP1: TIntegerField
      FieldName = 'HP1'
    end
    object TabHP2: TIntegerField
      FieldName = 'HP2'
    end
    object TabHP3: TIntegerField
      FieldName = 'HP3'
    end
    object TabHP4: TIntegerField
      FieldName = 'HP4'
    end
    object TabHP5: TIntegerField
      FieldName = 'HP5'
    end
    object TabHP6: TIntegerField
      FieldName = 'HP6'
    end
    object TabHP7: TIntegerField
      FieldName = 'HP7'
    end
    object TabInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object TabTipoAcessoPref: TIntegerField
      FieldName = 'TipoAcessoPref'
    end
    object TabFornecedor: TBooleanField
      FieldName = 'Fornecedor'
    end
    object TabValorCred: TCurrencyField
      FieldName = 'ValorCred'
    end
  end
  object nxRSE: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxTCP
    Left = 144
    Top = 88
  end
  object nxSe: TnxSession
    ActiveDesigntime = True
    UserName = 'admin'
    Password = 'delphi9856'
    ServerEngine = nxRSE
    Left = 184
    Top = 88
  end
  object nxDB: TnxDatabase
    Session = nxSe
    Left = 104
    Top = 136
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 16200
    Left = 104
    Top = 48
  end
  object Tab2: TnxTable
    Session = nxSe
    AliasName = 'NexCafe'
    TableName = 'Cliente2'
    IndexName = 'IID'
    Left = 152
    Top = 136
    object AutoIncField1: TAutoIncField
      FieldName = 'ID'
    end
    object StringField1: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object StringField2: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object StringField3: TStringField
      FieldName = 'Bairro'
    end
    object StringField4: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object StringField5: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object StringField6: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object StringField7: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object nxMemoField1: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object StringField8: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object StringField9: TStringField
      FieldName = 'Rg'
      Size = 14
    end
    object StringField10: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object nxMemoField2: TnxMemoField
      FieldName = 'Email'
      BlobType = ftMemo
    end
    object FloatField1: TFloatField
      FieldName = 'Minutos'
    end
    object FloatField2: TFloatField
      FieldName = 'Passaportes'
    end
    object FloatField3: TFloatField
      FieldName = 'MinutosUsados'
    end
    object FloatField4: TFloatField
      FieldName = 'MinutosIniciais'
    end
    object BooleanField1: TBooleanField
      FieldName = 'Isento'
    end
    object StringField11: TStringField
      FieldName = 'Username'
      Size = 40
    end
    object StringField12: TStringField
      FieldName = 'Pai'
      Size = 40
    end
    object StringField13: TStringField
      FieldName = 'Mae'
      Size = 40
    end
    object StringField14: TStringField
      FieldName = 'Senha'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'UltVisita'
    end
    object CurrencyField1: TCurrencyField
      FieldName = 'Debito'
    end
    object StringField15: TStringField
      FieldName = 'Escola'
      Size = 40
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'EscolaHI'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'EscolaHF'
    end
    object StringField16: TStringField
      FieldName = 'NickName'
      Size = 30
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'DataNasc'
    end
    object StringField17: TStringField
      FieldName = 'Celular'
      Size = 15
    end
    object BooleanField2: TBooleanField
      FieldName = 'TemDebito'
    end
    object CurrencyField2: TCurrencyField
      FieldName = 'LimiteDebito'
    end
    object GraphicField1: TGraphicField
      FieldName = 'Foto'
      BlobType = ftGraphic
    end
    object DateTimeField5: TDateTimeField
      FieldName = 'IncluidoEm'
    end
    object DateTimeField6: TDateTimeField
      FieldName = 'AlteradoEm'
    end
    object StringField18: TStringField
      FieldName = 'IncluidoPor'
      Size = 10
    end
    object StringField19: TStringField
      FieldName = 'AlteradoPor'
      Size = 10
    end
    object StringField20: TStringField
      FieldName = 'TitEleitor'
      Size = 13
    end
    object FloatField5: TFloatField
      FieldName = 'FidPontos'
    end
    object FloatField6: TFloatField
      FieldName = 'FidTotal'
    end
    object FloatField7: TFloatField
      FieldName = 'FidResg'
    end
    object StringField21: TStringField
      FieldName = 'Aniversario'
      Size = 4
    end
    object BooleanField3: TBooleanField
      FieldName = 'CotaImpEspecial'
    end
    object IntegerField1: TIntegerField
      FieldName = 'CotaImpDia'
    end
    object IntegerField2: TIntegerField
      FieldName = 'CotaImpMes'
    end
    object BooleanField4: TBooleanField
      FieldName = 'SemFidelidade'
    end
    object BooleanField5: TBooleanField
      FieldName = 'NaoGuardarCredito'
    end
    object BooleanField6: TBooleanField
      FieldName = 'PermiteLoginSemCred'
    end
    object IntegerField3: TIntegerField
      FieldName = 'CHorario'
    end
    object WordField1: TWordField
      FieldName = 'OpCHorario'
    end
    object IntegerField4: TIntegerField
      FieldName = 'HP1'
    end
    object IntegerField5: TIntegerField
      FieldName = 'HP2'
    end
    object IntegerField6: TIntegerField
      FieldName = 'HP3'
    end
    object IntegerField7: TIntegerField
      FieldName = 'HP4'
    end
    object IntegerField8: TIntegerField
      FieldName = 'HP5'
    end
    object IntegerField9: TIntegerField
      FieldName = 'HP6'
    end
    object IntegerField10: TIntegerField
      FieldName = 'HP7'
    end
    object BooleanField7: TBooleanField
      FieldName = 'Inativo'
    end
    object IntegerField11: TIntegerField
      FieldName = 'TipoAcessoPref'
    end
    object BooleanField8: TBooleanField
      FieldName = 'Fornecedor'
    end
    object CurrencyField3: TCurrencyField
      FieldName = 'ValorCred'
    end
  end
end
