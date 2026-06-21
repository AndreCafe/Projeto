object FrmPri: TFrmPri
  Left = 351
  Top = 274
  BorderStyle = bsDialog
  Caption = 'Importando arquivos da versão 1'
  ClientHeight = 120
  ClientWidth = 355
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 24
    Width = 230
    Height = 13
    Caption = 'Importando arquivos da versão 1 para versão 2'
  end
  object lbArq: TLabel
    Left = 8
    Top = 88
    Width = 18
    Height = 13
    Caption = '. . .'
  end
  object PB: TProgressBar
    Left = 8
    Top = 64
    Width = 337
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 0
  end
  object nxServer: TnxServerEngine
    Options = []
    Left = 8
    Top = 8
  end
  object nxTab: TnxTable
    Database = nxDB
    TableName = 'Acesso'
    Left = 8
    Top = 40
  end
  object nxSession: TnxSession
    ServerEngine = nxServer
    Left = 80
    Top = 88
  end
  object nxDB: TnxDatabase
    Session = nxSession
    AliasPath = 'c:\meus programas\cybermgr\dados'
    Left = 48
    Top = 88
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 136
    Top = 88
  end
  object ffTab: TffTable
    DatabaseName = 'ffDB'
    FieldDefs = <>
    SessionName = 'ffSession'
    Left = 168
    Top = 88
  end
  object nx1xAllEngines1: Tnx1xAllEngines
    Left = 264
    Top = 48
  end
end
