inherited frmIncSearchGrid: TfrmIncSearchGrid
  inherited plGrid: TPanel
    inherited Grid: TcxGrid
      object DBTableView: TcxGridDBTableView
        OnKeyDown = DBTableViewKeyDown
        OnMouseUp = DBTableViewMouseUp
        DataController.DataSource = dmMain.dsMovieStars
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.ImmediateEditor = False
        OptionsBehavior.IncSearch = True
        OptionsView.ColumnAutoWidth = True
        object DBTableViewBIRTHNAME: TcxGridDBColumn
          Caption = 'Birth Name'
          DataBinding.FieldName = 'BIRTHNAME'
          Width = 150
        end
        object DBTableViewDATEOFBIRTH: TcxGridDBColumn
          Caption = 'Birth Date'
          DataBinding.FieldName = 'DATEOFBIRTH'
          Width = 80
        end
        object DBTableViewBIOGRAPHY: TcxGridDBColumn
          Caption = 'Biography'
          DataBinding.FieldName = 'BIOGRAPHY'
          Width = 200
        end
        object DBTableViewGENDER: TcxGridDBColumn
          Caption = 'Gender'
          DataBinding.FieldName = 'GENDER'
          RepositoryItem = dmMain.edrepGenderImageCombo
          Width = 80
        end
      end
      object GridLevel: TcxGridLevel
        GridView = DBTableView
      end
    end
  end
  object Timer: TTimer
    Enabled = False
    Interval = 300
    OnTimer = TimerTimer
    Left = 104
    Top = 160
  end
end
