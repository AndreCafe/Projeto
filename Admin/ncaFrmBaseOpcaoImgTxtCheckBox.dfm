inherited FrmBaseOpcaoImgTxtCheckBox: TFrmBaseOpcaoImgTxtCheckBox
  Caption = 'FrmBaseOpcaoImgTxtCheckBox'
  PixelsPerInch = 96
  TextHeight = 16
  inherited panPri: TLMDSimplePanel
    inherited panTopo: TLMDSimplePanel
      object CB: TcxCheckBox
        AlignWithMargins = True
        Left = 58
        Top = 3
        Cursor = crHandPoint
        Margins.Left = 10
        Align = alClient
        Caption = 'CHECKBOX'
        Properties.MultiLine = True
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextStyle = [fsBold]
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 460
      end
    end
  end
end
