inherited fbMaquinas: TfbMaquinas
  Left = 87
  Top = 150
  Caption = 'M'#225'quinas'
  ClientHeight = 442
  ClientWidth = 739
  OldCreateOrder = True
  OnCreate = FrmBasePaiCreate
  OnDestroy = FrmBasePaiDestroy
  ExplicitWidth = 747
  ExplicitHeight = 469
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 54
    Width = 739
    Height = 388
    ExplicitTop = 54
    ExplicitWidth = 739
    ExplicitHeight = 388
    object Image1: TImage
      Left = 216
      Top = 152
      Width = 105
      Height = 105
    end
    object Grid: TcxGrid
      Left = 0
      Top = 0
      Width = 739
      Height = 388
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = 16759773
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      object CV: TcxGridDBCardView
        DragMode = dmAutomatic
        OnDblClick = CVDblClick
        OnDragDrop = CVDragDrop
        OnDragOver = CVDragOver
        OnMouseUp = CVMouseUp
        OnStartDrag = CVStartDrag
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.Insert.Visible = False
        NavigatorButtons.Delete.Visible = False
        NavigatorButtons.Edit.Visible = False
        NavigatorButtons.Post.Visible = False
        NavigatorButtons.Cancel.Visible = False
        NavigatorButtons.Refresh.Visible = False
        NavigatorButtons.SaveBookmark.Visible = False
        NavigatorButtons.GotoBookmark.Visible = False
        NavigatorButtons.Filter.Visible = False
        OnCanSelectRecord = CVCanSelectRecord
        OnCustomDrawCell = CVCustomDrawCell
        OnFocusedRecordChanged = CVFocusedRecordChanged
        DataController.DataModeController.GridMode = True
        DataController.DataSource = Dados.dsMaquina
        DataController.KeyFieldNames = 'Numero'
        DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        LayoutDirection = ldVertical
        OptionsBehavior.DragFocusing = dfDragOver
        OptionsBehavior.ImmediateEditor = False
        OptionsBehavior.IncSearchItem = CVNumero
        OptionsBehavior.RowCaptionHints = False
        OptionsCustomize.RowFiltering = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.Navigator = True
        OptionsView.CardBorderWidth = 1
        OptionsView.CardWidth = 118
        OptionsView.SeparatorWidth = 1
        object CVNumero: TcxGridDBCardViewRow
          Caption = 'N'#250'mero'
          DataBinding.FieldName = 'Numero'
          PropertiesClassName = 'TcxTextEditProperties'
          OnCustomDrawCell = CVNumeroCustomDrawCell
          CaptionAlignmentHorz = taCenter
          CaptionAlignmentVert = vaCenter
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringMRUItemsList = False
          Options.Focusing = False
          Options.ShowCaption = False
          Position.BeginsLayer = True
          SortIndex = 0
          SortOrder = soAscending
        end
        object CVTempo: TcxGridDBCardViewRow
          Caption = 'Tempo'
          DataBinding.FieldName = 'InicioTicks'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = CVTempoGetDisplayText
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.ShowCaption = False
          Position.BeginsLayer = True
          Styles.Content = cxsPausa
        end
        object CVNomeCli: TcxGridDBCardViewRow
          DataBinding.FieldName = 'Nome'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = CVNomeCliGetDisplayText
          Options.Editing = False
          Options.Filtering = False
          Options.ShowCaption = False
          Position.BeginsLayer = True
          Styles.Content = cxsPequeno
        end
        object CVPrograma: TcxGridDBCardViewRow
          Caption = 'Programa Atual'
          DataBinding.FieldName = 'ProgramaAtual'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = CVProgramaGetDisplayText
          Options.Editing = False
          Options.Filtering = False
          Options.ShowCaption = False
          Position.BeginsLayer = True
          Styles.Content = cxsPequeno
        end
        object CVObs: TcxGridDBCardViewRow
          Caption = 'Obs'
          DataBinding.FieldName = 'ObsAcesso'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ReadOnly = False
          OnGetDisplayText = CVObsGetDisplayText
          Options.Editing = False
          Options.Filtering = False
          Options.ShowCaption = False
          Position.BeginsLayer = True
          Styles.Content = cxsPequeno
        end
        object CVNomeMaq: TcxGridDBCardViewRow
          DataBinding.FieldName = 'Nome'
          Visible = False
          Options.ShowCaption = False
          Position.BeginsLayer = False
        end
        object CVRodape: TcxGridDBCardViewRow
          Caption = 'Rodap'#233
          PropertiesClassName = 'TcxTextEditProperties'
          OnCustomDrawCell = CVRodapeCustomDrawCell
          Options.Editing = False
          Options.Filtering = False
          Options.ShowEditButtons = isebNever
          Options.Moving = False
          Options.ShowCaption = False
          Position.BeginsLayer = True
        end
      end
      object GL: TcxGridLevel
        GridView = CV
      end
    end
  end
  inherited BarMgr: TdxBarManager
    AutoDockColor = False
    Scaled = False
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = FrmPri.im32
    ImageOptions.MakeDisabledImagesFaded = True
    ImageOptions.UseLargeImagesForLargeIcons = True
    LookAndFeel.NativeStyle = True
    Style = bmsUseLookAndFeel
    Top = 115
    DockControlHeights = (
      0
      0
      54
      0)
    inherited BarMgrBar1: TdxBar
      BorderStyle = bbsNone
      ItemLinks = <
        item
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'cmLiberar'
        end
        item
          Visible = True
          ItemName = 'cmPausar'
        end
        item
          Visible = True
          ItemName = 'cmFinalizar'
        end
        item
          BeginGroup = True
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'cmVenderCred'
        end
        item
          Visible = True
          ItemName = 'cmVendaAcesso'
        end
        item
          Visible = True
          ItemName = 'cmEditar'
        end
        item
          BeginGroup = True
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'cmTransferir'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmVenda'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmCapturar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmLayout'
        end>
      UseRecentItems = False
      UseRestSpace = True
    end
    inherited cmNovo: TdxBarLargeButton
      Caption = '&Nova M'#225'quina'
      Hint = 'Nova M'#225'quina'
      OnClick = cmNovoClick
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      LargeImageIndex = 53
      OnClick = cmEditarClick
      GlyphLayout = glTop
      ShowCaption = True
      ImageIndex = -1
    end
    inherited cmApagar: TdxBarLargeButton
      Caption = '&Excluir M'#225'quina'
      Hint = 'Excluir M'#225'quina'
      OnClick = cmApagarClick
      ImageIndex = 12
    end
    inherited cmLayout: TdxBarLargeButton
      Align = iaLeft
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    object cmLiberar: TdxBarLargeButton
      Caption = '&Iniciar'
      Category = 0
      Hint = 'Iniciar um nova sess'#227'o'
      Visible = ivAlways
      LargeImageIndex = 3
      OnClick = cmLiberarClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmPausar: TdxBarLargeButton
      Caption = '&Pausar'
      Category = 0
      Hint = 'Pausar/Despausar sess'#227'o'
      Visible = ivAlways
      LargeImageIndex = 4
      OnClick = cmPausarClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmFinalizar: TdxBarLargeButton
      Caption = '&Finalizar'
      Category = 0
      Hint = 'Finalizar a sess'#227'o'
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = cmFinalizarClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmTransferir: TdxBarLargeButton
      Caption = '&Transferir'
      Category = 0
      Hint = 'Transferir'
      Visible = ivAlways
      LargeImageIndex = 26
      OnClick = cmTransferirClick
      AutoGrayScale = False
    end
    object cmCapturar: TdxBarLargeButton
      Caption = 'Capturar'
      Category = 0
      Hint = 'Capturar'
      Visible = ivAlways
      LargeImageIndex = 14
      OnClick = cmCapturarClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmVenda: TdxBarLargeButton
      Caption = 'Ve&nda Avulsa'
      Category = 0
      Hint = 'Venda Avulsa'
      Visible = ivAlways
      LargeImageIndex = 10
      OnClick = cmVendaClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmVenderCred: TdxBarLargeButton
      Caption = '&Tempo'
      Category = 0
      Hint = 'Adicionar Tempo (Pressione CTRL + Bot'#227'o Direito do Mouse)'
      Visible = ivAlways
      LargeImageIndex = 24
      OnClick = cmVenderCredClick
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmMaquinasDest: TdxBarListItem
      Caption = 'Transferir para'
      Category = 0
      Visible = ivAlways
      OnClick = cmMaquinasDestClick
      OnGetData = cmMaquinasDestGetData
      ShowNumbers = False
    end
    object cmDesligar: TdxBarLargeButton
      Caption = '&Desligar'
      Category = 0
      Hint = 'Desligar'
      Visible = ivAlways
      LargeImageIndex = 13
      AutoGrayScale = False
    end
    object cmVendaAcesso: TdxBarLargeButton
      Caption = '&Produto'
      Category = 0
      Hint = 'Adicionar Produto (Pressione ALT + Bot'#227'o Direito do Mouse)'
      Visible = ivAlways
      LargeImageIndex = 52
      OnClick = cmVendaAcessoClick
      AutoGrayScale = False
    end
    object dxBarButton1: TdxBarButton
      Caption = 'Mostrar Texto'
      Category = 0
      Hint = 'Mostrar Texto'
      Visible = ivAlways
    end
    object cmSubTransf: TdxBarSubItem
      Caption = '&H. Transferir'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmMaquinasDest'
        end>
    end
    object cmAddTempo: TdxBarButton
      Caption = '&A. Adicionar Tempo'
      Category = 0
      Hint = 'Adicionar Tempo (CTRL + BOT'#195'O direito do mouse)'
      Visible = ivAlways
      OnClick = cmVenderCredClick
    end
    object cmAddProduto: TdxBarButton
      Caption = '&B. Adicionar Produto'
      Category = 0
      Hint = 'Adicionar Produto (ALT + BOT'#195'O direito do mouse)'
      Visible = ivAlways
      OnClick = cmVendaAcessoClick
    end
    object cmPMIniciar: TdxBarButton
      Caption = '&D. Iniciar'
      Category = 0
      Hint = 'D. Iniciar'
      Visible = ivAlways
      OnClick = cmLiberarClick
    end
    object cmPMPausar: TdxBarButton
      Caption = 'Pausar'
      Category = 0
      Hint = 'Pa&usar'
      Visible = ivAlways
      OnClick = cmPausarClick
    end
    object cmPMFinalizar: TdxBarButton
      Caption = '&F. Finalizar'
      Category = 0
      Hint = 'F. Finalizar'
      Visible = ivAlways
      OnClick = cmFinalizarClick
    end
    object cmPMEditar: TdxBarButton
      Caption = '&G. Editar'
      Category = 0
      Hint = 'G. Editar'
      Visible = ivAlways
      OnClick = cmEditarClick
    end
    object cmVendaAvulsa: TdxBarButton
      Caption = 'Venda Avulsa'
      Category = 0
      Hint = 'Venda Avulsa'
      Visible = ivAlways
      OnClick = cmVendaClick
    end
    object cmPMDesligar: TdxBarButton
      Tag = 3
      Caption = '&J. Desligar'
      Category = 0
      Hint = 'J. Desligar'
      Visible = ivAlways
      OnClick = cmPMDesligarClick
    end
    object cmPMReiniciar: TdxBarButton
      Tag = 2
      Caption = '&L. Reiniciar'
      Category = 0
      Hint = 'L. Reiniciar'
      Visible = ivAlways
      OnClick = cmPMDesligarClick
    end
    object cmPMFecharGuard: TdxBarButton
      Tag = 1
      Caption = '&M. Desbloquear (Fechar NexGuard)'
      Category = 0
      Hint = 'M. Desbloquear (Fechar NexGuard)'
      Visible = ivAlways
      OnClick = cmPMDesligarClick
    end
    object cmDownload: TdxBarButton
      Caption = '&N. Permitir Download'
      Category = 0
      Hint = 'N. Permitir Download'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = cmDownloadClick
    end
    object cmProgUso: TdxBarButton
      Caption = '&O. Lista de Processos'
      Category = 0
      Hint = 'O. Lista de Processos'
      Visible = ivAlways
      OnClick = cmProgUsoClick
    end
    object cmEnviarChat: TdxBarButton
      Caption = '&P. Enviar mensagem (chat)'
      Category = 0
      Hint = 'P. Enviar mensagem (chat)'
      Visible = ivAlways
      OnClick = cmEnviarChatClick
    end
    object cmBloqSite: TdxBarButton
      Caption = '&Q. Bloquear Site'
      Category = 0
      Hint = 'Q. Bloquear Site'
      Visible = ivAlways
      OnClick = cmBloqSiteClick
    end
    object cmPMCapturar: TdxBarButton
      Caption = '&I. Capturar'
      Category = 0
      Hint = 'I. Capturar'
      Visible = ivAlways
      OnClick = cmCapturarClick
    end
    object cmAddImp: TdxBarButton
      Caption = '&C. Adicionar Impress'#227'o'
      Category = 0
      Hint = 'C. Adicionar Impress'#227'o'
      Visible = ivAlways
      OnClick = cmAddImpClick
    end
    object cmSuporteRem: TdxBarButton
      Caption = '&R. Assist'#234'ncia Remota'
      Category = 0
      Hint = 'R. Assist'#234'ncia Remota'
      Visible = ivAlways
      OnClick = cmSuporteRemClick
    end
    object cmPropMaq: TdxBarButton
      Caption = '&S. Propriedades da M'#225'quina'
      Category = 0
      Hint = 'S. Propriedades da M'#225'quina'
      Visible = ivAlways
      OnClick = cmPropMaqClick
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = '&E. Pausar'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmPMPausar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmPausarTodas'
        end
        item
          Visible = True
          ItemName = 'cmDespausarTodas'
        end>
    end
    object cmPausarTodas: TdxBarButton
      Caption = 'Pausar Todas M'#225'quinas'
      Category = 0
      Hint = 'Pausar Todas M'#225'quinas'
      Visible = ivAlways
      OnClick = cmPausarTodasClick
    end
    object cmDespausarTodas: TdxBarButton
      Caption = 'Despausar Todas M'#225'quinas'
      Category = 0
      Hint = 'Despausar Todas M'#225'quinas'
      Visible = ivAlways
      OnClick = cmDespausarTodasClick
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 8
    Top = 97
  end
  inherited pmLay: TdxBarPopupMenu
    ItemLinks = <
      item
        Visible = True
        ItemName = 'cmLayCustomize'
      end
      item
        Visible = True
        ItemName = 'cmLaySalvar'
      end
      item
        Visible = True
        ItemName = 'cmLayRestaurar'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmNovo'
      end
      item
        Visible = True
        ItemName = 'cmApagar'
      end>
    Left = 128
    Top = 178
  end
  inherited pmPeriodo: TdxBarPopupMenu
    Left = 32
    Top = 180
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 248
    Top = 115
  end
  object ActionList1: TActionList
    Left = 368
    Top = 113
  end
  object pmMaq: TdxBarPopupMenu
    BarManager = BarMgr
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ItemLinks = <
      item
        Visible = True
      end
      item
        Visible = True
        ItemName = 'cmAddTempo'
      end
      item
        Visible = True
        ItemName = 'cmAddProduto'
      end
      item
        Visible = True
        ItemName = 'cmAddImp'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmPMIniciar'
      end
      item
        Visible = True
        ItemName = 'dxBarSubItem1'
      end
      item
        Visible = True
        ItemName = 'cmPMFinalizar'
      end
      item
        Visible = True
        ItemName = 'cmPMEditar'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmSubTransf'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmPMCapturar'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmPMDesligar'
      end
      item
        Visible = True
        ItemName = 'cmPMReiniciar'
      end
      item
        Visible = True
        ItemName = 'cmPMFecharGuard'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmDownload'
      end
      item
        Visible = True
        ItemName = 'cmProgUso'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmEnviarChat'
      end
      item
        Visible = True
        ItemName = 'cmBloqSite'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmSuporteRem'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmPropMaq'
      end>
    UseOwnFont = True
    Left = 96
    Top = 179
  end
  object pmTransf: TdxBarPopupMenu
    BarManager = BarMgr
    ItemLinks = <
      item
        Visible = True
      end
      item
        Visible = True
        ItemName = 'cmMaquinasDest'
      end>
    UseOwnFont = False
    Left = 64
    Top = 179
  end
  object imGuard: TImageList
    Left = 120
    Top = 115
    Bitmap = {
      494C010104000600040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000049494900444343004947
      46004A484700494746004543420047454400464443004A484700494848004747
      4700000000000000000000000000000000000000000049494900444343004947
      46004A484700494746004543420047454400464443004A484700494848004747
      4700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000061616100D4D4D400CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D4D4
      D4006A6A6A0000000000000000000000000061616100D4D4D400CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D4D4
      D4006A6A6A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000067676700D8D8D800B6B5B400B8B5
      B100B7B4B000B9B6B200BAB7B300B2AFAB00585857005251500053535300D6D6
      D6006C6C6C0000000000000000000000000067676700D8D8D800B6B5B400B8B5
      B100B7B4B000B9B6B200BAB7B300B2AFAB00585857005251500053535300D6D6
      D6006C6C6C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000696A6B00A6AAAC00837E7B008581
      7E0085817F0084807D00827F7C0087838000837F7C0084817E0086817F00A3A7
      A7006A6B6D00000000000000000000000000696A6B00A6AAAC00837E7B008581
      7E0085817F0084807D00827F7C0087838000837F7C0084817E0086817F00A3A7
      A7006A6B6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000505050004C4C4C004C4C
      4C004C4C4C004C4C4C004C4C4C004C4C4C004C4C4C004C4C4C004C4C4C005050
      50000000000000000000000000000000000000000000505050004C4C4C004C4C
      4C004C4C4C004C4C4C004C4C4C004C4C4C004C4C4C004C4C4C004C4C4C005050
      5000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073737600CDCDD000CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CDCD
      D0006457560000000000000000000000000073737600CDCDD000CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CDCD
      D000645756000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000066666600CCCCCC00000080003F3F
      BA0000008000000080000000800000008000000080000C0CB30000008000CCCC
      CC006666660000000000000000000000000066666600CCCCCC00007B3D00007B
      3D00007B3D00007B3D00007B3D00007B3D00007B3D00007B3D00007B3D00CCCC
      CC00666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000066666600CCCCCC00000080001919
      FF009898FF001919FF001919FF001919FF009898FF001919FF0000008000CCCC
      CC006666660000000000000000000000000066666600CCCCCC00007B3D0000B2
      590000B2590083FB830000B2590000B2590000B2590000B25900007B3D00CCCC
      CC00666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000066666600CCCCCC00000080001919
      FF001919FF009898FF001919FF009898FF001919FF001919FF0000008000CCCC
      CC006666660000000000000000000000000066666600CCCCCC00007B3D0000B2
      590083FB830000B2590083FB830000B2590000B2590000B25900007B3D00CCCC
      CC00666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000066666600CCCCCC00000080001919
      FF001919FF001919FF009898FF001919FF001919FF001919FF0000008000CCCC
      CC006666660000000000000000000000000066666600CCCCCC00007B3D0083FB
      830000B2590000B2590000B2590083FB830000B2590000B25900007B3D00CCCC
      CC00666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000066666600CCCCCC00000080001919
      FF001919FF009898FF001919FF009898FF001919FF001919FF0000008000CCCC
      CC006666660000000000000000000000000066666600CCCCCC00007B3D0000B2
      590000B2590000B2590000B2590000B2590083FB830000B25900007B3D00CCCC
      CC00666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000066666600CCCCCC00000080001919
      FF009898FF001919FF001919FF001919FF009898FF001919FF0000008000CCCC
      CC006666660000000000000000000000000066666600CCCCCC00007B3D0000B2
      590000B2590000B2590000B2590000B2590000B2590083FB8300007B3D00CCCC
      CC00666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000066666600CCCCCC00000080003F3F
      BA0000008000000080000000800000008000000080000C0CB30000008000CCCC
      CC006666660000000000000000000000000066666600CCCCCC00007B3D00007B
      3D00007B3D00007B3D00007B3D00007B3D00007B3D00007B3D00007B3D00CCCC
      CC00666666000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B6B6B00D3CFCD00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D1D1
      D100615554000000000000000000000000006B6B6B00D3CFCD00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00D1D1
      D100615554000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000076767500666666006666
      6600666666006666660066666600666666006666660066666600666666007675
      7400000000000000000000000000000000000000000076767500666666006666
      6600666666006666660066666600666666006666660066666600666666007675
      7400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFF800F800FFFFFFFFF
      00070007F9E7000000070007F0C37FFE00070007F0C34002800F800FF9E74002
      00070007FFFF7FFE00070007F003000000070007EB6DEFF700070007DB6DEC17
      00070007C001EFF700070007DB6DE81700070007DB6DEFF700070007C001EFF7
      000700073FFFE007800F800FFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 152
    Top = 115
    PixelsPerInch = 96
    object cxsLivre: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clGreen
      TextColor = clWhite
    end
    object cxsPausa: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxsUsoPos: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clRed
      TextColor = clWhite
    end
    object cxsAguardaPagto: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clGreen
      TextColor = clWhite
    end
    object cxsManut: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11064319
      TextColor = clWhite
    end
    object cxsUsoPre: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxsPequeno: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer2Timer
    Left = 192
    Top = 200
  end
end
