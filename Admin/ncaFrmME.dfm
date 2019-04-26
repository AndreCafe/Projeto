object FrmME: TFrmME
  Left = 0
  Top = 0
  Caption = 'FrmME'
  ClientHeight = 573
  ClientWidth = 770
  Color = clGray
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panCli: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 31
    Width = 770
    Height = 52
    Margins.Left = 0
    Margins.Top = 1
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 0
  end
  object panTot: TLMDSimplePanel
    Left = 0
    Top = 288
    Width = 770
    Height = 285
    Margins.Left = 0
    Margins.Top = 1
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alBottom
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    Color = clWhite
    TabOrder = 2
  end
  object panLista: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 137
    Width = 770
    Height = 151
    Margins.Left = 0
    Margins.Top = 1
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    Color = clWhite
    TabOrder = 1
    object cbCompra: TcxCheckBox
      Left = 184
      Top = 88
      Cursor = crHandPoint
      Caption = 'Atualiza custo dos produtos (compra)'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfFlat
      Style.TextColor = clWhite
      Style.TextStyle = []
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 0
      Transparent = True
      OnClick = cbCompraClick
      Width = 281
    end
  end
  object cbRecibo: TcxCheckBox
    Left = 379
    Top = 7
    TabStop = False
    AutoSize = False
    Caption = 'Emitir Recibo'
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.NativeStyle = True
    Style.TextColor = clWhite
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 3
    Visible = False
    Height = 21
    Width = 86
  end
  object cbFocus: TCheckBox
    Left = 0
    Top = 3000
    Width = 590
    Height = 17
    Caption = 'cbFocus'
    TabOrder = 4
  end
  object panBuscaProd: TLMDSimplePanel
    AlignWithMargins = True
    Left = 0
    Top = 84
    Width = 770
    Height = 52
    Margins.Left = 0
    Margins.Top = 1
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Bevel.BorderColor = clRed
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 9
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
      30
      0)
    object BarMgrBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'Controles'
      CaptionButtons = <>
      Color = clMedGray
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 164
      FloatTop = 132
      FloatClientWidth = 23
      FloatClientHeight = 22
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmGravar'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmContCompra'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmRecibo'
        end
        item
          Visible = True
          ItemName = 'cmConfig'
        end>
      MultiLine = True
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Controles'
      OneOnRow = True
      Row = 0
      ShowMark = False
      SizeGrip = False
      UseOwnFont = False
      UseRecentItems = False
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object cmRecibo: TdxBarControlContainerItem
      Caption = 'Emitir Recibo'
      Category = 0
      Hint = 'Emitir Recibo'
      Visible = ivAlways
      Control = cbRecibo
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object cmConfig: TdxBarLargeButton
      Align = iaRight
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
      LargeImageIndex = 33
      OnClick = cmConfigClick
      AutoGrayScale = False
      ShowCaption = False
    end
    object cmContCompra: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivNever
      Control = cbCompra
    end
    object cmGravar: TdxBarButton
      Caption = 'Salvar (F2)'
      Category = 0
      Hint = 'Salvar (F2)'
      Style = cxStyle5
      Visible = ivAlways
      OnClick = cmGravarClick
    end
    object cmCancelar: TdxBarButton
      Caption = 'Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Style = cxStyle5
      Visible = ivAlways
      OnClick = cmCancelarClick
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
end
