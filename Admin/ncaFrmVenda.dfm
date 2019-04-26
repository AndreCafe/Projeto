object FrmVenda: TFrmVenda
  Left = 0
  Top = 0
  BorderWidth = 3
  Caption = 'FrmVenda'
  ClientHeight = 541
  ClientWidth = 662
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object panCli: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 41
    Width = 662
    Height = 75
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 0
  end
  object panTot: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 475
    Width = 662
    Height = 66
    Margins.Left = 0
    Margins.Top = 6
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alBottom
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 2
  end
  object panLista: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 122
    Width = 662
    Height = 347
    Margins.Left = 0
    Margins.Top = 6
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Bevel.Mode = bmEdge
    Color = clWhite
    TabOrder = 1
    object Grid: TcxGrid
      AlignWithMargins = True
      Left = 2
      Top = 87
      Width = 658
      Height = 236
      Margins.Left = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      BorderStyle = cxcbsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      TabStop = False
      OnEnter = GridEnter
      OnExit = GridExit
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      object TV: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Kind = skSum
            Column = TVTotal
          end
          item
            Kind = skSum
            Position = spFooter
            Column = TVTotal
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'R$ 0.00'
            Kind = skSum
            Column = TVTotal
          end>
        DataController.Summary.SummaryGroups = <>
        DataController.OnAfterDelete = TVDataControllerAfterDelete
        DataController.OnBeforeDelete = TVDataControllerBeforeDelete
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GridLines = glNone
        OptionsView.GroupByBox = False
        OptionsView.Header = False
        OnCustomDrawFooterCell = TVCustomDrawFooterCell
        object TVCodigo: TcxGridColumn
          Caption = 'C'#243'digo'
          PropertiesClassName = 'TcxMaskEditProperties'
          Visible = False
          VisibleForCustomization = False
          Width = 112
        end
        object TVDescr: TcxGridColumn
          Caption = 'Descri'#231#227'o'
          PropertiesClassName = 'TcxMaskEditProperties'
          Width = 260
        end
        object TVQuant: TcxGridColumn
          Caption = 'Quantidade'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taRightJustify
          OnGetDisplayText = TVQuantGetDisplayText
          HeaderAlignmentHorz = taCenter
          Width = 88
        end
        object TVvezes: TcxGridColumn
          Caption = 'X'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          OnGetDisplayText = TVvezesGetDisplayText
          HeaderAlignmentHorz = taCenter
          Styles.Content = FrmPri.cxStyle39
          Width = 20
        end
        object TVUnitario: TcxGridColumn
          Caption = '  Valor Unit'#225'rio'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Width = 125
        end
        object TVFidPontos: TcxGridColumn
          Caption = 'Pontos'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Visible = False
          HeaderAlignmentHorz = taCenter
          HeaderGlyphAlignmentHorz = taRightJustify
          Options.Editing = False
          Options.Focusing = False
          Width = 56
        end
        object TVIgual: TcxGridColumn
          Caption = '='
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          OnGetDisplayText = TVIgualGetDisplayText
          HeaderAlignmentHorz = taCenter
          Styles.Content = FrmPri.cxStyle39
          Width = 20
        end
        object TVTotal: TcxGridColumn
          Caption = 'Total'
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.DisplayFormat = 'R$ ,0.00;(R$ ,0.00)'
          FooterAlignmentHorz = taRightJustify
          HeaderAlignmentHorz = taRightJustify
          Width = 99
        end
        object TVFidPontosTotal: TcxGridColumn
          Caption = 'Total'
          DataBinding.ValueType = 'Float'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Visible = False
          HeaderAlignmentHorz = taRightJustify
          HeaderGlyphAlignmentHorz = taRightJustify
          Width = 47
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
    object panDivBuscaLista: TLMDSimplePanel
      Left = 2
      Top = 83
      Width = 658
      Height = 1
      Align = alTop
      Bevel.Mode = bmCustom
      TabOrder = 2
    end
    object panBuscaProd: TLMDSimplePanel
      Left = 2
      Top = 2
      Width = 658
      Height = 81
      Align = alTop
      Bevel.Mode = bmCustom
      ParentColor = True
      TabOrder = 0
      object panBuscaTop: TLMDSimplePanel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 658
        Height = 53
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Bevel.BorderSides = [fsBottom]
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsNone
        ParentColor = True
        TabOrder = 0
        object panProd: TLMDSimplePanel
          Left = 0
          Top = 0
          Width = 331
          Height = 53
          Align = alClient
          Bevel.Mode = bmCustom
          ParentColor = True
          TabOrder = 0
          object panRB: TLMDSimplePanel
            Left = 0
            Top = 0
            Width = 331
            Height = 24
            Align = alTop
            Bevel.Mode = bmCustom
            ParentColor = True
            TabOrder = 0
            object rgCodigo: TcxRadioButton
              AlignWithMargins = True
              Left = 6
              Top = 3
              Width = 75
              Height = 18
              Cursor = crHandPoint
              Margins.Left = 6
              Align = alLeft
              Caption = 'C'#243'digo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = rgCodigoClick
              LookAndFeel.Kind = lfFlat
              LookAndFeel.NativeStyle = False
            end
            object rgDescr: TcxRadioButton
              Left = 84
              Top = 0
              Width = 93
              Height = 24
              Cursor = crHandPoint
              Align = alLeft
              Caption = 'Descri'#231#227'o'
              Checked = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              TabStop = True
              OnClick = rgDescrClick
              LookAndFeel.Kind = lfFlat
              LookAndFeel.NativeStyle = False
            end
          end
          object pgProd: TcxPageControl
            Left = 0
            Top = 24
            Width = 331
            Height = 29
            Align = alClient
            TabOrder = 1
            TabStop = False
            Properties.ActivePage = tsDescr
            Properties.CustomButtons.Buttons = <>
            Properties.HideTabs = True
            LookAndFeel.NativeStyle = False
            ClientRectBottom = 29
            ClientRectRight = 331
            ClientRectTop = 0
            object tsBuscarCod: TcxTabSheet
              Caption = 'tsBuscarCod'
              ImageIndex = 0
              ExplicitWidth = 0
              ExplicitHeight = 0
              object edCod: TcxTextEdit
                AlignWithMargins = True
                Left = 6
                Top = 0
                Margins.Left = 6
                Margins.Top = 0
                Margins.Bottom = 0
                Align = alClient
                BeepOnEnter = False
                ParentFont = False
                Properties.OnChange = edCodPropertiesChange
                Properties.OnEditValueChanged = edCodPropertiesEditValueChanged
                Style.BorderColor = clSilver
                Style.BorderStyle = ebsSingle
                Style.LookAndFeel.NativeStyle = False
                Style.TextStyle = [fsBold]
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                TabOrder = 0
                OnKeyUp = edCodKeyUp
                Width = 322
              end
            end
            object tsDescr: TcxTabSheet
              Caption = 'tsDescr'
              ImageIndex = 1
              object edDescr: TcxLookupComboBox
                AlignWithMargins = True
                Left = 6
                Top = 0
                Margins.Left = 6
                Margins.Top = 0
                Margins.Bottom = 0
                Align = alClient
                BeepOnEnter = False
                ParentFont = False
                Properties.DropDownHeight = 300
                Properties.DropDownSizeable = True
                Properties.DropDownWidth = 500
                Properties.HideSelection = False
                Properties.ImmediateDropDownWhenActivated = True
                Properties.ImmediatePost = True
                Properties.KeyFieldNames = 'ID'
                Properties.ListColumns = <
                  item
                    Caption = 'Descri'#231#227'o'
                    FieldName = 'Descricao'
                  end
                  item
                    Caption = 'Pre'#231'o'
                    FieldName = 'Preco'
                  end>
                Properties.ListOptions.CaseInsensitive = True
                Properties.ListOptions.ColumnSorting = False
                Properties.ListOptions.SyncMode = True
                Properties.ListSource = DataSource1
                Properties.PostPopupValueOnTab = True
                Properties.OnChange = edDescrPropertiesEditValueChanged
                Properties.OnCloseUp = edDescrPropertiesCloseUp
                Properties.OnEditValueChanged = edDescrPropertiesEditValueChanged
                Properties.OnPopup = edDescrPropertiesPopup
                Style.BorderColor = clSilver
                Style.BorderStyle = ebsSingle
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.LookAndFeel.NativeStyle = False
                Style.TextStyle = [fsBold]
                Style.IsFontAssigned = True
                StyleDisabled.LookAndFeel.NativeStyle = False
                StyleFocused.LookAndFeel.NativeStyle = False
                StyleHot.LookAndFeel.NativeStyle = False
                TabOrder = 0
                OnEnter = edDescrEnter
                OnKeyUp = edDescrKeyUp
                Width = 322
              end
            end
          end
        end
        object panQtd: TLMDSimplePanel
          AlignWithMargins = True
          Left = 334
          Top = 3
          Width = 246
          Height = 50
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alRight
          Bevel.BorderSides = [fsLeft]
          Bevel.Mode = bmStandard
          Bevel.StandardStyle = lsNone
          Color = clWhite
          Locked = True
          TabOrder = 1
          object edQtd: TcxCurrencyEdit
            AlignWithMargins = True
            Left = 5
            Top = 21
            Cursor = crHandPoint
            Margins.Left = 6
            Margins.Top = 4
            AutoSize = False
            BeepOnEnter = False
            EditValue = 1.000000000000000000
            ParentFont = False
            Properties.AssignedValues.DisplayFormat = True
            Properties.AssignedValues.EditFormat = True
            Properties.DecimalPlaces = 5
            Properties.OnChange = edQtdPropertiesChange
            Properties.OnEditValueChanged = edQtdPropertiesEditValueChanged
            Style.BorderColor = 11645361
            Style.BorderStyle = ebsSingle
            Style.Color = clWhite
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.NativeStyle = False
            Style.TextStyle = [fsBold]
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.BorderStyle = ebsSingle
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 0
            OnKeyDown = edQtdKeyDown
            Height = 29
            Width = 113
          end
          object cxLabel1: TcxLabel
            AlignWithMargins = True
            Left = 5
            Top = 1
            Cursor = crHandPoint
            Margins.Left = 4
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Caption = 'Quantidade'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clGray
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.HotTrack = True
            Style.IsFontAssigned = True
            StyleHot.BorderStyle = ebsNone
            StyleHot.TextColor = clBlue
            StyleHot.TextStyle = [fsUnderline]
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            OnClick = cxLabel1Click
            AnchorX = 40
            AnchorY = 11
          end
          object lbUnit: TcxLabel
            AlignWithMargins = True
            Left = 127
            Top = 1
            Margins.Left = 4
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Caption = 'Valor Unit'#225'rio'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = 4079166
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.TextColor = clGray
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            AnchorX = 168
            AnchorY = 11
          end
          object edUnit: TcxCurrencyEdit
            AlignWithMargins = True
            Left = 125
            Top = 21
            Cursor = crHandPoint
            Margins.Left = 6
            Margins.Top = 4
            AutoSize = False
            BeepOnEnter = False
            EditValue = 0.000000000000000000
            ParentFont = False
            Properties.AssignedValues.EditFormat = True
            Properties.DecimalPlaces = 2
            Properties.DisplayFormat = 'R$ ,0.00;(R$ ,0.00)'
            Style.BorderColor = 11645361
            Style.BorderStyle = ebsSingle
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.LookAndFeel.NativeStyle = False
            Style.TextStyle = [fsBold]
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.BorderStyle = ebsSingle
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 3
            OnKeyUp = edUnitKeyUp
            Height = 29
            Width = 121
          end
          object lbUnidade: TcxLabel
            AlignWithMargins = True
            Left = 82
            Top = 24
            Cursor = crHandPoint
            Margins.Left = 4
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Caption = 'UNID'
            ParentFont = False
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Transparent = True
            AnchorX = 116
            AnchorY = 34
          end
        end
        object panAdd: TLMDSimplePanel
          AlignWithMargins = True
          Left = 583
          Top = 3
          Width = 72
          Height = 50
          Margins.Bottom = 0
          Align = alRight
          Bevel.BorderSides = [fsLeft]
          Bevel.Mode = bmStandard
          Bevel.StandardStyle = lsNone
          Locked = True
          ParentColor = True
          TabOrder = 2
          object btnLancar: TcxButton
            AlignWithMargins = True
            Left = 6
            Top = 21
            Width = 60
            Height = 29
            Margins.Left = 6
            Margins.Top = 21
            Margins.Right = 6
            Margins.Bottom = 0
            Align = alClient
            Caption = 'Lan'#231'ar'
            Enabled = False
            TabOrder = 0
            OnClick = btnLancarClick
            LookAndFeel.Kind = lfFlat
            LookAndFeel.NativeStyle = False
          end
        end
      end
      object panDetalhes: TLMDSimplePanel
        AlignWithMargins = True
        Left = 8
        Top = 53
        Width = 650
        Height = 28
        Margins.Left = 8
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        Bevel.Mode = bmCustom
        ParentColor = True
        TabOrder = 1
        Visible = False
        object lbNomeProd: TcxLabel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 8
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'Coca-cola Lata'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -16
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.TextColor = clGray
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
          StyleFocused.TextStyle = [fsBold]
          Properties.Alignment.Vert = taVCenter
          AnchorY = 14
        end
        object panEstoque: TLMDSimplePanel
          AlignWithMargins = True
          Left = 135
          Top = 0
          Width = 78
          Height = 28
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = True
          Align = alLeft
          Bevel.Mode = bmCustom
          Locked = True
          ParentColor = True
          TabOrder = 1
          object cxLabel2: TcxLabel
            Left = 0
            Top = 0
            Margins.Left = 8
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alLeft
            Caption = 'Estoque: '
            Style.TextColor = clSilver
            StyleFocused.TextColor = clSilver
            Properties.Alignment.Vert = taVCenter
            AnchorY = 14
          end
          object lbQuant: TcxLabel
            Left = 58
            Top = 0
            Margins.Left = 8
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alLeft
            Caption = '50'
            Style.TextColor = clGray
            Style.TextStyle = [fsBold]
            StyleFocused.TextStyle = [fsBold]
            Properties.Alignment.Vert = taVCenter
            AnchorY = 14
          end
        end
        object panPreco: TLMDSimplePanel
          AlignWithMargins = True
          Left = 216
          Top = 0
          Width = 98
          Height = 28
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = True
          Align = alLeft
          Bevel.Mode = bmCustom
          Locked = True
          ParentColor = True
          TabOrder = 2
          object cxLabel3: TcxLabel
            Left = 0
            Top = 0
            Margins.Left = 8
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alLeft
            Caption = 'Pre'#231'o:'
            Style.TextColor = clSilver
            StyleFocused.TextColor = clSilver
            Properties.Alignment.Vert = taVCenter
            AnchorY = 14
          end
          object lbPreco: TcxLabel
            Left = 41
            Top = 0
            Margins.Left = 8
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alLeft
            Caption = 'R$ 1, 50'
            Style.TextColor = clGray
            Style.TextStyle = [fsBold]
            StyleFocused.TextStyle = [fsBold]
            Properties.Alignment.Vert = taVCenter
            AnchorY = 14
          end
        end
      end
    end
    object panRemover: TLMDSimplePanel
      Left = 2
      Top = 323
      Width = 658
      Height = 22
      Align = alBottom
      Bevel.Mode = bmCustom
      ParentColor = True
      TabOrder = 1
      object bdcLista: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 658
        Height = 22
        Align = dalTop
        BarManager = BarMgr
        SunkenBorder = False
        UseOwnSunkenBorder = True
      end
    end
  end
  object cbRecibo: TcxCheckBox
    Left = 379
    Top = 7
    TabStop = False
    AutoSize = False
    Caption = 'Emitir Recibo'
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 6
    Visible = False
    Height = 21
    Width = 100
  end
  object BarMgr: TdxBarManager
    AllowReset = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
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
    ShowHintForDisabledItems = False
    SunkenBorder = True
    UseBarHintWindow = False
    UseSystemFont = False
    Left = 120
    Top = 304
    DockControlHeights = (
      0
      0
      36
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
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmGravar'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarStatic1'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem1'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmRecibo'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmConfig'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Controles'
      OneOnRow = True
      Row = 0
      ShowMark = False
      SizeGrip = False
      UseOwnFont = False
      UseRecentItems = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object barLista: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'Custom 1'
      CaptionButtons = <>
      Color = clWhite
      DockControl = bdcLista
      DockedDockControl = bdcLista
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 363
      FloatTop = 333
      FloatClientWidth = 96
      FloatClientHeight = 66
      ItemLinks = <
        item
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'cmApagarItem'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Custom 1'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object cmApagarItem: TdxBarButton
      Category = 0
      Enabled = False
      Hint = 'Clique neste bot'#227'o para apagar o item selecionado acima'
      Visible = ivAlways
      ImageIndex = 6
      PaintStyle = psCaptionInMenu
      UnclickAfterDoing = False
      OnClick = cmApagarItemClick
    end
    object cmGravar: TdxBarLargeButton
      Caption = '&Salvar - F2'
      Category = 0
      Hint = 'Pressione CTRL+ENTER de qualquer lugar da tela para Salvar'
      Style = cxStyle1
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = cmGravarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      SyncImageIndex = False
      ImageIndex = 28
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Style = cxStyle1
      Visible = ivAlways
      LargeImageIndex = 4
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmRecibo: TdxBarControlContainerItem
      Caption = 'Emitir Recibo'
      Category = 0
      Hint = 'Emitir Recibo'
      Style = cxStyle1
      Visible = ivAlways
      Control = cbRecibo
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object cmConfig: TdxBarLargeButton
      Align = iaRight
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
      LargeImageIndex = 33
      OnClick = cmConfigClick
      AutoGrayScale = False
      ShowCaption = False
    end
    object dxBarStatic1: TdxBarStatic
      Caption = 'Tipo de Venda:'
      Category = 0
      Hint = 'Tipo de Venda:'
      Style = cxStyle1
      Visible = ivAlways
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'Direto no Caixa'
      Category = 0
      Style = cxStyle5
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton3'
        end>
      ItemOptions.Size = misNormal
    end
    object dxBarButton1: TdxBarButton
      Caption = 'Direto no Caixa (PDV) - Venda e Pagamento Simult'#226'neos'
      Category = 0
      Hint = 'Direto no Caixa (PDV) - Venda e Pagamento Simult'#226'neos'
      Style = cxStyle1
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      Down = True
    end
    object dxBarButton2: TdxBarButton
      Caption = 'Venda Balc'#227'o - Vende no balc'#227'o e paga no caixa'
      Category = 0
      Hint = 'Venda Balc'#227'o - Vende no balc'#227'o e paga no caixa'
      Style = cxStyle1
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
    end
    object dxBarButton3: TdxBarButton
      Caption = 'Configurar'
      Category = 0
      Hint = 'Configurar'
      Style = cxStyle1
      Visible = ivAlways
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 16
    Top = 304
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clRed
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
      AssignedValues = [svColor, svTextColor]
      Color = clWindow
      TextColor = clBlue
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
  object tPro: TnxTable
    ActiveRuntime = True
    Database = Dados.db
    Filter = '(plus<>true)'
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    TableName = 'Produto'
    IndexName = 'IDescricao'
    Left = 136
    Top = 272
    object tProID: TAutoIncField
      FieldName = 'ID'
    end
    object tProCodigo: TStringField
      FieldName = 'Codigo'
      Size = 15
    end
    object tProDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object tProUnid: TStringField
      FieldName = 'Unid'
      Size = 5
    end
    object tProPreco: TCurrencyField
      FieldName = 'Preco'
    end
    object tProPodeAlterarPreco: TBooleanField
      FieldName = 'PodeAlterarPreco'
    end
    object tProPermiteVendaFracionada: TBooleanField
      FieldName = 'PermiteVendaFracionada'
    end
    object tProEstoqueAtual: TFloatField
      FieldName = 'EstoqueAtual'
    end
    object tProplus: TBooleanField
      FieldName = 'plus'
    end
    object tProFidPontos: TIntegerField
      FieldName = 'FidPontos'
    end
    object tProCustoUnitario: TCurrencyField
      FieldName = 'CustoUnitario'
    end
    object tProCadastroRapido: TBooleanField
      FieldName = 'CadastroRapido'
    end
    object tProCategoria: TStringField
      FieldName = 'Categoria'
      Size = 35
    end
    object tProObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tProImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object tProFornecedor: TIntegerField
      FieldName = 'Fornecedor'
    end
    object tProSubCateg: TStringField
      FieldName = 'SubCateg'
      Size = 35
    end
    object tProEstoqueACE: TFloatField
      FieldName = 'EstoqueACE'
    end
    object tProEstoqueACS: TFloatField
      FieldName = 'EstoqueACS'
    end
    object tProNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object tProEstoqueMin: TFloatField
      FieldName = 'EstoqueMin'
    end
    object tProEstoqueMax: TFloatField
      FieldName = 'EstoqueMax'
    end
    object tProAbaixoMin: TBooleanField
      FieldName = 'AbaixoMin'
    end
    object tProAbaixoMinDesde: TDateTimeField
      FieldName = 'AbaixoMinDesde'
    end
    object tProEstoqueRepor: TFloatField
      FieldName = 'EstoqueRepor'
    end
    object tProplusURL: TnxMemoField
      FieldName = 'plusURL'
      BlobType = ftMemo
    end
    object tProplusCodParceiro: TStringField
      FieldName = 'plusCodParceiro'
      Size = 15
    end
    object tProplusCodProduto: TStringField
      FieldName = 'plusCodProduto'
      Size = 15
    end
    object tProAtivo: TBooleanField
      FieldName = 'Ativo'
    end
    object tProFidelidade: TBooleanField
      FieldName = 'Fidelidade'
    end
    object tPromd5Imagem: TStringField
      FieldName = 'md5Imagem'
      Size = 32
    end
    object tProlastProdModif: TDateTimeField
      FieldName = 'lastProdModif'
    end
    object tProuploadR: TWordField
      FieldName = 'uploadR'
    end
    object tProuploadS: TWordField
      FieldName = 'uploadS'
    end
    object tProfk_produ: TIntegerField
      FieldName = 'fk_produ'
    end
    object tProbatchUID: TGuidField
      FieldName = 'batchUID'
      Size = 38
    end
    object tProIncluidoEm: TDateTimeField
      FieldName = 'IncluidoEm'
    end
  end
  object DataSource1: TDataSource
    DataSet = tPro
    Left = 56
    Top = 336
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 232
    Top = 304
  end
  object tCodR: TnxTable
    ActiveRuntime = True
    Database = Dados.db
    Filter = '(plus<>true)'
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    TableName = 'Produto'
    IndexName = 'ICodigo'
    Left = 224
    Top = 232
  end
end
