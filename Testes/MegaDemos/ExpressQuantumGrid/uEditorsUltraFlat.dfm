inherited frameUltaFlatEditors: TframeUltaFlatEditors
  inherited pnCustomize: TPanel
    inherited pnlStyleControllerProperties: TPanel
      inherited lblStyleControllerProperties: TcxLabel
        Style.IsFontAssigned = True
      end
    end
  end
  inherited pnForm: TPanel
    Color = clWindow
    inherited lbDetails: TcxLabel
      Style.IsFontAssigned = True
    end
    inherited lbBiography: TcxLabel
      Style.IsFontAssigned = True
    end
    inherited lbFilm: TcxLabel
      Style.IsFontAssigned = True
    end
    inherited btnNextFilm: TcxButton
      LookAndFeel.Kind = lfUltraFlat
    end
    inherited btnPrevFilm: TcxButton
      LookAndFeel.Kind = lfUltraFlat
    end
    inherited btnPrevPhoto: TcxButton
      LookAndFeel.Kind = lfUltraFlat
    end
    inherited btnNextPhoto: TcxButton
      LookAndFeel.Kind = lfUltraFlat
    end
  end
  inherited StyleController: TcxEditStyleController
    Style.BorderStyle = ebsSingle
    Style.HotTrack = True
    Style.ButtonTransparency = ebtHideInactive
    PixelsPerInch = 96
  end
end
