object FrmLabelPopUp: TFrmLabelPopUp
  Left = 300
  Top = 420
  BorderStyle = bsNone
  ClientHeight = 279
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poDesigned
  OnActivate = FrmBasePaiActivate
  OnCreate = FrmBasePaiCreate
  OnDestroy = FrmBasePaiDestroy
  OnDeactivate = FrmBasePaiDeactivate
  CacheInstance = True
  Modal = False
  PixelsPerInch = 96
  TextHeight = 13
  object panPri: TParentedPanel
    Left = 0
    Top = 0
    Width = 575
    Height = 279
    Align = alClient
    AutoSize = True
    BevelKind = bkFlat
    BevelOuter = bvNone
    BorderWidth = 5
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 4
    DesignSize = (
      571
      275)
    object sbConfig1: TLMDSpeedButton
      Left = 527
      Top = 48
      Width = 24
      Height = 24
      Cursor = crHandPoint
      AutoSize = False
      OnClick = sbConfig2Click
      ImageList = dmImagens.im24
      ImageIndex = 33
    end
    object sbConfig2: TLMDSpeedButton
      Left = 527
      Top = 141
      Width = 24
      Height = 24
      Cursor = crHandPoint
      AutoSize = False
      OnClick = sbConfig2Click
      ImageList = dmImagens.im24
      ImageIndex = 33
    end
    object edPrecoVenda: TcxCurrencyEdit
      Left = 165
      Top = 95
      Style.BorderColor = clGray
      Style.BorderStyle = ebsSingle
      TabOrder = 5
      Width = 356
    end
    object lbCusto: TcxLabel
      Left = 24
      Top = 181
      Caption = 'Custo'
    end
    object edCusto: TcxCurrencyEdit
      Left = 166
      Top = 180
      Style.BorderColor = clGray
      Style.BorderStyle = ebsSingle
      TabOrder = 0
      Width = 356
    end
    object edMargemDeLucro: TcxCurrencyEdit
      Left = 165
      Top = 139
      Properties.DisplayFormat = '0.##%'
      Style.BorderColor = clGray
      Style.BorderStyle = ebsSingle
      TabOrder = 1
      Width = 356
    end
    object lbMargemDeLucro: TcxLabel
      Left = 24
      Top = 140
      Caption = 'Margem de Lucro'
      Enabled = False
    end
    object lbPrecoVenda: TcxLabel
      Left = 24
      Top = 96
      Caption = 'Pre'#231'o de Venda'
    end
    object cbUsarMargemEspecifica: TcxCheckBox
      Left = 379
      Top = 142
      Caption = 'Usar margem espec'#237'fica'
      ParentFont = False
      State = cbsChecked
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 6
      Transparent = True
      OnClick = cbUsarMargemEspecificaClick
      Width = 142
    end
    object cxLabel1: TcxLabel
      Left = 23
      Top = 24
      Caption = 'Calcular pre'#231'o automaticamente por Margem e Custo?'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object LMDSimplePanel1: TLMDSimplePanel
      Left = 23
      Top = 47
      Width = 498
      Height = 29
      Bevel.BorderColor = clGray
      Bevel.BorderInnerWidth = 1
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      Color = clWhite
      TabOrder = 8
      object rbNaoUsarPadraoDeMargemDeLucro: TcxRadioButton
        AlignWithMargins = True
        Left = 74
        Top = 4
        Width = 95
        Height = 21
        Align = alLeft
        Caption = 'N'#227'o'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbUsarPadraoDeMargemDeLucroClick
        LookAndFeel.Kind = lfFlat
      end
      object rbUsarPadraoDeMargemDeLucro: TcxRadioButton
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 64
        Height = 21
        Align = alLeft
        Caption = 'Sim'
        TabOrder = 1
        OnClick = rbUsarPadraoDeMargemDeLucroClick
        LookAndFeel.Kind = lfFlat
      end
      object cbSeguirPadraoDaLoja: TcxCheckBox
        Left = 365
        Top = 1
        Align = alRight
        Caption = 'Seguir padr'#227'o da loja'
        ParentFont = False
        State = cbsChecked
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Transparent = True
        OnClick = cbSeguirPadraoDaLojaClick
        Width = 132
      end
    end
    object butOk: TcxButton
      Left = 23
      Top = 239
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Salvar'
      TabOrder = 9
      OnClick = butOkClick
    end
    object buCancel: TcxButton
      Left = 109
      Top = 239
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = '&Cancel'
      TabOrder = 10
      OnClick = buCancelClick
    end
    object panelMessage: TLMDSimplePanel
      Left = 304
      Top = 214
      Width = 161
      Height = 52
      Bevel.BorderColor = clMoneyGreen
      Bevel.BorderWidth = 2
      Bevel.Mode = bmCustom
      Color = 9961471
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      object lbMessage: TcxLabel
        AlignWithMargins = True
        Left = 5
        Top = 3
        Margins.Top = 1
        Margins.Bottom = 1
        Align = alTop
        Caption = 'lbMessage'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -15
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Properties.WordWrap = True
        Transparent = True
        Width = 151
      end
    end
    object butCloseMessage: TcxButton
      Left = 471
      Top = 250
      Width = 16
      Height = 16
      TabOrder = 12
      OnClick = butCloseMessageClick
      OptionsImage.ImageIndex = 5
      OptionsImage.Images = dmImagens.im16
      PaintStyle = bpsGlyph
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Transparent = True
    end
    object imgIndicadorUp: TcxImage
      Left = 493
      Top = 250
      AutoSize = True
      Picture.Data = {
        0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
        00100000001008060000001FF3FF610000002B744558744372656174696F6E20
        54696D65004D6F2031372046656220323030332031383A31383A3530202B3031
        30301B8DB1030000000774494D4507D3021111302ED46F55C000000009704859
        7300000AF000000AF00142AC34980000000467414D410000B18F0BFC61050000
        01FA4944415478DAA5D24D48D37118C0F1EFEFBF977FDBD0849052E9922D4DAA
        4B81602204C12675EDC5430D2ABC45D4B517938826DDBA74083A05B20CDC5630
        0F99250CA9C0B235A3378A742FA46B6EAEBDF9DFFFDF8F3A78B05CE273782EBF
        E7F7E1F93DBF47B0CE10AB9EFAF0C8BC9163DC5A3BE0C7DDDDB82FA85A14C5FF
        E1458F4486FE1F18666FABDA3476AF7BA0E6B331C9D5D060F15D36E1A287F1EA
        808FE67A6AC28F8EDEDE3C911BA1A415B05BAD7883A1744C5BE8E2046FFF0D3C
        A07E434E098F7AEE3AA78AE3648B19344D47310CCC26C1F5A191998CBDD0C149
        6657023E1CEAA269F4E9E93BED71BEF0293B8D5636D0759D8AA66192A5AAAA70
        6D30145954CB5DF4B2B00CF461A60E7FF396FA430E9B959686460EB4ED215548
        51A9543096749E8CBC67B6F4838AC5E0DBF7F433F2B8F052FA031812BA814D32
        30476DC7FED6C445F71926528F11BAC06C08EE075E118D27DA5065FB797963BB
        CCBDE82B87E8A5B6B36547E682CBC3CBF931D0152C42C1FF30C29BB9D856FA97
        DFFFF75FE8A3A663B7337BCE759CC9F9B0EC4E6041613818219A4B367189F8EA
        C0151CED3BB7E5CEBA8F30957A8EF11B100483D344F3C9062E935C1DE8C7D1D9
        EACC9D3A7C90AFE98F08214B34080422BC8EC90E06AA75705EEE8D4D496CAAB3
        9BCA795D68C58A9C82A2FF2C2FE96593B68B9BC4AAAFF21A62DDC02FB54CC511
        02D3DB540000000049454E44AE426082}
      Style.BorderStyle = ebsNone
      TabOrder = 13
      Transparent = True
    end
    object imgIndicadorDown: TcxImage
      Left = 519
      Top = 250
      AutoSize = True
      Picture.Data = {
        0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
        00100000001008060000001FF3FF610000002B744558744372656174696F6E20
        54696D65004D6F2031372046656220323030332031383A31383A3530202B3031
        30301B8DB1030000000774494D4507D30211120E11218ADDD900000009704859
        7300000AF000000AF00142AC34980000000467414D410000B18F0BFC61050000
        01E54944415478DAB5D33B6853511CC7F1EF3DB949A889C407415327055F5094
        0E450445707010DA4150A136A242850E62A706058B8B43298883186B115DACDA
        D62ECE3E12B02A8D8DC567144915AC14F3B821F7E661EEBDC74B151C341A289E
        E90C3F3EE7F0FFF15758E451FE0BE0392D4AC1805FADD52CA42D6C8F4BD859CD
        909541D3D710B0291A9257BAFB49692FD12D0DA3AA71EDE6633E44724A43C086
        4B2179A633CC74661261BB7049C1E8C473664FE51B03360F35CBB39DDD3CCBC4
        516C812A1546EE244947B20D02C3CDF2DCA11EA6323114E7756129DC184F90EE
        AB075C4410A089B2733F8EB171382407C22748647F023585EB634FF8D8E7CCA0
        1F1F1E27B7D249F760FF00CEA3BA2A626A7520B0D5AFFAD9D1DAA2746CD9CDB4
        F67001B04A264F13695ECCCE49139B5CB194B282762B27A9FCFAD26D7C4B0CCF
        83CB478FB579594E412FF0B5F2055B4A6CCBC4ED12E4DF194413F1573AB59DF4
        92FF7D0663ACF297BC93170E77ADD34B65AADF6A58B6050EA2A574A2C9F85C71
        59753B5D7CAA3FC45BAC0FB9573C1AD8B73F982BEB0E605278633034132BCCAB
        C55D1C61E69F2D30CEB696A56BEE45F674F83EBFCE723519ABBE77CFEFE520F7
        1BAA71E1DCA5BDCD5C3BD1A47A459CB761DA19F953ECEFCB34EA948A53F00106
        EB4516BD8DDF015F26C611DE341F450000000049454E44AE426082}
      Style.BorderStyle = ebsNone
      TabOrder = 14
      Transparent = True
    end
    object imgAtencao: TcxImage
      Left = 145
      Top = 142
      AutoSize = True
      Picture.Data = {
        0D544C4D44504E474F626A65637489504E470D0A1A0A0000000D494844520000
        00100000001008060000001FF3FF610000002A744558744372656174696F6E20
        54696D65004D692035204D727A20323030332030313A31363A3336202B303130
        302D49F2060000000774494D45D30703050C0C38738E395A0000000970485973
        00000AF000000AF00142AC34980000000467414D410000B18F0BFC6105000002
        564944415478DAA5D35D4893511807F0FFBBBDEF9C4BA732537A474E215CD95D
        C22C8AA5284178679A4111751154170979652F8CCAF0030283A246102548D942
        E8630515097E93294936C7A08D9ACDD636DC74DFDBFBD161441FD0CAF08173F1
        F03CE777CE79E050586750D90AB357A18FD33A0B64794558B69DD8D381E7FF05
        CCDFCA1FD1353E30D254126F9F747C61A30B95156D88AC0970DD410BA36FB314
        9455037C08D1B0070B8F7ABBEA3970FF049C2FA05C59D2D9B7EE33953BA7AF81
        1762D8BEB316EF8627E3E2E27C95E11C3EFE15B099C169765FBC94CB8FA1A866
        066A350BDBD30454253B307B77C8D2C089AD5981C5FB6043F26AC7E69AE3798A
        E000D8DAAF28D9580AEB3D2FB46C053E4CBAA465FB27631D87F13F027366F46B
        EBBA8F52F208347933D8DBE4449CD7627AC285B04F0D3A3706EB0DF79B164EA8
        211BA5DF00C74D1824EDFEA9D22AA34C487BA05205601E18C5E740252E9B9610
        8DAF80C98DC0FD3E8EE9C7E2B1233DE8FF15A066AF6F98D8D2D8BB2B9D7493CC
        0F9A0922AD706335560CB6700E922C04794E0A0A1560ED81271D86BEA90BD10C
        30DC89C3BADA53031A6D3999BA071415404E8E0FA30F5F43A662D0702806414A
        8051125B0E043DC02087CED3FD3065805757CA1C86D6EECA54C4411EE6274D01
        14324ED437079060F4981A1B87C0C721A37F5EF9591F561BCFA220938F98ABBD
        8603EDA5A9988B7478C9F291D37CA0150E088A222895767C9FD98F18BA006FF3
        796CCA0083ED3858ACDBD627A7A97C498C419278B212A4928428250409699213
        428448122912803FE4C59993B7F132EB5F586BAC1BF8061506EE110DE119B000
        00000049454E44AE426082}
      Style.BorderStyle = ebsNone
      TabOrder = 15
      Transparent = True
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 544
    Top = 408
  end
  object BarMgr: TdxBarManager
    AllowCallFromAnotherForm = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
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
    ImageOptions.UseLargeImagesForLargeIcons = True
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 248
    DockControlHeights = (
      0
      0
      0
      0)
    object cmNovo: TdxBarLargeButton
      Caption = '&Novo'
      Category = 0
      Hint = 'Novo'
      Visible = ivAlways
      LargeImageIndex = 6
      GlyphLayout = glLeft
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmEditar: TdxBarLargeButton
      Caption = '&Editar'
      Category = 0
      Hint = 'Editar'
      Visible = ivAlways
      LargeImageIndex = 2
      GlyphLayout = glLeft
      SyncImageIndex = False
      ImageIndex = 20
    end
    object cmApagar: TdxBarLargeButton
      Caption = '&Apagar'
      Category = 0
      Hint = 'Apagar'
      Visible = ivAlways
      LargeImageIndex = 7
      GlyphLayout = glLeft
      SyncImageIndex = False
      ImageIndex = 12
    end
    object cmAtualizar: TdxBarLargeButton
      Caption = 'A&tualizar'
      Category = 0
      Hint = 'Atualizar'
      Visible = ivNever
      LargeImageIndex = 46
      PaintStyle = psCaptionGlyph
      AutoGrayScale = False
    end
    object cmHoje: TdxBarButton
      Caption = '&Hoje'
      Category = 0
      Hint = 'Hoje'
      Visible = ivAlways
    end
    object cmEstaSemana: TdxBarButton
      Caption = 'Esta Semana'
      Category = 0
      Hint = 'Esta Semana'
      Visible = ivAlways
    end
    object cmEsteMes: TdxBarButton
      Caption = 'Este M'#234's'
      Category = 0
      Hint = 'Este M'#234's'
      Visible = ivAlways
    end
    object cmEsteAno: TdxBarButton
      Caption = 'Este Ano'
      Category = 0
      Hint = 'Este Ano'
      Visible = ivAlways
    end
    object cmTudo: TdxBarButton
      Caption = 'Tudo'
      Category = 0
      Hint = 'Tudo'
      Visible = ivAlways
    end
    object cmDigitarPeriodo: TdxBarButton
      Caption = 'Digitar Per'#237'odo'
      Category = 0
      Hint = 'Digitar Per'#237'odo'
      Visible = ivAlways
    end
    object cmLayCustomize: TdxBarButton
      Caption = '&Adicionar/Remover Colunas'
      Category = 0
      Hint = 'Adicionar/Remover Colunas'
      Visible = ivAlways
      ImageIndex = 21
    end
    object cmLaySalvar: TdxBarButton
      Caption = '&Salvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      ImageIndex = 7
    end
    object cmLayRestaurar: TdxBarButton
      Caption = '&Restaurar layout padr'#227'o'
      Category = 0
      Hint = 'Restaurar layout padr'#227'o'
      Visible = ivAlways
      ImageIndex = 33
    end
    object cmExportar: TdxBarLargeButton
      Caption = '&Exportar'
      Category = 0
      Hint = 'Exportar'
      Visible = ivNever
      LargeImageIndex = 47
      AutoGrayScale = False
    end
    object cmImprimir: TdxBarLargeButton
      Caption = '&Imprimir'
      Category = 0
      Hint = 'Imprimir'
      Visible = ivNever
      LargeImageIndex = 7
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = 22
    end
    object cmLayout: TdxBarLargeButton
      Align = iaRight
      Caption = 'La&yout'
      Category = 0
      Hint = 'Layout'
      Visible = ivAlways
      LargeImageIndex = 54
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmPeriodo: TdxBarLargeButton
      Caption = 'Per'#237'odo'
      Category = 0
      Hint = 'Per'#237'odo'
      Visible = ivAlways
      LargeImageIndex = 58
      AutoGrayScale = False
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmUltimas24h: TdxBarButton
      Caption = 'Ultimas 24h'
      Category = 0
      Hint = 'Ultimas 24h'
      Visible = ivAlways
    end
    object cmCfg: TdxBarLargeButton
      Caption = 'Op'#231#245'es'
      Category = 0
      Hint = 'Op'#231#245'es'
      Visible = ivAlways
      LargeImageIndex = 124
      AutoGrayScale = False
      GlyphLayout = glLeft
      ShowCaption = False
    end
    object cmOk: TdxBarLargeButton
      Caption = '&Ok'
      Category = 0
      Hint = 'Ok'
      Visible = ivAlways
      LargeImageIndex = 5
      GlyphLayout = glLeft
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      LargeImageIndex = 4
      GlyphLayout = glLeft
    end
    object container_panBusca: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
  end
  object Query: TnxQuery
    ActiveRuntime = True
    Database = Dados.db
    Timeout = 10000
    SQL.Strings = (
      'Select categoria'
      ' From produto')
    Left = 212
    Top = 2
  end
  object dsValores: TDataSource
    Left = 176
  end
end
