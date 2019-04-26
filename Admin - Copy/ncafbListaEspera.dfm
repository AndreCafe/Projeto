inherited fbListaEspera: TfbListaEspera
  Caption = 'Lista de Espera'
  ClientHeight = 375
  ClientWidth = 395
  Font.Name = 'Verdana'
  ExplicitWidth = 403
  ExplicitHeight = 402
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TParentedPanel
    Width = 395
    Height = 375
    ExplicitWidth = 395
    ExplicitHeight = 375
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 395
      Height = 36
      ExplicitWidth = 395
      ExplicitHeight = 36
    end
    object Grid: TcxGrid
      Left = 0
      Top = 36
      Width = 395
      Height = 339
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      ExplicitTop = 32
      ExplicitHeight = 343
      object TV: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataModeController.GridMode = True
        DataController.DataSource = DS
        DataController.KeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.GroupByBox = False
        Preview.Column = TVObs
        Preview.Visible = True
        object TVPos: TcxGridDBColumn
          DataBinding.FieldName = 'Pos'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 34
          Width = 34
        end
        object TVNomeCliente: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'NomeCliente'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 151
        end
        object TVPrevMaq: TcxGridDBColumn
          Caption = 'Maq'
          DataBinding.FieldName = 'PrevMaq'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 34
          Width = 34
        end
        object TVPrevisao: TcxGridDBColumn
          Caption = 'Previs'#227'o'
          DataBinding.FieldName = 'Previsao'
          PropertiesClassName = 'TcxTimeEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.TimeFormat = tfHourMin
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 62
          Width = 62
        end
        object TVCartao: TcxGridDBColumn
          Caption = 'Cart'#227'o de Tempo'
          DataBinding.FieldName = 'Cartao'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentVert = vaCenter
          MinWidth = 50
          Width = 112
        end
        object TVObs: TcxGridDBColumn
          DataBinding.FieldName = 'Obs'
        end
        object TVUsername: TcxGridDBColumn
          DataBinding.FieldName = 'Username'
          Width = 118
        end
        object TVCod: TcxGridDBColumn
          Caption = 'C'#243'd.Cliente'
          DataBinding.FieldName = 'Cliente'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 74
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
  end
  inherited BarMgr: TdxBarManager
    ImageOptions.LargeImages = dmImagens.im24
    LookAndFeel.Kind = lfFlat
    Top = 96
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
          ItemName = 'cmEdit'
        end
        item
          Visible = True
          ItemName = 'cmRemover'
        end
        item
          Visible = True
          ItemName = 'cmUp'
        end
        item
          Visible = True
          ItemName = 'cmDown'
        end>
    end
    inherited cmNovo: TdxBarLargeButton
      LargeImageIndex = 6
      OnClick = btnAddClick
      AutoGrayScale = True
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    object cmEdit: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
      LargeImageIndex = 2
      OnClick = btnEditClick
      ShowCaption = False
    end
    object cmRemover: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
      LargeImageIndex = 7
      OnClick = btnApagaClick
      ShowCaption = False
    end
    object cmUp: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
      LargeImageIndex = 9
      OnClick = btnUPClick
      ShowCaption = False
    end
    object cmDown: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
      LargeImageIndex = 8
      OnClick = btnDownClick
      ShowCaption = False
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 8
    Top = 105
  end
  inherited pmLay: TdxBarPopupMenu
    Left = 256
    Top = 146
  end
  object Tab: TnxTable
    Database = Dados.db
    OnCalcFields = TabCalcFields
    TableName = 'Espera'
    IndexName = 'IPos'
    Left = 56
    Top = 216
    object TabPos: TIntegerField
      FieldName = 'Pos'
    end
    object TabCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object TabNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 50
    end
    object TabPrevisao: TDateTimeField
      FieldName = 'Previsao'
    end
    object TabPrevMaq: TWordField
      FieldName = 'PrevMaq'
    end
    object TabID: TAutoIncField
      FieldName = 'ID'
    end
    object TabDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object TabPrevSessao: TIntegerField
      FieldName = 'PrevSessao'
    end
    object TabCartao: TStringField
      FieldName = 'Cartao'
    end
    object TabTemCartao: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'TemCartao'
      Calculated = True
    end
    object TabObs: TStringField
      FieldName = 'Obs'
      Size = 50
    end
    object TabUsername: TStringField
      FieldKind = fkLookup
      FieldName = 'Username'
      LookupDataSet = Dados.tbCli
      LookupKeyFields = 'ID'
      LookupResultField = 'Username'
      KeyFields = 'Cliente'
      Size = 30
      Lookup = True
    end
  end
  object DS: TDataSource
    DataSet = Tab
    Left = 128
    Top = 192
  end
  object Timer1: TTimer
    Left = 120
    Top = 272
  end
end
