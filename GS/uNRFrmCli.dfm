object FrmCli: TFrmCli
  Left = 112
  Top = 34
  Caption = 'Cliente'
  ClientHeight = 605
  ClientWidth = 775
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
    Width = 775
    Height = 605
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = tsCad
    Properties.HideTabs = True
    Properties.Style = 6
    LookAndFeel.NativeStyle = True
    ClientRectBottom = 605
    ClientRectRight = 775
    ClientRectTop = 0
    object tsCad: TcxTabSheet
      Caption = '&1. Cadastro'
      ImageIndex = 0
      object VG: TcxDBVerticalGrid
        Left = 0
        Top = 246
        Width = 775
        Height = 359
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
        Version = 1
        object VGCategoryRow1: TcxCategoryRow
          Properties.Caption = 'Loja'
          Styles.Header = FrmPri.cxStyle23
          ID = 0
          ParentID = -1
          Index = 0
          Version = 1
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
          ID = 1
          ParentID = -1
          Index = 1
          Version = 1
        end
        object VGDBEditorRow1: TcxDBEditorRow
          Properties.Caption = 'Propriet'#225'rio'
          Properties.EditPropertiesClassName = 'TcxTextEditProperties'
          Properties.DataBinding.FieldName = 'Proprietario'
          ID = 12
          ParentID = -1
          Index = 2
          Version = 1
        end
        object VGDBMultiEditorRow5: TcxDBMultiEditorRow
          Properties.Editors = <
            item
              Caption = 'Tel.1'
              DataBinding.FieldName = 'Tel1'
            end
            item
              Caption = 'Tel.2'
              DataBinding.FieldName = 'Tel2'
            end
            item
              Caption = 'Tel.3'
              DataBinding.FieldName = 'Tel3'
            end
            item
              Caption = 'Tel.4'
              DataBinding.FieldName = 'Tel4'
            end>
          ID = 13
          ParentID = -1
          Index = 3
          Version = 1
        end
        object VGCategoryRow2: TcxCategoryRow
          Properties.Caption = 'Endere'#231'o'
          Styles.Header = FrmPri.cxStyle23
          ID = 3
          ParentID = -1
          Index = 4
          Version = 1
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
          ID = 4
          ParentID = -1
          Index = 5
          Version = 1
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
          ID = 5
          ParentID = -1
          Index = 6
          Version = 1
        end
        object VGCategoryRow3: TcxCategoryRow
          Properties.Caption = 'NF / Negocia'#231#227'o'
          Styles.Header = FrmPri.cxStyle23
          ID = 6
          ParentID = -1
          Index = 7
          Version = 1
        end
        object VGDBEditorRow2: TcxDBEditorRow
          Properties.Caption = 'Raz'#227'o Social'
          Properties.DataBinding.FieldName = 'RazaoSocial'
          ID = 7
          ParentID = -1
          Index = 8
          Version = 1
        end
        object VGDBMultiEditorRow6: TcxDBMultiEditorRow
          Properties.Editors = <
            item
              DataBinding.FieldName = 'CNPJ'
            end
            item
              Caption = 'I.E'
              DataBinding.FieldName = 'IE'
            end>
          ID = 8
          ParentID = -1
          Index = 9
          Version = 1
        end
        object VGDBEditorRow5: TcxDBEditorRow
          Height = 60
          Properties.Caption = 'Hist'#243'rico Negocia'#231#227'o'
          Properties.DataBinding.FieldName = 'FormaPagto'
          ID = 9
          ParentID = -1
          Index = 10
          Version = 1
        end
        object VGCategoryRow4: TcxCategoryRow
          Properties.Caption = 'E-Mails'
          Styles.Header = FrmPri.cxStyle23
          ID = 10
          ParentID = -1
          Index = 11
          Version = 1
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
          ID = 11
          ParentID = -1
          Index = 12
          Version = 1
        end
      end
      object VGLic: TcxDBVerticalGrid
        Left = 0
        Top = 43
        Width = 775
        Height = 203
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
        Version = 1
        object VGLicCategoryRow2: TcxCategoryRow
          Properties.Caption = 'Registro'
          Styles.Header = FrmPri.cxStyle23
          ID = 0
          ParentID = -1
          Index = 0
          Version = 1
        end
        object vgLicCodigo: TcxDBEditorRow
          Properties.Caption = 'C'#243'digo da Loja'
          Properties.EditPropertiesClassName = 'TcxTextEditProperties'
          Properties.EditProperties.ReadOnly = True
          Properties.DataBinding.FieldName = 'CodigoStr'
          Styles.Content = FrmPri.cxStyle30
          ID = 1
          ParentID = -1
          Index = 1
          Version = 1
        end
        object vgLicNome: TcxDBEditorRow
          Properties.Caption = 'Nome da Loja'
          Properties.EditPropertiesClassName = 'TcxTextEditProperties'
          Properties.EditProperties.CharCase = ecUpperCase
          Properties.DataBinding.FieldName = 'Loja'
          Styles.Content = FrmPri.cxStyle30
          ID = 2
          ParentID = -1
          Index = 2
          Version = 1
        end
        object VGLicDBEditorRow2: TcxDBEditorRow
          Properties.Caption = 'E-mail (conta)'
          Properties.EditPropertiesClassName = 'TcxTextEditProperties'
          Properties.DataBinding.FieldName = 'EmailConta'
          ID = 3
          ParentID = -1
          Index = 3
          Version = 1
        end
        object VGAtivado: TcxDBEditorRow
          Properties.Caption = 'Conta Ativada ?'
          Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.ImmediateUpdateText = True
          Properties.EditProperties.Items = <
            item
              Description = 'N'#227'o'
              ImageIndex = 0
              Value = False
            end
            item
              Description = 'Sim'
              Value = True
            end>
          Properties.DataBinding.FieldName = 'Ativado'
          ID = 4
          ParentID = -1
          Index = 4
          Version = 1
        end
        object vgLicSenha: TcxDBEditorRow
          Properties.Caption = 'Senha de Registro'
          Properties.DataBinding.FieldName = 'Senha'
          Styles.Content = FrmPri.cxStyle30
          ID = 5
          ParentID = -1
          Index = 5
          Version = 1
        end
        object VGLicDBEditorRow1: TcxDBEditorRow
          Properties.Caption = 'M'#225'quinas'
          Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.ReadOnly = True
          Properties.DataBinding.FieldName = 'LicMaq'
          Styles.Content = FrmPri.cxStyle30
          ID = 6
          ParentID = -1
          Index = 6
          Version = 1
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
          ID = 7
          ParentID = -1
          Index = 7
          Version = 1
        end
        object VGLicManVenc: TcxDBEditorRow
          Properties.Caption = 'Contrato Manuten'#231#227'o'
          Properties.EditPropertiesClassName = 'TcxDateEditProperties'
          Properties.EditProperties.ReadOnly = True
          Properties.DataBinding.FieldName = 'ManVenc'
          Styles.Content = FrmPri.cxStyle30
          ID = 8
          ParentID = -1
          Index = 8
          Version = 1
        end
        object VGLicDBEditorRow3: TcxDBEditorRow
          Properties.Caption = 'C'#243'digo de Ativa'#231#227'o'
          Properties.EditPropertiesClassName = 'TcxTextEditProperties'
          Properties.DataBinding.FieldName = 'CodAtivacao'
          ID = 9
          ParentID = -1
          Index = 9
          Version = 1
        end
        object VGLicDBEditorRow4: TcxDBEditorRow
          Properties.Caption = 'C'#243'digo de Desconto'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxTextEditProperties'
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.DataBinding.FieldName = 'CodDesc'
          Styles.Content = FrmPri.cxStyle44
          ID = 10
          ParentID = -1
          Index = 10
          Version = 1
        end
      end
      object LMDSimplePanel1: TLMDSimplePanel
        Left = 0
        Top = 0
        Width = 775
        Height = 43
        Align = alTop
        Bevel.Mode = bmCustom
        TabOrder = 2
        object LMDSimplePanel2: TLMDSimplePanel
          Left = 0
          Top = 0
          Width = 385
          Height = 43
          Align = alClient
          Bevel.Mode = bmCustom
          TabOrder = 0
          object dxBarDockControl1: TdxBarDockControl
            Left = 0
            Top = 0
            Width = 385
            Height = 44
            Align = dalTop
            BarManager = BarMgr
          end
        end
        object lbDataCad: TcxLabel
          Left = 575
          Top = 0
          Align = alRight
          Caption = '  Cadastro Em 10/10/2006 17:40  '
          ParentColor = False
          Style.BorderColor = clNavy
          Style.BorderStyle = ebsSingle
          Style.Color = clGreen
          Style.TextColor = clNavy
          Style.TextStyle = [fsBold]
          Style.TransparentBorder = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Transparent = True
          AnchorX = 675
          AnchorY = 22
        end
        object lbUContato: TcxLabel
          Left = 385
          Top = 0
          Align = alRight
          Caption = '  U. Contato 10/10/2006 17:40  '
          ParentColor = False
          Style.BorderColor = clNavy
          Style.BorderStyle = ebsSingle
          Style.Color = clNavy
          Style.TextColor = clNavy
          Style.TextStyle = [fsBold]
          Style.TransparentBorder = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Transparent = True
          AnchorX = 480
          AnchorY = 22
        end
      end
    end
  end
  object BarMgr: TdxBarManager
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
    FieldDefs = <
      item
        Name = 'Senha'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CadastroEm'
        DataType = ftDateTime
      end
      item
        Name = 'CadastroPor'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'AtualizadoEm'
        DataType = ftDateTime
      end
      item
        Name = 'AtualizadoPor'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Loja'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'RazaoSocial'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Pais'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Cidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Endereco'
        DataType = ftMemo
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Bairro'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SerieHD'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NumMaq'
        DataType = ftWord
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        Size = 19
      end
      item
        Name = 'IE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Telefones'
        DataType = ftMemo
      end
      item
        Name = 'EmailReg'
        DataType = ftMemo
      end
      item
        Name = 'FormaPagto'
        DataType = ftMemo
      end
      item
        Name = 'LicMaq'
        DataType = ftWord
      end
      item
        Name = 'LicTipo'
        DataType = ftWord
      end
      item
        Name = 'LicVenc'
        DataType = ftDate
      end
      item
        Name = 'ManInicio'
        DataType = ftDate
      end
      item
        Name = 'ManVenc'
        DataType = ftDate
      end
      item
        Name = 'Proprietarios'
        DataType = ftMemo
      end
      item
        Name = 'Gerente'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TipoLoja'
        DataType = ftWord
      end
      item
        Name = 'EmailTec'
        DataType = ftMemo
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'ValorRec'
        DataType = ftCurrency
      end
      item
        Name = 'EmitirNF'
        DataType = ftBoolean
      end
      item
        Name = 'Messenger'
        DataType = ftMemo
      end
      item
        Name = 'ICQ'
        DataType = ftMemo
      end
      item
        Name = 'UVersao'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'UObtemLic'
        DataType = ftDateTime
      end
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Status'
        DataType = ftInteger
      end
      item
        Name = 'ContatarEm'
        DataType = ftDateTime
      end
      item
        Name = 'Programa'
        DataType = ftWord
      end
      item
        Name = 'Bloqueado'
        DataType = ftBoolean
      end
      item
        Name = 'Cliente'
        DataType = ftBoolean
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
    OnCalcFields = MTCalcFields
    Left = 322
    Top = 271
    object MTCodAtivacao: TStringField
      FieldName = 'CodAtivacao'
      Size = 10
    end
    object MTEmailConta: TStringField
      FieldName = 'EmailConta'
      Size = 200
    end
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
      Size = 50
    end
    object MTUF: TStringField
      FieldName = 'UF'
      Size = 2
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
    object MTContatarEm: TDateTimeField
      FieldName = 'ContatarEm'
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
    object MTAtivado: TBooleanField
      FieldName = 'Ativado'
    end
    object MTCodDesc: TStringField
      FieldName = 'CodDesc'
      Size = 10
    end
    object MTTel1: TStringField
      FieldName = 'Tel1'
    end
    object MTTel2: TStringField
      FieldName = 'Tel2'
    end
    object MTTel3: TStringField
      FieldName = 'Tel3'
    end
    object MTTel4: TStringField
      FieldName = 'Tel4'
    end
    object MTProprietario: TStringField
      FieldName = 'Proprietario'
      Size = 70
    end
    object MTEndereco: TStringField
      FieldName = 'Endereco'
      Size = 70
    end
  end
  object dsMT: TDataSource
    DataSet = MT
    Left = 362
    Top = 271
  end
end
