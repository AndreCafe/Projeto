inherited frmDragAndDrop: TfrmDragAndDrop
  Caption = 'Drag And Drop'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDescription: TcxGroupBox
    Style.BorderStyle = ebsNone
  end
  inherited gbTreeListPlace: TcxGroupBox
    inherited tlDB: TcxDBTreeList
      OptionsData.Editing = False
      OnDragOver = tlDBDragOver
    end
  end
end
