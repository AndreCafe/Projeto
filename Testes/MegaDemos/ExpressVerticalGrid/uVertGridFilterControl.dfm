inherited frmVerticalGridFilterControl: TfrmVerticalGridFilterControl
  ExplicitWidth = 451
  ExplicitHeight = 304
  inherited plTop: TPanel
    Width = 451
    ExplicitWidth = 451
  end
  inherited pnlSeparator: TPanel
    Top = 186
    Width = 451
    ExplicitTop = 186
    ExplicitWidth = 451
  end
  inherited pnlDescription: TPanel
    Top = 259
    Width = 451
    ExplicitTop = 259
    ExplicitWidth = 451
    inherited lblRight1: TLabel
      Left = 446
    end
    inherited lblTop1: TLabel
      Width = 451
    end
    inherited lblBottom1: TLabel
      Width = 451
    end
    inherited pnlHintInternal: TPanel
      Width = 441
      ExplicitWidth = 441
      inherited lblRight2: TLabel
        Left = 436
      end
      inherited lblTop2: TLabel
        Width = 441
      end
      inherited lblBottom2: TLabel
        Width = 441
      end
      inherited lblDescription: TLabel
        Width = 431
      end
    end
  end
  object VerticalGrid: TcxDBVerticalGrid
    Left = 0
    Top = 224
    Width = 451
    Height = 35
    Align = alClient
    LayoutStyle = lsMultiRecordView
    OptionsView.RowHeaderWidth = 116
    OptionsView.ValueWidth = 176
    TabOrder = 3
    DataController.DataSource = dmMain.dsDXCustomers
    Version = 1
    object VerticalGridFIRSTNAME: TcxDBEditorRow
      Properties.Caption = 'First Name'
      Properties.DataBinding.FieldName = 'FIRSTNAME'
      ID = 0
      ParentID = -1
      Index = 0
      Version = 1
    end
    object VerticalGridLASTNAME: TcxDBEditorRow
      Properties.Caption = 'Last Name'
      Properties.DataBinding.FieldName = 'LASTNAME'
      ID = 1
      ParentID = -1
      Index = 1
      Version = 1
    end
    object VerticalGridCOMPANYNAME: TcxDBEditorRow
      Properties.Caption = 'Company Name'
      Properties.DataBinding.FieldName = 'COMPANYNAME'
      ID = 2
      ParentID = -1
      Index = 2
      Version = 1
    end
    object VerticalGridPAYMENTTYPE: TcxDBEditorRow
      Properties.Caption = 'Payment Type'
      Properties.RepositoryItem = dmMain.edrepDXPaymentTypeImageCombo
      Properties.DataBinding.FieldName = 'PAYMENTTYPE'
      ID = 3
      ParentID = -1
      Index = 3
      Version = 1
    end
    object VerticalGridPRODUCTID: TcxDBEditorRow
      Properties.Caption = 'Product'
      Properties.RepositoryItem = dmMain.edrepDXProductLookup
      Properties.DataBinding.FieldName = 'PRODUCTID'
      ID = 4
      ParentID = -1
      Index = 4
      Version = 1
    end
    object VerticalGridCUSTOMER: TcxDBEditorRow
      Properties.Caption = 'Customer'
      Properties.DataBinding.FieldName = 'CUSTOMER'
      ID = 5
      ParentID = -1
      Index = 5
      Version = 1
    end
    object VerticalGridPURCHASEDATE: TcxDBEditorRow
      Properties.Caption = 'Purchase Date'
      Properties.DataBinding.FieldName = 'PURCHASEDATE'
      ID = 6
      ParentID = -1
      Index = 6
      Version = 1
    end
    object VerticalGridPAYMENTAMOUNT: TcxDBEditorRow
      Properties.Caption = 'Payment Amount'
      Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
      Properties.DataBinding.FieldName = 'PAYMENTAMOUNT'
      ID = 7
      ParentID = -1
      Index = 7
      Version = 1
    end
    object VerticalGridCOPIES: TcxDBEditorRow
      Properties.Caption = 'Copies'
      Properties.DataBinding.FieldName = 'COPIES'
      ID = 8
      ParentID = -1
      Index = 8
      Version = 1
    end
  end
  object pnlFilterApply: TPanel
    Left = 0
    Top = 186
    Width = 451
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object btnApply: TcxButton
      Left = 10
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnReset: TcxButton
      Left = 106
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Reset'
      TabOrder = 1
      OnClick = btnResetClick
    end
    object btOpen: TcxButton
      Left = 207
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Open|Opens an existing filter'
      Caption = '&Open...'
      TabOrder = 2
      OnClick = btOpenClick
    end
    object btSave: TcxButton
      Left = 289
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Save As|Saves the active filter with a new name'
      Caption = 'Save &As...'
      TabOrder = 3
      OnClick = btSaveClick
    end
  end
  object pnlFilter: TPanel
    Left = 0
    Top = 25
    Width = 451
    Height = 161
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 5
    object FilterControl: TcxFilterControl
      Left = 5
      Top = 5
      Width = 441
      Height = 151
      Align = alClient
      LinkComponent = VerticalGrid
      TabOrder = 0
    end
  end
  object OpenDialog: TOpenDialog
    Left = 288
    Top = 112
  end
  object SaveDialog: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 360
    Top = 112
  end
end
