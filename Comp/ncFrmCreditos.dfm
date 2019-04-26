object FrmCreditos: TFrmCreditos
  Left = 0
  Top = 0
  BorderWidth = 5
  Caption = 'Cr'#233'ditos de tempo'
  ClientHeight = 353
  ClientWidth = 459
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object LMDSimplePanel5: TLMDSimplePanel
    Left = 0
    Top = 272
    Width = 459
    Height = 81
    Align = alBottom
    Bevel.Mode = bmEdge
    TabOrder = 0
    object LMDSimplePanel2: TLMDSimplePanel
      Left = 2
      Top = 2
      Width = 439
      Height = 77
      Align = alLeft
      Bevel.Mode = bmCustom
      TabOrder = 0
      object LMDSimplePanel7: TLMDSimplePanel
        Left = 0
        Top = 25
        Width = 439
        Height = 25
        Align = alTop
        Bevel.Mode = bmCustom
        ParentColor = True
        TabOrder = 0
        Transparent = True
        object cxLabel5: TcxLabel
          Left = 0
          Top = 0
          Align = alLeft
          Caption = 'Total v'#225'lido para uso nessa sess'#227'o'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Properties.Alignment.Vert = taVCenter
          AnchorY = 13
        end
        object lbValido: TcxLabel
          Left = 381
          Top = 0
          Align = alRight
          Caption = '1h9m'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clGreen
          Style.Font.Height = -19
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          AnchorX = 439
          AnchorY = 13
        end
      end
      object LMDSimplePanel6: TLMDSimplePanel
        Left = 0
        Top = 50
        Width = 439
        Height = 25
        Align = alTop
        Bevel.Mode = bmCustom
        ParentColor = True
        TabOrder = 1
        object cxLabel3: TcxLabel
          Left = 0
          Top = 0
          Align = alLeft
          Caption = 'Total com restri'#231#245'es que impedem uso nessa sess'#227'o'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Properties.Alignment.Vert = taVCenter
          AnchorY = 13
        end
        object lbInvalido: TcxLabel
          Left = 381
          Top = 0
          Align = alRight
          Caption = '1h9m'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clRed
          Style.Font.Height = -19
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          AnchorX = 439
          AnchorY = 13
        end
      end
      object LMDSimplePanel3: TLMDSimplePanel
        Left = 0
        Top = 0
        Width = 439
        Height = 25
        Align = alTop
        Bevel.Mode = bmCustom
        ParentColor = True
        TabOrder = 2
        object cxLabel2: TcxLabel
          Left = 0
          Top = 0
          Align = alLeft
          Caption = 'Total geral de cr'#233'ditos'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          Properties.Alignment.Vert = taVCenter
          AnchorY = 13
        end
        object lbTotal: TcxLabel
          Left = 381
          Top = 0
          Align = alRight
          Caption = '1h9m'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -19
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          AnchorX = 439
          AnchorY = 13
        end
      end
    end
  end
  object Grid: TcxGrid
    Left = 0
    Top = 31
    Width = 459
    Height = 229
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
    object TV: TcxGridDBBandedTableView
      OnDblClick = TVDblClick
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DS
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnHorzSizing = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsCustomize.BandMoving = False
      OptionsCustomize.BandSizing = False
      OptionsCustomize.ColumnVertSizing = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.ScrollBars = ssVertical
      OptionsView.GridLines = glNone
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.Selection = cxStyle7
      Bands = <
        item
          Caption = 'Detalhamento dos Cr'#233'ditos'
          Width = 438
        end>
      object TVTipo: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Tipo'
        OnCustomDrawCell = TVTipoCustomDrawCell
        MinWidth = 311
        Options.Editing = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.VertSizing = False
        Styles.Content = cxStyle3
        Width = 311
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object TVValido: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Invalido'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        OnCustomDrawCell = TVValidoCustomDrawCell
        HeaderAlignmentHorz = taRightJustify
        MinWidth = 127
        Options.Editing = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.VertSizing = False
        Styles.Content = cxStyle4
        Width = 127
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 2
      end
      object TVInvalido: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Valido'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        OnCustomDrawCell = TVInvalidoCustomDrawCell
        HeaderAlignmentHorz = taRightJustify
        MinWidth = 127
        Options.Editing = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.VertSizing = False
        Styles.Content = cxStyle6
        Width = 127
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 1
      end
      object TVTotal: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Total'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        OnCustomDrawCell = TVTipoCustomDrawCell
        HeaderAlignmentHorz = taRightJustify
        MinWidth = 127
        Options.Editing = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.VertSizing = False
        Styles.Content = cxStyle5
        Width = 127
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object VColumn1: TcxGridDBBandedColumn
        Caption = 'Descr.Validos'
        OnCustomDrawCell = TVTipoCustomDrawCell
        OnGetDisplayText = VColumn1GetDisplayText
        MinWidth = 311
        Options.Editing = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.VertSizing = False
        Width = 311
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 1
      end
      object VColumn2: TcxGridDBBandedColumn
        Caption = 'Descr.Invalidos'
        OnCustomDrawCell = TVTipoCustomDrawCell
        OnGetDisplayText = VColumn2GetDisplayText
        MinWidth = 311
        Options.Editing = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.VertSizing = False
        Width = 311
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 2
      end
    end
    object GL: TcxGridLevel
      GridView = TV
    end
  end
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 260
    Width = 459
    Height = 12
    Align = alBottom
    Bevel.Mode = bmCustom
    TabOrder = 2
  end
  object LMDSimplePanel4: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 459
    Height = 31
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 3
    object btnFechar: TcxButton
      Left = 0
      Top = 0
      Width = 75
      Height = 25
      Cancel = True
      Caption = '&Fechar'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnFecharClick
      LookAndFeel.Kind = lfFlat
    end
    object btnPass: TcxButton
      Left = 120
      Top = 0
      Width = 105
      Height = 25
      Caption = '&Editar Passaporte'
      TabOrder = 1
      Visible = False
      OnClick = btnPassClick
      LookAndFeel.Kind = lfFlat
    end
  end
  object MT: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Tipo'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Valido'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Invalido'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Total'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Restricoes'
        DataType = ftMemo
      end
      item
        Name = 'IDPass'
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
    Left = 152
    Top = 216
    object MTTipo: TStringField
      FieldName = 'Tipo'
      Size = 50
    end
    object MTValido: TStringField
      FieldName = 'Valido'
    end
    object MTInvalido: TStringField
      FieldName = 'Invalido'
    end
    object MTTotal: TStringField
      FieldName = 'Total'
    end
    object MTRestricoes: TMemoField
      FieldName = 'Restricoes'
      BlobType = ftMemo
    end
    object MTIDPass: TIntegerField
      FieldName = 'IDPass'
    end
  end
  object DS: TDataSource
    DataSet = MT
    OnDataChange = DSDataChange
    Left = 192
    Top = 216
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 248
    Top = 248
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clRed
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clGreen
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor]
      Color = 14155775
    end
  end
end
