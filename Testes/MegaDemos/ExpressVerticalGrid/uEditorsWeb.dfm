inherited frameWebEditors: TframeWebEditors
  inherited pnForm: TPanel
    Color = 16709078
    inherited PaintBox: TPaintBox
      Color = clInfoBk
      ParentColor = False
    end
    object Shape4: TShape [8]
      Left = 0
      Top = 10
      Width = 51
      Height = 19
      Brush.Color = 15707467
      Pen.Style = psClear
      Shape = stRoundRect
    end
    object Shape5: TShape [9]
      Left = 0
      Top = 82
      Width = 127
      Height = 19
      Brush.Color = 15707467
      Pen.Style = psClear
      Shape = stRoundRect
    end
    object Shape6: TShape [10]
      Left = 0
      Top = 259
      Width = 169
      Height = 19
      Brush.Color = 15707467
      Pen.Style = psClear
      Shape = stRoundRect
    end
    inherited lbBiography: TcxLabel
      Top = 83
      AutoSize = True
      Style.IsFontAssigned = True
      Properties.LineOptions.Visible = False
    end
    inherited lbDetails: TcxLabel
      AutoSize = True
      Style.IsFontAssigned = True
      Properties.LineOptions.Visible = False
    end
  end
  inherited pnlDescription: TPanel
    Top = 650
    Width = 817
    inherited lblRight1: TLabel
      Left = 812
    end
    inherited lblTop1: TLabel
      Width = 817
    end
    inherited lblBottom1: TLabel
      Width = 817
    end
    inherited pnlHintInternal: TPanel
      Width = 807
      inherited lblRight2: TLabel
        Left = 802
      end
      inherited lblTop2: TLabel
        Width = 807
      end
      inherited lblBottom2: TLabel
        Width = 807
      end
      inherited lblDescription: TLabel
        Width = 797
      end
    end
  end
  inherited lbFilm: TcxLabel
    Top = 289
    AutoSize = True
    Style.IsFontAssigned = True
    Properties.LineOptions.Visible = False
  end
  inherited StyleController: TcxEditStyleController
    Style.BorderColor = 15707467
    Style.BorderStyle = ebsSingle
    Style.HotTrack = True
    Style.ButtonStyle = btsSimple
  end
end
