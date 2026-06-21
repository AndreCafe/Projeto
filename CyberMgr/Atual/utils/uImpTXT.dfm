object FrmPri: TFrmPri
  Left = 0
  Top = 0
  Caption = 'Importa'#231#227'o de dados do ODIN'
  ClientHeight = 162
  ClientWidth = 366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btnImp: TButton
    Left = 21
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Importar'
    TabOrder = 0
    OnClick = btnImpClick
  end
  object PB: TProgressBar
    Left = 21
    Top = 112
    Width = 337
    Height = 16
    Max = 340
    TabOrder = 1
  end
  object nxSession1: TnxSession
    ActiveDesigntime = True
    ServerEngine = nxRSE
    Left = 16
    Top = 16
  end
  object nxDB: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession1
    AliasName = 'Cybermgr'
    Left = 176
    Top = 16
  end
  object nxWinsockTransport1: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    MaxBytesPerSecond = 0
    PingTime = 0
    Left = 96
    Top = 16
  end
  object nxRSE: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxWinsockTransport1
    Left = 136
    Top = 16
  end
  object T: TnxTable
    Database = nxDB
    TableName = 'Contato'
    Left = 56
    Top = 16
    object TCodigo: TAutoIncField
      FieldName = 'Codigo'
    end
    object TNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object TEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object TBairro: TStringField
      FieldName = 'Bairro'
    end
    object TCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object TUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object TCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object TNasc: TDateTimeField
      FieldName = 'Nasc'
    end
    object TSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object TObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TCpf: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object TRg: TStringField
      FieldName = 'Rg'
      Size = 14
    end
    object TTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object TEmail: TMemoField
      FieldName = 'Email'
      BlobType = ftMemo
    end
    object TCreditoM: TIntegerField
      FieldName = 'CreditoM'
    end
    object TTempoTotal: TIntegerField
      FieldName = 'TempoTotal'
    end
    object TTempoInicial: TIntegerField
      FieldName = 'TempoInicial'
    end
    object TIsento: TBooleanField
      FieldName = 'Isento'
    end
    object TUsername: TStringField
      FieldName = 'Username'
      Size = 40
    end
    object TPai: TStringField
      FieldName = 'Pai'
      Size = 40
    end
    object TMae: TStringField
      FieldName = 'Mae'
      Size = 40
    end
    object TSenha: TStringField
      FieldName = 'Senha'
    end
    object TUltVisita: TDateTimeField
      FieldName = 'UltVisita'
    end
    object TDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object TEscola: TStringField
      FieldName = 'Escola'
      Size = 40
    end
    object TEscolaHI: TDateTimeField
      FieldName = 'EscolaHI'
    end
    object TEscolaHF: TDateTimeField
      FieldName = 'EscolaHF'
    end
    object TNickName: TStringField
      FieldName = 'NickName'
      Size = 30
    end
    object TDataNasc: TDateTimeField
      FieldName = 'DataNasc'
    end
    object TCelular: TStringField
      FieldName = 'Celular'
      Size = 15
    end
    object TTemDebito: TBooleanField
      FieldName = 'TemDebito'
    end
    object TLimiteDebito: TCurrencyField
      FieldName = 'LimiteDebito'
    end
    object TFoto: TGraphicField
      FieldName = 'Foto'
      BlobType = ftGraphic
    end
    object TIncluidoEm: TDateTimeField
      FieldName = 'IncluidoEm'
    end
    object TAlteradoEm: TDateTimeField
      FieldName = 'AlteradoEm'
    end
    object TIncluidoPor: TStringField
      FieldName = 'IncluidoPor'
      Size = 10
    end
    object TAlteradoPor: TStringField
      FieldName = 'AlteradoPor'
      Size = 10
    end
    object TInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object TTipoAcessoPref: TIntegerField
      FieldName = 'TipoAcessoPref'
    end
  end
  object TT: TnxTable
    Database = nxDB
    TableName = 'Transacao'
    Left = 224
    Top = 16
    object TTNumero: TAutoIncField
      FieldName = 'Numero'
    end
    object TTCaixaI: TIntegerField
      FieldName = 'CaixaI'
    end
    object TTCaixaF: TIntegerField
      FieldName = 'CaixaF'
    end
    object TTCaixaP: TIntegerField
      FieldName = 'CaixaP'
    end
    object TTTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object TTInicio: TDateTimeField
      FieldName = 'Inicio'
    end
    object TTFim: TDateTimeField
      FieldName = 'Fim'
    end
    object TTDataPagto: TDateTimeField
      FieldName = 'DataPagto'
    end
    object TTContato: TIntegerField
      FieldName = 'Contato'
    end
    object TTNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object TTMaquina: TWordField
      FieldName = 'Maquina'
    end
    object TTTipo: TWordField
      FieldName = 'Tipo'
    end
    object TTFuncI: TStringField
      FieldName = 'FuncI'
      Size = 10
    end
    object TTFuncF: TStringField
      FieldName = 'FuncF'
      Size = 40
    end
    object TTTempo: TDateTimeField
      FieldName = 'Tempo'
    end
    object TTTempoCobrado: TDateTimeField
      FieldName = 'TempoCobrado'
    end
    object TTCredUsado: TIntegerField
      FieldName = 'CredUsado'
    end
    object TTCredAnterior: TIntegerField
      FieldName = 'CredAnterior'
    end
    object TTDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object TTProdutos: TCurrencyField
      FieldName = 'Produtos'
    end
    object TTValor: TCurrencyField
      FieldName = 'Valor'
    end
    object TTObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TTIsento: TBooleanField
      FieldName = 'Isento'
    end
    object TTNaoUsarPacote: TBooleanField
      FieldName = 'NaoUsarPacote'
    end
    object TTCodPacote: TWordField
      FieldName = 'CodPacote'
    end
    object TTSinal: TCurrencyField
      FieldName = 'Sinal'
    end
    object TTTransacaoVinculada: TIntegerField
      FieldName = 'TransacaoVinculada'
    end
    object TTValorFinalAcesso: TCurrencyField
      FieldName = 'ValorFinalAcesso'
    end
    object TTDescontoProduto: TCurrencyField
      FieldName = 'DescontoProduto'
    end
    object TTNumDoc: TStringField
      FieldName = 'NumDoc'
      Size = 15
    end
    object TTStatusPagto: TWordField
      FieldName = 'StatusPagto'
    end
    object TTT0: TFloatField
      FieldName = 'T0'
    end
    object TTT1: TFloatField
      FieldName = 'T1'
    end
    object TTT2: TFloatField
      FieldName = 'T2'
    end
    object TTT3: TFloatField
      FieldName = 'T3'
    end
    object TTT4: TFloatField
      FieldName = 'T4'
    end
    object TTT5: TFloatField
      FieldName = 'T5'
    end
    object TTT6: TFloatField
      FieldName = 'T6'
    end
    object TTT7: TFloatField
      FieldName = 'T7'
    end
    object TTT8: TFloatField
      FieldName = 'T8'
    end
    object TTT9: TFloatField
      FieldName = 'T9'
    end
    object TTT10: TFloatField
      FieldName = 'T10'
    end
    object TTT11: TFloatField
      FieldName = 'T11'
    end
    object TTT12: TFloatField
      FieldName = 'T12'
    end
    object TTT13: TFloatField
      FieldName = 'T13'
    end
    object TTT14: TFloatField
      FieldName = 'T14'
    end
    object TTT15: TFloatField
      FieldName = 'T15'
    end
    object TTT16: TFloatField
      FieldName = 'T16'
    end
    object TTT17: TFloatField
      FieldName = 'T17'
    end
    object TTT18: TFloatField
      FieldName = 'T18'
    end
    object TTT19: TFloatField
      FieldName = 'T19'
    end
    object TTT20: TFloatField
      FieldName = 'T20'
    end
    object TTT21: TFloatField
      FieldName = 'T21'
    end
    object TTT22: TFloatField
      FieldName = 'T22'
    end
    object TTT23: TFloatField
      FieldName = 'T23'
    end
  end
end
