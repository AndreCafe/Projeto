inherited frmMultiEditorsGrid: TfrmMultiEditorsGrid
  inherited plGrid: TPanel
    inherited Grid: TcxGrid
      Top = 38
      Height = 126
      object TableView: TcxGridTableView
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.ShowEditButtons = gsebAlways
        OptionsView.ColumnAutoWidth = True
        object clnName: TcxGridColumn
          Caption = 'Name'
          GroupIndex = 0
          Options.Editing = False
          Options.Focusing = False
          SortIndex = 0
          SortOrder = soAscending
        end
        object clnSkill: TcxGridColumn
          Caption = 'Skill'
          Options.Editing = False
          Options.Focusing = False
        end
        object clnGrade: TcxGridColumn
          Caption = 'Grade'
          OnGetProperties = clnGradeGetProperties
          Options.Filtering = False
          Options.Sorting = False
        end
      end
      object Level: TcxGridLevel
        GridView = TableView
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 435
      Height = 38
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object cbGroupsExpanded: TcxCheckBox
        Left = 18
        Top = 10
        Caption = 'Groups always expand'
        Properties.OnChange = cbGroupsExpandedPropertiesChange
        State = cbsChecked
        TabOrder = 0
        Transparent = True
        Width = 180
      end
    end
  end
  object EditRepository: TcxEditRepository
    Left = 216
    Top = 96
    object ImageComboLanguages: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Assembler'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Delphi'
          ImageIndex = 1
          Value = 1
        end
        item
          Description = 'Visual Basic'
          ImageIndex = 2
          Value = 2
        end
        item
          Description = 'C++'
          ImageIndex = 3
          Value = 3
        end
        item
          Description = 'Java'
          ImageIndex = 4
          Value = 4
        end>
    end
    object ImageComboCommunication: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Bad'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Average'
          ImageIndex = 1
          Value = 1
        end
        item
          Description = 'Good'
          ImageIndex = 2
          Value = 2
        end
        item
          Description = 'Excellent'
          ImageIndex = 3
          Value = 3
        end>
    end
    object SpinItemYears: TcxEditRepositorySpinItem
      Properties.MaxValue = 30.000000000000000000
      Properties.MinValue = 1.000000000000000000
    end
    object DateItemStartWorkFrom: TcxEditRepositoryDateItem
    end
  end
end
