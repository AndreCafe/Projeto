inherited frmVertGridInplaceEditors: TfrmVertGridInplaceEditors
  ExplicitWidth = 451
  ExplicitHeight = 304
  inherited plTop: TPanel
    Width = 451
    ExplicitWidth = 451
  end
  inherited pnlSeparator: TPanel
    Width = 451
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
  object VerticalGrid: TcxVerticalGrid
    Left = 0
    Top = 25
    Width = 451
    Height = 234
    Align = alClient
    OptionsView.AutoScaleBands = False
    OptionsView.RowHeaderWidth = 145
    OptionsView.ValueWidth = 240
    TabOrder = 3
    Version = 1
    object VerticalGridCategoryRow1: TcxCategoryRow
      Properties.Caption = 'Standard Editors'
      ID = 0
      ParentID = -1
      Index = 0
      Version = 1
    end
    object vgButtonEditor: TcxEditorRow
      Properties.Caption = 'Button Editor'
      Properties.RepositoryItem = EditRepositoryButtonItem
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = 'Press me...'
      ID = 1
      ParentID = 0
      Index = 0
      Version = 1
    end
    object vgCheckBoxEditor: TcxEditorRow
      Properties.Caption = 'CheckBox Editor'
      Properties.RepositoryItem = EditRepositoryCheckBoxItem
      Properties.DataBinding.ValueType = 'Boolean'
      Properties.Value = True
      ID = 2
      ParentID = 0
      Index = 1
      Version = 1
    end
    object vgCurrencyEditor: TcxEditorRow
      Properties.Caption = 'Currency Editor'
      Properties.RepositoryItem = EditRepositoryCurrencyItem
      Properties.DataBinding.ValueType = 'Currency'
      Properties.Value = 123428900c
      ID = 3
      ParentID = 0
      Index = 2
      Version = 1
    end
    object vgMaskEditor: TcxEditorRow
      Properties.Caption = 'Advanced Mask Editor'
      Properties.RepositoryItem = EditRepositoryMaskItem
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = '(234)897-235'
      ID = 4
      ParentID = 0
      Index = 3
      Version = 1
    end
    object vgRadioGroupEditor: TcxEditorRow
      Properties.Caption = 'RadioGroup Editor'
      Properties.RepositoryItem = EditRepositoryRadioGroupItem
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = '0'
      ID = 5
      ParentID = 0
      Index = 4
      Version = 1
    end
    object vgSpintEditor: TcxEditorRow
      Properties.Caption = 'Spin Editor'
      Properties.RepositoryItem = EditRepositorySpinItem
      Properties.DataBinding.ValueType = 'Integer'
      Properties.Value = Null
      ID = 6
      ParentID = 0
      Index = 5
      Version = 1
    end
    object vgTextEditor: TcxEditorRow
      Properties.Caption = 'Text Editor'
      Properties.RepositoryItem = EditRepositoryTextItem
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = 'Text'
      ID = 7
      ParentID = 0
      Index = 6
      Version = 1
    end
    object vgTimeEditor: TcxEditorRow
      Properties.Caption = 'Time Editor'
      Properties.RepositoryItem = EditRepositoryTimeItem
      Properties.DataBinding.ValueType = 'DateTime'
      Properties.Value = Null
      ID = 8
      ParentID = 0
      Index = 7
      Version = 1
    end
    object VerticalGridCategoryRow2: TcxCategoryRow
      Properties.Caption = 'ComboBoxes'
      ID = 9
      ParentID = -1
      Index = 1
      Version = 1
    end
    object vgComboBoxEditor: TcxEditorRow
      Properties.Caption = 'ComboBox Editor'
      Properties.RepositoryItem = EditRepositoryComboBoxItem
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = 'Green'
      ID = 10
      ParentID = 9
      Index = 0
      Version = 1
    end
    object vgHyperLinkEditor: TcxEditorRow
      Properties.Caption = 'HyperLink Editor'
      Properties.RepositoryItem = EditRepositoryHyperLinkItem
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = 'http://www.devexpress.com'
      ID = 11
      ParentID = 9
      Index = 1
      Version = 1
    end
    object vgImageComboBoxEditor: TcxEditorRow
      Properties.Caption = 'Image ComboBox Editor'
      Properties.RepositoryItem = EditRepositoryImageComboBoxItem
      Properties.DataBinding.ValueType = 'Integer'
      Properties.Value = 2
      ID = 12
      ParentID = 9
      Index = 2
      Version = 1
    end
    object vgLookupComboBoxEditor: TcxEditorRow
      Properties.Caption = 'Lookup ComboBox Editor'
      Properties.RepositoryItem = EditRepositoryLookupComboBoxItem
      Properties.DataBinding.ValueType = 'Integer'
      Properties.Value = Null
      ID = 13
      ParentID = 9
      Index = 3
      Version = 1
    end
    object vgMRUEditor: TcxEditorRow
      Properties.Caption = 'MRU Editor'
      Properties.RepositoryItem = EditRepositoryMRUItem
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = 'What'#39's your favorite color?'
      ID = 14
      ParentID = 9
      Index = 4
      Version = 1
    end
    object VerticalGridCategoryRow3: TcxCategoryRow
      Properties.Caption = 'Blobs'
      ID = 15
      ParentID = -1
      Index = 2
      Version = 1
    end
    object vgBlobEditor: TcxEditorRow
      Properties.Caption = 'Blob Editor'
      Properties.RepositoryItem = EditRepositoryBlobItem
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = 'Please add text here...'
      ID = 16
      ParentID = 15
      Index = 0
      Version = 1
    end
    object vgImageEditor: TcxEditorRow
      Height = 220
      Properties.Caption = 'Image Editor'
      Properties.RepositoryItem = EditRepositoryImageItem
      Properties.DataBinding.ValueType = 'Variant'
      Properties.Value = Null
      ID = 17
      ParentID = 15
      Index = 1
      Version = 1
    end
    object vgMemoEditor: TcxEditorRow
      Height = 150
      Properties.Caption = 'Memo Editor'
      Properties.RepositoryItem = EditRepositoryMemoItem
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 18
      ParentID = 15
      Index = 2
      Version = 1
    end
    object VerticalGridCategoryRow4: TcxCategoryRow
      Properties.Caption = 'Popup'
      ID = 19
      ParentID = -1
      Index = 3
      Version = 1
    end
    object vgCalcEditor: TcxEditorRow
      Properties.Caption = 'Calc Editor'
      Properties.RepositoryItem = EditRepositoryCalcItem
      Properties.DataBinding.ValueType = 'Float'
      Properties.Value = 8234.219999999999000000
      ID = 20
      ParentID = 19
      Index = 0
      Version = 1
    end
    object vgDateEditor: TcxEditorRow
      Properties.Caption = 'Date Editor'
      Properties.RepositoryItem = EditRepositoryDateItem
      Properties.DataBinding.ValueType = 'DateTime'
      Properties.Value = Null
      ID = 21
      ParentID = 19
      Index = 1
      Version = 1
    end
    object vgPopupEditor: TcxEditorRow
      Properties.Caption = 'Popup Editor'
      Properties.RepositoryItem = EditRepositoryPopupItem
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = 'Pop me up...'
      ID = 22
      ParentID = 19
      Index = 2
      Version = 1
    end
    object VerticalGridCategoryRow5: TcxCategoryRow
      Properties.Caption = 'Extended'
      ID = 23
      ParentID = -1
      Index = 4
      Version = 1
    end
    object vgProgressBarEditor: TcxEditorRow
      Properties.Caption = 'ProgressBar Editor'
      Properties.RepositoryItem = EditRepositoryProgressBar
      Properties.DataBinding.ValueType = 'Integer'
      Properties.Value = 40
      Properties.OnGetEditingProperties = vgProgressBarEditorPropertiesGetEditingProperties
      ID = 24
      ParentID = 23
      Index = 0
      Version = 1
    end
    object vgShellComboBoxEditor: TcxEditorRow
      Properties.Caption = 'Shell ComboBox Editor'
      Properties.RepositoryItem = EditRepositoryShellComboBoxItem
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 25
      ParentID = 23
      Index = 1
      Version = 1
    end
    object vgTrackBarEditor: TcxEditorRow
      Properties.Caption = 'Track BarEditor'
      Properties.RepositoryItem = EditRepositoryTrackBar
      Properties.DataBinding.ValueType = 'Integer'
      Properties.Value = 6
      ID = 26
      ParentID = 23
      Index = 2
      Version = 1
    end
    object vgColorComboBoxEditor: TcxEditorRow
      Properties.Caption = 'Color ComboBox Editor'
      Properties.RepositoryItem = EditRepositoryColorComboBox
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 27
      ParentID = 23
      Index = 3
      Version = 1
    end
    object vgFontComboBoxEditor: TcxEditorRow
      Properties.Caption = 'Font ComboBox Editor'
      Properties.RepositoryItem = EditRepositoryFontNameComboBox
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 28
      ParentID = 23
      Index = 4
      Version = 1
    end
    object vgLabel: TcxEditorRow
      Properties.Caption = 'Label'
      Properties.RepositoryItem = EditRepositoryLabel
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = 'Sample'
      Styles.Content = cxStyle1
      ID = 29
      ParentID = 23
      Index = 5
      Version = 1
    end
  end
  object EditRepository: TcxEditRepository
    Left = 328
    Top = 168
    object EditRepositoryBlobItem: TcxEditRepositoryBlobItem
      Properties.BlobEditKind = bekMemo
    end
    object EditRepositoryButtonItem: TcxEditRepositoryButtonItem
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = EditRepositoryButtonItemPropertiesButtonClick
    end
    object EditRepositoryCalcItem: TcxEditRepositoryCalcItem
    end
    object EditRepositoryCheckBoxItem: TcxEditRepositoryCheckBoxItem
    end
    object EditRepositoryComboBoxItem: TcxEditRepositoryComboBoxItem
      Properties.Items.Strings = (
        'Blue'
        'Green'
        'Brown'
        'Yellow'
        'Red'
        'Black')
    end
    object EditRepositoryCurrencyItem: TcxEditRepositoryCurrencyItem
    end
    object EditRepositoryDateItem: TcxEditRepositoryDateItem
    end
    object EditRepositoryHyperLinkItem: TcxEditRepositoryHyperLinkItem
      Properties.SingleClick = True
    end
    object EditRepositoryImageItem: TcxEditRepositoryImageItem
      Properties.GraphicClassName = 'TJPEGImage'
    end
    object EditRepositoryImageComboBoxItem: TcxEditRepositoryImageComboBoxItem
      Properties.Images = dmMain.imMain
      Properties.Items = <
        item
          Description = 'Cash'
          ImageIndex = 8
          Value = 1
        end
        item
          Description = 'Visa'
          ImageIndex = 9
          Value = 2
        end
        item
          Description = 'Master Card'
          ImageIndex = 10
          Value = 2
        end
        item
          Description = 'American Express'
          ImageIndex = 11
          Value = 4
        end>
    end
    object EditRepositoryLookupComboBoxItem: TcxEditRepositoryLookupComboBoxItem
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Name'
        end>
      Properties.ListSource = dmMain.dsDXProducts
    end
    object EditRepositoryMaskItem: TcxEditRepositoryMaskItem
      Properties.MaskKind = emkRegExprEx
      Properties.EditMask = '(\(\d\d\d\))? \d\d\d - \d\d\d\d'
    end
    object EditRepositoryMemoItem: TcxEditRepositoryMemoItem
    end
    object EditRepositoryMRUItem: TcxEditRepositoryMRUItem
      Properties.LookupItems.Strings = (
        'Blue'
        'Green'
        'Brown'
        'Yellow'
        'Red'
        'Black')
      Properties.ShowEllipsis = False
    end
    object EditRepositoryPopupItem: TcxEditRepositoryPopupItem
      Properties.OnInitPopup = EditRepositoryPopupItemPropertiesInitPopup
    end
    object EditRepositoryRadioGroupItem: TcxEditRepositoryRadioGroupItem
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = 'Cash'
          Value = 0
        end
        item
          Caption = 'Visa'
          Value = 2
        end
        item
          Caption = 'Master Card'
          Value = 1
        end>
    end
    object EditRepositorySpinItem: TcxEditRepositorySpinItem
    end
    object EditRepositoryTextItem: TcxEditRepositoryTextItem
    end
    object EditRepositoryTimeItem: TcxEditRepositoryTimeItem
      Properties.Use24HourFormat = False
    end
    object EditRepositoryProgressBar: TcxEditRepositoryProgressBar
      Properties.PeakValue = 40.000000000000000000
    end
    object EditRepositoryShellComboBoxItem: TcxEditRepositoryShellComboBoxItem
    end
    object EditRepositoryTrackBar: TcxEditRepositoryTrackBar
    end
    object EditRepositoryColorComboBox: TcxEditRepositoryColorComboBox
      Properties.CustomColors = <>
    end
    object EditRepositoryFontNameComboBox: TcxEditRepositoryFontNameComboBox
    end
    object EditRepositoryLabel: TcxEditRepositoryLabel
      Properties.Depth = 3
      Properties.LabelStyle = cxlsRaised
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 480
    Top = 64
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
end
