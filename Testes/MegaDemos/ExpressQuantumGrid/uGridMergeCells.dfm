inherited frmGridMergeCells: TfrmGridMergeCells
  inherited plGrid: TPanel
    inherited Grid: TcxGrid
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
        OptionsSelection.InvertSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        Preview.Column = DBTableViewItemsDESCRIPTION
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object DBTableViewItemsPROJECTID: TcxGridDBColumn
          Caption = 'Project'
          DataBinding.FieldName = 'PROJECTID'
          RepositoryItem = dmMain.edrepProjectLookup
          Options.CellMerging = True
          SortIndex = 0
          SortOrder = soAscending
          Width = 120
        end
        object DBTableViewItemsTYPE: TcxGridDBColumn
          Caption = 'Type'
          DataBinding.FieldName = 'TYPE'
          RepositoryItem = dmMain.edrepTypeImageCombo
          Options.CellMerging = True
          SortIndex = 1
          SortOrder = soAscending
          Width = 80
        end
        object DBTableViewItemsNAME: TcxGridDBColumn
          Caption = 'Name'
          DataBinding.FieldName = 'NAME'
          Width = 150
        end
        object DBTableViewItemsPRIORITY: TcxGridDBColumn
          Caption = 'Priority'
          DataBinding.FieldName = 'PRIORITY'
          RepositoryItem = dmMain.edrepPriorityImageCombo
          Options.CellMerging = True
          Width = 80
        end
        object DBTableViewItemsSTATUS: TcxGridDBColumn
          Caption = 'Status'
          DataBinding.FieldName = 'STATUS'
          RepositoryItem = dmMain.edrepStatusImageCombo
          Options.CellMerging = True
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
          Options.CellMerging = True
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
      object level: TcxGridLevel
        GridView = DBTableViewItems
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
