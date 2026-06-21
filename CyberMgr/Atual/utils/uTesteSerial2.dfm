object FrmPri: TFrmPri
  Left = 0
  Top = 0
  Caption = 'Teste Serial'
  ClientHeight = 301
  ClientWidth = 330
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 20
    Height = 13
    Caption = 'Loja'
  end
  object Label2: TLabel
    Left = 24
    Top = 51
    Width = 20
    Height = 13
    Caption = 'Tipo'
  end
  object Label3: TLabel
    Left = 24
    Top = 76
    Width = 55
    Height = 13
    Caption = 'Vencimento'
  end
  object Label4: TLabel
    Left = 24
    Top = 99
    Width = 113
    Height = 13
    Caption = 'C'#243'digo do Equipamento'
  end
  object Label5: TLabel
    Left = 23
    Top = 123
    Width = 45
    Height = 13
    Caption = 'M'#225'quinas'
  end
  object edLoja: TOvcNumericField
    Left = 141
    Top = 24
    Width = 164
    Height = 21
    Cursor = crIBeam
    DataType = nftLongInt
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Options = []
    PictureMask = 'iiiiiiiiiii'
    TabOrder = 0
    RangeHigh = {FFFFFF7F000000000000}
    RangeLow = {00000080000000000000}
  end
  object edTipo: TComboBox
    Left = 141
    Top = 48
    Width = 164
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 1
    Text = 'Tempor'#225'ria'
    Items.Strings = (
      'Tempor'#225'ria'
      'Definitiva'
      'Teste'
      'Loca'#231#227'o')
  end
  object edVenc: TOvcPictureField
    Left = 141
    Top = 72
    Width = 164
    Height = 21
    Cursor = crIBeam
    DataType = pftDate
    CaretOvr.Shape = csBlock
    ControlCharColor = clRed
    DecimalPlaces = 0
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Epoch = 0
    InitDateTime = False
    MaxLength = 10
    Options = [efoCaretToEnd]
    PictureMask = 'dd/mm/yyyy'
    TabOrder = 2
    RangeHigh = {25600D00000000000000}
    RangeLow = {00000000000000000000}
  end
  object edEquip: TEdit
    Left = 142
    Top = 96
    Width = 163
    Height = 21
    TabOrder = 3
  end
  object Button1: TButton
    Left = 24
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Gerar Serial'
    TabOrder = 4
    OnClick = Button1Click
  end
  object edSerial: TEdit
    Left = 24
    Top = 240
    Width = 281
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object edMaq: TOvcNumericField
    Left = 141
    Top = 122
    Width = 148
    Height = 21
    Cursor = crIBeam
    DataType = nftLongInt
    CaretOvr.Shape = csBlock
    EFColors.Disabled.BackColor = clWindow
    EFColors.Disabled.TextColor = clGrayText
    EFColors.Error.BackColor = clRed
    EFColors.Error.TextColor = clBlack
    EFColors.Highlight.BackColor = clHighlight
    EFColors.Highlight.TextColor = clHighlightText
    Options = []
    PictureMask = 'iiiiiiiiiii'
    TabOrder = 6
    RangeHigh = {FFFFFF7F000000000000}
    RangeLow = {00000080000000000000}
  end
  object Button2: TButton
    Left = 141
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 7
    OnClick = Button2Click
  end
  object OvcSpinner1: TOvcSpinner
    Left = 288
    Top = 123
    Width = 17
    Height = 21
    AutoRepeat = True
    Delta = 1.000000000000000000
    FocusedControl = edMaq
  end
end
