object FrmRA: TFrmRA
  Left = 180
  Top = 160
  Caption = 'Relat'#243'rio de Atendimento'
  ClientHeight = 502
  ClientWidth = 638
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
  object panBotoes: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 638
    Height = 34
    Align = alTop
    Bevel.BorderSides = [fsBottom]
    Bevel.Mode = bmEdge
    TabOrder = 0
    object btnOk: TBitBtn
      Left = 4
      Top = 4
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = btnOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnCancel: TBitBtn
      Left = 83
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 34
    Width = 638
    Height = 63
    Align = alTop
    Bevel.BorderSides = [fsBottom]
    Bevel.Mode = bmEdge
    TabOrder = 1
    object LMDSimpleLabel1: TLMDSimpleLabel
      Left = 10
      Top = 8
      Width = 38
      Height = 15
      Caption = 'T'#233'cnico'
      Options = []
    end
    object LMDSimpleLabel2: TLMDSimpleLabel
      Left = 114
      Top = 8
      Width = 35
      Height = 15
      Caption = 'Cliente'
      Options = []
    end
    object LMDSimpleLabel3: TLMDSimpleLabel
      Left = 433
      Top = 8
      Width = 55
      Height = 15
      Caption = 'Data Inicial'
      Options = []
    end
    object LMDSimpleLabel4: TLMDSimpleLabel
      Left = 536
      Top = 8
      Width = 50
      Height = 15
      Caption = 'Data Final'
      Options = []
    end
    object lbDataI: TLMDLabel
      Left = 432
      Top = 24
      Width = 87
      Height = 25
      Bevel.Mode = bmStandard
      Alignment = agCenterLeft
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Options = []
      ParentFont = False
      Caption = 'Data-I'
    end
    object lbDataF: TLMDLabel
      Left = 536
      Top = 24
      Width = 87
      Height = 25
      Bevel.Mode = bmStandard
      Alignment = agCenterLeft
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Options = []
      ParentFont = False
      Caption = 'Data-F'
    end
    object lbTec: TLMDLabel
      Left = 10
      Top = 24
      Width = 87
      Height = 25
      Bevel.Mode = bmStandard
      Alignment = agCenterLeft
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Options = []
      ParentFont = False
      Caption = 'Data-I'
    end
    object lbCli: TLMDLabel
      Left = 114
      Top = 24
      Width = 207
      Height = 25
      Bevel.Mode = bmStandard
      Alignment = agCenterLeft
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Options = []
      ParentFont = False
      Caption = 'Data-I'
    end
    object lbID: TLMDLabel
      Left = 344
      Top = 24
      Width = 72
      Height = 25
      Bevel.Mode = bmStandard
      Alignment = agCenter
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Options = []
      ParentFont = False
      Caption = 'ID'
    end
    object LMDSimpleLabel5: TLMDSimpleLabel
      Left = 345
      Top = 8
      Width = 13
      Height = 15
      Caption = 'ID'
      Options = []
    end
  end
  object Paginas: TcxPageControl
    Left = 0
    Top = 121
    Width = 638
    Height = 381
    ActivePage = tsItens
    Align = alClient
    TabOrder = 2
    ClientRectBottom = 381
    ClientRectRight = 638
    ClientRectTop = 24
    object tsOS: TcxTabSheet
      BorderWidth = 5
      Caption = 'OS'#39's'
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object gridOS: TcxGrid
        Left = 0
        Top = 0
        Width = 628
        Height = 347
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = True
        object tvOS: TcxGridDBTableView
          OnDblClick = GridOSDblClick
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsOS
          DataController.Filter.MaxValueListCount = 1000
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Filtering.ColumnPopup.MaxDropDownItemCount = 12
          OptionsSelection.CellSelect = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.GroupByBox = False
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          OptionsView.Indicator = True
          Preview.AutoHeight = False
          Preview.MaxLineCount = 2
          Styles.Content = cxStyle1
          Styles.Footer = cxStyle3
          Styles.Header = cxStyle2
          Styles.Indicator = cxStyle2
          Styles.Preview = cxStyle4
          object tvOSIncluir1: TcxGridDBColumn
            DataBinding.FieldName = 'Incluir'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.Alignment = taCenter
            Properties.NullStyle = nssUnchecked
            Properties.ReadOnly = False
            Properties.ValueChecked = 'True'
            Properties.ValueGrayed = ''
            Properties.ValueUnchecked = 'False'
            HeaderAlignmentHorz = taCenter
            MinWidth = 16
            Options.Filtering = False
            Width = 90
          end
          object tvOSData1: TcxGridDBColumn
            DataBinding.FieldName = 'Data'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.DateButtons = [btnClear, btnToday]
            Properties.DateOnError = deToday
            Properties.InputKind = ikRegExpr
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            SortIndex = 0
            SortOrder = soAscending
            Width = 106
          end
          object tvOSID1: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.MaxLength = 0
            Properties.ReadOnly = False
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Width = 94
          end
          object tvOSHoras1: TcxGridDBColumn
            DataBinding.FieldName = 'Horas'
            PropertiesClassName = 'TcxTimeEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.ReadOnly = False
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Width = 110
          end
        end
        object glOS: TcxGridLevel
          GridView = tvOS
        end
      end
    end
    object tsItens: TcxTabSheet
      BorderWidth = 5
      Caption = 'Despesas de Atendimento'
      object LMDSplitterPanel1: TLMDSplitterPanel
        Left = 0
        Top = 0
        Width = 628
        Height = 347
        Bevel.Mode = bmCustom
        Orientation = spHorzDown
        Align = alClient
        TabOrder = 0
        object LMDSplitterPane1: TLMDSplitterPane
          Bevel.Mode = bmStandard
          Bevel.StandardStyle = lsNone
          object gridItens: TcxGrid
            Left = 0
            Top = 0
            Width = 628
            Height = 347
            Align = alClient
            TabOrder = 0
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = True
            object tvItens: TcxGridDBBandedTableView
              OnDblClick = tvItensDblClick
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = dsItem
              DataController.Filter.MaxValueListCount = 1000
              DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              Filtering.ColumnPopup.MaxDropDownItemCount = 12
              OptionsSelection.CellSelect = False
              OptionsSelection.HideFocusRectOnExit = False
              OptionsSelection.UnselectFocusedRecordOnExit = False
              OptionsView.GroupByBox = False
              OptionsView.GroupFooters = gfVisibleWhenExpanded
              OptionsView.Indicator = True
              OptionsView.BandHeaders = False
              Preview.Column = tvItensDescr
              Preview.MaxLineCount = 2
              Preview.Visible = True
              Styles.Content = cxStyle5
              Styles.Footer = cxStyle7
              Styles.Header = cxStyle6
              Styles.Indicator = cxStyle6
              Styles.Preview = cxStyle8
              Styles.BandHeader = cxStyle9
              Bands = <
                item
                  Caption = 'Use o duplo clique para incluir ou remover itens desse RA'
                  HeaderAlignmentHorz = taLeftJustify
                end>
              object tvItensTipo1: TcxGridDBBandedColumn
                DataBinding.FieldName = 'Tipo'
                RepositoryItem = DM.repEditTipoDesp
                HeaderAlignmentVert = vaCenter
                MinWidth = 16
                Options.Editing = False
                Width = 168
                Position.BandIndex = 0
                Position.ColIndex = 3
                Position.RowIndex = 0
              end
              object tvItensValor1: TcxGridDBBandedColumn
                Caption = 'Valor/Qtd'
                DataBinding.FieldName = 'Valor'
                PropertiesClassName = 'TcxCurrencyEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.AssignedValues.MaxValue = True
                Properties.AssignedValues.MinValue = True
                Properties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
                Properties.Nullable = False
                Properties.ReadOnly = False
                OnGetDisplayText = tvItensValor1GetDisplayText
                HeaderAlignmentHorz = taCenter
                Options.Editing = False
                Width = 116
                Position.BandIndex = 0
                Position.ColIndex = 4
                Position.RowIndex = 0
              end
              object tvItensIncluir: TcxGridDBBandedColumn
                DataBinding.FieldName = 'Incluir'
                PropertiesClassName = 'TcxCheckBoxProperties'
                Properties.ImmediatePost = True
                Properties.NullStyle = nssUnchecked
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Filtering = False
                Width = 80
                Position.BandIndex = 0
                Position.ColIndex = 0
                Position.RowIndex = 0
              end
              object tvItensDescr: TcxGridDBBandedColumn
                DataBinding.FieldName = 'Descr'
                PropertiesClassName = 'TcxMemoProperties'
                Options.Editing = False
                Position.BandIndex = 0
                Position.ColIndex = 5
                Position.RowIndex = 0
              end
              object tvItensID: TcxGridDBBandedColumn
                DataBinding.FieldName = 'ID'
                PropertiesClassName = 'TcxMaskEditProperties'
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                Options.Editing = False
                Width = 69
                Position.BandIndex = 0
                Position.ColIndex = 2
                Position.RowIndex = 0
              end
              object tvItensData: TcxGridDBBandedColumn
                DataBinding.FieldName = 'Data'
                PropertiesClassName = 'TcxDateEditProperties'
                Properties.Alignment.Horz = taCenter
                Properties.Alignment.Vert = taVCenter
                Properties.SaveTime = False
                Properties.ShowTime = False
                HeaderAlignmentHorz = taCenter
                HeaderAlignmentVert = vaCenter
                SortIndex = 0
                SortOrder = soAscending
                Width = 93
                Position.BandIndex = 0
                Position.ColIndex = 1
                Position.RowIndex = 0
              end
            end
            object glItens: TcxGridLevel
              GridView = tvItens
            end
          end
        end
      end
    end
  end
  object cxLabel1: TcxLabel
    Left = 0
    Top = 97
    Align = alTop
    AutoSize = False
    Caption = 
      '  Use o duplo-clique para incluir/remover OS'#39's e Despesas desse ' +
      'relat'#243'rio'
    Properties.Alignment.Vert = taVCenter
    Height = 24
    Width = 638
  end
  object mtOS: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Sync'
        DataType = ftBoolean
      end
      item
        Name = 'Tecnico'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'DataI'
        DataType = ftDate
      end
      item
        Name = 'DataF'
        DataType = ftDate
      end
      item
        Name = 'DataOS'
        DataType = ftDateTime
      end
      item
        Name = 'IDOS'
        DataType = ftInteger
      end
      item
        Name = 'LogID'
        DataType = ftInteger
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
    Left = 40
    Top = 296
    object mtOSIncluir: TBooleanField
      FieldName = 'Incluir'
    end
    object mtOSData: TDateField
      FieldName = 'Data'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object mtOSID: TIntegerField
      FieldName = 'ID'
    end
    object mtOSHoras: TTimeField
      FieldName = 'Horas'
    end
  end
  object dsOS: TDataSource
    DataSet = mtOS
    Left = 72
    Top = 296
  end
  object mtItem: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Sync'
        DataType = ftBoolean
      end
      item
        Name = 'Tecnico'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'DataI'
        DataType = ftDate
      end
      item
        Name = 'DataF'
        DataType = ftDate
      end
      item
        Name = 'Item'
        DataType = ftWord
      end
      item
        Name = 'Tipo'
        DataType = ftWord
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'Descr'
        DataType = ftMemo
      end
      item
        Name = 'NumF'
        DataType = ftInteger
      end
      item
        Name = 'ValorDef'
        DataType = ftCurrency
      end
      item
        Name = 'ValorApr'
        DataType = ftCurrency
      end
      item
        Name = 'ValorCli'
        DataType = ftCurrency
      end
      item
        Name = 'ValorTec'
        DataType = ftCurrency
      end
      item
        Name = 'StatusTec'
        DataType = ftWord
      end
      item
        Name = 'LogID'
        DataType = ftInteger
      end
      item
        Name = 'StatusCli'
        DataType = ftWord
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
    Left = 40
    Top = 264
    object mtItemTipo: TWordField
      Alignment = taLeftJustify
      FieldName = 'Tipo'
    end
    object mtItemValor: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Valor'
    end
    object mtItemDescr: TMemoField
      FieldName = 'Descr'
      BlobType = ftMemo
    end
    object mtItemData: TDateField
      FieldName = 'Data'
    end
    object mtItemIncluir: TBooleanField
      FieldName = 'Incluir'
    end
    object mtItemID: TIntegerField
      FieldName = 'ID'
    end
  end
  object dsItem: TDataSource
    DataSet = mtItem
    Left = 72
    Top = 264
  end
  object cxStyleRepository1: TcxStyleRepository
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
  end
  object cxStyleRepository2: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle9: TcxStyle
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
