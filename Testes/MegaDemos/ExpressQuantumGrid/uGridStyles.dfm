inherited frmStyleGrid: TfrmStyleGrid
  Width = 816
  inherited plTop: TPanel
    Width = 816
  end
  inherited plGrid: TPanel
    Width = 816
    object SplitterStyle: TSplitter [0]
      Left = 0
      Top = 38
      Height = 126
    end
    inherited Grid: TcxGrid
      Left = 3
      Top = 38
      Width = 813
      Height = 126
      object DBTableView: TcxGridDBTableView
        OnCustomDrawPartBackground = DBTableViewCustomDrawPartBackground
        DataController.DataSource = dmMain.dsDXCustomers
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            Column = DBTableViewFIRSTNAME
          end
          item
            Kind = skSum
            Column = DBTableViewPAYMENTAMOUNT
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        Preview.Column = DBTableViewPreview
        OnCustomDrawColumnHeader = DBTableViewCustomDrawColumnHeader
        object DBTableViewFIRSTNAME: TcxGridDBColumn
          Caption = 'First Name'
          DataBinding.FieldName = 'FIRSTNAME'
          Width = 110
        end
        object DBTableViewLASTNAME: TcxGridDBColumn
          Caption = 'Last Name'
          DataBinding.FieldName = 'LASTNAME'
          Width = 110
        end
        object DBTableViewCOMPANYNAME: TcxGridDBColumn
          Caption = 'Company Name'
          DataBinding.FieldName = 'COMPANYNAME'
          Width = 120
        end
        object DBTableViewPAYMENTTYPE: TcxGridDBColumn
          Caption = 'Payment Type'
          DataBinding.FieldName = 'PAYMENTTYPE'
          RepositoryItem = dmMain.edrepDXPaymentTypeImageCombo
          SortIndex = 0
          SortOrder = soAscending
          Width = 80
        end
        object DBTableViewPRODUCTID: TcxGridDBColumn
          Caption = 'Product'
          DataBinding.FieldName = 'PRODUCTID'
          RepositoryItem = dmMain.edrepDXProductLookup
          GroupIndex = 0
          SortIndex = 1
          SortOrder = soAscending
          Width = 100
        end
        object DBTableViewCUSTOMER: TcxGridDBColumn
          Caption = 'Referral'
          DataBinding.FieldName = 'CUSTOMER'
          Width = 70
        end
        object DBTableViewPURCHASEDATE: TcxGridDBColumn
          Caption = 'Purchase Date'
          DataBinding.FieldName = 'PURCHASEDATE'
          Width = 80
        end
        object DBTableViewPAYMENTAMOUNT: TcxGridDBColumn
          Caption = 'Payment Amount'
          DataBinding.FieldName = 'PAYMENTAMOUNT'
          PropertiesClassName = 'TcxCalcEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Width = 80
        end
        object DBTableViewCOPIES: TcxGridDBColumn
          Caption = 'Copies'
          DataBinding.FieldName = 'COPIES'
          PropertiesClassName = 'TcxSpinEditProperties'
          Width = 70
        end
        object DBTableViewPreview: TcxGridDBColumn
          DataBinding.FieldName = 'LASTNAME'
          OnGetDisplayText = DBTableViewPreviewGetDisplayText
        end
      end
      object GridLevel: TcxGridLevel
        GridView = DBTableView
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 816
      Height = 38
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object Label1: TcxLabel
        Left = 2
        Top = 11
        Caption = 'Style Sheet List'
        Transparent = True
      end
      object cbStyleSheetList: TcxComboBox
        Left = 99
        Top = 8
        Properties.DropDownListStyle = lsFixedList
        TabOrder = 0
        OnClick = cbStyleSheetListClick
        Width = 159
      end
      object btnNew: TcxButton
        Left = 271
        Top = 5
        Width = 110
        Height = 28
        Caption = '&New Style...'
        TabOrder = 1
        OnClick = btnNewClick
      end
      object btnEdit: TcxButton
        Left = 386
        Top = 5
        Width = 110
        Height = 28
        Caption = '&Edit a Style...'
        TabOrder = 2
        OnClick = btnEditClick
      end
      object btnCopy: TcxButton
        Tag = 1
        Left = 501
        Top = 5
        Width = 110
        Height = 28
        Caption = '&Copy a Style...'
        TabOrder = 3
        OnClick = btnCopyClick
      end
      object btnDelete: TcxButton
        Left = 617
        Top = 5
        Width = 110
        Height = 29
        Caption = '&Delete a Style...'
        TabOrder = 4
        OnClick = btnDeleteClick
      end
      object cbShading: TcxCheckBox
        Left = 737
        Top = 6
        Caption = 'Shading'
        TabOrder = 5
        Transparent = True
        OnClick = cbShadingClick
        Width = 90
      end
    end
  end
  inherited pnlSeparator: TPanel
    Width = 816
  end
  inherited pnlDescription: TPanel
    Width = 816
    inherited lblRight1: TcxLabel
      Left = 811
    end
    inherited lblTop1: TcxLabel
      Width = 816
    end
    inherited lblBottom1: TcxLabel
      Width = 816
    end
    inherited pnlHintInternal: TPanel
      Width = 806
      inherited lblRight2: TcxLabel
        Left = 801
      end
      inherited lblTop2: TcxLabel
        Width = 806
      end
      inherited lblBottom2: TcxLabel
        Width = 806
      end
      inherited lblDescription: TcxLabel
        Width = 796
      end
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 192
    Top = 72
    PixelsPerInch = 96
  end
end
