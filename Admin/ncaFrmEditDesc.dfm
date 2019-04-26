object FrmEditDesc: TFrmEditDesc
  Left = 0
  Top = 0
  ActiveControl = edValor
  BorderStyle = bsToolWindow
  Caption = 'Desconto'
  ClientHeight = 176
  ClientWidth = 394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 18
  object LMDSimplePanel2: TLMDSimplePanel
    AlignWithMargins = True
    Left = 15
    Top = 127
    Width = 364
    Height = 34
    Margins.Left = 15
    Margins.Top = 0
    Margins.Right = 15
    Margins.Bottom = 15
    Align = alBottom
    Bevel.Mode = bmCustom
    TabOrder = 0
    object btnSalvar: TcxButton
      Left = 0
      Top = 0
      Width = 105
      Height = 34
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Salvar - F2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      OnClick = btnSalvarClick
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
    end
    object btnCancelar: TcxButton
      AlignWithMargins = True
      Left = 120
      Top = 0
      Width = 74
      Height = 34
      Cursor = crHandPoint
      Margins.Left = 15
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Cancel = True
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.AllowAllUp = True
      SpeedButtonOptions.Flat = True
    end
  end
  object panValor: TLMDSimplePanel
    AlignWithMargins = True
    Left = 15
    Top = 15
    Width = 364
    Height = 31
    Margins.Left = 15
    Margins.Top = 15
    Margins.Right = 15
    Margins.Bottom = 15
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 1
    object cxLabel1: TcxLabel
      AlignWithMargins = True
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 15
      Margins.Bottom = 0
      Align = alLeft
      AutoSize = False
      Caption = 'Desconto'
      FocusControl = edValor
      Properties.Alignment.Vert = taVCenter
      Height = 31
      Width = 71
      AnchorY = 16
    end
    object edValor: TcxCurrencyEdit
      Left = 86
      Top = 0
      Align = alClient
      ParentFont = False
      Properties.OnChange = edValorPropertiesChange
      Properties.OnEditValueChanged = edValorPropertiesEditValueChanged
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.StyleController = FrmPri.cxEditStyleController1
      Style.IsFontAssigned = True
      TabOrder = 1
      OnKeyDown = edValorKeyDown
      Width = 278
    end
  end
  object panPerc: TLMDSimplePanel
    AlignWithMargins = True
    Left = 15
    Top = 61
    Width = 364
    Height = 31
    Margins.Left = 15
    Margins.Top = 0
    Margins.Right = 15
    Margins.Bottom = 15
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 2
    object edPerc: TcxCurrencyEdit
      Left = 86
      Top = 0
      Align = alClient
      EditValue = 35.000000000000000000
      ParentFont = False
      Properties.DisplayFormat = '0.00%'
      Properties.OnChange = edPercPropertiesChange
      Properties.OnEditValueChanged = edPercPropertiesEditValueChanged
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.StyleController = FrmPri.cxEditStyleController1
      Style.IsFontAssigned = True
      TabOrder = 1
      OnKeyDown = edPercKeyDown
      Width = 205
    end
    object cxLabel2: TcxLabel
      AlignWithMargins = True
      Left = 0
      Top = 0
      Cursor = crHandPoint
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 15
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'Percentual'
      FocusControl = edPerc
      Properties.Alignment.Vert = taVCenter
      AnchorY = 16
    end
    object panPremium: TLMDSimplePanel
      Left = 291
      Top = 0
      Width = 73
      Height = 31
      Cursor = crHandPoint
      AutoSize = True
      Align = alRight
      Bevel.Mode = bmCustom
      TabOrder = 2
      OnClick = panPremiumClick
      object Image1: TImage
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 16
        Height = 25
        Cursor = crHandPoint
        Align = alLeft
        AutoSize = True
        Center = True
        Picture.Data = {
          0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000010
          0000001008060000001FF3FF610000000467414D410000B18F0BFC6105000000
          097048597300000B0C00000B0C013F4022C80000002B74455874437265617469
          6F6E2054696D6500446F203134204E6F7620323030322032323A32333A303720
          2B30313030291FDE570000000774494D4507D605170D3335A79D8784000002AA
          49444154384F8DD37B4853511C07F0EBFBED52976688A29994818F44C84433CB
          EC618995690596943DA049E13F895A51A42C34349D225AB285897F149619D174
          826558213D4C7ACCE5246B59D69CAE66BADD6FBF73A512A4F00B1FB8F79CDFEF
          9EDD73EEB87FE5614370C3BDAA20195D7A123B6170BEE929E7D60DF73542F3A8
          9A4F8AE272686831B11626E793F6AAE016E3C8131875DDC8DF2FBE4543F1C459
          98FC4FAC98E6422EE4E91D89D9A06D81417B1D4A45A6D1C3953B4673BF7F8550
          4766D27A9EDBAB9405D6DF97C7B47529E27B3A149BBF19879AA057D7614C5D8B
          B1815A3495278E2AA4B18F6585912D053941B2C3691EBBA9D5955873CFEFEEE3
          810E60A21918BD8AE98F97F17DF012C6D5A530BCBD801F9A52583E94039F2F02
          635200956896A54E52731C117135796EC5A3FD67784CD480D7493135548CC9C1
          B33069CEC1A495C2F4FA107EF66F04D4DB00C349BC541DB5442C13C9A93997F8
          114E2C49772E1B7820E1314EABE84EC3327C0ABCF608CCBD2EB0F470402FD138
          4055BFD01C12E0768D7A2AC976C28E98B325FE696B9C4A5E2937F0D01DA0D5E2
          80670EC08B0540DF22E05D003A1521BC9F8F4B23D5B2E69D84ADCE7A85D88605
          DA2E6FAB5DCAE37D043D6005099B3110098CC4A0AE387C8AF6BE816A77117622
          7F9A854832C5296FBA92802FA9D4B005D0A790ADC027A2DF81EE9BC9F0707764
          AB471307A169762419BE15B0E401E65C4C8F64A3247FE5D7D2A26803F439007F
          1C309DC09200317BFF0432F7A32A2B8A560157A0BC91615915216EB5B1B692DB
          DBD994C746F9DD6E6F65472D475242A88A4AF7102FA16976B2D302F3B2D2433B
          3DDDEDABE9B6821C243164B5B797A860537278B7AF8F671D2B253E644E442491
          6491B584EDB2237122FE643D6173EC7FE14EE684ED2A7B883799F94CFFC686B0
          3136C76AD83D85E37E0119744DBECF204AD60000000049454E44AE426082}
        OnClick = panPremiumClick
        ExplicitHeight = 22
      end
      object cxLabel3: TcxLabel
        AlignWithMargins = True
        Left = 22
        Top = 3
        Cursor = crHandPoint
        Margins.Left = 0
        Margins.Right = 0
        Align = alLeft
        Caption = 'Premium'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Properties.Alignment.Vert = taVCenter
        OnClick = panPremiumClick
        AnchorY = 16
      end
    end
  end
end
