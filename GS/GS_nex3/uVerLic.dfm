object Form1: TForm1
  Left = 173
  Top = 165
  Width = 485
  Height = 286
  Caption = 'Gerar Licen'#231'a'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 104
    Top = 160
    Width = 20
    Height = 16
    Caption = '. . .'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 28
    Width = 20
    Height = 13
    Caption = 'Loja'
  end
  object Label3: TLabel
    Left = 16
    Top = 60
    Width = 56
    Height = 13
    Caption = 'Vencimento'
  end
  object Label4: TLabel
    Left = 16
    Top = 92
    Width = 24
    Height = 13
    Caption = 'Serie'
  end
  object Label5: TLabel
    Left = 16
    Top = 124
    Width = 46
    Height = 13
    Caption = 'Maquinas'
  end
  object Button1: TButton
    Left = 16
    Top = 200
    Width = 105
    Height = 25
    Caption = 'Gerar Licenca'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edSerie: TEdit
    Left = 104
    Top = 88
    Width = 345
    Height = 21
    TabOrder = 1
  end
  object edMaq: TEdit
    Left = 104
    Top = 120
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '10'
  end
  object edData: TOvcPictureField
    Left = 104
    Top = 56
    Width = 130
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
    InitDateTime = True
    MaxLength = 10
    Options = [efoCaretToEnd]
    PictureMask = 'dd/mm/yyyy'
    TabOrder = 3
    RangeHigh = {25600D00000000000000}
    RangeLow = {00000000000000000000}
  end
  object TEdit
    Left = 104
    Top = 24
    Width = 129
    Height = 21
    TabOrder = 4
  end
end
