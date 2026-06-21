inherited frameShadowedEditors: TframeShadowedEditors
  Width = 435
  Height = 266
  inherited pnCustomize: TPanel
    inherited pnlStyleControllerProperties: TPanel
      inherited lblStyleControllerProperties: TcxLabel
        Style.IsFontAssigned = True
      end
    end
  end
  inherited pnForm: TPanel
    inherited PaintBox: TPaintBox
      OnPaint = PaintBoxPaint
    end
    inherited lbDetails: TcxLabel
      Style.IsFontAssigned = True
    end
    inherited lbBiography: TcxLabel
      Style.IsFontAssigned = True
    end
    inherited lbFilm: TcxLabel
      Style.IsFontAssigned = True
    end
  end
  inherited StyleController: TcxEditStyleController
    Style.BorderColor = clTeal
    Style.BorderStyle = ebsSingle
    Style.HotTrack = True
    Style.Shadow = True
    Style.ButtonStyle = btsSimple
    PixelsPerInch = 96
  end
end
