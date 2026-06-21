inherited frmVertGridMultiRecords: TfrmVertGridMultiRecords
  inherited cxDBVerticalGrid: TcxDBVerticalGrid
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
end
