inherited fbPC: TfbPC
  Left = 420
  Top = 170
  Caption = 'Plano de Contas'
  ClientHeight = 279
  ClientWidth = 336
  OldCreateOrder = True
  OnClose = FrmBasePaiClose
  OnCreate = FrmBasePaiCreate
  ExplicitWidth = 344
  ExplicitHeight = 306
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 70
    Width = 336
    Height = 209
    ExplicitTop = 70
    ExplicitWidth = 336
    ExplicitHeight = 209
    object TL: TcxDBTreeList
      Left = 0
      Top = 0
      Width = 336
      Height = 209
      Styles.Background = cxStyle1
      Styles.Content = cxStyle1
      Styles.BandHeader = cxStyle2
      Styles.ColumnHeader = cxStyle3
      Styles.Footer = cxStyle5
      Styles.Indicator = cxStyle3
      Styles.Preview = cxStyle4
      Align = alClient
      Bands = <
        item
          Caption.AlignHorz = taCenter
        end>
      BufferedPaint = True
      DataController.DataSource = DM.dsPC
      DataController.ParentField = 'Pai'
      DataController.KeyField = 'ID'
      DefaultLayout = True
      LookAndFeel.Kind = lfFlat
      OptionsBehavior.GoToNextCellOnTab = True
      OptionsBehavior.DragCollapse = False
      OptionsBehavior.ExpandOnIncSearch = True
      OptionsBehavior.ShowHourGlass = False
      OptionsCustomizing.BandCustomizing = False
      OptionsCustomizing.BandVertSizing = False
      OptionsCustomizing.ColumnVertSizing = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRect = False
      OptionsView.CellTextMaxLineCount = -1
      OptionsView.ShowEditButtons = ecsbAlways
      OptionsView.ColumnAutoWidth = True
      OptionsView.Headers = False
      OptionsView.Indicator = True
      ParentColor = False
      Preview.AutoHeight = False
      Preview.MaxLineCount = 2
      RootValue = -1
      TabOrder = 0
      OnDragOver = TLDragOver
      object cxDBTreeList1Nome: TcxDBTreeListColumn
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 40
        Properties.ReadOnly = True
        DataBinding.FieldName = 'Nome'
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object cxDBTreeList1Sintetico: TcxDBTreeListColumn
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.NullStyle = nssUnchecked
        Properties.ReadOnly = True
        Properties.ValueChecked = 'True'
        Properties.ValueGrayed = ''
        Properties.ValueUnchecked = 'False'
        Visible = False
        Caption.Text = 'Sint'#233'tico'
        DataBinding.FieldName = 'Sintetico'
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
    end
  end
  inherited BarMgr: TdxBarManager
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'BarraTabSheet'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmNovo
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            Item = cmEditar
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            Item = cmApagar
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmAtualizar
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end>
        Name = 'BarraTabSheet'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'BarraLookup'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 42
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmOk
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            Item = cmCancelar
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end>
        Name = 'BarraLookup'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 1
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    LargeImages = FrmPri.im32
    Top = 112
    DockControlHeights = (
      0
      0
      70
      0)
    inherited cmNovo: TdxBarLargeButton
      OnClick = cmNovoClick
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      OnClick = cmEditarClick
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      OnClick = cmApagarClick
      ImageIndex = 12
    end
    inherited cmAtualizar: TdxBarLargeButton
      ShowCaption = False
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    object cmOk: TdxBarButton
      Caption = '&Encontrou'
      Category = 0
      Hint = 'Encontrou'
      Visible = ivAlways
      ImageIndex = 4
      ShortCut = 16397
      OnClick = cmOkClick
    end
    object cmCancelar: TdxBarButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      ImageIndex = 6
      OnClick = cmCancelarClick
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 8
    Top = 97
  end
  object cxStyleRepository1: TcxStyleRepository
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
  end
end
