object FrmME2: TFrmME2
  Left = 0
  Top = 0
  Caption = 'FrmME2'
  ClientHeight = 573
  ClientWidth = 813
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panCompra: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 35
    Width = 813
    Height = 34
    Margins.Left = 0
    Margins.Top = 1
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 0
    object cbCompra: TcxCheckBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Atualizar custo dos produtos (compra)'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfFlat
      Style.TextColor = clBlue
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 0
      Transparent = True
      OnClick = cbCompraClick
      Width = 305
    end
  end
  object panTot: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 507
    Width = 813
    Height = 66
    Margins.Left = 0
    Margins.Top = 1
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alBottom
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 2
  end
  object panLista: TLMDSimplePanel
    AlignWithMargins = True
    Left = 7
    Top = 175
    Width = 799
    Height = 331
    Margins.Left = 7
    Margins.Top = 1
    Margins.Right = 7
    Margins.Bottom = 0
    Align = alClient
    Bevel.Mode = bmStandard
    Color = clWhite
    TabOrder = 1
  end
  object cbFocus: TCheckBox
    Left = 0
    Top = 3000
    Width = 590
    Height = 17
    Caption = 'cbFocus'
    TabOrder = 3
  end
  object panBuscaProd: TLMDSimplePanel
    Left = 0
    Top = 122
    Width = 813
    Height = 52
    Margins.Left = 0
    Margins.Top = 1
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Bevel.BorderColor = clRed
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 4
  end
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 813
    Height = 34
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 0
    Align = alTop
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    Color = 14540253
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object cmCancelar: TcxLabel
      AlignWithMargins = True
      Left = 303
      Top = 3
      Cursor = crHandPoint
      Margins.Left = 7
      Align = alLeft
      Caption = 'Cancelar'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.HotTrack = True
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.TextColor = 5131854
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleHot.BorderStyle = ebsNone
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.TextStyle = [fsUnderline]
      Properties.Alignment.Vert = taVCenter
      OnClick = cmCancelarClick
      AnchorY = 17
    end
    object cbRecibo: TcxCheckBox
      AlignWithMargins = True
      Left = 376
      Top = 3
      Cursor = crHandPoint
      Margins.Left = 20
      TabStop = False
      Align = alLeft
      AutoSize = False
      Caption = 'Emitir Recibo'
      Style.BorderColor = clWhite
      Style.BorderStyle = ebsThick
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      Style.TextColor = 5131854
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Visible = False
      Height = 28
      Width = 109
    end
    object cmConfig: TcxButton
      Left = 781
      Top = 0
      Width = 32
      Height = 34
      Cursor = crHandPoint
      Hint = 'Configurar'
      Align = alRight
      Caption = 'Configurar'
      Default = True
      TabOrder = 2
      OnClick = cmConfigClick
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      OptionsImage.ImageIndex = 33
      OptionsImage.Images = dmImagens.im24
      PaintStyle = bpsGlyph
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Flat = True
      SpeedButtonOptions.Transparent = True
    end
    object panFunc: TLMDSimplePanel
      AlignWithMargins = True
      Left = 488
      Top = 0
      Width = 278
      Height = 34
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 15
      Margins.Bottom = 0
      Align = alClient
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      ParentColor = True
      TabOrder = 3
    end
    object panFidelidade: TLMDSimplePanel
      Left = 0
      Top = 0
      Width = 221
      Height = 34
      AutoSize = True
      Align = alLeft
      Bevel.Mode = bmCustom
      ParentColor = True
      TabOrder = 4
      object Img: TImage
        Left = 0
        Top = 0
        Width = 32
        Height = 34
        Align = alLeft
        Center = True
        Picture.Data = {
          0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000018
          000000180806000000E0773DF80000000467414D410000B18F0BFC6105000000
          097048597300000B0C00000B0C013F4022C80000002B74455874437265617469
          6F6E2054696D650046722032332041707220323030342030393A34363A353020
          2B3031303005FCE32B0000000774494D4507D605170D3A12D35589A60000052A
          49444154484B9595794C545714C60F6EC3AA03B2880E20421411115CABE22EB1
          1AA5068A988E066A83356E55DC50442254C71995A5586DC4AA8D0B2E45A41510
          C5A52D54A9024159A4280AC161E8C83A0308C87C3D6FD2264D23037EC9EF8F79
          73CF77CF3BE7DCFBE8FF3A7DBAE493B8D85FD432797ADBFEAFAFB7ED8DBCD2BA
          6BD715CDE61D49F5BE67C6A97D7E70504F4B92A8269F18A69C9068A7763F6A5D
          E2B4D5DC9F432D987E7A13433A762C2F2EF69B622424362236AE168A232F2197
          5561E5557FCCCF188519E9124C49B38777EA308C4BB581CD41338CD868F62387
          7EC498E94D0C292626234C26FF1D71718D50286A7048F60207A35F427A7603A6
          65D862D2CFF6F04CB5855BCA508CBA3204967B4D205E2C4AE6502963AD3731A4
          F5EB633DF6465EEB922B2A219355203AFA29A2A38A10921805CF1B62785CB3C1
          E8AB566C2E8638DE18F651E6BA81C3FA2571E84AC64A6FD28B449B379D3AB333
          FC3AA2638A1115F508117B72B173F72DB8A55AC2E5EA10385E1E0C9BB3A618BC
          5B04AB35A21C8E496466312682416F327272F2720E0939FC60C3E673088FC846
          7878367686652174CF09B826DB63C8C9FE10879BC37A8BE9AB7E264667396623
          E3C4F4DEE47F24128B47782D59B2E57C50D091B72BA4090890C6637980020BE6
          EDC3ECE93B747601921C231312CC2398494C9FB2FFAF8400776747BB8DEB56FA
          DC8EDAB4A879EB9A450DB3A6CFC816990D3DC3FF1D673631931973C688E9BB5A
          1E91B5F62E7DD77493DA34B962681F3BA339D71EAA9F485770922A0E8492C2D4
          98BC79A930FF1F66DE5140EEEA0CAA6A29F482AE6E15F07A11F0CA07A85908A8
          83D0563A0BCF92FB235341BFF94E202F0E11DEB66F9B341592E59B4CAA6CAD58
          0254CF054A1DF1B6C0167831897FCF464BFE58DE7029A05CCA9B0C44CA7ECAB1
          30D1BF49DF7AD07E9F629B1FB1490D675DEA00948F81F6E94C2E912B34051E50
          FD3A06DD357EC09B60E82A6722EF38212C90E238D49519A037E949151748A44A
          A7A6AEBA3540B12D3A8B24E82894A0F5CFC5E852AD4667951F1AF2A7A0F9C91C
          B494FBA15B19849A740BA4C7D00B0E17EE234BBD514FD2DCA3C9AA2C53A02E10
          BA620734E78FC7BBC630E8EAD771ED83815A7FE8AA17A0AB7C22CAF924B7BF0E
          85F60F09EEC809CE7614C516A3989E7B519D46CB5477ECB83C1F7369DCF0AE64
          2C9A8B6602F55FB0F9A7FC7CB1BE0FCA3B23A1A95C0DBC8D447BA18B7E036F17
          FD6916467690DEEC7D2A3B47B3AB6F5800AAE5C0F3F1682B1A874EA594EBCD28
          B9EE55F3809753D1F9C41575F9DCA36E19B40FAD9175803046A23F1773989E9B
          9DB083AC9F5DA0769D7205BA4A3C509D25812AC713AD65F37972F8ADAA66409B
          EF86672976C84D344643A93FEA3207213582BACD44F42D5BF83006A76940E129
          BAA4BCEFC6197386C2DCD7FAA13ECF13CA7B6EA8CA74446DB60DDE35ED027004
          A89C8887C708873FA73C8E8D6526081E82514F323AB896BC79F41A5A9EF2C152
          2DE38607E07192191A8B9772DDA5B8251F802ECD3E4EC017159709297BA87BF4
          70FD9DB48571103C0423433239F42505E72690A6F6FE68E0AF65E8A8F607B45F
          01EDDBD1511588EE3277945F24A4451256CD21E16B16CF2C60843BA957091958
          86F852705A0C3D7FC025A84CB344DD6D2BA86E0E46D9C5FEB8CB5393BC9DDAFC
          A6D2255E7B82F98C19CEF4F9BA16160EB532A785C10B29F1E85ACA39BF8D94E7
          B6913A3E948AA573E99AD88CBEE73572269011BE05864FF17B246C22DC946399
          E58C50E318E60013CEAC66A63236CC079BFF2BA15C03193123618493EAC20819
          0B1F7863C6405389FE06F955BB57BE97F53C0000000049454E44AE426082}
        ExplicitLeft = -6
        ExplicitHeight = 29
      end
      object lbMensagem: TcxLabel
        AlignWithMargins = True
        Left = 32
        Top = 0
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'Resgate de Pr'#234'mio Fidelidade'
        ParentColor = False
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI Semibold'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.TextColor = clGray
        Style.TextStyle = [fsBold]
        Style.TransparentBorder = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        AnchorY = 17
      end
      object LMDSimplePanel2: TLMDSimplePanel
        AlignWithMargins = True
        Left = 220
        Top = 1
        Width = 1
        Height = 32
        Margins.Left = 0
        Margins.Top = 1
        Margins.Right = 0
        Margins.Bottom = 1
        Align = alLeft
        Bevel.Mode = bmCustom
        Color = 13750737
        TabOrder = 1
      end
    end
    object RadioButton1: TRadioButton
      Left = 464
      Top = 32
      Width = 113
      Height = 17
      Caption = 'RadioButton1'
      TabOrder = 5
    end
    object cmGravar: TcxButton
      Left = 221
      Top = 0
      Width = 75
      Height = 34
      Align = alLeft
      Caption = 'Salvar - F2'
      Font.Charset = ANSI_CHARSET
      Font.Color = 5131854
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = cmGravarClick
      Colors.Default = 14540253
      LookAndFeel.Kind = lfFlat
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.AllowAllUp = True
      SpeedButtonOptions.Flat = True
    end
  end
  object panCli: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 70
    Width = 813
    Height = 52
    Margins.Left = 0
    Margins.Top = 1
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 10
  end
  object BarMgr: TdxBarManager
    AllowReset = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dmImagens.im16
    ImageOptions.LargeImages = dmImagens.im24
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    ShowHintForDisabledItems = False
    Style = bmsUseLookAndFeel
    UseBarHintWindow = False
    UseSystemFont = False
    Left = 120
    Top = 304
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 16
    Top = 304
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWindow
      TextColor = clWindowText
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
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
    object cxStyle5: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clWhite
    end
  end
  object tPro: TnxTable
    ActiveRuntime = True
    Database = Dados.db
    Filter = '(plus<>true)'
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    TableName = 'Produto'
    IndexName = 'IDescricao'
    Left = 120
    Top = 264
    object tProID: TAutoIncField
      FieldName = 'ID'
    end
    object tProCodigo: TStringField
      FieldName = 'Codigo'
      Size = 15
    end
    object tProDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object tProUnid: TStringField
      FieldName = 'Unid'
      Size = 5
    end
    object tProPreco: TCurrencyField
      FieldName = 'Preco'
    end
    object tProPodeAlterarPreco: TBooleanField
      FieldName = 'PodeAlterarPreco'
    end
    object tProPermiteVendaFracionada: TBooleanField
      FieldName = 'PermiteVendaFracionada'
    end
    object tProEstoqueAtual: TFloatField
      FieldName = 'EstoqueAtual'
    end
    object tProplus: TBooleanField
      FieldName = 'plus'
    end
    object tProFidPontos: TIntegerField
      FieldName = 'FidPontos'
    end
    object tProCustoUnitario: TCurrencyField
      FieldName = 'CustoUnitario'
    end
    object tProCadastroRapido: TBooleanField
      FieldName = 'CadastroRapido'
    end
    object tProCategoria: TStringField
      FieldName = 'Categoria'
      Size = 35
    end
    object tProObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tProImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object tProFornecedor: TIntegerField
      FieldName = 'Fornecedor'
    end
    object tProSubCateg: TStringField
      FieldName = 'SubCateg'
      Size = 35
    end
    object tProEstoqueACE: TFloatField
      FieldName = 'EstoqueACE'
    end
    object tProEstoqueACS: TFloatField
      FieldName = 'EstoqueACS'
    end
    object tProNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object tProEstoqueMin: TFloatField
      FieldName = 'EstoqueMin'
    end
    object tProEstoqueMax: TFloatField
      FieldName = 'EstoqueMax'
    end
    object tProAbaixoMin: TBooleanField
      FieldName = 'AbaixoMin'
    end
    object tProAbaixoMinDesde: TDateTimeField
      FieldName = 'AbaixoMinDesde'
    end
    object tProEstoqueRepor: TFloatField
      FieldName = 'EstoqueRepor'
    end
    object tProplusURL: TnxMemoField
      FieldName = 'plusURL'
      BlobType = ftMemo
    end
    object tProplusCodParceiro: TStringField
      FieldName = 'plusCodParceiro'
      Size = 15
    end
    object tProplusCodProduto: TStringField
      FieldName = 'plusCodProduto'
      Size = 15
    end
    object tProAtivo: TBooleanField
      FieldName = 'Ativo'
    end
    object tProFidelidade: TBooleanField
      FieldName = 'Fidelidade'
    end
    object tPromd5Imagem: TStringField
      FieldName = 'md5Imagem'
      Size = 32
    end
    object tProlastProdModif: TDateTimeField
      FieldName = 'lastProdModif'
    end
    object tProuploadR: TWordField
      FieldName = 'uploadR'
    end
    object tProuploadS: TWordField
      FieldName = 'uploadS'
    end
    object tProfk_produ: TIntegerField
      FieldName = 'fk_produ'
    end
    object tProbatchUID: TGuidField
      FieldName = 'batchUID'
      Size = 38
    end
    object tProIncluidoEm: TDateTimeField
      FieldName = 'IncluidoEm'
    end
  end
  object DataSource1: TDataSource
    DataSet = tPro
    Left = 56
    Top = 336
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 232
    Top = 304
  end
  object tCodR: TnxTable
    ActiveRuntime = True
    Database = Dados.db
    Filter = '(plus<>true)'
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    TableName = 'Produto'
    IndexName = 'ICodigo'
    Left = 240
    Top = 232
  end
  object imgs: TcxImageList
    Height = 24
    Width = 24
    FormatVersion = 1
    DesignInfo = 11010232
    ImageInfo = <
      item
        Image.Data = {
          36090000424D3609000000000000360000002800000018000000180000000100
          2000000000000009000000000000000000000000000000000000000000000000
          00000000000023180C326040218984582EBC996735DAA56F39EBAB7139F5B485
          56F3DACABBEFCBB9A6EFCCB9A7F0E5D6C5FAB2773FFEB2773DFFB3783EFFAF76
          3DFAA26D38E7885B2FC2583B1E7D010000010000000000000000000000000000
          00007E542BB6B3783EFFB1763CFFB1763CFFB3783EFFB1763CFFAF7439FEBD8A
          59FFFEFEFEFE888A8BFF87898BFEFEFEFEFEB47B42FDB2773CFFB0753CFDB076
          3CFEB3783EFFB1763CFFB1763CFFB3783EFF030201050000000000000000321F
          0D4BB1763CFFB3783EFFB0753CFDB0753CFDB3783EFFB0753CFDB0743AFDB77F
          49FFFDFDFDFD848484FF808080FDFDFDFDFDB67E47FDB2763CFFB0753CFDB075
          3CFDB3783EFFB0753CFDB0753CFDB3783EFF4B2F137000000000000000005234
          167AB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB2773CFFB379
          40FFFFFFFFFF7C7C7CFF747474FFFFFFFFFFB9844FFFB2763BFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFF5636177F00000000000000004C30
          1472B1763CFFB3783EFFB0753CFDB0753CFDB3783EFFB0753CFDB0753BFDB277
          3EFFFDFDFDFD747474FF707070FDFDFDFDFDBD8A59FDB1753AFFB0753CFDB075
          3CFDB3783EFFB0753CFDB0753CFDB3783EFF4E31147400000000000000003A25
          0F57B1763CFFB3783EFFB0753CFDB0753CFDB3783EFFB0753CFDB0743BFDB57B
          41FFFDFDFDFD717171FF6C6C6CFDF9FDFDFDC29568FDB17539FFB0753CFDB075
          3CFDB3783EFFB0753CFDB0753CFDB3783EFF39240F550000000000000000110B
          0519B3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB2763BFFB883
          4DFFFFFFFFFF717171FF6E6E6EFFFBFEFFFFCBA279FFB07438FFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFF0E08031600000000000000000000
          0000936232D4B3783EFFB0753CFDB0753CFDB3783EFFB0753CFDAF7339FDC191
          61FFFDFDFDFD767676FF707070FDFDFDFDFDD0AF8DFDB07337FFB0753CFDB075
          3CFDB3783EFFB0753CFDB1763CFF8A5725CD0000000000000000000000000000
          00000704010BB3783EFFB1763CFFB0763CFEB3783EFFB0753CFDAE7136FDCEA9
          83FFFDFDFDFD6F6F6FFF696969FDFDFDFDFDDCC2ABFDAF7135FFB0753CFDB075
          3CFDB3783EFFB1763CFFB0753CFD060301090000000000000000000000000000
          0000000000000000000074491FACB3783EFFB3783EFFB3783EFFAF7033FFE3CE
          B7FFEBEDEFFFCFCFD0FFD0D0D0FFE7E8E9FFEFE2D6FFAD6E30FFB3783EFFB378
          3EFFB3783EFF71471EA800000000000000000000000000000000000000000000
          00000000000000000000000000001009031867411C99B1753BFFAD6E30FFFFFF
          FFFFFFFFFFFFCBCBCBCBBDBDBDC0FFFFFFFFFFFFFFFFB07438FFB1753AFF603C
          198E0C0702120000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000190F0526B99D83DD8784
          828B04030304000000000000000000000000504C48559B8C80AD100A05170000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000006849
          2992AE7133FFB07336FFAF7135FF9F6830E84734206100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000A06020FAF7439FCB276
          3CFFB1763CFFB3783EFFB0753CFDB1763CFFB0753AFF8C5D2FCA000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000A36D37EBB1763CFFB378
          3EFFB0753CFDB3783EFFB0753CFDB0753CFDB0753CFDB3783EFF7D532AB40000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000432A1163B3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFF2216
          0933000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000875524C8B1763CFFB0753CFDB378
          3EFFB0753CFDB3783EFFB0753CFDB0753CFDB0753CFDB3783EFFB1763CFF6E45
          1CA4000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000A7692DF7B1763CFFB0753CFDB378
          3EFFB0753CFDB3783EFFB0753CFDB0753CFDB0753CFDB3783EFFB1763CFF905A
          25D7000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000A5672BF4B3783EFFB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFF905B
          27D6000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000815122BFB1763CFFB0753CFDB378
          3EFFB0753CFDB3783EFFB0753CFDB0753CFDB0753CFDB3783EFFB1763CFF6942
          1B9D000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000035210E4FB1763CFFB0753CFDB378
          3EFFB0753CFDB3783EFFB0753CFDB0753CFDB0753CFDB3783EFFB1763CFF190F
          0427000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000906032CDB3783EFFB378
          3EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFFB3783EFF69421C9B0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000936232D4B378
          3EFFB1763CFFB3783EFFB1763CFFB1763CFFB1763CFF6F461EA5000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003C28
          155682572CBBA46E39EA9F6A36E5734D27A52416093500000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
end
