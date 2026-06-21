object Form1: TForm1
  Left = 224
  Top = 205
  Caption = 'Simple Monitor Test'
  ClientHeight = 604
  ClientWidth = 854
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
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 452
    Height = 13
    Caption = 
      'Insert and modify records. The Date field is set to the current ' +
      'date and time by the simplemonitor.'
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 40
    Width = 817
    Height = 513
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object nxSession1: TnxSession
    ServerEngine = nxServerEngine1
    Left = 120
    Top = 32
  end
  object nxDatabase1: TnxDatabase
    Session = nxSession1
    AliasPath = '.'
    Left = 160
    Top = 32
  end
  object nxTable1: TnxTable
    Database = nxDatabase1
    Timeout = 2000
    TableName = 'atest'
    Left = 208
    Top = 40
  end
  object DataSource1: TDataSource
    DataSet = nxTable1
    Left = 272
    Top = 48
  end
  object nxSimpleMonitor1: TnxSimpleMonitor
    ServerEngine = nxServerEngine1
    AttachTo = [natCursor]
    OnRecordInsert = nxSimpleMonitor1RecordInsert
    OnRecordModify = nxSimpleMonitor1RecordModify
    Left = 344
    Top = 48
  end
  object nxServerEngine1: TnxServerEngine
    Options = []
    TableExtension = 'nx1'
    Left = 80
    Top = 32
  end
end
