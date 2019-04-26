object FrmTarifa: TFrmTarifa
  Left = 0
  Top = 0
  Caption = 'Tarifa'
  ClientHeight = 515
  ClientWidth = 820
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panTop: TLMDSimplePanel
    Left = 0
    Top = 76
    Width = 820
    Height = 110
    Align = alTop
    Bevel.BorderSides = [fsBottom]
    Bevel.Mode = bmEdge
    TabOrder = 0
    object cxLabel4: TcxLabel
      Left = 329
      Top = 11
      Caption = 'minutos.'
    end
    object edTempoI: TcxSpinEdit
      Left = 276
      Top = 10
      ParentFont = False
      Properties.AssignedValues.MinValue = True
      Properties.ImmediatePost = True
      Properties.MaxValue = 60.000000000000000000
      Properties.OnChange = edValorIPropertiesChange
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clNavy
      Style.IsFontAssigned = True
      StyleFocused.Color = 12582911
      TabOrder = 2
      OnEnter = edTempoIEnter
      Width = 51
    end
    object cxLabel3: TcxLabel
      Left = 242
      Top = 11
      Caption = 'por'
    end
    object edValorI: TcxCurrencyEdit
      Left = 149
      Top = 9
      EditValue = 0c
      Properties.Alignment.Vert = taVCenter
      Properties.OnChange = edValorIPropertiesChange
      Style.BorderStyle = ebsFlat
      Style.TextColor = clNavy
      Style.TextStyle = [fsBold]
      StyleFocused.Color = 12582911
      TabOrder = 1
      OnEnter = edValorIEnter
      Width = 84
    end
    object cxLabel9: TcxLabel
      Left = 14
      Top = 11
      Caption = 'Valor minimo inicial:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextStyle = []
      Style.IsFontAssigned = True
    end
    object btnAplicar: TcxButton
      Left = 15
      Top = 67
      Width = 72
      Height = 22
      Caption = '&Aplicar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnAplicarClick
      LookAndFeel.Kind = lfFlat
    end
    object edValor1h: TcxCurrencyEdit
      Left = 149
      Top = 36
      EditValue = 0c
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Properties.OnChange = edValorIPropertiesChange
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.TextColor = clNavy
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleFocused.Color = 12582911
      TabOrder = 3
      OnEnter = edValor1hEnter
      Width = 84
    end
    object cxLabel1: TcxLabel
      Left = 14
      Top = 36
      Caption = 'Valor para 1h de acesso:'
      Style.TextStyle = []
    end
  end
  object panNumH: TLMDSimplePanel
    Left = 0
    Top = 186
    Width = 820
    Height = 69
    Align = alTop
    Bevel.BorderSides = [fsBottom]
    Bevel.Mode = bmEdge
    TabOrder = 2
    Visible = False
    object cxLabel2: TcxLabel
      Left = 14
      Top = 11
      Caption = 'Configurar tarifas para tempo de uso de at'#233':'
      Style.TextColor = clBlack
    end
    object edNumH: TcxSpinEdit
      Left = 253
      Top = 9
      Properties.ImmediatePost = True
      Properties.MaxValue = 24.000000000000000000
      Properties.MinValue = 1.000000000000000000
      Properties.OnChange = edNumHPropertiesChange
      Style.BorderStyle = ebsFlat
      Style.TextStyle = [fsBold]
      StyleFocused.Color = 12582911
      TabOrder = 1
      Value = 1
      Width = 42
    end
    object cxLabel5: TcxLabel
      Left = 299
      Top = 11
      Caption = 'horas'
      Style.TextColor = clBlack
    end
    object lbComoTarifar: TcxLabel
      Left = 15
      Top = 37
      Caption = 'Como tarifar tempo de uso maior que 1h ?'
      Style.TextColor = clBlack
      Style.TextStyle = []
    end
    object edTarExtra: TcxPopupEdit
      Left = 253
      Top = 36
      Properties.ReadOnly = True
      Properties.OnInitPopup = edTarExtraPropertiesInitPopup
      Style.BorderStyle = ebsFlat
      StyleFocused.Color = 12582911
      TabOrder = 2
      Text = 'Aplicar a tarifa da 1a. hora nas demais horas'
      Width = 261
    end
  end
  object dxBarDockControl1: TdxBarDockControl
    Left = 0
    Top = 0
    Width = 820
    Height = 36
    Align = dalTop
    BarManager = BarMgr
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object panNome: TLMDSimplePanel
    Left = 0
    Top = 36
    Width = 820
    Height = 40
    Align = alTop
    Bevel.BorderSides = [fsBottom]
    Bevel.Mode = bmEdge
    TabOrder = 6
    object cxLabel7: TcxLabel
      Left = 14
      Top = 9
      Caption = 'Nome'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextStyle = []
      Style.IsFontAssigned = True
    end
    object edNome: TcxTextEdit
      Left = 54
      Top = 6
      ParentFont = False
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.TextColor = clNavy
      Style.IsFontAssigned = True
      StyleFocused.Color = 12582911
      TabOrder = 1
      Width = 179
    end
    object cxLabel8: TcxLabel
      Left = 242
      Top = 9
      Caption = 'Cor'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextStyle = []
      Style.IsFontAssigned = True
    end
    object edCor: TcxColorComboBox
      Left = 270
      Top = 8
      Properties.AllowSelectColor = True
      Properties.ColorBoxFrameColor = clWhite
      Properties.CustomColors = <>
      Properties.DefaultColor = clWhite
      Properties.DefaultDescription = 'Selecione uma cor'
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.ShowDescriptions = False
      Style.BorderStyle = ebsFlat
      TabOrder = 3
      Width = 117
    end
  end
  object lbErroH: TcxLabel
    Left = 0
    Top = 255
    Align = alTop
    Caption = 
      'Aten'#231#227'o: O valor a ser cobrado n'#227'o pode ser menor que o valor do' +
      ' tempo anterior.'
    ParentColor = False
    Style.Color = 10023407
    Style.TextColor = clBlack
    Style.TextStyle = [fsBold]
    Style.TransparentBorder = True
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Properties.WordWrap = True
    Visible = False
    Width = 820
    AnchorX = 410
    AnchorY = 264
  end
  object lbErroM: TcxLabel
    Left = 0
    Top = 272
    Align = alTop
    Caption = 
      'Aten'#231#227'o: O valor a ser cobrado n'#227'o pode ser menor que o valor do' +
      ' tempo anterior.'
    ParentColor = False
    Style.Color = 10023407
    Style.TextColor = clBlack
    Style.TextStyle = [fsBold]
    Style.TransparentBorder = True
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Properties.WordWrap = True
    Visible = False
    Width = 820
    AnchorX = 410
    AnchorY = 281
  end
  object LMDSimplePanel6: TLMDSimplePanel
    Left = 0
    Top = 289
    Width = 820
    Height = 226
    Align = alClient
    Bevel.Mode = bmCustom
    TabOrder = 10
    object LMDSimplePanel3: TLMDSimplePanel
      Left = 0
      Top = 0
      Width = 339
      Height = 226
      Align = alLeft
      Bevel.Mode = bmCustom
      TabOrder = 0
      object gridH: TcxGrid
        AlignWithMargins = True
        Left = 10
        Top = 35
        Width = 318
        Height = 181
        Margins.Left = 10
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alLeft
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        ExplicitHeight = 43
        object tvH: TcxGridTableView
          NavigatorButtons.ConfirmDelete = False
          OnCustomDrawCell = tvHCustomDrawCell
          OnEditing = tvHEditing
          OnInitEdit = tvMinInitEdit
          OnInitEditValue = tvMinInitEditValue
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          DataController.OnRecordChanged = tvHDataControllerRecordChanged
          OptionsBehavior.AlwaysShowEditor = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnHorzSizing = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.CancelOnExit = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.FocusRect = False
          OptionsView.CellAutoHeight = True
          OptionsView.CellTextMaxLineCount = 5
          OptionsView.ColumnAutoWidth = True
          OptionsView.ExpandButtonsForEmptyDetails = False
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Content = FrmPri.cxStyle39
          Styles.Selection = FrmPri.cxStyle38
          object tvHTempoUso: TcxGridColumn
            Caption = 'Tempo de Uso'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Focusing = False
            Width = 40
          end
          object tvHCobrar: TcxGridColumn
            Caption = 'Cobrar (valor total)'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
          object tvHTarifa: TcxGridColumn
            Caption = 'Tarifa'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Focusing = False
            VisibleForCustomization = False
            Width = 40
          end
        end
        object glH: TcxGridLevel
          GridView = tvH
        end
      end
      object LMDSimplePanel5: TLMDSimplePanel
        Left = 0
        Top = 0
        Width = 339
        Height = 35
        Align = alTop
        Bevel.BorderSides = [fsBottom]
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsNone
        TabOrder = 1
        object cxLabel10: TcxLabel
          AlignWithMargins = True
          Left = 10
          Top = 0
          Margins.Left = 10
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'Valor por quantidade de horas'
          Style.TextStyle = []
          Properties.Alignment.Vert = taVCenter
          AnchorY = 18
        end
      end
    end
    object LMDSimplePanel4: TLMDSimplePanel
      Left = 339
      Top = 0
      Width = 481
      Height = 226
      Align = alClient
      Bevel.Mode = bmCustom
      TabOrder = 1
      object LMDSimplePanel1: TLMDSimplePanel
        Left = 0
        Top = 0
        Width = 481
        Height = 35
        Align = alTop
        Bevel.BorderSides = [fsBottom]
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsNone
        TabOrder = 0
        object cxLabel6: TcxLabel
          AlignWithMargins = True
          Left = 10
          Top = 0
          Margins.Left = 10
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'Tarifar a cada'
          Style.TextStyle = []
          Properties.Alignment.Vert = taVCenter
          AnchorY = 18
        end
        object btnDiv: TcxButton
          AlignWithMargins = True
          Left = 85
          Top = 7
          Width = 92
          Height = 21
          Margins.Top = 7
          Margins.Bottom = 7
          Align = alLeft
          Caption = '15min.'
          TabOrder = 1
          DropDownMenu = PopupMenu1
          Glyph.Data = {
            32010000424D3201000000000000360000002800000009000000090000000100
            180000000000FC00000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF5A5A5AFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF5A5A5A5A5A5A5A5A5AFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFF5A5A5A5A5A5A5A5A5A5A5A5A5A5A5AFFFFFFFFFF
            FF00FFFFFF5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5AFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
          Kind = cxbkDropDown
          Layout = blGlyphRight
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = True
          SpeedButtonOptions.Flat = True
        end
        object btnArr: TcxButton
          AlignWithMargins = True
          Left = 183
          Top = 7
          Width = 141
          Height = 21
          Margins.Top = 7
          Margins.Bottom = 7
          Align = alLeft
          Caption = 'Arredondar em 0,05'
          TabOrder = 2
          DropDownMenu = pmArr
          Glyph.Data = {
            32010000424D3201000000000000360000002800000009000000090000000100
            180000000000FC00000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF5A5A5AFFFFFF
            FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF5A5A5A5A5A5A5A5A5AFFFFFFFF
            FFFFFFFFFF00FFFFFFFFFFFF5A5A5A5A5A5A5A5A5A5A5A5A5A5A5AFFFFFFFFFF
            FF00FFFFFF5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5AFFFFFF00FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
          Kind = cxbkDropDown
          Layout = blGlyphRight
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = True
          SpeedButtonOptions.Flat = True
          SpeedButtonOptions.Transparent = True
        end
      end
      object Grid: TcxGrid
        AlignWithMargins = True
        Left = 10
        Top = 35
        Width = 314
        Height = 181
        Margins.Left = 10
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alLeft
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        LookAndFeel.Kind = lfFlat
        OnMouseLeave = GridMouseLeave
        object tvMin: TcxGridTableView
          OnMouseDown = tvMinMouseDown
          OnMouseLeave = tvMinMouseLeave
          OnMouseMove = tvMinMouseMove
          NavigatorButtons.ConfirmDelete = False
          OnCanFocusRecord = tvMinCanFocusRecord
          OnCustomDrawCell = tvMinCustomDrawCell
          OnEditing = tvMinEditing
          OnInitEdit = tvMinInitEdit
          OnInitEditValue = tvMinInitEditValue
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          DataController.OnRecordChanged = tvMinDataControllerRecordChanged
          OptionsBehavior.AlwaysShowEditor = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnHorzSizing = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.CellAutoHeight = True
          OptionsView.CellTextMaxLineCount = 5
          OptionsView.ColumnAutoWidth = True
          OptionsView.ExpandButtonsForEmptyDetails = False
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Selection = FrmPri.cxStyle38
          object tvMinHora: TcxGridColumn
            Caption = 'Hora'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            OnCustomDrawCell = tvMinHoraCustomDrawCell
            OnGetDataText = tvMinHoraGetDataText
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Focusing = False
            VisibleForCustomization = False
            Width = 40
          end
          object tvMinMinutos: TcxGridColumn
            Caption = 'Minutos'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Vert = taVCenter
            Properties.EditMask = '99;0; '
            Properties.MaxLength = 0
            Properties.OnValidate = tvMinMinutosPropertiesValidate
            OnGetDisplayText = tvMinMinutosGetDisplayText
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 40
          end
          object tvMinValor: TcxGridColumn
            Caption = 'Cobrar (Valor Total)'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
        end
        object GL: TcxGridLevel
          GridView = tvMin
        end
      end
    end
  end
  object BarMgr: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dmImagens.Imagens
    ImageOptions.LargeImages = FrmPri.im24
    PopupMenuLinks = <>
    UseSystemFont = False
    Left = 464
    Top = 168
    DockControlHeights = (
      0
      0
      0
      0)
    object BarMgrBar1: TdxBar
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
      FloatLeft = 614
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmSalvar'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end>
      MultiLine = True
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = True
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object cmTM1: TdxBarButton
      Tag = 1
      Caption = '1m'
      Category = 0
      Hint = '1m'
      Visible = ivAlways
    end
    object cmTM5: TdxBarButton
      Tag = 5
      Caption = '5m'
      Category = 0
      Hint = '5m'
      Visible = ivAlways
    end
    object cmTM10: TdxBarButton
      Tag = 10
      Caption = '10m'
      Category = 0
      Hint = '10m'
      Visible = ivAlways
    end
    object cmTM15: TdxBarButton
      Tag = 15
      Caption = '15m'
      Category = 0
      Hint = '15m'
      Visible = ivAlways
    end
    object cmTM20: TdxBarButton
      Tag = 20
      Caption = '20m'
      Category = 0
      Hint = '20m'
      Visible = ivAlways
    end
    object cmTM25: TdxBarButton
      Tag = 25
      Caption = '25m'
      Category = 0
      Hint = '25m'
      Visible = ivAlways
    end
    object cmTM30: TdxBarButton
      Tag = 30
      Caption = '30m'
      Category = 0
      Hint = '30m'
      Visible = ivAlways
    end
    object cmTM60: TdxBarButton
      Tag = 60
      Caption = '1h'
      Category = 0
      Hint = '1h'
      Visible = ivAlways
    end
    object cm1c: TdxBarButton
      Tag = 1
      Caption = '1 centavo'
      Category = 0
      Hint = '1 centavo'
      Visible = ivAlways
    end
    object dxBarButton2: TdxBarButton
      Tag = 5
      Caption = '5 centavos'
      Category = 0
      Hint = '5 centavos'
      Visible = ivAlways
    end
    object cm10c: TdxBarButton
      Tag = 10
      Caption = '10 centavos'
      Category = 0
      Hint = '10 centavos'
      Visible = ivAlways
    end
    object cm25c: TdxBarButton
      Tag = 25
      Caption = '25 centavos'
      Category = 0
      Hint = '25 centavos'
      Visible = ivAlways
    end
    object cm50c: TdxBarButton
      Tag = 50
      Caption = '50 centavos'
      Category = 0
      Hint = '50 centavos'
      Visible = ivAlways
    end
    object dxBarButton1: TdxBarButton
      Caption = 'N'#227'o arrendondar'
      Category = 0
      Hint = 'N'#227'o arrendondar'
      Visible = ivAlways
    end
    object dxBarButton3: TdxBarButton
      Caption = 'Repetir a mesma tarifa'#231#227'o'
      Category = 0
      Hint = 'Repetir a mesma tarifa'#231#227'o'
      Visible = ivAlways
    end
    object dxBarButton4: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton5: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton6: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton7: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton8: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton9: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton10: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton11: TdxBarButton
      Caption = '1 centavo'
      Category = 0
      Hint = '1 centavo'
      Visible = ivAlways
    end
    object dxBarButton12: TdxBarButton
      Caption = '5 centavos'
      Category = 0
      Hint = '5 centavos'
      Visible = ivAlways
    end
    object dxBarButton13: TdxBarButton
      Caption = '10 centavos'
      Category = 0
      Hint = '10 centavos'
      Visible = ivAlways
    end
    object dxBarButton14: TdxBarButton
      Caption = '25 centavos'
      Category = 0
      Hint = '25 centavos'
      Visible = ivAlways
    end
    object dxBarButton15: TdxBarButton
      Caption = '50 centavos'
      Category = 0
      Hint = '50 centavos'
      Visible = ivAlways
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
  end
  object SC: TcxEditStyleController
    Style.Color = 12582911
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.TextColor = clBlack
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.Color = 12582911
    StyleFocused.TextColor = clBlack
    StyleFocused.TextStyle = [fsBold]
    Left = 368
    Top = 408
  end
  object cxEditRepository1: TcxEditRepository
    Left = 48
    Top = 128
    object tvCurEdit_ReadOnly: TcxEditRepositoryCurrencyItem
      Properties.Alignment.Vert = taVCenter
      Properties.ReadOnly = True
      Properties.UseDisplayFormatWhenEditing = True
    end
    object tvCurEdit: TcxEditRepositoryCurrencyItem
      Properties.Alignment.Vert = taVCenter
      Properties.UseDisplayFormatWhenEditing = True
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 72
    Top = 232
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      TextColor = 8750469
    end
  end
  object HC: TcxHintStyleController
    Global = False
    HintStyle.Animate = cxhaFadeIn
    HintStyle.CaptionFont.Charset = DEFAULT_CHARSET
    HintStyle.CaptionFont.Color = clWindowText
    HintStyle.CaptionFont.Height = -11
    HintStyle.CaptionFont.Name = 'MS Sans Serif'
    HintStyle.CaptionFont.Style = []
    HintStyle.Font.Charset = ANSI_CHARSET
    HintStyle.Font.Color = clWindowText
    HintStyle.Font.Height = -11
    HintStyle.Font.Name = 'Tahoma'
    HintStyle.Font.Style = [fsBold]
    HintStyle.Rounded = True
    Left = 408
    Top = 432
  end
  object PopupMenu1: TPopupMenu
    Left = 24
    Top = 408
    object porTempo1: TMenuItem
      Caption = 'por Tempo'
      object mi1m: TMenuItem
        Tag = 1
        Caption = '1 min.'
        OnClick = mi1mClick
      end
      object mi5m: TMenuItem
        Tag = 5
        Caption = '5 min.'
        OnClick = mi1mClick
      end
      object mi10m: TMenuItem
        Tag = 10
        Caption = '10 min.'
        OnClick = mi1mClick
      end
      object mi15m: TMenuItem
        Tag = 15
        Caption = '15 min'
        OnClick = mi1mClick
      end
      object mi20m: TMenuItem
        Tag = 20
        Caption = '20 min.'
        OnClick = mi1mClick
      end
      object mi30m: TMenuItem
        Tag = 30
        Caption = '30 min.'
        OnClick = mi1mClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miDigitarTempo: TMenuItem
        Caption = 'Digitar tempo'
      end
    end
    object miPorValor: TMenuItem
      Caption = 'por Valor'
    end
  end
  object pmArr: TPopupMenu
    Left = 112
    Top = 48
    object mi1c: TMenuItem
      Tag = 1
      Caption = '0,01'
      OnClick = mi1cClick
    end
    object mi5c: TMenuItem
      Tag = 5
      Caption = '0,05'
      OnClick = mi1cClick
    end
    object mi10c: TMenuItem
      Tag = 10
      Caption = '0,10'
      OnClick = mi1cClick
    end
    object mi25c: TMenuItem
      Tag = 25
      Caption = '0,25'
      OnClick = mi1cClick
    end
    object mi50c: TMenuItem
      Tag = 50
      Caption = '0,50'
      OnClick = mi1cClick
    end
  end
  object TimerLoad: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerLoadTimer
    Left = 528
    Top = 40
  end
end
