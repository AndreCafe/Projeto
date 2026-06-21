inherited frameShadowedEditors: TframeShadowedEditors
  Width = 737
  Height = 690
  inherited plTop: TPanel
    Width = 737
  end
  inherited pnlSeparator: TPanel
    Width = 737
  end
  inherited pnCustomize: TPanel
    Left = 534
    Height = 620
    inherited Bevel8: TBevel
      Height = 620
    end
  end
  inherited pnForm: TPanel
    inherited PaintBox: TPaintBox
      OnPaint = PaintBoxPaint
    end
    inherited lbBiography: TcxLabel
      Style.IsFontAssigned = True
    end
    inherited lbDetails: TcxLabel
      Style.IsFontAssigned = True
    end
  end
  inherited pnlDescription: TPanel
    Top = 645
    Width = 737
    inherited lblRight1: TLabel
      Left = 732
    end
    inherited lblTop1: TLabel
      Width = 737
    end
    inherited lblBottom1: TLabel
      Width = 737
    end
    inherited pnlHintInternal: TPanel
      Width = 727
      inherited lblRight2: TLabel
        Left = 722
      end
      inherited lblTop2: TLabel
        Width = 727
      end
      inherited lblBottom2: TLabel
        Width = 727
      end
      inherited lblDescription: TLabel
        Width = 717
      end
    end
  end
  inherited lbFilm: TcxLabel
    Style.IsFontAssigned = True
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
