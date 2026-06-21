inherited frmAbout: TfrmAbout
  Caption = 'ExpressQuantumTreeList'
  ClientWidth = 793
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDescription: TcxGroupBox
    Width = 793
    inherited cxGroupBox6: TcxGroupBox
      inherited pnlHintInternal: TPanel
        Width = 779
        inherited lblRight2: TLabel
          Left = 774
        end
        inherited lblTop2: TLabel
          Width = 779
        end
        inherited lblBottom2: TLabel
          Width = 779
        end
        inherited lblDescription: TLabel
          Width = 769
        end
      end
    end
  end
  object gbTreeListPlace: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 1
    Height = 272
    Width = 793
    object cxGroupBox4: TcxGroupBox
      Left = 2
      Top = 9
      Align = alLeft
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      TabOrder = 0
      Height = 255
      Width = 6
    end
    object cxGroupBox5: TcxGroupBox
      Left = 785
      Top = 9
      Align = alRight
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      TabOrder = 1
      Height = 255
      Width = 6
    end
    object cxGroupBox2: TcxGroupBox
      Left = 2
      Top = 2
      Align = alTop
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      TabOrder = 2
      Height = 7
      Width = 789
    end
    object reAbout: TcxRichEdit
      Left = 8
      Top = 9
      Align = alClient
      Properties.HideSelection = False
      Properties.ReadOnly = True
      Properties.ScrollBars = ssVertical
      Style.Color = clWindow
      TabOrder = 3
      Height = 255
      Width = 777
    end
    object cxGroupBox1: TcxGroupBox
      Left = 2
      Top = 264
      Align = alBottom
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      TabOrder = 4
      Height = 6
      Width = 789
    end
  end
end
