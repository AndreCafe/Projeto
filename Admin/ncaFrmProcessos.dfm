object FrmProcessos: TFrmProcessos
  Left = 0
  Top = 0
  Caption = 'Lista de Processos'
  ClientHeight = 514
  ClientWidth = 685
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TcxGrid
    Left = 0
    Top = 38
    Width = 685
    Height = 476
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = True
    object TV: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DS
      DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = TVExeName
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object TVExeName: TcxGridDBColumn
        Caption = 'Programa'
        DataBinding.FieldName = 'ExeName'
        SortIndex = 0
        SortOrder = soAscending
      end
      object TVProcessID: TcxGridDBColumn
        Caption = 'N.Processo'
        DataBinding.FieldName = 'ProcessID'
        Width = 93
      end
    end
    object GL: TcxGridLevel
      GridView = TV
    end
  end
  object Tab: TnxTable
    Database = Dados.db
    TableName = 'Processos'
    IndexName = 'ICliReq'
    Left = 192
    Top = 176
    object TabClienteID: TIntegerField
      FieldName = 'ClienteID'
      Visible = False
    end
    object TabRequest: TIntegerField
      FieldName = 'Request'
      Visible = False
    end
    object TabProcessID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'ProcessID'
    end
    object TabExeName: TStringField
      FieldName = 'ExeName'
      Size = 80
    end
  end
  object DS: TDataSource
    DataSet = Tab
    Left = 248
    Top = 176
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 392
    Top = 216
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dmImagens.im16
    ImageOptions.LargeImages = dmImagens.im32
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 320
    Top = 104
    DockControlHeights = (
      0
      0
      38
      0)
    object dxBarManager1Bar1: TdxBar
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
      FloatLeft = 711
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'lbMaq'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnAtualizar'
        end
        item
          Visible = True
          ItemName = 'btnFecharProc'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmObtendo'
        end
        item
          Visible = True
          ItemName = 'btnFechar'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRecentItems = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object btnFechar: TdxBarLargeButton
      Align = iaRight
      Caption = 'Sair'
      Category = 0
      Hint = 'Sair'
      Visible = ivAlways
      LargeImageIndex = 32
      OnClick = btnFecharClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object lbMaq: TdxBarStatic
      Caption = 'M'#225'q: 10'
      Category = 0
      Hint = 'M'#225'q: 10'
      Style = FrmPri.cxStyle11
      Visible = ivAlways
      Height = 36
    end
    object btnAtualizar: TdxBarLargeButton
      Caption = 'Atualizar'
      Category = 0
      Hint = 'Atualizar'
      Visible = ivAlways
      LargeImageIndex = 46
      OnClick = btnAtualizarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object btnFecharProc: TdxBarLargeButton
      Caption = '&Fechar Processo'
      Category = 0
      Hint = 'Fechar Processo'
      Visible = ivAlways
      LargeImageIndex = 33
      OnClick = btnFecharProcClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmObtendo: TdxBarStatic
      Caption = 'Obtendo lista de processos ...'
      Category = 0
      Hint = 'Obtendo lista de processos '
      Style = FrmPri.cxStyle11
      Visible = ivNever
    end
  end
end
