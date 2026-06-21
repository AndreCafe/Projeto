inherited frameUltaFlatEditors: TframeUltaFlatEditors
  inherited pnCustomize: TPanel
    inherited Bevel8: TBevel
      ExplicitHeight = 234
    end
  end
  inherited pnForm: TPanel
    Color = clWindow
    inherited btnNextFilm: TcxButton
      LookAndFeel.Kind = lfUltraFlat
    end
    inherited btnPrevFilm: TcxButton
      LookAndFeel.Kind = lfUltraFlat
    end
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
    Style.BorderStyle = ebsSingle
    Style.HotTrack = True
    Style.ButtonTransparency = ebtHideInactive
    PixelsPerInch = 96
  end
end
