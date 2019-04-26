object FrmQuickCadProduto: TFrmQuickCadProduto
  Left = 282
  Top = 164
  BorderStyle = bsDialog
  Caption = 'Cadastro r'#225'pido de produto ou servi'#231'o'
  ClientHeight = 322
  ClientWidth = 535
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LMDSimplePanel1: TLMDSimplePanel
    AlignWithMargins = True
    Left = 20
    Top = 270
    Width = 495
    Height = 32
    Margins.Left = 20
    Margins.Top = 20
    Margins.Right = 20
    Margins.Bottom = 20
    Align = alBottom
    Bevel.Mode = bmCustom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object btnOk: TcxButton
      Left = 0
      Top = 0
      Width = 81
      Height = 32
      Cursor = crHandPoint
      Align = alLeft
      Caption = '&Ok'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnOkClick
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
    end
    object btCancelar: TcxButton
      AlignWithMargins = True
      Left = 101
      Top = 0
      Width = 81
      Height = 32
      Cursor = crHandPoint
      Margins.Left = 20
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Cancel = True
      Caption = '&Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      OnClick = btCancelarClick
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
    end
  end
  object lcFicha: TdxLayoutControl
    AlignWithMargins = True
    Left = 20
    Top = 73
    Width = 495
    Height = 177
    Margins.Left = 20
    Margins.Top = 20
    Margins.Right = 20
    Margins.Bottom = 0
    Align = alClient
    BevelKind = bkTile
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    LayoutLookAndFeel = dxLayoutStandardLookAndFeel1
    object edCodigo: TcxDBMaskEdit
      Left = 90
      Top = 12
      TabStop = False
      DataBinding.DataField = 'Codigo'
      DataBinding.DataSource = dsMT
      ParentFont = False
      Properties.MaxLength = 0
      Properties.ReadOnly = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.Color = 11206655
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 149
    end
    object edDescr: TcxDBTextEdit
      Left = 90
      Top = 68
      DataBinding.DataField = 'Descricao'
      DataBinding.DataSource = dsMT
      ParentFont = False
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.LookAndFeel.NativeStyle = False
      Style.TextStyle = [fsBold]
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      OnEnter = edDescrEnter
      Width = 230
    end
    object edPrecoVenda: TcxDBCurrencyEdit
      Left = 90
      Top = 40
      DataBinding.DataField = 'Preco'
      DataBinding.DataSource = dsMT
      ParentFont = False
      Properties.DecimalPlaces = 2
      Properties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.LookAndFeel.NativeStyle = False
      Style.TextStyle = [fsBold]
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.Color = 11206655
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Width = 230
    end
    object edCategoria: TcxDBComboBox
      Left = 90
      Top = 124
      DataBinding.DataField = 'Categoria'
      DataBinding.DataSource = dsMT
      ParentFont = False
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.MaxLength = 0
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.Color = 11206655
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 4
      OnEnter = edDescrEnter
      Width = 230
    end
    object panFoto: TLMDSimplePanel
      Left = 347
      Top = 12
      Width = 130
      Height = 130
      Bevel.Mode = bmCustom
      TabOrder = 5
      object edFoto: TcxDBImage
        Left = 0
        Top = 0
        Cursor = crHandPoint
        TabStop = False
        Align = alClient
        DataBinding.DataField = 'Imagem'
        DataBinding.DataSource = dsMT
        Properties.GraphicClassName = 'TdxSmartImage'
        Properties.ImmediatePost = True
        Style.BorderStyle = ebsFlat
        Style.Color = clWhite
        TabOrder = 0
        Height = 130
        Width = 130
      end
    end
    object edUnidade: TcxDBComboBox
      Left = 90
      Top = 96
      DataBinding.DataField = 'Unid'
      DataBinding.DataSource = dsMT
      ParentFont = False
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.MaxLength = 0
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.HotTrack = False
      Style.LookAndFeel.NativeStyle = False
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.Color = 11206655
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      OnEnter = edDescrEnter
      Width = 230
    end
    object dxLayoutGroup1: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = -1
    end
    object lcFichaGroup5: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      CaptionOptions.Visible = False
      Parent = dxLayoutGroup1
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = 0
    end
    object lcFichaItem2: TdxLayoutItem
      AlignHorz = ahLeft
      CaptionOptions.Text = 'C'#243'digo'
      Parent = dxLayoutGroup2
      Control = edCodigo
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcFichaItem3: TdxLayoutItem
      CaptionOptions.Text = 'Descri'#231#227'o'
      Parent = lcFichaGroup5
      Control = edDescr
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem1: TdxLayoutItem
      CaptionOptions.Text = 'Pre'#231'o Venda'
      Parent = lcFichaGroup5
      Control = edPrecoVenda
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object lcFichaItem5: TdxLayoutItem
      CaptionOptions.Text = 'Categoria'
      Parent = lcFichaGroup5
      Control = edCategoria
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object lcFichaUnidade: TdxLayoutItem
      CaptionOptions.Text = 'Unidade'
      Parent = lcFichaGroup5
      Control = edUnidade
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object lcFichaFoto: TdxLayoutItem
      CaptionOptions.Visible = False
      Parent = lcFichaGroupFoto
      Padding.Left = 20
      Padding.AssignedValues = [lpavLeft]
      Control = panFoto
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object lcFichaGroupFoto: TdxLayoutGroup
      AlignHorz = ahLeft
      CaptionOptions.Text = 'Hidden Group'
      Parent = dxLayoutGroup1
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = 1
    end
    object dxLayoutGroup2: TdxLayoutGroup
      CaptionOptions.Text = 'Hidden Group'
      Parent = lcFichaGroup5
      ButtonOptions.Buttons = <>
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 0
    end
  end
  object panelAutoCad: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 0
    Width = 535
    Height = 49
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 4
    Align = alTop
    Bevel.Mode = bmEdge
    TabOrder = 6
    object Image3: TImage
      AlignWithMargins = True
      Left = 5
      Top = 4
      Width = 37
      Height = 40
      Margins.Top = 2
      Align = alLeft
      Picture.Data = {
        0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
        0020000000200806000000737A7AF4000000097048597300000AEB00000AEB01
        828B0D5A000005C14944415478DA8D57DD6B1C55143FB333BB9B66BF75536852
        23B1D0EC26524A49098D2F0A82CD5305B1144CDE6C7CE99FE0837F441F4C7CB3
        0F82685191A2041111C58F87425328B1A5256D4CD3356DB2D9DD99D9F9F49C73
        E76B37BB3B3B70B9DFE7FECEB9BF73CE1DC9755DE8F7ADAEFEFD89A2C8EF4912
        6800FE3A078B04A21F2D30A0EFEF8BB6218175531A04606DEDAF2FCBE5B1F753
        A954978040C89000A2FD70AF6519200DB6C09F376667679772B92CB8AE038A92
        E85AE1822445054B91BE18137D88F425304D1D6CDB04556DA93100FEF8BC5AAD
        2C170A7968B55AF0E4C90E388E899B6D046471116D13C72D2CB6575B3C16AEB3
        F940AA75BD09B3B3F370EAD4EB7078586FC500F81D01CC2C178B79D8DFDF87DB
        B737D86CE21003851AD837B94DE3D48FB6E950DB6E3368CB1275A3F11C2E5EFC
        002E5C584499CF8701E05BA0098F1F6F7BDAB9AC99AF3169E65B20B48AE5ADF1
        2D22C60DA3053333E7616AAA8A16388803F01B03200E90F04422CAFECEBB157C
        70A1D343A0E77A024CE7AA48821800BFF215E472A3BC41961391C32020953F66
        9A6D26ABE3B85CF7F31252848AAA3687015059CEE7B3D06E1B4C442198CC6901
        B9937F0DA47DB93CCE73AE5B478F9141C8EE96EFE23500A4D379F2823800BFDC
        400B2C954A39D8D9A9C19D3BF770B48D029A1D45D7EB904CCA70E9D2552814B2
        30310140BCB16DE7884C5A77FFFEBF78F831544A1700AE5F5FBF8C7357B0BC89
        5A1DC37AE4DAB5772404F0195AE0436181361ED4F634723C82396C116AD34DE4
        F32F635B85C9C924B6735D00A400C083073BA0692328530B0044168A4D08002D
        F0F36AB55A5DC9E5325E2092BD7B1702FD9AAE80AE84D690FB4992C17CE9B4AE
        1B70C7B21C9C4F8724EC6F01025059C9E733686A0B51EB3815BA9E7FE0E86806
        4B960FA438E0382A1E94E8EB3144D2542A137260B0054EAF148B05D8DDDD838D
        8D4DDCACA1E91A08A88E75137D7917CE9D7B03E6E7DF462FA0C0D384F171A5C7
        15888FACF8E8D12EEE4FD395C659E0A735B4C055E20069DF6C36030BF8C1C534
        0D3CAC00C5E24B3886B3760BC36C0E08746F122AB0B9B9851151EA20611F0BAC
        3300E200994FC4012912030407C4558848482157510C2C4A241648814BD21EC3
        B087E5C0FAA7D5EAF4471409C9BC54842027E0801FD512882D93C902A5791192
        EDE070CB52795E444A0A5209E4C04807803E16F811E34065A958CCC1F6F61EFA
        EF366ED6510315C1B4B8506C57D503A068B9B87899C9484928241D59EC107951
        62620A0E3C4339E486B11CF82188848D860AF57A0385387C4098722D367B2AA5
        C0C993AF7911300CC3247F74D4814AE555069348C870F7EE3F089A22623B2E12
        1280E9E5900392A791AF59C8059243A9397435DB0322B1E7A4D3722057D70DE6
        80A66971006E79D930C3A954A4D9A8764EA065F84413BC509424323EC973F402
        12F9C2074C1C480F930B6EB1050A851C3C7D7A000F1FFE87A3063F326C5BE7EC
        47E6A736D596A561D1F9D573F6EC79989B5BC0B686DA6A70FC788933275DD1D6
        D6336CA7C238D01FC0F7DE83240B07072ABC78D1640E883C607A99D0F4C2B03F
        66726C181F9FC0A434C939A4544A616C7805E828595690039BA8BD891C308601
        E073C0E11C1E3E323BEFDF7F17F88F52414EE10DAEDB46174D7B6B2424740B65
        259103B157F05DC001BA6FDADF0D401C66B3E943DF0FE77CAED01A7F8CA2213D
        F55BADD817D1B70CA058CC22070ED97F89D1E21DD0400DE81DE0C2C2C25B98FF
        D33036D6FD06089FEB7E5F96659455434592C48F61004C33076AB5430E461488
        886CA6A97232926517CE9C998313278AE8EB531C2D8F7EA1D948FB8D8D7B08DE
        188603DF2080D37C0564FA300E8879E2046DD73415E8A5444C2762860FD3A35F
        026372ADB647AD612C7033E08010DCEB972BFCDDA21752E77CEF368120420EF1
        2ABE89BF6695250AC502000C142C440D3E9C2F4412591149A8C6FC9C7EFD45B9
        5CBE924A2561F0CF68BFF6E09F54FC83B263007CF531068E7711AD3EF8777C10
        805E45D001956AFD0FF351FB6D6DF96CC60000000049454E44AE426082}
      ExplicitTop = 3
      ExplicitHeight = 36
    end
    object cxLabel3: TcxLabel
      Left = 45
      Top = 2
      Align = alClient
      Caption = 
        'Esta op'#231#227'o, permite cadastrar r'#225'pidamente as informa'#231#245'es b'#225'sicas' +
        ' de um produto que estiver vendendo mas que ainda n'#227'o consta no ' +
        'seu cat'#225'logo. '
      Properties.Alignment.Vert = taVCenter
      Properties.WordWrap = True
      Width = 431
      AnchorY = 25
    end
    object cxLabelAutoCadDesativar: TcxLabel
      AlignWithMargins = True
      Left = 481
      Top = 2
      Cursor = crHandPoint
      Margins.Left = 5
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alRight
      Caption = 'Desativar'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsUnderline]
      Style.IsFontAssigned = True
      Properties.Alignment.Vert = taVCenter
      OnClick = cxLabelAutoCadDesativarClick
      AnchorY = 25
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
    ImageOptions.Images = dmImagens.Imagens
    ImageOptions.LargeImages = FrmPri.im24
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    SunkenBorder = True
    UseSystemFont = True
    Left = 176
    Top = 184
    DockControlHeights = (
      0
      0
      0
      0)
    object cmKardex: TdxBarButton
      Caption = '&Kardex'
      Category = 0
      Hint = 'Kardex'
      Visible = ivNever
      UnclickAfterDoing = False
    end
    object cmGravar: TdxBarLargeButton
      Caption = '&Salvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      LargeImageIndex = 5
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
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
  end
  object QCat: TnxQuery
    ActiveRuntime = True
    Database = Dados.db
    Timeout = 10000
    SQL.Strings = (
      'Select Distinct(Categoria) From Produto')
    Left = 220
    Top = 186
    object QCatCategoria: TStringField
      FieldName = 'Categoria'
      Size = 35
    end
  end
  object dsMT: TDataSource
    DataSet = MT
    Left = 304
    Top = 184
  end
  object MT: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Fidelidade'
        DataType = ftBoolean
      end
      item
        Name = 'FidPontos'
        DataType = ftInteger
      end
      item
        Name = 'Codigo'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 55
      end
      item
        Name = 'Preco'
        DataType = ftCurrency
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Imagem'
        DataType = ftGraphic
      end
      item
        Name = 'Categoria'
        DataType = ftString
        Size = 35
      end
      item
        Name = 'CustoUnitario'
        DataType = ftCurrency
      end
      item
        Name = 'PodeAlterarPreco'
        DataType = ftBoolean
      end
      item
        Name = 'NaoControlaEstoque'
        DataType = ftBoolean
      end
      item
        Name = 'EstoqueRepor'
        DataType = ftFloat
      end
      item
        Name = 'Fornecedor'
        DataType = ftInteger
      end
      item
        Name = 'EstoqueMin'
        DataType = ftFloat
      end
      item
        Name = 'EstoqueMax'
        DataType = ftFloat
      end
      item
        Name = 'ID'
        DataType = ftInteger
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
    Left = 336
    Top = 184
    object MTFidelidade: TBooleanField
      FieldName = 'Fidelidade'
    end
    object MTFidPontos: TIntegerField
      FieldName = 'FidPontos'
    end
    object MTCodigo: TStringField
      FieldName = 'Codigo'
      Size = 15
    end
    object MTDescricao: TStringField
      DisplayWidth = 55
      FieldName = 'Descricao'
      Size = 55
    end
    object MTPreco: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Preco'
    end
    object MTImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object MTCategoria: TStringField
      DisplayWidth = 35
      FieldName = 'Categoria'
      Size = 35
    end
    object MTCustoUnitario: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'CustoUnitario'
    end
    object MTObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object MTPodeAlterarPreco: TBooleanField
      FieldName = 'PodeAlterarPreco'
    end
    object MTNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object MTUnid: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'Unid'
      Size = 5
    end
    object MTEstoqueRepor: TFloatField
      FieldName = 'EstoqueRepor'
    end
    object MTFornecedor: TIntegerField
      FieldName = 'Fornecedor'
    end
    object MTEstoqueMin: TFloatField
      Alignment = taLeftJustify
      FieldName = 'EstoqueMin'
    end
    object MTEstoqueMax: TFloatField
      Alignment = taLeftJustify
      FieldName = 'EstoqueMax'
    end
    object MTNomeFor: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeFor'
      LookupDataSet = Dados.tbCli
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Fornecedor'
      Lookup = True
    end
    object MTID: TIntegerField
      FieldName = 'ID'
    end
  end
  object dsCAT: TDataSource
    DataSet = QCat
    Left = 424
    Top = 184
  end
  object dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    Left = 24
    Top = 232
    object dxLayoutWebLookAndFeel1: TdxLayoutWebLookAndFeel
    end
    object dxLayoutStandardLookAndFeel1: TdxLayoutStandardLookAndFeel
      ItemOptions.ControlBorderStyle = lbsFlat
    end
  end
  object qUnidade: TnxQuery
    ActiveRuntime = True
    Database = Dados.db
    Timeout = 10000
    SQL.Strings = (
      'Select Distinct(Unid) From Produto')
    Left = 252
    Top = 186
    object qUnidadeUnid: TStringField
      FieldName = 'Unid'
      Size = 5
    end
  end
end
