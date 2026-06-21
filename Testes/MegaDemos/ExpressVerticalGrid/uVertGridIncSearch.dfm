inherited frmVerticalGridIncSearch: TfrmVerticalGridIncSearch
  object VerticalGrid: TcxDBVerticalGrid
    Left = 0
    Top = 25
    Width = 443
    Height = 200
    Align = alClient
    LayoutStyle = lsMultiRecordView
    OptionsView.RowHeaderWidth = 162
    OptionsView.ValueWidth = 221
    OptionsBehavior.IncSearch = True
    OptionsBehavior.IncSearchItem = VerticalGridBIRTHNAME
    TabOrder = 3
    OnKeyDown = VerticalGridKeyDown
    OnMouseUp = VerticalGridMouseUp
    DataController.DataSource = dmMain.dsMovieStars
    object VerticalGridBIRTHNAME: TcxDBEditorRow
      Properties.Caption = 'Birth Name'
      Properties.DataBinding.FieldName = 'BIRTHNAME'
    end
    object VerticalGridDATEOFBIRTH: TcxDBEditorRow
      Properties.Caption = 'Birth Date'
      Properties.DataBinding.FieldName = 'DATEOFBIRTH'
    end
    object VerticalGridNICKNAME: TcxDBEditorRow
      Properties.Caption = 'Nick Name'
      Properties.DataBinding.FieldName = 'NICKNAME'
    end
    object VerticalGridGENDER: TcxDBEditorRow
      Properties.Caption = 'Gender'
      Properties.RepositoryItem = dmMain.edrepGenderImageCombo
      Properties.DataBinding.FieldName = 'GENDER'
    end
    object VerticalGridCategoryRow1: TcxCategoryRow
      Expanded = False
      Properties.Caption = 'Additional Info'
      object VerticalGridBIOGRAPHY: TcxDBEditorRow
        Height = 300
        Properties.Caption = 'Biography'
        Properties.EditPropertiesClassName = 'TcxMemoProperties'
        Properties.DataBinding.FieldName = 'BIOGRAPHY'
      end
    end
  end
  object Timer: TTimer
    Enabled = False
    Interval = 300
    OnTimer = TimerTimer
    Left = 64
    Top = 136
  end
end
