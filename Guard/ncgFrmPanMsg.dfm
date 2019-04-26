object FrmPanMsg: TFrmPanMsg
  Left = 0
  Top = 0
  Caption = 'FrmPanMsg'
  ClientHeight = 382
  ClientWidth = 747
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object panMsg: TLMDSimplePanel
    Left = 146
    Top = 20
    Width = 327
    Height = 149
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsWindowBorder
    TabOrder = 0
    Visible = False
    OnExit = panMsgExit
    object panCab: TLMDPanelFill
      Left = 2
      Top = 2
      Width = 323
      Height = 21
      Align = alTop
      BackFX.AlphaBlend.FillObject.Style = sfGradient
      BackFX.AlphaBlend.FillObject.Gradient.Color = clNavy
      BackFX.AlphaBlend.FillObject.Gradient.ColorCount = 255
      BackFX.AlphaBlend.FillObject.Gradient.Style = gstHorizontal
      BackFX.AlphaBlend.FillObject.Gradient.EndColor = clSkyBlue
      Bevel.Mode = bmCustom
      FillObject.Style = sfGradient
      FillObject.Gradient.Color = clNavy
      FillObject.Gradient.ColorCount = 255
      FillObject.Gradient.Style = gstHorizontal
      FillObject.Gradient.EndColor = clSkyBlue
      TabOrder = 0
      object imClose: TImage
        AlignWithMargins = True
        Left = 304
        Top = 1
        Width = 16
        Height = 20
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Top = 1
        Margins.Bottom = 0
        Align = alRight
        Center = True
        Picture.Data = {
          0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
          00100000001008060000001FF3FF610000002A744558744372656174696F6E20
          54696D65004D692035204D727A20323030332031303A31393A3533202B303130
          30088CB7580000000774494D4507D605170D32019F3242700000000970485973
          00000AF000000AF00142AC34980000000467414D410000B18F0BFC6105000003
          244944415478DA7D935D6C145518869FD9DD99AEB3DBD6DA5ABB74416C29282A
          A592364882910BA20892200925D8041312132E943B63BC22F1422E0C0957D2C4
          D8085C10F5824483C61883C1882848C14A690369B7DBFFFD61B6DDF9D9D9991D
          BF6E975B4EF2E69C39F37DCFF9CE39EF51CC2E4E84B66EFEC8D3EAD58AEFE305
          3E15DBC3F33D82924FD92BE37B3EBEEBE1963D1CDB2DDF9F37CEF41B7C092C29
          F6E12D0FA3A73E7F922BE7C07599F9639AF60D31F9E5C2B20D8565DC45035F51
          B1CB017907A667B2C6AEB43D20806B4AF1E80E33B66F9BCED50B8CFC09CAA7DF
          D1F8C91E92CF5404E261392A5CBC4DE4681FB9A92239999EB5B0DE78C829015C
          500A03DBCD8637BBF57FCF5C441BBA4E2CD18A92C9107FF779345525B83C4FA4
          A9094DB6E2BCDDC1BD7FA69973B1DE32F84200834AFE70AF5979768D3EF1DC5E
          9A0F1E44751DB4581C756E0A2D2E7D723D52038A8889DB8CED7E85D1858A75A0
          C8599939AB2C1CE8365B776ED2B3E7BFA1F0D965A2BDDBD12A3E5A348AA669D4
          49152145D23329F27B36313E5922ED601D3219AC0266F7BD68267A3B74FEFA09
          3B5566E9F425C2BDAFA3859455808094C9FFC8EF7F994C3620E741AA8875C4AE
          0152BB5F30D76D6917C02F945C1563E826E1B6245A384C54925581284606A37F
          1B5337D2E4252B6562BD57AA011EECEA343B3A5B7467F8060BE747505B9E4693
          92B5689D54208A8457B7502991EBEFE3EF1FEE302B9773CCAB01C65F5D6F7625
          A27AFAC8C7945FDB8FE65A7288F5E8B934AA5F26B4716BF510AB2D3FC1F51D3D
          DC1A2B58C7A90146FAD69A9D89B8AE8C8D921DBA82B7B187F8D23CEA401FAE38
          B1E9C7BB042D6B89940C527B7BB8F9DB248B3ED6F1A00618EE6E33D7B537E8CE
          DD71E2CD2AFEE96F099D7C9FB97B8B625D687E29C99AAFBF67EAD83B8C5E9D60
          390459A70A58BDC66B5D4D4622D9DC683FB88F788568BD1C645EFC2F81E25C4A
          16C45A9F6071C6C68F40511C5EF0287C40F52D0C2A5FC538D916ABFBD0B14A11
          5F12CA62554FE43FEA25AAE2AF3AA9B2320EF02EC1CFBFC2A87C9E5B31D853A2
          9DA26E51FD23D33DA6C9322C8B8645BFAF044B6134881A6B631E03096ABDD889
          C2CA73FE1FF3B362061841FB800000000049454E44AE426082}
        OnClick = imCloseClick
        ExplicitLeft = 209
        ExplicitTop = 0
        ExplicitHeight = 16
      end
      object lbCab: TcxLabel
        AlignWithMargins = True
        Left = 3
        Top = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'Erro'
        Style.Color = clBtnFace
        Style.TextColor = clWhite
        Style.TextStyle = [fsBold]
        Properties.Alignment.Vert = taVCenter
        Transparent = True
        AnchorY = 11
      end
    end
    object panPri: TLMDSimplePanel
      Left = 2
      Top = 23
      Width = 323
      Height = 84
      Align = alClient
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      TabOrder = 1
      ExplicitHeight = 180
      object lbTexto: TcxLabel
        AlignWithMargins = True
        Left = 5
        Top = 5
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        Caption = 
          'N'#227'o '#233' possivel Entrar antes de se configurar as tarifas da loja.' +
          ' Fa'#231'a isso atrav'#233's da op'#231#227'o "Tarifas" do NexAdmin'
        Style.TextStyle = [fsBold]
        Properties.Alignment.Horz = taLeftJustify
        Properties.WordWrap = True
        ExplicitHeight = 43
        Width = 313
      end
    end
    object LMDSimplePanel1: TLMDSimplePanel
      Left = 2
      Top = 107
      Width = 323
      Height = 40
      Align = alBottom
      Bevel.Mode = bmCustom
      TabOrder = 2
      ExplicitLeft = 40
      ExplicitTop = 72
      ExplicitWidth = 100
      object btnOk: TcxButton
        Left = 124
        Top = 8
        Width = 64
        Height = 25
        Cursor = crHandPoint
        Caption = '&Ok'
        Default = True
        TabOrder = 0
        OnClick = imCloseClick
        LookAndFeel.Kind = lfStandard
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 24
    Top = 80
  end
end
