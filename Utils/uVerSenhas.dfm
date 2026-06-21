object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 311
  ClientWidth = 712
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 712
    Height = 311
    Align = alClient
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ServerEng: TnxServerEngine
    Options = []
    TableExtension = 'nx1'
    Left = 176
    Top = 104
  end
  object nxSession1: TnxSession
    ServerEngine = ServerEng
    Left = 224
    Top = 104
  end
  object nxDB: TnxDatabase
    Session = nxSession1
    AliasPath = 'c:\meus programas\nexcafe\dados'
    Left = 280
    Top = 104
  end
  object Tab: TnxTable
    Database = nxDB
    TableName = 'Usuario'
    Left = 344
    Top = 104
  end
  object DataSource1: TDataSource
    DataSet = Tab
    Left = 416
    Top = 104
  end
  object nxseAllEngines1: TnxseAllEngines
    Left = 136
    Top = 232
  end
end
