inherited frmGridServerMode: TfrmGridServerMode
  inherited plTop: TPanel
  end
  inherited plGrid: TPanel
    inherited Grid: TcxGrid
      Width = 451
      Height = 98
      RootLevelOptions.DetailTabsPosition = dtpTop
      OnActiveTabChanged = GridActiveTabChanged
      object cxGrid1ServerModeTableView1: TcxGridServerModeTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Refresh.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.InfoPanel.Visible = True
        Navigator.InfoPanel.Width = 100
        Navigator.Visible = True
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Kind = skCount
            FieldName = 'OID'
            Column = cxGrid1ServerModeTableView1OID
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'Count: #,###'
            Kind = skCount
            FieldName = 'From'
            Column = cxGrid1ServerModeTableView1From
          end>
        DataController.Summary.SummaryGroups = <>
        Images = ilImages
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.FooterAutoHeight = True
        OptionsView.FooterMultiSummaries = True
        OptionsView.GroupFooterMultiSummaries = True
        OptionsView.Indicator = True
        object cxGrid1ServerModeTableView1OID: TcxGridServerModeColumn
          DataBinding.FieldName = 'OID'
          Visible = False
          Options.FilteringPopup = False
          Options.Grouping = False
        end
        object cxGrid1ServerModeTableView1Subject: TcxGridServerModeColumn
          DataBinding.FieldName = 'Subject'
          Visible = False
          GroupIndex = 0
          Width = 161
        end
        object cxGrid1ServerModeTableView1From: TcxGridServerModeColumn
          DataBinding.FieldName = 'From'
          Width = 253
        end
        object cxGrid1ServerModeTableView1Sent: TcxGridServerModeColumn
          DataBinding.FieldName = 'Sent'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Kind = ckDateTime
          DateTimeGrouping = dtgByMonth
          Options.FilteringPopup = False
          Width = 170
        end
        object cxGrid1ServerModeTableView1HasAttachment: TcxGridServerModeColumn
          Caption = 'Attachment'
          DataBinding.FieldName = 'HasAttachment'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Images = ilImages
          Properties.Items = <
            item
              Value = False
            end
            item
              ImageIndex = 0
              Value = True
            end>
          Properties.ShowDescriptions = False
          Width = 94
        end
        object cxGrid1ServerModeTableView1Priority: TcxGridServerModeColumn
          DataBinding.FieldName = 'Priority'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Images = ilImages
          Properties.Items = <
            item
              ImageIndex = 1
              Value = 0
            end
            item
              ImageIndex = 2
              Value = 1
            end
            item
              ImageIndex = 3
              Value = 2
            end>
          Properties.ShowDescriptions = False
          Width = 94
        end
        object cxGrid1ServerModeTableView1Size: TcxGridServerModeColumn
          DataBinding.FieldName = 'Size'
          Options.FilteringPopup = False
          Options.Grouping = False
          Width = 149
        end
      end
      object cxGrid1ServerModeBandedTableView1: TcxGridServerModeBandedTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Refresh.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.InfoPanel.Visible = True
        Navigator.InfoPanel.Width = 100
        Navigator.Visible = True
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Kind = skCount
            FieldName = 'OID'
            Column = cxGrid1ServerModeBandedTableView1OID
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'Count: #,###'
            Kind = skCount
            FieldName = 'From'
            Column = cxGrid1ServerModeBandedTableView1From
          end>
        DataController.Summary.SummaryGroups = <>
        Images = ilImages
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.FooterAutoHeight = True
        OptionsView.FooterMultiSummaries = True
        OptionsView.GroupFooterMultiSummaries = True
        OptionsView.Indicator = True
        Bands = <
          item
            Caption = 'Details'
            Width = 586
          end
          item
            Caption = 'Attributes'
            Width = 193
          end>
        object cxGrid1ServerModeBandedTableView1OID: TcxGridServerModeBandedColumn
          DataBinding.FieldName = 'OID'
          Visible = False
          Options.FilteringPopup = False
          Options.Grouping = False
          Width = 31
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object cxGrid1ServerModeBandedTableView1Subject: TcxGridServerModeBandedColumn
          DataBinding.FieldName = 'Subject'
          Visible = False
          GroupIndex = 0
          Width = 362
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object cxGrid1ServerModeBandedTableView1From: TcxGridServerModeBandedColumn
          DataBinding.FieldName = 'From'
          Width = 232
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object cxGrid1ServerModeBandedTableView1Sent: TcxGridServerModeBandedColumn
          DataBinding.FieldName = 'Sent'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Kind = ckDateTime
          DateTimeGrouping = dtgByMonth
          Options.FilteringPopup = False
          Width = 210
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object cxGrid1ServerModeBandedTableView1Size: TcxGridServerModeBandedColumn
          DataBinding.FieldName = 'Size'
          Options.FilteringPopup = False
          Options.Grouping = False
          Width = 154
          Position.BandIndex = 1
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object cxGrid1ServerModeBandedTableView1HasAttachment: TcxGridServerModeBandedColumn
          Caption = 'Attachment'
          DataBinding.FieldName = 'HasAttachment'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Images = ilImages
          Properties.Items = <
            item
              Value = False
            end
            item
              ImageIndex = 0
              Value = True
            end>
          Properties.ShowDescriptions = False
          Width = 84
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object cxGrid1ServerModeBandedTableView1Priority: TcxGridServerModeBandedColumn
          DataBinding.FieldName = 'Priority'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Images = ilImages
          Properties.Items = <
            item
              ImageIndex = 1
              Value = 0
            end
            item
              ImageIndex = 2
              Value = 1
            end
            item
              ImageIndex = 3
              Value = 2
            end>
          Properties.ShowDescriptions = False
          Width = 103
          Position.BandIndex = 1
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
      end
      object cxGrid1Level1: TcxGridLevel
        Caption = 'Table View'
        GridView = cxGrid1ServerModeTableView1
      end
      object cxGrid1Level2: TcxGridLevel
        Caption = 'Banded Table View'
        GridView = cxGrid1ServerModeBandedTableView1
      end
    end
  end
  inherited pnlSeparator: TPanel
  end
  object plToolBar: TPanel
    Left = 0
    Top = 57
    Width = 451
    Height = 104
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object btConfigureConnection: TcxButton
      Left = 338
      Top = 6
      Width = 143
      Height = 25
      Caption = 'Configure Connection'
      TabOrder = 0
      OnClick = btConfigureConnectionClick
    end
    object gbDataOptions: TcxGroupBox
      Left = 10
      Top = 6
      Caption = ' Data options '
      TabOrder = 1
      Height = 92
      Width = 311
      object cbDeleting: TcxCheckBox
        Left = 3
        Top = 61
        Caption = 'Deleting Records'
        Properties.OnChange = UpdateOptionsDataView
        State = cbsChecked
        TabOrder = 0
        Transparent = True
        Width = 130
      end
      object cbCancelOnExit: TcxCheckBox
        Left = 141
        Top = 39
        Caption = 'Canceling Edit on Exit'
        Properties.OnChange = UpdateOptionsDataView
        State = cbsChecked
        TabOrder = 1
        Transparent = True
        Width = 165
      end
      object cbDeletingConfirmation: TcxCheckBox
        Left = 141
        Top = 16
        Caption = 'Confirming Record Deletion'
        Properties.OnChange = UpdateOptionsDataView
        State = cbsChecked
        TabOrder = 2
        Transparent = True
        Width = 165
      end
      object cbEditing: TcxCheckBox
        Left = 3
        Top = 16
        Caption = 'Editing Records'
        Properties.OnChange = UpdateOptionsDataView
        State = cbsChecked
        TabOrder = 3
        Transparent = True
        Width = 130
      end
      object cbInserting: TcxCheckBox
        Left = 3
        Top = 39
        Caption = 'Inserting Records'
        Properties.OnChange = UpdateOptionsDataView
        State = cbsChecked
        TabOrder = 4
        Transparent = True
        Width = 130
      end
    end
  end
  object cxGridPopupMenu: TcxGridPopupMenu
    Grid = Grid
    PopupMenus = <>
    Left = 160
    Top = 192
  end
  object ilImages: TcxImageList
    Height = 13
    Width = 13
    FormatVersion = 1
    DesignInfo = 12583272
    ImageInfo = <
      item
        Image.Data = {
          DA020000424DDA0200000000000036000000280000000D0000000D0000000100
          200000000000A402000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0060483000604830006050
          4000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0070504000FF00FF00FF00FF00FF00FF0070504000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0070584000FF00FF00FF00
          FF0060504000FF00FF00FF00FF0060483000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0070584000FF00FF0070504000FF00FF0060484000FF00
          FF0060483000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008068
          5000FF00FF0070605000FF00FF0070504000FF00FF0060504000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0090786000FF00FF0080706000FF00
          FF0080605000FF00FF0070584000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00A0807000FF00FF0090787000FF00FF0090706000FF00FF008068
          5000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00A0807000FF00
          FF0090807000FF00FF0090706000FF00FF0080706000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00A0887000FF00FF00FF00
          FF00FF00FF0090807000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00A0887000A088700090807000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        MaskColor = clFuchsia
      end
      item
        Image.Data = {
          DA020000424DDA0200000000000036000000280000000D0000000D0000000100
          200000000000A402000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00A0503000A0502000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B0603000E0805000D078
          5000A0502000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00B0583000F0A07000F0A07000E0805000D0704000B0583000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E9B29C00E5A48A00E090
          7000FFA88000F0885000B0603000A0502000A0502000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00E0906000FFA88000F0906000B058
          3000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00E0907000FFB09000FF906000A0502000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E0907000FFB8
          9000FF986000A0502000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00E0987000FFB89000FF987000A0502000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00F0A08000FFC0A000FFB89000A0502000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F0A57800E1A57800E19E
          7800D2876900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        MaskColor = clFuchsia
      end
      item
        Image.Data = {
          DA020000424DDA0200000000000036000000280000000D0000000D0000000100
          200000000000A402000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000083
          00000083000000830000008300000083000000830000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000A9000010D37A0011D37B0010D3
          7A0010D47A0000A70000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000BB290014DE950015DE940014DE940014DD940000BB2900FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000DBAB001EED
          D4001EEDD5001EEDD4001EEDD40000DBAB00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000CFEB0021E7F50020E7F50020E7F50020E7
          F50000CFEB00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF0000A3EB001ED1F5001ED1F5001ED1F5001ED1F50000A3EB00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CACACA00E2E2E200E2E2
          E200E2E2E200E2E2E200CACACA00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00CFCFCF00E2E2E200E2E2E200E2E2E200E2E2E200CFCF
          CF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D1D1
          D100E2E2E200E2E2E200E2E2E200E2E2E200D1D1D100FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00D2D2D200D2D2D200D2D2D200D2D2
          D200D2D2D200D2D2D200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        MaskColor = clFuchsia
      end
      item
        Image.Data = {
          DA020000424DDA0200000000000036000000280000000D0000000D0000000100
          200000000000A402000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00657BC8002F4FB100FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF006080F0002048
          D000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF009DB2EA008F9FDF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004970E5002F5CD800FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF003060F0000040FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF006383E5004B78
          F0000048FF001F50D500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF005078E0006088FF003060FF000038D000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF007088E00090A8FF006088FF002050D000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00788FE100697F
          E100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        MaskColor = clFuchsia
      end>
  end
end
