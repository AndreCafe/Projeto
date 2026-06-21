object Form1: TForm1
  Left = 192
  Top = 168
  Caption = 'Teste de DBF'
  ClientHeight = 567
  ClientWidth = 1090
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
    Width = 1090
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 9
      Top = 15
      Width = 33
      Height = 13
      Caption = 'Tabela'
    end
    object Button1: TButton
      Left = 496
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Abrir'
      Default = True
      TabOrder = 0
      OnClick = Button1Click
    end
    object CheckBox1: TCheckBox
      Left = 336
      Top = 18
      Width = 97
      Height = 17
      Caption = 'CheckBox1'
      TabOrder = 1
    end
    object edTab: TComboBox
      Left = 48
      Top = 11
      Width = 273
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'edTab'
      OnChange = edTabCloseUp
      OnCloseUp = edTabCloseUp
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 1090
    Height = 526
    Align = alClient
    BorderWidth = 5
    TabOrder = 1
    object cxGrid1: TcxGrid
      Left = 6
      Top = 6
      Width = 1078
      Height = 514
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 384
      ExplicitTop = 240
      ExplicitWidth = 250
      ExplicitHeight = 200
      object cxGrid1DBTableView1: TcxGridDBTableView
        DataController.DataSource = dsTab
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object cxGrid1DBTableView1NRO_LLAM: TcxGridDBColumn
          DataBinding.FieldName = 'NRO_LLAM'
        end
        object cxGrid1DBTableView1TIPO: TcxGridDBColumn
          DataBinding.FieldName = 'TIPO'
          Width = 32
        end
        object cxGrid1DBTableView1HORA: TcxGridDBColumn
          DataBinding.FieldName = 'HORA'
          Width = 56
        end
        object cxGrid1DBTableView1FLAG: TcxGridDBColumn
          DataBinding.FieldName = 'FLAG'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object dsTab: TDataSource
    DataSet = tabDBF
    Left = 440
    Top = 144
  end
  object OvcController1: TOvcController
    EntryCommands.TableList = (
      'Default'
      True
      ()
      'WordStar'
      False
      ()
      'Grid'
      False
      ())
    Epoch = 2000
    Left = 24
    Top = 120
  end
  object tabDBF: TDbf
    FilePath = 'C:\Meus Programas\'
    IndexDefs = <>
    TableName = 'LLAM_L.DBF'
    TableLevel = 3
    Active = True
    OnFilterRecord = tabDBFFilterRecord
    Left = 176
    Top = 112
  end
  object tSoc: TDbf
    FilePath = 'c:\meus programas\logicmove\vitalmed\'
    IndexDefs = <
      item
        IndexFile = 'CARD'
        SortField = 'CARD'
        Options = [ixExpression]
      end
      item
        IndexFile = 'DATE'
        SortField = 'DATE'
        Options = [ixExpression]
      end
      item
        IndexFile = 'GRADE'
        SortField = 'GRADE'
        Options = [ixExpression]
      end
      item
        IndexFile = 'ID'
        SortField = 'ID'
        Options = [ixUnique, ixExpression]
      end
      item
        IndexFile = 'JUMINID'
        SortField = 'JUMINID'
        Options = [ixExpression]
      end
      item
        IndexFile = 'LASTMODIFI'
        SortField = 'LASTMODIFI'
        Options = [ixExpression]
      end
      item
        IndexFile = 'MILEAGE'
        SortField = 'MILEAGE'
        Options = [ixExpression]
      end
      item
        IndexFile = 'MUG'
        SortField = 'MUG'
        Options = [ixExpression]
      end
      item
        IndexFile = 'NAME'
        SortField = 'NAME'
        Options = [ixExpression]
      end
      item
        IndexFile = 'PRIMARYKEY'
        SortField = 'UID'
        Options = [ixUnique, ixExpression]
      end
      item
        IndexFile = 'USEDMILEAG'
        SortField = 'USEDMILEAG'
        Options = [ixExpression]
      end
      item
        IndexFile = 'USERID'
        SortField = 'USERID'
        Options = [ixUnique, ixExpression]
      end>
    TableName = 'soc.dbf'
    TableLevel = 4
    OnFilterRecord = tabDBFFilterRecord
    Left = 168
    Top = 192
    object tSocCOD_SOCIO: TFloatField
      FieldName = 'COD_SOCIO'
    end
    object tSocAPELLIDO1: TStringField
      FieldName = 'APELLIDO1'
    end
    object tSocAPELLIDO2: TStringField
      FieldName = 'APELLIDO2'
    end
    object tSocNOMBRE1: TStringField
      FieldName = 'NOMBRE1'
    end
    object tSocNOMBRE2: TStringField
      FieldName = 'NOMBRE2'
    end
  end
  object Dbf1: TDbf
    FilePath = 'c:\meus programas\logicmove\vitalmed\'
    IndexDefs = <
      item
        IndexFile = 'CARD'
        SortField = 'CARD'
        Options = [ixExpression]
      end
      item
        IndexFile = 'DATE'
        SortField = 'DATE'
        Options = [ixExpression]
      end
      item
        IndexFile = 'GRADE'
        SortField = 'GRADE'
        Options = [ixExpression]
      end
      item
        IndexFile = 'ID'
        SortField = 'ID'
        Options = [ixUnique, ixExpression]
      end
      item
        IndexFile = 'JUMINID'
        SortField = 'JUMINID'
        Options = [ixExpression]
      end
      item
        IndexFile = 'LASTMODIFI'
        SortField = 'LASTMODIFI'
        Options = [ixExpression]
      end
      item
        IndexFile = 'MILEAGE'
        SortField = 'MILEAGE'
        Options = [ixExpression]
      end
      item
        IndexFile = 'MUG'
        SortField = 'MUG'
        Options = [ixExpression]
      end
      item
        IndexFile = 'NAME'
        SortField = 'NAME'
        Options = [ixExpression]
      end
      item
        IndexFile = 'PRIMARYKEY'
        SortField = 'UID'
        Options = [ixUnique, ixExpression]
      end
      item
        IndexFile = 'USEDMILEAG'
        SortField = 'USEDMILEAG'
        Options = [ixExpression]
      end
      item
        IndexFile = 'USERID'
        SortField = 'USERID'
        Options = [ixUnique, ixExpression]
      end>
    TableName = 'mot.dbf'
    TableLevel = 4
    OnFilterRecord = tabDBFFilterRecord
    Left = 248
    Top = 240
    object Dbf1COD_MOTIVO: TSmallintField
      FieldName = 'COD_MOTIVO'
    end
    object Dbf1DES_MOTIVO: TStringField
      FieldName = 'DES_MOTIVO'
      Size = 40
    end
  end
end
