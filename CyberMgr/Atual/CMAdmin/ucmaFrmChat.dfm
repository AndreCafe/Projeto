inherited FrmChat: TFrmChat
  Caption = 'FrmChat'
  ClientWidth = 306
  ExplicitWidth = 314
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TLMDSplitterPanel
    Width = 306
    Bars = <
      item
        OldPosition = -1
        Position = 366
        PosPercent = 81
      end>
    ExplicitWidth = 306
    inherited LMDSplitterPane1: TLMDSplitterPane
      ExplicitWidth = 306
      ExplicitHeight = 366
      inherited RV: TRichView
        Width = 304
        Height = 364
        ExplicitWidth = 304
        ExplicitHeight = 364
      end
    end
    inherited LMDSplitterPane2: TLMDSplitterPane
      ExplicitTop = 369
      ExplicitWidth = 306
      ExplicitHeight = 87
      inherited meTexto: TMemo
        Width = 246
        Height = 85
        ExplicitWidth = 246
        ExplicitHeight = 85
      end
      inherited panEnviar: TLMDSimplePanel
        Left = 246
        Height = 85
        ExplicitLeft = 246
        ExplicitHeight = 85
        inherited edMaq: TcxComboBox
          Style.IsFontAssigned = True
        end
      end
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 72
    Top = 88
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clGreen
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clNavy
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13565902
      TextColor = clGreen
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16767449
      TextColor = clNavy
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clBlack
    end
  end
end
