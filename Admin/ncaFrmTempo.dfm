object FrmTempo: TFrmTempo
  Left = 0
  Top = 0
  BorderWidth = 3
  Caption = 'Adicionar Tempo'
  ClientHeight = 520
  ClientWidth = 566
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panCli: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 41
    Width = 566
    Height = 85
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Bevel.BorderInnerWidth = 1
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 0
  end
  object panTot: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 396
    Width = 566
    Height = 124
    Margins.Left = 0
    Margins.Top = 6
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alBottom
    Bevel.Mode = bmCustom
    TabOrder = 1
    ExplicitTop = 345
  end
  object cbRecibo: TcxCheckBox
    Left = 351
    Top = 6
    Caption = 'Emitir Recibo'
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 3
    Width = 85
  end
  object dxBarDockControl1: TdxBarDockControl
    Left = 0
    Top = 0
    Width = 566
    Height = 36
    Align = dalTop
    BarManager = BarMgr
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object panCentral: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 132
    Width = 566
    Height = 258
    Margins.Left = 0
    Margins.Top = 6
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Bevel.Mode = bmCustom
    TabOrder = 8
    ExplicitHeight = 207
    object panTempo: TLMDSimplePanel
      AlignWithMargins = True
      Left = 214
      Top = 0
      Width = 352
      Height = 258
      Margins.Left = 6
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alRight
      Bevel.BorderInnerWidth = 1
      Bevel.LightColor = clGray
      Bevel.Mode = bmEdge
      Bevel.StandardStyle = lsSingle
      TabOrder = 0
      ExplicitHeight = 207
      object panAtalhoTempo: TLMDSimplePanel
        Left = 3
        Top = 154
        Width = 334
        Height = 47
        Bevel.BorderSides = []
        Bevel.BorderInnerWidth = 1
        Bevel.Mode = bmEdge
        Bevel.StandardStyle = lsNone
        TabOrder = 0
        object lbT6: TcxLabel
          Tag = 180
          Left = 276
          Top = 1
          Cursor = crHandPoint
          Align = alLeft
          AutoSize = False
          Caption = '3h'
          ParentColor = False
          ParentFont = False
          Style.BorderColor = 11516864
          Style.BorderStyle = ebsSingle
          Style.Color = clBtnFace
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = True
          Style.LookAndFeel.NativeStyle = False
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.BorderStyle = ebsSingle
          StyleHot.Color = 16776176
          StyleHot.LookAndFeel.NativeStyle = False
          StyleHot.TextStyle = [fsBold]
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnClick = lbT1Click
          OnMouseUp = lbT1MouseUp
          Height = 45
          Width = 55
          AnchorX = 304
          AnchorY = 24
        end
        object lbT5: TcxLabel
          Tag = 120
          Left = 221
          Top = 1
          Cursor = crHandPoint
          Align = alLeft
          AutoSize = False
          Caption = '2h'
          ParentColor = False
          ParentFont = False
          Style.BorderColor = 11516864
          Style.BorderStyle = ebsSingle
          Style.Color = clBtnFace
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = True
          Style.LookAndFeel.NativeStyle = False
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.BorderStyle = ebsSingle
          StyleHot.Color = 16776176
          StyleHot.LookAndFeel.NativeStyle = False
          StyleHot.TextStyle = [fsBold]
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnClick = lbT1Click
          OnMouseUp = lbT1MouseUp
          Height = 45
          Width = 55
          AnchorX = 249
          AnchorY = 24
        end
        object lbT4: TcxLabel
          Tag = 60
          Left = 166
          Top = 1
          Cursor = crHandPoint
          Align = alLeft
          AutoSize = False
          Caption = '1h'
          ParentColor = False
          ParentFont = False
          Style.BorderColor = 11516864
          Style.BorderStyle = ebsSingle
          Style.Color = clBtnFace
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = True
          Style.LookAndFeel.NativeStyle = False
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.BorderStyle = ebsSingle
          StyleHot.Color = 16776176
          StyleHot.LookAndFeel.NativeStyle = False
          StyleHot.TextStyle = [fsBold]
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnClick = lbT1Click
          OnMouseUp = lbT1MouseUp
          Height = 45
          Width = 55
          AnchorX = 194
          AnchorY = 24
        end
        object lbT3: TcxLabel
          Tag = 30
          Left = 111
          Top = 1
          Cursor = crHandPoint
          Align = alLeft
          AutoSize = False
          Caption = '30m'
          ParentColor = False
          ParentFont = False
          Style.BorderColor = 11516864
          Style.BorderStyle = ebsSingle
          Style.Color = clBtnFace
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = True
          Style.LookAndFeel.NativeStyle = False
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.BorderStyle = ebsSingle
          StyleHot.Color = 16776176
          StyleHot.LookAndFeel.NativeStyle = False
          StyleHot.TextStyle = [fsBold]
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnClick = lbT1Click
          OnMouseUp = lbT1MouseUp
          Height = 45
          Width = 55
          AnchorX = 139
          AnchorY = 24
        end
        object lbT2: TcxLabel
          Tag = 15
          Left = 56
          Top = 1
          Cursor = crHandPoint
          Align = alLeft
          AutoSize = False
          Caption = '15m'
          ParentColor = False
          ParentFont = False
          Style.BorderColor = 11516864
          Style.BorderStyle = ebsSingle
          Style.Color = clBtnFace
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = True
          Style.LookAndFeel.NativeStyle = False
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.BorderStyle = ebsSingle
          StyleHot.Color = 16776176
          StyleHot.LookAndFeel.NativeStyle = False
          StyleHot.TextStyle = [fsBold]
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnClick = lbT1Click
          OnMouseUp = lbT1MouseUp
          Height = 45
          Width = 55
          AnchorX = 84
          AnchorY = 24
        end
        object lbT1: TcxLabel
          Tag = 10
          Left = 1
          Top = 1
          Cursor = crHandPoint
          Align = alLeft
          AutoSize = False
          Caption = '10m'
          ParentColor = False
          ParentFont = False
          Style.BorderColor = 11516864
          Style.BorderStyle = ebsSingle
          Style.Color = clBtnFace
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = True
          Style.LookAndFeel.NativeStyle = False
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.BorderStyle = ebsSingle
          StyleHot.Color = 16776176
          StyleHot.LookAndFeel.NativeStyle = False
          StyleHot.TextStyle = [fsBold]
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnClick = lbT1Click
          OnMouseUp = lbT1MouseUp
          Height = 45
          Width = 55
          AnchorX = 29
          AnchorY = 24
        end
      end
      object edTempo: TcxTimeEdit
        Left = 102
        Top = 64
        AutoSize = False
        EditValue = 0d
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.OnChange = edTempoPropertiesChange
        Properties.OnEditValueChanged = edTempoPropertiesEditValueChanged
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsFlat
        Style.Color = clWhite
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.HotTrack = True
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextStyle = [fsBold]
        Style.ButtonTransparency = ebtNone
        Style.IsFontAssigned = True
        StyleDisabled.BorderStyle = ebsSingle
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.Color = 16776176
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        OnEnter = edTempoEnter
        Height = 23
        Width = 119
      end
      object cxLabel9: TcxLabel
        Left = 6
        Top = 64
        Cursor = crHandPoint
        AutoSize = False
        Caption = '  &Tempo'
        FocusControl = edTempo
        Style.BorderColor = clSilver
        Style.BorderStyle = ebsSingle
        Style.HotTrack = True
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.BorderStyle = ebsSingle
        StyleHot.Color = 16776176
        StyleHot.LookAndFeel.NativeStyle = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        OnClick = cxLabel9Click
        Height = 23
        Width = 94
        AnchorY = 76
      end
      object cxLabel8: TcxLabel
        Left = 6
        Top = 35
        Cursor = crHandPoint
        AutoSize = False
        Caption = '  &Valor'
        FocusControl = edValor
        Style.BorderColor = clSilver
        Style.BorderStyle = ebsSingle
        Style.HotTrack = True
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.BorderStyle = ebsSingle
        StyleHot.Color = 16776176
        StyleHot.LookAndFeel.NativeStyle = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        OnClick = cxLabel8Click
        Height = 23
        Width = 94
        AnchorY = 47
      end
      object edValor: TcxCurrencyEdit
        Left = 102
        Top = 35
        AutoSize = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.AssignedValues.EditFormat = True
        Properties.UseThousandSeparator = True
        Properties.OnChange = edValorPropertiesChange
        Properties.OnEditValueChanged = edValorPropertiesEditValueChanged
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsFlat
        Style.Color = clWhite
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextStyle = [fsBold]
        Style.TransparentBorder = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.Color = 16776176
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.BorderStyle = ebsSingle
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        OnEnter = edValorEnter
        Height = 23
        Width = 119
      end
      object edTipoAcesso: TcxComboBox
        Left = 102
        Top = 6
        AutoSize = False
        Properties.DropDownListStyle = lsFixedList
        Properties.ImmediatePost = True
        Properties.ImmediateUpdateText = True
        Properties.Items.Strings = (
          'Todos')
        Properties.OnEditValueChanged = edTipoAcessoPropertiesEditValueChanged
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.ButtonStyle = btsHotFlat
        Style.ButtonTransparency = ebtNone
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.TextColor = clBtnText
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        Height = 23
        Width = 119
      end
      object lbTempo: TcxLabel
        Left = 223
        Top = 6
        AutoSize = False
        ParentColor = False
        ParentFont = False
        Style.BorderColor = clGray
        Style.BorderStyle = ebsFlat
        Style.Color = clWindow
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clNavy
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        Properties.Alignment.Vert = taVCenter
        Visible = False
        Height = 23
        Width = 119
        AnchorY = 18
      end
      object lbTipoAcesso: TcxLabel
        Left = 6
        Top = 6
        Cursor = crHandPoint
        AutoSize = False
        Caption = '  Grupo de Tarifas'
        FocusControl = edTipoAcesso
        ParentFont = False
        Style.BorderColor = clSilver
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.HotTrack = True
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.BorderStyle = ebsSingle
        StyleHot.Color = 16776176
        StyleHot.LookAndFeel.NativeStyle = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        OnClick = lbTipoAcessoClick
        Height = 23
        Width = 94
        AnchorY = 18
      end
      object lbSenha: TcxLabel
        Left = 6
        Top = 93
        Cursor = crHandPoint
        AutoSize = False
        Caption = '  Senha do Cart'#227'o'
        FocusControl = edTempo
        Style.BorderColor = clSilver
        Style.BorderStyle = ebsSingle
        Style.HotTrack = True
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.BorderStyle = ebsSingle
        StyleHot.Color = 16776176
        StyleHot.LookAndFeel.NativeStyle = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Visible = False
        OnClick = cxLabel9Click
        Height = 23
        Width = 94
        AnchorY = 105
      end
      object edSenha: TcxTextEdit
        Left = 101
        Top = 94
        Properties.CharCase = ecUpperCase
        Properties.OnChange = edSenhaPropertiesChange
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clNavy
        Style.TextStyle = [fsBold]
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 9
        Visible = False
        Width = 149
      end
      object lbErroCartao: TcxLabel
        Left = 6
        Top = 122
        Cursor = crHandPoint
        AutoSize = False
        Caption = ' Esse cart'#227'o j'#225' foi vendido para outro cliente!'
        FocusControl = edTempo
        Style.BorderColor = clRed
        Style.BorderStyle = ebsSingle
        Style.HotTrack = True
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clRed
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.BorderStyle = ebsSingle
        StyleHot.Color = 16776176
        StyleHot.LookAndFeel.NativeStyle = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        Visible = False
        OnClick = cxLabel9Click
        Height = 23
        Width = 274
        AnchorY = 134
      end
    end
    object panTT: TLMDSimplePanel
      Left = 0
      Top = 0
      Width = 208
      Height = 258
      Align = alClient
      Bevel.Mode = bmCustom
      TabOrder = 1
      ExplicitHeight = 207
      object Grid: TcxGrid
        Left = 0
        Top = 0
        Width = 208
        Height = 258
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        ExplicitHeight = 207
        object TV: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          OnCanFocusRecord = TVCanFocusRecord
          OnCanSelectRecord = TVCanFocusRecord
          OnFocusedRecordChanged = TVFocusedRecordChanged
          DataController.DataModeController.GridMode = True
          DataController.DataSource = dsTipoTempo
          DataController.KeyFieldNames = 'Codigo'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsSelection.CellSelect = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.DataRowHeight = 20
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          OptionsView.Header = False
          Styles.Inactive = cxStyle3
          object TVDescr: TcxGridDBColumn
            Caption = 'Pr'#234'mio'
            DataBinding.FieldName = 'Descr'
            PropertiesClassName = 'TcxMaskEditProperties'
            OnCustomDrawCell = TVDescrCustomDrawCell
            OnGetDisplayText = TVDescrGetDisplayText
          end
          object TVPontos: TcxGridDBColumn
            DataBinding.FieldName = 'Pontos'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
          end
          object TVTipo: TcxGridDBColumn
            DataBinding.FieldName = 'Tipo'
            Visible = False
            VisibleForCustomization = False
          end
        end
        object GL: TcxGridLevel
          GridView = TV
        end
      end
    end
  end
  object tcxlist: TcxStyleRepository
    Left = 72
    Top = 152
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clHighlight
      TextColor = clWhite
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = 16768991
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor]
      Color = 16760767
    end
  end
  object tTipoTempo: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Descr'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Tipo'
        DataType = ftSmallint
      end
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Minutos'
        DataType = ftInteger
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'TipoAcesso'
        DataType = ftInteger
      end
      item
        Name = 'ID'
        DataType = ftAutoInc
      end
      item
        Name = 'Pontos'
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
    Left = 48
    Top = 104
    object tTipoTempoID: TAutoIncField
      FieldName = 'ID'
    end
    object tTipoTempoPontos: TIntegerField
      FieldName = 'Pontos'
    end
    object tTipoTempoDescr: TStringField
      FieldName = 'Descr'
      Size = 40
    end
    object tTipoTempoTipo: TSmallintField
      FieldName = 'Tipo'
    end
    object tTipoTempoCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tTipoTempoMinutos: TIntegerField
      FieldName = 'Minutos'
    end
    object tTipoTempoValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tTipoTempoTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
  end
  object dsTipoTempo: TDataSource
    DataSet = tTipoTempo
    Left = 80
    Top = 104
  end
  object tPass: TnxTable
    Database = Dados.db
    TableName = 'Passaporte'
    IndexName = 'ISenha'
    Left = 256
    Top = 64
    object tPassID: TAutoIncField
      FieldName = 'ID'
    end
    object tPassTipoPass: TIntegerField
      FieldName = 'TipoPass'
    end
    object tPassCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tPassExpirou: TBooleanField
      FieldName = 'Expirou'
    end
    object tPassSenha: TStringField
      FieldName = 'Senha'
    end
    object tPassPrimeiroUso: TDateTimeField
      FieldName = 'PrimeiroUso'
    end
    object tPassTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object tPassTipoExp: TWordField
      FieldName = 'TipoExp'
    end
    object tPassExpirarEm: TDateTimeField
      FieldName = 'ExpirarEm'
    end
    object tPassMaxSegundos: TIntegerField
      FieldName = 'MaxSegundos'
    end
    object tPassSegundos: TIntegerField
      FieldName = 'Segundos'
    end
    object tPassAcessos: TIntegerField
      FieldName = 'Acessos'
    end
    object tPassDia1: TIntegerField
      FieldName = 'Dia1'
    end
    object tPassDia2: TIntegerField
      FieldName = 'Dia2'
    end
    object tPassDia3: TIntegerField
      FieldName = 'Dia3'
    end
    object tPassDia4: TIntegerField
      FieldName = 'Dia4'
    end
    object tPassDia5: TIntegerField
      FieldName = 'Dia5'
    end
    object tPassDia6: TIntegerField
      FieldName = 'Dia6'
    end
    object tPassDia7: TIntegerField
      FieldName = 'Dia7'
    end
    object tPassTran: TIntegerField
      FieldName = 'Tran'
    end
    object tPassDataCompra: TDateTimeField
      FieldName = 'DataCompra'
    end
    object tPassValido: TBooleanField
      FieldName = 'Valido'
    end
    object tPassValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tPassSessao: TIntegerField
      FieldName = 'Sessao'
    end
  end
  object BarMgr: TdxBarManager
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
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    UseBarHintWindow = False
    UseSystemFont = True
    Left = 376
    Top = 144
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBarManager1Bar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 389
      FloatTop = 156
      FloatClientWidth = 51
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmMaq'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmSalvar'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end
        item
          Visible = True
          ItemName = 'dxBarControlContainerItem1'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object cmSalvar: TdxBarLargeButton
      Caption = '&Salvar'
      Category = 0
      Hint = 'Pressione CTRL+ENTER de qualquer lugar da tela para Salvar'
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = btnSalvarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      LargeImageIndex = 4
      OnClick = btnCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object dxBarControlContainerItem1: TdxBarControlContainerItem
      Align = iaRight
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = cbRecibo
    end
    object cmMaq: TdxBarStatic
      Caption = 'M'#225'q.  1'
      Category = 0
      Hint = 'M'#225'q.  1'
      Style = cxStyle2
      Visible = ivAlways
    end
  end
end
