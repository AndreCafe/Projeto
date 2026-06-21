object FrmCli: TFrmCli
  Left = 112
  Top = 34
  Caption = 'Cliente'
  ClientHeight = 563
  ClientWidth = 752
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PagEdicao: TcxPageControl
    Left = 0
    Top = 0
    Width = 752
    Height = 563
    ActivePage = tsCad
    Align = alClient
    HideTabs = True
    LookAndFeel.NativeStyle = True
    Style = 6
    TabOrder = 0
    ClientRectBottom = 563
    ClientRectRight = 752
    ClientRectTop = 0
    object tsCad: TcxTabSheet
      Caption = '&1. Cadastro'
      ImageIndex = 0
      object VG: TcxDBVerticalGrid
        Left = 0
        Top = 197
        Width = 752
        Height = 366
        BorderStyle = cxcbsNone
        Align = alClient
        OptionsView.PaintStyle = psDelphi
        OptionsView.RowHeaderWidth = 155
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
          Styles.Header = FrmPri.cxStyle23
        end
        object VGDBMultiEditorRow4: TcxDBMultiEditorRow
          Properties.Editors = <
            item
              Caption = 'Tipo Loja'
              EditPropertiesClassName = 'TcxRadioGroupProperties'
              EditProperties.Columns = 3
              EditProperties.ImmediatePost = True
              EditProperties.Items = <
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
              DataBinding.FieldName = 'TipoLoja'
            end
            item
              DataBinding.FieldName = 'Gerente'
            end>
        end
        object VGDBMultiEditorRow5: TcxDBMultiEditorRow
          Height = 50
          Properties.Editors = <
            item
              Caption = 'Propriet'#225'rios'
              EditPropertiesClassName = 'TcxMemoProperties'
              DataBinding.FieldName = 'Proprietarios'
            end
            item
              EditPropertiesClassName = 'TcxMemoProperties'
              DataBinding.FieldName = 'Telefones'
            end>
        end
        object VGCategoryRow2: TcxCategoryRow
          Properties.Caption = 'Endere'#231'o'
          Styles.Header = FrmPri.cxStyle23
        end
        object VGDBMultiEditorRow3: TcxDBMultiEditorRow
          Properties.Editors = <
            item
              Caption = 'End.'
              DataBinding.FieldName = 'Endereco'
            end
            item
              DataBinding.FieldName = 'Bairro'
            end
            item
              Caption = 'Pa'#237's'
              DataBinding.FieldName = 'Pais'
            end>
        end
        object VGDBMultiEditorRow1: TcxDBMultiEditorRow
          Properties.Editors = <
            item
              DataBinding.FieldName = 'Cidade'
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
              DataBinding.FieldName = 'UF'
            end
            item
              DataBinding.FieldName = 'CEP'
            end>
        end
        object VGCategoryRow3: TcxCategoryRow
          Properties.Caption = 'NF / Negocia'#231#227'o'
          Styles.Header = FrmPri.cxStyle23
        end
        object VGDBEditorRow2: TcxDBEditorRow
          Properties.Caption = 'Raz'#227'o Social'
          Properties.DataBinding.FieldName = 'RazaoSocial'
        end
        object VGDBMultiEditorRow6: TcxDBMultiEditorRow
          Properties.Editors = <
            item
              Caption = 'Status'
              EditPropertiesClassName = 'TcxLookupComboBoxProperties'
              EditProperties.ImmediatePost = True
              EditProperties.ListColumns = <>
              EditProperties.ListFieldIndex = -1
              DataBinding.FieldName = 'DescrStatus'
            end
            item
              DataBinding.FieldName = 'CNPJ'
            end
            item
              Caption = 'I.E'
              DataBinding.FieldName = 'IE'
            end>
        end
        object VGDBEditorRow5: TcxDBEditorRow
          Height = 60
          Properties.Caption = 'Hist'#243'rico Negocia'#231#227'o'
          Properties.DataBinding.FieldName = 'FormaPagto'
        end
        object VGCategoryRow4: TcxCategoryRow
          Properties.Caption = 'E-Mails'
          Styles.Header = FrmPri.cxStyle23
        end
        object VGDBMultiEditorRow2: TcxDBMultiEditorRow
          Height = 80
          Properties.Editors = <
            item
              Caption = 'Registro'
              EditPropertiesClassName = 'TcxMemoProperties'
              DataBinding.FieldName = 'EmailReg'
            end
            item
              Caption = 'T'#233'cnico'
              EditPropertiesClassName = 'TcxMemoProperties'
              DataBinding.FieldName = 'EmailTec'
            end
            item
              Caption = 'Msn'
              EditPropertiesClassName = 'TcxMemoProperties'
              DataBinding.FieldName = 'Messenger'
            end>
        end
      end
      object VGLic: TcxDBVerticalGrid
        Left = 0
        Top = 43
        Width = 752
        Height = 154
        BorderStyle = cxcbsNone
        Align = alTop
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = True
        OptionsView.PaintStyle = psDelphi
        OptionsView.RowHeaderWidth = 152
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.GoToNextCellOnTab = True
        OptionsBehavior.AllowChangeRecord = False
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        TabOrder = 1
        DataController.DataSource = dsMT
        DataController.GridMode = True
        object VGLicCategoryRow2: TcxCategoryRow
          Properties.Caption = 'Registro'
          Styles.Header = FrmPri.cxStyle23
        end
        object vgLicCodigo: TcxDBEditorRow
          Properties.Caption = 'C'#243'digo da Loja'
          Properties.EditPropertiesClassName = 'TcxTextEditProperties'
          Properties.EditProperties.ReadOnly = True
          Properties.DataBinding.FieldName = 'CodigoStr'
          Styles.Content = FrmPri.cxStyle30
        end
        object vgLicNome: TcxDBEditorRow
          Properties.Caption = 'Nome da Loja'
          Properties.EditPropertiesClassName = 'TcxTextEditProperties'
          Properties.EditProperties.CharCase = ecUpperCase
          Properties.DataBinding.FieldName = 'Loja'
          Styles.Content = FrmPri.cxStyle30
        end
        object vgLicSenha: TcxDBEditorRow
          Properties.Caption = 'Senha de Registro'
          Properties.DataBinding.FieldName = 'Senha'
          Styles.Content = FrmPri.cxStyle30
        end
        object VGLicDBEditorRow1: TcxDBEditorRow
          Properties.Caption = 'M'#225'quinas'
          Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.ReadOnly = True
          Properties.DataBinding.FieldName = 'LicMaq'
          Styles.Content = FrmPri.cxStyle30
        end
        object VGLicDBMultiEditorRow1: TcxDBMultiEditorRow
          Properties.Editors = <
            item
              EditPropertiesClassName = 'TcxImageComboBoxProperties'
              EditProperties.ImmediatePost = True
              EditProperties.ImmediateUpdateText = True
              EditProperties.Items = <
                item
                  Description = 'N'#227'o'
                  ImageIndex = 0
                  Value = False
                end
                item
                  Description = 'Sim'
                  Value = True
                end>
              DataBinding.FieldName = 'Cliente'
            end
            item
              EditPropertiesClassName = 'TcxImageComboBoxProperties'
              EditProperties.ImmediatePost = True
              EditProperties.ImmediateUpdateText = True
              EditProperties.Items = <
                item
                  Description = 'N'#227'o'
                  ImageIndex = 0
                  Value = False
                end
                item
                  Description = 'Sim'
                  Value = True
                end>
              DataBinding.FieldName = 'Bloqueado'
            end>
          Styles.Content = FrmPri.cxStyle30
        end
        object VGLicManVenc: TcxDBEditorRow
          Properties.Caption = 'Contrato Manuten'#231#227'o'
          Properties.EditPropertiesClassName = 'TcxDateEditProperties'
          Properties.EditProperties.ReadOnly = True
          Properties.DataBinding.FieldName = 'ManVenc'
          Styles.Content = FrmPri.cxStyle30
        end
      end
      object LMDSimplePanel1: TLMDSimplePanel
        Left = 0
        Top = 0
        Width = 752
        Height = 43
        Align = alTop
        Bevel.Mode = bmCustom
        TabOrder = 2
        object LMDSimplePanel2: TLMDSimplePanel
          Left = 0
          Top = 0
          Width = 362
          Height = 43
          Align = alClient
          Bevel.Mode = bmCustom
          TabOrder = 0
          ExplicitWidth = 510
          object dxBarDockControl1: TdxBarDockControl
            Left = 0
            Top = 0
            Width = 362
            Height = 44
            Align = dalTop
            BarManager = BarMgr
            ExplicitWidth = 510
          end
        end
        object lbDataCad: TcxLabel
          Left = 552
          Top = 0
          Align = alRight
          Caption = '  Cadastro Em 10/10/2006 17:40  '
          ParentColor = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.BorderColor = clNavy
          Style.BorderStyle = ebsSingle
          Style.Color = clGreen
          Style.TextColor = clNavy
          Style.TextStyle = [fsBold]
          Style.TransparentBorder = False
          Transparent = True
        end
        object lbUContato: TcxLabel
          Left = 362
          Top = 0
          Align = alRight
          Caption = '  U. Contato 10/10/2006 17:40  '
          ParentColor = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.BorderColor = clNavy
          Style.BorderStyle = ebsSingle
          Style.Color = clNavy
          Style.TextColor = clNavy
          Style.TextStyle = [fsBold]
          Style.TransparentBorder = False
          Transparent = True
        end
      end
    end
  end
  object BarMgr: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dmImagens.Imagens
    ImageOptions.LargeImages = FrmPri.im32
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = True
    Left = 232
    Top = 232
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
      FloatLeft = 276
      FloatTop = 216
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmSalvarFechar'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Custom 1'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object cmSalvarFechar: TdxBarLargeButton
      Caption = '&Salvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      LargeImageIndex = 41
      OnClick = cmSalvarFecharClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      SyncImageIndex = False
      ImageIndex = 4
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      LargeImageIndex = 39
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmFechar: TdxBarLargeButton
      Caption = '&Fechar'
      Category = 0
      Hint = 'Fechar'
      Visible = ivAlways
      LargeImageIndex = 37
      AutoGrayScale = False
    end
    object cmSalvar: TdxBarLargeButton
      Caption = 'S&alvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      LargeImageIndex = 41
      OnClick = cmSalvarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmBoleto: TdxBarLargeButton
      Caption = 'Ver Boleto'
      Category = 0
      Hint = 'Ver Boleto'
      Visible = ivAlways
      LargeImageIndex = 18
      AutoGrayScale = False
      GlyphLayout = glLeft
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
      Size = 10
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
      LookupDataSet = DM.tStatus
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Status'
      Size = 50
      Lookup = True
    end
    object MTPrograma: TWordField
      FieldName = 'Programa'
    end
    object MTBloqueado: TBooleanField
      FieldName = 'Bloqueado'
    end
    object MTCliente: TBooleanField
      FieldName = 'Cliente'
    end
  end
  object dsMT: TDataSource
    DataSet = MT
    Left = 402
    Top = 199
  end
end
