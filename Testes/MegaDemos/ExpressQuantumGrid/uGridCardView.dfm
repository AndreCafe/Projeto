inherited frmCardViewGrid: TfrmCardViewGrid
  inherited plGrid: TPanel
    Top = 95
    Height = 126
    inherited Grid: TcxGrid
      Height = 126
      object DBCardView: TcxGridDBCardView
        DataController.DataSource = dmMain.dsUsers
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.CardExpanding = True
        OptionsCustomize.RowHiding = True
        OptionsCustomize.RowMoving = True
        OptionsView.CardIndent = 7
        OptionsView.CardWidth = 350
        Styles.StyleSheet = GridCardViewStyleSheetDevExpress
        object DBCardViewPersonName: TcxGridDBCardViewRow
          Caption = 'Name'
          DataBinding.FieldName = 'FNAME'
          OnGetDisplayText = DBCardViewPersonNameGetDisplayText
          Kind = rkCaption
          Options.Filtering = False
          Position.BeginsLayer = True
        end
        object DBCardViewFNAME: TcxGridDBCardViewRow
          DataBinding.FieldName = 'FNAME'
          Position.BeginsLayer = True
        end
        object DBCardViewLNAME: TcxGridDBCardViewRow
          Caption = 'Last name'
          DataBinding.FieldName = 'LNAME'
          Position.BeginsLayer = True
        end
        object DBCardViewEMAIL: TcxGridDBCardViewRow
          Caption = 'E-mail'
          DataBinding.FieldName = 'EMAIL'
          Position.BeginsLayer = True
        end
        object DBCardViewPHONE: TcxGridDBCardViewRow
          DataBinding.FieldName = 'PHONE'
          RepositoryItem = dmMain.edrepPhoneItem
          Position.BeginsLayer = True
        end
        object DBCardViewDEPARTMENTID: TcxGridDBCardViewRow
          Caption = 'Department'
          DataBinding.FieldName = 'DEPARTMENTID'
          RepositoryItem = dmMain.edrepDepartmentLookup
          Position.BeginsLayer = True
        end
      end
      object GridLevel: TcxGridLevel
        GridView = DBCardView
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
    object cbCardExpanding: TcxCheckBox
      Left = 5
      Top = 8
      Caption = 'Individual Card Expansion'
      Properties.OnChange = cbCardExpandingPropertiesChange
      State = cbsChecked
      TabOrder = 0
      Transparent = True
      Width = 149
    end
    object cbFiltering: TcxCheckBox
      Left = 156
      Top = 8
      Caption = 'Row Level Filtering'
      Properties.OnChange = cbFilteringPropertiesChange
      State = cbsChecked
      TabOrder = 1
      Transparent = True
      Width = 115
    end
    object cbRowMoving: TcxCheckBox
      Left = 278
      Top = 8
      Caption = 'Move Individual Rows '
      Properties.OnChange = cbRowMovingPropertiesChange
      State = cbsChecked
      TabOrder = 2
      Transparent = True
      Width = 133
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 224
    Top = 80
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor]
      Color = 8453888
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16749885
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object GridCardViewStyleSheetDevExpress: TcxGridCardViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle4
      Styles.ContentEven = cxStyle5
      Styles.ContentOdd = cxStyle6
      Styles.Inactive = cxStyle7
      Styles.IncSearch = cxStyle8
      Styles.Selection = cxStyle10
      Styles.CaptionRow = cxStyle2
      Styles.CardBorder = cxStyle3
      Styles.RowCaption = cxStyle9
      BuiltIn = True
    end
  end
end
