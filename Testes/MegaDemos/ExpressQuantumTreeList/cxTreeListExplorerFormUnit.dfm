inherited frmTreeListExplorer: TfrmTreeListExplorer
  Caption = 'File Explorer'
  ExplicitWidth = 760
  ExplicitHeight = 455
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDescription: TcxGroupBox
    Style.BorderStyle = ebsNone
    inherited cxGroupBox6: TcxGroupBox
      ExplicitWidth = 746
      Width = 746
      inherited pnlHintInternal: TPanel
        Width = 744
        ExplicitWidth = 744
        inherited lblRight2: TLabel
          Left = 739
          ExplicitLeft = 739
        end
        inherited lblTop2: TLabel
          Width = 744
          ExplicitWidth = 744
        end
        inherited lblBottom2: TLabel
          Width = 744
          ExplicitWidth = 744
        end
        inherited lblDescription: TLabel
          Width = 734
          ExplicitWidth = 734
        end
      end
    end
  end
  inherited gbTreeListPlace: TcxGroupBox
    Top = 44
    ExplicitTop = 44
    ExplicitHeight = 363
    Height = 363
    inherited cxGroupBox4: TcxGroupBox
      ExplicitHeight = 352
      Height = 352
    end
    inherited cxGroupBox5: TcxGroupBox
      ExplicitHeight = 352
      Height = 352
    end
    inherited tlUnbound: TcxTreeList
      Height = 352
      Bands = <
        item
        end>
      OptionsData.Editing = False
      Styles.IncSearch = styleIncSearch
      OnCompare = tlUnboundCompare
      OnExpanded = tlUnboundExpanded
      OnExpanding = tlUnboundExpanding
      OnGetNodeImageIndex = tlUnboundGetNodeImageIndex
      ExplicitHeight = 352
      object clnName: TcxTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Caption.ShowEndEllipsis = False
        Caption.Text = 'Name'
        DataBinding.ValueType = 'String'
        Width = 206
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object clnExtension: TcxTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Caption.ShowEndEllipsis = False
        Caption.Text = 'Extension'
        DataBinding.ValueType = 'String'
        Width = 89
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object clnSize: TcxTreeListColumn
        Caption.ShowEndEllipsis = False
        Caption.Text = 'Size'
        DataBinding.ValueType = 'Integer'
        Width = 40
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
        OnGetDisplayText = clnSizeGetDisplayText
      end
      object clnDateTime: TcxTreeListColumn
        Caption.ShowEndEllipsis = False
        Caption.Text = 'Date Modified'
        DataBinding.ValueType = 'DateTime'
        Width = 106
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
    end
  end
  object cxLabel1: TcxLabel
    Left = 177
    Top = 8
    Caption = 'Search Color:'
    Transparent = True
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 3
    DesignSize = (
      760
      44)
    Height = 44
    Width = 760
    object cxGroupBox1: TcxGroupBox
      Left = 7
      Top = 7
      Anchors = [akLeft, akTop, akRight, akBottom]
      PanelStyle.Active = True
      TabOrder = 0
      Height = 37
      Width = 746
      object chkIncSearch: TcxCheckBox
        Left = 16
        Top = 8
        Caption = 'Incremental Search'
        Properties.OnEditValueChanged = chkIncSearchPropertiesEditValueChanged
        TabOrder = 0
        Transparent = True
        Width = 159
      end
      object cbSearchColor: TcxColorComboBox
        Left = 252
        Top = 8
        ColorValue = clDefault
        Properties.CustomColors = <
          item
            Color = clBlack
            Description = 'clBlack'
          end
          item
            Color = clMaroon
            Description = 'clMaroon'
          end
          item
            Color = clGreen
            Description = 'clGreen'
          end
          item
            Color = clOlive
            Description = 'clOlive'
          end
          item
            Color = clNavy
            Description = 'clNavy'
          end
          item
            Color = clPurple
            Description = 'clPurple'
          end
          item
            Color = clTeal
            Description = 'clTeal'
          end
          item
            Color = clGray
            Description = 'clGray'
          end
          item
            Color = clSilver
            Description = 'clSilver'
          end
          item
            Color = clRed
            Description = 'clRed'
          end
          item
            Color = clLime
            Description = 'clLime'
          end
          item
            Color = clYellow
            Description = 'clYellow'
          end
          item
            Color = clBlue
            Description = 'clBlue'
          end
          item
            Color = clFuchsia
            Description = 'clFuchsia'
          end
          item
            Color = clAqua
            Description = 'clAqua'
          end
          item
            Color = clWhite
            Description = 'clWhite'
          end
          item
            Color = clScrollBar
            Description = 'clScrollBar'
          end
          item
            Color = clBackground
            Description = 'clBackground'
          end
          item
            Color = clActiveCaption
            Description = 'clActiveCaption'
          end
          item
            Color = clInactiveCaption
            Description = 'clInactiveCaption'
          end
          item
            Color = clMenu
            Description = 'clMenu'
          end
          item
            Color = clWindow
            Description = 'clWindow'
          end
          item
            Color = clWindowFrame
            Description = 'clWindowFrame'
          end
          item
            Color = clMenuText
            Description = 'clMenuText'
          end
          item
            Color = clWindowText
            Description = 'clWindowText'
          end
          item
            Color = clCaptionText
            Description = 'clCaptionText'
          end
          item
            Color = clActiveBorder
            Description = 'clActiveBorder'
          end
          item
            Color = clInactiveBorder
            Description = 'clInactiveBorder'
          end
          item
            Color = clAppWorkSpace
            Description = 'clAppWorkSpace'
          end
          item
            Color = clHighlight
            Description = 'clHighlight'
          end
          item
            Color = clHighlightText
            Description = 'clHighlightText'
          end
          item
            Color = clBtnFace
            Description = 'clBtnFace'
          end
          item
            Color = clBtnShadow
            Description = 'clBtnShadow'
          end
          item
            Color = clGrayText
            Description = 'clGrayText'
          end
          item
            Color = clBtnText
            Description = 'clBtnText'
          end
          item
            Color = clInactiveCaptionText
            Description = 'clInactiveCaptionText'
          end
          item
            Color = clBtnHighlight
            Description = 'clBtnHighlight'
          end
          item
            Color = cl3DDkShadow
            Description = 'cl3DDkShadow'
          end
          item
            Color = cl3DLight
            Description = 'cl3DLight'
          end
          item
            Color = clInfoText
            Description = 'clInfoText'
          end
          item
            Color = clInfoBk
            Description = 'clInfoBk'
          end
          item
            Color = clHotLight
            Description = 'clHotLight'
          end
          item
            Color = clGradientActiveCaption
            Description = 'clGradientActiveCaption'
          end
          item
            Color = clGradientInactiveCaption
            Description = 'clGradientInactiveCaption'
          end
          item
            Color = clMenuHighlight
            Description = 'clMenuHighlight'
          end
          item
            Color = clMenuBar
            Description = 'clMenuBar'
          end>
        Properties.OnEditValueChanged = cbSearchColorPropertiesEditValueChanged
        TabOrder = 1
        Width = 135
      end
      object cbSearchTextColor: TcxColorComboBox
        Left = 531
        Top = 8
        ColorValue = clDefault
        Properties.CustomColors = <
          item
            Color = clBlack
            Description = 'clBlack'
          end
          item
            Color = clMaroon
            Description = 'clMaroon'
          end
          item
            Color = clGreen
            Description = 'clGreen'
          end
          item
            Color = clOlive
            Description = 'clOlive'
          end
          item
            Color = clNavy
            Description = 'clNavy'
          end
          item
            Color = clPurple
            Description = 'clPurple'
          end
          item
            Color = clTeal
            Description = 'clTeal'
          end
          item
            Color = clGray
            Description = 'clGray'
          end
          item
            Color = clSilver
            Description = 'clSilver'
          end
          item
            Color = clRed
            Description = 'clRed'
          end
          item
            Color = clLime
            Description = 'clLime'
          end
          item
            Color = clYellow
            Description = 'clYellow'
          end
          item
            Color = clBlue
            Description = 'clBlue'
          end
          item
            Color = clFuchsia
            Description = 'clFuchsia'
          end
          item
            Color = clAqua
            Description = 'clAqua'
          end
          item
            Color = clWhite
            Description = 'clWhite'
          end
          item
            Color = clScrollBar
            Description = 'clScrollBar'
          end
          item
            Color = clBackground
            Description = 'clBackground'
          end
          item
            Color = clActiveCaption
            Description = 'clActiveCaption'
          end
          item
            Color = clInactiveCaption
            Description = 'clInactiveCaption'
          end
          item
            Color = clMenu
            Description = 'clMenu'
          end
          item
            Color = clWindow
            Description = 'clWindow'
          end
          item
            Color = clWindowFrame
            Description = 'clWindowFrame'
          end
          item
            Color = clMenuText
            Description = 'clMenuText'
          end
          item
            Color = clWindowText
            Description = 'clWindowText'
          end
          item
            Color = clCaptionText
            Description = 'clCaptionText'
          end
          item
            Color = clActiveBorder
            Description = 'clActiveBorder'
          end
          item
            Color = clInactiveBorder
            Description = 'clInactiveBorder'
          end
          item
            Color = clAppWorkSpace
            Description = 'clAppWorkSpace'
          end
          item
            Color = clHighlight
            Description = 'clHighlight'
          end
          item
            Color = clHighlightText
            Description = 'clHighlightText'
          end
          item
            Color = clBtnFace
            Description = 'clBtnFace'
          end
          item
            Color = clBtnShadow
            Description = 'clBtnShadow'
          end
          item
            Color = clGrayText
            Description = 'clGrayText'
          end
          item
            Color = clBtnText
            Description = 'clBtnText'
          end
          item
            Color = clInactiveCaptionText
            Description = 'clInactiveCaptionText'
          end
          item
            Color = clBtnHighlight
            Description = 'clBtnHighlight'
          end
          item
            Color = cl3DDkShadow
            Description = 'cl3DDkShadow'
          end
          item
            Color = cl3DLight
            Description = 'cl3DLight'
          end
          item
            Color = clInfoText
            Description = 'clInfoText'
          end
          item
            Color = clInfoBk
            Description = 'clInfoBk'
          end
          item
            Color = clHotLight
            Description = 'clHotLight'
          end
          item
            Color = clGradientActiveCaption
            Description = 'clGradientActiveCaption'
          end
          item
            Color = clGradientInactiveCaption
            Description = 'clGradientInactiveCaption'
          end
          item
            Color = clMenuHighlight
            Description = 'clMenuHighlight'
          end
          item
            Color = clMenuBar
            Description = 'clMenuBar'
          end>
        Properties.OnEditValueChanged = cbSearchTextColorPropertiesEditValueChanged
        TabOrder = 2
        Width = 135
      end
      object cxLabel2: TcxLabel
        Left = 431
        Top = 8
        Caption = 'Search Text Color:'
        Transparent = True
      end
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 384
    Top = 72
    PixelsPerInch = 96
    object styleIncSearch: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clTeal
      TextColor = clYellow
    end
  end
end
