object FrmEtapa: TFrmEtapa
  Left = 0
  Top = 0
  ActiveControl = edTempo
  BorderStyle = bsDialog
  Caption = 'Etapa de Tarifa'#231#227'o'
  ClientHeight = 384
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbEtapas: TcxGroupBox
    Left = 0
    Top = 150
    Align = alClient
    Caption = ' Sub-Etapas '
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 0
    Height = 188
    Width = 488
    object Panel2: TPanel
      Left = 2
      Top = 18
      Width = 484
      Height = 168
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 5
      TabOrder = 0
      object gridSim: TcxGrid
        Left = 267
        Top = 5
        Width = 212
        Height = 158
        Align = alRight
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = True
        object tvSim: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          FilterBox.CustomizeDialog = False
          DataController.DataSource = dsSim
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsSelection.CellSelect = False
          OptionsSelection.HideSelection = True
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          object tvSimTexto: TcxGridDBColumn
            Caption = 'Como ser'#225' a tarifa'#231#227'o:'
            DataBinding.FieldName = 'Texto'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
        end
        object glSim: TcxGridLevel
          GridView = tvSim
        end
      end
      object Panel3: TPanel
        Left = 258
        Top = 5
        Width = 9
        Height = 158
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
      end
      object gridFrac: TcxGrid
        Left = 5
        Top = 5
        Width = 253
        Height = 158
        Align = alClient
        TabOrder = 2
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = True
        object tvFrac: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          FilterBox.CustomizeDialog = False
          DataController.DataModeController.GridMode = True
          DataController.DataSource = dsFrac
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsSelection.CellSelect = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object tvFracValorFrac: TcxGridDBColumn
            DataBinding.FieldName = 'ValorFrac'
            Visible = False
          end
          object tvFracTexto: TcxGridDBColumn
            Caption = 'Dividir em sub-etapas de tarifa'#231#227'o ?'
            DataBinding.FieldName = 'Texto'
          end
        end
        object glFrac: TcxGridLevel
          GridView = tvFrac
        end
      end
    end
  end
  object gbTempoA: TcxGroupBox
    Left = 0
    Top = 44
    Align = alTop
    Caption = 'Etapa Anterior'
    Enabled = False
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 1
    Height = 53
    Width = 488
    object Label2: TLabel
      Left = 15
      Top = 24
      Width = 36
      Height = 13
      Caption = 'Tempo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edTempoA: TOvcPictureField
      Left = 57
      Top = 19
      Width = 76
      Height = 22
      Cursor = crIBeam
      DataType = pftTime
      CaretOvr.Shape = csBlock
      Controller = OvcController1
      ControlCharColor = clRed
      Ctl3D = False
      DecimalPlaces = 0
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      Epoch = 0
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      InitDateTime = False
      MaxLength = 8
      Options = [efoCaretToEnd]
      ParentCtl3D = False
      ParentFont = False
      PictureMask = 'hh:mm:ss'
      TabOrder = 0
      RangeHigh = {7F510100000000000000}
      RangeLow = {00000000000000000000}
    end
    object cxLabel1: TcxLabel
      Left = 139
      Top = 22
      Caption = 'Valor:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clGray
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object edValorA: TOvcNumericField
      Left = 176
      Top = 19
      Width = 102
      Height = 22
      Cursor = crIBeam
      DataType = nftDouble
      CaretOvr.Shape = csBlock
      Controller = OvcController1
      Ctl3D = False
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      Options = []
      ParentCtl3D = False
      ParentFont = False
      PictureMask = '###,###,###.##'
      TabOrder = 2
      RangeHigh = {73B2DBB9838916F2FE43}
      RangeLow = {73B2DBB9838916F2FEC3}
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 97
    Align = alTop
    Caption = 'Tempo X Valor'
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 2
    Height = 53
    Width = 488
    object Label1: TLabel
      Left = 15
      Top = 24
      Width = 36
      Height = 13
      Caption = 'Tempo:'
    end
    object edTempo: TOvcPictureField
      Left = 57
      Top = 19
      Width = 76
      Height = 22
      Cursor = crIBeam
      DataType = pftTime
      CaretOvr.Shape = csBlock
      Controller = OvcController1
      ControlCharColor = clRed
      Ctl3D = False
      DecimalPlaces = 0
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      Epoch = 0
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      InitDateTime = False
      MaxLength = 8
      Options = [efoCaretToEnd]
      ParentCtl3D = False
      ParentFont = False
      PictureMask = 'hh:mm:ss'
      TabOrder = 0
      OnChange = edTempoChange
      RangeHigh = {7F510100000000000000}
      RangeLow = {00000000000000000000}
    end
    object cxLabel3: TcxLabel
      Left = 139
      Top = 22
      Caption = 'Valor:'
    end
    object edValor: TOvcNumericField
      Left = 176
      Top = 19
      Width = 102
      Height = 22
      Cursor = crIBeam
      DataType = nftDouble
      CaretOvr.Shape = csBlock
      Controller = OvcController1
      Ctl3D = False
      EFColors.Disabled.BackColor = clWindow
      EFColors.Disabled.TextColor = clGrayText
      EFColors.Error.BackColor = clRed
      EFColors.Error.TextColor = clBlack
      EFColors.Highlight.BackColor = clHighlight
      EFColors.Highlight.TextColor = clHighlightText
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      Options = []
      ParentCtl3D = False
      ParentFont = False
      PictureMask = '###,###,###.##'
      TabOrder = 2
      OnChange = edValorChange
      RangeHigh = {00000000FC276BEE1C40}
      RangeLow = {00000000000000000000}
    end
  end
  object gbErro: TcxGroupBox
    Left = 0
    Top = 338
    Align = alBottom
    Caption = 'Aten'#231#227'o'
    ParentFont = False
    Style.BorderColor = clRed
    Style.BorderStyle = ebsThick
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = False
    Style.TextColor = clRed
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 7
    Visible = False
    Height = 46
    Width = 488
    object lbErro: TcxLabel
      Left = 2
      Top = 18
      Align = alClient
      Caption = 'O tempo tem que ser maior ou igual a 00:15:00'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
  end
  object BarMgr: TdxBarManager
    AllowReset = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dmImagens.Imagens
    ImageOptions.LargeImages = FrmPri.im32
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = True
    Left = 296
    Top = 312
    DockControlHeights = (
      0
      0
      44
      0)
    object BarMgrBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Controles'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 164
      FloatTop = 132
      FloatClientWidth = 23
      FloatClientHeight = 22
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmGravar'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end>
      MultiLine = True
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Controles'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object cmKardex: TdxBarButton
      Caption = '&Kardex'
      Category = 0
      Hint = 'Kardex'
      Visible = ivNever
      UnclickAfterDoing = False
    end
    object cmGravar: TdxBarLargeButton
      Caption = '&Salvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      LargeImageIndex = 41
      OnClick = cmGravarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      SyncImageIndex = False
      ImageIndex = 4
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      LargeImageIndex = 49
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
  end
  object mtSim: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Texto'
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 328
    Top = 112
    object mtSimTexto: TStringField
      FieldName = 'Texto'
      Size = 40
    end
  end
  object dsSim: TDataSource
    DataSet = mtSim
    Left = 360
    Top = 112
  end
  object OvcController1: TOvcController
    EntryCommands.TableList = (
      'Default'
      True
      ()
      'WordStar'
      False
      ()
      'Grid'
      False
      ())
    EntryOptions = [efoAutoAdvanceChar, efoAutoAdvanceLeftRight, efoAutoAdvanceUpDown, efoAutoSelect, efoBeepOnError, efoInsertPushes]
    Epoch = 2000
    Left = 264
    Top = 24
  end
  object mtFrac: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Texto'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ValorFrac'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    AfterScroll = mtFracAfterScroll
    Left = 40
    Top = 248
    object mtFracTexto: TStringField
      FieldName = 'Texto'
      Size = 50
    end
    object mtFracValorFrac: TCurrencyField
      FieldName = 'ValorFrac'
    end
  end
  object dsFrac: TDataSource
    DataSet = mtFrac
    Left = 72
    Top = 248
  end
end
