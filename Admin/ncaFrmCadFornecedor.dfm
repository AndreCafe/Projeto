object FrmCadFornecedor: TFrmCadFornecedor
  Left = 483
  Top = 54
  Caption = 'Dados do Fornecedor'
  ClientHeight = 390
  ClientWidth = 721
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panPri: TLMDSimplePanel
    Left = 0
    Top = 36
    Width = 721
    Height = 354
    Align = alClient
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 0
    object NB: TdxNavBar
      AlignWithMargins = True
      Left = 0
      Top = 5
      Width = 89
      Height = 349
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      BorderStyle = bsSingle
      Color = 16250871
      ActiveGroupIndex = 0
      TabOrder = 0
      View = 3
      OptionsBehavior.Common.AllowSelectLinks = True
      OptionsImage.LargeImages = dmImagens.im32
      OptionsStyle.DefaultStyles.GroupBackground.BackColor = clBtnFace
      OptionsStyle.DefaultStyles.GroupBackground.BackColor2 = clBtnFace
      OptionsStyle.DefaultStyles.GroupBackground.Font.Charset = DEFAULT_CHARSET
      OptionsStyle.DefaultStyles.GroupBackground.Font.Color = clWindowText
      OptionsStyle.DefaultStyles.GroupBackground.Font.Height = -11
      OptionsStyle.DefaultStyles.GroupBackground.Font.Name = 'Tahoma'
      OptionsStyle.DefaultStyles.GroupBackground.Font.Style = []
      OptionsStyle.DefaultStyles.GroupBackground.AssignedValues = [savBackColor, savBackColor2]
      OptionsView.Common.ShowGroupCaptions = False
      OptionsView.NavigationPane.ShowHeader = False
      OptionsView.NavigationPane.ShowOverflowPanel = False
      OnLinkClick = NBLinkClick
      object NBGroup1: TdxNavBarGroup
        Caption = 'NBGroup1'
        LinksUseSmallImages = False
        SelectedLinkIndex = 0
        TopVisibleLinkIndex = 0
        Links = <
          item
            Item = nbiFicha
          end
          item
            Item = nbiTran
          end>
      end
      object nbiFicha: TdxNavBarItem
        Caption = 'Ficha Cadastral'
        LargeImageIndex = 91
      end
      object nbiTran: TdxNavBarItem
        Caption = 'Transa'#231#245'es'
        LargeImageIndex = 92
      end
      object NBStyleItem1: TdxNavBarStyleItem
        Style.BackColor = clWhite
        Style.BackColor2 = clWhite
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.AssignedValues = [savFont]
      end
    end
    object Paginas: TcxPageControl
      AlignWithMargins = True
      Left = 94
      Top = 5
      Width = 627
      Height = 349
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      TabOrder = 1
      Properties.ActivePage = tsDados
      Properties.CustomButtons.Buttons = <>
      LookAndFeel.NativeStyle = False
      ClientRectBottom = 349
      ClientRectRight = 627
      ClientRectTop = 24
      object tsDados: TcxTabSheet
        Caption = 'Ficha'
        ImageIndex = 0
        object lcFicha: TdxLayoutControl
          Left = 0
          Top = 0
          Width = 627
          Height = 325
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          BevelKind = bkTile
          TabOrder = 0
          LayoutLookAndFeel = FrmPri.lfPadrao
          object edNome: TcxDBTextEdit
            Left = 78
            Top = 10
            DataBinding.DataField = 'Nome'
            DataBinding.DataSource = DS
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsFlat
            Style.HotTrack = False
            Style.LookAndFeel.SkinName = ''
            Style.StyleController = FrmPri.cxEditStyleController1
            Style.TextStyle = [fsBold]
            StyleDisabled.LookAndFeel.SkinName = ''
            StyleFocused.LookAndFeel.SkinName = ''
            StyleHot.LookAndFeel.SkinName = ''
            TabOrder = 0
            Width = 531
          end
          object edTelefone: TcxDBTextEdit
            Left = 78
            Top = 40
            DataBinding.DataField = 'Telefone'
            DataBinding.DataSource = DS
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsFlat
            Style.HotTrack = False
            Style.LookAndFeel.SkinName = ''
            Style.StyleController = FrmPri.cxEditStyleController1
            StyleDisabled.LookAndFeel.SkinName = ''
            StyleFocused.LookAndFeel.SkinName = ''
            StyleHot.LookAndFeel.SkinName = ''
            TabOrder = 1
            Width = 150
          end
          object edCelular: TcxDBTextEdit
            Left = 288
            Top = 40
            DataBinding.DataField = 'Celular'
            DataBinding.DataSource = DS
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsFlat
            Style.HotTrack = False
            Style.LookAndFeel.SkinName = ''
            Style.StyleController = FrmPri.cxEditStyleController1
            StyleDisabled.LookAndFeel.SkinName = ''
            StyleFocused.LookAndFeel.SkinName = ''
            StyleHot.LookAndFeel.SkinName = ''
            TabOrder = 2
            Width = 150
          end
          object edEndereco: TcxDBTextEdit
            Left = 78
            Top = 100
            DataBinding.DataField = 'Endereco'
            DataBinding.DataSource = DS
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsFlat
            Style.HotTrack = False
            Style.LookAndFeel.SkinName = ''
            Style.StyleController = FrmPri.cxEditStyleController1
            StyleDisabled.LookAndFeel.SkinName = ''
            StyleFocused.LookAndFeel.SkinName = ''
            StyleHot.LookAndFeel.SkinName = ''
            TabOrder = 5
            Width = 531
          end
          object edBairro: TcxDBComboBox
            Left = 78
            Top = 130
            DataBinding.DataField = 'Bairro'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.Sorted = True
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsFlat
            Style.HotTrack = False
            Style.LookAndFeel.SkinName = ''
            Style.StyleController = FrmPri.cxEditStyleController1
            Style.ButtonStyle = btsFlat
            Style.PopupBorderStyle = epbsFlat
            StyleDisabled.LookAndFeel.SkinName = ''
            StyleFocused.LookAndFeel.SkinName = ''
            StyleHot.LookAndFeel.SkinName = ''
            TabOrder = 6
            Width = 250
          end
          object edCidade: TcxDBComboBox
            Left = 78
            Top = 160
            DataBinding.DataField = 'Cidade'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.Sorted = True
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsFlat
            Style.HotTrack = False
            Style.LookAndFeel.SkinName = ''
            Style.StyleController = FrmPri.cxEditStyleController1
            Style.ButtonStyle = btsFlat
            Style.PopupBorderStyle = epbsFlat
            StyleDisabled.LookAndFeel.SkinName = ''
            StyleFocused.LookAndFeel.SkinName = ''
            StyleHot.LookAndFeel.SkinName = ''
            TabOrder = 7
            Width = 250
          end
          object edUF: TcxDBTextEdit
            Left = 373
            Top = 160
            DataBinding.DataField = 'UF'
            DataBinding.DataSource = DS
            ParentFont = False
            Properties.CharCase = ecUpperCase
            Properties.LookupItemsSorted = True
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsFlat
            Style.HotTrack = False
            Style.LookAndFeel.SkinName = ''
            Style.StyleController = FrmPri.cxEditStyleController1
            StyleDisabled.LookAndFeel.SkinName = ''
            StyleFocused.LookAndFeel.SkinName = ''
            StyleHot.LookAndFeel.SkinName = ''
            TabOrder = 8
            Width = 36
          end
          object edCEP: TcxDBMaskEdit
            Left = 454
            Top = 160
            DataBinding.DataField = 'CEP'
            DataBinding.DataSource = DS
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsFlat
            Style.HotTrack = False
            Style.LookAndFeel.SkinName = ''
            Style.StyleController = FrmPri.cxEditStyleController1
            StyleDisabled.LookAndFeel.SkinName = ''
            StyleFocused.LookAndFeel.SkinName = ''
            StyleHot.LookAndFeel.SkinName = ''
            TabOrder = 9
            Width = 95
          end
          object edEmail: TcxDBMemo
            Left = 78
            Top = 190
            DataBinding.DataField = 'Email'
            DataBinding.DataSource = DS
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsFlat
            Style.HotTrack = False
            Style.LookAndFeel.SkinName = ''
            Style.StyleController = FrmPri.cxEditStyleController1
            StyleDisabled.LookAndFeel.SkinName = ''
            StyleFocused.LookAndFeel.SkinName = ''
            StyleHot.LookAndFeel.SkinName = ''
            TabOrder = 10
            Height = 36
            Width = 531
          end
          object edObs: TcxDBMemo
            Left = 78
            Top = 232
            DataBinding.DataField = 'Obs'
            DataBinding.DataSource = DS
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsFlat
            Style.HotTrack = False
            Style.LookAndFeel.SkinName = ''
            Style.StyleController = FrmPri.cxEditStyleController1
            StyleDisabled.LookAndFeel.SkinName = ''
            StyleFocused.LookAndFeel.SkinName = ''
            StyleHot.LookAndFeel.SkinName = ''
            TabOrder = 11
            Height = 65
            Width = 531
          end
          object edCNPJ: TcxDBTextEdit
            Left = 78
            Top = 70
            DataBinding.DataField = 'Cpf'
            DataBinding.DataSource = DS
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsFlat
            Style.HotTrack = False
            Style.LookAndFeel.SkinName = ''
            Style.StyleController = FrmPri.cxEditStyleController1
            StyleDisabled.LookAndFeel.SkinName = ''
            StyleFocused.LookAndFeel.SkinName = ''
            StyleHot.LookAndFeel.SkinName = ''
            TabOrder = 3
            Width = 150
          end
          object edIE: TcxDBTextEdit
            Left = 288
            Top = 70
            DataBinding.DataField = 'Rg'
            DataBinding.DataSource = DS
            ParentFont = False
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsFlat
            Style.HotTrack = False
            Style.LookAndFeel.SkinName = ''
            Style.StyleController = FrmPri.cxEditStyleController1
            StyleDisabled.LookAndFeel.SkinName = ''
            StyleFocused.LookAndFeel.SkinName = ''
            StyleHot.LookAndFeel.SkinName = ''
            TabOrder = 4
            Width = 150
          end
          object lcFichaGroup_Root: TdxLayoutGroup
            AlignHorz = ahLeft
            AlignVert = avTop
            CaptionOptions.Visible = False
            ButtonOptions.Buttons = <>
            Hidden = True
            ShowBorder = False
            Index = -1
          end
          object lcFichaGroup6: TdxLayoutGroup
            CaptionOptions.Text = 'Hidden Group'
            CaptionOptions.Visible = False
            Parent = lcFichaGroup_Root
            ButtonOptions.Buttons = <>
            Hidden = True
            ShowBorder = False
            Index = 0
          end
          object lcFichaItem3: TdxLayoutItem
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.Text = 'Nome'
            Parent = lcFichaGroup6
            Control = edNome
            ControlOptions.ShowBorder = False
            Index = 0
          end
          object lcFichaGroup8: TdxLayoutGroup
            CaptionOptions.Text = 'Hidden Group'
            CaptionOptions.Visible = False
            Parent = lcFichaGroup6
            ButtonOptions.Buttons = <>
            Hidden = True
            ShowBorder = False
            Index = 1
          end
          object lcFichaGroup7: TdxLayoutGroup
            CaptionOptions.Text = 'Hidden Group'
            CaptionOptions.Visible = False
            Parent = lcFichaGroup8
            ButtonOptions.Buttons = <>
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            Index = 0
          end
          object lcFichaItem8: TdxLayoutItem
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.Text = 'Telefone'
            Parent = lcFichaGroup7
            Control = edTelefone
            ControlOptions.ShowBorder = False
            Index = 0
          end
          object lcFichaItem9: TdxLayoutItem
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.Text = 'Celular'
            CaptionOptions.Width = 50
            Parent = lcFichaGroup7
            Control = edCelular
            ControlOptions.ShowBorder = False
            Index = 1
          end
          object lcFichaGroup5: TdxLayoutGroup
            CaptionOptions.Text = 'Hidden Group'
            CaptionOptions.Visible = False
            Parent = lcFichaGroup8
            ButtonOptions.Buttons = <>
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            Index = 1
          end
          object lcFichaItem12: TdxLayoutItem
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.Text = 'CNPJ'
            Parent = lcFichaGroup5
            Control = edCNPJ
            ControlOptions.ShowBorder = False
            Index = 0
          end
          object lcFichaGroup9: TdxLayoutGroup
            CaptionOptions.Text = 'Hidden Group'
            CaptionOptions.Visible = False
            Parent = lcFichaGroup_Root
            ButtonOptions.Buttons = <>
            Hidden = True
            ShowBorder = False
            Index = 1
          end
          object lcFichaItem17: TdxLayoutItem
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.Text = 'Endere'#231'o'
            Parent = lcFichaGroup9
            Control = edEndereco
            ControlOptions.ShowBorder = False
            Index = 0
          end
          object lcFichaItem18: TdxLayoutItem
            AlignHorz = ahLeft
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.Text = 'Bairro'
            Parent = lcFichaGroup9
            Control = edBairro
            ControlOptions.ShowBorder = False
            Index = 1
          end
          object lcFichaGroup11: TdxLayoutGroup
            CaptionOptions.Text = 'Hidden Group'
            CaptionOptions.Visible = False
            Parent = lcFichaGroup9
            ButtonOptions.Buttons = <>
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            Index = 2
          end
          object lcFichaItem19: TdxLayoutItem
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.Text = 'Cidade'
            Parent = lcFichaGroup11
            Control = edCidade
            ControlOptions.ShowBorder = False
            Index = 0
          end
          object lcFichaItem20: TdxLayoutItem
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.Text = 'UF'
            CaptionOptions.Width = 35
            Parent = lcFichaGroup11
            Control = edUF
            ControlOptions.ShowBorder = False
            Index = 1
          end
          object lcFichaItem21: TdxLayoutItem
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.Text = 'CEP'
            CaptionOptions.Width = 35
            Parent = lcFichaGroup11
            Control = edCEP
            ControlOptions.ShowBorder = False
            Index = 2
          end
          object lcFichaItem22: TdxLayoutItem
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            CaptionOptions.Text = 'E-mail'
            Parent = lcFichaGroup_Root
            Control = edEmail
            ControlOptions.ShowBorder = False
            Index = 2
          end
          object lcFichaItem23: TdxLayoutItem
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.AlignVert = tavTop
            CaptionOptions.Text = 'Observa'#231#245'es'
            Parent = lcFichaGroup_Root
            Control = edObs
            ControlOptions.ShowBorder = False
            Index = 3
          end
          object lcFichaItem13: TdxLayoutItem
            CaptionOptions.AlignHorz = taRightJustify
            CaptionOptions.Text = 'IE'
            CaptionOptions.Width = 50
            Parent = lcFichaGroup5
            Control = edIE
            ControlOptions.ShowBorder = False
            Index = 1
          end
        end
      end
      object tsTran: TcxTabSheet
        Caption = 'tsTran'
        ImageIndex = 1
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 329
      end
    end
  end
  object tAux: TnxTable
    ActiveRuntime = True
    Database = Dados.db
    Timeout = 10000
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    TableName = 'Cliente'
    IndexName = 'IRg'
    Left = 376
    Top = 32
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
    ImageOptions.Images = dmImagens.im16
    ImageOptions.LargeImages = dmImagens.im24
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = ''
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = True
    Left = 328
    Top = 32
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
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 671
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
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
      OneOnRow = True
      Row = 0
      ShowMark = False
      SizeGrip = False
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object cmGravar: TdxBarLargeButton
      Caption = '&Salvar - F2'
      Category = 0
      Hint = 'Salvar - F2'
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = cmGravarClick
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
      LargeImageIndex = 4
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object dxBarCombo1: TdxBarCombo
      Caption = 'Tipo da Conta'
      Category = 0
      Hint = 'Tipo da Conta'
      Visible = ivAlways
      ShowCaption = True
      Text = 'Cliente Normal'
      ItemIndex = -1
    end
    object dxBarCombo2: TdxBarCombo
      Caption = 'Status da Conta'
      Category = 0
      Hint = 'Status da Conta'
      Visible = ivAlways
      ShowCaption = True
      ItemIndex = -1
    end
    object cxBarEditItem1: TcxBarEditItem
      Caption = 'N'#227'o guardar cr'#233'dito de tempo restante no final do acesso'
      Category = 0
      Hint = 'N'#227'o guardar cr'#233'dito de tempo restante no final do acesso'
      Visible = ivAlways
      ShowCaption = True
      Width = 20
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.NullStyle = nssUnchecked
    end
  end
  object DS: TDataSource
    DataSet = MT
    OnStateChange = DSStateChange
    Left = 296
    Top = 24
  end
  object FMgr: TFormManager
    BarMgr = BarMgr
    PageControl = Paginas
    OnPageControlChange = FMgrPageControlChange
    OnGetTabSheet = FMgrGetTabSheet
    Left = 256
    Top = 30
  end
  object MT: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = False
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Nome'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Endereco'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Bairro'
        DataType = ftString
        Size = 20
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
        Name = 'Pai'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Mae'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'EscolaHI'
        DataType = ftDateTime
      end
      item
        Name = 'EscolaHF'
        DataType = ftDateTime
      end
      item
        Name = 'Inativo'
        DataType = ftBoolean
      end
      item
        Name = 'LimiteDebito'
        DataType = ftCurrency
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Nasc'
        DataType = ftDateTime
      end
      item
        Name = 'Sexo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Cpf'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Rg'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Telefone'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Email'
        DataType = ftMemo
      end
      item
        Name = 'Isento'
        DataType = ftBoolean
      end
      item
        Name = 'Username'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Senha'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'UltVisita'
        DataType = ftDateTime
      end
      item
        Name = 'Debito'
        DataType = ftCurrency
      end
      item
        Name = 'Escola'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NickName'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DataNasc'
        DataType = ftDateTime
      end
      item
        Name = 'Celular'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'TemDebito'
        DataType = ftBoolean
      end
      item
        Name = 'TipoAcessoPref'
        DataType = ftInteger
      end
      item
        Name = 'IncluidoEm'
        DataType = ftTimeStamp
      end
      item
        Name = 'AlteradoEm'
        DataType = ftDateTime
      end
      item
        Name = 'IncluidoPor'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'AlteradoPor'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Foto'
        DataType = ftGraphic
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
    AfterInsert = MTAfterInsert
    AfterEdit = MTAfterEdit
    Left = 224
    Top = 30
    object MTNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object MTEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object MTBairro: TStringField
      FieldName = 'Bairro'
    end
    object MTCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object MTUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object MTInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object MTCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object MTObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object MTCpf: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object MTRg: TStringField
      FieldName = 'Rg'
      Size = 14
    end
    object MTTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object MTEmail: TMemoField
      FieldName = 'Email'
      BlobType = ftMemo
    end
    object MTUltVisita: TDateTimeField
      FieldName = 'UltVisita'
    end
    object MTCelular: TStringField
      FieldName = 'Celular'
      Size = 15
    end
    object MTTemDebito: TBooleanField
      FieldName = 'TemDebito'
    end
    object MTTipoAcessoPref: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'TipoAcessoPref'
    end
    object MTIncluidoEm: TSQLTimeStampField
      FieldName = 'IncluidoEm'
    end
    object MTAlteradoEm: TDateTimeField
      FieldName = 'AlteradoEm'
    end
    object MTIncluidoPor: TStringField
      FieldName = 'IncluidoPor'
      Size = 10
    end
    object MTAlteradoPor: TStringField
      FieldName = 'AlteradoPor'
      Size = 10
    end
    object MTID: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'ID'
    end
  end
  object L: TcxLookAndFeelController
    Left = 424
    Top = 24
  end
  object OpenDlg: TOpenDialog
    Filter = 'Imagens|*.jpeg;*.jpg;*.bmp'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 592
    Top = 192
  end
end
