inherited frmGridAutoHeight: TfrmGridAutoHeight
  inherited plGrid: TPanel
    Top = 95
    Height = 126
    inherited Grid: TcxGrid
      Height = 126
      object DBTableView: TcxGridDBTableView
        OnGetCellHeight = DBTableViewGetCellHeight
        DataController.DataSource = dmMain.dsMovies
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.DataRowSizing = True
        OptionsCustomize.GroupRowSizing = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Indicator = True
        object DBTableViewCAPTION: TcxGridDBColumn
          DataBinding.FieldName = 'CAPTION'
          Width = 150
        end
        object DBTableViewPLOTOUTLINE: TcxGridDBColumn
          Caption = 'PlotOutline'
          DataBinding.FieldName = 'PLOTOUTLINE'
          PropertiesClassName = 'TcxMemoProperties'
          Width = 250
        end
        object DBTableViewPHOTO: TcxGridDBColumn
          DataBinding.FieldName = 'PHOTO'
          PropertiesClassName = 'TcxImageProperties'
          Properties.GraphicClassName = 'TJPEGImage'
          Width = 300
        end
      end
      object GridLevel: TcxGridLevel
        GridView = DBTableView
      end
    end
  end
  inherited pnlSeparator: TPanel
    Top = 95
  end
  object Panel1: TPanel
    Left = 0
    Top = 57
    Width = 435
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 4
    object Label1: TcxLabel
      Left = 9
      Top = 11
      Caption = 'Scale Image (%):'
      Transparent = True
    end
    object Label2: TcxLabel
      Left = 197
      Top = 13
      Caption = '(using the OnGetCellHeight event)'
      Transparent = True
    end
    object edImageHeight: TcxSpinEdit
      Left = 96
      Top = 9
      Properties.Increment = 5.000000000000000000
      Properties.LargeIncrement = 25.000000000000000000
      Properties.MaxValue = 200.000000000000000000
      Properties.MinValue = 25.000000000000000000
      Properties.SpinButtons.ShowFastButtons = True
      Properties.OnChange = edImageHeightPropertiesChange
      TabOrder = 0
      Value = 100
      Width = 91
    end
  end
end
