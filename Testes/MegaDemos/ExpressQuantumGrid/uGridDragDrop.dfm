inherited frmDragDropGrid: TfrmDragDropGrid
  inherited plGrid: TPanel
    object splitterGrid: TSplitter [0]
      Left = 151
      Top = 0
      Width = 4
      Height = 164
      Align = alRight
      Visible = False
    end
    inherited Grid: TcxGrid
      Width = 151
      DragMode = dmAutomatic
      OnEnter = GridEnter
      inherited GridDBTableView: TcxGridDBTableView
        DragMode = dmAutomatic
        OnDragOver = GridDBTableViewDragOver
        OnEndDrag = GridDBTableViewEndDrag
        OnStartDrag = GridDBTableViewStartDrag
        FilterBox.Visible = fvNever
        OptionsCustomize.ColumnFiltering = False
        OptionsSelection.MultiSelect = True
        inherited GridDBTableViewFIRSTNAME: TcxGridDBColumn
          Width = 34
        end
        inherited GridDBTableViewLASTNAME: TcxGridDBColumn
          Width = 44
        end
        inherited GridDBTableViewCOMPANYNAME: TcxGridDBColumn
          Width = 46
        end
        inherited GridDBTableViewPAYMENTTYPE: TcxGridDBColumn
          Width = 39
        end
        inherited GridDBTableViewPRODUCTID: TcxGridDBColumn
          Width = 46
        end
        inherited GridDBTableViewCUSTOMER: TcxGridDBColumn
          Width = 39
        end
        inherited GridDBTableViewPURCHASEDATE: TcxGridDBColumn
          Width = 38
        end
        inherited GridDBTableViewPAYMENTAMOUNT: TcxGridDBColumn
          Width = 39
        end
        inherited GridDBTableViewCOPIES: TcxGridDBColumn
          Width = 31
        end
      end
    end
    object Grid1: TcxGrid
      Left = 155
      Top = 0
      Width = 280
      Height = 164
      Align = alRight
      DragMode = dmAutomatic
      TabOrder = 1
      OnEnter = Grid1Enter
      object GridDBTableView1: TcxGridDBTableView
        DragMode = dmAutomatic
        OnDragOver = GridDBTableViewDragOver
        OnEndDrag = GridDBTableViewEndDrag
        OnStartDrag = GridDBTableView1StartDrag
        FilterBox.Visible = fvNever
        DataController.DataSource = dmMain.dsDXCustomers
        DataController.KeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Kind = skCount
            Column = cxGridDBColumn3
          end
          item
            Kind = skSum
            Column = cxGridDBColumn8
          end
          item
            Kind = skCount
            Position = spFooter
            Column = cxGridDBColumn6
          end
          item
            Kind = skMax
            Position = spFooter
            Column = cxGridDBColumn7
          end
          item
            Kind = skSum
            Position = spFooter
            Column = cxGridDBColumn8
          end
          item
            Format = '###'
            Kind = skSum
            Position = spFooter
            Column = cxGridDBColumn9
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skSum
            Column = cxGridDBColumn8
          end
          item
            Kind = skMax
            Column = cxGridDBColumn7
          end
          item
            Kind = skCount
            Column = cxGridDBColumn1
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsSelection.MultiSelect = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        object cxGridDBColumn1: TcxGridDBColumn
          Caption = 'First Name'
          DataBinding.FieldName = 'FIRSTNAME'
          Width = 34
        end
        object cxGridDBColumn2: TcxGridDBColumn
          Caption = 'Last Name'
          DataBinding.FieldName = 'LASTNAME'
          Width = 44
        end
        object cxGridDBColumn3: TcxGridDBColumn
          Caption = 'Company Name'
          DataBinding.FieldName = 'COMPANYNAME'
          Width = 46
        end
        object cxGridDBColumn4: TcxGridDBColumn
          Caption = 'Payment Type'
          DataBinding.FieldName = 'PAYMENTTYPE'
          RepositoryItem = dmMain.edrepDXPaymentTypeImageCombo
          GroupIndex = 0
          SortIndex = 0
          SortOrder = soAscending
          Width = 39
        end
        object cxGridDBColumn5: TcxGridDBColumn
          Caption = 'Product'
          DataBinding.FieldName = 'PRODUCTID'
          RepositoryItem = dmMain.edrepDXProductLookup
          Width = 46
        end
        object cxGridDBColumn6: TcxGridDBColumn
          Caption = 'Referral'
          DataBinding.FieldName = 'CUSTOMER'
          Width = 39
        end
        object cxGridDBColumn7: TcxGridDBColumn
          Caption = 'Purchase Date'
          DataBinding.FieldName = 'PURCHASEDATE'
          Width = 38
        end
        object cxGridDBColumn8: TcxGridDBColumn
          Caption = 'Payment Amount'
          DataBinding.FieldName = 'PAYMENTAMOUNT'
          PropertiesClassName = 'TcxSpinEditProperties'
          Width = 39
        end
        object cxGridDBColumn9: TcxGridDBColumn
          Caption = 'Copies'
          DataBinding.FieldName = 'COPIES'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.MaxValue = 100.000000000000000000
          Properties.MinValue = 1.000000000000000000
          Width = 31
        end
      end
      object GridLevel1: TcxGridLevel
        GridView = GridDBTableView1
      end
    end
  end
end
