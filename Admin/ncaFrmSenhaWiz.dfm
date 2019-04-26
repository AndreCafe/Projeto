object FrmSenhaWiz: TFrmSenhaWiz
  Left = 347
  Top = 245
  ActiveControl = edNova
  BorderStyle = bsDialog
  Caption = 'Criar uma senha'
  ClientHeight = 282
  ClientWidth = 349
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Calibri'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object edNova: TcxTextEdit
    Left = 30
    Top = 83
    Properties.EchoMode = eemPassword
    Properties.MaxLength = 30
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.NativeStyle = False
    Style.StyleController = FrmPri.cxEditStyleController1
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 0
    Width = 251
  end
  object lbNovaSenha: TcxLabel
    Left = 30
    Top = 60
    Caption = 'Digite uma senha'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
  end
  object edConfirma: TcxTextEdit
    Left = 30
    Top = 142
    Properties.EchoMode = eemPassword
    Properties.MaxLength = 30
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.NativeStyle = False
    Style.StyleController = FrmPri.cxEditStyleController1
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 2
    Width = 251
  end
  object lbConfirmarSenha: TcxLabel
    Left = 30
    Top = 119
    Caption = 'Repetir a senha'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
  end
  object cxLabel4: TcxLabel
    Left = 30
    Top = 170
    AutoSize = False
    Caption = 
      'Se voc'#234' usar letras mai'#250'sculas na sua senha, ter'#225' que us'#225'-las no' +
      'vamente toda vez que fizer logon.'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    Properties.WordWrap = True
    Transparent = True
    Height = 31
    Width = 251
  end
  object btnAlterar: TcxButton
    Left = 30
    Top = 220
    Width = 88
    Height = 29
    Caption = '&Criar senha'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnAlterarClick
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
  end
  object btnCancelar: TcxButton
    Left = 139
    Top = 220
    Width = 176
    Height = 29
    Cancel = True
    Caption = 'N'#227'o quero criar uma senha agora'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btnCancelarClick
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
  end
  object LMDPanelFill1: TLMDPanelFill
    Left = 0
    Top = 0
    Width = 349
    Height = 44
    Align = alTop
    Bevel.BorderColor = clWhite
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    Color = clWhite
    FillObject.Gradient.Color = clNavy
    FillObject.Gradient.ColorCount = 107
    FillObject.Gradient.EndColor = 16725301
    FillObject.Gradient.PaletteRealize = True
    FillObject.Gradient.ColorList = (
      16777215)
    Font.Charset = ANSI_CHARSET
    Font.Color = 8404992
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    object Image3: TImage
      AlignWithMargins = True
      Left = 10
      Top = 3
      Width = 32
      Height = 36
      Margins.Left = 10
      Align = alLeft
      AutoSize = True
      Center = True
      Picture.Data = {
        0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
        0020000000200806000000737A7AF40000002B744558744372656174696F6E20
        54696D6500446F2032302046656220323030332031333A32363A3335202B3031
        30301EE473E40000000774494D4507D605170E011AE37A50F500000009704859
        7300000B1100000B11017F645F910000000467414D410000B18F0BFC61050000
        077F4944415478DAAD570B5054E715FEEE3ED8E5B12CCB2EEF15D81188988891
        6889643090A9213E1A6BDA26D2D8A833ED74469D38635AA7D3366D6D26D531F1
        ED9844256A20861171345A4114A288BC5FEE222C6F960516447617792E77776F
        CF5DB6D6A49836C03F7CB3CCFDFFF39FEF9EF39DF3FF97C1F78CE12A044E0E62
        BB48A159E5B0B3326B4F77F5D50AEC7BF72334D1B48DC061968379DA84AD05EB
        844C42BA50BD4A090800A1184E7333BAEF9EEE58F7676CAC6B8096968DCE96C4
        B404C69BB049AA58770AF23811C60701769CDCB0444288E1F6726466EB4F6CDD
        8723B4B499C0CE2901729E22F149CE63450B3DCC4603F9E410A0F6031C7CC49D
        6047ACD0977E5313F72BECA5070504F39C11B0DE85C2CB375C6BF74F559B9A5A
        28F076D8ED2C82E7C9E1E3E70176741C62891083F7F2ADAAB5D843265F118C73
        4660B2064745E19BB7776A3BE0A4371EB3336D9BDED395EC7F3F263225499964
        7D60855FB037BACA6F4D68DEC021278774326BC32C74F098C0442B62C48EB87A
        F378B8D8DA6782C85BDA17FF7A6581C532D9969D1DA3FAF9B280AD03460B02C2
        3DD1535B6D51FF149F93D90942CBDC1028C6A792D8B4DFB655B54022E6B8B4BF
        18328B8B1F76D1545E5F5FDC362FA37D03AF372F4F3BB4A51D0DF1BFC1159A3B
        352711307C05AFC06875AF47D012796B5D1B2C7661F58BEB7555347575D90BA8
        2ACD8DAF6D2FEA0E8E8EF3C650BF15E72E5AAE6D3D88129ACF2474CD9A40EB79
        AC0D8F5B7AC5C978C3A0EFC1AE630F322EDF78544F53178786129609DACCE746
        2794080AB1A2B34C8F5F7F8433053528A5F9CB84FE993A7F4C409F89FDCFAC78
        79271C1368D6F63B97BF6348370F71B9892FCAEFDECE89BC25B28963A17E1D10
        3F8F21E30D34E51EEDBF588693474EE32475885EDAC23E2B02ED1704799A1F25
        A45291A3ABCD3CBC604DCFD971165F8E8CAC5C6FB953B7CB573400DF402F40F5
        3210BA8A2C42D0557114BAB2A2BBF7B4F8DB9FD25DD1202ED4286642A0E3B2B4
        367251F4F3B03B60F70C994C5C53F9E989B3CB9DB1C28E1D4DD5EDCCFC283A17
        AC7628A9298B156A20F855C0EF15B0B641345DDA3DD9DE60FE3CFD3AF67F5DEE
        EA09933F44133C01A63DC7A34E13A78E83076D2E8BA54763607BCAD158D10C8D
        861E854AD052E784878885829AA28CC0285EA068AC06A44BD1AFFF1AF557D28D
        DD7DD8B3F900B26883E1FF372DAE08D465207FF1929095BC630845181B7884F6
        5616414140C07C297ABBE5282BE96F51F92250E50FB91F11F097936F3F191048
        69094EA55D5468BAF631D75A56FD4D710B76EFCD42953B2DDCFF245078187F8F
        8AF47C5F2C7662628CC5F02327D4140C45942F1E747BA3ACC8D4BCF14354C8BC
        3070683B922282B1D45F41F344424E102922DC6949C1A8C5809A2F3E98686D19
        FBEC6C110EDED6C184A9038B7B2A818FB7E199D5CB99526F4F4E2195D24B85D1
        F1AB90A143EBC49DA2E1CA6DC7D038320E3D2D2DF19640F8D7779096B8109B7C
        6410F3D190FB10481F8C6A19104669112F415B59162A2F64759AACF860673A72
        C87684E09896000DC9F1F7F0C64BB1F83030041AD62980C9E0341CC846C9F922
        8C701CEED39A3BF84FDB0D7B7305566F78053B8294C288F855A918D05E031F15
        6F25A525208522C2578B37CA33F6704D158DD78B5BB1FB641EEED1C38927A3C1
        3CF12B1789101F158AC4511B94C67EFE16828704DE397FF9E879C2584C08F8F2
        F73894BC66D12F42172F0247A77577CD7578B083F00FA005FE9154ADAF01BE29
        1834EA70EB937F8C76F53A8F1FBB8123EDBDAEE6C53E49801F021765DA98E0E7
        7E6675E3D17755AD3D8C050F6DD0A56C7C490496B61178922AE5B074522B6FAD
        7595ACAF5200C69FD2A25E4342598CFB374F23EFECA59BBFCBC4564CB570DB74
        37229E88D0FD3F9FB3699BCBEDBDC88C89F77F3B58E34F2B4464252190803C65
        B0DB3818AA4A20118C4349AFE349B5CB45A472E539A5B85DD0A5FB43260ED216
        B984FEA7DE09BF6FD41F47ECC028B4C93F91886023C70C41287193207878B9A2
        61BADF8CE107460407027D7D70EA74106414E2C2E54AD741964DE89E1181C23D
        38B7E039A48584FD5B411430CEE3DB247C7CD05866728E9A2D022F199C4D748F
        360F62F8DD53C8199BC44DB2CA270CFE6002F59F20B0DF82AE94959038293935
        75189FAF819484C7707CC21811FD4948A952E7A5F3830CCB82090D0567E8044E
        DF4456413D3A68558E5BDCB6994440706607B684CFC3D16717429A7F8324E000
        939C4CB54911A1928588A4A0ABA5903780C9AF456EC27CC414D6A1EA42B9ABAA
        0A3155D274DD06371302BC8D62F38FF1D68A85D832360161CF438C44A890F4F6
        2FC10804AE8C70FFBC4AF70C131AFF780635C489FF90E1DB723BA192D0077755
        CD480398AA122A343C4B78EEC0166C484A406274B4EBD3017A3D38CA39B3EF22
        32B40697735EF10398FA90F95649CF94802B15042F4D20943BD7E1D8CA64AC55
        A9A86E1DE00A28C87432D6EFCA74A99DBF3B16BB1DFFD779301B028FF7507922
        6CCB7A1CFE5932D6F31D514FDF4BFB2F21A3DE88064C098E179E635AE33920C0
        0F0915A1266D3576854810D566425F7699AB75E7114ADD6F3F3DFB3922E02241
        98475882297DF042ABC0D4A5D5F134A3B924C00FFE9092B9C9D830CD19F2DDF1
        2F0E43ED3F282A477C0000000049454E44AE426082}
      ExplicitLeft = 9
      ExplicitHeight = 30
    end
    object cxLabel1: TcxLabel
      Left = 45
      Top = 0
      Align = alLeft
      AutoSize = False
      Caption = 'Crie sua senha de usu'#225'rio ADMIN'
      ParentColor = False
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWhite
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.TextColor = 4802889
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
      Properties.WordWrap = True
      Transparent = True
      Height = 42
      Width = 290
      AnchorY = 21
    end
    object LMDSimplePanel1: TLMDSimplePanel
      Left = 0
      Top = 43
      Width = 349
      Height = 1
      Align = alBottom
      Bevel.Mode = bmCustom
      Color = 10197915
      TabOrder = 1
    end
    object LMDSimplePanel2: TLMDSimplePanel
      Left = 0
      Top = 42
      Width = 349
      Height = 1
      Align = alBottom
      Bevel.Mode = bmCustom
      Color = 15000804
      TabOrder = 2
    end
    object LMDSimplePanel11: TLMDSimplePanel
      Left = 0
      Top = 43
      Width = 349
      Height = 0
      Align = alBottom
      Bevel.Mode = bmCustom
      Color = 11319229
      TabOrder = 3
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 240
    Top = 120
  end
end
