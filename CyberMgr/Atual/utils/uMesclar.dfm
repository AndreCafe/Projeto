object Form1: TForm1
  Left = 192
  Top = 114
  Width = 677
  Height = 571
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 669
    Height = 41
    Align = alTop
    TabOrder = 0
    object btnCorrigir: TButton
      Left = 8
      Top = 8
      Width = 166
      Height = 25
      Caption = 'Corrigir Vendas Avulsas'
      TabOrder = 0
      OnClick = btnCorrigirClick
    end
  end
  object G: TDBGrid
    Left = 0
    Top = 41
    Width = 669
    Height = 496
    Align = alClient
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object nxRSE: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxTCPIP
    Left = 104
    Top = 48
  end
  object nxTCPIP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    MaxBytesPerSecond = 0
    PingTime = 0
    Port = 16100
    Left = 144
    Top = 48
  end
  object nxDB: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession
    AliasName = 'Cybermgr'
    Left = 64
    Top = 48
  end
  object nxSession: TnxSession
    ActiveDesigntime = True
    ServerEngine = nxRSE
    Left = 192
    Top = 48
  end
  object tTran: TnxTable
    ActiveRuntime = True
    Database = nxDB
    TableName = 'Transacao'
    IndexName = 'IData'
    Left = 64
    Top = 112
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
    Database = nxDB
    TableName = 'MovEst'
    IndexName = 'ITranItem'
    Left = 104
    Top = 112
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
    object tMECustoU: TCurrencyField
      FieldName = 'CustoU'
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
  object DataSource1: TDataSource
    DataSet = tTran
    Left = 144
    Top = 112
  end
end
