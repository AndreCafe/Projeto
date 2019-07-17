inherited fbVendas: TfbVendas
  Caption = 'fbVendas'
  ClientHeight = 422
  ClientWidth = 669
  OnDestroy = FrmBasePaiDestroy
  ExplicitWidth = 677
  ExplicitHeight = 449
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TParentedPanel
    Width = 669
    Height = 422
    ExplicitWidth = 669
    ExplicitHeight = 422
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 669
      Height = 44
      ExplicitWidth = 669
      ExplicitHeight = 44
    end
    object panCli: TLMDSimplePanel
      AlignWithMargins = True
      Left = 0
      Top = 49
      Width = 669
      Height = 75
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alTop
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      TabOrder = 1
    end
    object panTot: TLMDSimplePanel
      AlignWithMargins = True
      Left = 0
      Top = 356
      Width = 669
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
      Top = 130
      Width = 669
      Height = 220
      Margins.Left = 0
      Margins.Top = 6
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Bevel.Mode = bmEdge
      Color = clWhite
      TabOrder = 3
      object panDivBuscaLista: TLMDSimplePanel
        Left = 2
        Top = 83
        Width = 665
        Height = 1
        Align = alTop
        Bevel.Mode = bmCustom
        TabOrder = 2
      end
      object panBuscaProd: TLMDSimplePanel
        Left = 2
        Top = 2
        Width = 665
        Height = 81
        Align = alTop
        Bevel.Mode = bmCustom
        ParentColor = True
        TabOrder = 0
        object panBuscaTop: TLMDSimplePanel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 665
          Height = 53
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AllowSizing = True
          Align = alTop
          Bevel.BorderSides = [fsBottom]
          Bevel.Mode = bmStandard
          Bevel.StandardStyle = lsNone
          Color = clWhite
          TabOrder = 0
          object panProd: TLMDSimplePanel
            Left = 0
            Top = 0
            Width = 379
            Height = 53
            Align = alClient
            Bevel.Mode = bmCustom
            Color = clWhite
            TabOrder = 0
            object panRB: TLMDSimplePanel
              Left = 0
              Top = 0
              Width = 379
              Height = 24
              Align = alTop
              Bevel.Mode = bmCustom
              ParentColor = True
              TabOrder = 0
              object rgCodigo: TcxRadioButton
                AlignWithMargins = True
                Left = 6
                Top = 3
                Width = 60
                Height = 18
                Cursor = crHandPoint
                Margins.Left = 6
                Align = alLeft
                Caption = 'C'#243'digo'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnClick = rgCodigoClick
                LookAndFeel.Kind = lfFlat
                LookAndFeel.NativeStyle = False
              end
              object rgDescr: TcxRadioButton
                Left = 69
                Top = 0
                Width = 93
                Height = 24
                Cursor = crHandPoint
                Align = alLeft
                Caption = 'Descri'#231#227'o'
                Checked = True
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
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
              Width = 379
              Height = 29
              Align = alClient
              Color = clWhite
              ParentBackground = False
              ParentColor = False
              TabOrder = 1
              TabStop = False
              Properties.ActivePage = tsDescr
              Properties.CustomButtons.Buttons = <>
              Properties.HideTabs = True
              LookAndFeel.NativeStyle = False
              ClientRectBottom = 29
              ClientRectRight = 379
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
                  Style.Font.Charset = ANSI_CHARSET
                  Style.Font.Color = clWindowText
                  Style.Font.Height = -13
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = [fsBold]
                  Style.IsFontAssigned = True
                  StyleFocused.Color = 11796479
                  TabOrder = 0
                  OnKeyUp = edDescrKeyUp
                  Width = 370
                end
              end
              object tsDescr: TcxTabSheet
                Caption = 'tsDescr'
                Color = clWhite
                ImageIndex = 1
                ParentColor = False
                object edDescr: TcxLookupComboBox
                  AlignWithMargins = True
                  Left = 6
                  Top = 0
                  Margins.Left = 6
                  Margins.Top = 0
                  Margins.Bottom = 0
                  Align = alClient
                  AutoSize = False
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
                  Style.IsFontAssigned = True
                  StyleDisabled.LookAndFeel.NativeStyle = False
                  StyleFocused.Color = 11796479
                  StyleFocused.LookAndFeel.NativeStyle = False
                  StyleHot.LookAndFeel.NativeStyle = False
                  TabOrder = 0
                  OnEnter = edDescrEnter
                  OnKeyUp = edDescrKeyUp
                  Height = 29
                  Width = 370
                end
              end
            end
          end
          object panQtdUnitAdd: TLMDSimplePanel
            Left = 379
            Top = 0
            Width = 286
            Height = 53
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alRight
            Bevel.BorderSides = [fsLeft]
            Bevel.Mode = bmStandard
            Bevel.StandardStyle = lsNone
            Color = clWhite
            Locked = True
            TabOrder = 1
            object panAdd: TLMDSimplePanel
              AlignWithMargins = True
              Left = 184
              Top = 3
              Width = 99
              Height = 50
              Margins.Left = 0
              Margins.Bottom = 0
              Align = alClient
              Bevel.BorderSides = [fsLeft]
              Bevel.Mode = bmStandard
              Bevel.StandardStyle = lsNone
              Color = clWhite
              Locked = True
              TabOrder = 0
              object btnLancar: TcxButton
                AlignWithMargins = True
                Left = 6
                Top = 21
                Width = 87
                Height = 29
                Margins.Left = 6
                Margins.Top = 21
                Margins.Right = 6
                Margins.Bottom = 0
                Align = alBottom
                Caption = 'Lan'#231'ar'
                Enabled = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnClick = btnLancarClick
                LookAndFeel.Kind = lfFlat
                LookAndFeel.NativeStyle = False
              end
            end
            object panQtdUnit: TLMDSimplePanel
              Left = 0
              Top = 0
              Width = 184
              Height = 53
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alLeft
              Bevel.BorderSides = [fsLeft]
              Bevel.Mode = bmStandard
              Bevel.StandardStyle = lsNone
              Color = clWhite
              Locked = True
              TabOrder = 1
              object panUnit: TLMDSimplePanel
                AlignWithMargins = True
                Left = 86
                Top = 3
                Width = 95
                Height = 50
                Margins.Left = 0
                Margins.Bottom = 0
                Align = alClient
                Bevel.BorderSides = [fsLeft]
                Bevel.Mode = bmStandard
                Bevel.StandardStyle = lsNone
                Color = clWhite
                Locked = True
                TabOrder = 0
                object lbUnit: TcxLabel
                  AlignWithMargins = True
                  Left = 3
                  Top = 4
                  Margins.Top = 0
                  Margins.Bottom = 0
                  Align = alBottom
                  Caption = 'Valor Unit'#225'rio'
                  ParentFont = False
                  Style.Font.Charset = ANSI_CHARSET
                  Style.Font.Color = 4079166
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = []
                  Style.TextColor = clGray
                  Style.IsFontAssigned = True
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  AnchorX = 48
                  AnchorY = 13
                end
                object edUnit: TcxCurrencyEdit
                  AlignWithMargins = True
                  Left = 3
                  Top = 21
                  Cursor = crHandPoint
                  Margins.Top = 0
                  Margins.Bottom = 0
                  Align = alBottom
                  AutoSize = False
                  BeepOnEnter = False
                  EditValue = 0.000000000000000000
                  ParentFont = False
                  Properties.AssignedValues.EditFormat = True
                  Properties.DecimalPlaces = 2
                  Properties.DisplayFormat = 'R$ ,0.00;(R$ ,0.00)'
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
                  Style.IsFontAssigned = True
                  StyleDisabled.LookAndFeel.NativeStyle = False
                  StyleFocused.BorderStyle = ebsThick
                  StyleFocused.Color = 11796479
                  StyleFocused.LookAndFeel.NativeStyle = False
                  StyleHot.BorderStyle = ebsSingle
                  StyleHot.LookAndFeel.NativeStyle = False
                  TabOrder = 1
                  OnKeyUp = edUnitKeyUp
                  Height = 29
                  Width = 89
                end
              end
              object panQtd: TLMDSimplePanel
                AlignWithMargins = True
                Left = 3
                Top = 3
                Width = 80
                Height = 50
                Margins.Bottom = 0
                Align = alLeft
                Bevel.BorderSides = [fsLeft]
                Bevel.Mode = bmStandard
                Bevel.StandardStyle = lsNone
                Color = clWhite
                Locked = True
                TabOrder = 1
                object lbQtd: TcxLabel
                  AlignWithMargins = True
                  Left = 4
                  Top = 4
                  Cursor = crHandPoint
                  Margins.Left = 4
                  Margins.Top = 0
                  Margins.Right = 4
                  Margins.Bottom = 0
                  Align = alBottom
                  Caption = 'Quantidade'
                  ParentFont = False
                  Style.Font.Charset = ANSI_CHARSET
                  Style.Font.Color = clGray
                  Style.Font.Height = -11
                  Style.Font.Name = 'Tahoma'
                  Style.Font.Style = []
                  Style.HotTrack = True
                  Style.IsFontAssigned = True
                  StyleHot.BorderStyle = ebsNone
                  StyleHot.TextColor = clBlue
                  StyleHot.TextStyle = [fsUnderline]
                  Properties.Alignment.Horz = taCenter
                  Properties.Alignment.Vert = taVCenter
                  OnClick = lbQtdClick
                  AnchorX = 40
                  AnchorY = 13
                end
                object edQtd: TcxCurrencyEdit
                  AlignWithMargins = True
                  Left = 4
                  Top = 21
                  Cursor = crHandPoint
                  Margins.Left = 4
                  Margins.Top = 0
                  Margins.Right = 4
                  Margins.Bottom = 0
                  Align = alBottom
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
                  Style.IsFontAssigned = True
                  StyleDisabled.LookAndFeel.NativeStyle = False
                  StyleFocused.BorderStyle = ebsThick
                  StyleFocused.Color = 11796479
                  StyleFocused.LookAndFeel.NativeStyle = False
                  StyleHot.BorderStyle = ebsSingle
                  StyleHot.LookAndFeel.NativeStyle = False
                  TabOrder = 1
                  OnKeyUp = edQtdKeyUp
                  Height = 29
                  Width = 72
                end
              end
            end
          end
        end
        object panDetalhes: TLMDSimplePanel
          AlignWithMargins = True
          Left = 8
          Top = 53
          Width = 657
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
            Width = 68
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
              Left = 50
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
            Left = 206
            Top = 0
            Width = 84
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
              Left = 35
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
        Top = 196
        Width = 665
        Height = 22
        Align = alBottom
        Bevel.Mode = bmCustom
        ParentColor = True
        TabOrder = 1
        object bdcLista: TdxBarDockControl
          Left = 0
          Top = 0
          Width = 665
          Height = 22
          Align = dalTop
          BarManager = BarMgr
          SunkenBorder = False
          UseOwnSunkenBorder = True
        end
      end
      object Grid: TcxGrid
        AlignWithMargins = True
        Left = 2
        Top = 87
        Width = 665
        Height = 109
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
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        object TV: TcxGridTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0.00'
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
            HeaderAlignmentHorz = taCenter
            Width = 20
          end
          object TVTotal: TcxGridColumn
            Caption = 'Total'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
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
    end
    object cbRecibo: TcxCheckBox
      Left = 397
      Top = 7
      TabStop = False
      AutoSize = False
      Caption = 'Emitir Recibo'
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 4
      Visible = False
      Height = 21
      Width = 86
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
          ItemName = 'cmSalvar'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmRecibo'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton4'
        end>
      UseRestSpace = True
    end
    object barLista: TdxBar [1]
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'barLista'
      CaptionButtons = <>
      Color = clWhite
      DockControl = bdcLista
      DockedDockControl = bdcLista
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 628
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmApagarItem'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
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
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    object cmSalvar: TdxBarLargeButton
      Caption = 'Salvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = cmSalvarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmCancelar: TdxBarLargeButton
      Caption = 'Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      LargeImageIndex = 4
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmRecibo: TdxBarControlContainerItem
      Align = iaRight
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = cbRecibo
    end
    object cmApagarItem: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Enabled = False
      Hint = 'Clique neste bot'#227'o para apagar o item selecionado acima'
      Visible = ivAlways
      ImageIndex = 6
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton2: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Align = iaRight
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
      AllowAllUp = True
      LargeImageIndex = 21
      GlyphLayout = glLeft
      ShowCaption = False
      SyncImageIndex = False
      ImageIndex = 21
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
      ShowCaption = False
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Align = iaRight
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
      LargeImageIndex = 21
      OnClick = dxBarLargeButton4Click
      ShowCaption = False
      SyncImageIndex = False
      ImageIndex = 21
    end
  end
  inherited dlgExp: TSaveDialog
    Top = 209
  end
  inherited pmPeriodo: TdxBarPopupMenu
    Left = 120
    Top = 212
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
      Size = 55
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
  end
  object DataSource1: TDataSource
    DataSet = tPro
    Left = 96
    Top = 280
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    Left = 168
    Top = 272
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 200
    Left = 152
    Top = 208
  end
end
