inherited frmGridPreview: TfrmGridPreview
  inherited plGrid: TPanel
    inherited Grid: TcxGrid
      object DBTableView: TcxGridDBTableView
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.ColumnAutoWidth = True
        Preview.Column = DBTableViewBIOGRAPHY
        Preview.MaxLineCount = 10
        Preview.Visible = True
        object DBTableViewFIRSTNAME: TcxGridDBColumn
          Caption = 'First Name'
          DataBinding.FieldName = 'FIRSTNAME'
        end
        object DBTableViewSECONDNAME: TcxGridDBColumn
          Caption = 'Second Name'
          DataBinding.FieldName = 'SECONDNAME'
        end
        object DBTableViewBIRTHNAME: TcxGridDBColumn
          Caption = 'Birth Name'
          DataBinding.FieldName = 'BIRTHNAME'
        end
        object DBTableViewBIOGRAPHY: TcxGridDBColumn
          Caption = 'Biography'
          DataBinding.FieldName = 'BIOGRAPHY'
        end
        object DBTableViewGENDER: TcxGridDBColumn
          Caption = 'Gender'
          DataBinding.FieldName = 'GENDER'
          RepositoryItem = dmMain.edrepGenderImageCombo
        end
        object DBTableViewBirthDate: TcxGridDBColumn
          Caption = 'Birth Date'
          DataBinding.FieldName = 'DATEOFBIRTH'
        end
      end
      object GridLevel: TcxGridLevel
        GridView = DBTableView
      end
    end
  end
end
