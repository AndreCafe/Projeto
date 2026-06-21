object Form1: TForm1
  Left = 253
  Top = 167
  Width = 881
  Height = 547
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 200
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 280
    Width = 873
    Height = 240
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Table1: TTable
    DatabaseName = 'db'
    FieldDefs = <
      item
        Name = 'CLIENTE'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'PROJETO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'FASE'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'TECNICO'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'ITEM'
        DataType = ftFloat
        Precision = 2
        Size = 5
      end
      item
        Name = 'POS'
        DataType = ftFloat
        Precision = 2
        Size = 5
      end
      item
        Name = 'TEXTO'
        DataType = ftString
        Size = 70
      end
      item
        Name = 'SYNC'
        DataType = ftBoolean
      end>
    StoreDefs = True
    TableName = 'Teste2.DBF'
    TableType = ttDBase
    Left = 32
    Top = 40
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 64
    Top = 40
  end
  object Database1: TDatabase
    DatabaseName = 'db'
    DriverName = 'STANDARD'
    LoginPrompt = False
    Params.Strings = (
      'LEVEL=3'
      'PATH=C:\meus programas\DiaTecServ\DBF')
    SessionName = 'Default'
    Left = 80
    Top = 136
  end
end
