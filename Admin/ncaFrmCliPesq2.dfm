object FrmCliPesq2: TFrmCliPesq2
  Left = 300
  Top = 420
  Caption = 'Selecione um cliente'
  ClientHeight = 485
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 192
    Top = 288
    Width = 33
    Height = 13
    Caption = 'Label1'
  end
  object panBusca: TLMDSimplePanel
    AlignWithMargins = True
    Left = 7
    Top = 7
    Width = 720
    Height = 54
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    Margins.Bottom = 7
    Align = alTop
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 0
    ExplicitWidth = 706
    object edBusca: TcxTextEdit
      AlignWithMargins = True
      Left = 0
      Top = 23
      Cursor = crHandPoint
      OnFocusChanged = edBuscaFocusChanged
      ParentFont = False
      Properties.OnChange = edBuscaPropertiesChange
      Properties.OnEditValueChanged = edBuscaPropertiesEditValueChanged
      Style.BorderStyle = ebsFlat
      Style.Color = clWhite
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.HotTrack = False
      Style.LookAndFeel.Kind = lfFlat
      Style.StyleController = FrmPri.cxEditStyleController1
      Style.TextColor = clBlack
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.BorderStyle = ebsFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.TextColor = clBlue
      StyleHot.BorderStyle = ebsNone
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 1
      Text = 'Jo'#227'o Lucio Borges'
      OnEnter = edBuscaEnter
      OnKeyDown = edBuscaKeyDown
      Width = 446
    end
    object btnCancel: TcxButton
      Left = 533
      Top = 23
      Width = 70
      Height = 27
      Cancel = True
      Caption = '&Cancelar'
      TabOrder = 0
      OnClick = btnCancelClick
      LookAndFeel.Kind = lfFlat
      OptionsImage.ImageIndex = 66
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.AllowAllUp = True
      SpeedButtonOptions.Flat = True
      SpeedButtonOptions.Transparent = True
    end
    object panDigite: TLMDSimplePanel
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 446
      Height = 21
      Margins.Left = 60
      Margins.Top = 22
      Margins.Bottom = 22
      Bevel.Mode = bmCustom
      ParentColor = True
      TabOrder = 2
      object lbDigiteProduto: TcxLabel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 0
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'Localizar por:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clGray
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        Properties.Alignment.Vert = taVCenter
        OnClick = lbDigiteProdutoClick
        ExplicitLeft = 118
        AnchorY = 11
      end
      object lbUsername: TcxLabel
        Tag = 1
        AlignWithMargins = True
        Left = 120
        Top = 0
        Cursor = crHandPoint
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 6
        Margins.Bottom = 0
        Align = alLeft
        Caption = '&Username'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clGray
        Style.TextStyle = []
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleHot.TextColor = clBlue
        Properties.Alignment.Vert = taVCenter
        OnClick = lbNomeClick
        ExplicitLeft = 238
        AnchorY = 11
      end
      object lbCodigo: TcxLabel
        Tag = 2
        AlignWithMargins = True
        Left = 186
        Top = 0
        Cursor = crHandPoint
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 6
        Margins.Bottom = 0
        Align = alLeft
        Caption = '&C'#243'digo'
        FocusControl = edBusca
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clGray
        Style.TextStyle = []
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleHot.TextColor = clBlue
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        OnClick = lbNomeClick
        ExplicitLeft = 304
        AnchorY = 11
      end
      object lbNome: TcxLabel
        AlignWithMargins = True
        Left = 76
        Top = 0
        Cursor = crHandPoint
        Margins.Top = 0
        Margins.Right = 6
        Margins.Bottom = 0
        Align = alLeft
        Caption = '&Nome'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clBlack
        Style.TextStyle = [fsUnderline]
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleHot.TextColor = clBlue
        Properties.Alignment.Vert = taVCenter
        OnClick = lbNomeClick
        ExplicitLeft = 194
        AnchorY = 11
      end
      object lbNovo: TcxLabel
        AlignWithMargins = True
        Left = 398
        Top = 0
        Cursor = crHandPoint
        Margins.Left = 2
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alRight
        Caption = 'Novo (F5)'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.HotTrack = True
        Style.TextColor = clBlue
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleHot.BorderStyle = ebsNone
        StyleHot.TextStyle = [fsUnderline]
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        OnClick = lbNovoClick
        ExplicitLeft = 391
        AnchorY = 11
      end
      object lbEditar: TcxLabel
        AlignWithMargins = True
        Left = 346
        Top = 0
        Cursor = crHandPoint
        Margins.Left = 2
        Margins.Top = 0
        Margins.Right = 20
        Margins.Bottom = 0
        Align = alRight
        Caption = 'Editar'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.HotTrack = True
        Style.TextColor = clBlue
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleHot.BorderStyle = ebsNone
        StyleHot.TextStyle = [fsUnderline]
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        OnClick = imgEditClick
        ExplicitLeft = 338
        AnchorY = 11
      end
    end
    object btnOk: TcxButton
      Left = 452
      Top = 25
      Width = 75
      Height = 25
      Caption = '&Ok'
      Default = True
      ModalResult = 1
      TabOrder = 3
      OnClick = btnOkClick
      LookAndFeel.Kind = lfFlat
    end
  end
  object Grid: TcxGrid
    AlignWithMargins = True
    Left = 7
    Top = 68
    Width = 549
    Height = 410
    Margins.Left = 7
    Margins.Top = 0
    Margins.Right = 7
    Margins.Bottom = 7
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnEnter = GridEnter
    OnExit = GridExit
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    RootLevelOptions.DetailFrameColor = clSilver
    ExplicitLeft = 0
    ExplicitTop = 80
    ExplicitWidth = 913
    ExplicitHeight = 405
    object TV: TcxGridDBTableView
      OnDblClick = TVDblClick
      OnKeyUp = TVKeyUp
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.Visible = True
      OnCustomDrawCell = TVCustomDrawCell
      OnFocusedRecordChanged = TVFocusedRecordChanged
      DataController.DataModeController.GridMode = True
      DataController.DataSource = dsCli
      DataController.Filter.MaxValueListCount = 1000
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Filter.Active = True
      DataController.Filter.AutoDataSetFilter = True
      DataController.Filter.SupportedLike = False
      DataController.KeyFieldNames = 'Codigo'
      DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <
        item
          Links = <>
          SummaryItems.Separator = ', '
          SummaryItems = <
            item
              Kind = skCount
            end>
        end>
      Filtering.ColumnPopup.MaxDropDownItemCount = 12
      OptionsBehavior.ImmediateEditor = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Appending = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.NoDataToDisplayInfoText = '<Voc'#234' ainda n'#227'o cadastrou nenhum cliente>'
      OptionsView.GridLineColor = 15724527
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      OptionsView.IndicatorWidth = 0
      Preview.AutoHeight = False
      Styles.Header = cxStyle3
      OnColumnPosChanged = TVColumnPosChanged
      OnColumnSizeChanged = TVColumnPosChanged
      OnCustomDrawColumnHeader = TVCustomDrawColumnHeader
      object TVNome: TcxGridDBColumn
        DataBinding.FieldName = 'Nome'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 40
        Properties.ReadOnly = False
        FooterAlignmentHorz = taCenter
        Width = 313
      end
      object TVUsername: TcxGridDBColumn
        DataBinding.FieldName = 'Username'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 40
        Properties.ReadOnly = False
        Width = 133
      end
      object TVCodigo: TcxGridDBColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'ID'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.MaxLength = 0
        Properties.ReadOnly = False
        HeaderAlignmentHorz = taCenter
        Width = 70
      end
      object TVCredito: TcxGridDBColumn
        Caption = 'Cr'#233'dito'
        DataBinding.FieldName = 'Minutos'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.Alignment.Horz = taCenter
        OnGetDisplayText = TVCreditoGetDisplayText
        HeaderAlignmentHorz = taCenter
      end
      object TVValorCred: TcxGridDBColumn
        Caption = 'Cred. Valor'
        DataBinding.FieldName = 'ValorCred'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 73
      end
      object TVCredPromo: TcxGridDBColumn
        Caption = 'Cr'#233'd.Promo'
        DataBinding.FieldName = 'Passaportes'
        PropertiesClassName = 'TcxTextEditProperties'
        OnGetDisplayText = TVCredPromoGetDisplayText
        HeaderAlignmentHorz = taCenter
        Width = 74
      end
      object TVIsento: TcxGridDBColumn
        Caption = 'Tipo'
        DataBinding.FieldName = 'Isento'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Items = <
          item
            Description = 'Normal'
            Value = False
          end
          item
            Description = 'Acesso Gr'#225'tis'
            Value = True
          end>
        OnCustomDrawCell = TVIsentoCustomDrawCell
        HeaderAlignmentHorz = taCenter
        MinWidth = 16
        Width = 87
      end
      object TVDebito: TcxGridDBColumn
        Caption = 'D'#233'bito'
        DataBinding.FieldName = 'Debito'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
        Properties.ReadOnly = False
        OnCustomDrawCell = TVDebitoCustomDrawCell
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        MinWidth = 69
        Options.Editing = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Width = 69
      end
      object TVDataNasc: TcxGridDBColumn
        Caption = 'Data Nasc.'
        DataBinding.FieldName = 'DataNasc'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DateButtons = [btnClear, btnToday]
        Properties.DateOnError = deToday
        Properties.SaveTime = False
        Properties.ShowTime = False
        HeaderAlignmentHorz = taCenter
        Width = 111
      end
    end
    object TVFor: TcxGridDBTableView
      OnDblClick = TVDblClick
      Navigator.Buttons.CustomButtons = <>
      DataController.DataModeController.GridMode = True
      DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.NoDataToDisplayInfoText = '<Ainda n'#227'o foi cadastrado nenhum fornecedor>'
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object TVForNome: TcxGridDBColumn
        DataBinding.FieldName = 'Nome'
      end
    end
    object GL: TcxGridLevel
      GridView = TV
    end
  end
  object lbSize: TcxLabel
    Left = 152
    Top = 328
    Caption = 'Size'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -21
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object pgFoto: TcxPageControl
    AlignWithMargins = True
    Left = 563
    Top = 68
    Width = 164
    Height = 417
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 7
    Margins.Bottom = 0
    Align = alRight
    Color = 14869218
    Focusable = False
    ParentBackground = False
    ParentColor = False
    TabOrder = 3
    Visible = False
    Properties.ActivePage = tsComFoto
    Properties.CustomButtons.Buttons = <>
    Properties.HideTabs = True
    ExplicitLeft = 549
    ClientRectBottom = 417
    ClientRectRight = 164
    ClientRectTop = 0
    object tsSemFoto: TcxTabSheet
      Caption = 'tsSemFoto'
      Color = clBtnFace
      ImageIndex = 0
      ParentColor = False
      ExplicitWidth = 97
      ExplicitHeight = 78
      object imgSemFoto: TMyImage
        Left = 0
        Top = 0
        Width = 164
        Height = 105
        Cursor = crHandPoint
        Align = alTop
        OnClick = imgSemFotoClick
        MouseOverDrawMode = idmNormal
        MouseOffDrawMode = idmFaded
        MouseDownDrawMode = idmGrayScale
        ImageList = cxImageList1
        ImageIndex = 0
        Colorize = False
        ExplicitWidth = 97
      end
    end
    object tsComFoto: TcxTabSheet
      Caption = 'tsComFoto'
      Color = clBtnFace
      ImageIndex = 1
      ParentColor = False
      ExplicitWidth = 97
      object edFoto: TcxDBImage
        Left = 0
        Top = 0
        Cursor = crHandPoint
        Align = alTop
        DataBinding.DataField = 'Foto'
        DataBinding.DataSource = dsCli
        ParentColor = True
        Properties.GraphicClassName = 'TdxSmartImage'
        Properties.GraphicTransparency = gtTransparent
        Properties.ImmediatePost = True
        Properties.ReadOnly = True
        Properties.ShowFocusRect = False
        Properties.Stretch = True
        Style.BorderColor = clBtnFace
        Style.BorderStyle = ebsFlat
        Style.HotTrack = False
        Style.TransparentBorder = False
        TabOrder = 0
        OnClick = imgEditClick
        Height = 122
        Width = 164
      end
    end
  end
  object Tab: TnxTable
    Database = Dados.db
    Timeout = 10000
    FilterOptions = [foCaseInsensitive]
    TableName = 'Cliente'
    IndexName = 'IFornecedorNome'
    Left = 40
    Top = 176
    object TabNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object TabEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object TabBairro: TStringField
      FieldName = 'Bairro'
    end
    object TabCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object TabUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object TabCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object TabSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object TabObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TabCpf: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object TabRg: TStringField
      FieldName = 'Rg'
      Size = 14
    end
    object Tabemail: TMemoField
      FieldName = 'email'
      BlobType = ftMemo
    end
    object TabUltVisita: TDateTimeField
      DisplayLabel = 'U. Visita'
      FieldName = 'UltVisita'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object TabIsento: TBooleanField
      FieldName = 'Isento'
      DisplayValues = 'Sim;N'#227'o'
    end
    object TabUsername: TStringField
      FieldName = 'Username'
      Size = 40
    end
    object TabSenha: TStringField
      FieldName = 'Senha'
    end
    object TabTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object TabDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object TabEscola: TStringField
      FieldName = 'Escola'
      Size = 40
    end
    object TabNickName: TStringField
      FieldName = 'NickName'
      Size = 30
    end
    object TabDataNasc: TDateTimeField
      FieldName = 'DataNasc'
    end
    object TabCelular: TStringField
      FieldName = 'Celular'
      Size = 15
    end
    object TabTemDebito: TBooleanField
      FieldName = 'TemDebito'
    end
    object TabAlteradoEm: TDateTimeField
      FieldName = 'AlteradoEm'
    end
    object TabIncluidoPor: TStringField
      FieldName = 'IncluidoPor'
      Size = 10
    end
    object TabAlteradoPor: TStringField
      FieldName = 'AlteradoPor'
      Size = 10
    end
    object TabTipoAcessoPref: TIntegerField
      FieldName = 'TipoAcessoPref'
    end
    object TabIncluidoEm: TDateTimeField
      FieldName = 'IncluidoEm'
    end
    object TabPai: TStringField
      FieldName = 'Pai'
      Size = 40
    end
    object TabMae: TStringField
      FieldName = 'Mae'
      Size = 40
    end
    object TabEscolaHI: TDateTimeField
      FieldName = 'EscolaHI'
    end
    object TabEscolaHF: TDateTimeField
      FieldName = 'EscolaHF'
    end
    object TabLimiteDebito: TCurrencyField
      FieldName = 'LimiteDebito'
    end
    object TabInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object TabFoto: TGraphicField
      FieldName = 'Foto'
      BlobType = ftGraphic
    end
    object TabID: TAutoIncField
      FieldName = 'ID'
    end
    object TabMinutos: TFloatField
      FieldName = 'Minutos'
    end
    object TabMinutosUsados: TFloatField
      FieldName = 'MinutosUsados'
    end
    object TabMinutosIniciais: TFloatField
      FieldName = 'MinutosIniciais'
    end
    object TabValorCred: TCurrencyField
      FieldName = 'ValorCred'
    end
    object TabHP1: TIntegerField
      FieldName = 'HP1'
    end
    object TabHP2: TIntegerField
      FieldName = 'HP2'
    end
    object TabHP3: TIntegerField
      FieldName = 'HP3'
    end
    object TabHP4: TIntegerField
      FieldName = 'HP4'
    end
    object TabHP5: TIntegerField
      FieldName = 'HP5'
    end
    object TabHP6: TIntegerField
      FieldName = 'HP6'
    end
    object TabHP7: TIntegerField
      FieldName = 'HP7'
    end
    object TabNaoGuardarCredito: TBooleanField
      FieldName = 'NaoGuardarCredito'
    end
    object TabPermiteLoginSemCred: TBooleanField
      FieldName = 'PermiteLoginSemCred'
    end
    object TabPassaportes: TFloatField
      FieldName = 'Passaportes'
    end
    object TabTitEleitor: TStringField
      FieldName = 'TitEleitor'
      Size = 13
    end
    object TabFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
    object TabFidTotal: TFloatField
      FieldName = 'FidTotal'
    end
    object TabFidResg: TFloatField
      FieldName = 'FidResg'
    end
    object TabAniversario: TStringField
      FieldName = 'Aniversario'
      Size = 4
    end
    object TabCotaImpEspecial: TBooleanField
      FieldName = 'CotaImpEspecial'
    end
    object TabCotaImpDia: TIntegerField
      FieldName = 'CotaImpDia'
    end
    object TabCotaImpMes: TIntegerField
      FieldName = 'CotaImpMes'
    end
    object TabSemFidelidade: TBooleanField
      FieldName = 'SemFidelidade'
    end
    object TabCHorario: TIntegerField
      FieldName = 'CHorario'
    end
    object TabOpCHorario: TWordField
      FieldName = 'OpCHorario'
    end
    object TabFornecedor: TBooleanField
      FieldName = 'Fornecedor'
    end
  end
  object dsCli: TDataSource
    DataSet = Tab
    Left = 72
    Top = 176
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 32
    Top = 96
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 8454143
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clGray
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 288
    Top = 232
    object aaaa1: TMenuItem
      Caption = 'aaaa'
    end
    object bbbb1: TMenuItem
      Caption = 'bbbb'
    end
  end
  object IMgs: TcxImageList
    Height = 24
    Width = 24
    FormatVersion = 1
    DesignInfo = 15729032
    ImageInfo = <
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000130000
          00420000006B000000D4000000D40000006B0000004200000013000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000002D00000097000000E40000
          00FF000000FF000000FF000000FF000000FF000000FF000000E4000000970000
          002D000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000060000007F000000F2000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00F20000007F0000000600000000000000000000000000000000000000000000
          0000000000000000000E000000AE000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000AE0000000E000000000000000000000000000000000000
          000000000006000000AE000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FC000000FD000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000AE000000060000000000000000000000000000
          00000000007C000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000AD0000003100000034000000BE000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF0000007C0000000000000000000000000000
          0028000000F3000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF0000006200000000000000000000007A000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000F30000002800000000000000000000
          0094000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF0000006600000000000000000000007D000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF0000009400000000000000100000
          00E3000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF0000006700000000000000000000007E000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000E3000000100000003E0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF0000005D000000000000000000000074000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF0000003E000000650000
          00FF000000FF000000FF000000FF000000B10000007500000074000000740000
          00670000000E0000000000000000000000150000006C00000074000000740000
          0075000000BD000000FF000000FF000000FF000000FF000000650000008A0000
          00FF000000FF000000FF000000F8000000230000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000037000000FF000000FF000000FF000000FF0000008A000000890000
          00FF000000FF000000FF000000F8000000220000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000036000000FF000000FF000000FF000000FF00000089000000650000
          00FF000000FF000000FF000000FF000000AE0000007000000070000000700000
          00630000000D0000000000000000000000130000006700000070000000700000
          0071000000BA000000FF000000FF000000FF000000FF000000650000003D0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF0000005C000000000000000000000073000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF0000003D0000000F0000
          00E2000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF0000006700000000000000000000007E000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000E20000000F000000000000
          0092000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF0000006600000000000000000000007D000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF0000009200000000000000000000
          0027000000F2000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF0000006200000000000000000000007A000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000F20000002700000000000000000000
          000000000079000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000AB0000002C0000002F000000BC000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000790000000000000000000000000000
          000000000005000000AB000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FA000000FB000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000AB000000050000000000000000000000000000
          0000000000000000000D000000AA000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000AA0000000D000000000000000000000000000000000000
          00000000000000000000000000050000007B000000F0000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00F00000007B0000000500000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000002A00000093000000E10000
          00FF000000FF000000FF000000FF000000FF000000FF000000E1000000930000
          002A000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000110000
          003E000000660000009B0000009B000000660000003E00000011000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          20000000000000090000000000000000000000000000000000000000003B0000
          003A000000050000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000003A0000
          00F9000000D20000008C0000003C000000080000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000060000
          00D6000000DB000000CE000000F8000000DD0000009300000041000000090000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          008D000000CD00000005000000300000007D000000CD000000F1000000CD0000
          002B000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          003B000000FB0000002D00000000000000000000000000000074000000FF0000
          00DD0000002B0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0008000000E00000007C00000000000000000000004B000000ED000000FF0000
          00FF000000DC0000002B00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000094000000CF000000000000004B000000F2000000FF000000FF0000
          00FF000000FF000000DC0000002A000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000040000000F600000074000000F0000000FF000000FF000000FF0000
          00FF000000FF000000FF000000DC0000002B0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000A000000D0000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000DC0000002B00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000002B000000DD000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000DC0000002B000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000002B000000DC000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000DC0000002B0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000002B000000DC000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000DC0000
          002B000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000002B000000DC000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00DC0000002B0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000002B000000DC0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000DC0000002B00000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000002B0000
          00DC000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000DC0000002B000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          002B000000DC000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000DC0000002B0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000002B000000DC000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000DC0000002B00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000002A000000DC000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000E00000002C000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000002B000000DC000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000DB00000029000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000002B000000DC000000FF000000FF0000
          00FF000000FF000000FF000000FF000000D70000002500000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000002B000000DC000000FF0000
          00FF000000FF000000FF000000D7000000250000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000002B000000DC0000
          00FF000000FF000000D700000025000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000002B0000
          00E0000000DB0000002500000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          002B000000270000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000008A0000
          00E3000000E1000000E1000000E1000000E1000000E1000000E1000000E10000
          00E1000000E1000000E1000000E1000000E1000000E1000000C60000000B0000
          00000000000000000000000000000000000000000000000000000000009F0000
          00FF000000F8000000F5000000F5000000F5000000F5000000F5000000F50000
          00F5000000F5000000F5000000F5000000F5000000FE000000E20000000D0000
          00000000000000000000000000000000000000000000000000000000009D0000
          00FF000000810000004D0000004D0000004D0000004D0000004D0000004D0000
          004D0000004D0000004D0000004D0000004F000000E1000000E40000000D0000
          00000000000000000000000000000000000000000000000000000000009D0000
          00FF000000460000000000000000000000030000001100000008000000010000
          000000000000000000000000000000000000000000D2000000E60000000D0000
          00000000000000000000000000000000000000000000000000000000009D0000
          00FF0000004C000000000000000000000016000000960000005E000000270000
          001200000007000000000000000000000003000000D4000000E60000000D0000
          00000000000000000000000000000000000000000000000000000000009D0000
          00FF0000004C000000000000000000000004000000C3000000FF000000DF0000
          00A1000000520000000A0000000000000003000000D5000000E70000000D0000
          00000000000000000000000000000000000000000000000000000000009D0000
          00FF0000004C00000000000000000000000000000066000000FE000000FF0000
          00FF000000F90000007E0000001300000003000000B3000000E50000000E0000
          00000000000000000000000000000000000000000000000000000000009D0000
          00FF0000004C00000000000000000000000000000025000000F0000000FF0000
          00F3000000FF000000F700000078000000120000003F000000B20000000F0000
          00000000000000000000000000000000000000000000000000000000009D0000
          00FF0000004C00000000000000000000000000000004000000B1000000FE0000
          00B9000000DF000000FF000000F500000072000000100000002D0000000A0000
          00000000000000000000000000000000000000000000000000000000009D0000
          00FF0000004C0000000000000000000000000000000000000029000000AB0000
          00B600000070000000C3000000FF000000F7000000980000001E000000000000
          00000000000000000000000000000000000000000000000000000000009D0000
          00FF0000004C00000000000000000000000000000000000000000000002F0000
          00AE000000AE00000071000000C6000000FF000000F5000000930000001C0000
          00000000000000000000000000000000000000000000000000000000009D0000
          00FF0000004C0000000000000000000000000000000000000000000000000000
          0032000000B2000000AA00000072000000C9000000FF000000F40000008F0000
          001A0000000000000000000000000000000000000000000000000000009D0000
          00FF0000004C0000000000000000000000000000000000000000000000000000
          000000000036000000B6000000A700000073000000CC000000FF000000F20000
          008A0000001700000000000000000000000000000000000000000000009D0000
          00FF0000004C0000000000000000000000000000000000000000000000000000
          0000000000000000001C00000099000000CD00000062000000B7000000FF0000
          00F8000000B10000001F000000000000000000000000000000000000009D0000
          00FF000000520000000A0000000A0000000A0000000800000000000000000000
          000000000000000000000000001E0000009E000000CB00000062000000BD0000
          00FF000000F7000000AF000000120000000000000000000000000000009E0000
          00FF000000C5000000AC000000AC000000AC0000007D00000000000000000000
          000000000000000000000000000000000020000000A2000000C7000000600000
          00CA000000FF000000AD0000000B000000020000000000000000000000970000
          00FF000000FD000000FC000000FC000000FC000000BA00000000000000000000
          000000000000000000000000000000000000000000110000009C000000D90000
          00DC000000AC0000001300000039000000A200000019000000000000002E0000
          00D3000000FF000000FF000000FF000000FF000000BA00000000000000000000
          0000000000000000000000000000000000030000000700000011000000A30000
          00B40000001600000031000000D4000000F7000000B60000001C000000030000
          0034000000D7000000FF000000FF000000FF000000B800000000000000000000
          0000000000000000000000000000000000000000008600000019000000150000
          001900000032000000D1000000FD000000FF000000ED00000036000000000000
          000300000038000000DB000000FF000000FF000000CE0000004C0000004C0000
          004C0000004C0000004C0000004C0000004D000000E0000000AA000000050000
          000000000083000000FC000000FF000000F10000005C00000007000000000000
          00000000000200000031000000DB000000FF000000FD000000F5000000F50000
          00F5000000F5000000F5000000F5000000F5000000FE000000E30000000E0000
          000000000011000000AD000000F5000000560000000400000000000000000000
          000000000000000000020000003C000000DA000000E1000000E1000000E10000
          00E1000000E1000000E1000000E1000000E1000000E1000000C60000000B0000
          0000000000000000001700000044000000040000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object cxImageList1: TcxImageList
    Height = 64
    Width = 64
    FormatVersion = 1
    DesignInfo = 22020664
    ImageInfo = <
      item
        Image.Data = {
          36400000424D3640000000000000360000002800000040000000400000000100
          2000000000000040000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000002B2B2B5C5F5F5FCA747474F7787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF727272F34B4B4B9F0000
          000000000000000000004B4B4B9F727272F3787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF7878
          78FF727272F34B4B4B9F0000000000000000000000004B4B4B9F727272F37878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF7575
          75F8606060CC2D2D2D6000000000000000000000000000000000000000000000
          0000000000002B2B2B5B787878FF787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF0000
          00000000000000000000787878FF787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF000000000000000000000000787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF2E2E2E61000000000000000000000000000000000000
          0000000000005C5C5CC4787878FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF787878FF787878FF0000
          00000000000000000000787878FF787878FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FF787878FF787878FF000000000000000000000000787878FF787878FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FF787878FF616161CE000000000000000000000000000000000000
          000000000000737373F5787878FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF787878FF787878FF0000
          00000000000000000000787878FF787878FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FF787878FF787878FF000000000000000000000000787878FF787878FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FF797979FF777777FC010101030000000000000000000000000000
          000000000000787878FF787878FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FF808080FF787878FF787878FF787878FF0000
          00000000000000000000787878FF787878FF787878FF808080FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF808080FF7878
          78FF787878FF787878FF000000000000000000000000787878FF787878FF7878
          78FF808080FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FF7D7D7DFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FF787878FF787878FF727272F34B4B4B9F0000
          000000000000000000004B4B4B9F727272F3787878FF787878FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF787878FF7878
          78FF727272F34B4B4B9F0000000000000000000000004B4B4B9F727272F37878
          78FF787878FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FF787878FF787878FF00000000000000000000
          000000000000000000000000000000000000787878FF787878FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF787878FF7878
          78FF000000000000000000000000000000000000000000000000000000007878
          78FF787878FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FF787878FF787878FF00000000000000000000
          000000000000000000000000000000000000787878FF787878FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF787878FF7878
          78FF000000000000000000000000000000000000000000000000000000007878
          78FF787878FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FF787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF7878
          78FF787878FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FF787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF7878
          78FF787878FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAF8FFF8F3
          EFFFF7F2EDFFF7F1ECFFF8F3EFFFFBF9F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFEFEFEFFDEC4ABFFC5996DFFB67E47FFAC6B2DFFAD6D2FFFAD6E
          30FFAD6E30FFAD6E30FFAD6E30FFAD6E2FFFAC6B2CFFB57C44FFC4966AFFDABF
          A4FFFCF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFDBBFA5FFAD6E30FFAF7134FFB17439FFB2763CFFB3783DFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB2763CFFB17439FFAF71
          35FFAB6D2DFFD3B293FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1CB
          B5FFAB6B2BFFB2773DFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB2773DFFAC6D2EFFD9BC9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC89
          57FFB1753AFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB2763CFFB57B45FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB780
          4AFFB2763BFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB2773DFFAF7034FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD8B
          58FFB1753AFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB2763CFFB57B44FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBA3
          7CFFB07438FFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB277
          3DFFAF7135FFAF7134FFB2773CFFB3783EFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB17439FFC4966AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4D0
          BCFFAE6F32FFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB2773CFFAE70
          33FFDFC8B1FFE3CFBAFFB07539FFB2763BFFB3783EFFB3783EFFB3783EFFB378
          3EFFB3783EFFAF7033FFDEC5AEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFB2773DFFB2763CFFB3783EFFB3783EFFB3783EFFB2773DFFAD6D2FFFF1E8
          DFFFFFFFFFFFFFFFFFFFF9F5F2FFB07135FFB2773DFFB3783EFFB3783EFFB378
          3EFFB2773CFFAF7337FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFE9D8C8FFAB6A2BFFB3783EFFB3783EFFB3783EFFAD6D2FFFE0C9B2FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFECDFD0FFAB6A2BFFB3783EFFB3783EFFB378
          3EFFAC6B2CFFE5D3C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFD9BCA0FFAC6B2CFFB2773DFFAE7033FFC99F76FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5B494FFAD6E30FFB2773DFFAC6C
          2DFFD6B698FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE2CDB7FFAB6928FFC5966BFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCA57EFFA96725FFDFC6
          AEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBDCCEFFC79B
          71FFB67E48FFB47C44FFC29568FFE3CEB9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5986DFFAC6C2DFFB174
          38FFB2763BFFB2763CFFB17439FFAD6E30FFBB8552FFFDFDFDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5986DFFAF7134FFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB07438FFB7804AFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFE9DACAFFAC6C2EFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFAE7033FFD9BCA0FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFC69A6FFFB17439FFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB2763BFFB67F48FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFB47C44FFB2763CFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFAC6B2CFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3783FFFB2773CFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFAC6D2EFFFCFB
          F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8E5FFFB1753AFFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB2773DFFAF7337FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFDDC3A9FFAE7033FFB3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB07337FFCDA680FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB57B42FFB1753AFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB2773CFFAD6E30FFFBF8F5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0B0FFB0B0
          B0FFB0B0B0FFB0B0B0FFB0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F4EFFFB1753BFFAF7235FFB277
          3DFFB3783EFFB3783EFFB2773DFFB07338FFAD6D2EFFEDE0D4FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAB89FFAF73
          36FFAD6E2FFFAD6E30FFAD6E2FFFC89D75FFF9F5F1FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF5EDE7FFF4EBE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000787878FF787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF7E7E7EFF787878FF0505050B0000000000000000000000000000
          000000000000747474F7787878FFFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFDFDFDFF7A7A7AFF777777FD020202040000000000000000000000000000
          0000000000005D5D5DC6787878FFC3C3C3FFF4F4F4FFF8F8F8FFF8F8F8FFF8F8
          F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8
          F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8
          F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8
          F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8
          F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8
          F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF4F4
          F4FFC8C8C8FF787878FF626262D0000000000000000000000000000000000000
          0000000000002B2B2B5C787878FF787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF7878
          78FF787878FF787878FF30303064000000000000000000000000000000000000
          000000000000000000002B2B2B5B5A5A5ABF6F6F6FEB727272F2727272F27272
          72F2727272F2727272F2727272F2727272F2727272F2727272F2727272F27272
          72F2727272F2727272F2727272F2727272F2727272F2727272F2727272F27272
          72F2727272F2727272F2727272F2727272F2727272F2727272F2727272F27272
          72F2727272F2727272F2727272F2727272F2727272F2727272F2727272F27272
          72F2727272F2727272F2727272F2727272F2727272F2727272F2727272F27272
          72F2727272F2727272F2727272F2727272F2727272F2727272F2727272F26F6F
          6FEB5B5B5BC12D2D2D5E00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 224
    Top = 184
  end
end
