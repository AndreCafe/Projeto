inherited FrmCliPesq: TFrmCliPesq
  Left = 300
  Top = 420
  Caption = '&Localizar Cliente'
  ClientHeight = 468
  ClientWidth = 913
  KeyPreview = True
  OldCreateOrder = True
  Position = poDesigned
  ExplicitWidth = 921
  ExplicitHeight = 495
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TParentedPanel
    Width = 913
    Height = 468
    ExplicitWidth = 913
    ExplicitHeight = 468
    inherited dxBarDockControl1: TdxBarDockControl
      AlignWithMargins = True
      Width = 913
      Height = 36
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 5
      ExplicitWidth = 913
      ExplicitHeight = 36
    end
    object Grid: TcxGrid
      Left = 0
      Top = 41
      Width = 913
      Height = 427
      Align = alClient
      TabOrder = 0
      OnEnter = GridEnter
      OnExit = GridExit
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      object TV: TcxGridDBTableView
        OnDblClick = TVDblClick
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
        OnEditKeyUp = TVEditKeyUp
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
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        OnColumnPosChanged = TVColumnPosChanged
        OnColumnSizeChanged = TVColumnPosChanged
        object TVNome: TcxGridDBColumn
          DataBinding.FieldName = 'Nome'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 40
          Properties.ReadOnly = False
          FooterAlignmentHorz = taCenter
          Width = 174
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
          Properties.Alignment.Horz = taRightJustify
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
        object TVInativo: TcxGridDBColumn
          Caption = 'Status'
          DataBinding.FieldName = 'Inativo'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ImmediatePost = True
          Properties.Items = <
            item
              Description = 'Ativo'
              Value = False
            end
            item
              Description = 'Inativo'
              Value = True
            end>
          OnCustomDrawCell = TVInativoCustomDrawCell
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Focusing = False
          Options.IncSearch = False
          Options.Grouping = False
          Width = 59
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
        end
        object TVTelefone: TcxGridDBColumn
          DataBinding.FieldName = 'Telefone'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 15
          Properties.ReadOnly = False
          Width = 98
        end
        object TVEscola: TcxGridDBColumn
          DataBinding.FieldName = 'Escola'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 40
          Properties.ReadOnly = False
          Width = 151
        end
        object TVCelular: TcxGridDBColumn
          DataBinding.FieldName = 'Celular'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 15
          Properties.ReadOnly = False
        end
        object TVEndereco: TcxGridDBColumn
          Caption = 'Endere'#231'o'
          DataBinding.FieldName = 'Endereco'
        end
      end
      object TVFor: TcxGridDBTableView
        OnDblClick = TVDblClick
        Navigator.Buttons.CustomButtons = <>
        OnEditKeyUp = TVEditKeyUp
        OnFocusedRecordChanged = TVFocusedRecordChanged
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
    object panBusca: TPanel
      Left = 85
      Top = 94
      Width = 388
      Height = 49
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      object edBusca: TcxMaskEdit
        Left = 11
        Top = 22
        BeepOnEnter = False
        Properties.AutoSelect = False
        Properties.MaskKind = emkRegExpr
        Properties.MaxLength = 0
        Properties.ValidateOnEnter = False
        Properties.OnChange = edBuscaPropertiesChange
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 0
        OnKeyUp = edBuscaKeyUp
        Width = 245
      end
      object rgCod: TcxRadioButton
        Left = 199
        Top = 5
        Width = 54
        Height = 17
        Caption = 'C'#243'&digo'
        TabOrder = 1
        OnClick = rgNomeClick
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
      end
      object rgUsername: TcxRadioButton
        Left = 126
        Top = 5
        Width = 69
        Height = 17
        Caption = '&Username'
        TabOrder = 2
        OnClick = rgNomeClick
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
      end
      object rgNome: TcxRadioButton
        Left = 71
        Top = 5
        Width = 49
        Height = 17
        Caption = '&Nome'
        Checked = True
        TabOrder = 3
        TabStop = True
        OnClick = rgNomeClick
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
      end
      object cxLabel1: TcxLabel
        Left = 11
        Top = 4
        Caption = 'Busca por:'
      end
      object rgFornecedor: TcxRadioButton
        Left = 262
        Top = 5
        Width = 99
        Height = 17
        Caption = 'Fornecedor'
        TabOrder = 5
        OnClick = rgNomeClick
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
      end
    end
  end
  inherited BarMgr: TdxBarManager
    ImageOptions.LargeImages = dmImagens.im24
    ImageOptions.UseLargeImagesForLargeIcons = True
    Left = 72
    Top = 232
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      Caption = 'BarraComum'
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmNovo'
        end
        item
          Visible = True
          ItemName = 'cmEditar'
        end
        item
          Visible = True
          ItemName = 'cmApagar'
        end>
    end
    inherited cmNovo: TdxBarLargeButton
      LargeImageIndex = 6
      OnClick = cmNovoClick
      AutoGrayScale = True
      ShowCaption = True
      ImageIndex = -1
    end
    inherited cmEditar: TdxBarLargeButton
      LargeImageIndex = 2
      OnClick = cmEditarClick
      AutoGrayScale = True
      ShowCaption = True
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      Visible = ivNever
      LargeImageIndex = 7
      OnClick = cmApagarClick
      AutoGrayScale = True
      ShowCaption = True
      ImageIndex = 12
    end
    inherited cmAtualizar: TdxBarLargeButton
      Visible = ivNever
      PaintStyle = psCaptionGlyph
      GlyphLayout = glTop
    end
    inherited cmExportar: TdxBarLargeButton
      Visible = ivNever
      LargeImageIndex = 47
      GlyphLayout = glTop
    end
    inherited cmImprimir: TdxBarLargeButton
      Visible = ivNever
      LargeImageIndex = 7
      GlyphLayout = glTop
      SyncImageIndex = False
      ImageIndex = 22
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    object cmOk: TdxBarLargeButton
      Caption = '&Ok'
      Category = 0
      Hint = 'Ok'
      Visible = ivAlways
      LargeImageIndex = 5
      GlyphLayout = glLeft
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      LargeImageIndex = 4
      OnClick = btnCancelarClick
      GlyphLayout = glLeft
    end
    object container_panBusca: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = panBusca
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 0
    Top = 225
  end
  inherited pmLay: TdxBarPopupMenu
    Left = 392
    Top = 178
  end
  object Tab: TnxTable
    ActiveRuntime = True
    Database = Dados.db
    Timeout = 10000
    FilterOptions = [foCaseInsensitive]
    TableName = 'Cliente'
    IndexName = 'INome'
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
  object pmTempo: TdxBarPopupMenu
    BarManager = BarMgr
    ItemLinks = <>
    UseOwnFont = False
    Left = 128
    Top = 228
  end
  object pmSenha: TdxBarPopupMenu
    BarManager = BarMgr
    ItemLinks = <>
    UseOwnFont = False
    Left = 240
    Top = 224
  end
  object PopupMenu1: TPopupMenu
    Left = 544
    Top = 408
  end
  object TimerSync: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerSyncTimer
    Left = 272
    Top = 176
  end
end
