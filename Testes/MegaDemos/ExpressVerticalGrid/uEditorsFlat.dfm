inherited frameFlatEditors: TframeFlatEditors
  inherited pnCustomize: TPanel
    inherited Bevel8: TBevel
      ExplicitHeight = 234
    end
  end
  inherited pnForm: TPanel
    inherited btnNextFilm: TcxButton
      LookAndFeel.Kind = lfFlat
    end
    inherited btnPrevFilm: TcxButton
      LookAndFeel.Kind = lfFlat
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
    Style.BorderStyle = ebsFlat
    PixelsPerInch = 96
  end
end
