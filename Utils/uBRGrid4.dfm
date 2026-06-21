object Form1: TForm1
  Left = 2
  Top = 140
  Width = 696
  Height = 480
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
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 688
    Height = 446
    Align = alClient
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = DS
      DataController.Filter.Active = True
      DataController.Filter.AutoDataSetFilter = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.Appending = True
      OptionsView.Navigator = True
      object cxGrid1DBTableView1Codigo: TcxGridDBColumn
        DataBinding.FieldName = 'Codigo'
      end
      object cxGrid1DBTableView1Nome: TcxGridDBColumn
        DataBinding.FieldName = 'Nome'
      end
      object cxGrid1DBTableView1Endereco: TcxGridDBColumn
        DataBinding.FieldName = 'Endereco'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object gpm: TcxGridPopupMenu
    Grid = cxGrid1
    PopupMenus = <>
    Left = 184
    Top = 248
  end
  object MT: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Endereco'
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    Version = '4.08b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 64
    Top = 224
    object MTCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object MTNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object MTEndereco: TStringField
      FieldName = 'Endereco'
      Size = 40
    end
  end
  object DS: TDataSource
    DataSet = MT
    Left = 96
    Top = 224
  end
end
