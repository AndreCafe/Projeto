inherited fbChatHist: TfbChatHist
  Caption = 'Hist'#243'rico de CHAT'
  ClientHeight = 504
  ClientWidth = 395
  OnClose = FrmBasePaiClose
  ExplicitWidth = 403
  ExplicitHeight = 531
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TParentedPanel
    Width = 395
    Height = 504
    ExplicitWidth = 395
    ExplicitHeight = 504
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 395
      Height = 44
      ExplicitWidth = 395
      ExplicitHeight = 44
    end
    object Grid: TcxGrid
      Left = 0
      Top = 44
      Width = 395
      Height = 460
      Align = alClient
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      ExplicitTop = 32
      ExplicitHeight = 472
      object TV: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsTab
        DataController.KeyFieldNames = 'ID'
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
        OptionsView.ColumnAutoWidth = True
        OptionsView.GridLineColor = 14737632
        OptionsView.Indicator = True
        Preview.Column = TVTexto
        Preview.MaxLineCount = 0
        Preview.Visible = True
        object TVID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          Visible = False
          VisibleForCustomization = False
        end
        object TVDataHora: TcxGridDBColumn
          Caption = 'Data/Hora'
          DataBinding.FieldName = 'DataHora'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.ImmediateDropDownWhenActivated = True
          Properties.ImmediateDropDownWhenKeyPressed = True
          Properties.ImmediatePost = True
          Width = 156
        end
        object TVDe: TcxGridDBColumn
          DataBinding.FieldName = 'De'
          OnGetDisplayText = TVDeGetDisplayText
          Width = 91
        end
        object TVPara: TcxGridDBColumn
          DataBinding.FieldName = 'Para'
          OnGetDisplayText = TVDeGetDisplayText
          Width = 113
        end
        object TVTexto: TcxGridDBColumn
          DataBinding.FieldName = 'Texto'
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
  end
  inherited BarMgr: TdxBarManager
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmExportar'
        end
        item
          Visible = True
          ItemName = 'cmImprimir'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton1'
        end>
      UseRestSpace = True
    end
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited cmExportar: TdxBarLargeButton
      LargeImageIndex = 41
    end
    inherited cmImprimir: TdxBarLargeButton
      LargeImageIndex = 7
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Align = iaRight
      Caption = 'Fechar'
      Category = 0
      Hint = 'Fechar'
      Visible = ivAlways
      LargeImageIndex = 45
      OnClick = dxBarLargeButton1Click
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
  end
  object Tab: TnxTable
    ActiveRuntime = True
    Database = Dados.db
    TableName = 'Chat'
    IndexName = 'IDataHora'
    Left = 288
    Top = 136
    object TabID: TAutoIncField
      FieldName = 'ID'
    end
    object TabDe: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'De'
    end
    object TabPara: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'Para'
    end
    object TabDataHora: TDateTimeField
      FieldName = 'DataHora'
      DisplayFormat = 'dd/mm/yyyy hh:mm:ss'
    end
    object TabTexto: TnxMemoField
      FieldName = 'Texto'
      BlobType = ftMemo
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 336
    Top = 144
  end
end
