object FrmTempo: TFrmTempo
  Left = 0
  Top = 0
  ActiveControl = edValor
  Caption = 'Adicionar Tempo'
  ClientHeight = 393
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 124
    Top = 87
    Width = 286
    Height = 301
    UseDockManager = False
    Align = alClient
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 0
    object panTot: TLMDSimplePanel
      Left = 0
      Top = 194
      Width = 286
      Height = 107
      UseDockManager = False
      Align = alClient
      Bevel.BorderInnerWidth = 1
      Bevel.LightColor = 13948116
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      TabOrder = 0
      object VG: TcxVerticalGrid
        Left = 1
        Top = 6
        Width = 284
        Height = 100
        BorderStyle = cxcbsNone
        Align = alClient
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = True
        OptionsView.PaintStyle = psDelphi
        OptionsView.RowHeaderWidth = 113
        OptionsBehavior.GoToNextCellOnEnter = True
        TabOrder = 0
        OnItemChanged = VGItemChanged
        object VGDesconto: TcxEditorRow
          Properties.Caption = 'Desconto'
          Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.EditProperties.HideSelection = False
          Properties.EditProperties.OnChange = VGDescontoEditPropertiesChange
          Properties.EditProperties.OnEditValueChanged = VGDescontoEditPropertiesEditValueChanged
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
          Properties.OnGetEditingProperties = VGDescontoPropertiesGetEditingProperties
        end
        object VGTotal: TcxEditorRow
          Options.TabStop = False
          Properties.Caption = 'Total-Final'
          Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.EditProperties.ReadOnly = True
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
        object VGPagoTotal: TcxEditorRow
          Properties.Caption = 'Pagamento Total ?'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
          Properties.EditProperties.Columns = 2
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.Items = <
            item
              Caption = 'Sim'
              Value = True
            end
            item
              Caption = 'N'#227'o'
              Value = False
            end>
          Properties.EditProperties.OnEditValueChanged = VGPagoTotalEditPropertiesChange
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
          Styles.Content = cxStyle2
        end
        object VGVlPago: TcxEditorRow
          Properties.Caption = 'Valor Pago'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.EditProperties.Alignment.Horz = taLeftJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.DataBinding.ValueType = 'Currency'
          Properties.Value = Null
          Styles.Content = cxStyle2
        end
        object VGObs: TcxEditorRow
          Properties.Caption = 'Observa'#231#245'es'
          Properties.EditPropertiesClassName = 'TcxTextEditProperties'
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = Null
        end
      end
      object LMDSimplePanel3: TLMDSimplePanel
        Left = 1
        Top = 1
        Width = 284
        Height = 5
        UseDockManager = False
        Align = alTop
        Bevel.Mode = bmCustom
        TabOrder = 1
      end
    end
    object panTempo: TLMDSimplePanel
      Left = 0
      Top = 0
      Width = 286
      Height = 194
      UseDockManager = False
      Align = alTop
      Bevel.BorderInnerWidth = 1
      Bevel.LightColor = clGray
      Bevel.Mode = bmEdge
      Bevel.StandardStyle = lsSingle
      TabOrder = 1
      object panAtalhoTempo: TLMDSimplePanel
        Left = 3
        Top = 154
        Width = 280
        Height = 37
        UseDockManager = False
        Align = alBottom
        Bevel.BorderSides = []
        Bevel.BorderInnerWidth = 1
        Bevel.Mode = bmEdge
        Bevel.StandardStyle = lsNone
        TabOrder = 0
        object lbT6: TcxLabel
          Tag = 180
          Left = 231
          Top = 1
          Cursor = crHandPoint
          Align = alLeft
          AutoSize = False
          Caption = '3h'
          ParentColor = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.BorderColor = 11516864
          Style.BorderStyle = ebsSingle
          Style.Color = clBtnFace
          Style.HotTrack = True
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.BorderStyle = ebsSingle
          StyleHot.Color = 16776176
          StyleHot.LookAndFeel.NativeStyle = True
          StyleHot.TextStyle = [fsBold]
          OnClick = lbT1Click
          OnMouseUp = lbT1MouseUp
          Height = 35
          Width = 46
        end
        object lbT5: TcxLabel
          Tag = 120
          Left = 185
          Top = 1
          Cursor = crHandPoint
          Align = alLeft
          AutoSize = False
          Caption = '2h'
          ParentColor = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.BorderColor = 11516864
          Style.BorderStyle = ebsSingle
          Style.Color = clBtnFace
          Style.HotTrack = True
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.BorderStyle = ebsSingle
          StyleHot.Color = 16776176
          StyleHot.LookAndFeel.NativeStyle = True
          StyleHot.TextStyle = [fsBold]
          OnClick = lbT1Click
          OnMouseUp = lbT1MouseUp
          Height = 35
          Width = 46
        end
        object lbT4: TcxLabel
          Tag = 60
          Left = 139
          Top = 1
          Cursor = crHandPoint
          Align = alLeft
          AutoSize = False
          Caption = '1h'
          ParentColor = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.BorderColor = 11516864
          Style.BorderStyle = ebsSingle
          Style.Color = clBtnFace
          Style.HotTrack = True
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.BorderStyle = ebsSingle
          StyleHot.Color = 16776176
          StyleHot.LookAndFeel.NativeStyle = True
          StyleHot.TextStyle = [fsBold]
          OnClick = lbT1Click
          OnMouseUp = lbT1MouseUp
          Height = 35
          Width = 46
        end
        object lbT3: TcxLabel
          Tag = 30
          Left = 93
          Top = 1
          Cursor = crHandPoint
          Align = alLeft
          AutoSize = False
          Caption = '30m'
          ParentColor = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.BorderColor = 11516864
          Style.BorderStyle = ebsSingle
          Style.Color = clBtnFace
          Style.HotTrack = True
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.BorderStyle = ebsSingle
          StyleHot.Color = 16776176
          StyleHot.LookAndFeel.NativeStyle = True
          StyleHot.TextStyle = [fsBold]
          OnClick = lbT1Click
          OnMouseUp = lbT1MouseUp
          Height = 35
          Width = 46
        end
        object lbT2: TcxLabel
          Tag = 15
          Left = 47
          Top = 1
          Cursor = crHandPoint
          Align = alLeft
          AutoSize = False
          Caption = '15m'
          ParentColor = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.BorderColor = 11516864
          Style.BorderStyle = ebsSingle
          Style.Color = clBtnFace
          Style.HotTrack = True
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.BorderStyle = ebsSingle
          StyleHot.Color = 16776176
          StyleHot.LookAndFeel.NativeStyle = True
          StyleHot.TextStyle = [fsBold]
          OnClick = lbT1Click
          OnMouseUp = lbT1MouseUp
          Height = 35
          Width = 46
        end
        object lbT1: TcxLabel
          Tag = 10
          Left = 1
          Top = 1
          Cursor = crHandPoint
          Align = alLeft
          AutoSize = False
          Caption = '10m'
          ParentColor = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.BorderColor = 11516864
          Style.BorderStyle = ebsSingle
          Style.Color = clBtnFace
          Style.HotTrack = True
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.BorderStyle = ebsSingle
          StyleHot.Color = 16776176
          StyleHot.LookAndFeel.NativeStyle = True
          StyleHot.TextStyle = [fsBold]
          OnClick = lbT1Click
          OnMouseUp = lbT1MouseUp
          Height = 35
          Width = 46
        end
      end
      object edTempo: TcxTimeEdit
        Left = 102
        Top = 64
        AutoSize = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Vert = taVCenter
        Properties.ImmediatePost = True
        Properties.OnChange = edTempoPropertiesChange
        Properties.OnEditValueChanged = edTempoPropertiesEditValueChanged
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsFlat
        Style.Color = clWhite
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.HotTrack = True
        Style.LookAndFeel.NativeStyle = True
        Style.TextStyle = [fsBold]
        Style.ButtonTransparency = ebtNone
        Style.IsFontAssigned = True
        StyleDisabled.BorderStyle = ebsSingle
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.Color = 16776176
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 1
        OnEnter = edTempoEnter
        Height = 23
        Width = 119
      end
      object cxLabel9: TcxLabel
        Left = 6
        Top = 64
        Cursor = crHandPoint
        AutoSize = False
        Caption = '  &Tempo'
        FocusControl = edTempo
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Style.BorderColor = clSilver
        Style.BorderStyle = ebsSingle
        Style.HotTrack = True
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.BorderStyle = ebsSingle
        StyleHot.Color = 16776176
        StyleHot.LookAndFeel.NativeStyle = True
        OnClick = cxLabel9Click
        Height = 23
        Width = 94
      end
      object cxLabel8: TcxLabel
        Left = 6
        Top = 35
        Cursor = crHandPoint
        AutoSize = False
        Caption = '  &Valor'
        FocusControl = edValor
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Style.BorderColor = clSilver
        Style.BorderStyle = ebsSingle
        Style.HotTrack = True
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.BorderStyle = ebsSingle
        StyleHot.Color = 16776176
        StyleHot.LookAndFeel.NativeStyle = True
        OnClick = cxLabel8Click
        Height = 23
        Width = 94
      end
      object edValor: TcxCurrencyEdit
        Left = 102
        Top = 35
        AutoSize = False
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.AssignedValues.EditFormat = True
        Properties.UseThousandSeparator = True
        Properties.OnChange = edValorPropertiesChange
        Properties.OnEditValueChanged = edValorPropertiesEditValueChanged
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsFlat
        Style.Color = clWhite
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.HotTrack = False
        Style.LookAndFeel.NativeStyle = True
        Style.TextStyle = [fsBold]
        Style.TransparentBorder = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.Color = 16776176
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.BorderStyle = ebsSingle
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 4
        OnEnter = edValorEnter
        Height = 23
        Width = 119
      end
      object edTipoAcesso: TcxComboBox
        Left = 102
        Top = 6
        AutoSize = False
        Properties.DropDownListStyle = lsFixedList
        Properties.ImmediatePost = True
        Properties.ImmediateUpdateText = True
        Properties.Items.Strings = (
          'Todos')
        Properties.OnEditValueChanged = edTipoAcessoPropertiesEditValueChanged
        Style.BorderColor = clBlack
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.NativeStyle = True
        Style.ButtonStyle = btsHotFlat
        Style.ButtonTransparency = ebtNone
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleDisabled.TextColor = clBtnText
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 5
        Height = 23
        Width = 119
      end
      object lbTempo: TcxLabel
        Left = 223
        Top = 6
        AutoSize = False
        ParentColor = False
        ParentFont = False
        Properties.Alignment.Vert = taVCenter
        Style.BorderColor = clGray
        Style.BorderStyle = ebsFlat
        Style.Color = clWindow
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.NativeStyle = True
        Style.TextColor = clNavy
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        Visible = False
        Height = 23
        Width = 119
      end
      object lbTipoAcesso: TcxLabel
        Left = 6
        Top = 6
        Cursor = crHandPoint
        AutoSize = False
        Caption = '  Tipo de Acesso'
        FocusControl = edTipoAcesso
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Style.BorderColor = clSilver
        Style.BorderStyle = ebsSingle
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.HotTrack = True
        Style.LookAndFeel.NativeStyle = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.BorderStyle = ebsSingle
        StyleHot.Color = 16776176
        StyleHot.LookAndFeel.NativeStyle = True
        OnClick = lbTipoAcessoClick
        Height = 23
        Width = 94
      end
      object lbSenha: TcxLabel
        Left = 6
        Top = 93
        Cursor = crHandPoint
        AutoSize = False
        Caption = '  Senha do Cart'#227'o'
        FocusControl = edTempo
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Style.BorderColor = clSilver
        Style.BorderStyle = ebsSingle
        Style.HotTrack = True
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.BorderStyle = ebsSingle
        StyleHot.Color = 16776176
        StyleHot.LookAndFeel.NativeStyle = True
        Visible = False
        OnClick = cxLabel9Click
        Height = 23
        Width = 94
      end
      object edSenha: TcxTextEdit
        Left = 101
        Top = 94
        Properties.CharCase = ecUpperCase
        Properties.OnChange = edSenhaPropertiesChange
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.NativeStyle = True
        Style.TextColor = clNavy
        Style.TextStyle = [fsBold]
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 9
        Visible = False
        Width = 149
      end
      object lbErroCartao: TcxLabel
        Left = 6
        Top = 122
        Cursor = crHandPoint
        AutoSize = False
        Caption = ' Esse cart'#227'o j'#225' foi vendido para outro cliente!'
        FocusControl = edTempo
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Style.BorderColor = clRed
        Style.BorderStyle = ebsSingle
        Style.HotTrack = True
        Style.LookAndFeel.NativeStyle = True
        Style.TextColor = clRed
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.BorderStyle = ebsSingle
        StyleHot.Color = 16776176
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
        Visible = False
        OnClick = cxLabel9Click
        Height = 23
        Width = 274
      end
    end
  end
  object panBotoes: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 410
    Height = 33
    UseDockManager = False
    Align = alTop
    Bevel.WidthInner = 0
    Bevel.WidthOuter = 0
    Bevel.BorderSides = []
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 1
    object btnSalvar: TPngSpeedButton
      Left = 0
      Top = 0
      Width = 73
      Height = 33
      Align = alLeft
      Caption = '&Salvar'
      Flat = True
      Transparent = False
      OnClick = btnSalvarClick
      PngImage.Data = {
        89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
        F80000002B744558744372656174696F6E2054696D6500536F203137204E6F76
        20323030322031393A31373A3436202B3031303041C0B5F10000000774494D45
        000000000000000973942E000000097048597300000AF000000AF00142AC3498
        000005AF4944415478DA8595696C545514C7FFEFBD99CE9BCEBE745A3A961628
        B54A1BA09A800B1A356A88CB274DD044342E80261682102551049710891FE413
        9060F4438D4654A024B4A850962E4AA1D5AED3050A6D296DA59D0ED3F6CD74E6
        BDE7B9771686C6C49B9C39F7BDFBEEF99DE5DE3302D637FA61920E4230AC2AF7
        A9D237CF6B505409822042D3014D5549AB98637A2E0E552389A988938EC7E99D
        1A87A8C7F045A315AD834615D1A966F4547F80CB557D002202DE6AFE5D08DF7A
        0223A3A82896716AEF2AD8DDF90410307FE8BA86B9B939321C472C16E37395C0
        9363C3D87E64129D613782632184AF06CEA3B1F25DDAD22B6053EBACB1BBCDCC
        BC5B5962C56F5F3E448005104511030303989E9EE6305DD7D39A091B3E9F8FC3
        2608F0E1D11B686A380BD7BD4FA3BF755C41E36BEFD127C704BCD3A218039DB2
        4661572C31A3F68B07E1F4E6A701333333DCB0A669C928F4B4E4E6E6F20838A0
        7A026D4361C8CE7CF49EEB8EE0D2A67DF4F921016FB728A6BE80AC513E572C32
        A166CFEA34607E9A52A9613A1A8DA6D33539761D3B6B42E89E71533DE2E8ADBD
        14417BE57EDA728003B2AFF4CA2A0196179A50FD69055C5E3F2449424F4F0F42
        A11007A56099D08282020E61808F0910987541D454F43040C7E60CC060BF0C4A
        51D942038E7CB402AE1C3F37343E3ECE3D4DE53C959A54BAEC767B2245A3C3D8
        557B0B01251141CF8934E02007D84606649D8A5C5660C08F3B96C1E9C9E70658
        3A3273CE8C31E34C33614E301D1C1FC1EE9361F444BC10E9D8066A9A33009B5A
        14E7E800D540C33D7E11DF6F2D81235983A1A121CCCECEDE9196D49C0153A728
        3836824F4ECFA04FF14060801317E701FE199475F2A4340FA8DA5C0C8727714C
        1545497B9A8A800DA6D9B3D1684C17F9B3BA08FA2304A014755753049D29C0C6
        16C53D352CEB54E4650BE85C6D5800ABD3C70D88C9E2B2B4B032681A4B8D9691
        A6387FBE353186BD8D02FAA25EFA288EAE6317320197949CF00D9976C167D3F1
        6489CAEA0D320D5D64B940E287E60283F0158D6B76B359C2E8C0A173C6839B71
        1B7472A2E3E81F7702F266C7645A491456A32D62C273414C0A9F4B6428A14503
        929AEE8AC4DE8BC8A235899E59549DBF3465003610207A53A625EE0D581129FF
        1A353B061299C76440E4B0A426A3060E10923091D78C45C21A60C7CF8D7702F2
        E30CA073DBCC709E691A8B1D117ED9D8E6B8CA6E30DD5E768B933739CE8EAC1A
        C5A8A1903C27EF25234CBE22A8B4D67EB89E005B6E030AF4A0CCF2CA082AF9FC
        70CE28BEDDFE189AFEA6633A1DC644680A8886E0B459E1F6BAE176B9A90FF9D0
        DFD586970EC760B664235B36A274C95D68BD1A42E74FF301524896F4DB8055AE
        1BD8BDEE6E2C5BD782AC4217B23C2EEC786406AB17C9B03B5D70B95CF07ABDE8
        EB68C1BA6A03AC363BACB2012B0BB371A62B888EC3E733006F5E548A4CD3B228
        1240278020A1C232886D6B73B1E6F329F8BC3260B160E753021E586C85D5EEE4
        008FC783A633BFE2D55A0B2C1499CD2C61F9421BCE0626D1FEC3B90CC0FA06A5
        C81193D929E0FF60042837F5E38DFB4D78E508796B37409565EC596BC69A1207
        015C70381CBC0E75278F63CB9F7E58ACD9B09A8D585E60C5D9DE29B47D579702
        50B37BB1763F1D8B8DC5F926C1902511C480A5E8C4CB653AB65E2885DD222066
        34E1AB67ED78BCD40D0B45C0FE23C2E1301A4ED760D7E57298AD14812C612501
        EABA27F157D5995974541E4C00801C3CBA7F0FAC79AF172E74081A240E78FF39
        3F0E0D1411C008D16442E59A1C94F96DBC7D048341DEC62FD49FC2EEF63298B2
        CD301B0514E766A3B6B61BE1EE867A5CD9574FB6BF6600236BED28DF56892CFF
        3350E286D2DCEBE62D2F14594CC62C98CD66C8B2994314658E1B6611B0263874
        A50B07CE2DBD09D198BCF2745222D72E63B8EA1AD44833BD389E6A93EC0BD6A3
        EF232921B19018922224E5BF869E9439B02E92185192EB240CD09FB99119B393
        589373F17F8C6742B454D74ACE15922906FE1774A5164043E6D0000000000049
        454E44AE426082}
      ExplicitLeft = 1
      ExplicitTop = 2
    end
    object btnCancelar: TPngSpeedButton
      Left = 80
      Top = 0
      Width = 82
      Height = 33
      Align = alLeft
      Caption = '&Cancelar'
      Flat = True
      Transparent = False
      OnClick = btnCancelarClick
      PngImage.Data = {
        89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
        F8000000097048597300000B1300000B1301009A9C180000050C4944415478DA
        A5567F4C947518FFBC3FEE80EBC083C3536B843812A705B58A28C3910B5D695B
        D8B4B562CC31C3516BCEF9876E2918D3DBC48DE59A26D89C6D1A69D3957FB955
        6B51B36CA499102ABFE10E387E091C77DCFBEBDBF37D5FB8DD9998ADEFF6DC7B
        3FDEF7F3799ECFF3F93EDF131863986F350842015D8A28F229565264CCFED447
        D14A7185E2876D8CFD321F86702F02022EA4CBDB3659285F92EE90B3B2DC702F
        71C3E97202AA82C9C028867D23E8F2071198D0344DC76774FF69226AFA570202
        AF94441C5E999D9694B7EE7924E4E643787829E0480634152C38018C0D01BE2E
        B0AE5684BB3BD0DC3686F6213D6C30EC2292A3F31210F89EE424A966EDDA1C29
        BDE42D084F52210F11F0F830D8400F10F0019363801201233204EFC0F07542F1
        F5C03F1AC4E50E438F44D85E22F1FE8380674EE047366D7E5692379642C87D01
        181900BBF61358EB6FC0602FD8D41D13DC5CB20D86CD0E95D256A7A7E8EB3082
        8680A6164D5722EC83B94A4C02AE39C97269E3FA1549E9659510F25683B55C01
        FBFE3CD8EDEB94F53860E8D14A794AFC93CA04A80205BDD718FF0C0C8718FE68
        D3C204BB9EF7648EE0D327B25D15F93B08BCA0D802BF780AACAF1DC2234BC13A
        6F51C622A52398E01A8532A3C3C8C84484E453C36168926C12A910D0DEAF2330
        A41F2782ED423D50406E697AB3AC484EDC5201C665B97812ACE316C49D8720BE
        5606A36E178C2F1A603844CA5844644A83F8621192BD6710B9FA3386AADF2589
        A6AD4A28C2F4D27A43D1A8E8424EB03BC393E85DB7B31C589E07F6DD576057C9
        6D698B215FB8696A0D5D8776703BC28D27A090361C7C41ED3988A9E9A6643D15
        C5986CFE71562A4BB2DE0E15C109630F27385FF894A764F9D6AD4028088374C7
        78806A3528FB7720EE3D0150333949F0C352724C375C1F7F13050F1CABC66083
        972AE3D95BE05CC6C93103FE6EF50227687BBD78598EBB88B4EFFE0BECCF5F09
        8C6AA4DEB09001B6A914F67D16090B4F83D1461353524DF0A16355F07FF21174
        3BE92F4A66E3E74CAFCC3074B62A3739C174E9862C872D331BACF7363DD567DE
        60F072E94509E9105FD904E7BE7A880BDC968BC8AA0347F660F0645D1C78EC32
        E8D95BD722218B604DAA4376265B9B88FCACCFBA81DB8E37547EAE0069755F43
        4CF344097A6A2AE0FFF2140C275546EEC27D08DA36E4D9733CE410EE758D7E51
        671B150912F8EA22B86BCF92E60BADA7F8C69424DAC91ADA0FBE8FFE33C7213B
        C808E4AED8152BD1F9FC2CA96465BA65B1397025C2337F096987CE429A6D687F
        ED4E448607B0ECC02908BC27D4F8DB07DEC3C0B90688765B1C416C93772F7209
        DE971F13A3E05C1EE6C9C0E2C66688C92EF38181A355E8A5862A74C3C22D65C8
        A9AE3749F8BABEAD1813BFC70FD2FE189B1650C54DAFE6CA325D4D70BEEDB504
        273CDECFE12CDC00FFB1FD04BEDF6CA8218AD0A6152CD95C86E555F508B5B7A0
        65C71B5046FC51702A0C1D3722D6469B1B158F2E122B1ECF90CCC69AA380863C
        4B71C1BE2A1FA397BF85467D64E416ABCB0C86A2C0F5CC1ACCD0949DF1F79244
        F62841C0A7D144D75B6954AC8A0E3B32C2A5A757C8494E876039089825134CC2
        F9CFBDF83543C3AEE7A6123FECE6C6B53D413892B7CA2611661CF8832E0E45CE
        D1D5BBC775EC81634B106A32B36429816CABFF07709EB9AF4BE5E0F73E706248
        2A49AEC3A91E29C9BD58E696BFEFE20D1D1D3435E7366ABCEF911943621EFAD4
        D37287539453522524526F64BBB563358599194F8EEB341F0DEE96073FF4EF22
        FADF7F5BFE0602B2CD6704848D570000000049454E44AE426082}
    end
    object LMDSimplePanel9: TLMDSimplePanel
      Left = 73
      Top = 0
      Width = 7
      Height = 33
      UseDockManager = False
      Align = alLeft
      Bevel.Mode = bmCustom
      TabOrder = 0
    end
    object cbRecibo: TcxCheckBox
      Left = 315
      Top = 7
      Caption = 'Emitir Recibo'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
      Width = 85
    end
  end
  object LMDSimplePanel2: TLMDSimplePanel
    Left = 0
    Top = 82
    Width = 410
    Height = 5
    UseDockManager = False
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 2
  end
  object panTipo: TLMDSimplePanel
    Left = 0
    Top = 33
    Width = 410
    Height = 49
    UseDockManager = False
    Align = alTop
    Bevel.BorderInnerWidth = 1
    Bevel.Mode = bmEdge
    Bevel.StandardStyle = lsNone
    TabOrder = 3
    object cxLabel3: TcxLabel
      Left = 6
      Top = 10
      Caption = '&Cliente'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
    end
    object edCli: TcxPopupEdit
      Left = 45
      Top = 8
      Properties.HideSelection = False
      Properties.PopupAutoSize = False
      Properties.PopupControl = fbPesqCli.panPri
      Properties.PopupHeight = 300
      Properties.PopupMinWidth = 550
      Properties.PopupWidth = 550
      Properties.ReadOnly = True
      Properties.OnCloseUp = edCliPropertiesCloseUp
      Properties.OnInitPopup = edCliPropertiesInitPopup
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.NativeStyle = True
      Style.ButtonStyle = btsHotFlat
      Style.ButtonTransparency = ebtNone
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
      Width = 275
    end
    object lbMaq: TcxLabel
      Left = 349
      Top = 3
      Align = alRight
      AutoSize = False
      Caption = 'Maq: 5'
      ParentColor = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.BorderColor = 11516864
      Style.BorderStyle = ebsSingle
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = True
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      Height = 43
      Width = 58
    end
    object lbDeb: TcxLabel
      Left = 44
      Top = 29
      AutoSize = False
      Caption = 'D'#233'bito Atual = R$ 10,50'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clRed
      Style.IsFontAssigned = True
      Transparent = True
      Visible = False
      Height = 17
      Width = 138
    end
  end
  object panTT: TLMDSimplePanel
    Left = 0
    Top = 87
    Width = 124
    Height = 301
    UseDockManager = False
    Align = alLeft
    Bevel.Mode = bmCustom
    TabOrder = 4
    object Grid: TcxGrid
      Left = 0
      Top = 0
      Width = 119
      Height = 301
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      object TV: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        OnFocusedRecordChanged = TVFocusedRecordChanged
        DataController.DataModeController.GridMode = True
        DataController.DataSource = Dados.dsTT
        DataController.KeyFieldNames = 'Codigo'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = TVDescr
        OptionsCustomize.ColumnFiltering = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.DataRowHeight = 20
        OptionsView.GridLines = glNone
        OptionsView.GroupByBox = False
        OptionsView.Header = False
        Styles.Inactive = cxStyle3
        object TVDescr: TcxGridDBColumn
          Caption = 'Tipos de Cr'#233'dito'
          DataBinding.FieldName = 'Descr'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Vert = taVCenter
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
    object LMDSimplePanel4: TLMDSimplePanel
      Left = 119
      Top = 0
      Width = 5
      Height = 301
      UseDockManager = False
      Align = alRight
      Bevel.Mode = bmCustom
      TabOrder = 1
    end
  end
  object LMDSimplePanel5: TLMDSimplePanel
    Left = 0
    Top = 388
    Width = 410
    Height = 5
    UseDockManager = False
    Align = alBottom
    Bevel.Mode = bmCustom
    TabOrder = 5
  end
  object tcxlist: TcxStyleRepository
    Left = 72
    Top = 152
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clHighlight
      TextColor = clWhite
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = 16768991
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor]
      Color = 16760767
    end
  end
  object tTT: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Descr'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Tipo'
        DataType = ftSmallint
      end
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Minutos'
        DataType = ftInteger
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'TipoAcesso'
        DataType = ftInteger
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 48
    Top = 104
    object tTTDescr: TStringField
      FieldName = 'Descr'
    end
    object tTTTipo: TSmallintField
      FieldName = 'Tipo'
    end
    object tTTCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object tTTMinutos: TIntegerField
      FieldName = 'Minutos'
    end
    object tTTValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tTTTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
  end
  object dsTT: TDataSource
    DataSet = tTT
    Left = 80
    Top = 104
  end
  object tPass: TnxTable
    Database = Dados.db
    TableName = 'Passaporte'
    IndexName = 'ISenha'
    Left = 256
    Top = 64
    object tPassID: TAutoIncField
      FieldName = 'ID'
    end
    object tPassTipoPass: TIntegerField
      FieldName = 'TipoPass'
    end
    object tPassCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tPassExpirou: TBooleanField
      FieldName = 'Expirou'
    end
    object tPassSenha: TStringField
      FieldName = 'Senha'
    end
    object tPassPrimeiroUso: TDateTimeField
      FieldName = 'PrimeiroUso'
    end
    object tPassTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object tPassTipoExp: TWordField
      FieldName = 'TipoExp'
    end
    object tPassExpirarEm: TDateTimeField
      FieldName = 'ExpirarEm'
    end
    object tPassMaxSegundos: TIntegerField
      FieldName = 'MaxSegundos'
    end
    object tPassSegundos: TIntegerField
      FieldName = 'Segundos'
    end
    object tPassAcessos: TIntegerField
      FieldName = 'Acessos'
    end
    object tPassDia1: TIntegerField
      FieldName = 'Dia1'
    end
    object tPassDia2: TIntegerField
      FieldName = 'Dia2'
    end
    object tPassDia3: TIntegerField
      FieldName = 'Dia3'
    end
    object tPassDia4: TIntegerField
      FieldName = 'Dia4'
    end
    object tPassDia5: TIntegerField
      FieldName = 'Dia5'
    end
    object tPassDia6: TIntegerField
      FieldName = 'Dia6'
    end
    object tPassDia7: TIntegerField
      FieldName = 'Dia7'
    end
    object tPassTran: TIntegerField
      FieldName = 'Tran'
    end
    object tPassDataCompra: TDateTimeField
      FieldName = 'DataCompra'
    end
    object tPassValido: TBooleanField
      FieldName = 'Valido'
    end
    object tPassValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tPassSessao: TIntegerField
      FieldName = 'Sessao'
    end
  end
end
