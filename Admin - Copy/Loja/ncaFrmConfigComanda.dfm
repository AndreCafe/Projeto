inherited FrmConfigComanda: TFrmConfigComanda
  Caption = 'FrmConfigComanda'
  ClientHeight = 503
  ClientWidth = 643
  Color = clWhite
  ExplicitWidth = 649
  ExplicitHeight = 528
  PixelsPerInch = 96
  TextHeight = 16
  inherited panPri: TLMDSimplePanel
    Width = 623
    Height = 200
    ExplicitWidth = 623
    ExplicitHeight = 200
    inherited panTopo: TLMDSimplePanel
      Width = 623
      Height = 138
      AutoSize = True
      ExplicitWidth = 623
      ExplicitHeight = 138
      inherited img: TImage
        Align = alNone
        Picture.Data = {
          0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
          00300000003008060000005702F987000000097048597300000EC400000EC401
          952B0E1B0000031A4944415478DAED9A5F4853511CC77F73DA74A5528EF02122
          FBB748082A289408EA21F6E2C225D4206242D24310444B36CAFE5839A1D94BF4
          D0F6B0118114E1C37C19053D5A16D153D1161884F5501BA8599B7377EBF73BED
          5CC694CDB89EB98BF73B0EBFF3E7B7CBF773EF3DE7DEBB3B5D369B05354BB72A
          00DA2E87CE61B881A5B94CBEBE63B9F9EAAED5A71800CD5FC2E02D93F1425D40
          88FB4A01240C55C57212A934CCA7338ADDEAB0D419F450ADD7F3AE1402189402
          144DF89D9C87B3C77681AD6D0B6C32AD5504F0F9DB0CB81E8DC3D79FB3320402
          E884016432FF86C6878E2B325E08D139F01CEA8D6BC403481989C537439DCB06
          406A3DFF0C1A04014C62B988858EEF430468CC07B0D96C2C06834170381C0B62
          A9B1919111E100ADB8C18FB9FE839224BD6600F7D403B01537F825D7BF232D49
          51AABF551140FE113023C027B501ACC70D4EA90AA00898EA0176224044CD00AA
          3F022F11E048C503A0D13E0CFD8B8D4DCDCEC175FB5E3875787B4503C80912DE
          FB24E6D290C54F3225C1C9432D70E7CC0139D762B1B0383C3C0C76BB7D412C35
          160E87C501907953BD017ABBF6405D4D35B434AF838D8D4610212100BF122978
          DA7B14766FDE20C4B47080993F29F8F0A04BB8790D4003D0003480A503D05534
          140AB1BAC9646257D4F6F67688C7E3E0F57A211261F77A60369BC1E974425353
          136BD3B8DBED86582C265F7DCB0E108D46C1E57231E31D1D1D10080458DDE7F3
          C96004431A1B1B03ABD5CA00098CDA5C2B06C08DD09E25A3F96DAAE79BE3F748
          D42670DAF38539AA01E05AAC4F03F81F007E9E777777B33940939226EDE0E020
          03A0D3C4EFF7B3DC9E9E1E797E540C00AD24648C44AB0C99A7E8F17860747454
          9ED42482E1A03446B97C22D3D1A3EFD1585901483421F3975132C1974A6E9403
          7283F9FD5C2B06204A1A8006A00168000B01E8A1FE093ED4B70A7EA88F4C4EC3
          09CF8BE57FC5C47E5669A885DBA7F7C3BE6D2621E6DF4FC4A0EFF13BF8319D04
          7D956E79013844626E1E84BDDC47AB46438D6C1E954580A2AF7897027015C32D
          41964BE90A020C2802C841B8315CC3525B26E3492CFD68DE532A7175FCD9A392
          F517DEFA0ADD5975B69B0000000049454E44AE426082}
        ExplicitHeight = 32
      end
      object LMDSimplePanel2: TLMDSimplePanel
        AlignWithMargins = True
        Left = 50
        Top = 0
        Width = 573
        Height = 128
        Margins.Left = 50
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 10
        AutoSize = True
        Align = alTop
        Bevel.Mode = bmCustom
        ParentColor = True
        TabOrder = 0
        object cxLabel1: TcxLabel
          AlignWithMargins = True
          Left = 12
          Top = 29
          Margins.Left = 12
          Align = alTop
          Caption = 
            'Nesse modo de consumo os clientes ganham um cart'#227'o ao entrar na ' +
            'loja. Cada item consumido '#233' registrado no cart'#227'o que dever'#225' ser ' +
            'apresentado no caixa fechar e pagar a conta.'
          Style.TextColor = clBlack
          Style.TextStyle = []
          Properties.WordWrap = True
          Width = 558
        end
        object cxLabel2: TcxLabel
          AlignWithMargins = True
          Left = 12
          Top = 3
          Margins.Left = 12
          Align = alTop
          Caption = 'Consumo por Comandas / Cart'#227'o de Consumo'
          Style.TextStyle = [fsUnderline]
        end
        object panEdit: TLMDSimplePanel
          Left = 0
          Top = 68
          Width = 573
          Height = 36
          AutoSize = True
          Align = alTop
          Bevel.Mode = bmCustom
          ParentColor = True
          TabOrder = 2
          object lbComandaNumeracao: TcxLabel
            AlignWithMargins = True
            Left = 26
            Top = 37
            Margins.Left = 26
            Align = alTop
            Caption = '2. Numera'#231#227'o das comandas'
            Style.TextStyle = [fsBold]
            StyleHot.TextStyle = []
            ExplicitTop = 13
          end
          object cbUsarComandas: TcxCheckBox
            AlignWithMargins = True
            Left = 8
            Top = 7
            Cursor = crHandPoint
            Margins.Left = 8
            Margins.Top = 7
            Align = alTop
            Caption = '1. Ativar o consumo por Comandas / Cart'#227'o de Consumo'
            Style.LookAndFeel.Kind = lfFlat
            Style.LookAndFeel.NativeStyle = False
            Style.TextStyle = [fsBold]
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 1
            OnClick = cbUsarComandasClick
            Width = 562
          end
        end
      end
    end
    inherited lbDescr: TcxLabel
      Top = 138
      Visible = False
      ExplicitTop = 138
      ExplicitWidth = 565
      Width = 565
    end
  end
  inherited LMDSimplePanel1: TLMDSimplePanel
    Top = 461
    Width = 623
    ParentColor = True
    ExplicitTop = 461
    ExplicitWidth = 623
  end
end
