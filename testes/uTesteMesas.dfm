object Form8: TForm8
  Left = 0
  Top = 0
  Caption = 'Form8'
  ClientHeight = 696
  ClientWidth = 1176
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object LMDSimplePanel1: TLMDSimplePanel
    AlignWithMargins = True
    Left = 3
    Top = 424
    Width = 1170
    Height = 269
    Align = alBottom
    Bevel.Mode = bmStandard
    Color = clWhite
    TabOrder = 0
    object LMDSimplePanel2: TLMDSimplePanel
      Left = 553
      Top = 1
      Width = 616
      Height = 267
      Align = alClient
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsSingleRaised
      TabOrder = 0
      ExplicitHeight = 688
      object LMDSimplePanel4: TLMDSimplePanel
        AlignWithMargins = True
        Left = 11
        Top = 6
        Width = 594
        Height = 48
        Margins.Left = 10
        Margins.Top = 5
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alTop
        Bevel.Mode = bmCustom
        TabOrder = 0
        object cxSpinEdit1: TcxSpinEdit
          AlignWithMargins = True
          Left = 43
          Top = 5
          Margins.Top = 5
          Margins.Bottom = 5
          Align = alLeft
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          Style.BorderColor = clGray
          Style.BorderStyle = ebsFlat
          Style.Color = clWindow
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -21
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.ButtonStyle = btsUltraFlat
          Style.ButtonTransparency = ebtHideInactive
          Style.IsFontAssigned = True
          StyleFocused.Color = clWhite
          TabOrder = 0
          Value = 10
          Width = 76
        end
        object cxLabel1: TcxLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Align = alLeft
          Caption = 'Mesa'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.TextColor = clBlack
          Style.IsFontAssigned = True
          Properties.Alignment.Vert = taVCenter
          AnchorY = 24
        end
      end
      object LMDSimplePanel5: TLMDSimplePanel
        AlignWithMargins = True
        Left = 11
        Top = 64
        Width = 594
        Height = 192
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsNone
        TabOrder = 1
        ExplicitHeight = 613
        object cxPageControl1: TcxPageControl
          Left = 0
          Top = 0
          Width = 594
          Height = 192
          Align = alClient
          TabOrder = 0
          Properties.ActivePage = cxTabSheet1
          Properties.CustomButtons.Buttons = <>
          Properties.Style = 3
          ExplicitHeight = 613
          ClientRectBottom = 192
          ClientRectRight = 594
          ClientRectTop = 26
          object cxTabSheet1: TcxTabSheet
            Caption = 'Consumo Atual'
            ImageIndex = 0
            ExplicitHeight = 587
          end
          object cxTabSheet2: TcxTabSheet
            Caption = 'Contas Anteriores'
            ImageIndex = 1
            ExplicitHeight = 587
          end
        end
      end
    end
    object LMDSimplePanel3: TLMDSimplePanel
      Left = 1
      Top = 1
      Width = 552
      Height = 267
      Margins.Left = 0
      Margins.Top = 42
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Bevel.StyleInner = bvNormal
      Bevel.WidthInner = 0
      Bevel.BorderColor = clGrayText
      Bevel.BorderSides = [fsTop]
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      Color = clWhite
      TabOrder = 1
      ExplicitHeight = 688
      object cxLabel2: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        Caption = 'Mesas'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        AnchorX = 276
        AnchorY = 10
      end
    end
  end
  object LMDSplitterPanel1: TLMDSplitterPanel
    Left = 312
    Top = 128
    Width = 641
    Height = 217
    Bevel.Mode = bmCustom
    Bars = <
      item
        OldPosition = -1
        Position = 319
      end>
    TabOrder = 1
    object LMDSplitterPane1: TLMDSplitterPane
    end
    object LMDSplitterPane3: TLMDSplitterPane
    end
  end
end
