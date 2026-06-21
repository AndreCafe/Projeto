inherited frmGridSummaries: TfrmGridSummaries
  inherited plGrid: TPanel
    inherited Grid: TcxGrid
      Top = 66
      Height = 98
      inherited GridDBTableView: TcxGridDBTableView
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsView.Indicator = True
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 435
      Height = 66
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object cbColumnsQuickCustomizing: TcxCheckBox
        Left = 5
        Top = 9
        Caption = 'Quick Column Customization '
        Properties.OnChange = cbColumnsQuickCustomizingPropertiesChange
        State = cbsChecked
        TabOrder = 0
        Transparent = True
        Width = 159
      end
      object pnlFeatureDescription: TPanel
        Left = 0
        Top = 33
        Width = 435
        Height = 33
        Align = alBottom
        BevelOuter = bvNone
        BorderWidth = 2
        ParentBackground = True
        ParentColor = True
        TabOrder = 1
        object lblCaptionDescription: TcxLabel
          Left = 2
          Top = 2
          Align = alClient
          AutoSize = False
          Caption = 
            '(To the left of the First Name column is our new Quick Column Cu' +
            'stomization button - press it to have instant access to both vis' +
            'ible and non-visible columns in your GridView)'
          Properties.WordWrap = True
          Transparent = True
          Height = 29
          Width = 431
        end
      end
    end
  end
end
