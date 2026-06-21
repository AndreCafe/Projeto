inherited frmVertGridNavigator: TfrmVertGridNavigator
  Width = 631
  Height = 450
  inherited plTop: TPanel
    Width = 631
  end
  inherited pnlSeparator: TPanel
    Top = 66
    Width = 631
  end
  inherited pnlDescription: TPanel
    Top = 405
    Width = 631
    inherited lblRight1: TLabel
      Left = 626
    end
    inherited lblTop1: TLabel
      Width = 631
    end
    inherited lblBottom1: TLabel
      Width = 631
    end
    inherited pnlHintInternal: TPanel
      Width = 621
      inherited lblRight2: TLabel
        Left = 616
      end
      inherited lblTop2: TLabel
        Width = 621
      end
      inherited lblBottom2: TLabel
        Width = 621
      end
      inherited lblDescription: TLabel
        Width = 611
      end
    end
  end
  inherited cxDBVerticalGrid: TcxDBVerticalGrid
    Top = 66
    Width = 631
    Height = 339
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
  object pnlNavigator: TPanel [4]
    Left = 0
    Top = 25
    Width = 631
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object Label1: TLabel
      Left = 336
      Top = 15
      Width = 58
      Height = 13
      Caption = 'Layout Style'
    end
    object Navigator: TcxNavigator
      Left = 8
      Top = 8
      Width = 315
      Height = 25
      Control = cxDBVerticalGrid
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object cbvGridLayoutStyle: TcxComboBox
      Left = 399
      Top = 11
      Width = 121
      Height = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.OnEditValueChanged = cbvGridLayoutStylePropertiesEditValueChanged
      TabOrder = 1
      Text = 'cbvGridLayoutStyle'
    end
  end
end
