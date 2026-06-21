inherited frmVertGridStyles: TfrmVertGridStyles
  inherited cxDBVerticalGrid: TcxDBVerticalGrid
    Top = 63
    Height = 162
    inherited cxDBVerticalGridID: TcxDBMultiEditorRow
      Properties.Editors = <
        item
          ImageIndex = 16
          DataBinding.FieldName = 'ID'
        end>
      ID = 0
      ParentID = -1
      Index = 0
      Version = 1
    end
    inherited fldTrademark: TcxDBEditorRow
      ID = 1
      ParentID = -1
      Index = 1
      Version = 1
    end
    inherited fldModel: TcxDBEditorRow
      ID = 2
      ParentID = -1
      Index = 2
      Version = 1
    end
    inherited fldCategory: TcxDBEditorRow
      ID = 3
      ParentID = -1
      Index = 3
      Version = 1
    end
    inherited rowPerformance_Attributes: TcxCategoryRow
      ID = 4
      ParentID = -1
      Index = 4
      Version = 1
    end
    inherited fldHP: TcxDBEditorRow
      ID = 5
      ParentID = 4
      Index = 0
      Version = 1
    end
    inherited fldLiter: TcxDBEditorRow
      ID = 6
      ParentID = 4
      Index = 1
      Version = 1
    end
    inherited fldCyl: TcxDBEditorRow
      ID = 7
      ParentID = 4
      Index = 2
      Version = 1
    end
    inherited fldTransmissSpeedCount: TcxDBEditorRow
      ID = 8
      ParentID = 4
      Index = 3
      Version = 1
    end
    inherited fldTransmissAutomatic: TcxDBEditorRow
      ID = 9
      ParentID = 4
      Index = 4
      Version = 1
    end
    inherited cxDBVerticalGrid1DBMultiEditorRow1: TcxDBMultiEditorRow
      ID = 10
      ParentID = 4
      Index = 5
      Version = 1
    end
    inherited rowNotes: TcxCategoryRow
      ID = 11
      ParentID = -1
      Index = 5
      Version = 1
    end
    inherited fldDescription: TcxDBEditorRow
      ID = 12
      ParentID = 11
      Index = 0
      Version = 1
    end
    inherited fldHyperlink: TcxDBEditorRow
      ID = 13
      ParentID = 11
      Index = 1
      Version = 1
    end
    inherited rowOthers: TcxCategoryRow
      ID = 14
      ParentID = -1
      Index = 6
      Version = 1
    end
    inherited fldPrice: TcxDBEditorRow
      ID = 15
      ParentID = 14
      Index = 0
      Version = 1
    end
    inherited fldIcon: TcxDBEditorRow
      ID = 16
      ParentID = 14
      Index = 1
      Version = 1
    end
    inherited fldPicture: TcxDBEditorRow
      ID = 17
      ParentID = 14
      Index = 2
      Version = 1
    end
  end
  object pnlStyles: TPanel [4]
    Left = 0
    Top = 25
    Width = 451
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object Label1: TLabel
      Left = 2
      Top = 11
      Width = 74
      Height = 13
      Caption = 'Style Sheet List'
    end
    object cbStyleSheetList: TcxComboBox
      Left = 99
      Top = 8
      Properties.DropDownListStyle = lsFixedList
      Properties.OnEditValueChanged = cbStyleSheetListPropertiesEditValueChanged
      TabOrder = 0
      Width = 159
    end
    object btnNew: TcxButton
      Left = 271
      Top = 5
      Width = 110
      Height = 28
      Caption = '&New Style...'
      CommandLinkHint = ''
      TabOrder = 1
      OnClick = btnNewClick
    end
    object btnEdit: TcxButton
      Left = 386
      Top = 5
      Width = 110
      Height = 28
      Caption = '&Edit a Style...'
      CommandLinkHint = ''
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
      CommandLinkHint = ''
      TabOrder = 3
      OnClick = btnCopyClick
    end
    object btnDelete: TcxButton
      Left = 617
      Top = 5
      Width = 110
      Height = 29
      Caption = '&Delete a Style...'
      CommandLinkHint = ''
      TabOrder = 4
      OnClick = btnDeleteClick
    end
    object cbShading: TcxCheckBox
      Left = 737
      Top = 6
      Caption = 'Shading'
      Properties.OnChange = cbShadingPropertiesChange
      TabOrder = 5
      Visible = False
      Width = 90
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 192
    Top = 72
    PixelsPerInch = 96
  end
end
