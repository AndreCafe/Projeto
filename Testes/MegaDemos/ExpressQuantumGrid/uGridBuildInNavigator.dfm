inherited frmGridBuildInNavigator: TfrmGridBuildInNavigator
  inherited plGrid: TPanel
    inherited Grid: TcxGrid
      Top = 41
      Height = 123
      inherited GridDBTableView: TcxGridDBTableView
        Navigator.InfoPanel.Visible = True
        Navigator.Visible = True
        OptionsBehavior.NavigatorHints = True
        OptionsView.NavigatorOffset = 100
        OptionsView.ColumnAutoWidth = False
      end
    end
    object pnlNavigator: TPanel
      Left = 0
      Top = 0
      Width = 435
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object lblExternalNavigator: TcxLabel
        Left = 8
        Top = 8
        Caption = 'External Navigator'
        Transparent = True
      end
      object cxNavigator1: TcxNavigator
        Left = 127
        Top = 5
        Width = 225
        Height = 25
        Control = Grid
        InfoPanel.Font.Charset = DEFAULT_CHARSET
        InfoPanel.Font.Color = clDefault
        InfoPanel.Font.Height = -11
        InfoPanel.Font.Name = 'MS Sans Serif'
        InfoPanel.Font.Style = []
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
  end
end
