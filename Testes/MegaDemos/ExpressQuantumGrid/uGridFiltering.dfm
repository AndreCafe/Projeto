inherited frmFitleringGrid: TfrmFitleringGrid
  inherited plGrid: TPanel
    inherited Grid: TcxGrid
      Top = 50
      Height = 114
    end
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 435
      Height = 50
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object Label1: TcxLabel
        Left = 8
        Top = 8
        Caption = 'Filter summary position:'
      end
      object cbFilterPanelLocation: TcxImageComboBox
        Left = 126
        Top = 5
        EditValue = 1
        Properties.Items = <
          item
            Description = 'Top'
            ImageIndex = 0
            Value = 0
          end
          item
            Description = 'Bottom'
            Value = 1
          end>
        Properties.OnChange = cbFilterPanelLocationPropertiesChange
        TabOrder = 0
        Width = 81
      end
      object cbDropDownColumnMRUList: TcxCheckBox
        Left = 221
        Top = 27
        Caption = 'Show most recently used (MRU) Filters on column dropdown'
        Properties.OnChange = cxCheckBox1PropertiesChange
        State = cbsChecked
        TabOrder = 2
        Transparent = True
        Width = 341
      end
      object cbDropDownTableViewMRUList: TcxCheckBox
        Left = 221
        Top = 5
        Caption = 'Show most recently used (MRU) Filters in summary'
        Properties.OnChange = cbDropDownTableViewMRUListPropertiesChange
        State = cbsChecked
        TabOrder = 1
        Transparent = True
        Width = 272
      end
    end
  end
end
