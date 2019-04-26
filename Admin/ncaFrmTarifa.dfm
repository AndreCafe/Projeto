object FrmTarifa: TFrmTarifa
  Left = 0
  Top = 0
  Caption = 'Tarifa'
  ClientHeight = 620
  ClientWidth = 1105
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
    Top = 78
    Width = 1105
    Height = 159
    Align = alTop
    Bevel.BorderSides = [fsBottom]
    Bevel.Mode = bmEdge
    TabOrder = 0
    object lbMinutos: TcxLabel
      Left = 402
      Top = 47
      Caption = 'minutos.'
      Enabled = False
    end
    object edTempoI: TcxSpinEdit
      Left = 345
      Top = 47
      Enabled = False
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
      Style.TextColor = clBlack
      Style.IsFontAssigned = True
      StyleFocused.Color = 12582911
      TabOrder = 3
      OnEnter = edTempoIEnter
      Width = 51
    end
    object lbTempoI: TcxLabel
      Left = 241
      Top = 48
      Caption = 'pelo tempo de'
      Enabled = False
    end
    object edValorI: TcxCurrencyEdit
      Left = 134
      Top = 47
      EditValue = 0c
      Enabled = False
      Properties.OnChange = edValorIPropertiesChange
      Style.BorderStyle = ebsFlat
      Style.TextColor = clBlack
      Style.TextStyle = [fsBold]
      StyleFocused.Color = 12582911
      TabOrder = 2
      OnEnter = edValorIEnter
      Width = 94
    end
    object edValor1h: TcxCurrencyEdit
      Left = 135
      Top = 14
      EditValue = 0c
      ParentFont = False
      Properties.OnChange = edValorIPropertiesChange
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.StyleController = SC
      Style.TextColor = clBlack
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleFocused.Color = 12582911
      TabOrder = 1
      OnEnter = edValor1hEnter
      Width = 94
    end
    object cxLabel1: TcxLabel
      Left = 12
      Top = 14
      Caption = 'Valor p/ 1h de acesso:'
      Style.TextStyle = []
    end
    object lbValorI: TcxLabel
      Left = 12
      Top = 47
      Caption = 'Valor m'#237'nimo inicial:'
      Enabled = False
    end
    object cbSemValorMin: TcxCheckBox
      Left = 472
      Top = 47
      Caption = 'N'#227'o tem valor m'#237'nimo'
      State = cbsChecked
      Style.BorderStyle = ebsFlat
      TabOrder = 4
      OnClick = cbSemValorMinClick
      Width = 136
    end
    object lbDiv: TcxLabel
      Left = 12
      Top = 81
      Caption = 'Tarifar a cada:'
      Enabled = False
    end
    object btnDiv: TcxButtonEdit
      Left = 133
      Top = 81
      Enabled = False
      ParentFont = False
      PopupMenu = pmDiv
      Properties.Buttons = <
        item
          Default = True
        end>
      Properties.ReadOnly = True
      Properties.ViewStyle = vsHideCursor
      Style.BorderStyle = ebsFlat
      Style.StyleController = SC
      Style.TextStyle = [fsBold]
      TabOrder = 5
      Text = '15 min'
      OnClick = btnDivClick
      Width = 96
    end
    object lbArr: TcxLabel
      Left = 241
      Top = 81
      Caption = 'Arredondar em'
      Enabled = False
    end
    object edArr: TcxButtonEdit
      Left = 345
      Top = 80
      Enabled = False
      ParentFont = False
      Properties.Buttons = <
        item
          Default = True
        end>
      Style.BorderStyle = ebsFlat
      Style.StyleController = SC
      TabOrder = 6
      Text = '5 centavos'
      OnClick = edArrClick
      Width = 263
    end
    object btnAplicar: TcxButton
      Left = 16
      Top = 116
      Width = 75
      Height = 25
      Caption = 'Aplicar'
      TabOrder = 12
      OnClick = btnAplicarClick
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = True
    end
  end
  object dxBarDockControl1: TdxBarDockControl
    Left = 0
    Top = 0
    Width = 1105
    Height = 36
    Align = dalTop
    BarManager = BarMgr
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object panNome: TLMDSimplePanel
    Left = 0
    Top = 36
    Width = 1105
    Height = 42
    Align = alTop
    Bevel.BorderSides = [fsBottom]
    Bevel.Mode = bmEdge
    TabOrder = 3
    object cxLabel7: TcxLabel
      Left = 10
      Top = 11
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
      Left = 50
      Top = 10
      ParentFont = False
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.StyleController = SC
      Style.TextColor = clNavy
      Style.IsFontAssigned = True
      StyleFocused.Color = 12582911
      TabOrder = 1
      Width = 178
    end
    object cxLabel8: TcxLabel
      Left = 237
      Top = 12
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
      Left = 345
      Top = 11
      ParentFont = False
      Properties.AllowSelectColor = True
      Properties.ColorBoxFrameColor = clWhite
      Properties.CustomColors = <>
      Properties.DefaultColor = clWhite
      Properties.DefaultDescription = 'Selecione uma cor'
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.ShowDescriptions = False
      Style.BorderStyle = ebsFlat
      Style.StyleController = SC
      TabOrder = 3
      Width = 117
    end
  end
  object lbErroM: TcxLabel
    Left = 0
    Top = 237
    Align = alTop
    AutoSize = False
    Caption = 
      'Aten'#231#227'o: O valor a ser cobrado n'#227'o pode ser menor que o valor do' +
      ' tempo anterior.'
    ParentColor = False
    Style.Color = 10023407
    Style.TextColor = clBlack
    Style.TextStyle = [fsBold]
    Style.TransparentBorder = True
    Properties.Alignment.Horz = taLeftJustify
    Properties.Alignment.Vert = taVCenter
    Properties.WordWrap = True
    Visible = False
    Height = 28
    Width = 1105
    AnchorY = 251
  end
  object panTarifas: TLMDSimplePanel
    Left = 0
    Top = 265
    Width = 1105
    Height = 355
    Align = alClient
    Bevel.Mode = bmCustom
    TabOrder = 4
    Visible = False
    object panHoras: TLMDSimplePanel
      Left = 827
      Top = 0
      Width = 283
      Height = 355
      Align = alLeft
      Bevel.Mode = bmCustom
      TabOrder = 0
      Visible = False
      object gridH: TcxGrid
        Left = 0
        Top = 65
        Width = 283
        Height = 290
        Margins.Left = 10
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        object tvH: TcxGridTableView
          Navigator.Buttons.CustomButtons = <>
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
          OptionsView.ExpandButtonsForEmptyDetails = False
          OptionsView.GridLines = glNone
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Content = FrmPri.cxStyle39
          Styles.Selection = FrmPri.cxStyle38
          object tvHTempoUso: TcxGridColumn
            Caption = 'Tempo'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Focusing = False
            Width = 60
          end
          object tvHCobrar: TcxGridColumn
            Caption = 'Cobrar (Valor Total)'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 120
          end
          object tvHTarifa: TcxGridColumn
            Caption = 'Tarifa'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            Visible = False
            HeaderAlignmentHorz = taCenter
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
        Width = 283
        Height = 35
        Align = alTop
        Bevel.BorderSides = [fsBottom]
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsNone
        TabOrder = 1
        object cxButton1: TcxButton
          Left = 6
          Top = 8
          Width = 57
          Height = 20
          Caption = '&Ok'
          TabOrder = 0
          OnClick = cxButton1Click
        end
      end
      object lbErroH: TcxLabel
        Left = 0
        Top = 35
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
        Width = 283
        AnchorX = 142
        AnchorY = 50
      end
    end
    object LMDSimplePanel4: TLMDSimplePanel
      AlignWithMargins = True
      Left = 0
      Top = 12
      Width = 827
      Height = 331
      Margins.Left = 0
      Margins.Top = 12
      Margins.Right = 0
      Margins.Bottom = 12
      Align = alLeft
      Bevel.Mode = bmCustom
      TabOrder = 1
      object Grid: TcxGrid
        AlignWithMargins = True
        Left = 133
        Top = 0
        Width = 197
        Height = 331
        Margins.Left = 25
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        Align = alLeft
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        OnMouseLeave = GridMouseLeave
        object tvMin: TcxGridTableView
          OnMouseDown = tvMinMouseDown
          OnMouseLeave = tvMinMouseLeave
          OnMouseMove = tvMinMouseMove
          Navigator.Buttons.CustomButtons = <>
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
          OptionsView.Header = False
          OptionsView.Indicator = True
          Styles.Selection = FrmPri.cxStyle38
          object tvMinHora: TcxGridColumn
            Caption = 'Hora'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.Alignment.Horz = taRightJustify
            OnCustomDrawCell = tvMinHoraCustomDrawCell
            OnGetDataText = tvMinHoraGetDataText
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Focusing = False
            VisibleForCustomization = False
            Width = 40
          end
          object tvMinMinutos: TcxGridColumn
            Caption = 'Minutos'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.EditMask = '99;0; '
            Properties.MaxLength = 0
            Properties.OnValidate = tvMinMinutosPropertiesValidate
            OnGetDisplayText = tvMinMinutosGetDisplayText
            HeaderAlignmentHorz = taCenter
            Width = 40
          end
          object tvMinValor: TcxGridColumn
            Caption = 'Cobrar (Valor Total)'
            DataBinding.ValueType = 'Currency'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            HeaderAlignmentHorz = taCenter
          end
        end
        object GL: TcxGridLevel
          GridView = tvMin
        end
      end
      object cxLabel6: TcxLabel
        AlignWithMargins = True
        Left = 12
        Top = 0
        Margins.Left = 12
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'Quadro de Tarifas'
      end
      object cxGroupBox1: TcxGroupBox
        Left = 345
        Top = -2
        Caption = '&Op'#231#245'es'
        Style.BorderStyle = ebs3D
        TabOrder = 2
        Height = 123
        Width = 464
        object edTarExtra: TcxPopupEdit
          Left = 190
          Top = 28
          ParentFont = False
          Properties.PopupControl = panHorasExtras
          Properties.ReadOnly = True
          Properties.OnInitPopup = edTarExtraPropertiesInitPopup
          Style.BorderStyle = ebsFlat
          StyleFocused.Color = 12582911
          TabOrder = 0
          Text = 'Aplicar a tarifa da 1a. hora nas demais horas'
          Width = 261
        end
        object lbHoras: TcxLabel
          Left = 114
          Top = 29
          Caption = 'hora de uso:'
          Style.TextColor = clBlack
        end
        object edNumH: TcxSpinEdit
          Left = 70
          Top = 27
          ParentFont = False
          Properties.ImmediatePost = True
          Properties.MaxValue = 24.000000000000000000
          Properties.MinValue = 1.000000000000000000
          Properties.OnChange = edNumHPropertiesChange
          Style.BorderStyle = ebsFlat
          Style.TextStyle = []
          StyleFocused.Color = 12582911
          TabOrder = 2
          Value = 1
          Width = 42
        end
        object cxLabel2: TcxLabel
          Left = 14
          Top = 28
          Caption = 'Acima de'
          Style.TextColor = clBlack
        end
        object edMaisHoras: TcxPopupEdit
          Left = 16
          Top = 84
          Enabled = False
          ParentFont = False
          Properties.AutoSelect = False
          Properties.PopupControl = panHoras
          Properties.ReadOnly = True
          Properties.OnInitPopup = edTarExtraPropertiesInitPopup
          Style.BorderStyle = ebsFlat
          StyleFocused.Color = 12582911
          TabOrder = 4
          Text = 'Clique aqui para editar '
          OnClick = edMaisHorasEnter
          OnEnter = edMaisHorasEnter
          Width = 435
        end
        object lbAjuste: TcxLabel
          Left = 13
          Top = 64
          Caption = 'Ajuste o valor a ser cobrado por mais que 1h de uso'
          Enabled = False
        end
      end
    end
  end
  object panHorasExtras: TLMDSimplePanel
    Left = 665
    Top = 84
    Width = 297
    Height = 126
    Bevel.Mode = bmCustom
    TabOrder = 9
    Visible = False
    object rbRepetirUltima: TcxRadioButton
      Left = 15
      Top = 14
      Width = 252
      Height = 17
      Caption = 'Aplicar a tarifa da 2a. hora nas demais horas'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
      OnClick = rbRepetirUltimaClick
      LookAndFeel.Kind = lfStandard
    end
    object rbRepetirTodas: TcxRadioButton
      Tag = 1
      Left = 15
      Top = 37
      Width = 244
      Height = 17
      Caption = 'Repetir todas tarifas desde o inicio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = rbRepetirTodasClick
      LookAndFeel.Kind = lfStandard
    end
    object rbRepetirDesde: TcxRadioButton
      Tag = 2
      Left = 15
      Top = 60
      Width = 153
      Height = 17
      Caption = 'Repetir tarifas a partir da '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = rbRepetirDesdeClick
      LookAndFeel.Kind = lfStandard
    end
    object edRepetirHora: TcxSpinEdit
      Left = 165
      Top = 58
      Enabled = False
      Properties.ImmediatePost = True
      Properties.MaxValue = 24.000000000000000000
      Properties.MinValue = 1.000000000000000000
      Style.BorderStyle = ebs3D
      StyleFocused.Color = 12582911
      StyleFocused.TextStyle = [fsBold]
      TabOrder = 3
      Value = 2
      Width = 43
    end
    object cxLabel14: TcxLabel
      Left = 210
      Top = 60
      Caption = 'a. hora'
      Style.TextColor = clBlack
    end
    object btnOkTarExtra: TcxButton
      Left = 20
      Top = 88
      Width = 61
      Height = 21
      Cursor = crHandPoint
      Caption = '&Ok'
      TabOrder = 5
      OnClick = btnOkTarExtraClick
    end
    object btnCancelarTarExtra: TcxButton
      Left = 93
      Top = 88
      Width = 61
      Height = 21
      Cursor = crHandPoint
      Caption = '&Cancelar'
      TabOrder = 6
      OnClick = btnCancelarTarExtraClick
    end
  end
  object BarMgr: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
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
    ImageOptions.LargeImages = dmImagens.im24
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    UseSystemFont = False
    Left = 469
    Top = 200
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
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.Color = 12582911
    StyleFocused.TextColor = clBlack
    StyleFocused.TextStyle = [fsBold]
    Left = 368
    Top = 408
    PixelsPerInch = 96
  end
  object cxEditRepository1: TcxEditRepository
    Left = 440
    Top = 200
    object tvCurEdit_ReadOnly: TcxEditRepositoryCurrencyItem
      Properties.ReadOnly = True
      Properties.UseDisplayFormatWhenEditing = True
    end
    object tvCurEdit: TcxEditRepositoryCurrencyItem
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
    HintStyleClassName = 'TcxHintStyle'
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
  object pmDiv: TPopupMenu
    Left = 132
    Top = 184
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
    Left = 344
    Top = 184
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
