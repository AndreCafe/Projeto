inherited frmGridMasterDetail: TfrmGridMasterDetail
  inherited plGrid: TPanel
    Top = 102
    Height = 119
    inherited Grid: TcxGrid
      Height = 119
      inherited tvDepartments: TcxGridDBTableView
        OptionsSelection.InvertSelect = False
      end
    end
  end
  inherited pnlSeparator: TPanel
    Top = 102
  end
  object Panel1: TPanel
    Left = 0
    Top = 57
    Width = 435
    Height = 45
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 4
    object Label1: TcxLabel
      Left = 8
      Top = 28
      Caption = 
        '(Example: When active, changing column width for one Detail View' +
        ' is automatically reflected in all other Detail Views).'
      Transparent = True
    end
    object cbSynhronization: TcxCheckBox
      Left = 4
      Top = 9
      Caption = 'Synchronize Detail layouts'
      Properties.OnChange = cbSynhronizationPropertiesChange
      State = cbsChecked
      TabOrder = 0
      Transparent = True
      Width = 149
    end
  end
end
