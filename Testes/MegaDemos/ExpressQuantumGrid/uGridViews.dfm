inherited frmViewsGrid: TfrmViewsGrid
  inherited plGrid: TPanel
    object splitterView: TSplitter [0]
      Left = 163
      Top = 0
      Width = 7
      Height = 164
    end
    inherited Grid: TcxGrid
      Left = 170
      Width = 265
      object DBTableViewDepartments: TcxGridDBTableView
        DataController.DataSource = dmMain.dsDepartment
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object DBTableViewDepartmentsID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          Visible = False
        end
        object DBTableViewDepartmentsNAME: TcxGridDBColumn
          Caption = 'Department name'
          DataBinding.FieldName = 'NAME'
        end
      end
      object DBTableViewEmployee: TcxGridDBTableView
        DataController.DataSource = dmMain.dsUsers
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = DBTableViewEmployeeFNAME
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object DBTableViewEmployeeFNAME: TcxGridDBColumn
          DataBinding.FieldName = 'FNAME'
          Width = 120
        end
        object DBTableViewEmployeeLNAME: TcxGridDBColumn
          DataBinding.FieldName = 'LNAME'
          Width = 120
        end
        object DBTableViewEmployeeEMAIL: TcxGridDBColumn
          Caption = 'E-mail'
          DataBinding.FieldName = 'EMAIL'
          Width = 120
        end
        object DBTableViewEmployeePHONE: TcxGridDBColumn
          DataBinding.FieldName = 'PHONE'
          RepositoryItem = dmMain.edrepPhoneItem
          Width = 100
        end
        object DBTableViewEmployeeDepartmentName: TcxGridDBColumn
          Caption = 'Department'
          DataBinding.FieldName = 'DEPARTMENTID'
          RepositoryItem = dmMain.edrepDepartmentLookup
          Width = 80
        end
      end
      object DBCardViewEmployee: TcxGridDBCardView
        DataController.DataSource = dmMain.dsUsers
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        LayoutDirection = ldVertical
        OptionsCustomize.RowFiltering = False
        OptionsView.CardIndent = 7
        OptionsView.CardWidth = 300
        Styles.StyleSheet = GridCardViewStyleSheetDevExpress
        object DBCardViewEmployeeFNAME: TcxGridDBCardViewRow
          DataBinding.FieldName = 'FNAME'
          Position.BeginsLayer = True
        end
        object DBCardViewEmployeeMNAME: TcxGridDBCardViewRow
          Caption = 'Middle Name'
          DataBinding.FieldName = 'MNAME'
          Position.BeginsLayer = True
        end
        object DBCardViewEmployeeLNAME: TcxGridDBCardViewRow
          DataBinding.FieldName = 'LNAME'
          Position.BeginsLayer = True
        end
        object DBCardViewEmployeeEMAIL: TcxGridDBCardViewRow
          Caption = 'E-mail'
          DataBinding.FieldName = 'EMAIL'
          Position.BeginsLayer = True
        end
        object DBCardViewEmployeePHONE: TcxGridDBCardViewRow
          DataBinding.FieldName = 'PHONE'
          RepositoryItem = dmMain.edrepPhoneItem
          Position.BeginsLayer = True
        end
        object DBCardViewEmployeeDepartmentName: TcxGridDBCardViewRow
          Caption = 'Department'
          DataBinding.FieldName = 'DEPARTMENTID'
          RepositoryItem = dmMain.edrepDepartmentLookup
          Position.BeginsLayer = True
        end
      end
      object DBTableViewProjects: TcxGridDBTableView
        DataController.DataSource = dmMain.dsProjects
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.ColumnAutoWidth = True
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object DBTableViewProjectsNAME: TcxGridDBColumn
          Caption = 'Name'
          DataBinding.FieldName = 'NAME'
          Width = 200
        end
        object DBTableViewProjectsMANAGERID: TcxGridDBColumn
          Caption = 'Manager'
          DataBinding.FieldName = 'MANAGERID'
          RepositoryItem = dmMain.edrepUserLookup
          Width = 200
        end
      end
      object DBTableViewItems: TcxGridDBTableView
        DataController.DataSource = dmMain.dsItems
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skMin
            Column = DBTableViewItemsCREATEDDATE
          end
          item
            Kind = skMax
            Column = DBTableViewItemsFIXEDDATE
          end
          item
            Kind = skCount
            Column = DBTableViewItemsNAME
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        Preview.Column = DBTableViewItemsDESCRIPTION
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object DBTableViewItemsNAME: TcxGridDBColumn
          Caption = 'Name'
          DataBinding.FieldName = 'NAME'
          Width = 150
        end
        object DBTableViewItemsTYPE: TcxGridDBColumn
          Caption = 'Type'
          DataBinding.FieldName = 'TYPE'
          RepositoryItem = dmMain.edrepTypeImageCombo
          Width = 80
        end
        object DBTableViewItemsPROJECTID: TcxGridDBColumn
          Caption = 'Project'
          DataBinding.FieldName = 'PROJECTID'
          RepositoryItem = dmMain.edrepProjectLookup
          Width = 120
        end
        object DBTableViewItemsPRIORITY: TcxGridDBColumn
          Caption = 'Priority'
          DataBinding.FieldName = 'PRIORITY'
          RepositoryItem = dmMain.edrepPriorityImageCombo
          Width = 80
        end
        object DBTableViewItemsSTATUS: TcxGridDBColumn
          Caption = 'Status'
          DataBinding.FieldName = 'STATUS'
          RepositoryItem = dmMain.edrepStatusImageCombo
          Width = 80
        end
        object DBTableViewItemsCREATORID: TcxGridDBColumn
          Caption = 'Creator'
          DataBinding.FieldName = 'CREATORID'
          RepositoryItem = dmMain.edrepUserLookup
          Visible = False
          Width = 120
        end
        object DBTableViewItemsCREATEDDATE: TcxGridDBColumn
          Caption = 'Created Date'
          DataBinding.FieldName = 'CREATEDDATE'
          Width = 100
        end
        object DBTableViewItemsOWNERID: TcxGridDBColumn
          Caption = 'Owner'
          DataBinding.FieldName = 'OWNERID'
          RepositoryItem = dmMain.edrepUserLookup
          Width = 120
        end
        object DBTableViewItemsLASTMODIFIEDDATE: TcxGridDBColumn
          Caption = 'Last Modified Date'
          DataBinding.FieldName = 'LASTMODIFIEDDATE'
          Visible = False
          Width = 100
        end
        object DBTableViewItemsFIXEDDATE: TcxGridDBColumn
          Caption = 'Fixed Date'
          DataBinding.FieldName = 'FIXEDDATE'
          Width = 100
        end
        object DBTableViewItemsDESCRIPTION: TcxGridDBColumn
          Caption = 'Description'
          DataBinding.FieldName = 'DESCRIPTION'
        end
      end
      object DBCardViewItems: TcxGridDBCardView
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
        Styles.StyleSheet = GridCardViewStyleSheetDevExpress
        object DBCardViewItemsNAME: TcxGridDBCardViewRow
          Caption = 'Name'
          DataBinding.FieldName = 'NAME'
          Position.BeginsLayer = True
        end
        object DBCardViewItemsTYPE: TcxGridDBCardViewRow
          Caption = 'Type'
          DataBinding.FieldName = 'TYPE'
          RepositoryItem = dmMain.edrepTypeImageCombo
          Position.BeginsLayer = True
        end
        object DBCardViewItemsPROJECTID: TcxGridDBCardViewRow
          Caption = 'Project'
          DataBinding.FieldName = 'PROJECTID'
          RepositoryItem = dmMain.edrepProjectLookup
          Position.BeginsLayer = True
        end
        object DBCardViewItemsPRIORITY: TcxGridDBCardViewRow
          Caption = 'Priority'
          DataBinding.FieldName = 'PRIORITY'
          RepositoryItem = dmMain.edrepPriorityImageCombo
          Position.BeginsLayer = True
        end
        object DBCardViewItemsSTATUS: TcxGridDBCardViewRow
          Caption = 'Status'
          DataBinding.FieldName = 'STATUS'
          RepositoryItem = dmMain.edrepStatusImageCombo
          Position.BeginsLayer = True
        end
        object DBCardViewItemsCREATORID: TcxGridDBCardViewRow
          Caption = 'Creator'
          DataBinding.FieldName = 'CREATORID'
          RepositoryItem = dmMain.edrepUserLookup
          Position.BeginsLayer = True
        end
        object DBCardViewItemsCREATEDDATE: TcxGridDBCardViewRow
          Caption = 'Created Date'
          DataBinding.FieldName = 'CREATEDDATE'
          Position.BeginsLayer = True
        end
        object DBCardViewItemsOWNERID: TcxGridDBCardViewRow
          Caption = 'Owner'
          DataBinding.FieldName = 'OWNERID'
          RepositoryItem = dmMain.edrepUserLookup
          Position.BeginsLayer = True
        end
        object DBCardViewItemsLASTMODIFIEDDATE: TcxGridDBCardViewRow
          Caption = 'Last Modified Date'
          DataBinding.FieldName = 'LASTMODIFIEDDATE'
          Position.BeginsLayer = True
        end
        object DBCardViewItemsFIXEDDATE: TcxGridDBCardViewRow
          Caption = 'Fixed Date'
          DataBinding.FieldName = 'FIXEDDATE'
          Position.BeginsLayer = True
        end
      end
      object GridLevel: TcxGridLevel
        GridView = DBTableViewEmployee
      end
    end
    object pnlViews: TPanel
      Left = 0
      Top = 0
      Width = 163
      Height = 164
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object gridViews: TcxGrid
        Left = 0
        Top = 0
        Width = 163
        Height = 164
        Align = alClient
        TabOrder = 0
        object tvViews: TcxGridTableView
          OnFocusedRecordChanged = tvViewsFocusedRecordChanged
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.ImmediateEditor = False
          OptionsCustomize.ColumnFiltering = False
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.InvertSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          object clnViews: TcxGridDBColumn
            Caption = 'View list'
          end
        end
        object lvViews: TcxGridLevel
          GridView = tvViews
        end
      end
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 384
    Top = 64
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor]
      Color = 8453888
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16777088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor]
      Color = 8453888
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16749885
      TextColor = clWhite
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle2
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle4
      Styles.FilterBox = cxStyle5
      Styles.Inactive = cxStyle10
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle14
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Header = cxStyle9
      Styles.Indicator = cxStyle12
      Styles.Preview = cxStyle13
      BuiltIn = True
    end
    object GridCardViewStyleSheetDevExpress: TcxGridCardViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle15
      Styles.Content = cxStyle18
      Styles.ContentEven = cxStyle19
      Styles.ContentOdd = cxStyle20
      Styles.Inactive = cxStyle21
      Styles.IncSearch = cxStyle22
      Styles.Selection = cxStyle24
      Styles.CaptionRow = cxStyle16
      Styles.CardBorder = cxStyle17
      Styles.RowCaption = cxStyle23
      BuiltIn = True
    end
  end
end
