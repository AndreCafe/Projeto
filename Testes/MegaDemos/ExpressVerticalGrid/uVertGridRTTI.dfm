inherited frmVerticalGridRTTI: TfrmVerticalGridRTTI
  Width = 584
  Height = 408
  object Splitter1: TSplitter [0]
    Left = 257
    Top = 25
    Width = 4
    Height = 338
  end
  inherited plTop: TPanel
    Width = 584
  end
  inherited pnlSeparator: TPanel
    Width = 584
  end
  inherited pnlDescription: TPanel
    Top = 363
    Width = 584
    inherited lblRight1: TLabel
      Left = 579
    end
    inherited lblTop1: TLabel
      Width = 584
    end
    inherited lblBottom1: TLabel
      Width = 584
    end
    inherited pnlHintInternal: TPanel
      Width = 574
      inherited lblRight2: TLabel
        Left = 569
      end
      inherited lblTop2: TLabel
        Width = 574
      end
      inherited lblBottom2: TLabel
        Width = 574
      end
      inherited lblDescription: TLabel
        Width = 564
      end
    end
  end
  object pnlInspector: TPanel
    Left = 0
    Top = 25
    Width = 257
    Height = 338
    Align = alLeft
    BevelOuter = bvNone
    BorderWidth = 2
    TabOrder = 3
    object pnlObjectCombo: TPanel
      Left = 2
      Top = 2
      Width = 253
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        253
        25)
      object cbSelectedObject: TcxComboBox
        Left = 2
        Top = 2
        Width = 249
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Properties.DropDownListStyle = lsEditFixedList
        Properties.OnEditValueChanged = cbSelectedObjectPropertiesEditValueChanged
        TabOrder = 0
      end
    end
    object Inspector: TcxRTTIInspector
      Left = 2
      Top = 27
      Width = 253
      Height = 309
      Align = alClient
      OptionsView.RowHeaderWidth = 119
      TabOrder = 1
    end
  end
  object pnlControls: TPanel
    Left = 261
    Top = 25
    Width = 323
    Height = 338
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object Edit1: TEdit
      Left = 152
      Top = 80
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Button1: TButton
      Left = 184
      Top = 192
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 1
    end
    object Memo1: TMemo
      Left = 328
      Top = 40
      Width = 169
      Height = 105
      Lines.Strings = (
        'Memo1')
      TabOrder = 2
    end
    object CheckBox1: TCheckBox
      Left = 32
      Top = 32
      Width = 97
      Height = 17
      Caption = 'CheckBox1'
      TabOrder = 3
    end
    object RichEdit1: TRichEdit
      Left = 32
      Top = 96
      Width = 105
      Height = 129
      Lines.Strings = (
        'RichEdit1')
      TabOrder = 4
    end
  end
end
