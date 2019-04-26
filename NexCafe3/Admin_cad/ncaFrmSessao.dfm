object FrmSessao: TFrmSessao
  Left = 0
  Top = 0
  Caption = 'Iniciar Acesso'
  ClientHeight = 470
  ClientWidth = 522
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 104
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object bdcAcesso: TdxBarDockControl
    Left = 0
    Top = 0
    Width = 522
    Height = 44
    Align = dalTop
    BarManager = BarMgr
    SunkenBorder = True
    UseOwnSunkenBorder = True
  end
  object panDiv1: TLMDSimplePanel
    Left = 0
    Top = 44
    Width = 522
    Height = 5
    UseDockManager = False
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 2
    object LMDLabel1: TLMDLabel
      Left = 288
      Top = 8
      Width = 39
      Height = 26
      Bevel.Mode = bmCustom
      FontFX.Style = tdSunken
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Options = []
      ParentFont = False
      Visible = False
      Caption = '115'
    end
  end
  object PagPri: TcxPageControl
    Left = 0
    Top = 146
    Width = 522
    Height = 324
    ActivePage = tsPagNormal
    Align = alClient
    HideTabs = True
    TabOrder = 3
    ClientRectBottom = 324
    ClientRectRight = 522
    ClientRectTop = 0
    object tsPagNormal: TcxTabSheet
      Caption = 'tsPagNormal'
      object panDiv2: TLMDSimplePanel
        Left = 0
        Top = 0
        Width = 522
        Height = 5
        UseDockManager = False
        Align = alTop
        Bevel.Mode = bmCustom
        TabOrder = 0
        object lbNumM: TLMDLabel
          Left = 288
          Top = 8
          Width = 39
          Height = 26
          Bevel.Mode = bmCustom
          FontFX.Style = tdSunken
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Options = []
          ParentFont = False
          Visible = False
          Caption = '115'
        end
      end
      object panTot2: TLMDSimplePanel
        Left = 0
        Top = 237
        Width = 522
        Height = 87
        UseDockManager = False
        Align = alBottom
        Bevel.Mode = bmCustom
        TabOrder = 1
        object vgT: TcxVerticalGrid
          Left = 315
          Top = 4
          Width = 207
          Height = 83
          Align = alRight
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = True
          OptionsView.PaintStyle = psDelphi
          OptionsView.RowHeaderWidth = 88
          OptionsBehavior.GoToNextCellOnEnter = True
          TabOrder = 0
          object vgTDesc: TcxEditorRow
            Properties.Caption = 'Desconto'
            Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.EditProperties.Alignment.Horz = taRightJustify
            Properties.EditProperties.OnChange = vgTDescEditPropertiesEditValueChanged
            Properties.EditProperties.OnEditValueChanged = vgTDescEditPropertiesEditValueChanged
            Properties.DataBinding.ValueType = 'String'
            Properties.Value = '0'
            Properties.OnGetEditingProperties = vgTDescPropertiesGetEditingProperties
          end
          object vgTTotalFinal: TcxEditorRow
            Options.TabStop = False
            Properties.Caption = 'Total-Final'
            Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.EditProperties.Alignment.Horz = taRightJustify
            Properties.EditProperties.ReadOnly = True
            Properties.DataBinding.ValueType = 'String'
            Properties.Value = '0'
          end
          object vgTPago: TcxEditorRow
            Properties.Caption = 'Pag. Total ?'
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
            Properties.EditProperties.OnEditValueChanged = vgTPagoEditPropertiesEditValueChanged
            Properties.DataBinding.ValueType = 'String'
            Properties.Value = 'True'
          end
          object vgTValorPago: TcxEditorRow
            Properties.Caption = 'Valor Pago'
            Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.EditProperties.Alignment.Horz = taRightJustify
            Properties.DataBinding.ValueType = 'String'
            Properties.Value = '0'
          end
        end
        object panDiv4: TLMDSimplePanel
          Left = 0
          Top = 0
          Width = 522
          Height = 4
          UseDockManager = False
          Align = alTop
          Bevel.Mode = bmCustom
          TabOrder = 1
        end
        object cbRecibo: TcxCheckBox
          Left = 8
          Top = 10
          AutoSize = False
          Caption = 'Emitir Recibo'
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 2
          Visible = False
          Height = 21
          Width = 84
        end
      end
      object panTran: TLMDSimplePanel
        Left = 0
        Top = 5
        Width = 522
        Height = 34
        UseDockManager = False
        Align = alTop
        Bevel.WidthInner = 0
        Bevel.WidthOuter = 0
        Bevel.Mode = bmEdge
        TabOrder = 2
        object btnEditar: TPngSpeedButton
          Left = 262
          Top = 2
          Width = 75
          Height = 30
          Align = alLeft
          Caption = '&Editar'#13#10'Item'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          OnClick = btnEditarClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
            F80000002A744558744372656174696F6E2054696D65004D6F2033204D727A20
            323030332032333A35323A3535202B30313030354C72630000000774494D4500
            0000000000000973942E000000097048597300000AF000000AF00142AC349800
            0003D44944415478DAAD956D6C535518809F76DF9D6E2BED041C4CDD740C7438
            D812B71843746482010DF2211B890B4AD80F134D8C1AD118211AD1C418C500C1
            688A88A844FDA144ACCB6288825D606E30D66CACDDECB66E6BD7BAD2ADEBC7B6
            D6736F53DBDDB1409593BCF73437F73ECFFB9EBEE75C15F1A122C9F16B41DE7B
            EE70F839E7C8847930127EEB1D714BDC9E1411161189420F4FAD439D7A3A1970
            ED1268347FC6239D0622696A7ABB46B8DC3EC495F79B3068AA193EFF733D07D6
            FF241E1D57712412395271E3706D16DC93374DAAF130CB4DC749D1E763EDB4D3
            DD61C7995540BFA18D37DBC4838DAA75E26AFA57D068745D1F9EA9A261958FBA
            CC00A5D525F0D11E323B9B718E85315F1CA0DB934EDB895E0CBD6992609F78E5
            7359F0901E7EBB0E3F550DCF2E0F10D0D4B3D1B18DCDB5DB09897BDDFB5F4575
            F228B6A1495A5EFB9EA3F96B1998902B3820AE8764416B653B6AF55C68381C8F
            050BB49C8A7CC898BE1F7D6E36EA63ABA85A5643CFE82097CF9E61EDE23BC878
            E0511C8E713639CB25C1C7027150164476CF9FF9CC8C6807D10FCD135F70C67F
            9282458B4467841976B9701CCB46672BA2B8AC940D1B77E0F5AA989E867B7FE7
            C60552F65D41139FD8DFE0EEBB0A4953A5E01CF5D2671BC56CED43E359CA979B
            7EC13F9921C393168C4EDB79DBFC0C452B0AC84A4DC7ED9E6060C04D57979DF1
            2135DFD435933AA5636A2A5A6D528250C4CFDE4B0D684B32C8CDCAC6E399C46E
            77D3D3338CADFB2A5FD737A14B2922148AC293161CB4BDCC58AE8DFC3C2D7E5F
            10FB90078B65848E4BFD1836FFC8B29C0A82C1387C5EC1CC2EE674D150C0C27E
            FB6E561697E2F707181EB94A6FAF83D6360B1F3C66E0C185EB65B80494C0D27F
            35AF20B4332A50259C46AEC10E765AB7B2E5E11AD1E32EAC56077F0AF8F3557B
            79AA64178140141603C7E0D27CDF598520D01085C704D26CB9D0C4E9FE4F3995
            DBCE12EDED745CFC8BC78B9FE6C5CA7D323C119898BD34979D53082676404A4A
            3C7BA99AEF4E1C42FDF730DF9ACF115E9D4E75790D8D652F89E58A6FBEF9042B
            FF5008BC75B3974792ED79FD15EE5CBA98AD5BEAD1EA16CA6D28754BE29224C2
            13E37E934230B66DB6401A46E30FF87C3ED6ACA92527472783A41D1DCB3C5645
            4C92584D798B4230FAE45C81D57A456C2A377AFD6D14161609B86A163051A0AC
            64F5798560E489B982603020CE162F1ACD2D64666AE4EC95F06B09A4B9E28242
            60DF3057208DD8924873E26FE5F228C595AD89C7F50BC6EDACA8FD8A9B39DEAD
            3A4E5F8B15F98303B922AA44548BD0F21F3EFECAC2458C89909AD524C1A443E2
            56113A116937A906D1D4B8913FFAF1F17F33BF5625FC0325905D0BF51EB0AD00
            00000049454E44AE426082}
        end
        object btnTempo: TPngSpeedButton
          Left = 2
          Top = 2
          Width = 81
          Height = 30
          Align = alLeft
          Caption = 'Adicionar'#13#10'&Tempo'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          OnClick = btnTempoClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
            F80000065B4944415478DA7D5669505357183D2F21912D0B09A824811A48C17D
            57ACAD5045C6719B69C70597F6871B15FBA30E75C5753A162916C571B44A2DA3
            E24C85E28A505B454022B856C51177145114304082421292BC7EF72550EDA899
            F9725FEEBBF79CEF3BF7DC7BC3F13C8F777DD2D24EC81D8ED7D36D367E02E01C
            0CF0814EA78377B93A1A6CB6D737AC56CB99F3E7CF9CBC71E3BC89863BF9F700
            71FFEF4F4A3A2AD1EB65DF9BCDE6E521210A5584410D55802FBCBDC5B0DA6C68
            6E7E85E72F9AF0B0FA05EAEB9B1A2C1653464ECEAE5F697C0B61393E48B0678F
            516B3637E50505C9464D9D3C1072852FAA1A008B4B040738389D3C78BB0D629B
            192A673D1AEB4DA8B8740F757575E78CC6534BABAAAEDF2118EB9BD57411ECDE
            7D43DBDC5C5D1A1565081F376E00AED7F3687471D00600943C2904385C408713
            68ED001ACC80A8A116CAF67BB872F51EEEDCADBE555090B7F8E9D3C7D768745B
            278940505878545259292A1B31421F151B3B10679F017A2DA060E212600703A7
            D6CEBB7FBF2621DA3ADCBF5FD6BD42604305AE5EBB45240F4AB2B27626D1B4DB
            846BED22D8BEFDEC4A990CA9F3E78F4151AD049A002BD2BE5B822D7BB34045C0
            4A6036CADE4EE03687BB75BADCA4D4E0C55333144F8B5162BC86CB97CB7F2E29
            39B39BBA6BD89A703B7716CB9A9A9A1E2F9C3F5A55C7ABE11D24C10363311267
            CFC2A09151C8CE3F416B00B4DBDDC04C269117556171422415C34679D22BB4DC
            BE85F647E530965FAADDB76FFF52725B3111347329297FCCEBD9539E3563DA08
            949A03303C18F025808C6D19C8DA968E51E362B165DF3E9809A883C025DD808A
            D3466C4E88C786ECBF10D2A73F442ECF9A54E612C14514149C48BB7FFF4116F1
            3EE0366E3C981B131D3143DE2B02502BA0F5A18C3877969B5726A3F0D041C44D
            8F4772FA169052F833371F192BBE85BA473096A4652134B21FA4AC0292AEF99F
            73A8BD5986BF4F9F3E565A5ABA8BBA2BB8F5EB0FDC9DFEE5908897FE7AF4D0F8
            414EE0360AA6BD5D04A4242EC6A5A253183A360E72A50A25470E4113168139AB
            53205304A1BBAE17BAD1D87692EFC5FDBB68BE7612C5E7CAAE1E3F7E9C119C24
            82FDA6D93387AA6AA46108D5F8820A808D673E2307903D99D9964C88C6BCAF66
            E3714D0D4ACB2F60C10F3B200F5023B0A786361FE04FD55A49A6BAC7B568BD7A
            1865E517AA737272D8421FE2D6ACF9EDE5CC6983D4CF7C22A1D3FAC397B2B630
            A7307BD0B39F3FB076EE5CCCF9620A6A6B9FA0E4CA4D2CDEB4137E4A053AECEE
            7DA196BAE7D43DAA8185088C15171FE6E6E66613C2016EF5EA3D5513E27AF7B1
            AAFB40AE0B822FF5B6D2248E632606C412E0C9DDFBD896B41012A9145FAF4E45
            EF21C3D04E993B0974D2114ED884A039CCB33FB97EA485BE70393F3FFFA44090
            94B4F5F751230DB302C30CB06BFB402A72837380E70B901289C5DC0E9BDD0E7F
            854200661B8E4E0E4C39CC213D610EFD7662C5AE1CAC6D4B465151F1F18A8A0A
            A3205162E286057A7DE8DECF3F8B408DF2130428C582EE1CF7C689C5BBE562AD
            004EAD8BB21553DFC41C0E69645987C381E45D8791F83C11797979598D8D8D65
            34A3801B362CA6FBD8B1532A63C6F4EE81808FC0F71A20B882FFAF00E1999176
            C664268B471216298BA60915ACFBE558579FF07E33FC19865742C2AA651A4DF0
            E6E8D10634FA0F84AF4E07B107AC93807DB17964184CCAE3B025619600EAA252
            58DBF9CC2A6191965944970AA60A679152A90C8C8F4FCCFBD81012D3BFAF162D
            F2819086E8E14336F522602F313BB4806ED48A489651FB39A42E9AD105CC82E1
            7482B3D89A590A6CC5A70201C7715E7DFB0E1E101D3D3E3B3454D3AF6FA41656
            69101C9AE190C8659052DA224F054CFFE987DE76CEDA051305D0D4CCD3EEBECE
            D88EC95DF70191F8E874BD86C5C64EDAD43D2830C660088652E607BB98C2A727
            59C94FC8D2D96686CB5C4B3BD184A69656ACB1ADC3AAF97102C1CF7B8A817424
            135C1545E35B170E11B0F5601B39322666FCECB0B0F078B9DC2F54AD0E80BF8F
            37C4A413EFE269E75AD1FABA0DE69616982D9687D9BAECF065F3C60A04199964
            9C0C8C23CCE2775E991E123A2FA111894483C3C3C3A38283830D2A952A442291
            28D92D65B55A5B4C26535D757575537D7D7D0796E39B2ED7B0D881C934ACF0BD
            97BE8788994546D19D229442471148E1ED19D246C1FE4D90567842A1F7246612
            0CC7F3E51F2478A31AB107D4D70320F6BC66FF1EE8B0403B0BC270E23D9F7F01
            DC1324EEBA6DA8840000000049454E44AE426082}
        end
        object btnCancelar: TPngSpeedButton
          Left = 337
          Top = 2
          Width = 80
          Height = 30
          Align = alLeft
          Caption = '&Cancelar'#13#10'Item'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          OnClick = btnCancelarClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
            F80000002A744558744372656174696F6E2054696D65004D6F2033204D727A20
            323030332032333A35323A3535202B30313030354C72630000000774494D4500
            0000000000000973942E000000097048597300000AF000000AF00142AC349800
            0002BA4944415478DAED955D48935118C7FF9B5AD3A90D9228C1846D14F85143
            4DA48CD9D2B0246441925D54442852975D4817413791D495956685200841E18D
            7DA8E94598CEF905A3304A1866B53162EED3CDB90F4FE77DDDDAF1DD2B24EEB2
            03CF7B9EF37EFC7FE739CF799F2341BC4990DC46D6453B43B590A60E24557A6E
            F022DA4FBFA39E57822E42BA4A93A7DDBB087CB453A759524BAFC6BF80E6217B
            72089999804CC601EED0510F0F389E13A526B3354BDAE9B58307CC9699209526
            BEB3B6B6D12291445FD873A6FFADE1000FA9C4631E409A369F08F761ECE37078
            DD8FF5423F362E1CC3BF0362B363C5FE03929F83C83588EE2242E2C29CC5A211
            03B0CF4401A60B7AEC521D80F26E1B2F2CA19569B2B6067BF5E7907BB505C1A0
            7824624B5834CE00DA3F135270660F2ACFE6E1ABC106F5830EA49FA8C7404539
            EA8ADC308CFCC211B30F2B2B71716124C271B18101B49908296F54E1A84E01A9
            2C0523D374B932E438A5B0D05F9EE0BD55056DFF200F60F3C14622041C9A6000
            356F0979E57986999BADD0362AE1B4B820F34490952FC3709F0DDA1F0EF8FD89
            7F310B63C79C1D360A7210B80C8C5E6F4255CA04D2D2E96D670886512BCABE79
            E0F3C585D8A40B4B061B8D6652B044BAA737E0EE7F8193FA5CC01EA04A6B5834
            BBF0A5A01E559DDDF07AC5EB113B7BD62F9966002FEB1A886ED588DDEA6C2010
            82DFE64586228D9FD2AADD8F0FC1021C1B1A83C793282E06E0FAD21916505249
            CEABAC40562AC6872CF0EDCFC73EC74F146BE43492303E19BD50CE05E0706C5C
            A6CD2A296765B34CB91E2E2C7256ABDD8A09930BDF1B6EC175A515E98F6E43F3
            E63E967C11B8AA2FE175CB73F4CC6FE12CB857D18B854933F80307C8EB96EFE8
            9BCA91CD3F59A4DB07A06945780B72090580DB26D4B8CD6AE400F47CC3416AF4
            94C032B58528643B2D446D09FCA1BFDE7652CB8ECE7C799B11B091E00FBD5C74
            0B18B193350000000049454E44AE426082}
        end
        object btnProd: TPngSpeedButton
          Left = 83
          Top = 2
          Width = 89
          Height = 30
          Align = alLeft
          Caption = 'Adicionar'#13#10'&Produto'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          OnClick = btnProdClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
            F80000002B744558744372656174696F6E2054696D65004D6F203138204E6F76
            20323030322031373A35313A3535202B30313030A08D57A60000000774494D45
            000000000000000973942E000000097048597300000AF000000AF00142AC3498
            000006204944415478DA8D967B5054551CC7BFF7EEBDBBCB3E60918595C117EA
            A8092269C5F8C4349BA96C746CF2D1F418215787196C32C7B4D119FFC8523485
            50491C1F955998F988744C430990F035063A4EA688E0038D8DD7B2ECE3BEFA9D
            CB82E1D8E49DF9EED9BDF79EEFE79CDFF9FDCE590E4F78D5FF84684B64DFD521
            BF3ACBEF972C7FB76855A72A5B37ADDC810BF4D84FD21ED78F7B12F3DA237039
            9D71A5A1CEB6119EA6E0ED33D5A84A7461B4D964ECF7F5F150D617C528A6D75A
            49EAFF01F4DF6B583B05FCC8586873BE877AF7B8ED2783DAF9F2AD3BEA85694B
            50E10BA0CD1E8196A2D5F8201000F74E0E32BC019CA5AEED8F0594E562AC41C4
            7CA3D99E668BEB9F68B245471B44A3C071D014490A70727BA4EC6FE12A2F3497
            FF76C977CDEBC7C58A1A9C5D310F8BFAC760D1D662AC3F761EBBD96449722F40
            D556ACB0BBFAAF4D786E162F189D08B677409364F030C02098E06F2A871AB801
            AB2B15D6D86428B217BED646B43EB8E3BF5F7BB3B9BDA939E1C74A7CB7ED28F6
            905F25C9DB0B707187D894F2E67AE783CBD508B67A219A2C5D12158284C08B76
            0211CC000822B5BC04DE2000A2059DBE06747A3D68ACBDE92F29A93D5A56ADE6
            1D3A838B1E8F671033773A9DD7B9738562FDD88CDC01B74A4F521E08309A0438
            6C3769A28D087486E0F7C990D548D85D63E070F603AF034C3A2018F2A3A3BD09
            267B0C78AD15574EFDEC2B296B5CEF9AB4F397CCCCCC3F8911E2CAF3519E3A7B
            E944DE1403CFD5ABB019AA61546B11F207A0984641D16C68B95B0D5F4700D109
            A9189C9C064E30D374AC04B1EAAD66B481136DD0DA2A70B9E4476DCFBEBA9CCD
            87F125011AB892CFB02B297DC6029B2B9146C6A1E34A21343900DE3115C6E809
            141A8DD6A40DD7CFEE45EBDF2D484C99844104816021D9BA20226BED40A00E6A
            6B29F66F3BDE30FF13E97D029472C73EC587C9E326AC8B740D84FFAF2B0834D5
            C0406B10376E252D2E998724704A08BEE63A5C3AB51F922C60EA3C37CC51710F
            67C1CC792A81F60AF8E9BD9D9B4FD56417A8FB08F02D57B40633C63C33A23876
            C85878EFFE0EEFFDABB04425C039681CF5B782379B29242670BC88CAA23DF0DC
            F360D8B3139034713C99F2E4A140533B2075DC43DBFD7BA8ABF913F9FBDA0FED
            2D45950E58EBC6C099CFC7D5F57F7A3AA7D1A229411F54494284D54145225121
            7442659202F8E3723DEA6B9B61898CC494B737D3DE60A2E70A6459D25B854259
            7DF42364E5C9BB6E34A28C00C758A109E7B68B0DC327CF8967B1E754858C0DE0
            39568521EA4840D9AFEB5E8307B76E342340A19BB6600BA28E6476ED404AD726
            D1F4EA169CD89DDDF6D646AD48D5B09FEE563100579A8B13C9E9B35E1005CAEF
            30C0A0D778B017409182345A8DD601B00F5D8EA84319F8CCFD06141AFDF26D45
            689C918F4D6BB24F6F3888F3D49965D1351D706203F292C6A567DBFBB8601079
            F004E2A8E2D5909742D60139D80985C2674E584C6B61814AA3658A3A90811CF7
            5C82CAF868DB0F6878390F976EF09533E7651F21DF223D4DD9388F7C8CC5A9E3
            C716C40F1F092ED846D9E3257332A5B82BD499492259123F84FDA0BB27244C9F
            2C7C4D9FC1EA82C33DF7F4E79FE239FABCA203F6AEC2D4B4B4C125894923A106
            D9828628244C413297F411CAB4F096C12B613FE0C606F73CDD54A569B0B6FBBB
            FE1E29A7B004C8C14A3D8B1860E97C38E7A69BAF8F9E92EEE035490728DD00E9
            21C03A8400FBDD58B7F0F51E63264DD37ACC993615FE0A6C421E5917749F0742
            FE12BC3B7E74E4E743529E124D26313C8BA09E82AC93D20DD8E7EE9539AB325F
            D29FAF2B3CD975AF5B79BD01EC8A9E3F0573674FE6DE1B3E2C76446C7C0CAC56
            238D90001203C88818B48452C20C8572505334C47C93851519D375C0C6EDA7B1
            313EA778D9B2E51DE1D38D9D0D07FE0DA00D1931549CA35E1C83E9D352F16CCA
            5021CDD1C762B5584C3099050802DF357859459FA4D5707E9585650B9ED701B9
            85E5402EBE65E717E922E92FD283478F4C56FBB47381361A0C351B312C65309F
            387200E206C6697DFB3AF8F80893E6A01A313EFDCA4673F2B1A5D69EAC61CA47
            017DB293AD866DD5EC8FC07F1DFA5471882045B2D0915C61C5901C2473F81D21
            3C73E6C326779B8585E57FF8F7FFFEABE0C206E6B08C61759BF28F78045858C2
            AD7EFD035D9CED615D0548BB0000000049454E44AE426082}
          ExplicitLeft = 120
        end
        object btmImp: TPngSpeedButton
          Left = 172
          Top = 2
          Width = 90
          Height = 30
          Align = alLeft
          Caption = 'Adicionar'#13#10'&Impress'#227'o'
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Transparent = False
          OnClick = btmImpClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
            F80000002B744558744372656174696F6E2054696D6500446F203134204E6F76
            20323030322032333A35393A3234202B30313030B95D9F780000000774494D45
            000000000000000973942E000000097048597300000AF000000AF00142AC3498
            0000052A4944415478DA8D557B4C9B55143F1F85B650DE8C97803098225BC228
            164CC920E8266A30240319C21FEAD8407C0CB3058D990FF8438180908D2DE521
            8F05212038218687D9021346908CB10D41401E9B022B6B45522CAFB694CF732F
            5F6B29CE70935FEFD7EFBBE7F73BE7DC73CF6560E760B2B3B3057ABD3E606B6B
            EB696767E7407777F7A71C1D1D0FF00542DF96EF5BF2CBCA648DB84E8DD0C31E
            06437EAAAAAA7CACACAC2A838282026C6C6C9E44422B272727100A85A06719D0
            6F016C22666666F499EF9CCAEAE9E96940B3C5BD8830DCCC2B2C2CAC8C8F8F7F
            6BFF7E7F6089E51618890DD0E387FEDEEEA5F43793D2171717BB71990AC1EE45
            80F1F5F5F5CACCCCBC9EF6F6BBCFF0F8C26D4253726ED6E143DE27675A6A2A64
            5FA2DD2842B31701320449384E9ECEB8228988667691B3FFFE1FBF776BE374E2
            B1736AB5BA15ED1EFD5F148CD97F87CF73726EA49E392F060BAB5D5118D2A4D1
            68E1FD0469E9F0BD3B5FA3CDAF08ED5E05786969695949A91FE47B051CDAE1BD
            B950E517EFB537D4C82AD0A607F1F7E3A2301780B8B838F1AB896F0C498E2618
            D36424470AAD4E077F2DCCC2F440BB46A7568C2F2F2FF7A954AA96FAFAFA0134
            DF406C3D56202F2FCF696D6DED085FE4D47C34E5AC80906A341A50CE3F00E5DC
            142CCE4FC386EA11D88AACC1DBDB1BA2A2A2A8DDC4C4043B383878777272B2B0
            A9A9A91D5FAD194A98292828F0B0B4B43C8735FF928F8FCF210F0F0F5E57F74F
            2070F507E5EC14ACA91460672B02171717C04307AEAEAE14E49CD8DADA828585
            05B02C4B1DE9EDED653B3B3BAF343636E66C6C6C2C20BF8E292F2FBF1D1A1AFA
            AC9D9D1DE0E96551889D9F9F87A9A92906851903219E6A206BF87C3E2534C5D2
            D212FCF2F036F0ED84A079A0676B6A6A2E7574745C408139A6B6B6561E1D1DED
            89ED010836373741A7D3B184C8C1C18121A7990C73528140401CA236B3EA19E8
            E7FD082AF53A1C5E8860BBDABA1F1617179F45B36E2A101313631430152204D8
            36289981987CD36AB534128F068FEDDAD16F6F6DFFB13EB83FFE3B8C8D8D6972
            7373C941FC86C170E4B1B1B19EC44B8347E622229188CEEBEBEBB0BABA0A5808
            3465073B0F42517A0A5DFB91EC5BB826B9067D7D7D8055A5292929B98C94E54C
            7575B5223C3CDC0DD342378DE499786A2A861B06D87B2829594740C4A537A550
            909E449FCFCBAE426B702B585B5B13814D6C0A44A094A9ABABFB333131711F21
            512A95140CC3D0AAB1B7B7A742680023232380FD0AA43F4B8D2921C84D4BA04E
            7C56DA6A7C47BFE7C145A3404A4ACA3ED3D4ACACAC00A924854201D8BEE91E0C
            0C0C809F9F1F1C9F3E0E85E9AFD375A6519267120941414517400194A0808CA9
            ACAC54262727BB92D0C830DF6C921AE2FDE8E82884858541CCDD18C84F4BDCB1
            86A4D4404E505C81DDA39813C8C8C848C1DCA74746461E118BC53C7242CD85E4
            7239B4B5B5819797179C983AB1A3723E3DF50A25CDAFB8BEFDCE808B5C8AF0C7
            1E21C613FC1C6EB6F8051C52A9D42D383898A68608CCCDCD41737333040606D2
            FD21E940AFD9F83BF1CCC7A92F5281AFCA6F0014C10FC8A5E05AC51CE23B2260
            8110219C114FE0D51984E4C12812815A12146508019E175A3DB8E10BC3C3C3B7
            305DBA227ED16B59279FA702172A6E025C00D2BEAF22FE40AC1331D3664784F8
            5C44AE087F4F4FCFC31289441C1212128EA463434343982DB9169D57E277397C
            083263D5105CA2692943FCC671B2BBDA35D761795C544E081FC401843B6CDFC1
            F711B3DC1D401C7919E1C9D9D2B47011FCF77D6036485402841D42C8DD5C2B5C
            DFD773EFDCB819B8F70A6EA6E31F6861138A583F71EB0000000049454E44AE42
            6082}
          ExplicitLeft = 241
          ExplicitTop = 1
        end
      end
      object LMDSimplePanel7: TLMDSimplePanel
        Left = 0
        Top = 39
        Width = 522
        Height = 198
        UseDockManager = False
        Align = alClient
        Bevel.Mode = bmStandard
        TabOrder = 3
        object Grid: TcxGrid
          Left = 1
          Top = 1
          Width = 520
          Height = 196
          Align = alClient
          BorderStyle = cxcbsNone
          TabOrder = 0
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = True
          object TV: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dsTran
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems.OnSummary = TVDataControllerSummaryFooterSummaryItemsSummary
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '0.00'
                Kind = skSum
                Column = TVPagar
              end
              item
                Format = '0.00'
                Kind = skSum
                Column = TVPago
              end
              item
                Format = '0.00'
                Kind = skSum
                Column = TVValorFinal
              end
              item
                Format = '0.00'
                Kind = skSum
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnHidingOnGrouping = False
            OptionsCustomize.ColumnHorzSizing = False
            OptionsCustomize.ColumnMoving = False
            OptionsCustomize.ColumnSorting = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.Footer = True
            OptionsView.FooterAutoHeight = True
            OptionsView.GridLines = glVertical
            OptionsView.GroupByBox = False
            Styles.OnGetContentStyle = TVStylesGetContentStyle
            Styles.Footer = FrmPri.cxStyle8
            OnCustomDrawFooterCell = TVCustomDrawFooterCell
            object TVHora: TcxGridDBColumn
              Caption = 'Hora'
              DataBinding.FieldName = 'DataHora'
              PropertiesClassName = 'TcxTimeEditProperties'
              Properties.Alignment.Horz = taCenter
              Properties.Alignment.Vert = taVCenter
              Properties.TimeFormat = tfHourMin
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              MinWidth = 55
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.IncSearch = False
              Options.HorzSizing = False
              Width = 55
            end
            object TVTipo: TcxGridDBColumn
              Caption = 'Tipo'
              DataBinding.FieldName = 'NomeTipo'
              HeaderAlignmentHorz = taCenter
              MinWidth = 70
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.IncSearch = False
              Options.HorzSizing = False
              Width = 70
            end
            object TVDescr: TcxGridDBColumn
              Caption = 'Descri'#231#227'o'
              DataBinding.FieldName = 'Descr'
              PropertiesClassName = 'TcxMaskEditProperties'
              MinWidth = 170
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.IncSearch = False
              Options.HorzSizing = False
              Width = 170
            end
            object TVValorFinal: TcxGridDBColumn
              Caption = 'Valor'
              DataBinding.FieldName = 'TotalF'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              OnGetDisplayText = TVValorFinalGetDisplayText
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              MinWidth = 72
              Options.Editing = False
              Options.Filtering = False
              Options.Focusing = False
              Options.IncSearch = False
              Options.HorzSizing = False
              Width = 72
            end
            object TVPago: TcxGridDBColumn
              Caption = 'Valor Pago'
              DataBinding.FieldName = 'Pago'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              OnGetDisplayText = TVValorFinalGetDisplayText
              HeaderAlignmentHorz = taCenter
              Width = 70
            end
            object TVPagar: TcxGridDBColumn
              Caption = 'Pagar'
              DataBinding.FieldName = 'Saldo'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              OnGetDisplayText = TVValorFinalGetDisplayText
              HeaderAlignmentHorz = taCenter
              HeaderAlignmentVert = vaCenter
              Width = 73
            end
            object TVID: TcxGridDBColumn
              DataBinding.FieldName = 'ID'
              Visible = False
              SortIndex = 0
              SortOrder = soAscending
            end
            object TVCancelado: TcxGridDBColumn
              DataBinding.FieldName = 'Cancelado'
              Visible = False
            end
          end
          object GL: TcxGridLevel
            GridView = TV
          end
        end
      end
    end
    object tsPagManut: TcxTabSheet
      Caption = 'tsPagManut'
      ExplicitWidth = 0
      ExplicitHeight = 0
      object InspM: TcxDBVerticalGrid
        Left = 0
        Top = 0
        Width = 522
        Height = 324
        Align = alClient
        LookAndFeel.Kind = lfFlat
        OptionsView.CellTextMaxLineCount = 3
        OptionsView.AutoScaleBands = False
        OptionsView.PaintStyle = psDelphi
        OptionsView.GridLineColor = clBtnShadow
        OptionsView.RowHeaderMinWidth = 30
        OptionsView.RowHeaderWidth = 127
        OptionsView.ValueWidth = 92
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.GoToNextCellOnTab = True
        OptionsData.CancelOnExit = False
        TabOrder = 0
        object InspMData: TcxDBEditorRow
          Properties.EditPropertiesClassName = 'TcxDateEditProperties'
          Properties.EditProperties.Alignment.Horz = taLeftJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.DateButtons = [btnClear, btnToday]
          Properties.EditProperties.DateOnError = deToday
          Properties.DataBinding.FieldName = 'Data'
        end
        object InspMInicio: TcxDBEditorRow
          Properties.EditPropertiesClassName = 'TcxTimeEditProperties'
          Properties.EditProperties.Alignment.Horz = taLeftJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.ReadOnly = True
          Properties.DataBinding.FieldName = 'Inicio'
        end
        object InspMFim: TcxDBEditorRow
          Properties.EditPropertiesClassName = 'TcxTimeEditProperties'
          Properties.EditProperties.Alignment.Horz = taLeftJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.ReadOnly = True
          Properties.DataBinding.FieldName = 'Fim'
        end
        object InspMTempo: TcxDBEditorRow
          Properties.EditPropertiesClassName = 'TcxTimeEditProperties'
          Properties.EditProperties.Alignment.Horz = taLeftJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.ReadOnly = True
          Properties.DataBinding.FieldName = 'Tempo'
        end
        object InspMNomeFuncI: TcxDBEditorRow
          Properties.Caption = 'Funcionario Inicio'
          Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.EditProperties.Alignment.Horz = taLeftJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.DropDownRows = 7
          Properties.EditProperties.ImmediateDropDown = False
          Properties.EditProperties.ListColumns = <>
          Properties.EditProperties.ListOptions.ShowHeader = False
          Properties.EditProperties.MaxLength = 40
          Properties.EditProperties.ReadOnly = True
          Properties.DataBinding.FieldName = 'NomeFuncI'
        end
        object InspMNomeFuncF: TcxDBEditorRow
          Properties.Caption = 'Funcionario T'#233'rmino'
          Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.EditProperties.Alignment.Horz = taLeftJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.DropDownRows = 7
          Properties.EditProperties.ImmediateDropDown = False
          Properties.EditProperties.ListColumns = <>
          Properties.EditProperties.ListOptions.ShowHeader = False
          Properties.EditProperties.MaxLength = 40
          Properties.EditProperties.ReadOnly = True
          Properties.DataBinding.FieldName = 'NomeFuncF'
        end
        object InspMObs: TcxDBEditorRow
          Properties.EditPropertiesClassName = 'TcxMemoProperties'
          Properties.EditProperties.Alignment = taLeftJustify
          Properties.EditProperties.MaxLength = 0
          Properties.EditProperties.ReadOnly = False
          Properties.DataBinding.FieldName = 'Obs'
        end
      end
    end
  end
  object LMDSimplePanel2: TLMDSimplePanel
    Left = 0
    Top = 146
    Width = 522
    Height = 0
    UseDockManager = False
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 4
    object LMDLabel3: TLMDLabel
      Left = 288
      Top = 8
      Width = 39
      Height = 26
      Bevel.Mode = bmCustom
      FontFX.Style = tdSunken
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Options = []
      ParentFont = False
      Visible = False
      Caption = '115'
    end
  end
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 49
    Width = 522
    Height = 97
    UseDockManager = False
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 5
    object LMDLabel2: TLMDLabel
      Left = 440
      Top = 72
      Width = 39
      Height = 26
      Bevel.Mode = bmCustom
      FontFX.Style = tdSunken
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Options = []
      ParentFont = False
      Visible = False
      Caption = '115'
    end
    object vgH: TcxDBVerticalGrid
      Left = 83
      Top = 0
      Width = 439
      Height = 97
      Align = alClient
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = True
      OptionsView.CellTextMaxLineCount = 3
      OptionsView.ShowEditButtons = ecsbAlways
      OptionsView.AutoScaleBands = False
      OptionsView.PaintStyle = psDelphi
      OptionsView.GridLineColor = clBtnShadow
      OptionsView.RowHeaderMinWidth = 30
      OptionsView.RowHeaderWidth = 98
      OptionsView.RowHeight = 22
      OptionsView.ValueWidth = 92
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.GoToNextCellOnTab = True
      OptionsBehavior.RowTracking = False
      OptionsBehavior.AllowChangeRecord = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      TabOrder = 0
      OnExit = vgHExit
      OnItemChanged = vgHItemChanged
      DataController.DataSource = dsMT
      object vgHTipoAcesso: TcxDBEditorRow
        Properties.Caption = 'Tipo de Acesso'
        Properties.HeaderAlignmentVert = vaCenter
        Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.EditProperties.Alignment.Horz = taLeftJustify
        Properties.EditProperties.Alignment.Vert = taVCenter
        Properties.EditProperties.DropDownRows = 7
        Properties.EditProperties.ImmediateDropDown = False
        Properties.EditProperties.ListColumns = <>
        Properties.EditProperties.ListFieldIndex = -1
        Properties.EditProperties.ListOptions.ShowHeader = False
        Properties.EditProperties.MaxLength = 30
        Properties.EditProperties.ReadOnly = False
        Properties.DataBinding.FieldName = 'NomeTipoAcesso'
      end
      object vgHCliCad: TcxDBEditorRow
        Properties.Caption = 'Cliente'
        Properties.HeaderAlignmentVert = vaCenter
        Properties.EditPropertiesClassName = 'TcxPopupEditProperties'
        Properties.EditProperties.PopupAutoSize = False
        Properties.EditProperties.PopupControl = fbPesqCli.Owner
        Properties.EditProperties.PopupHeight = 400
        Properties.EditProperties.PopupWidth = 550
        Properties.EditProperties.OnCloseUp = vgHCliCadEditPropertiesCloseUp
        Properties.EditProperties.OnInitPopup = vgHCliCadEditPropertiesInitPopup
        Properties.DataBinding.FieldName = 'NomeCliente'
        Properties.Options.ShowEditButtons = eisbAlways
      end
      object vgHAvulso: TcxDBEditorRow
        Properties.Caption = 'Cliente'
        Properties.HeaderAlignmentVert = vaCenter
        Properties.EditPropertiesClassName = 'TcxTextEditProperties'
        Properties.EditProperties.Alignment.Horz = taLeftJustify
        Properties.EditProperties.Alignment.Vert = taVCenter
        Properties.EditProperties.MaxLength = 40
        Properties.EditProperties.ReadOnly = False
        Properties.DataBinding.FieldName = 'NomeAvulso'
        Visible = False
      end
      object vgHObs: TcxDBEditorRow
        Properties.Caption = 'Observa'#231#227'o'
        Properties.HeaderAlignmentVert = vaCenter
        Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
        Properties.DataBinding.FieldName = 'Obs'
      end
      object vgHDebitoCli: TcxDBEditorRow
        Properties.Caption = 'D'#233'bito Atual'
        Properties.HeaderAlignmentVert = vaCenter
        Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.EditProperties.Alignment.Horz = taLeftJustify
        Properties.EditProperties.Alignment.Vert = taVCenter
        Properties.EditProperties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
        Properties.EditProperties.Nullable = False
        Properties.EditProperties.ReadOnly = True
        Properties.EditProperties.UseThousandSeparator = True
        Properties.DataBinding.FieldName = 'Debito'
        Styles.Content = cxStyle13
        Visible = False
      end
    end
    object panH1: TLMDSimplePanel
      Left = 0
      Top = 0
      Width = 78
      Height = 97
      UseDockManager = False
      Align = alLeft
      Bevel.Mode = bmEdge
      TabOrder = 1
      object btnFunc: TLMDSpeedButton
        Tag = 2
        Left = 2
        Top = 71
        Width = 74
        Height = 23
        Caption = 'Funcion'#225'rio'
        OnClick = btnCadClick
        OnMouseUp = btnFuncMouseUp
        Align = alTop
        GroupIndex = 5
        Style = ubsFlat
        ExplicitTop = 69
      end
      object btnAvulso: TLMDSpeedButton
        Tag = 1
        Left = 2
        Top = 48
        Width = 74
        Height = 23
        Caption = 'Avulso'
        OnClick = btnCadClick
        OnMouseUp = btnAvulsoMouseUp
        Align = alTop
        GroupIndex = 5
        Style = ubsFlat
        ExplicitTop = 46
      end
      object btnCad: TLMDSpeedButton
        Left = 2
        Top = 24
        Width = 74
        Height = 24
        Caption = 'Cadastrado'
        OnClick = btnCadClick
        Align = alTop
        GroupIndex = 5
        Pressed = True
        Style = ubsFlat
      end
      object cxLabel1: TcxLabel
        Left = 2
        Top = 2
        Align = alTop
        AutoSize = False
        Caption = 'Tipo Cliente:'
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Style.BorderStyle = ebsNone
        Style.Edges = [bBottom]
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Height = 22
        Width = 74
      end
    end
    object LMDSimplePanel3: TLMDSimplePanel
      Left = 78
      Top = 0
      Width = 5
      Height = 97
      UseDockManager = False
      Align = alLeft
      Bevel.Mode = bmCustom
      TabOrder = 2
    end
  end
  object BarMgr: TdxBarManager
    AllowReset = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default'
      'Sinal')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    ImageOptions.Images = dmImagens.Imagens
    ImageOptions.LargeImages = FrmPri.im32
    ImageOptions.MakeDisabledImagesFaded = True
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = True
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 216
    Top = 224
    DockControlHeights = (
      0
      0
      0
      0)
    object BarMgrBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Acesso'
      CaptionButtons = <>
      DockControl = bdcAcesso
      DockedDockControl = bdcAcesso
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 67
      FloatTop = 344
      FloatClientWidth = 69
      FloatClientHeight = 44
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmMaquina'
        end
        item
          Visible = True
          ItemName = 'cmNumM'
        end
        item
          BeginGroup = True
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
          ItemName = 'cmListaEspera'
        end
        item
          Visible = True
          ItemName = 'cmRecibo'
        end>
      MultiLine = True
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Acesso'
      OneOnRow = True
      Row = 0
      SizeGrip = False
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BarMgrBar2: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Rodap'#233' Acesso'
      CaptionButtons = <>
      DockedDockingStyle = dsBottom
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsBottom
      FloatLeft = 276
      FloatTop = 477
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmData'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmPagamento'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmFuncFim'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmFuncInicio'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'RodAcesso'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = False
      WholeRow = True
    end
    object BarMgrBar3: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 478
      FloatTop = 452
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmNovoSinal'
        end>
      OldName = 'Custom 1'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = False
      WholeRow = True
    end
    object BarMgrBar4: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Custom 2'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 255
      FloatTop = 304
      FloatClientWidth = 108
      FloatClientHeight = 22
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmNovoItem'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmRemoverItem'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Custom 2'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = False
      WholeRow = True
    end
    object cmFuncFim: TdxBarStatic
      Caption = 'Func. Fim: daniel'
      Category = 0
      Hint = 'Func. Fim: daniel'
      Visible = ivAlways
    end
    object cmData: TdxBarStatic
      Caption = 'Data: 22/05/2002'
      Category = 0
      Hint = 'Data: 22/05/2002'
      Visible = ivAlways
    end
    object cmPagamento: TdxBarStatic
      Caption = 'Pago em: 22/05/2202'
      Category = 0
      Hint = 'Pago em: 22/05/2202'
      Visible = ivAlways
    end
    object cmFuncInicio: TdxBarStatic
      Caption = 'Func.Inicio: jlborges'
      Category = 0
      Hint = 'Func.Inicio: jlborges'
      Visible = ivAlways
    end
    object cmNumM: TdxBarControlContainerItem
      Caption = 'M'#225'quina'
      Category = 0
      Hint = 'M'#225'quina'
      Visible = ivAlways
      Control = lbNumM
    end
    object cmMaquina: TdxBarStatic
      Caption = 'M'#225'q:'
      Category = 0
      Hint = 'M'#225'q:'
      Visible = ivAlways
    end
    object cmGravar: TdxBarLargeButton
      Caption = '&Salvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      OnClick = cmGravarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 41
    end
    object cmNovoSinal: TdxBarButton
      Caption = '&Adicionar Novo Pagamento Antecipado'
      Category = 0
      Hint = 'Adicionar Novo Pagamento Antecipado'
      Visible = ivAlways
      ImageIndex = 0
      PaintStyle = psCaptionGlyph
    end
    object cmTituloSinal: TdxBarStatic
      Caption = 'Valores Pagos Antecipadamente'
      Category = 0
      Hint = 'Valores Pagos Antecipadamente'
      Visible = ivAlways
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 49
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      PaintStyle = psCaptionGlyph
      GlyphLayout = glLeft
    end
    object cmNovoItem: TdxBarButton
      Caption = 'Adicionar Novo Item'
      Category = 0
      Hint = 'Adicionar Novo Item'
      Visible = ivAlways
      ImageIndex = 0
      PaintStyle = psCaptionGlyph
    end
    object cmRemoverItem: TdxBarButton
      Caption = '&Remover Item'
      Category = 0
      Hint = 'Remover Item'
      Visible = ivAlways
      ImageIndex = 6
      PaintStyle = psCaptionGlyph
    end
    object cmRecibo: TdxBarControlContainerItem
      Align = iaRight
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = cbRecibo
    end
    object cmListaEspera: TdxBarLargeButton
      Caption = 'Lista de Espera'
      Category = 0
      Hint = 'Lista de Espera'
      Visible = ivNever
      ButtonStyle = bsChecked
      OnClick = cbListaEsperaClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 68
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 56
    Top = 256
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
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
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clRed
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsStrikeOut]
      TextColor = clRed
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    Left = 56
    Top = 224
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15588572
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15588572
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWindowText
    end
  end
  object cxStyleRepository3: TcxStyleRepository
    Left = 88
    Top = 224
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
  end
  object MT: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
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
    Left = 128
    Top = 224
    object MTCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object MTNomeCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeCliente'
      LookupDataSet = Dados.tbCli
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Cliente'
      Size = 50
      Lookup = True
    end
    object MTNomeAvulso: TStringField
      FieldName = 'NomeAvulso'
      Size = 50
    end
    object MTObs: TStringField
      FieldName = 'Obs'
      Size = 200
    end
    object MTDebito: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'Debito'
      LookupDataSet = Dados.tbCli
      LookupKeyFields = 'ID'
      LookupResultField = 'Debito'
      KeyFields = 'Cliente'
      Lookup = True
    end
    object MTTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object MTNomeTipoAcesso: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeTipoAcesso'
      LookupDataSet = Dados.tbTipoAcesso
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'TipoAcesso'
      Size = 40
      Lookup = True
    end
  end
  object dsMT: TDataSource
    DataSet = MT
    Left = 168
    Top = 224
  end
  object mtTran: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
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
    OnCalcFields = mtTranCalcFields
    Left = 128
    Top = 288
    object mtTranID: TIntegerField
      FieldName = 'ID'
    end
    object mtTranDataHora: TDateTimeField
      FieldName = 'DataHora'
      DisplayFormat = 'hh:mm'
    end
    object mtTranTipo: TIntegerField
      FieldName = 'Tipo'
    end
    object mtTranDescr: TStringField
      FieldName = 'Descr'
      Size = 200
    end
    object mtTranTotal: TCurrencyField
      FieldName = 'Total'
    end
    object mtTranPago: TCurrencyField
      FieldName = 'Pago'
    end
    object mtTranSaldo: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Saldo'
      Calculated = True
    end
    object mtTranNomeTipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeTipo'
      Size = 30
      Calculated = True
    end
    object mtTranObjTran: TIntegerField
      FieldName = 'ObjTran'
    end
    object mtTranObjItem: TIntegerField
      FieldName = 'ObjItem'
    end
    object mtTranDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object mtTranFunc: TStringField
      FieldName = 'Func'
      Size = 30
    end
    object mtTranCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object mtTranTotalF: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TotalF'
      Calculated = True
    end
    object mtTranCanceladoPor: TStringField
      FieldName = 'CanceladoPor'
      Size = 30
    end
    object mtTranCanceladoEm: TDateTimeField
      FieldName = 'CanceladoEm'
    end
  end
  object dsTran: TDataSource
    DataSet = mtTran
    Left = 168
    Top = 288
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 360
    Top = 72
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer2Timer
    Left = 296
    Top = 72
  end
end
