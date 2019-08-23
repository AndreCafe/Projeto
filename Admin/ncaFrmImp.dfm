object FrmImp: TFrmImp
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  BorderWidth = 3
  Caption = 'Impress'#227'o'
  ClientHeight = 444
  ClientWidth = 543
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panCli: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 41
    Width = 543
    Height = 85
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 0
  end
  object LMDSimplePanel2: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 173
    Width = 543
    Height = 162
    Margins.Left = 0
    Margins.Top = 6
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Bevel.Mode = bmCustom
    TabOrder = 1
    object Grid: TcxGrid
      Left = 0
      Top = 0
      Width = 543
      Height = 162
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      object TV: TcxGridTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0'
            Kind = skSum
            Column = TVQuant
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object TVTipo: TcxGridColumn
          Caption = 'Tipo de Impress'#227'o'
          DataBinding.ValueType = 'Integer'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'Nome'
            end>
          Properties.ListSource = Dados.dsTipoImp
          Properties.ReadOnly = True
          Options.Editing = False
          Options.Focusing = False
          Width = 265
        end
        object TVQuant: TcxGridColumn
          Caption = 'Quantidade'
          DataBinding.ValueType = 'Word'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ImmediatePost = True
          Properties.UseLeftAlignmentOnEditing = False
          Properties.OnEditValueChanged = TVQuantPropertiesEditValueChanged
          HeaderAlignmentHorz = taCenter
          Width = 84
        end
        object TVTotal: TcxGridColumn
          Caption = 'Valor'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.ReadOnly = True
          OnGetDisplayText = TVTotalGetDisplayText
          HeaderAlignmentHorz = taRightJustify
          Options.Editing = False
          Options.Focusing = False
          Width = 97
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
  end
  object cbRecibo: TcxCheckBox
    Left = 272
    Top = 8
    AutoSize = False
    Caption = 'Emitir Recibo'
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 2
    Transparent = True
    Visible = False
    Height = 21
    Width = 84
  end
  object panTotais: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 341
    Width = 543
    Height = 103
    Margins.Left = 0
    Margins.Top = 6
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alBottom
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 3
  end
  object panDadosImp: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 131
    Width = 543
    Height = 36
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Bevel.Mode = bmEdge
    TabOrder = 8
    object LMDLabel4: TLMDLabel
      Left = 440
      Top = 72
      Width = 39
      Height = 26
      Bevel.Mode = bmCustom
      FontFX.Style = tdSunken
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Options = []
      ParentFont = False
      Visible = False
      Caption = '115'
    end
    object panGrupoTar: TLMDSimplePanel
      Left = 2
      Top = 2
      Width = 298
      Height = 32
      Align = alLeft
      Bevel.Mode = bmCustom
      TabOrder = 0
      object lbGrupoTar: TcxLabel
        AlignWithMargins = True
        Left = 5
        Top = 0
        Cursor = crHandPoint
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 6
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'Impressora'
        ParentColor = False
        ParentFont = False
        Style.Color = clWhite
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.HotTrack = True
        Style.TextColor = 6118749
        Style.IsFontAssigned = True
        StyleFocused.BorderStyle = ebsNone
        StyleHot.BorderStyle = ebsNone
        StyleHot.TextColor = clBlue
        StyleHot.TextStyle = [fsUnderline]
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        AnchorY = 16
      end
      object edImpressora: TcxTextEdit
        AlignWithMargins = True
        Left = 69
        Top = 4
        Margins.Left = 0
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        TabStop = False
        Align = alClient
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.ReadOnly = True
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        StyleFocused.BorderStyle = ebsSingle
        StyleFocused.Color = 11796479
        TabOrder = 1
        ExplicitHeight = 21
        Width = 223
      end
    end
    object panObs: TLMDSimplePanel
      Left = 300
      Top = 2
      Width = 241
      Height = 32
      Align = alClient
      Bevel.Mode = bmCustom
      TabOrder = 1
      object lbObs: TcxLabel
        AlignWithMargins = True
        Left = 5
        Top = 0
        Cursor = crHandPoint
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 6
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'P'#225'ginas detectadas automaticamente'
        ParentColor = False
        ParentFont = False
        Style.Color = clWhite
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.HotTrack = True
        Style.TextColor = 6118749
        Style.IsFontAssigned = True
        StyleFocused.BorderStyle = ebsNone
        StyleHot.BorderStyle = ebsNone
        StyleHot.TextColor = clBlue
        StyleHot.TextStyle = [fsUnderline]
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        AnchorY = 16
      end
      object edQtd: TcxTextEdit
        AlignWithMargins = True
        Left = 195
        Top = 4
        Margins.Left = 0
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        TabStop = False
        Align = alClient
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = True
        Style.BorderColor = clGray
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        StyleFocused.BorderStyle = ebsSingle
        StyleFocused.Color = 11796479
        TabOrder = 1
        Text = '115'
        ExplicitHeight = 21
        Width = 40
      end
    end
  end
  object BarMgr: TdxBarManager
    AllowReset = False
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
    ShowHintForDisabledItems = False
    SunkenBorder = True
    UseSystemFont = True
    Left = 168
    Top = 208
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
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmMaq'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmGravar'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end
        item
          Visible = True
          ItemName = 'cmRecibo'
        end>
      MultiLine = True
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
      WholeRow = True
    end
    object cmGravar: TdxBarLargeButton
      Caption = '&Salvar'
      Category = 0
      Hint = 'Pressione CTRL+ENTER de qualquer lugar da tela para Salvar'
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
    object cmMaq: TdxBarStatic
      Caption = 'Maq. 1'
      Category = 0
      Hint = 'Maq. 1'
      Style = FrmPri.cxStyle30
      Visible = ivNever
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 72
    Top = 208
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
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
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 72
    Top = 280
  end
end
