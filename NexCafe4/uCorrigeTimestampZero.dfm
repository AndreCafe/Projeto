object Form26: TForm26
  Left = 0
  Top = 0
  Caption = 'Form26'
  ClientHeight = 254
  ClientWidth = 480
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
    Left = 16
    Top = 184
    Width = 321
    Height = 16
    TabOrder = 0
  end
  object Button1: TButton
    Left = 16
    Top = 104
    Width = 129
    Height = 25
    Caption = 'Corrige'
    TabOrder = 1
    OnClick = Button1Click
  end
  object nxSession1: TnxSession
    ActiveDesigntime = True
    UserName = 'admin'
    Password = 'delphi9856'
    ServerEngine = nxRemoteServerEngine1
    Left = 16
    Top = 48
  end
  object nxDatabase1: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession1
    AliasName = 'NexCafe'
    Left = 56
    Top = 48
  end
  object nxRemoteServerEngine1: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxWinsockTransport1
    Left = 96
    Top = 48
  end
  object nxWinsockTransport1: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 16200
    Left = 136
    Top = 48
  end
  object T: TnxTable
    ActiveDesigntime = True
    Database = nxDatabase1
    TableName = 'MovEst'
    Left = 176
    Top = 48
    object TID: TAutoIncField
      FieldName = 'ID'
    end
    object TTran: TIntegerField
      FieldName = 'Tran'
    end
    object TProduto: TIntegerField
      FieldName = 'Produto'
    end
    object TQuant: TFloatField
      FieldName = 'Quant'
    end
    object TUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object TTotal: TCurrencyField
      FieldName = 'Total'
    end
    object TCustoU: TCurrencyField
      FieldName = 'CustoU'
    end
    object TItem: TWordField
      FieldName = 'Item'
    end
    object TDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object TPago: TCurrencyField
      FieldName = 'Pago'
    end
    object TPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object TDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object TDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object TEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object TCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object TEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object TCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object TCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object TCategoria: TStringField
      FieldName = 'Categoria'
    end
    object TNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object TITran: TIntegerField
      FieldName = 'ITran'
    end
    object TTipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object TSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object TFidResgate: TBooleanField
      FieldName = 'FidResgate'
    end
    object TFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
  end
end
