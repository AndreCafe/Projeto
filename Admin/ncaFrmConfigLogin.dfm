object FrmConfigLogin: TFrmConfigLogin
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Servidor NEX'
  ClientHeight = 279
  ClientWidth = 473
  Color = 15132390
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object rbLocal: TcxRadioButton
    AlignWithMargins = True
    Left = 15
    Top = 84
    Width = 455
    Height = 17
    Cursor = crHandPoint
    Margins.Left = 15
    Margins.Top = 12
    Margins.Bottom = 0
    Align = alTop
    Caption = '1. Neste mesmo computador'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    TabStop = True
    OnClick = rbLocalClick
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
  end
  object rbAuto: TcxRadioButton
    AlignWithMargins = True
    Left = 15
    Top = 113
    Width = 455
    Height = 17
    Cursor = crHandPoint
    Margins.Left = 15
    Margins.Top = 12
    Margins.Bottom = 0
    Align = alTop
    Caption = '2. Localizar o servidor automaticamente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5329233
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = rbAutoClick
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
  end
  object rbManual: TcxRadioButton
    AlignWithMargins = True
    Left = 15
    Top = 142
    Width = 455
    Height = 17
    Cursor = crHandPoint
    Margins.Left = 15
    Margins.Top = 12
    Margins.Bottom = 0
    Align = alTop
    Caption = '3. Vou informar o nome de rede ou IP do servidor:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 5329233
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = rbManualClick
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
  end
  object btnOk: TcxButton
    Left = 17
    Top = 226
    Width = 80
    Height = 32
    Cursor = crHandPoint
    Caption = '&Ok'
    Default = True
    ModalResult = 1
    TabOrder = 3
    OnClick = btnOkClick
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
  end
  object cxButton1: TcxButton
    Left = 121
    Top = 226
    Width = 74
    Height = 32
    Cursor = crHandPoint
    Cancel = True
    Caption = '&Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 4
    OnClick = cxButton1Click
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    SpeedButtonOptions.CanBeFocused = False
    SpeedButtonOptions.AllowAllUp = True
    SpeedButtonOptions.Flat = True
    SpeedButtonOptions.Transparent = True
  end
  object edManual: TcxTextEdit
    AlignWithMargins = True
    Left = 30
    Top = 164
    Margins.Left = 30
    Margins.Top = 5
    Margins.Right = 200
    Margins.Bottom = 0
    Align = alTop
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = False
    Style.TextColor = clBlue
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 5
    Visible = False
    Width = 243
  end
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 39
    Width = 473
    Height = 33
    Align = alTop
    Bevel.BorderSides = [fsBottom]
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    ParentColor = True
    TabOrder = 6
    object cxLabel1: TcxLabel
      AlignWithMargins = True
      Left = 15
      Top = 3
      Margins.Left = 15
      Align = alClient
      AutoSize = False
      Caption = 'Onde se encontra o servidor do programa NEX?'
      ParentColor = False
      ParentFont = False
      Style.Color = clWhite
      Style.Edges = [bBottom]
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsUnderline]
      Style.TextStyle = []
      Style.TransparentBorder = False
      Style.IsFontAssigned = True
      Properties.Alignment.Vert = taBottomJustify
      Transparent = True
      Height = 27
      Width = 455
      AnchorY = 30
    end
  end
  object panAlerta: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 473
    Height = 39
    Margins.Top = 30
    Align = alTop
    Bevel.BorderSides = []
    Bevel.Mode = bmEdge
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    Visible = False
    object Img: TImage
      Left = 0
      Top = 0
      Width = 35
      Height = 36
      Align = alLeft
      Center = True
      Picture.Data = {
        0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
        0018000000180806000000E0773DF80000002A744558744372656174696F6E20
        54696D65004D692035204D727A20323030332030313A31363A3336202B303130
        302D49F2060000000774494D45D60705170D3B00ED210ED40000000970485973
        00000AF000000AF00142AC34980000000467414D410000B18F0BFC6105000004
        DE4944415478DAA556694C1467187E66662F8E0516B425D4583468C11A532D88
        363D482C256D341A6B8D3F6A4A7AFCB0B6923512E3D560538456A545241A28AE
        B5A4DA966CA1661BAD66498A421559AFA2EB811511C408ECB2F7CEECCCF49D5D
        B45885423B9B27DF37DFF13EEF3DCB607C0F336C2E8FF7C2884FF30EACF4CABA
        22954697D075D3692E31A3E87227EED116FFBF092EECC14B42ECCCC6F4BC0A0E
        B2803BED07F1D3B7A69A42134A69BB9320FC6702B91CEC511EAD7397D5CE6118
        19B2E8874AA7C5B9FA4F0205659DC6B31DA8A763774773D7A804CDBBF14152DA
        E2AAE4192B10E21D24C60FB02184027DF8A17C7BE3C755D842C76C04FFB8096E
        1E4242AF436BCF58B8EF4949F4806578C844208A3E705C081D2D0DF296B28B5B
        7F69C53774BC8B208E8BC05689B289CF7F688C4BC984D87D0057DA5B10126564
        65A7C117974B177D385C516D7FBF126B791E27E98A6BCC047FD622C389947353
        5F29D1C07502C59F55A3AC6112F47A3D3E5AD287A2F553E1E6A6A1F74A3BB697
        9EADACB162375DBB4E088D89C0B6074726BD5C94C745C723CAD580DC7C1B6E0D
        4C803E260689060D9A0EF6C0216641ADE3613559FB576DE70B7A1C384A57FBFF
        19F04708EC262C9293B21B9267BDCD888203F1A1462C5D750E97BA93111B138D
        D41416F5355D7006D3C1AA82F0F43950F1A9FDC75273386DDB09C11109F87268
        5A803F662D2A9B265260217BA1E7AE60C79756988E4D419C3E162B5EEBC3BA35
        125C7C3C58D60F4D4C08A7EABA0463A96F9DAD037524E6CE702B1E22682EC7FA
        27662D2D4D4A9D0F5150ACF542AD09A2E3F77D585E340771B1B1D85B741E33B3
        9E82100A826103612B6451C0D71BFA4F184DD84497CE107C8F109CD98594A04A
        7F79E6C2CFE384C0DDA1A4F052DEF348D2FD8CAC25D3499801A72C8D70055349
        7B0F182E008E48D4D13CDA8F09F2C6AD72B1A50D26442A5C7C88A0E90BEC9FB2
        60ED3B518664C8A1015A2117312484F1C310634749851FBD0389D8B5D30E8F5B
        4FC2BD60397FD8025625411D055419D161AC84D127E0371230F880A07517E621
        21FDE4F49CB5AC10E8A1157744B83292A62A7580FC7F1A225913E027842D6315
        0245B846A639C0A9805B17814DAB5155DB84723A748D20508701632E454BCE9B
        5F65334C0892E48CB827ACBD1BACDA0BCED789EBA7AF213A96C5332F68E0D78A
        24DC1716AE22C1E0FE7685791B5C053B5070DB010BBDF631DF6D45FEB3CFBDB1
        EFE9D9CB1831D84BED4011EE1ED2DE0DB5D6874B478EE2D5C274AA8189B0569D
        C7E4F9BE704DB16A84313C533C941B85CB51BFD78A6DF47A81316F862D77D5A1
        D97C80DA3B691F2150B48F10A9B41E5C3DDE88D737646262D2047CBFFB3432E6
        528C58D25EF3F852AD2B86E7ADCD28A0A985B19418BA73DEDD9F1270DFA0EC75
        5302BB22DA13014316302A0F12B8EB686B23F2681D325FEC072FC9E04838CBD2
        B1C710D46E86736571B87D9898EAD530E5E56FCC37A4A4513EF743A2E0B3E118
        382304DC2005D0456DC149E32024252E9AC0483D1237DA8035EFC16C390F0A39
        0E3073A763F2E22CEC9C9191B840CDB1A497443F2585A5212869204292655914
        255199931FC3AE51069EB6281C9252BA8E01B80F37E1CCAF17718FF694543DAE
        18A878720A611E218D108591DBB88CC77FBDEEAF4B9102C25525FB09B7EF0BD2
        1212083191A41BF54B27FFCBBA3044E20AD7C1B00363FA8731C6E781127F0101
        C508B2A1B711CC0000000049454E44AE426082}
      ExplicitHeight = 30
    end
    object lbMensagem: TcxLabel
      Left = 35
      Top = 0
      Align = alClient
      Caption = 'N'#227'o foi poss'#237'vel localizar o servidor.'
      ParentColor = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.TextColor = 3026478
      Style.TextStyle = []
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
      Width = 438
      AnchorY = 18
    end
    object LMDSimplePanel3: TLMDSimplePanel
      Left = 0
      Top = 36
      Width = 473
      Height = 3
      Align = alBottom
      Bevel.Mode = bmCustom
      TabOrder = 1
      object Image3: TImage
        Left = 0
        Top = 0
        Width = 473
        Height = 3
        Align = alTop
        Picture.Data = {
          0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
          00030000000308060000005628B5BF000000097048597300000EC400000EC401
          952B0E1B000000174944415478DA636460607061800246205643E6F0C138000D
          83007C5CB104A70000000049454E44AE426082}
        Stretch = True
        ExplicitLeft = 3
        ExplicitTop = 36
        ExplicitWidth = 834
      end
    end
  end
end
