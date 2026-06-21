object FrmCli: TFrmCli
  Left = 112
  Top = 34
  Caption = 'Cliente'
  ClientHeight = 721
  ClientWidth = 1024
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PagEdicao: TcxPageControl
    Left = 0
    Top = 77
    Width = 1024
    Height = 644
    ActivePage = tsFin
    Align = alClient
    LookAndFeel.NativeStyle = True
    Style = 8
    TabOrder = 0
    ClientRectBottom = 644
    ClientRectRight = 1024
    ClientRectTop = 24
    object tsCad: TcxTabSheet
      Caption = '&1. Cadastro'
      ImageIndex = 0
      object VG: TcxDBVerticalGrid
        Left = 0
        Top = 0
        Width = 1024
        Height = 620
        BorderStyle = cxcbsNone
        Styles.StyleSheet = FrmPri.cxVerticalGridStyleSheetDevExpress
        Align = alClient
        OptionsView.RowHeaderWidth = 145
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.GoToNextCellOnTab = True
        OptionsBehavior.AllowChangeRecord = False
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        TabOrder = 0
        DataController.DataSource = dsMT
        DataController.GridMode = True
        object VGCategoryRow1: TcxCategoryRow
          Properties.Caption = 'Loja'
        end
        object VGCodigo: TcxDBEditorRow
          Properties.Caption = 'C'#243'digo'
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.DataBinding.FieldName = 'Codigo'
        end
        object VGTipoLoja: TcxDBEditorRow
          Properties.Caption = 'Tipo da Loja'
          Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
          Properties.EditProperties.Columns = 3
          Properties.EditProperties.Items = <
            item
              Caption = 'Cyber Caf'#233
              Value = 0
            end
            item
              Caption = 'Lan House'
              Value = 1
            end
            item
              Caption = 'Ambos'
              Value = 2
            end>
          Properties.DataBinding.FieldName = 'TipoLoja'
        end
        object VGLoja: TcxDBEditorRow
          Properties.Caption = 'Nome da Loja'
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditProperties.BeepOnError = True
          Properties.EditProperties.CharCase = ecUpperCase
          Properties.EditProperties.HideSelection = False
          Properties.DataBinding.FieldName = 'Loja'
        end
        object VGProprietarios: TcxDBEditorRow
          Height = 46
          Properties.Caption = 'Propriet'#225'rios'
          Properties.DataBinding.FieldName = 'Proprietarios'
        end
        object VGNumMaq: TcxDBEditorRow
          Properties.Caption = 'Quantidade de M'#225'quinas'
          Properties.DataBinding.FieldName = 'NumMaq'
        end
        object VGSenha: TcxDBEditorRow
          Properties.DataBinding.FieldName = 'Senha'
        end
        object VGGerente: TcxDBEditorRow
          Properties.DataBinding.FieldName = 'Gerente'
        end
        object VGDBEditorRow1: TcxDBEditorRow
          Height = 56
          Properties.EditPropertiesClassName = 'TcxMemoProperties'
          Properties.DataBinding.FieldName = 'Telefones'
        end
        object VGCategoryRow2: TcxCategoryRow
          Properties.Caption = 'Endere'#231'o'
        end
        object VGEndereco: TcxDBEditorRow
          Properties.Caption = 'Endere'#231'o'
          Properties.DataBinding.FieldName = 'Endereco'
        end
        object VGBairro: TcxDBEditorRow
          Height = 19
          Properties.DataBinding.FieldName = 'Bairro'
        end
        object VGDBMultiEditorRow1: TcxDBMultiEditorRow
          Properties.Editors = <
            item
              Caption = 'Pa'#237's'
              DataBinding.FieldName = 'Pais'
            end
            item
              EditPropertiesClassName = 'TcxComboBoxProperties'
              EditProperties.CharCase = ecUpperCase
              EditProperties.DropDownSizeable = True
              EditProperties.ImmediatePost = True
              EditProperties.ImmediateUpdateText = True
              EditProperties.Items.Strings = (
                'AC'
                'AL'
                'AM'
                'AP'
                'BA'
                'CE'
                'DF'
                'ES'
                'GO'
                'MA'
                'MG'
                'MS'
                'MT'
                'PA'
                'PB'
                'PE'
                'PI'
                'PR'
                'RJ'
                'RN'
                'RO'
                'RR'
                'RS'
                'SC'
                'SE'
                'SP'
                'TO')
              Width = 20
              DataBinding.FieldName = 'UF'
            end
            item
              DataBinding.FieldName = 'Cidade'
            end>
        end
        object VGCEP: TcxDBEditorRow
          Properties.DataBinding.FieldName = 'CEP'
        end
        object VGCategoryRow3: TcxCategoryRow
          Properties.Caption = 'Dados NF'
        end
        object VGDBEditorRow2: TcxDBEditorRow
          Properties.Caption = 'Raz'#227'o Social'
          Properties.DataBinding.FieldName = 'RazaoSocial'
        end
        object VGDBEditorRow3: TcxDBEditorRow
          Properties.DataBinding.FieldName = 'CNPJ'
        end
        object VGDBEditorRow4: TcxDBEditorRow
          Properties.DataBinding.FieldName = 'IE'
        end
        object VGDBEditorRow5: TcxDBEditorRow
          Height = 69
          Properties.Caption = 'Negocia'#231#227'o'
          Properties.DataBinding.FieldName = 'FormaPagto'
        end
        object VGDescrStatus: TcxDBEditorRow
          Properties.Caption = 'Status'
          Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.EditProperties.ClearKey = 46
          Properties.EditProperties.DropDownAutoSize = True
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.ListColumns = <>
          Properties.EditProperties.ListFieldIndex = -1
          Properties.EditProperties.PostPopupValueOnTab = True
          Properties.DataBinding.FieldName = 'DescrStatus'
        end
        object VGDBEditorRow6: TcxDBEditorRow
          Properties.Caption = 'Fazer novo contato em'
          Properties.EditPropertiesClassName = 'TcxDateEditProperties'
          Properties.EditProperties.DateButtons = [btnClear, btnNow, btnToday]
          Properties.DataBinding.FieldName = 'ContatarEm'
        end
      end
    end
    object tsFin: TcxTabSheet
      Caption = '&2. Financeiro'
      ImageIndex = 6
      object GridFC: TcxGrid
        Left = 0
        Top = 0
        Width = 1024
        Height = 620
        Align = alClient
        TabOrder = 0
        object tvGridFin: TcxGridDBTableView
          DataController.DataSource = DM.dsFinCli
          DataController.Filter.Options = [fcoCaseInsensitive]
          DataController.Filter.Active = True
          DataController.Filter.AutoDataSetFilter = True
          DataController.Filter.SupportedLike = False
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0.00'
              Kind = skSum
              FieldName = 'Valor'
              Column = tvGridFinValor
            end
            item
              Format = '0.00'
              Kind = skSum
              FieldName = 'ValorPago'
              Column = tvGridFinValorPago
            end>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsBehavior.AlwaysShowEditor = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsView.Navigator = True
          OptionsView.Footer = True
          OptionsView.Indicator = True
          Styles.StyleSheet = FrmPri.GridTableViewStyleSheetDevExpress
          object tvGridFinLancamento: TcxGridDBColumn
            Caption = 'Lan'#231'amento'
            PropertiesClassName = 'TcxDateEditProperties'
            Width = 100
            DataBinding.FieldName = 'Lancamento'
          end
          object tvGridFinVencimento: TcxGridDBColumn
            SortOrder = soAscending
            Width = 92
            DataBinding.FieldName = 'Vencimento'
          end
          object tvGridFinValor: TcxGridDBColumn
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Width = 93
            DataBinding.FieldName = 'Valor'
          end
          object tvGridFinPagamento: TcxGridDBColumn
            HeaderAlignmentVert = vaCenter
            Width = 91
            DataBinding.FieldName = 'Pagamento'
          end
          object tvGridFinValorPago: TcxGridDBColumn
            Caption = 'Valor Pago'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Width = 94
            DataBinding.FieldName = 'ValorPago'
          end
          object tvGridFinDescricao: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            Width = 190
            DataBinding.FieldName = 'Descricao'
          end
          object tvGridFinDoc: TcxGridDBColumn
            Width = 95
            DataBinding.FieldName = 'Doc'
          end
          object tvGridFinObs: TcxGridDBColumn
            PropertiesClassName = 'TcxMemoProperties'
            Width = 197
            DataBinding.FieldName = 'Obs'
          end
        end
        object GridFCLevel1: TcxGridLevel
          GridView = tvGridFin
        end
      end
    end
    object tsEmail: TcxTabSheet
      Caption = '&3. E-Mails'
      ImageIndex = 4
      object vgEmail: TcxDBVerticalGrid
        Left = 0
        Top = 0
        Width = 1024
        Height = 620
        BorderStyle = cxcbsNone
        Styles.StyleSheet = FrmPri.cxVerticalGridStyleSheetDevExpress
        Align = alClient
        OptionsView.RowHeaderWidth = 145
        OptionsBehavior.AllowChangeRecord = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        TabOrder = 0
        DataController.DataSource = dsMT
        DataController.GridMode = True
        object vgEmailReg: TcxDBEditorRow
          Height = 80
          Properties.Caption = 'E-mail de Registro'
          Properties.EditPropertiesClassName = 'TcxMemoProperties'
          Properties.DataBinding.FieldName = 'EmailReg'
        end
        object vgEmailTec: TcxDBEditorRow
          Height = 69
          Properties.Caption = 'E-mail T'#233'cnico'
          Properties.EditPropertiesClassName = 'TcxMemoProperties'
          Properties.DataBinding.FieldName = 'EmailTec'
        end
        object vgEmailDBEditorRow2: TcxDBEditorRow
          Height = 50
          Properties.EditPropertiesClassName = 'TcxMemoProperties'
          Properties.DataBinding.FieldName = 'Messenger'
        end
        object vgEmailDBEditorRow1: TcxDBEditorRow
          Height = 49
          Properties.EditPropertiesClassName = 'TcxMemoProperties'
          Properties.DataBinding.FieldName = 'ICQ'
        end
      end
    end
    object tsLic: TcxTabSheet
      Caption = '&4. Licen'#231'a de Uso'
      ImageIndex = 1
      object VGLic: TcxDBVerticalGrid
        Left = 0
        Top = 0
        Width = 1024
        Height = 620
        BorderStyle = cxcbsNone
        Styles.StyleSheet = FrmPri.cxVerticalGridStyleSheetDevExpress
        Align = alClient
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = True
        OptionsView.RowHeaderWidth = 116
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.GoToNextCellOnTab = True
        OptionsBehavior.AllowChangeRecord = False
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        TabOrder = 0
        DataController.DataSource = dsMT
        DataController.GridMode = True
        object VGLicCategoryRow2: TcxCategoryRow
          Properties.Caption = 'Licen'#231'a'
        end
        object VGLicSerieHD: TcxDBEditorRow
          Properties.Caption = 'N'#250'mero de S'#233'rie'
          Properties.EditPropertiesClassName = 'TcxTextEditProperties'
          Properties.EditProperties.CharCase = ecUpperCase
          Properties.DataBinding.FieldName = 'SerieHD'
        end
        object VGLicLicMaq: TcxDBEditorRow
          Properties.Caption = 'M'#225'quinas'
          Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.DataBinding.FieldName = 'LicMaq'
        end
        object vgLicTipo: TcxDBEditorRow
          Properties.Caption = 'Tipo'
          Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.EditProperties.Alignment.Horz = taLeftJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.Items = <
            item
              Description = 'Tempor'#225'ria'
              Value = 1
            end
            item
              Description = 'Definitiva'
              Value = 2
            end
            item
              Description = 'Teste Gratuito'
              Value = 3
            end
            item
              Description = 'Prospect'
              Value = 4
            end>
          Properties.DataBinding.FieldName = 'LicTipo'
        end
        object VGLicLicVenc: TcxDBEditorRow
          Properties.Caption = 'Vencimento'
          Properties.DataBinding.FieldName = 'LicVenc'
        end
        object VGLicCategoryRow1: TcxCategoryRow
          Properties.Caption = 'Contrato de Manuten'#231#227'o'
        end
        object VGLicManInicio: TcxDBEditorRow
          Properties.Caption = 'Inicio'
          Properties.DataBinding.FieldName = 'ManInicio'
        end
        object VGLicManVenc: TcxDBEditorRow
          Properties.Caption = 'Vencimento'
          Properties.DataBinding.FieldName = 'ManVenc'
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 44
    Width = 1024
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 5
    object edCodLoja: TcxDBTextEdit
      Left = 45
      Top = 4
      DataBinding.DataField = 'CodigoStr'
      DataBinding.DataSource = dsMT
      ParentFont = False
      Properties.HideSelection = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      TabOrder = 0
      OnDblClick = edCodLojaDblClick
      Width = 104
    end
    object edLic: TcxDBTextEdit
      Left = 201
      Top = 4
      DataBinding.DataField = 'LicencaStr'
      DataBinding.DataSource = dsMT
      ParentFont = False
      Properties.HideSelection = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      TabOrder = 1
      OnDblClick = edLicDblClick
      Width = 193
    end
    object cxLabel1: TcxLabel
      Left = 3
      Top = 8
      Caption = 'C'#243'digo'
      ParentFont = False
      Style.Edges = []
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Transparent = True
    end
    object cxLabel2: TcxLabel
      Left = 153
      Top = 8
      Caption = 'Licen'#231'a'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
    end
  end
  object BarMgr: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Custom 1'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmSalvarFechar
            Visible = True
          end
          item
            Item = cmCancelar
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmSalvar
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarControlContainerItem1
            Visible = True
          end>
        Name = 'Custom 1'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Images = dmImagens.Imagens
    LargeImages = FrmPri.im32
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = True
    Left = 232
    Top = 232
    DockControlHeights = (
      0
      0
      44
      0)
    object cmSalvarFechar: TdxBarLargeButton
      Caption = '&Salvar e Fechar'
      Category = 0
      Hint = 'Salvar e Fechar'
      Visible = ivAlways
      OnClick = cmSalvarFecharClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 41
      SyncImageIndex = False
      ImageIndex = 4
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 39
    end
    object cmFechar: TdxBarLargeButton
      Caption = '&Fechar'
      Category = 0
      Hint = 'Fechar'
      Visible = ivAlways
      AutoGrayScale = False
      LargeImageIndex = 37
    end
    object cmSalvar: TdxBarLargeButton
      Caption = 'S&alvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      OnClick = cmSalvarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 41
    end
    object dxBarControlContainerItem1: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = Panel1
    end
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
    OnCalcFields = MTCalcFields
    Left = 370
    Top = 199
    object MTCodigoStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'CodigoStr'
      Size = 9
      Calculated = True
    end
    object MTLicencaStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'LicencaStr'
      Size = 30
      Calculated = True
    end
    object MTSenha: TStringField
      FieldName = 'Senha'
      Size = 30
    end
    object MTCadastroEm: TDateTimeField
      FieldName = 'CadastroEm'
    end
    object MTCadastroPor: TStringField
      FieldName = 'CadastroPor'
      Size = 30
    end
    object MTAtualizadoEm: TDateTimeField
      FieldName = 'AtualizadoEm'
    end
    object MTAtualizadoPor: TStringField
      FieldName = 'AtualizadoPor'
      Size = 30
    end
    object MTLoja: TStringField
      FieldName = 'Loja'
      Size = 50
    end
    object MTRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 50
    end
    object MTPais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
    object MTCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object MTUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object MTEndereco: TMemoField
      FieldName = 'Endereco'
      BlobType = ftMemo
    end
    object MTCEP: TStringField
      FieldName = 'CEP'
      Size = 50
    end
    object MTBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object MTSerieHD: TStringField
      FieldName = 'SerieHD'
      Size = 60
    end
    object MTNumMaq: TWordField
      Alignment = taLeftJustify
      FieldName = 'NumMaq'
    end
    object MTCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 19
    end
    object MTIE: TStringField
      FieldName = 'IE'
      Size = 15
    end
    object MTObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object MTTelefones: TMemoField
      FieldName = 'Telefones'
      BlobType = ftMemo
    end
    object MTEmailReg: TMemoField
      FieldName = 'EmailReg'
      BlobType = ftMemo
    end
    object MTFormaPagto: TMemoField
      FieldName = 'FormaPagto'
      BlobType = ftMemo
    end
    object MTLicMaq: TWordField
      Alignment = taLeftJustify
      FieldName = 'LicMaq'
    end
    object MTLicTipo: TWordField
      Alignment = taLeftJustify
      FieldName = 'LicTipo'
    end
    object MTLicVenc: TDateField
      FieldName = 'LicVenc'
    end
    object MTManInicio: TDateField
      FieldName = 'ManInicio'
    end
    object MTManVenc: TDateField
      FieldName = 'ManVenc'
    end
    object MTProprietarios: TMemoField
      FieldName = 'Proprietarios'
      BlobType = ftMemo
    end
    object MTGerente: TStringField
      FieldName = 'Gerente'
      Size = 50
    end
    object MTTipoLoja: TWordField
      Alignment = taLeftJustify
      FieldName = 'TipoLoja'
    end
    object MTEmailTec: TMemoField
      FieldName = 'EmailTec'
      BlobType = ftMemo
    end
    object MTValor: TCurrencyField
      FieldName = 'Valor'
    end
    object MTValorRec: TCurrencyField
      FieldName = 'ValorRec'
    end
    object MTEmitirNF: TBooleanField
      FieldName = 'EmitirNF'
    end
    object MTMessenger: TMemoField
      FieldName = 'Messenger'
      BlobType = ftMemo
    end
    object MTICQ: TMemoField
      FieldName = 'ICQ'
      BlobType = ftMemo
    end
    object MTUVersao: TStringField
      FieldName = 'UVersao'
      Size = 10
    end
    object MTUObtemLic: TDateTimeField
      FieldName = 'UObtemLic'
    end
    object MTCodigo: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'Codigo'
    end
    object MTStatus: TIntegerField
      FieldName = 'Status'
    end
    object MTContatarEm: TDateTimeField
      FieldName = 'ContatarEm'
    end
    object MTDescrStatus: TStringField
      FieldKind = fkLookup
      FieldName = 'DescrStatus'
      LookupDataSet = DM.qStatus
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Status'
      Size = 50
      Lookup = True
    end
  end
  object dsMT: TDataSource
    DataSet = MT
    Left = 402
    Top = 199
  end
end
