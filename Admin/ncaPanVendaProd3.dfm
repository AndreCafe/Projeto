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
        Height = 52
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
          Left = 0
          Top = 0
          Width = 1080
          Height = 52
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          Bevel.Mode = bmStandard
          Bevel.StandardStyle = lsNone
          Color = clWhite
          TabOrder = 0
          object imgBarcodeScan: TImage
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 65
            Height = 52
            Cursor = crHandPoint
            Margins.Left = 0
            Margins.Top = 0
            Margins.Bottom = 0
            Align = alLeft
            Center = True
            Constraints.MaxHeight = 64
            Picture.Data = {
              0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
              00380000002008060000004703BBE8000000097048597300000EC400000EC401
              952B0E1B000003214944415478DAED995D28A45118C7FFAF595146534A1A0985
              B871A9A6DD213728CC4E4B3BB3DA5B1F17922B512E10427229947CC4C5984DED
              F8261FF9986DF7464A24940BF9BAF0B1AC94F9DA739E452F6677A9113B7B9E7A
              E73DCF73CE73CEF33BE79DF39C774682178BCBE582F4DC413C3920FF70279999
              995431343474ADDFAABF6B7F68BB27F477BB580250000A4001280005A000F47A
              404932DFAD5850ABDFF3BB56ABFDA52F2CDCAA97DB79CF6FAE742BD3AFA74C6E
              FF3A3707BB8F0F955F399DD02425DDB46741E0756222E9DF6667615328A8EC23
              B3CBFB958FFF657E1E4E4982766FEFD33D3A97CBE011C0C7B4FB9BBF7C22E4F6
              DF01DEF80B4001F82F03BA91E7DA453FA4A5E187AFEFBD76BA8C0CB824E94FFE
              4F972614AC0FCBF030E97A1688E32A10B95D1EB8D26683697CFCA63DDF453F8F
              8C90FE312505DFFDFCA8CC77DB6BFB5BD6CEE906F05D7A3A6C6CC5FFF33C2800
              05A0007CF1802F5504E0430147474731333383A2A22238597E6A6F6F477C7C3C
              0C06037A7A7AB0BBBB8BD2D252984C26ACADAD212F2F0F76BB1D1D1D1D4861B9
              4DA3D1A0A6A606010101282929416F6F2F36373751505080F3F3737475752121
              21017ABD9EFA090F0F47616121F551565686EAEA6A2C2D2D6184E5C5888808E4
              E6E67A1670676707F9F9F914241F940F18191989BABA3A0A3E3B3B1BE5E5E568
              6868C0F1F1310537393949E056AB15131313383B3B434E4E0E8659F2AFA8A820
              BDB8B818DBDBDB686C6C445C5C1CF9676565D1E4555656A2A5A505030303E8EB
              EB834AA542777737FCFDFD61341A3D0B38353505B3D98CD4D454381C0E2C2F2F
              636565856C3A9D0E4AA512CDCDCD585C5CA4D54E62EF7B7C455A5B5B61632797
              FAFA7A3A3F72FFAAAA2A8C8D8D6170701069EC847378784890ABABABE8ECEC44
              7F7F3FDADADA303D3D8DDADA5A582C1634353521393999E079BDE2EA9DD16380
              070707383D3D454C4C0CFDE6BFBEBE8ED0D050040606528097979750ABD5383A
              3AA22B3A3A1A171717D8DADAA295E1B2B1B141F7D8D858F2393939415454143D
              F2BCBFB0B0309A28FEE8060505D1C5657F7F1FC1C1C1342EF70B090979DC7750
              92BCF73F18AF07FC0920F21503A014DE2D0000000049454E44AE426082}
            Transparent = True
            OnClick = lbPromptProdClick
            ExplicitLeft = 1
            ExplicitTop = 1
            ExplicitHeight = 50
          end
          object LMDSimplePanel3: TLMDSimplePanel
            AlignWithMargins = True
            Left = 71
            Top = 0
            Width = 1009
            Height = 52
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            Bevel.Mode = bmCustom
            ParentColor = True
            TabOrder = 0
            object edProd: TcxButtonEdit
              Left = 84
              Top = 0
              Cursor = crHandPoint
              Hint = 
                'Digite o C'#243'digo ou Descri'#231#227'o do produto e pressione <ENTER> ... ' +
                'Ou utilize o leitor de c'#243'digo de barras.'
              Align = alClient
              OnFocusChanged = edProdFocusChanged
              ParentColor = True
              ParentFont = False
              PopupMenu = popFrm
              Properties.Buttons = <
                item
                  Default = True
                end>
              Properties.OnButtonClick = edProdPropertiesButtonClick
              Properties.OnChange = edProdPropertiesChange
              Style.BorderStyle = ebsNone
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -19
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.HotTrack = False
              Style.StyleController = FrmPri.cxEditStyleController1
              Style.TransparentBorder = False
              Style.ButtonStyle = btsUltraFlat
              Style.ButtonTransparency = ebtInactive
              Style.IsFontAssigned = True
              StyleFocused.BorderStyle = ebsNone
              StyleFocused.TextColor = clBlue
              TabOrder = 1
              OnEnter = edCodEnter
              OnKeyDown = edProdKeyDown
              OnKeyUp = edProdKeyUp
              Width = 592
            end
            object panDigite: TLMDSimplePanel
              AlignWithMargins = True
              Left = 144
              Top = 3
              Width = 502
              Height = 46
              Margins.Left = 60
              Margins.Right = 30
              Align = alClient
              Bevel.Mode = bmCustom
              ParentColor = True
              TabOrder = 2
              object imgSeta: TImage
                Left = 0
                Top = 0
                Width = 41
                Height = 46
                Cursor = crHandPoint
                Align = alLeft
                Center = True
                Picture.Data = {
                  0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
                  0028000000140806000000FF467FBB000000097048597300000E7500000E7501
                  B9635132000000FB4944415478DA6364A033F8FFFF3F49EA1949D5406F303C1C
                  282525E50EA4548078C7B367CFEE0E1A07021D2608A4A280D8142A3415E8C0D3
                  83C28150C7D502B110546839D0713BE9E9389C0E043A4E19EA381078C7000939
                  BA462D4E0742D35B24947B07EAB8F703E1380C07021D074A6BD948F22007C21C
                  778ACA76DF21C6E3E80EAC6180E4567A0358C60305C8296487A33B700194B99C
                  0192F640695198CA8E3125207F1AE8C0A9B81C1801A43CA08E6BA647DA836648
                  58490162DF452ECAB065926CA82FE9E6487C005731037724D0814583CE815047
                  C2320CA87A5B31181D08AA49FA19D012EDA071E0600183DF81F4B690E416F560
                  7720001A568CD97DFB5C380000000049454E44AE426082}
                OnClick = lbDigiteProdutoClick
                ExplicitHeight = 33
              end
              object lbDigiteProduto: TcxLabel
                Left = 41
                Top = 0
                Cursor = crHandPoint
                Align = alClient
                Caption = 'Digite o c'#243'digo ou nome do produto'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -16
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.TextColor = clGray
                Style.IsFontAssigned = True
                Properties.Alignment.Vert = taVCenter
                Properties.WordWrap = True
                OnClick = lbDigiteProdutoClick
                Width = 461
                AnchorY = 23
              end
            end
            object panQtd: TLMDSimplePanel
              Left = 0
              Top = 0
              Width = 84
              Height = 52
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              AutoSize = True
              Align = alLeft
              Bevel.BorderSides = [fsRight]
              Bevel.Mode = bmStandard
              Bevel.StandardStyle = lsNone
              ParentColor = True
              TabOrder = 0
              object edQtd: TcxCurrencyEdit
                Left = 0
                Top = 0
                Cursor = crHandPoint
                Hint = 'Quantidade'
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                Align = alLeft
                OnFocusChanged = edQtdFocusChanged
                EditValue = 1.000000000000000000
                ImeName = 'g'
                ParentColor = True
                ParentFont = False
                Properties.AssignedValues.DisplayFormat = True
                Properties.DecimalPlaces = 5
                Properties.ImeName = 'g'
                Properties.OnChange = edQtdPropertiesChange
                Properties.OnEditValueChanged = edQtdPropertiesEditValueChanged
                Style.BorderStyle = ebsNone
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -19
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.HotTrack = False
                Style.StyleController = FrmPri.cxEditStyleController1
                Style.TransparentBorder = False
                Style.IsFontAssigned = True
                StyleFocused.BorderStyle = ebsNone
                StyleFocused.TextColor = clBlue
                TabOrder = 0
                OnKeyDown = edQtdKeyDown
                Width = 19
              end
              object lbUnidade: TcxLabel
                AlignWithMargins = True
                Left = 19
                Top = 0
                Cursor = crHandPoint
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 0
                Align = alLeft
                Caption = '(0)'
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
                OnClick = lbUnidadeClick
                AnchorY = 25
              end
              object lbX: TcxLabel
                AlignWithMargins = True
                Left = 59
                Top = 0
                Margins.Left = 10
                Margins.Top = 0
                Margins.Right = 14
                Margins.Bottom = 0
                Align = alLeft
                Caption = 'X'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -19
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.TextColor = 6579300
                Style.TextStyle = []
                Style.TransparentBorder = False
                Style.IsFontAssigned = True
                Properties.Alignment.Vert = taVCenter
                OnClick = lbUnidadeClick
                AnchorY = 26
              end
              object imgPinQtd: TMyImage
                Left = 1
                Top = 42
                Width = 12
                Height = 12
                Cursor = crHandPoint
                Hint = 'SEMPRE come'#231'ar pela quantidade'
                OnClick = imgPinQtdClick
                MouseOverDrawMode = idmNormal
                MouseOffDrawMode = idmNormal
                MouseDownDrawMode = idmGrayScale
                ImageList = imgsPin
                ImageIndex = 0
                Colorize = True
              end
              object cxLabel1: TcxLabel
                Left = 2
                Top = -1
                Caption = 'Quantidade'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -9
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = []
                Style.IsFontAssigned = True
              end
            end
            object btnLancar: TcxButton
              AlignWithMargins = True
              Left = 966
              Top = 0
              Width = 43
              Height = 52
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alRight
              Caption = 'Lan'#231'ar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              TabStop = False
              Visible = False
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
              Left = 676
              Top = 0
              Width = 287
              Height = 52
              AutoSize = True
              Align = alRight
              Bevel.Mode = bmCustom
              ParentColor = True
              TabOrder = 3
              Visible = False
              object lbTotal: TcxLabel
                Left = 197
                Top = 0
                Align = alRight
                Caption = 'R$ 10,00'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -19
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.TextColor = clRed
                Style.IsFontAssigned = True
                Properties.Alignment.Vert = taVCenter
                AnchorY = 26
              end
              object lbX2: TcxLabel
                AlignWithMargins = True
                Left = 155
                Top = 0
                Margins.Left = 7
                Margins.Top = 0
                Margins.Right = 7
                Margins.Bottom = 0
                Align = alRight
                Caption = 'X'
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -19
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.TextColor = clGray
                Style.TextStyle = []
                Style.IsFontAssigned = True
                Properties.Alignment.Vert = taVCenter
                AnchorY = 26
              end
              object lbIgual: TcxLabel
                Left = 177
                Top = 0
                Align = alRight
                Caption = '='
                ParentFont = False
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -19
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.TextColor = clGray
                Style.IsFontAssigned = True
                Properties.Alignment.Vert = taVCenter
                AnchorY = 26
              end
              object edUnit: TcxCurrencyEdit
                Left = 0
                Top = 0
                Cursor = crHandPoint
                Align = alRight
                OnFocusChanged = edUnitFocusChanged
                EditValue = 0.000000000000000000
                ParentColor = True
                ParentFont = False
                Properties.Alignment.Horz = taLeftJustify
                Properties.OnChange = edUnitPropertiesChange
                Properties.OnEditValueChanged = edUnitPropertiesEditValueChanged
                Style.BorderStyle = ebsNone
                Style.Font.Charset = DEFAULT_CHARSET
                Style.Font.Color = clWindowText
                Style.Font.Height = -19
                Style.Font.Name = 'Tahoma'
                Style.Font.Style = [fsBold]
                Style.HotTrack = False
                Style.TransparentBorder = False
                Style.IsFontAssigned = True
                StyleFocused.BorderColor = clBlue
                StyleFocused.BorderStyle = ebsSingle
                StyleFocused.TextColor = clBlue
                TabOrder = 3
                OnKeyDown = edUnitKeyDown
                Width = 148
              end
              object lbUnit: TcxLabel
                Left = 1
                Top = 34
                Caption = 'Valor Unit'#225'rio'
                Properties.Alignment.Vert = taBottomJustify
                Visible = False
                AnchorY = 51
              end
            end
            object imgPinCod: TMyImage
              Left = 87
              Top = 42
              Width = 12
              Height = 12
              Cursor = crHandPoint
              Hint = 'SEMPRE come'#231'ar pelo produto'
              OnClick = imgPinCodClick
              MouseOverDrawMode = idmNormal
              MouseOffDrawMode = idmFaded
              MouseDownDrawMode = idmGrayScale
              ImageList = imgsPin
              ImageIndex = 0
              Colorize = True
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
end
