object FrmPacote: TFrmPacote
  Left = 291
  Top = 231
  BorderStyle = bsDialog
  Caption = 'Pacote'
  ClientHeight = 257
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 36
    Width = 386
    Height = 221
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitTop = 32
    ExplicitHeight = 225
    object VG: TcxDBVerticalGrid
      Left = 0
      Top = 0
      Width = 386
      Height = 221
      Align = alClient
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = True
      OptionsView.CellTextMaxLineCount = 3
      OptionsView.AutoScaleBands = False
      OptionsView.PaintStyle = psDelphi
      OptionsView.GridLineColor = clBtnShadow
      OptionsView.RowHeaderMinWidth = 30
      OptionsView.RowHeaderWidth = 132
      OptionsView.ValueWidth = 125
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsData.CancelOnExit = False
      Navigator.Buttons.CustomButtons = <>
      TabOrder = 0
      DataController.DataSource = dsTab
      ExplicitHeight = 225
      Version = 1
      object VGCodigo: TcxDBEditorRow
        Expanded = False
        Properties.Caption = 'C'#243'digo'
        Properties.EditPropertiesClassName = 'TcxTextEditProperties'
        Properties.EditProperties.Alignment.Horz = taLeftJustify
        Properties.EditProperties.Alignment.Vert = taVCenter
        Properties.EditProperties.MaxLength = 0
        Properties.EditProperties.ReadOnly = False
        Properties.DataBinding.FieldName = 'Codigo'
        Visible = False
        ID = 0
        ParentID = -1
        Index = 0
        Version = 1
      end
      object VGHoras: TcxDBEditorRow
        Height = 32
        Properties.Caption = 'Tempo (minutos)'
        Properties.HeaderAlignmentVert = vaCenter
        Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
        Properties.EditProperties.Alignment.Horz = taLeftJustify
        Properties.EditProperties.Alignment.Vert = taVCenter
        Properties.EditProperties.MaxLength = 0
        Properties.EditProperties.ReadOnly = False
        Properties.DataBinding.FieldName = 'Minutos'
        ID = 1
        ParentID = -1
        Index = 1
        Version = 1
      end
      object VGValorTotal: TcxDBEditorRow
        Expanded = False
        Height = 32
        Properties.HeaderAlignmentVert = vaCenter
        Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.EditProperties.Alignment.Horz = taLeftJustify
        Properties.EditProperties.Alignment.Vert = taVCenter
        Properties.EditProperties.AssignedValues.MaxValue = True
        Properties.EditProperties.AssignedValues.MinValue = True
        Properties.EditProperties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
        Properties.EditProperties.Nullable = False
        Properties.EditProperties.ReadOnly = False
        Properties.DataBinding.FieldName = 'Valor'
        ID = 2
        ParentID = -1
        Index = 2
        Version = 1
      end
      object VGNome: TcxDBEditorRow
        Height = 32
        Properties.Caption = 'Nome do Pacote'
        Properties.HeaderAlignmentVert = vaCenter
        Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
        Properties.EditProperties.Alignment.Vert = taVCenter
        Properties.DataBinding.FieldName = 'Descr'
        ID = 3
        ParentID = -1
        Index = 3
        Version = 1
      end
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
    ImageOptions.LargeImages = dmImagens.im24
    ImageOptions.MakeDisabledImagesFaded = True
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = True
    Left = 216
    Top = 200
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
      FloatLeft = 67
      FloatTop = 344
      FloatClientWidth = 69
      FloatClientHeight = 44
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmGravar'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end>
      MultiLine = True
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Controles'
      OneOnRow = True
      Row = 0
      SizeGrip = False
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object cmGravar: TdxBarLargeButton
      Caption = '&Salvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = cmGravarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
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
  end
  object Tab: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = -1
    FieldDefs = <
      item
        Name = 'QtdTempo'
        DataType = ftInteger
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'Minutos'
        DataType = ftInteger
      end
      item
        Name = 'Descr'
        DataType = ftString
        Size = 30
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
    Left = 192
    Top = 112
    object TabQtdTempo: TIntegerField
      DisplayLabel = 'Minutos'
      FieldName = 'QtdTempo'
    end
    object TabValor: TCurrencyField
      FieldName = 'Valor'
    end
    object TabMinutos: TIntegerField
      FieldName = 'Minutos'
    end
    object TabDescr: TStringField
      FieldName = 'Descr'
      Size = 30
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 232
    Top = 114
  end
end
