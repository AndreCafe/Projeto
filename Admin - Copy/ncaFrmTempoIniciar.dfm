object FrmTempoIniciar: TFrmTempoIniciar
  Left = 0
  Top = 0
  BorderWidth = 3
  Caption = 'Tempo iniciar sess'#227'o'
  ClientHeight = 439
  ClientWidth = 621
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
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LMDSimplePanel2: TLMDSimplePanel
    Left = 0
    Top = 85
    Width = 621
    Height = 5
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 0
    ExplicitTop = 81
  end
  object panTipo: TLMDSimplePanel
    Left = 0
    Top = 36
    Width = 621
    Height = 49
    Align = alTop
    Bevel.BorderInnerWidth = 1
    Bevel.Mode = bmEdge
    Bevel.StandardStyle = lsNone
    TabOrder = 1
    ExplicitTop = 32
    object cxLabel3: TcxLabel
      Left = 6
      Top = 10
      Caption = '&Cliente'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
    end
    object edCli: TcxPopupEdit
      Left = 45
      Top = 8
      Properties.HideSelection = False
      Properties.PopupAutoSize = False
      Properties.PopupControl = fbPesqCli.panPri
      Properties.PopupHeight = 300
      Properties.PopupMinWidth = 550
      Properties.PopupWidth = 550
      Properties.ReadOnly = True
      Properties.OnCloseUp = edCliPropertiesCloseUp
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonStyle = btsHotFlat
      Style.ButtonTransparency = ebtNone
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Width = 275
    end
    object lbMaq: TcxLabel
      Left = 560
      Top = 3
      Align = alRight
      AutoSize = False
      Caption = 'Maq: 5'
      ParentColor = False
      ParentFont = False
      Style.BorderColor = 11516864
      Style.BorderStyle = ebsSingle
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = True
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Height = 43
      Width = 58
      AnchorX = 589
      AnchorY = 25
    end
    object lbDeb: TcxLabel
      Left = 44
      Top = 29
      AutoSize = False
      Caption = 'D'#233'bito Atual = R$ 10,50'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clRed
      Style.IsFontAssigned = True
      Transparent = True
      Visible = False
      Height = 17
      Width = 138
    end
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
    Width = 621
    Height = 36
    Align = dalTop
    BarManager = BarMgr
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object panTempo: TLMDSimplePanel
    Left = 0
    Top = 90
    Width = 621
    Height = 349
    Align = alClient
    Bevel.Mode = bmCustom
    TabOrder = 8
    ExplicitTop = 86
    ExplicitHeight = 353
    object panTT: TLMDSimplePanel
      Left = 0
      Top = 0
      Width = 200
      Height = 268
      Align = alLeft
      Bevel.Mode = bmCustom
      TabOrder = 0
      ExplicitHeight = 272
      object Grid: TcxGrid
        Left = 0
        Top = 0
        Width = 195
        Height = 268
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        ExplicitHeight = 272
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
            Properties.Alignment.Vert = taVCenter
            OnCustomDrawCell = TVDescrCustomDrawCell
            OnGetDisplayText = TVDescrGetDisplayText
          end
          object TVPontos: TcxGridDBColumn
            DataBinding.FieldName = 'Pontos'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
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
      object LMDSimplePanel6: TLMDSimplePanel
        Left = 195
        Top = 0
        Width = 5
        Height = 268
        Align = alRight
        Bevel.Mode = bmCustom
        TabOrder = 1
        ExplicitHeight = 272
      end
    end
    object panDetalhes: TLMDSimplePanel
      Left = 200
      Top = 0
      Width = 421
      Height = 268
      Align = alClient
      Bevel.Mode = bmEdge
      Bevel.StandardStyle = lsNone
      TabOrder = 1
      ExplicitHeight = 272
      object LMDSimplePanel4: TLMDSimplePanel
        Left = 2
        Top = 2
        Width = 417
        Height = 194
        Align = alTop
        Bevel.BorderInnerWidth = 1
        Bevel.LightColor = clGray
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsNone
        TabOrder = 0
        object panAtalhoTempo: TLMDSimplePanel
          Left = 1
          Top = 156
          Width = 415
          Height = 37
          Align = alBottom
          Bevel.BorderSides = []
          Bevel.BorderInnerWidth = 1
          Bevel.Mode = bmEdge
          Bevel.StandardStyle = lsNone
          TabOrder = 0
          object lbT6: TcxLabel
            Tag = 180
            Left = 231
            Top = 1
            Cursor = crHandPoint
            Align = alLeft
            AutoSize = False
            Caption = '3h'
            ParentColor = False
            Style.BorderColor = 11516864
            Style.BorderStyle = ebsSingle
            Style.Color = clBtnFace
            Style.HotTrack = True
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.BorderStyle = ebsSingle
            StyleHot.Color = 16776176
            StyleHot.LookAndFeel.NativeStyle = True
            StyleHot.TextStyle = [fsBold]
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            OnClick = lbT1Click
            OnMouseUp = lbT1MouseUp
            Height = 35
            Width = 46
            AnchorX = 254
            AnchorY = 19
          end
          object lbT5: TcxLabel
            Tag = 120
            Left = 185
            Top = 1
            Cursor = crHandPoint
            Align = alLeft
            AutoSize = False
            Caption = '2h'
            ParentColor = False
            Style.BorderColor = 11516864
            Style.BorderStyle = ebsSingle
            Style.Color = clBtnFace
            Style.HotTrack = True
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.BorderStyle = ebsSingle
            StyleHot.Color = 16776176
            StyleHot.LookAndFeel.NativeStyle = True
            StyleHot.TextStyle = [fsBold]
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            OnClick = lbT1Click
            OnMouseUp = lbT1MouseUp
            Height = 35
            Width = 46
            AnchorX = 208
            AnchorY = 19
          end
          object lbT4: TcxLabel
            Tag = 60
            Left = 139
            Top = 1
            Cursor = crHandPoint
            Align = alLeft
            AutoSize = False
            Caption = '1h'
            ParentColor = False
            Style.BorderColor = 11516864
            Style.BorderStyle = ebsSingle
            Style.Color = clBtnFace
            Style.HotTrack = True
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.BorderStyle = ebsSingle
            StyleHot.Color = 16776176
            StyleHot.LookAndFeel.NativeStyle = True
            StyleHot.TextStyle = [fsBold]
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            OnClick = lbT1Click
            OnMouseUp = lbT1MouseUp
            Height = 35
            Width = 46
            AnchorX = 162
            AnchorY = 19
          end
          object lbT3: TcxLabel
            Tag = 30
            Left = 93
            Top = 1
            Cursor = crHandPoint
            Align = alLeft
            AutoSize = False
            Caption = '30m'
            ParentColor = False
            Style.BorderColor = 11516864
            Style.BorderStyle = ebsSingle
            Style.Color = clBtnFace
            Style.HotTrack = True
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.BorderStyle = ebsSingle
            StyleHot.Color = 16776176
            StyleHot.LookAndFeel.NativeStyle = True
            StyleHot.TextStyle = [fsBold]
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            OnClick = lbT1Click
            OnMouseUp = lbT1MouseUp
            Height = 35
            Width = 46
            AnchorX = 116
            AnchorY = 19
          end
          object lbT2: TcxLabel
            Tag = 15
            Left = 47
            Top = 1
            Cursor = crHandPoint
            Align = alLeft
            AutoSize = False
            Caption = '15m'
            ParentColor = False
            Style.BorderColor = 11516864
            Style.BorderStyle = ebsSingle
            Style.Color = clBtnFace
            Style.HotTrack = True
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.BorderStyle = ebsSingle
            StyleHot.Color = 16776176
            StyleHot.LookAndFeel.NativeStyle = True
            StyleHot.TextStyle = [fsBold]
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            OnClick = lbT1Click
            OnMouseUp = lbT1MouseUp
            Height = 35
            Width = 46
            AnchorX = 70
            AnchorY = 19
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
            Style.BorderColor = 11516864
            Style.BorderStyle = ebsSingle
            Style.Color = clBtnFace
            Style.HotTrack = True
            Style.LookAndFeel.NativeStyle = True
            StyleDisabled.LookAndFeel.NativeStyle = True
            StyleFocused.LookAndFeel.NativeStyle = True
            StyleHot.BorderStyle = ebsSingle
            StyleHot.Color = 16776176
            StyleHot.LookAndFeel.NativeStyle = True
            StyleHot.TextStyle = [fsBold]
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            OnClick = lbT1Click
            OnMouseUp = lbT1MouseUp
            Height = 35
            Width = 46
            AnchorX = 24
            AnchorY = 19
          end
        end
        object edTempo: TcxTimeEdit
          Left = 102
          Top = 35
          AutoSize = False
          EditValue = 0d
          ParentFont = False
          Properties.Alignment.Vert = taVCenter
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
          Top = 35
          Cursor = crHandPoint
          AutoSize = False
          Caption = '  &Tempo'
          FocusControl = edTempo
          Style.BorderColor = clSilver
          Style.BorderStyle = ebsSingle
          Style.HotTrack = True
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.BorderStyle = ebsSingle
          StyleHot.Color = 16776176
          StyleHot.LookAndFeel.NativeStyle = True
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          OnClick = cxLabel9Click
          Height = 23
          Width = 94
          AnchorY = 47
        end
        object cxLabel8: TcxLabel
          Left = 6
          Top = 6
          Cursor = crHandPoint
          AutoSize = False
          Caption = '  &Valor'
          FocusControl = edValor
          Style.BorderColor = clSilver
          Style.BorderStyle = ebsSingle
          Style.HotTrack = True
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.BorderStyle = ebsSingle
          StyleHot.Color = 16776176
          StyleHot.LookAndFeel.NativeStyle = True
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          OnClick = cxLabel8Click
          Height = 23
          Width = 94
          AnchorY = 18
        end
        object edValor: TcxCurrencyEdit
          Left = 102
          Top = 6
          AutoSize = False
          EditValue = 0.000000000000000000
          ParentFont = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
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
        object lbSenha: TcxLabel
          Left = 6
          Top = 64
          Cursor = crHandPoint
          AutoSize = False
          Caption = '  Senha do Cart'#227'o'
          FocusControl = edTempo
          Style.BorderColor = clSilver
          Style.BorderStyle = ebsSingle
          Style.HotTrack = True
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.BorderStyle = ebsSingle
          StyleHot.Color = 16776176
          StyleHot.LookAndFeel.NativeStyle = True
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          Visible = False
          OnClick = cxLabel9Click
          Height = 23
          Width = 94
          AnchorY = 76
        end
        object edSenha: TcxTextEdit
          Left = 101
          Top = 65
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
          TabOrder = 7
          Visible = False
          Width = 149
        end
        object lbErroCartao: TcxLabel
          Left = 6
          Top = 93
          Cursor = crHandPoint
          AutoSize = False
          Caption = ' Esse cart'#227'o j'#225' foi vendido para outro cliente!'
          FocusControl = edTempo
          Style.BorderColor = clRed
          Style.BorderStyle = ebsSingle
          Style.HotTrack = True
          Style.LookAndFeel.NativeStyle = True
          Style.TextColor = clRed
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.BorderStyle = ebsSingle
          StyleHot.Color = 16776176
          StyleHot.LookAndFeel.NativeStyle = True
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          Transparent = True
          Visible = False
          OnClick = cxLabel9Click
          Height = 23
          Width = 274
          AnchorY = 105
        end
      end
    end
    object panTot: TLMDSimplePanel
      AlignWithMargins = True
      Left = 0
      Top = 274
      Width = 621
      Height = 75
      Margins.Left = 0
      Margins.Top = 6
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alBottom
      Bevel.BorderInnerWidth = 1
      Bevel.LightColor = 13948116
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      TabOrder = 2
      ExplicitTop = 278
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
    object tTipoTempoID: TAutoIncField
      FieldName = 'ID'
    end
    object tTipoTempoPontos: TIntegerField
      FieldName = 'Pontos'
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
      Hint = 'Salvar'
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
  end
end
