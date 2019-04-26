object Form16: TForm16
  Left = 0
  Top = 0
  Caption = 'Corrigir d'#233'bitos'
  ClientHeight = 239
  ClientWidth = 474
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object PB: TProgressBar
    Left = 0
    Top = 0
    Width = 474
    Height = 16
    Align = alTop
    TabOrder = 0
  end
  object Button1: TButton
    Left = 20
    Top = 35
    Width = 75
    Height = 25
    Caption = 'Corrigir!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object nxSession1: TnxSession
    UserName = 'admin'
    Password = 'delphi9856'
    ServerEngine = nxRemoteServerEngine1
    Left = 176
    Top = 32
  end
  object nxDB: TnxDatabase
    Session = nxSession1
    AliasName = 'NexCafe'
    Left = 200
    Top = 32
  end
  object tTran: TnxTable
    Database = nxDB
    TableName = 'Tran'
    IndexName = 'IID'
    Left = 264
    Top = 32
    object tTranID: TAutoIncField
      FieldName = 'ID'
    end
    object tTranDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tTranCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tTranTipo: TWordField
      FieldName = 'Tipo'
    end
    object tTranFunc: TStringField
      FieldName = 'Func'
    end
    object tTranTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tTranDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tTranTotLiq: TCurrencyField
      FieldName = 'TotLiq'
    end
    object tTranPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tTranDebitoAnt: TCurrencyField
      FieldName = 'DebitoAnt'
    end
    object tTranDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object tTranDebitoPago: TCurrencyField
      FieldName = 'DebitoPago'
    end
    object tTranCreditoAnt: TCurrencyField
      FieldName = 'CreditoAnt'
    end
    object tTranCredito: TCurrencyField
      FieldName = 'Credito'
    end
    object tTranCreditoUsado: TCurrencyField
      FieldName = 'CreditoUsado'
    end
    object tTranTroco: TCurrencyField
      FieldName = 'Troco'
    end
    object tTranObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tTranCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tTranCanceladoPor: TStringField
      FieldName = 'CanceladoPor'
      Size = 30
    end
    object tTranCanceladoEm: TDateTimeField
      FieldName = 'CanceladoEm'
    end
    object tTranCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tTranCaixaPag: TIntegerField
      FieldName = 'CaixaPag'
    end
    object tTranMaq: TWordField
      FieldName = 'Maq'
    end
    object tTranNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 50
    end
    object tTranSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tTranDescr: TStringField
      FieldName = 'Descr'
      Size = 50
    end
    object tTranQtdTempo: TFloatField
      FieldName = 'QtdTempo'
    end
    object tTranCredValor: TBooleanField
      FieldName = 'CredValor'
    end
    object tTranFidResgate: TBooleanField
      FieldName = 'FidResgate'
    end
    object tTranplusID: TGuidField
      FieldName = 'plusID'
      Size = 38
    end
    object tTranplusTran: TBooleanField
      FieldName = 'plusTran'
    end
    object tTranPagFunc: TStringField
      FieldName = 'PagFunc'
    end
    object tTranPagPend: TBooleanField
      FieldName = 'PagPend'
    end
    object tTranRecVer: TIntegerField
      FieldName = 'RecVer'
    end
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 17200
    Left = 232
    Top = 32
  end
  object nxRemoteServerEngine1: TnxRemoteServerEngine
    Transport = nxTCP
    Left = 296
    Top = 32
  end
  object tITran: TnxTable
    Database = nxDB
    TableName = 'ITran'
    IndexName = 'ITranID'
    Left = 264
    Top = 72
    object tITranID: TAutoIncField
      FieldName = 'ID'
    end
    object tITranTran: TIntegerField
      FieldName = 'Tran'
    end
    object tITranCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tITranCaixaPag: TIntegerField
      FieldName = 'CaixaPag'
    end
    object tITranCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tITranSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tITranDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tITranTipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object tITranTipoItem: TWordField
      FieldName = 'TipoItem'
    end
    object tITranSubTipo: TWordField
      FieldName = 'SubTipo'
    end
    object tITranItemID: TIntegerField
      FieldName = 'ItemID'
    end
    object tITranSubItemID: TIntegerField
      FieldName = 'SubItemID'
    end
    object tITranItemPos: TWordField
      FieldName = 'ItemPos'
    end
    object tITranTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tITranDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tITranTotLiq: TCurrencyField
      FieldName = 'TotLiq'
    end
    object tITranDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object tITranPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tITranCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tITranPagPend: TBooleanField
      FieldName = 'PagPend'
    end
    object tITranFidFator: TSmallintField
      FieldName = 'FidFator'
    end
    object tITranFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
    object tITranFidMov: TBooleanField
      FieldName = 'FidMov'
    end
    object tITranplusID: TGuidField
      FieldName = 'plusID'
      Size = 38
    end
    object tITranplusTran: TBooleanField
      FieldName = 'plusTran'
    end
    object tITranFidOpe: TWordField
      FieldName = 'FidOpe'
    end
    object tITranRecVer: TIntegerField
      FieldName = 'RecVer'
    end
  end
  object tDebito: TnxTable
    Database = nxDB
    TableName = 'Debito'
    IndexName = 'ITipoID'
    Left = 264
    Top = 112
    object tDebitoData: TDateTimeField
      FieldName = 'Data'
    end
    object tDebitoCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tDebitoValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tDebitoTipo: TWordField
      FieldName = 'Tipo'
    end
    object tDebitoID: TIntegerField
      FieldName = 'ID'
    end
  end
  object tCli: TnxTable
    Database = nxDB
    TableName = 'Cliente'
    IndexName = 'IID'
    Left = 304
    Top = 112
    object tCliID: TAutoIncField
      FieldName = 'ID'
    end
    object tCliDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object tCliTemDebito: TBooleanField
      FieldName = 'TemDebito'
    end
  end
end
