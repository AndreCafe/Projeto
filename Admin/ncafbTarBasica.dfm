inherited fbTarBasica: TfbTarBasica
  Left = 100
  Top = 128
  Caption = 'Tarifa'#231#227'o B'#225'sica'
  ClientHeight = 541
  ClientWidth = 694
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  ExplicitWidth = 702
  ExplicitHeight = 568
  PixelsPerInch = 96
  TextHeight = 14
  inherited panPri: TParentedPanel
    AlignWithMargins = True
    Width = 694
    Height = 536
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 5
    ExplicitWidth = 694
    ExplicitHeight = 536
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 694
      Height = 36
      ExplicitWidth = 694
      ExplicitHeight = 36
    end
    object LMDSimplePanel1: TLMDSimplePanel
      AlignWithMargins = True
      Left = 0
      Top = 41
      Width = 694
      Height = 495
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Bevel.Mode = bmStandard
      TabOrder = 1
      object Grid: TcxGrid
        Left = 1
        Top = 1
        Width = 692
        Height = 493
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        BorderStyle = cxcbsNone
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LevelTabs.Style = 5
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        object TV: TcxGridDBTableView
          OnDblClick = cmEditarClick
          Navigator.Buttons.CustomButtons = <>
          FilterBox.CustomizeDialog = False
          FilterBox.Visible = fvNever
          DataController.DataSource = DS
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Filtering.ColumnMRUItemsList = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.CellAutoHeight = True
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          OptionsView.Header = False
          object TVCor: TcxGridDBColumn
            DataBinding.FieldName = 'Cor'
            PropertiesClassName = 'TcxColorComboBoxProperties'
            Properties.CustomColors = <>
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.ShowDescriptions = False
            Width = 45
          end
          object TVDescricao: TcxGridDBColumn
            Caption = 'Nome'
            DataBinding.FieldName = 'Descricao'
            PropertiesClassName = 'TcxTextEditProperties'
            Width = 137
          end
          object TVTarifasPorHora: TcxGridDBColumn
            DataBinding.FieldName = 'TarifasPorHora'
            PropertiesClassName = 'TcxTextEditProperties'
            Styles.Content = FrmPri.cxStyle1
            Width = 216
          end
          object TVPadrao: TcxGridDBColumn
            PropertiesClassName = 'TcxTextEditProperties'
            OnCustomDrawCell = TVPadraoCustomDrawCell
            OnGetDisplayText = TVPadraoGetDisplayText
            Width = 128
          end
        end
        object GL: TcxGridLevel
          Caption = 'Tarifas:'
          GridView = TV
          Options.DetailTabsPosition = dtpTop
        end
      end
    end
  end
  inherited BarMgr: TdxBarManager
    ImageOptions.LargeImages = dmImagens.im24
    ImageOptions.MakeDisabledImagesFaded = True
    Left = 320
    Top = 128
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmNovo'
        end
        item
          Visible = True
          ItemName = 'cmEditar'
        end
        item
          Visible = True
          ItemName = 'cmApagar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmTarifaPadrao'
        end>
      OldName = 'BarraTabSheet1'
      UseRecentItems = False
    end
    object BarMgrBar2: TdxBar [1]
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 668
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = False
      WholeRow = False
    end
    inherited cmNovo: TdxBarLargeButton
      Caption = '&Nova Tarifa'
      Hint = 'Nova Tarifa'
      LargeImageIndex = 6
      OnClick = cmNovoClick
      ShowCaption = True
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      LargeImageIndex = 2
      OnClick = cmEditarClick
      ShowCaption = True
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      Caption = '&Remover '
      Hint = 'Remover '
      LargeImageIndex = 7
      OnClick = cmApagarClick
      ShowCaption = True
      ImageIndex = 12
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    object dxBarButton1: TdxBarButton
      Caption = 'Criar novo grupo de tarifa'
      Category = 0
      Hint = 'Criar novo grupo de tarifa'
      Style = FrmPri.cxStyle1
      Visible = ivAlways
      ImageIndex = 0
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton2: TdxBarButton
      Caption = 'Editar'
      Category = 0
      Hint = 'Editar'
      Style = FrmPri.cxStyle1
      Visible = ivAlways
      ImageIndex = 9
      PaintStyle = psCaptionGlyph
    end
    object dxBarButton3: TdxBarButton
      Caption = 'Apagar'
      Category = 0
      Hint = 'Apagar'
      Style = FrmPri.cxStyle1
      Visible = ivAlways
      ImageIndex = 6
      PaintStyle = psCaptionGlyph
    end
    object cmTarifaPadrao: TdxBarLargeButton
      Caption = 'Definir como tarifa padr'#227'o'
      Category = 0
      Hint = 'Definir como tarifa padr'#227'o'
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = cmTarifaPadraoClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 360
    Top = 160
  end
  inherited CP: TdxComponentPrinter
    Left = 408
    Top = 160
  end
  inherited dlgExp: TSaveDialog
    Left = 320
    Top = 96
  end
  inherited pmLay: TdxBarPopupMenu
    Left = 320
    Top = 160
  end
  inherited pmPeriodo: TdxBarPopupMenu
    Left = 360
    Top = 96
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 360
    Top = 128
    PixelsPerInch = 96
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
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
  object Tab: TnxTable
    Database = Dados.db
    Timeout = 10000
    OnCalcFields = TabCalcFields
    TableName = 'Tarifa'
    IndexName = 'IPrim'
    Left = 56
    Top = 112
    object TabTipoAcesso: TWordField
      FieldName = 'TipoAcesso'
    end
    object TabCor: TIntegerField
      FieldName = 'Cor'
    end
    object TabCorFonte: TIntegerField
      FieldName = 'CorFonte'
    end
    object TabDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object TabReinicia: TBooleanField
      FieldName = 'Reinicia'
    end
    object TabPrecosStr: TnxMemoField
      FieldName = 'PrecosStr'
      BlobType = ftMemo
    end
    object TabDivQtd: TIntegerField
      FieldName = 'DivQtd'
    end
    object TabReiniciaDesde: TWordField
      FieldName = 'ReiniciaDesde'
    end
    object TabDivTipo: TWordField
      FieldName = 'DivTipo'
    end
    object TabArredondar: TWordField
      FieldName = 'Arredondar'
    end
    object TabTarifasPorHora: TStringField
      DisplayWidth = 100
      FieldKind = fkCalculated
      FieldName = 'TarifasPorHora'
      Size = 100
      Calculated = True
    end
    object TabSemValorMin: TBooleanField
      FieldName = 'SemValorMin'
    end
  end
  object DS: TDataSource
    DataSet = Tab
    Left = 88
    Top = 112
  end
end
