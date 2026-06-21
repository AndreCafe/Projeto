inherited frameFlatEditors: TframeFlatEditors
  inherited pnCustomize: TPanel
    inherited pnlStyleControllerProperties: TPanel
      inherited lblStyleControllerProperties: TcxLabel
        Style.IsFontAssigned = True
      end
    end
  end
  inherited pnForm: TPanel
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
      LookAndFeel.Kind = lfFlat
    end
    inherited btnPrevFilm: TcxButton
      LookAndFeel.Kind = lfFlat
    end
    inherited btnPrevPhoto: TcxButton
      LookAndFeel.Kind = lfFlat
    end
    inherited btnNextPhoto: TcxButton
      LookAndFeel.Kind = lfFlat
    end
  end
  inherited StyleController: TcxEditStyleController
    Style.BorderStyle = ebsFlat
    PixelsPerInch = 96
  end
end
