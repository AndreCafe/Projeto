inherited frameWebEditors: TframeWebEditors
  inherited pnCustomize: TPanel
    inherited pnlStyleControllerProperties: TPanel
      inherited lblStyleControllerProperties: TcxLabel
        Style.IsFontAssigned = True
      end
    end
  end
  inherited pnForm: TPanel
    Color = 16709078
    inherited PaintBox: TPaintBox
      Color = clInfoBk
      ParentColor = False
    end
    object Shape1: TShape [4]
      Left = 78
      Top = 18
      Width = 448
      Height = 4
      Brush.Color = 15707467
      Pen.Style = psClear
      Shape = stRoundRect
    end
    object Shape2: TShape [5]
      Left = 152
      Top = 92
      Width = 374
      Height = 4
      Brush.Color = 15707467
      Pen.Style = psClear
      Shape = stRoundRect
    end
    object Shape3: TShape [6]
      Left = 192
      Top = 268
      Width = 334
      Height = 4
      Brush.Color = 15707467
      Pen.Style = psClear
      Shape = stRoundRect
    end
    object Shape4: TShape [7]
      Left = 0
      Top = 10
      Width = 51
      Height = 19
      Brush.Color = 15707467
      Pen.Style = psClear
      Shape = stRoundRect
    end
    object Shape5: TShape [8]
      Left = 0
      Top = 82
      Width = 127
      Height = 19
      Brush.Color = 15707467
      Pen.Style = psClear
      Shape = stRoundRect
    end
    object Shape6: TShape [9]
      Left = 0
      Top = 259
      Width = 169
      Height = 19
      Brush.Color = 15707467
      Pen.Style = psClear
      Shape = stRoundRect
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
    Style.BorderColor = 15707467
    Style.BorderStyle = ebsSingle
    Style.HotTrack = True
    Style.ButtonStyle = btsSimple
    PixelsPerInch = 96
  end
end
