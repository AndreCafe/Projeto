inherited FrmPanVendaProd2: TFrmPanVendaProd2
  Caption = 'FrmPanVendaProd2'
  ClientHeight = 413
  ClientWidth = 1080
  OnResize = FormResize
  ExplicitWidth = 1096
  ExplicitHeight = 451
  PixelsPerInch = 96
  TextHeight = 13
  inherited panVendaProd: TLMDSimplePanel
    Width = 1080
    Height = 413
    Margins.Left = 2
    Margins.Top = 0
    Margins.Right = 2
    Margins.Bottom = 2
    ParentColor = True
    OnResize = panVendaProdResize
    ExplicitWidth = 1080
    ExplicitHeight = 413
    object panInner: TLMDSimplePanel
      Left = 0
      Top = 0
      Width = 1080
      Height = 413
      Margins.Top = 0
      Align = alClient
      Bevel.Mode = bmCustom
      ParentColor = True
      TabOrder = 0
      object panBuscaTop: TLMDSimplePanel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 1080
        Height = 61
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Bevel.BorderSides = [fsBottom]
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsNone
        ParentColor = True
        TabOrder = 0
        OnResize = panBuscaTopResize
        object panProd: TLMDSimplePanel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 1079
          Height = 61
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 1
          Margins.Bottom = 0
          Align = alClient
          Bevel.Mode = bmStandard
          Bevel.StandardStyle = lsNone
          ParentColor = True
          TabOrder = 0
          object LMDSimplePanel3: TLMDSimplePanel
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 1078
            Height = 61
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 1
            Margins.Bottom = 0
            Align = alClient
            Bevel.Mode = bmCustom
            ParentColor = True
            TabOrder = 0
            object panQtd: TLMDSimplePanel
              AlignWithMargins = True
              Left = 0
              Top = 0
              Width = 131
              Height = 61
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 1
              Margins.Bottom = 0
              Align = alLeft
              Bevel.BorderSides = [fsRight]
              Bevel.EdgeStyle = etSunkenInner
              Bevel.Mode = bmStandard
              Bevel.StandardStyle = lsNone
              ParentColor = True
              TabOrder = 0
              object edQtd: TcxCurrencyEdit
                AlignWithMargins = True
                Left = 7
                Top = 22
                Cursor = crHandPoint
                Hint = 'Quantidade'
                Margins.Left = 7
                Margins.Top = 0
                Margins.Right = 7
                Margins.Bottom = 7
                Align = alClient
                OnFocusChanged = edQtdFocusChanged
                EditValue = 1.000000000000000000
                ImeName = 'g'
                ParentFont = False
                Properties.AssignedValues.DisplayFormat = True
                Properties.DecimalPlaces = 5
                Properties.ImeName = 'g'
                Properties.OnChange = edQtdPropertiesChange
                Properties.OnEditValueChanged = edQtdPropertiesEditValueChanged
                Style.BorderStyle = ebsFlat
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -19
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.HotTrack = False
                Style.StyleController = FrmPri.cxEditStyleController1
                Style.TransparentBorder = False
                Style.IsFontAssigned = True
                StyleFocused.BorderStyle = ebsFlat
                StyleFocused.TextColor = clBlue
                TabOrder = 0
                OnKeyDown = edQtdKeyDown
                Width = 80
              end
              object cxLabel1: TcxLabel
                AlignWithMargins = True
                Left = 7
                Top = 2
                Cursor = crHandPoint
                Margins.Left = 7
                Margins.Top = 2
                Margins.Right = 0
                Align = alTop
                Caption = 'Quantidade'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.TextColor = 5066061
                Style.IsFontAssigned = True
                Properties.Alignment.Horz = taLeftJustify
                Properties.Alignment.Vert = taBottomJustify
                OnClick = cxLabel1Click
                AnchorY = 19
              end
              object lbUnidade: TcxLabel
                AlignWithMargins = True
                Left = 94
                Top = 22
                Cursor = crHandPoint
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 10
                Margins.Bottom = 5
                Align = alRight
                Caption = 'KG'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -19
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.TextColor = 6579300
                Style.TextStyle = [fsBold]
                Style.TransparentBorder = False
                Style.IsFontAssigned = True
                Properties.Alignment.Vert = taVCenter
                Visible = False
                OnClick = lbUnidadeClick
                AnchorY = 39
              end
            end
            object btnLancar: TcxButton
              AlignWithMargins = True
              Left = 1032
              Top = 10
              Width = 43
              Height = 46
              Cursor = crHandPoint
              Margins.Left = 0
              Margins.Top = 10
              Margins.Bottom = 5
              Align = alRight
              Caption = 'Lan'#231'ar'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              TabStop = False
              OnClick = btnLancarClick
              LookAndFeel.Kind = lfFlat
              LookAndFeel.NativeStyle = False
              OptionsImage.Glyph.Data = {
                D6050000424DD6050000000000003600000028000000180000000F0000000100
                200000000000A005000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000002F000000CF000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000005F000000EF000000FF000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000F0000009F000000FF000000FF000000FF000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000002F000000DF000000FF000000FF000000FF000000FF000000FF0000
                00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
                00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
                0000000000EF000000FF000000FF000000FF000000FF000000FF000000FF0000
                00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
                00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
                00000000000F000000BF000000FF000000FF000000FF000000FF000000FF0000
                00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
                00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
                000000000000000000000000007F000000FF000000FF000000FF000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000FF000000FF000000FF0000000000000000000000000000
                00000000000000000000000000000000004F000000EF000000FF000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000FF000000FF000000FF0000000000000000000000000000
                0000000000000000000000000000000000000000001F000000CF000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000FF000000FF000000FF0000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000FF000000FF000000FF0000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                000000000000000000FF000000FF000000FF0000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              OptionsImage.Layout = blGlyphBottom
              SpeedButtonOptions.CanBeFocused = False
              SpeedButtonOptions.AllowAllUp = True
              SpeedButtonOptions.Flat = True
            end
            object panValor: TLMDSimplePanel
              AlignWithMargins = True
              Left = 912
              Top = 0
              Width = 120
              Height = 61
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alRight
              Bevel.Mode = bmCustom
              ParentColor = True
              TabOrder = 1
              object lbTotal: TcxLabel
                AlignWithMargins = True
                Left = 7
                Top = 22
                Margins.Left = 7
                Margins.Top = 0
                Margins.Right = 7
                Margins.Bottom = 7
                Align = alClient
                ParentFont = False
                Style.BorderStyle = ebsFlat
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -19
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.TextColor = clRed
                Style.IsFontAssigned = True
                Properties.Alignment.Horz = taRightJustify
                Properties.Alignment.Vert = taVCenter
                AnchorX = 113
                AnchorY = 38
              end
              object cxLabel2: TcxLabel
                AlignWithMargins = True
                Left = 7
                Top = 2
                Margins.Left = 7
                Margins.Top = 2
                Margins.Right = 0
                Align = alTop
                Caption = 'Total'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.TextColor = 5066061
                Style.IsFontAssigned = True
                Properties.Alignment.Horz = taLeftJustify
                Properties.Alignment.Vert = taBottomJustify
                AnchorY = 19
              end
            end
            object panEdProd: TLMDSimplePanel
              Left = 132
              Top = 0
              Width = 627
              Height = 61
              Align = alClient
              Bevel.Mode = bmCustom
              ParentColor = True
              TabOrder = 3
              object edProd: TcxButtonEdit
                AlignWithMargins = True
                Left = 7
                Top = 22
                Cursor = crHandPoint
                Hint = 
                  'Digite o C'#243'digo ou Descri'#231#227'o do produto e pressione <ENTER> ... ' +
                  'Ou utilize o leitor de c'#243'digo de barras.'
                Margins.Left = 7
                Margins.Top = 0
                Margins.Right = 7
                Margins.Bottom = 7
                Align = alClient
                OnFocusChanged = edProdFocusChanged
                ParentFont = False
                PopupMenu = popFrm
                Properties.Buttons = <
                  item
                    Default = True
                  end>
                Properties.OnButtonClick = edProdPropertiesButtonClick
                Properties.OnChange = edProdPropertiesChange
                Style.BorderStyle = ebsFlat
                Style.Color = clWhite
                Style.Font.Charset = ANSI_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -19
                Style.Font.Name = 'Segoe UI'
                Style.Font.Style = [fsBold]
                Style.HotTrack = False
                Style.StyleController = FrmPri.cxEditStyleController1
                Style.TransparentBorder = False
                Style.ButtonStyle = btsUltraFlat
                Style.ButtonTransparency = ebtInactive
                Style.IsFontAssigned = True
                StyleFocused.BorderStyle = ebsFlat
                StyleFocused.TextColor = clBlue
                TabOrder = 0
                OnEnter = edCodEnter
                OnExit = edProdExit
                OnKeyDown = edProdKeyDown
                OnKeyUp = edProdKeyUp
                Width = 613
              end
              object cxLabel3: TcxLabel
                AlignWithMargins = True
                Left = 7
                Top = 2
                Cursor = crHandPoint
                Margins.Left = 7
                Margins.Top = 2
                Margins.Right = 0
                Align = alTop
                Caption = 'C'#243'digo ou Nome do Produto'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.TextColor = 5066061
                Style.IsFontAssigned = True
                Properties.Alignment.Horz = taLeftJustify
                Properties.Alignment.Vert = taBottomJustify
                OnClick = cxLabel3Click
                AnchorY = 19
              end
              object lbDigiteProduto: TcxLabel
                Left = 25
                Top = 22
                Cursor = crHandPoint
                AutoSize = False
                Caption = 
                  'Digite o c'#243'digo ou nome do produto (aceita leitor de c'#243'digo de b' +
                  'arras)'
                ParentColor = False
                ParentFont = False
                Style.Color = clWhite
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -13
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.HotTrack = True
                Style.TextColor = clSilver
                Style.IsFontAssigned = True
                StyleHot.BorderStyle = ebsNone
                StyleHot.TextColor = clBlack
                Properties.Alignment.Vert = taVCenter
                Properties.WordWrap = True
                Visible = False
                OnClick = lbDigiteProdutoClick
                Height = 32
                Width = 448
                AnchorY = 38
              end
            end
            object panPreco: TLMDSimplePanel
              AlignWithMargins = True
              Left = 759
              Top = 0
              Width = 153
              Height = 61
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alRight
              Bevel.Mode = bmCustom
              ParentColor = True
              TabOrder = 4
              object lbPreco: TcxLabel
                AlignWithMargins = True
                Left = 7
                Top = 2
                Cursor = crHandPoint
                Margins.Left = 7
                Margins.Top = 2
                Margins.Right = 0
                Align = alTop
                Caption = 'Pre'#231'o'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -11
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.TextColor = 5066061
                Style.IsFontAssigned = True
                Properties.Alignment.Horz = taLeftJustify
                Properties.Alignment.Vert = taBottomJustify
                OnClick = lbPrecoClick
                AnchorY = 19
              end
              object edUnit: TcxCurrencyEdit
                AlignWithMargins = True
                Left = 7
                Top = 22
                Cursor = crHandPoint
                Margins.Left = 7
                Margins.Top = 0
                Margins.Right = 7
                Margins.Bottom = 7
                Align = alClient
                OnFocusChanged = edUnitFocusChanged
                Enabled = False
                ParentFont = False
                Properties.Alignment.Horz = taLeftJustify
                Properties.OnChange = edUnitPropertiesChange
                Properties.OnEditValueChanged = edUnitPropertiesEditValueChanged
                Style.BorderStyle = ebsFlat
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -19
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.HotTrack = False
                Style.TransparentBorder = False
                Style.IsFontAssigned = True
                StyleFocused.BorderColor = clBlue
                StyleFocused.BorderStyle = ebsFlat
                StyleFocused.TextColor = clBlue
                TabOrder = 1
                OnKeyDown = edUnitKeyDown
                Width = 139
              end
            end
          end
        end
      end
    end
  end
  object lbSize: TcxLabel
    Left = 403
    Top = 168
    Caption = 'lbSize'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object tPro: TnxTable
    ActiveRuntime = True
    Database = Dados.db
    Filter = '(plus<>true)'
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    TableName = 'Produto'
    IndexName = 'IDescricao'
    Left = 176
    Top = 120
    object tProID: TAutoIncField
      FieldName = 'ID'
    end
    object tProCodigo: TStringField
      FieldName = 'Codigo'
      Size = 30
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
    Left = 208
    Top = 120
  end
  object tCodR: TnxTable
    ActiveRuntime = True
    Database = Dados.db
    Filter = '(plus<>true)'
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    TableName = 'Produto'
    IndexName = 'ICodigo'
    Left = 176
    Top = 168
  end
  object popFrm: TSpTBXFormPopupMenu
    AutoPopup = False
    MenuAnimation = [maNone]
    OnPopup = popFrmPopup
    AutoSize = True
    ShowShadows = False
    SkinType = sknNone
    OnClosePopup = popFrmClosePopup
    OnBeforePopup = popFrmBeforePopup
    Left = 280
    Top = 264
  end
  object TimerPop: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerPopTimer
    Left = 344
    Top = 200
  end
  object TimerSelectAllProd: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerSelectAllProdTimer
    Left = 520
    Top = 208
  end
  object TimerFocusProd: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerFocusProdTimer
    Left = 624
    Top = 160
  end
  object TimerClosePesq: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerClosePesqTimer
    Left = 80
    Top = 168
  end
  object imgsPin: TcxImageList
    Height = 7
    Width = 7
    FormatVersion = 1
    DesignInfo = 6291536
    ImageInfo = <
      item
        Image.Data = {
          FA000000424DFA00000000000000360000002800000007000000070000000100
          200000000000C400000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000FF0000FF000000000000000000000000000000000000000000000000FF00
          00FF000000000000000000000000000000000000000000000000FF0000FF0000
          0000000000000000000000000000FF0000FF00000000FF0000FF00000000FF00
          00FF000000000000000000000000FF0000FFFF0000FFFF0000FF000000000000
          0000000000000000000000000000FF0000FF000000000000000000000000}
      end
      item
        Image.Data = {
          FA000000424DFA00000000000000360000002800000007000000070000000100
          200000000000C400000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000071000071FF00
          00FF7100007100000000000000000000000000000000FF0000FFFF0000FFFF00
          00FF0000000000000000000000000000000071000071FF0000FF710000710000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          FA000000424DFA00000000000000360000002800000007000000070000000100
          200000000000C400000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000F0F0F1C6D6D
          6DC68D8D8DFF6D6D6DC60F0F0F1C00000000000000006D6D6DC68D8D8DFF8D8D
          8DFF8D8D8DFF6D6D6DC600000000000000008D8D8DFF8D8D8DFF8D8D8DFF8D8D
          8DFF8D8D8DFF00000000000000006D6D6DC68D8D8DFF8D8D8DFF8D8D8DFF6D6D
          6DC600000000000000000F0F0F1C6D6D6DC68D8D8DFF6D6D6DC60F0F0F1C0000
          000000000000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          FA000000424DFA00000000000000360000002800000007000000070000000100
          200000000000C400000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000001C00001CC600
          00C6FF0000FFC60000C61C00001C0000000000000000C60000C6FF0000FFFF00
          00FFFF0000FFC60000C60000000000000000FF0000FFFF0000FFFF0000FFFF00
          00FFFF0000FF0000000000000000C60000C6FF0000FFFF0000FFFF0000FFC600
          00C600000000000000001C00001CC60000C6FF0000FFC60000C61C00001C0000
          000000000000000000000000000000000000000000000000000000000000}
      end>
  end
  object TimerAutoPop: TTimer
    Enabled = False
    OnTimer = TimerAutoPopTimer
    Left = 152
    Top = 256
  end
end
