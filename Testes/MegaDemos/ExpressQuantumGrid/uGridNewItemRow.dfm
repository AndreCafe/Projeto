inherited frmNewItemRowGrid: TfrmNewItemRowGrid
  inherited plGrid: TPanel
    inherited Grid: TcxGrid
      inherited GridDBTableView: TcxGridDBTableView
        NewItemRow.InfoText = 'Click here to add a new row (customizable text)'
        NewItemRow.Visible = True
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
      end
    end
  end
end
