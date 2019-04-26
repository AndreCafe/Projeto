object FrmPopUpEditBase: TFrmPopUpEditBase
  Left = 300
  Top = 420
  ClientHeight = 385
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poDesigned
  OnCreate = FrmBasePaiCreate
  OnDestroy = FrmBasePaiDestroy
  CacheInstance = True
  Modal = False
  PixelsPerInch = 96
  TextHeight = 13
  object panPri: TParentedPanel
    Left = 0
    Top = 0
    Width = 438
    Height = 385
    Align = alClient
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 5
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
    object pageControlEditar: TcxPageControl
      Left = 5
      Top = 40
      Width = 428
      Height = 340
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = tsEdit
      Properties.CustomButtons.Buttons = <>
      Properties.HideTabs = True
      Properties.Style = 3
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      OnChange = pageControlEditarChange
      ClientRectBottom = 340
      ClientRectRight = 428
      ClientRectTop = 0
      object tsGrid: TcxTabSheet
        Caption = 'tsGrid'
        ImageIndex = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Grid: TcxGrid
          Left = 0
          Top = 0
          Width = 428
          Height = 340
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BevelKind = bkSoft
          TabOrder = 0
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
          object TV: TcxGridDBTableView
            OnDblClick = TVDblClick
            OnKeyUp = TVKeyUp
            Navigator.Buttons.CustomButtons = <>
            Navigator.Buttons.Insert.Visible = True
            Navigator.Buttons.Append.Visible = False
            Navigator.Buttons.Delete.Visible = True
            Navigator.Buttons.Edit.Visible = False
            Navigator.Buttons.Post.Visible = False
            Navigator.Buttons.Cancel.Visible = False
            Navigator.Buttons.SaveBookmark.Visible = False
            Navigator.Buttons.GotoBookmark.Visible = False
            Navigator.Buttons.Filter.Visible = False
            DataController.DataModeController.GridMode = True
            DataController.DataSource = dsValores
            DataController.Filter.MaxValueListCount = 1000
            DataController.Filter.Options = [fcoCaseInsensitive]
            DataController.Filter.Active = True
            DataController.Filter.AutoDataSetFilter = True
            DataController.Filter.SupportedLike = False
            DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <
              item
                Links = <>
                SummaryItems.Separator = ', '
                SummaryItems = <
                  item
                    Kind = skCount
                  end>
              end>
            Filtering.ColumnPopup.MaxDropDownItemCount = 12
            OptionsBehavior.CopyCaptionsToClipboard = False
            OptionsBehavior.CopyRecordsToClipboard = False
            OptionsBehavior.ImmediateEditor = False
            OptionsBehavior.ColumnHeaderHints = False
            OptionsBehavior.CopyPreviewToClipboard = False
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnHidingOnGrouping = False
            OptionsCustomize.ColumnHorzSizing = False
            OptionsCustomize.ColumnMoving = False
            OptionsCustomize.ColumnSorting = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsSelection.InvertSelect = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GridLines = glNone
            OptionsView.GroupByBox = False
            OptionsView.GroupFooters = gfVisibleWhenExpanded
            OptionsView.Header = False
            Preview.AutoHeight = False
            Styles.Selection = FrmPri.cxStyle30
            object TVDescricao: TcxGridDBColumn
              DataBinding.FieldName = 'Descricao'
            end
          end
          object TVFor: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataModeController.GridMode = True
            DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.NoDataToDisplayInfoText = '<Ainda n'#227'o foi cadastrado nenhum fornecedor>'
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            OptionsView.Header = False
            object TVForNome: TcxGridDBColumn
              DataBinding.FieldName = 'Nome'
            end
          end
          object GL: TcxGridLevel
            GridView = TV
          end
        end
      end
      object tsEdit: TcxTabSheet
        Caption = 'tsEdit'
        ImageIndex = 1
        object panEdit: TLMDSimplePanel
          Left = 0
          Top = 0
          Width = 428
          Height = 177
          Align = alTop
          Bevel.Mode = bmCustom
          Bevel.StandardStyle = lsNone
          Color = clWhite
          TabOrder = 0
          DesignSize = (
            428
            177)
          object butOk: TcxButton
            Left = 16
            Top = 136
            Width = 75
            Height = 25
            Anchors = [akLeft, akBottom]
            Caption = '&Salvar'
            TabOrder = 0
            OnClick = butOkClick
          end
          object buCancel: TcxButton
            Left = 97
            Top = 136
            Width = 75
            Height = 25
            Anchors = [akLeft, akBottom]
            Caption = '&Cancel'
            TabOrder = 1
            OnClick = buCancelClick
          end
        end
      end
    end
    object dxBarDockControl1: TdxBarDockControl
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 428
      Height = 30
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      Align = dalTop
      BarManager = BarMgr
      Color = clBtnFace
      ParentColor = False
      SunkenBorder = False
      UseOwnColor = True
      UseOwnSunkenBorder = True
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 544
    Top = 408
  end
  object BarMgr: TdxBarManager
    AllowCallFromAnotherForm = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dmImagens.im16
    ImageOptions.LargeImages = dmImagens.im24
    ImageOptions.UseLargeImagesForLargeIcons = True
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 120
    Top = 232
    DockControlHeights = (
      0
      0
      0
      0)
    object BarMgrBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'BarraComum'
      CaptionButtons = <>
      Color = clWhite
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 276
      FloatTop = 216
      FloatClientWidth = 75
      FloatClientHeight = 90
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
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'BarraTabSheet'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object cmNovo: TdxBarLargeButton
      Caption = '&Novo'
      Category = 0
      Hint = 'Novo'
      Visible = ivAlways
      LargeImageIndex = 6
      OnClick = cmNovoClick
      GlyphLayout = glLeft
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmEditar: TdxBarLargeButton
      Caption = '&Editar'
      Category = 0
      Hint = 'Editar'
      Visible = ivAlways
      LargeImageIndex = 2
      OnClick = cmEditarClick
      GlyphLayout = glLeft
      SyncImageIndex = False
      ImageIndex = 20
    end
    object cmApagar: TdxBarLargeButton
      Caption = '&Apagar'
      Category = 0
      Hint = 'Apagar'
      Visible = ivAlways
      LargeImageIndex = 7
      OnClick = cmApagarClick
      GlyphLayout = glLeft
      SyncImageIndex = False
      ImageIndex = 12
    end
    object cmAtualizar: TdxBarLargeButton
      Caption = 'A&tualizar'
      Category = 0
      Hint = 'Atualizar'
      Visible = ivNever
      LargeImageIndex = 46
      PaintStyle = psCaptionGlyph
      AutoGrayScale = False
    end
    object cmHoje: TdxBarButton
      Caption = '&Hoje'
      Category = 0
      Hint = 'Hoje'
      Visible = ivAlways
    end
    object cmEstaSemana: TdxBarButton
      Caption = 'Esta Semana'
      Category = 0
      Hint = 'Esta Semana'
      Visible = ivAlways
    end
    object cmEsteMes: TdxBarButton
      Caption = 'Este M'#234's'
      Category = 0
      Hint = 'Este M'#234's'
      Visible = ivAlways
    end
    object cmEsteAno: TdxBarButton
      Caption = 'Este Ano'
      Category = 0
      Hint = 'Este Ano'
      Visible = ivAlways
    end
    object cmTudo: TdxBarButton
      Caption = 'Tudo'
      Category = 0
      Hint = 'Tudo'
      Visible = ivAlways
    end
    object cmDigitarPeriodo: TdxBarButton
      Caption = 'Digitar Per'#237'odo'
      Category = 0
      Hint = 'Digitar Per'#237'odo'
      Visible = ivAlways
    end
    object cmLayCustomize: TdxBarButton
      Caption = '&Adicionar/Remover Colunas'
      Category = 0
      Hint = 'Adicionar/Remover Colunas'
      Visible = ivAlways
      ImageIndex = 21
    end
    object cmLaySalvar: TdxBarButton
      Caption = '&Salvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      ImageIndex = 7
    end
    object cmLayRestaurar: TdxBarButton
      Caption = '&Restaurar layout padr'#227'o'
      Category = 0
      Hint = 'Restaurar layout padr'#227'o'
      Visible = ivAlways
      ImageIndex = 33
    end
    object cmExportar: TdxBarLargeButton
      Caption = '&Exportar'
      Category = 0
      Hint = 'Exportar'
      Visible = ivNever
      LargeImageIndex = 47
      AutoGrayScale = False
    end
    object cmImprimir: TdxBarLargeButton
      Caption = '&Imprimir'
      Category = 0
      Hint = 'Imprimir'
      Visible = ivNever
      LargeImageIndex = 7
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 22
    end
    object cmLayout: TdxBarLargeButton
      Align = iaRight
      Caption = 'La&yout'
      Category = 0
      Hint = 'Layout'
      Visible = ivAlways
      LargeImageIndex = 54
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmPeriodo: TdxBarLargeButton
      Caption = 'Per'#237'odo'
      Category = 0
      Hint = 'Per'#237'odo'
      Visible = ivAlways
      LargeImageIndex = 58
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmUltimas24h: TdxBarButton
      Caption = 'Ultimas 24h'
      Category = 0
      Hint = 'Ultimas 24h'
      Visible = ivAlways
    end
    object cmCfg: TdxBarLargeButton
      Caption = 'Op'#231#245'es'
      Category = 0
      Hint = 'Op'#231#245'es'
      Visible = ivAlways
      LargeImageIndex = 124
      AutoGrayScale = False
      GlyphLayout = glLeft
      ShowCaption = False
    end
    object cmOk: TdxBarLargeButton
      Caption = '&Ok'
      Category = 0
      Hint = 'Ok'
      Visible = ivAlways
      LargeImageIndex = 5
      GlyphLayout = glLeft
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      LargeImageIndex = 4
      GlyphLayout = glLeft
    end
    object container_panBusca: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
  end
  object Query: TnxQuery
    ActiveRuntime = True
    Database = Dados.db
    Timeout = 10000
    SQL.Strings = (
      'Select categoria'
      ' From produto')
    Left = 76
    Top = 234
  end
  object dsValores: TDataSource
    Left = 120
    Top = 280
  end
end
