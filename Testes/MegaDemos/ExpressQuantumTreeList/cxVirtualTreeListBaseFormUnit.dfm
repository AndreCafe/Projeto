inherited cxVirtualTreeListDemoUnitForm: TcxVirtualTreeListDemoUnitForm
  Caption = 'Provider Mode'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDescription: TcxGroupBox
    Style.BorderStyle = ebsNone
  end
  object gbTreeListPlace: TcxGroupBox
    Left = 0
    Top = 64
    Align = alClient
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 1
    Height = 208
    Width = 385
    object cxVirtualTreeList: TcxVirtualTreeList
      Left = 8
      Top = 9
      Width = 369
      Height = 197
      Align = alClient
      Bands = <
        item
        end>
      TabOrder = 0
      OnExpanding = cxVirtualTreeListExpanding
      object clnID: TcxTreeListColumn
        PropertiesClassName = 'TcxSpinEditProperties'
        Caption.Text = 'Id'
        DataBinding.ValueType = 'Integer'
        Width = 182
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object clnName: TcxTreeListColumn
        Caption.Text = 'Text'
        DataBinding.ValueType = 'String'
        Width = 162
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object clnDate: TcxTreeListColumn
        Caption.Text = 'Date'
        DataBinding.ValueType = 'DateTime'
        Width = 171
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
    end
    object cxGroupBox4: TcxGroupBox
      Left = 2
      Top = 9
      Align = alLeft
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      TabOrder = 1
      Height = 197
      Width = 6
    end
    object cxGroupBox5: TcxGroupBox
      Left = 377
      Top = 9
      Align = alRight
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      TabOrder = 2
      Height = 197
      Width = 6
    end
    object cxGroupBox2: TcxGroupBox
      Left = 2
      Top = 2
      Align = alTop
      PanelStyle.Active = True
      Style.BorderStyle = ebsNone
      TabOrder = 3
      Height = 7
      Width = 381
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 2
    DesignSize = (
      385
      64)
    Height = 64
    Width = 385
    object cxGroupBox3: TcxGroupBox
      Left = 7
      Top = 7
      Anchors = [akLeft, akTop, akRight, akBottom]
      PanelStyle.Active = True
      TabOrder = 0
      Height = 57
      Width = 371
      object chkSmartLoadMode: TcxCheckBox
        Left = 16
        Top = 8
        Caption = 'Smart Load Mode'
        TabOrder = 0
        Transparent = True
        OnClick = chkSmartLoadModeClick
        Width = 121
      end
      object btFullExpand: TcxButton
        Left = 152
        Top = 8
        Width = 81
        Height = 21
        Caption = 'Full Expand'
        TabOrder = 1
        OnClick = btFullExpandClick
      end
      object sbMain: TdxStatusBar
        Left = 2
        Top = 35
        Width = 367
        Height = 20
        Panels = <
          item
            PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
            Width = 120
          end
          item
            PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
            Width = 120
          end
          item
            PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
            Width = 120
          end>
        PaintStyle = stpsUseLookAndFeel
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
      end
    end
  end
end
