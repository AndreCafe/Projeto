inherited frameStdEditors: TframeStdEditors
  inherited pnCustomize: TPanel
    inherited Bevel8: TBevel
      ExplicitHeight = 234
    end
  end
  inherited pnForm: TPanel
    inherited edCountry: TcxDBLookupComboBox
      Properties.KeyFieldNames = ''
      Properties.ListSource = nil
    end
    inherited lbBiography: TcxLabel
      Style.IsFontAssigned = True
    end
    inherited lbDetails: TcxLabel
      Style.IsFontAssigned = True
    end
  end
  inherited pnlDescription: TPanel
    inherited lblRight1: TLabel
      ExplicitLeft = 446
    end
    inherited lblTop1: TLabel
      ExplicitWidth = 451
    end
    inherited lblBottom1: TLabel
      ExplicitWidth = 451
    end
  end
  inherited lbFilm: TcxLabel
    Style.IsFontAssigned = True
  end
  inherited StyleController: TcxEditStyleController
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = True
    PixelsPerInch = 96
  end
end
