object FrmCorrigirOS: TFrmCorrigirOS
  Left = 0
  Top = 0
  Caption = 'Corrigir Projeto / Fases da OS'
  ClientHeight = 344
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 123
    Width = 552
    Height = 172
    Align = alClient
    TabOrder = 0
    ExplicitTop = 83
    ExplicitWidth = 551
    ExplicitHeight = 191
    ClientRectBottom = 172
    ClientRectRight = 552
    ClientRectTop = 0
  end
  object LMDSimplePanel1: TLMDSimplePanel
    AlignWithMargins = True
    Left = 5
    Top = 5
    Width = 542
    Height = 89
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    Bevel.Mode = bmEdge
    TabOrder = 1
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 551
    object cxLabel1: TcxLabel
      Left = 21
      Top = 18
      Caption = 'Projeto Atual'
    end
    object cxLabel2: TcxLabel
      Left = 21
      Top = 50
      Caption = 'Novo Projeto'
    end
    object edNovoProj: TcxLookupComboBox
      Left = 94
      Top = 49
      Properties.GridMode = True
      Properties.ImmediatePost = True
      Properties.IncrementalFiltering = False
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Nome'
        end>
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = DM.dsProj
      Properties.OnCloseUp = edNovoProjPropertiesCloseUp
      Properties.OnPopup = edNovoProjPropertiesPopup
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 2
      Width = 251
    end
    object edProjAtual: TcxTextEdit
      Left = 95
      Top = 16
      Enabled = False
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 3
      Text = 'edProjAtual'
      Width = 249
    end
  end
  object LMDSimplePanel2: TLMDSimplePanel
    Left = 0
    Top = 295
    Width = 552
    Height = 49
    Align = alBottom
    Bevel.BorderSides = []
    Bevel.Mode = bmEdge
    TabOrder = 2
    ExplicitTop = 291
    ExplicitWidth = 551
    object btnSalvar: TcxButton
      Left = 13
      Top = 12
      Width = 75
      Height = 25
      Caption = '&Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnSalvarClick
      LookAndFeel.NativeStyle = True
    end
    object cxButton1: TcxButton
      Left = 100
      Top = 12
      Width = 75
      Height = 25
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = cxButton1Click
      LookAndFeel.NativeStyle = True
    end
  end
  object Grid: TcxGrid
    AlignWithMargins = True
    Left = 5
    Top = 128
    Width = 542
    Height = 162
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    TabOrder = 3
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = True
    ExplicitLeft = 0
    ExplicitTop = 131
    object TV: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataModeController.GridMode = True
      DataController.DataSource = DS
      DataController.Filter.MaxValueListCount = 1000
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Filtering.ColumnPopup.MaxDropDownItemCount = 12
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      Preview.AutoHeight = False
      Preview.MaxLineCount = 10
      Preview.Visible = True
      object TVHoras1: TcxGridDBColumn
        DataBinding.FieldName = 'Horas'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DateButtons = [btnClear, btnToday]
        Properties.DateOnError = deToday
        Properties.InputKind = ikRegExpr
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Options.Focusing = False
        Width = 52
      end
      object TVNomeFase1: TcxGridDBColumn
        Caption = 'Fase Atual'
        DataBinding.FieldName = 'NomeFase'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 60
        Properties.ReadOnly = True
        Options.Filtering = False
        Options.Focusing = False
        Width = 239
      end
      object TVColumn1: TcxGridDBColumn
        Caption = 'Nova Fase'
        DataBinding.FieldName = 'NomeNovaFase'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Caption = 'Editar'
            Default = True
            Kind = bkText
            Width = 64
          end>
        Properties.OnButtonClick = TVColumn1PropertiesButtonClick
        Options.ShowEditButtons = isebAlways
        Width = 248
      end
    end
    object GL: TcxGridLevel
      GridView = TV
    end
  end
  object cxLabel3: TcxLabel
    Left = 0
    Top = 99
    Align = alTop
    AutoSize = False
    Caption = 'Apontamentos'
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taBottomJustify
    Style.BorderStyle = ebsNone
    Style.TextStyle = [fsBold]
    ExplicitTop = 89
    ExplicitWidth = 551
    Height = 24
    Width = 552
  end
  object MT: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
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
    Left = 96
    Top = 168
    object MTHoras: TDateTimeField
      FieldName = 'Horas'
      DisplayFormat = 'hh:mm'
    end
    object MTFase: TStringField
      FieldName = 'Fase'
      Size = 12
    end
    object MTItem: TIntegerField
      FieldName = 'Item'
    end
    object MTNomeFase: TStringField
      FieldName = 'NomeFase'
      Size = 50
    end
    object MTNovaFase: TStringField
      FieldName = 'NovaFase'
      Size = 12
    end
    object MTNomeNovaFase: TStringField
      FieldName = 'NomeNovaFase'
      Size = 50
    end
  end
  object DS: TDataSource
    DataSet = MT
    Left = 176
    Top = 168
  end
end
