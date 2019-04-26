object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 331
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object edit: TcxTextEdit
    Left = 88
    Top = 32
    ParentFont = False
    Properties.OnChange = editPropertiesChange
    Properties.OnEditValueChanged = editPropertiesEditValueChanged
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 0
    OnKeyDown = editKeyUp
    Width = 345
  end
  object LMDEditDBLookup1: TLMDEditDBLookup
    Left = 432
    Top = 184
    Width = 153
    Height = 21
    Bevel.Mode = bmWindows
    Caret.BlinkRate = 530
    TabOrder = 1
    AutoSelect = True
    CustomButtons = <>
    LookupDataField = 'Nome'
    LookupDataSource = DataSource1
    TypeMode = tmLookupNew
  end
  object Memo1: TMemo
    Left = 88
    Top = 88
    Width = 257
    Height = 217
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Button1: TButton
    Left = 504
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button1Click
  end
  object MT: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Nome'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 464
    Top = 72
    object MTNome: TStringField
      FieldName = 'Nome'
    end
  end
  object DataSource1: TDataSource
    DataSet = MT
    Left = 568
    Top = 88
  end
end
