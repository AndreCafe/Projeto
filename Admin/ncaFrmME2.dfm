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
      Left = 317
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
      Left = 394
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
      Left = 506
      Top = 0
      Width = 260
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
      Width = 235
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
          000000180806000000E0773DF8000000017352474200AECE1CE9000000046741
          4D410000B18F0BFC6105000000206348524D00007A26000080840000FA000000
          80E8000075300000EA6000003A98000017709CBA513C00000009704859730000
          0B0A00000B0A01BF4366530000051B49444154484B9D95094C53771CC77FA058
          A0A00539442B0E218A88085E9BF71DA751666088593530179CF19AC363286233
          8832AAE3184E17756AE281CE21631310C5231B4C9902411164285A82A5780085
          42A1A5FDEEF71A976C662BDD5EF249F3FA7EEFFBBBFFCF86DEB88E1F7FF09EA6
          EDE5B16E8356AC3718C8D0A387414F269D49A3AF094837E96CDBC9A087D1D8DB
          6B32F4C2CEA0373EEF6CEC4E50A669AFB25427637A53F36FF7070F96A6A57E55
          858CCC56A4A6354171E0095292955879210CF3F247625A9E149373BD10923304
          6373DCE1BE4F8C611BC5DFB3C83B8CD8A2B8F03029293F3639E557A4A5B542A1
          68C417C98FB12FF109642737E0ED7C0F4CFCC90B41391EF0CF1E8C91DF0D82CB
          6E0748168BB2F85519E3D6A783F5EB530377275C34A428EA919C5C87C4C4FB48
          9457223A538EA04B12045E74C7A80BAE2C2E8124DD1E5E722793DD10DBA32CBC
          9271EDD3011B88366F3A766247DC0F484CAA825C7E07F1BB4AB063E715F8E7B8
          C0F7C220789F1F08F7938E18B85304D735A2627E279399C93858E3C066C48860
          9FE8E8FDB7366C3E85B8F822C4C51561476C2162761D865F9617061DE907499C
          13DCB6383EB575B039C9A21B99118CAD350E041B9144322C78C9922DA723230F
          74AF9065205C968EE5E10ACC9FBB07B3A66E3779864B8B6D1C48108F67265A1B
          FD5F0310D20DF0F1F6DCB86EE58CABF24D8B349FAE59D43273EAB4229178F009
          7E7688D9C44C629C181B6BA337DBB5DF2137ED75FAA6ED3275759448A0BDEB03
          4D8917D43F92A9FC08D5ED8D2185A33D85B0A9F37F16EF29A78017F9A46CAF08
          86A97915F06C11F07406D0B800781189AEEA997898D50F050AFA65E1780A7E5D
          1EEB3268AB2097970554DF59B704689803547BA3BBDC03783C91EF67A1BD6C0C
          3B5C0AA896B2133B647F4EC5CE0EE64CAC9A20D2DDA454CD1D1669E4A8AB8703
          B5A3A1BD3F9D4BE4878EF240A87F1E0D636328F0320AA6FAE9283D44888DA034
          76E0C7F4B7D887BA332452E7519BA1790D50E5017DA5143D155274FEBE1806F5
          6AE895A168299B0CCDBDD968AF0D85511589C63C67E425D163160E635C2C3AE8
          B84193D4858E4073044C55C3A1291B87DED658985EADE3DA47014D613035CC87
          A176026A799375CF62A0FD4D8A6B29041F4F92B3F8488B0D6FC8A565EA6B9E5C
          9E77B934FEE87D30069ACAE9C0AB8F58FC7DFE7FB1B90FAA6B6FA1A37E35D09D
          005D85AFD94188AF799B85911DF0AF59D49CA2590D979C01F572E0D13874558E
          855E25E37A332AAEBB722EF0640AF4F7FCD05CC63D3226437BDB0D857B09A3A5
          E6BD986DB1D919DBC9EDE119D299542B60781088864229D4C541E8AC99C793C3
          5929A7415BE68F87D99E28C9B4474B75189A0B0620279E8C62117DCDE233FA9A
          A6FE15C7E89CEAA63F47CC110A73DF148A57A54150DDF087B2C01B4D45EEE86D
          FB0CC001A07E026E1F24ECFF904A59389519DFD724D9EC5B4B213C7A2DEDF779
          B1D4CBB8E1E1B87B548CD6AAA55C7719AEA4F487A1630F07B01075E709D9BBC8
          386AA8F94CDAC20CB766AB1DBEF898A24A32A8A3E9E628E0F932F4348401DA4F
          00DD36F4282360AC0940ED59426E0261D56C12BE66E9CC7C463893FABC849577
          895E4851B949F4E81697A03ED705CD575DA1BE3C103567FBE13A4F4DD636EA0A
          9D42E7D8F630F3013394B1FAB8160C07BB3AD182A80594F9E55A2A3EBD9554A7
          B6D28BF418AA92CDA18B12317DCB36294C04237C0B2C6FF13FE42538114ECA31
          CCF2D7354EE2DFBD4C1CB39A99C2B8FF1FF13FFD09E5B263248C941136D5F775
          C4C207DE9EB1788AFE01703ACF5C82D030FC0000000049454E44AE426082}
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
        Left = 234
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
      Left = 235
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
    Font.Height = -11
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
    object tProIncluidoEm: TDateTimeField
      FieldName = 'IncluidoEm'
    end
    object tProPrecoAuto: TBooleanField
      FieldName = 'PrecoAuto'
    end
    object tProMargem: TFloatField
      FieldName = 'Margem'
    end
    object tProComissaoPerc: TFloatField
      FieldName = 'ComissaoPerc'
    end
    object tProComissaoLucro: TBooleanField
      FieldName = 'ComissaoLucro'
    end
    object tProRecVer: TIntegerField
      FieldName = 'RecVer'
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
