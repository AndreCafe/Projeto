inherited frmGridCustomMasterDetail: TfrmGridCustomMasterDetail
  inherited plGrid: TPanel
    inherited Grid: TcxGrid
      RootLevelOptions.DetailTabsPosition = dtpTop
      object tvDepartments: TcxGridDBTableView
        DataController.DataSource = dmMain.dsDepartment
        DataController.KeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object tvDepartmentsID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          Visible = False
        end
        object tvDepartmentsNAME: TcxGridDBColumn
          Caption = 'Department name'
          DataBinding.FieldName = 'NAME'
        end
      end
      object tvEmployee: TcxGridDBTableView
        DataController.DataSource = dmMain.dsUsers
        DataController.DetailKeyFieldNames = 'DEPARTMENTID'
        DataController.KeyFieldNames = 'ID'
        DataController.MasterKeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = tvEmployeeFNAME
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object tvEmployeeFNAME: TcxGridDBColumn
          DataBinding.FieldName = 'FNAME'
          Width = 120
        end
        object tvEmployeeLNAME: TcxGridDBColumn
          DataBinding.FieldName = 'LNAME'
          Width = 120
        end
        object tvEmployeeEMAIL: TcxGridDBColumn
          Caption = 'E-mail'
          DataBinding.FieldName = 'EMAIL'
          Width = 120
        end
        object tvEmployeePHONE: TcxGridDBColumn
          DataBinding.FieldName = 'PHONE'
          RepositoryItem = dmMain.edrepPhoneItem
          Width = 100
        end
        object tvEmployeeDepartmentName: TcxGridDBColumn
          Caption = 'Department'
          DataBinding.FieldName = 'DEPARTMENTID'
          RepositoryItem = dmMain.edrepDepartmentLookup
          Width = 80
        end
      end
      object cvEmployee: TcxGridDBCardView
        DataController.DataSource = dmMain.dsUsers
        DataController.DetailKeyFieldNames = 'DEPARTMENTID'
        DataController.KeyFieldNames = 'ID'
        DataController.MasterKeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        LayoutDirection = ldVertical
        OptionsCustomize.CardExpanding = True
        OptionsCustomize.RowFiltering = False
        OptionsView.CardIndent = 7
        OptionsView.CardWidth = 300
        object cvEmployeeName: TcxGridDBCardViewRow
          Caption = 'Name'
          OnGetDisplayText = cvEmployeeNameGetDisplayText
          Kind = rkCaption
          Position.BeginsLayer = True
        end
        object cvEmployeeFNAME: TcxGridDBCardViewRow
          DataBinding.FieldName = 'FNAME'
          Position.BeginsLayer = True
        end
        object cvEmployeeMNAME: TcxGridDBCardViewRow
          DataBinding.FieldName = 'MNAME'
          Position.BeginsLayer = True
        end
        object cvEmployeeLNAME: TcxGridDBCardViewRow
          DataBinding.FieldName = 'LNAME'
          Position.BeginsLayer = True
        end
        object cvEmployeeEMAIL: TcxGridDBCardViewRow
          Caption = 'E-mail'
          DataBinding.FieldName = 'EMAIL'
          Position.BeginsLayer = True
        end
        object cvEmployeePHONE: TcxGridDBCardViewRow
          DataBinding.FieldName = 'PHONE'
          RepositoryItem = dmMain.edrepPhoneItem
          Position.BeginsLayer = True
        end
        object cvEmployeeDepartmentName: TcxGridDBCardViewRow
          Caption = 'Department'
          DataBinding.FieldName = 'DEPARTMENTID'
          RepositoryItem = dmMain.edrepDepartmentLookup
          Position.BeginsLayer = True
        end
      end
      object tvProjects: TcxGridDBTableView
        DataController.DataSource = dmMain.dsProjects
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.ColumnAutoWidth = True
        object tvProjectsNAME: TcxGridDBColumn
          Caption = 'Name'
          DataBinding.FieldName = 'NAME'
          Width = 200
        end
        object tvProjectsMANAGERID: TcxGridDBColumn
          Caption = 'Manager'
          DataBinding.FieldName = 'MANAGERID'
          RepositoryItem = dmMain.edrepUserLookup
          Width = 200
        end
      end
      object tvItems: TcxGridDBTableView
        DataController.DataSource = dmMain.dsItems
        DataController.DetailKeyFieldNames = 'PROJECTID'
        DataController.KeyFieldNames = 'ID'
        DataController.MasterKeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skMin
            Column = tvItemsCREATEDDATE
          end
          item
            Kind = skMax
            Column = tvItemsFIXEDDATE
          end
          item
            Kind = skCount
            Column = tvItemsNAME
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        Preview.Column = tvItemsDESCRIPTION
        object tvItemsNAME: TcxGridDBColumn
          Caption = 'Name'
          DataBinding.FieldName = 'NAME'
          Width = 150
        end
        object tvItemsTYPE: TcxGridDBColumn
          Caption = 'Type'
          DataBinding.FieldName = 'TYPE'
          RepositoryItem = dmMain.edrepTypeImageCombo
          Width = 80
        end
        object tvItemsPROJECTID: TcxGridDBColumn
          Caption = 'Project'
          DataBinding.FieldName = 'PROJECTID'
          RepositoryItem = dmMain.edrepProjectLookup
          Width = 120
        end
        object tvItemsPRIORITY: TcxGridDBColumn
          Caption = 'Priority'
          DataBinding.FieldName = 'PRIORITY'
          RepositoryItem = dmMain.edrepPriorityImageCombo
          Width = 80
        end
        object tvItemsSTATUS: TcxGridDBColumn
          Caption = 'Status'
          DataBinding.FieldName = 'STATUS'
          RepositoryItem = dmMain.edrepStatusImageCombo
          Width = 80
        end
        object tvItemsCREATORID: TcxGridDBColumn
          Caption = 'Creator'
          DataBinding.FieldName = 'CREATORID'
          RepositoryItem = dmMain.edrepUserLookup
          Visible = False
          Width = 120
        end
        object tvItemsCREATEDDATE: TcxGridDBColumn
          Caption = 'Created Date'
          DataBinding.FieldName = 'CREATEDDATE'
          Width = 100
        end
        object tvItemsOWNERID: TcxGridDBColumn
          Caption = 'Owner'
          DataBinding.FieldName = 'OWNERID'
          RepositoryItem = dmMain.edrepUserLookup
          Width = 120
        end
        object tvItemsLASTMODIFIEDDATE: TcxGridDBColumn
          Caption = 'Last Modified Date'
          DataBinding.FieldName = 'LASTMODIFIEDDATE'
          Visible = False
          Width = 100
        end
        object tvItemsFIXEDDATE: TcxGridDBColumn
          Caption = 'Fixed Date'
          DataBinding.FieldName = 'FIXEDDATE'
          Width = 100
        end
        object tvItemsDESCRIPTION: TcxGridDBColumn
          Caption = 'Description'
          DataBinding.FieldName = 'DESCRIPTION'
        end
      end
      object GridDBTableView: TcxGridDBTableView
        DataController.DataSource = dmMain.dsItems
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        object GridDBTableViewID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
        end
        object GridDBTableViewNAME: TcxGridDBColumn
          DataBinding.FieldName = 'NAME'
        end
        object GridDBTableViewTYPE: TcxGridDBColumn
          DataBinding.FieldName = 'TYPE'
        end
        object GridDBTableViewPROJECTID: TcxGridDBColumn
          DataBinding.FieldName = 'PROJECTID'
        end
        object GridDBTableViewPRIORITY: TcxGridDBColumn
          DataBinding.FieldName = 'PRIORITY'
        end
        object GridDBTableViewSTATUS: TcxGridDBColumn
          DataBinding.FieldName = 'STATUS'
        end
        object GridDBTableViewCREATORID: TcxGridDBColumn
          DataBinding.FieldName = 'CREATORID'
        end
        object GridDBTableViewCREATEDDATE: TcxGridDBColumn
          DataBinding.FieldName = 'CREATEDDATE'
        end
        object GridDBTableViewOWNERID: TcxGridDBColumn
          DataBinding.FieldName = 'OWNERID'
        end
        object GridDBTableViewLASTMODIFIEDDATE: TcxGridDBColumn
          DataBinding.FieldName = 'LASTMODIFIEDDATE'
        end
        object GridDBTableViewFIXEDDATE: TcxGridDBColumn
          DataBinding.FieldName = 'FIXEDDATE'
        end
        object GridDBTableViewDESCRIPTION: TcxGridDBColumn
          DataBinding.FieldName = 'DESCRIPTION'
        end
        object GridDBTableViewRESOLUTION: TcxGridDBColumn
          DataBinding.FieldName = 'RESOLUTION'
        end
      end
      object cvItems: TcxGridDBCardView
        DataController.DataSource = dmMain.dsItems
        DataController.DetailKeyFieldNames = 'PROJECTID'
        DataController.KeyFieldNames = 'ID'
        DataController.MasterKeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.RowFiltering = False
        OptionsView.CaptionWidth = 120
        OptionsView.CardIndent = 7
        OptionsView.CardWidth = 350
        object cvItemsNAME: TcxGridDBCardViewRow
          Caption = 'Name'
          DataBinding.FieldName = 'NAME'
          Position.BeginsLayer = True
        end
        object cvItemsTYPE: TcxGridDBCardViewRow
          Caption = 'Type'
          DataBinding.FieldName = 'TYPE'
          RepositoryItem = dmMain.edrepTypeImageCombo
          Position.BeginsLayer = True
        end
        object cvItemsPROJECTID: TcxGridDBCardViewRow
          Caption = 'Project'
          DataBinding.FieldName = 'PROJECTID'
          RepositoryItem = dmMain.edrepProjectLookup
          Position.BeginsLayer = True
        end
        object cvItemsPRIORITY: TcxGridDBCardViewRow
          Caption = 'Priority'
          DataBinding.FieldName = 'PRIORITY'
          RepositoryItem = dmMain.edrepPriorityImageCombo
          Position.BeginsLayer = True
        end
        object cvItemsSTATUS: TcxGridDBCardViewRow
          Caption = 'Status'
          DataBinding.FieldName = 'STATUS'
          RepositoryItem = dmMain.edrepStatusImageCombo
          Position.BeginsLayer = True
        end
        object cvItemsCREATORID: TcxGridDBCardViewRow
          Caption = 'Creator'
          DataBinding.FieldName = 'CREATORID'
          RepositoryItem = dmMain.edrepUserLookup
          Position.BeginsLayer = True
        end
        object cvItemsCREATEDDATE: TcxGridDBCardViewRow
          Caption = 'Created Date'
          DataBinding.FieldName = 'CREATEDDATE'
          Position.BeginsLayer = True
        end
        object cvItemsOWNERID: TcxGridDBCardViewRow
          Caption = 'Owner'
          DataBinding.FieldName = 'OWNERID'
          RepositoryItem = dmMain.edrepUserLookup
          Position.BeginsLayer = True
        end
        object cvItemsLASTMODIFIEDDATE: TcxGridDBCardViewRow
          Caption = 'Last Modified Date'
          DataBinding.FieldName = 'LASTMODIFIEDDATE'
          Position.BeginsLayer = True
        end
        object cvItemsFIXEDDATE: TcxGridDBCardViewRow
          Caption = 'Fixed Date'
          DataBinding.FieldName = 'FIXEDDATE'
          Position.BeginsLayer = True
        end
      end
      object glDepartments: TcxGridLevel
        Caption = 'Employees by Department'
        GridView = tvDepartments
        Options.DetailTabsPosition = dtpTop
        object gltEmployee: TcxGridLevel
          Caption = 'Employee (Table View)'
          GridView = tvEmployee
        end
        object glcEmployee: TcxGridLevel
          Caption = 'Employee (Card  View)'
          GridView = cvEmployee
        end
      end
      object glProjects: TcxGridLevel
        Caption = 'Bug Tracking by Project'
        GridView = tvProjects
        Options.DetailTabsPosition = dtpTop
        object gltItems: TcxGridLevel
          Caption = 'Items (Table  View)'
          GridView = tvItems
        end
        object glcItems: TcxGridLevel
          Caption = 'Items (Card  View)'
          GridView = cvItems
        end
      end
    end
  end
end
