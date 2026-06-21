inherited frmGridUnbound: TfrmGridUnbound
  inherited plGrid: TPanel
    Height = 152
    inherited Grid: TcxGrid
      Height = 152
      object TableView: TcxGridTableView
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = clnID
          end
          item
            Kind = skSum
            Column = clnCurrency
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.MultiSelect = True
        OptionsView.ColumnAutoWidth = True
        object clnID: TcxGridColumn
          Caption = 'ID'
          PropertiesClassName = 'TcxSpinEditProperties'
          Options.Filtering = False
          Width = 68
        end
        object clnName: TcxGridColumn
          Caption = 'Text (Randomly Generated)'
          Width = 216
        end
        object clnDate: TcxGridColumn
          Caption = 'Date (Randomly Generated)'
          PropertiesClassName = 'TcxDateEditProperties'
          Width = 200
        end
        object clnCurrency: TcxGridColumn
          Caption = 'Currency (Randomly Generated)'
          Width = 199
        end
      end
      object RootLevel: TcxGridLevel
        GridView = TableView
      end
    end
  end
  inherited pnlDescription: TPanel
    Top = 209
    Height = 57
    inherited lblLeft1: TcxLabel
      Height = 47
    end
    inherited lblRight1: TcxLabel
      Height = 47
    end
    inherited lblBottom1: TcxLabel
      Top = 52
    end
    inherited pnlHintInternal: TPanel
      Height = 47
      inherited lblLeft2: TcxLabel
        Height = 37
      end
      inherited lblRight2: TcxLabel
        Height = 37
      end
      inherited lblBottom2: TcxLabel
        Top = 42
      end
      inherited lblDescription: TcxLabel
        Height = 37
      end
    end
  end
end
