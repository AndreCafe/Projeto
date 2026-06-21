inherited frmAdvancedFilteringGrid: TfrmAdvancedFilteringGrid
  inherited plGrid: TPanel
    inherited Grid: TcxGrid
      Top = 199
      Height = 275
      inherited GridDBTableView: TcxGridDBTableView
        FilterBox.Visible = fvAlways
      end
    end
    object pnlFilterApply: TPanel
      Left = 0
      Top = 161
      Width = 435
      Height = 38
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object btnApply: TcxButton
        Left = 10
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Apply'
        TabOrder = 0
        OnClick = btnApplyClick
        LookAndFeel.NativeStyle = True
      end
      object btnReset: TcxButton
        Left = 106
        Top = 8
        Width = 75
        Height = 25
        Caption = '&Reset'
        TabOrder = 1
        OnClick = btnResetClick
        LookAndFeel.NativeStyle = True
      end
      object btOpen: TcxButton
        Left = 207
        Top = 8
        Width = 75
        Height = 25
        Hint = 'Open|Opens an existing filter'
        Caption = '&Open...'
        TabOrder = 2
        OnClick = btOpenClick
      end
      object btSave: TcxButton
        Left = 289
        Top = 8
        Width = 75
        Height = 25
        Hint = 'Save As|Saves the active filter with a new name'
        Caption = 'Save &As...'
        TabOrder = 3
        OnClick = btSaveClick
      end
    end
    object pnlFilter: TPanel
      Left = 0
      Top = 0
      Width = 435
      Height = 161
      Align = alTop
      BevelOuter = bvNone
      BorderWidth = 5
      TabOrder = 2
      object FilterControl: TcxFilterControl
        Left = 5
        Top = 5
        Width = 425
        Height = 151
        Align = alClient
        LinkComponent = GridDBTableView
        TabOrder = 0
      end
    end
  end
  object SaveDialog: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 360
    Top = 112
  end
  object OpenDialog: TOpenDialog
    Left = 288
    Top = 112
  end
end
