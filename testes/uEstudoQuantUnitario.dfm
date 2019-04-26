object Form8: TForm8
  Left = 0
  Top = 0
  Caption = 'Form8'
  ClientHeight = 346
  ClientWidth = 563
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object panQtdPreco: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 7
    Width = 563
    Height = 44
    Margins.Left = 0
    Margins.Top = 7
    Margins.Right = 0
    Margins.Bottom = 0
    Constraints.MaxHeight = 44
    Align = alTop
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 0
    OnResize = panQtdPrecoResize
    object panQtd: TLMDSimplePanel
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 151
      Height = 44
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Bevel.BorderSides = [fsRight]
      Bevel.Mode = bmStandard
      Color = clWhite
      TabOrder = 0
      object edQuant: TcxCurrencyEdit
        AlignWithMargins = True
        Left = 4
        Top = 1
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        EditValue = 99999.000000000000000000
        ImeName = 'g'
        ParentFont = False
        Properties.Alignment.Vert = taVCenter
        Properties.AssignedValues.DisplayFormat = True
        Properties.DecimalPlaces = 5
        Properties.ImeName = 'g'
        Properties.OnChange = edQuantPropertiesEditValueChanged
        Properties.OnEditValueChanged = edQuantPropertiesEditValueChanged
        Style.BorderStyle = ebsNone
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -19
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleFocused.BorderStyle = ebsNone
        StyleFocused.Color = 8454143
        TabOrder = 0
        OnExit = edQuantExit
        ExplicitWidth = 57
        Width = 95
      end
      object lbUnid: TcxLabel
        AlignWithMargins = True
        Left = 99
        Top = 1
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 6
        Align = alRight
        Caption = '(KG)'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -19
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.TextColor = clBlack
        Style.TextStyle = [fsBold]
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        Properties.Alignment.Vert = taVCenter
        ExplicitLeft = 108
        AnchorY = 21
      end
    end
    object panUnit: TLMDSimplePanel
      Left = 168
      Top = 0
      Width = 145
      Height = 44
      Margins.Left = 7
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Bevel.BorderSides = [fsRight]
      Bevel.Mode = bmStandard
      Color = clWhite
      TabOrder = 2
      OnEnter = panUnitEnter
      OnExit = panUnitExit
      ExplicitLeft = 151
      object edUnit: TcxCurrencyEdit
        Left = 37
        Top = 1
        Align = alClient
        EditValue = 1.000000000000000000
        ImeName = 'g'
        ParentFont = False
        Properties.Alignment.Vert = taVCenter
        Properties.DecimalPlaces = 5
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.ImeName = 'g'
        Properties.UseDisplayFormatWhenEditing = True
        Style.BorderStyle = ebsNone
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -19
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.TextColor = clBlack
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleFocused.BorderStyle = ebsNone
        StyleFocused.Color = 8454143
        TabOrder = 0
        Width = 107
      end
      object cxLabel5: TcxLabel
        AlignWithMargins = True
        Left = 5
        Top = 1
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 0
        Align = alLeft
        Caption = 'R$ '
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -19
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.TextColor = clBlack
        Style.TextStyle = [fsBold]
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        Properties.Alignment.Vert = taVCenter
        AnchorY = 21
      end
    end
    object panTotal: TLMDSimplePanel
      Left = 333
      Top = 0
      Width = 230
      Height = 44
      Margins.Left = 7
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Bevel.BorderSides = [fsRight]
      Bevel.Mode = bmStandard
      Color = clWhite
      TabOrder = 3
      ExplicitLeft = 296
      ExplicitWidth = 267
      object edTotal: TcxCurrencyEdit
        Left = 37
        Top = 1
        Align = alClient
        EditValue = 1.000000000000000000
        ImeName = 'g'
        ParentFont = False
        Properties.Alignment.Vert = taVCenter
        Properties.DecimalPlaces = 5
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.ImeName = 'g'
        Properties.UseDisplayFormatWhenEditing = True
        Style.BorderStyle = ebsNone
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -19
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.HotTrack = False
        Style.TextColor = clRed
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleFocused.BorderStyle = ebsNone
        StyleFocused.Color = 8454143
        TabOrder = 0
        OnEnter = edTotalEnter
        OnExit = edTotalExit
        ExplicitWidth = 229
        Width = 192
      end
      object cxLabel1: TcxLabel
        AlignWithMargins = True
        Left = 5
        Top = 1
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 0
        Align = alLeft
        Caption = 'R$ '
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -19
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.TextColor = clRed
        Style.TextStyle = [fsBold]
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        Properties.Alignment.Vert = taVCenter
        AnchorY = 21
      end
    end
    object btnLancar: TcxButton
      AlignWithMargins = True
      Left = 821
      Top = 1
      Width = 43
      Height = 42
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = 'Lan'#231'ar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = False
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      OptionsImage.Glyph.Data = {
        D6050000424DD6050000000000003600000028000000180000000F0000000100
        200000000000A005000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000002F000000CF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000005F000000EF000000FF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000F0000009F000000FF000000FF000000FF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000002F000000DF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
        0000000000EF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
        00000000000F000000BF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
        000000000000000000000000007F000000FF000000FF000000FF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000FF000000FF000000FF0000000000000000000000000000
        00000000000000000000000000000000004F000000EF000000FF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000FF000000FF000000FF0000000000000000000000000000
        0000000000000000000000000000000000000000001F000000CF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000FF000000FF000000FF0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000FF000000FF000000FF0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000FF000000FF000000FF0000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      OptionsImage.Layout = blGlyphBottom
      SpeedButtonOptions.AllowAllUp = True
      SpeedButtonOptions.Flat = True
    end
    object cxLabel2: TcxLabel
      Left = 151
      Top = 0
      Align = alLeft
      Caption = 'X'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      ExplicitLeft = 147
      AnchorX = 160
      AnchorY = 22
    end
    object cxLabel3: TcxLabel
      Left = 313
      Top = 0
      Align = alLeft
      Caption = '='
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      ExplicitLeft = 302
      AnchorX = 323
      AnchorY = 22
    end
  end
  object lbSize: TcxLabel
    Left = 104
    Top = 272
    Caption = 'lbSize'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Visible = False
  end
  object cxCurrencyEdit2: TcxCurrencyEdit
    Left = 312
    Top = 288
    TabOrder = 2
    Width = 121
  end
  object cxPropertiesStore1: TcxPropertiesStore
    Components = <>
    StorageName = 'cxPropertiesStore1'
    Left = 80
    Top = 64
  end
end
