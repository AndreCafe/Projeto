object FrmPri: TFrmPri
  Left = 0
  Top = 0
  ActiveControl = edMaq
  Caption = 'Apagar Acesso'
  ClientHeight = 401
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 21
  object Label1: TLabel
    Left = 32
    Top = 64
    Width = 64
    Height = 21
    Caption = 'M'#225'quina:'
  end
  object Label2: TLabel
    Left = 32
    Top = 24
    Width = 189
    Height = 21
    Caption = 'Apagar acesso com erro 54'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 32
    Top = 144
    Width = 473
    Height = 153
    AutoSize = False
    Caption = 
      'Aten'#231#227'o: O acesso ser'#225' apagado do banco de dados do NexCaf'#233'. O p' +
      'rograma n'#227'o ter'#225' como abater da conta do cliente o tempo consumi' +
      'do (caso o cliente tivesse usando cr'#233'dito). Esse acesso vai simp' +
      'lesmente sumir do NexCaf'#233'.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object edMaq: TSpinEdit
    Left = 32
    Top = 88
    Width = 121
    Height = 31
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    MaxValue = 0
    MinValue = 0
    ParentFont = False
    TabOrder = 0
    Value = 0
  end
  object Button1: TButton
    Left = 32
    Top = 324
    Width = 353
    Height = 42
    Caption = 'Apagar acesso com erro 54'
    TabOrder = 1
    OnClick = Button1Click
  end
  object nxRSE: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxTCP
    Left = 432
    Top = 16
  end
  object nxSession: TnxSession
    ActiveDesigntime = True
    UserName = 'admin'
    Password = 'delphi9856'
    ServerEngine = nxRSE
    Left = 392
    Top = 16
  end
  object nxDB: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession
    AliasName = 'NexCafe'
    Left = 352
    Top = 16
  end
  object T: TnxTable
    ActiveRuntime = True
    Database = nxDB
    TableName = 'Sessao'
    IndexName = 'IEncerrou'
    Left = 392
    Top = 64
    object TID: TUnsignedAutoIncField
      FieldName = 'ID'
    end
    object TMaq: TWordField
      FieldName = 'Maq'
    end
    object TEncerrou: TBooleanField
      FieldName = 'Encerrou'
    end
    object TCaixaF: TLongWordField
      FieldName = 'CaixaF'
    end
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 16200
    Left = 352
    Top = 64
  end
end
