object FrmRegistro2: TFrmRegistro2
  Left = 255
  Top = 183
  BorderStyle = bsDialog
  Caption = 'Registro'
  ClientHeight = 435
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Paginas: TcxPageControl
    Left = 0
    Top = 0
    Width = 614
    Height = 358
    ActivePage = timage
    Align = alClient
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = True
    Options = [pcoGoDialog]
    Style = 6
    TabOrder = 0
    ClientRectBottom = 358
    ClientRectRight = 614
    ClientRectTop = 24
    object tsLicenca: TcxTabSheet
      BorderWidth = 10
      Caption = 'Licen'#231'a de Uso'
      ImageIndex = 0
      object cxLabel4: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        AutoSize = False
        Transparent = True
        Height = 8
        Width = 594
      end
    end
    object tsNaoLic: TcxTabSheet
      BorderWidth = 10
      Caption = 'Software N'#227'o Licenciado'
      ImageIndex = 1
      object rgNaoLic: TcxRadioGroup
        Left = 0
        Top = 99
        Align = alTop
        Caption = ' O que voc'#234' deseja fazer ? '
        ItemIndex = 0
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = 
              '&1. Continuar usando em Modo Demonstra'#231#227'o'#13#10'     (nessa op'#231#227'o voc' +
              #234' est'#225' limitado ao controle de 2 m'#225'quinas apenas)'
            Value = True
          end
          item
            Caption = 
              '&2. Testar gratuitamente por 7 dias'#13#10'     (nessa op'#231#227'o voc'#234' pode' +
              'r'#225' controlar TODAS m'#225'quinas de sua loja)'
          end
          item
            Caption = '&3. J'#225' tenho um registro, vou digitar meu c'#243'digo de loja.'
          end>
        Properties.WordWrap = True
        Style.BorderStyle = ebs3D
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = True
        Style.Shadow = False
        Style.TransparentBorder = False
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        ExplicitTop = 103
        Height = 148
        Width = 594
      end
      object cxLabel6: TcxLabel
        Left = 0
        Top = 45
        Align = alTop
        AutoSize = False
        Caption = 
          'O Cyber Manager n'#227'o est'#225' licenciado para ser executado nesta m'#225'q' +
          'uina e por isso est'#225' funcionando em modo demonstra'#231#227'o. Neste mod' +
          'o o sistema funciona sem nenhuma restri'#231#227'o de recursos, por'#233'm es' +
          't'#225' limitado ao controle de 2 m'#225'quinas apenas.'
        ParentFont = False
        Properties.LabelEffect = cxleCool
        Properties.WordWrap = True
        Style.BorderStyle = ebsNone
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        Transparent = True
        ExplicitTop = 49
        Height = 54
        Width = 594
      end
      object cxLabel5: TcxLabel
        Left = 0
        Top = 17
        Align = alTop
        AutoSize = False
        Caption = 'Funcionando em Modo Demonstra'#231#227'o'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
        ExplicitTop = 21
        Height = 28
        Width = 594
      end
      object lbExpirou: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        Caption = 'Sua licen'#231'a de uso tempor'#225'ria expirou em 31/05/2004'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
        Visible = False
      end
    end
    object tsDadosCad: TcxTabSheet
      BorderWidth = 10
      Caption = 'Dados Cadastrais'
      ImageIndex = 7
      object cxLabel20: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        Caption = 
          'Para exibir ou alterar os dados cadastrais da loja digite a senh' +
          'a e clique em avan'#231'ar:'
        ParentFont = False
        Properties.Alignment.Vert = taVCenter
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
      end
      object cxLabel21: TcxLabel
        Left = 0
        Top = 44
        Caption = 'Senha da Loja: '
        ParentFont = False
        Transparent = True
      end
      object edSenha: TcxTextEdit
        Left = 0
        Top = 62
        ParentFont = False
        Properties.EchoMode = eemPassword
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 2
        Width = 177
      end
    end
    object timage: TcxTabSheet
      BorderWidth = 10
      Caption = 'Chave de Libera'#231#227'o'
      ImageIndex = 9
      object Image1: TImage
        Left = 0
        Top = 0
        Width = 48
        Height = 48
        AutoSize = True
        Picture.Data = {
          0A54504E474F626A65637489504E470D0A1A0A0000000D494844520000003000
          00003008060000005702F9870000002B744558744372656174696F6E2054696D
          6500446F2032302046656220323030332031333A32363A3335202B303130301E
          E473E40000000774494D45000000000000000973942E00000009704859730000
          0B1100000B11017F645F910000000467414D410000B18F0BFC610500000D1249
          44415478DACD59797454D519FFBD59336B76120826044456499054043C2C5270
          41EB528F22D252ADFEA1A54AEB41EB69B58AA014447B8A2B0A0D611110620041
          24C8160201123024242121930C2199C96432496632FBCC7BFDEE7B43E070D092
          9284DE93EFBC9CF7EEBBEFFB7DDFEF7ECB1D0E3736B82BFE176E70AD1B56E0BA
          86B01D2A9B1A0F82C74C1E480B871074F950965F849C973E403D4D09F425986E
          01F0946076D86758AC4A993C4419370A9CD200DEEF80EFC261382F94B46E3B84
          F9F397630F4D7592F0FF37008413500703F858489AF2AC2AE51E0E613710F201
          32F6BA82AE04CEB40FB6F3A5F6B98BF0FBC2521CA6071DE8034FFC5700422D34
          EDF5D8AE1F397B86C23008089271F9103D084724F23F2783BD340FDF15B837FF
          761196D1AB6749FC371580500185A3113BA2C7CCBE5FAE4D46C8E344D0EF8746
          A384C8103ED805840F85E0B59F87B9EAAC6DDCEFF0179F1FBB68524B6F7BE167
          01F80E62B92C7DFA2B72C36D5C8BB909BECE4E5287874C0EA4A4271283225E40
          18016F0072C18BC6D2C3C2830BB1B4CC84B5F4A006BDBC177E1280AF08F70BBA
          5B77AA53A6CB1BCFD5231C0A88CA830F8B5763BC06B1093A894EA46367BB1B7A
          8302174A0EE0E57FE2B3BCC3C8A107A7D0CB34BA2680F6E388153C9AB298B14F
          A558AA9BC8BA5E08646981292F93B976ECB514CEB83BFEF69119092908070953
          182E02101DA786B9B8008BD6E0DF6B7661332D5548D2D9E7003AF763997AD0D4
          85DE501CEC8D369AC48B56F7CB54B5939F387ECC66F3B73EFB744A60F5BBC316
          32FA38ED9D888A9241A595A1BEF838DE5C8DB5EBF6208F963A00291AF51D00EF
          31A40742B1678D231FD25C283711758244F330B47186E6DBEF2BCCB7DB038CD7
          8757AD1C1CFFFCA3F15B1152A2A1C68E5B06EB695E10A6536578F95F58BDEB28
          BEBD29003AF6619536FD9EE783BC06167333D15B80215AC5CF9A5FB5F1E4C936
          334DF98EA4DC529BF170B28A5BEB6DE5D1E6F060405A14022E0FCC15263CFE26
          569D398FED34AF80C4D567005C05E8170CEA4CB1A31FD0B598AD70393A89393C
          8ED785F29F7EF1EC799AC2AC5A44D2E66EC9F858EB165E68A872223A560E2349
          87CD014BBD3D78E7F3F8D2E5C5269A779239B5CF00B4EDC51F94FD467FA4EB97
          8E06DABC41AF9FF13AF48B27AB365AAD81E33485C5F68BC59B20CB9C92713E68
          F5A69A4D4E0C1BA9A5CD2DC052DB8CEA5A4FC5D43F622FCDCB8694CC427D06C0
          B107FB63864F9FC62968339E6D4298B85F6E0A143C32DF749A1E6F811416BD1E
          7BD6A31AB7775BFD8FCD9C3A8A47FF812A315DD59CB1E2F39DC85DF195386F23
          493DFA2A91557E8BE80495B63961C44435CBB0E66A1B65DD0016FCA379DDAE82
          4E062097E48240EA841AB28EF02EFF449F7A2CF449E9647C27DCA67CD49594E3
          FD5C7CB57E170E50C0DD41F36D7D06A07A1366260EECFF7DCCC05BE99301345F
          EC80B3CDC74F79C6BCDAD22AEC4624A2782DE3E7AADCEE1C59C8C7C138023090
          E8D269253D55A4856828CC16EAACBE63453F62C9921CB1A8F3A017B3711780B3
          1BB130F5B6F465FAD878B1400BF882A82C73744C7ED6B2CE296DC8124F6356BC
          5AAE2AB69CAE4A8ED539A031E8486F026C180E441390A85BC4B52CC59B6139B5
          37607560DDC6BD58BEE140EFF5099701E4E0932199B7BDA0D64445CA83301A1A
          5CB68C5F356D68F360FDDAB503CD73A68FD8E969AC9AD054DB0ABD3E00832E04
          1D55130A5D02A02710C661048644998CA0C78AFA1F3E87CD546BAD6CC28ABF7F
          86EC2627DAD1C39BBA0B40790E360F1B3BF409854A2695C8DA74F0327578E69C
          A28F674E339EF8D373A35F115CB563EB4ACF83A3B7860EE5606DF2434E859D8E
          82904627874C3750F28691C43094568F457BFD31D4FEB05AB0B6788BCBEAB1E8
          F5CF71103D48AB2E006772B0754446DAAF154A02A08C0162C6D027FC5201C709
          E0DB2A602A3D872055D0A9A902599E6A23B90EE7CAA988D313008D0444ADD310
          AD064B7B83D14A9306D6F15C28DA828B457B42CDEDD8947B14CBD6E7A3BA2768
          D505A0640DB2478D499EA7D628240FE88610100339DC05BEBD1A75D50E040202
          1213042424D237D531A83751EE208D9817B4A4BC9EE814C580D055A98BA51BC3
          22DE2051F587DFD382EADD9FC37AAEC65167C307CBB760F5792BEC3742AB2E00
          859FE08D2143F48B920668A4F5C47D1082C719426363986A2201717102FA25D1
          6D6D029A2D2A34D63409397BB17DF2180C4D4DC2A828DA3ECC1B0C0CF3461415
          7772DD8008AD58C4A20D2F8B87A3EE042ABEFD526869F19CA968C03B7FCB1613
          1FA355F87F0690BB18F78F1BA5DC25704ACE60605EA51A9F94F77978F0540F25
          91E2B1B45761E80F5B13A5E34A8BB0F100F2566C865DA544CDDBF33066DA583C
          A95090F175921718080646AD5513ADD2A50D1E3D8A6E0EA28554A82DD80253C1
          6EDEEE44EEDE13782FFB002AE981AF3BB4EA023069240C2B5F41496CAC726830
          2095CF4C7125758F03FA93358D44AD98643454BA60ABEBE0B3F3F1CD47B96885
          54F39F20513E3915F7CEBB17F3A3F548D392230D86CB7B4343A2D245938B865E
          A6957A20D1AA1565795FA0B1A2AAFD621B3EFA64373EABA8171360E87A805C59
          4AC837BD852746A7232726160AB2AA68456D0C4DA178EF71A95057D601476BB8
          FDAD6CECDA7F4A0C894723D218592B31BD1FEE786D0E9E1B918A87542A32BC5E
          5A8745679D482F8E68957C45B422AFC813603795E054EE1768B576565149B5E4
          8DF5D809A9190A5F2F00368C2B17E08589A3F07A6222A2D53A0EFE3055992D61
          B8DB05DF77C5F8E1C3AD6871BA4124022BEE58CD63C5E54D28632423497FFE01
          3CF6C824BCA88B42BC91BC377CDA0C382A7E805A111081A8B52AC8F4A952B462
          FB83452E6870EED03654E6EFE0DB9CD87DE41C16AFD98B333F47ABAB01300512
          87A761CAF44C4C4D4944FF60085C71353A0E95C24F8AB3E6A48AA494A40E52B3
          12BAC69A54DD21F9DE71F8E59F1FC3AA61E347CBD2323288951C5AAA0AE1B7D7
          416F94A8A5D419A46C2E7A8365F3546A61DB7172F31730979E7537BBF02965F2
          952526D150C1AB815CABA5A4A008222B585DC082785CE42507C9C588C5DB2035
          EB3FC751C5AE77B05CA3512C98F6D43D34939695112FE51A785AADB01110B522
          14A115CBE649129D8C918C2E4FA22C7E1A451B56C16671991A1C7877D1666CBD
          9A563F752AC1EE2B459F4AD66483251DEFB5AC70AD51F8010690C76A6E9F90A6
          4D194AA194974900380A068A280A1032345796C0E768ECF246945641B4BA25B2
          3F46D295721174A83CB003A5BBF3840A73F8C377BEC60AA06B935FD7D1E2A539
          DDCA98FB9762A54C299F3FE561A24798599F14E79497AF729508C465B351623B
          8528252F7A4327462BED655AC58C86DB19148E66AFE0F6157AF297E56125A456
          B5FD7A01747B142D43BADD8B8AAC89C6A8A4013A88E7A7CCF2CC0397BCD0E50D
          3584B00C0D15E5F0B7B7747983855DA53E0101E560E160EE09747682CB3D826F
          361C160F8F59BFDDDC6B00F62CC16A8AFFCF4E9E41B13324BF4AE92BBC70E9BE
          E80D359CD45337565650EE1044107A0384D252F0763BE48E36087F5D8F35175B
          C5629081B0F70A8083EF61788717A513264045A19888C7D19F0CDCD596BFDA1B
          3215F5AABC507AB89C63F514DBD83C8F60651514618A84E5269C7C7B8B983059
          6BDB7558D0E300BE5F8C0D1A1DE6DC7597A88058E8D157420A39F1888191C9A9
          1CBF863728EB9D3E620B75B4BA15468A81D4BA0ACD3684BC1E28DBDA117CE32B
          6CB4B68BE1FB1B920B8894E33D0AE0E8FB486DE9404D6626540989D23D02C11F
          2E847B6C26B44989628816874C26233C11307225DC1E197F604F3BE7F7934EA4
          D5A041104C7510DC6E70DB8E61DBB7C56880C4FD6212F7A5757ADA03F22F17E0
          A5042396668D832A86DA8A73E710369B21F7512ECDCAA2149D2E5A57FA6D848B
          78482143C909842D4DBC9CAC1EB4B4A12635012383E48523D5C85F9B0F33BD73
          9066EE87B479BB22624F0360EBC5CF9D8AA7EF1F87B73333105D49F5256B82A8
          2E143C5E38470E47F4D8B197BC200981E3F7ED0717F081FBBE187BD61E42F38C
          31F0514D143A6F11F34E19C92112763218BAFA833D3D88134898918999F7DD81
          67423CD461CA9BA4883D3906B1C35370F7AC5922E5C5C1AEA74E83B75A20A394
          E05DB80E5B9C5E94D0A31F2125515F447196BC02D7B2586F0C460C2210A82600
          3500301298C4D993F02A95445C6A6A64925CB4BE507084EA12B2FE9E62EC5C5F
          20FE28C24A867248546165032B5BAED943F716804B6BB352C4D82F1A51CBE6E2
          604C1CD2264D220E1009D8C100EB35CACB29DA3483B3D9E17A753DB679FC6296
          6507C85674B31FE84D20583E0FBF1990804FC7DF092D6B72D80804201CA7C8EE
          F382CB3B8EDCBC13A8A5DB5F939CC175FEB2D317002E8DE8C7EFC2ECE919583A
          713C625892ABA890AC6F77C0F1DA066CF705C548F33DBA7124D99700D8BE889B
          3E0A0FCCCAC27B5999E85F5F2F7A01B945F87AF769B0E37BC6FD6EFD3CDB9700
          D8600D534CD6604CBD73089EAE6B81D7DC0A5F75139CA1308ED1B383906A9CEE
          37F57D38D837A9E60475F7B835A22CA30C8B3E2C4905BBBBD8CD18ECBB54AA42
          1B01C0E23B8BF7DD3EE0BA59007A6CFC07B2DE827C89082C520000000049454E
          44AE426082}
      end
      object vgLic2: TcxVerticalGrid
        Left = 55
        Top = 95
        Width = 466
        Height = 96
        Styles.Background = cxStyle19
        Styles.Content = cxStyle2
        Styles.Selection = cxStyle10
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = True
        OptionsView.CellAutoHeight = True
        OptionsView.PaintStyle = psDelphi
        OptionsView.RowHeaderWidth = 153
        OptionsView.ShowEmptyRowImage = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.GoToNextCellOnTab = True
        OptionsData.CancelOnExit = False
        ParentFont = False
        TabOrder = 0
        object vgLic2HD: TcxEditorRow
          Height = 30
          Properties.Caption = '1. C'#243'digo do Equipamento'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditProperties.Alignment.Horz = taLeftJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.AutoSelect = False
          Properties.EditProperties.ReadOnly = True
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = ''
        end
        object vgLic2Codigo: TcxEditorRow
          Height = 30
          Properties.Caption = '2. C'#243'digo de Registro'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.DisplayFormat = '00000'
          Properties.EditProperties.ImmediatePost = True
          Properties.EditProperties.MaxValue = 99999.000000000000000000
          Properties.DataBinding.ValueType = 'String'
          Properties.Options.ShowEditButtons = eisbNever
          Properties.Value = ''
          Styles.Header = cxStyle11
        end
        object vgLic2Numero: TcxEditorRow
          Height = 30
          Properties.Caption = '3. Chave de Libera'#231#227'o'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.CharCase = ecUpperCase
          Properties.EditProperties.IgnoreMaskBlank = True
          Properties.EditProperties.EditMask = 'AAAA\-AAAA\-AAAA\-AAAA\-AAAA;1; '
          Properties.EditProperties.MaxLength = 0
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = ''
          Styles.Header = cxStyle11
        end
      end
      object PngBitBtn1: TPngBitBtn
        Left = 55
        Top = 206
        Width = 268
        Height = 57
        Caption = '&Obter a chave de libera'#231#227'o via Internet'
        TabOrder = 1
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9
          870000002B744558744372656174696F6E2054696D65004D6920313720417567
          20323030352031313A34353A3131202B303130303ECCAB370000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          000011894944415478DAC55A097414759EFEAABBABFA3E92CE7D100402881144
          F19A515414DDC1631D65F01A7D3ABBA00E8E8EBAEADB79A3E373C641DFECF3D8
          5D51BCC65141979145012F8207013109110281447291903BE9743A7D56D7B9BF
          7F7507028480A2B3C5FB51DD5DD555DFF7FF7DBFAB3A1C7E806DD98676979294
          7EAA68FA799AA69EAAA87A81AAC0A9C82A24598E27C564B79848EC0B8782DBEB
          2BCB2B9B36AF18A2AFA964FAC9DE9BFBFE5FD5B995FBC44BA221653141BC2A2A
          49CE036195EB4FA8082635C4640D8AAA81D334D8750D1E4E4596AEEA66598EC5
          C4C4A781DE8E373F7BE1962FE842F134997F1C81F73A1317C9C3F29FA231F5A7
          BBFB92DCEE01155D711334CD646051A140D515C8AA0E990888B44F121995F659
          9051CAC92886AC2745B1B277FFEEA7AB56DEFB599A88F6A31258DD15F45A93AE
          FF88C4A45FED0C7E62AA68BC0892A643E087E0F3AF062F342391988CE1E17988
          45A7118D3801271911F8A4C288A4F620B390C6662089124E528707BB57D57FFA
          C29F02AD15ED741B09DF415A274C60F3A0581A0AF26B3B133B4EDB1ABE1B9C79
          0072FC124402776352E95D308187AE5B68E565221547283215CDCDCF2321EB06
          099111489BA490620CD358A0E04C2E0E2E3258D7B47DF57D3D35EF6EA7DBC54E
          94C40911280F4A6726872C1FD745DECDD91D7F0C0E8B13829907CF65213E7827
          720B971301079D6982CE64A34B446210F5F57FC560CC83705241220D3E41C0D9
          6B951190992906993222ED15A3BD6D35ABEEEDAA59B5912E163E1112C725F041
          4FF23425CC7FBE37F67A4E6372191CBC17BCC50A8760851CFA25E4A19B503C6D
          294C260E268A0195EEA9A9129108A1A17E398209814CC69048C0E514F838ED99
          94F434788388A2600A570FFF70766FF396FFBA67B069238B8BE1E3911897C01B
          0D433EABECA96A4DAE9FDAA0FE1B9C0C3CCF1BE0EDA65C487D8F8297A7C2EDFB
          069EDC95E0741B81D7A1E80974B6DF87A1482E42A2845052455F5431F68C445C
          D18904075526B933A3F7306F0397B31433F6BF03F380B66FDF278FFE3A39D45A
          7D3C398D4B60D51E65557F7CDF4DDBD5EBE0145CB4F23CACBC137AE021F0D25C
          7804120EAFC166B6C199BD0E826B17110044D18B9EF6BB1191121822F904130A
          0231153D3119512945C0E47A1543C17F8296C8261232A96F1F90770372C4F350
          D8FC04C29DB56B5B3E7EF87182410728DABF2B81B7F78A57C6C2FAFA0A750167
          B70E51A6B11A045C560F926D6FC32BD8E1B5EAF49E230226584C44CEBF1EB0B6
          404C3AD07BE05F1016E34440A53850304024BA234486A41493AD70E52D84A8D7
          A1AF859422DA8904DD74C2E940E06A5CA8DC896087AE7555AF7834D4B8E12D3A
          D28D63D48A3109546CD2CDB542B8AE557BEDD441EB4BB4FA1E4A912608828D80
          6752619A01AEE78FC8B02970DB4CB0F3944A39AA012633386725244B1311B801
          C3490983E9D567047A223249894E73FE9D4870307B9EA473C82BFBD712090F50
          3287AA8115D3432FC01735A3BF4DD9D3BAEECE07A93C7C4DB022274CE0D9CD83
          0B15595A5D29CCE37C5601361B8758E83A38AC16141555C36DF5C1DCF720DCEA
          A9F0DA748A0D0E740814C794543884259DB42F93E669E509FC605C433F11E88B
          48E88C907C6C9BE0CABF039D3DB742B5BD8570603ED4AE6700DF9340F032B8B3
          5EC4C56E1FF67DF580DEBBFDB9A7C2ADE5AF13ACFD6379614C02CF7C1EFDAC59
          59312FE07C113E9B1352E23CF4B63E0F2F79BAA4701B264E7F0342E42A38867F
          019F5D835BE0C09B010BC78A15E53F924D885E0409F8A04824E22AFA2988FBE2
          32BA221403721282F7BFD1179C0767C1B508B63D052DB880946E35E2007C2DAE
          C8F02358BB0C1D7B8737F77EF9D03282B56D2C2F1C45E0890DDD8556CDDEB6D5
          FE338BD33E0CAF8343EBBE55B068C5F090DEB36D2E949EB10C2E53318481DB89
          2079801130A5BA00895A8798A49134083C0167E973807980118849E8A67D4C4E
          65A1B8225141DC0A79782E7D9152AA40F1409988C5C3D9AE0C640CCFC79EAF16
          25FB362DF99D2A0657D3E5BB8ECC484711786465C3EDAA23F4D73AEFF5C8B47A
          C1C967A1BD6539056B126E4AA1990E2B725C12FC2E116E732691D2613713010B
          BBB26EF43F716AE4224422E5051501468280B32C3410630454E31C464493296E
          F88DD0AD9F00B675A960262FCEB0F93091CFC2BEF2BFA0ABFAD9E56267C5AB74
          640F52671C9BC0436F34BEDCEF5DB7B8D7FD1C05A913C9E835E8ED7A045E6710
          D9FE7AE4653722D313834D3E03A6E03FC32550E2E15592105B18EA4029452688
          044B97CC0BCC032C9053041483545C518D621693AC947E1723C9974391D2D094
          944D16DC9868173050F967B4D5D4AC0DEF798511D88A54853E368107DF68DED6
          EC5D767ECC5D0E9FD549416A868D2422083C2C5481056A235CD60CA32ED8900F
          933813EAE0055455B3C0510CD04C60B40C31021FA6550EB1F69A6522F2048B01
          D666C7D31E90749268F139188E3BA8938DA7C0A7494CD4CB30C1DB0171EF7DD8
          576DA91CAE7EEC153AB281AC7F5C02F7BFDAD2BECBBF64029C4D149C76786C54
          A40481C05B0C6395D8CE3BA880B9C99C947DAC30297E041A7E4F69286910486A
          2332222F18F3816A48279264ABAFA5ABB16AD42F48360A5ECA0EF99751F0EE39
          E88189EDE5289C7103B8FDB7A2AEAAB47578EB3D2FD29177C93AC723C0DDFBCA
          FEA1EACC455EDEDE4DFAB6C369B512118164C2C33C42C2A8C8762A600ED82C36
          98392B3A763D4F1E90A92BA095250DC7E93F26A3503A238525D646A49AB9B8B1
          A788A118E0B846E82C787DFF9902DF7D17E05D81C95DEB903DF901F07D9761D7
          B6D981F096252FD0D1BF91B58D0EE4A3082C7DA179A832FB06AFC5DE4552B193
          C60583808388F06633CC14AD662A58667ACD9B05CA3E56F28286E65D2F516F63
          A7F8A39E9F0D3014C491B4175856323A5175840405BB2CC0537439E25CD321FD
          B32CDF500E4C998F699DEF20C37E805A1611B53505A1C896C52BE8288B839671
          09FCEBB30DFD35B97764C1D902179F928F41803C60635E309B4719AD20985764
          7CBBF365029D4312528D4CC4A630069A759D6C1A1347B5D34627AAD075279522
          2A922714A466B14416753EFF0B4BE95C4CEE7C0F196689622C89DABA7067FCEB
          FB569E1081DB9EAEDDBD27F7D1B298BB820838C858F79922C0F63626239389BA
          061D7D7D0B9197F721118862C7376FD134964F388800C5806AC4824695594F4D
          62A348A4DA6792E2E44946336AAC3CB3C84CA0E965384D114CB04790E9AB42A2
          671AF6EEEAAE4BEEFC3DE5588C54E46312C08D7FFC7A6DBBFFEFD776FA97C363
          711D046F27E076E605DA5BC9046AE02439038A9C0997EB5B1CE8BA19BA2640A3
          18A0F54D0F5CB427128A4E92619398CE0619CAFDBA0A4EB5A0D7BC0CE1782205
          9E79A06F1195AA7B90CDC79193FF16FCF9EFA1BFEADFD152DD5F2EEF5BFE259D
          C1BCD03E6E16BAFAE1F57F10FDF2E33B8AAF83D7E28583262FBB6032C05BCDA4
          77920ECB4C990E3755E96C56BA6894A4CB70121B65A0512AD53436D4EBC660AF
          1B648812036F0C3BB4A7D36304BCA96F10B5070229F0CCF6BE474D5D0E26E67E
          025FF173C82205ECFDF069F4D5AE7A47EBF98CD500EAFAD0332E814B17BF7471
          66F19CCFDFE7BEE67C258FC1654B2019BE89F4AF223F67238D91AC123B3023AF
          0CE74EBE92E027287924E9FE32134F7A2F8D7A2F19B2627ED13446849A391240
          6B4F273EAFE9424D6D29A5DF20C15A0C444BE1CE7E13F945AFC3C751BB2E4D47
          C5BAA5BAB4F381D774B18F8D996C4A0B8E4B00F9339DD7DFF17C43959A59DC65
          AB43CEF45F22D054419AF663E6AC0BA861B3A2C457847326CD4059F105042F31
          0E78321AF20D4F10F01102CC86A331ACAFFC0CD5EF6F22AD512B6EDF02643D85
          224F3F817723C36242B8E126ECA99ED6A2EEFCCDA7846C15D93764E2F804683D
          2EFFED07CB1276FFC35B443F1C332E40A26D03DD341B5913FE4069348259797E
          5C7EA60553F3E6181E1801CBE4A4A457FD20215D3634AF6BBA111F2344A879C5
          6B9BD6A27ED32B480AA40CFFFFC0AB59906B71C06312E0A70C58FDC113186E58
          B35AEBF990F540EF90B5E288674763B6D3932F7E68FAA4337E5E5325F99CE162
          9A27220B29C551C748E992737F859F9DBB0657CC2E4549F6A904583CC203E995
          1F796D1038249F11222C93ADAAD888BA2F6F47D8F167F01418C556373C1C4FAB
          6F41A2F51A547D716144FF76C91AA8221507302F0C1E89F5280277ED99FDA0AE
          261F946356BFA65B04494F1A1A56552B815029AB58A09B0671C5AC4528C8283E
          42FFCAD12488C0C1D51FE50513C7E1A39AEDD8B5BFD3F81E2811B063543E8CBD
          2C092CFC9330258692E5A6A795D5DADB69FD8FEF813B369FF1A43F33EF91D979
          97C9AAA050B3AC73860458109296D98343F63E2FA328AD77E5D804D2F2192D9D
          913DDBE2A28840249C22C690A9AA91E075CDF090BEA5B111BB3B3AA1BEA2FF45
          AF01A528A39D4E8C4B60D14733EECF2F2C7CE6D2A9376BBCC62B16BBC02B9CC8
          E946266137500DA0EA61A09551AB3E8A04111E4BFFA34960E4334680F60C904C
          A5FCDDCA4AD477771BE918BFC3720C610D1DAA42EA19EAB1095CBB66FA2D19C5
          DEB717CEBA0751390093C6EB99F61C2E6609A50928E9B4A81C61A3C1A7DFB3EC
          730CF023D968F467668A8BFE50182B2BBFC6502C4A059BAE98D062B89F9A380D
          6F10BCDD38E211CB510416FC6DF23CDB447ED315D36FE4723D05882A43D41AC4
          91C79780B39B1023191A39FD2099C3498C066FACFEA8C03D0CFCA8CF5891638D
          614DF37E7CBC7B87D1D1CA146F629C162080BD781C1FB3A445D678FC2C74161C
          97FCBAE43153117E5B5630DBFA9353E6524F13A34E320C07E742916B2A06CD9D
          04531A055C3DDC0B7AEAF3C3408E4582C983CC0C2BD66EAF424377BB814E5214
          442314FCFD68C60A9AC202D8451FB31838FE4CCCEA00596EFE02E7CF27DCECB9
          2F23DF377541D995D43638689A0A23A9C731C53A0BBC93C7003A0EC6C461DE30
          56FF68B047921068D5832109EF52418B26E386DE230919D190A4D3BA7F8EB769
          78918D55FF222D9FD871D3687AA3111D59428E7956C9BDDE5F39CBCC0BCF3FE5
          5CD39C49650609E60D0F0DF4A7BACF41B7A5912A41D8E8790E81570F811E4BF3
          746686251B5B1BEAB1B9713B5853CE64130826100FC909ACC307A83466DF5AA4
          1EA7B00216C518CF48C77B36CA3CE1249B98BDD071B5F76AE137F9793979D79C
          7111CDC7BA4144D61298E598079BDB8A03A84B83544769FB48125A6A00A22E76
          75F5C7E808F51A37623342773705ED80DA464ADF42532F7578604FE358EBD09D
          0EDC311FF01EEFF13A3B2E90E5F0A798CEC95AE2586299C8CDBFA2EC5CAEACA8
          90B214494A11E137156256E65CBD83DFCD45D5E0C1A27438011539D662B47705
          B066D77A635E605DF450584467774447A35E81B7681D6434D1C75F91ED45AAF2
          2AC70378221B6B5D3C6493DCB7098BB80BF5BBA615177AAE997D265D8086159A
          4A5445D167FB2E85DBED448BBE83338A52BAAAF29C8042CB746CA8FD14349BD0
          529A8C3C76A03B8C405F22898D2499AF8CDF0276A525D39296CC717F33FB2EBF
          91B173AD64059699A6B9961BB9BB8502FEEC5FCC398B9B949505914824E52469
          3B5F3F2F7F3ED7817A0C2A9D28E0A74089DAB06AC79B1816A34448379E4A34B6
          0411EB913A2950BF40AFB1D2AC48B19F97BAC693CCC91018D95880FB88CA74D3
          ADB8559B85DBCE9A5262BB6AE6E9501499262F85F60AE6645F8A0919A5F8B265
          13BE682D37861E8DEE1608C551FF6D40D79AF46D584D2B9D34464426993AB2C0
          F124F3431018F99E9DAC18E7E2722CC05257BE75DA2D3F391B3924A14452A2D9
          37817945376079D5335461054A911A9ADA82686F1B96B099F2CC56928C7E5032
          CD483DB8FD717F661D63E3C9FCF46F16AEC71D988485734F9F629E5B3609F184
          88E9DEF3B0B6E13DE37163CD9E1E0C75883DB4EA9B4824EC97FA11C9B007556C
          48F95EBFDA9F2C01B68DA4DB125C8C6B703E96E614BA0B88092678A6EAEB6ACB
          B9EA9DBDBAD2A256532D6545A30D87243380231ED6FE7F1018B90E4BB7D92820
          515D8525C8C5FCB9A79D868A6FF66AB4D6EF9364C22490DD69F02C5532C97CEF
          3F31F8A1098C6C07D32D2EC1224CC595F808D5D471B094C8E4C27E753C809390
          CC8F4D60E49A46BA253B8D2C1FA98751F5483D593E29C9FC23088C6C2CDDB2D8
          60D98A356127F55729C7DAFE0F14D3CAC7DB4F6BC10000000049454E44AE4260
          82}
      end
      object lbCab: TcxLabel
        Left = 54
        Top = -4
        Caption = '&Chave de Libera'#231#227'o'
        ParentFont = False
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.TextColor = clBlack
        Style.TransparentBorder = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
      end
      object cxLabel1: TcxLabel
        Left = 54
        Top = 11
        AutoSize = False
        Caption = 
          'Digite o c'#243'digo da loja e a chave de libera'#231#227'o. Essa chave liber' +
          'a o Cyber Manager para ser usado nesse computador. '#13#10#13#10'Caso esse' +
          ' computador tenha acesso a internet, n'#227'o '#233' preciso digitar a cha' +
          've j'#225' que voc'#234' pode obt'#234'-la de forma autom'#225'tica clicando no bot'#227 +
          'o "Obter a chave de libera'#231#227'o via Internet".'
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.WordWrap = True
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
        Height = 78
        Width = 488
      end
      object cxLabel12: TcxLabel
        Left = 373
        Top = 206
        AutoSize = False
        Caption = 
          'Suporte T'#233'cnico:'#13#10#13#10'Tel  (48)  3338-1171'#13#10'Msn: suporte@cybermgr.' +
          'com'
        ParentFont = False
        Properties.WordWrap = True
        Style.BorderStyle = ebsFlat
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsUnderline]
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.TextColor = clBlack
        Style.TextStyle = []
        Style.TransparentBorder = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
        Height = 57
        Width = 148
      end
    end
    object tsAlteraLic3: TcxTabSheet
      BorderWidth = 10
      Caption = 'Transferir Licen'#231'a'
      ImageIndex = 10
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object edSenhaLj: TcxTextEdit
        Left = 0
        Top = 171
        ParentFont = False
        Properties.EchoMode = eemPassword
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Width = 177
      end
      object lbSenha: TcxLabel
        Left = 0
        Top = 153
        Caption = 'Senha da Loja: '
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object lbTransf: TcxLabel
        Left = 0
        Top = 113
        Align = alTop
        AutoSize = False
        Caption = 
          'Para concluir a transfer'#234'ncia digite a senha da loja e clique em' +
          ' avan'#231'ar:'
        ParentFont = False
        Properties.Alignment.Vert = taVCenter
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
        Height = 40
        Width = 594
      end
      object rgOutroHD: TcxRadioGroup
        Left = 0
        Top = 30
        Align = alTop
        Caption = ' O que voc'#234' deseja fazer ? '
        ItemIndex = 1
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = '&1. Usar o Cyber Manager em Modo Demonstra'#231#227'o nessa m'#225'quina'
            Value = True
          end
          item
            Caption = '&2. Transferir minha licen'#231'a de uso para essa m'#225'quina'
          end>
        Properties.WordWrap = True
        Style.BorderStyle = ebs3D
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.LookAndFeel.NativeStyle = True
        Style.Shadow = False
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 3
        Height = 83
        Width = 594
      end
      object cxLabel9: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        AutoSize = False
        Caption = 'Sua licen'#231'a de uso est'#225' habilitada para outro computador'
        ParentFont = False
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
        Height = 30
        Width = 594
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 358
    Width = 614
    Height = 59
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnVoltar: TcxButton
      Left = 8
      Top = 8
      Width = 89
      Height = 25
      Caption = '<< &Voltar'
      TabOrder = 0
      OnClick = btnVoltarClick
      Colors.Normal = 13828095
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
    end
    object btnAvancar: TcxButton
      Left = 166
      Top = 8
      Width = 137
      Height = 25
      Caption = '&Avan'#231'ar'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnAvancarClick
      Colors.Normal = 9823162
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
    end
    object btnFechar: TcxButton
      Left = 376
      Top = 8
      Width = 73
      Height = 25
      Caption = '&Fechar'
      TabOrder = 2
      OnClick = btnFecharClick
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
    end
  end
  object panErro: TPanel
    Left = 0
    Top = 417
    Width = 614
    Height = 18
    Align = alBottom
    BevelOuter = bvNone
    Color = clBlack
    TabOrder = 6
    object lbErro: TcxLabel
      Left = 0
      Top = 0
      Align = alTop
      Caption = 'Mensagem de Erro'
      ParentColor = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.WordWrap = True
      Style.Color = clBlack
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWhite
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    Style = bmsOffice11
    SunkenBorder = True
    UseSystemFont = True
    Left = 400
    Top = 378
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'Registrar'
      Category = 0
      Hint = 'Registrar'
      Visible = ivAlways
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Caption = 'Fechar'
      Category = 0
      Hint = 'Fechar'
      Visible = ivAlways
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 434
    Top = 378
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clDefault
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clOlive
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clDefault
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12713983
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6579300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8559005
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clDefault
    end
  end
  object mwClient: TkbmMWSimpleClient
    Transport = TCPIP
    Left = 336
    Top = 378
  end
  object TCPIP: TkbmMWTCPIPIndyClientTransport
    Active = False
    Port = 3000
    Host = 'joaoborges.dyndns.org'
    StreamFormat = 'STANDARD'
    VerifyTransfer = False
    TransportStateOptions = []
    MaxRetries = 0
    MaxRetriesAlternative = 0
    RequestTimeout = 30
    MinClientPort = 0
    MaxClientPort = 0
    ConnectTimeout = 60
    StringConversion = mwscFixed
    Left = 240
    Top = 378
  end
  object CP: TkbmMWClientConnectionPool
    Transport = TCPIP
    Left = 304
    Top = 378
  end
  object mwSession: TkbmMWPooledSession
    ConnectionPool = CP
    AutoSessionName = False
    SessionName = 'Session'
    Left = 368
    Top = 378
  end
  object dsReg: TDataSource
    DataSet = mtReg
    Left = 176
    Top = 378
  end
  object mtReg: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Senha'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CadastroEm'
        DataType = ftDateTime
      end
      item
        Name = 'CadastroPor'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'AtualizadoEm'
        DataType = ftDateTime
      end
      item
        Name = 'AtualizadoPor'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Loja'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'RazaoSocial'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Pais'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Cidade'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'Endereco'
        DataType = ftMemo
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Bairro'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SerieHD'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NumMaq'
        DataType = ftWord
      end
      item
        Name = 'CNPJ'
        DataType = ftString
        Size = 19
      end
      item
        Name = 'IE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Telefones'
        DataType = ftMemo
      end
      item
        Name = 'EmailReg'
        DataType = ftMemo
      end
      item
        Name = 'FormaPagto'
        DataType = ftMemo
      end
      item
        Name = 'LicMaq'
        DataType = ftWord
      end
      item
        Name = 'LicTipo'
        DataType = ftWord
      end
      item
        Name = 'LicVenc'
        DataType = ftDate
      end
      item
        Name = 'ManInicio'
        DataType = ftDate
      end
      item
        Name = 'ManVenc'
        DataType = ftDate
      end
      item
        Name = 'Proprietarios'
        DataType = ftMemo
      end
      item
        Name = 'Gerente'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TipoLoja'
        DataType = ftWord
      end
      item
        Name = 'EmailTec'
        DataType = ftMemo
      end>
    IndexDefs = <>
    SortOptions = []
    Persistent = True
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
    DefaultFormat = MTBSF
    AllDataFormat = MTBSF
    Left = 208
    Top = 378
    object mtRegCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object mtRegSenha: TStringField
      FieldName = 'Senha'
      Size = 30
    end
    object mtRegCadastroEm: TDateTimeField
      FieldName = 'CadastroEm'
    end
    object mtRegCadastroPor: TStringField
      FieldName = 'CadastroPor'
      Size = 30
    end
    object mtRegAtualizadoEm: TDateTimeField
      FieldName = 'AtualizadoEm'
    end
    object mtRegAtualizadoPor: TStringField
      FieldName = 'AtualizadoPor'
      Size = 30
    end
    object mtRegLoja: TStringField
      FieldName = 'Loja'
      Size = 50
    end
    object mtRegRazaoSocial: TStringField
      FieldName = 'RazaoSocial'
      Size = 50
    end
    object mtRegPais: TStringField
      FieldName = 'Pais'
      Size = 50
    end
    object mtRegCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object mtRegUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object mtRegEndereco: TMemoField
      FieldName = 'Endereco'
      BlobType = ftMemo
    end
    object mtRegCEP: TStringField
      FieldName = 'CEP'
      Size = 50
    end
    object mtRegBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object mtRegSerieHD: TStringField
      FieldName = 'SerieHD'
      Size = 60
    end
    object mtRegNumMaq: TWordField
      FieldName = 'NumMaq'
    end
    object mtRegCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 19
    end
    object mtRegIE: TStringField
      FieldName = 'IE'
      Size = 15
    end
    object mtRegObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object mtRegTelefones: TMemoField
      FieldName = 'Telefones'
      BlobType = ftMemo
    end
    object mtRegEmailReg: TMemoField
      FieldName = 'EmailReg'
      BlobType = ftMemo
    end
    object mtRegFormaPagto: TMemoField
      FieldName = 'FormaPagto'
      BlobType = ftMemo
    end
    object mtRegLicMaq: TWordField
      FieldName = 'LicMaq'
    end
    object mtRegLicTipo: TWordField
      FieldName = 'LicTipo'
    end
    object mtRegLicVenc: TDateField
      FieldName = 'LicVenc'
    end
    object mtRegManInicio: TDateField
      FieldName = 'ManInicio'
    end
    object mtRegManVenc: TDateField
      FieldName = 'ManVenc'
    end
    object mtRegProprietarios: TMemoField
      FieldName = 'Proprietarios'
      BlobType = ftMemo
    end
    object mtRegGerente: TStringField
      FieldName = 'Gerente'
      Size = 50
    end
    object mtRegTipoLoja: TWordField
      FieldName = 'TipoLoja'
    end
    object mtRegEmailTec: TMemoField
      FieldName = 'EmailTec'
      BlobType = ftMemo
    end
  end
  object MTBSF: TkbmBinaryStreamFormat
    Version = '3.00'
    sfUsingIndex = [sfSaveUsingIndex]
    sfData = [sfSaveData, sfLoadData]
    sfCalculated = []
    sfLookup = []
    sfNonVisible = [sfSaveNonVisible, sfLoadNonVisible]
    sfBlobs = [sfSaveBlobs, sfLoadBlobs]
    sfDef = [sfSaveDef, sfLoadDef]
    sfIndexDef = [sfSaveIndexDef, sfLoadIndexDef]
    sfFiltered = [sfSaveFiltered]
    sfIgnoreRange = [sfSaveIgnoreRange]
    sfIgnoreMasterDetail = [sfSaveIgnoreMasterDetail]
    sfDeltas = []
    sfDontFilterDeltas = []
    sfAppend = []
    sfFieldKind = [sfSaveFieldKind]
    sfFromStart = [sfLoadFromStart]
    sfDataTypeHeader = [sfSaveDataTypeHeader, sfLoadDataTypeHeader]
    BufferSize = 16384
    Left = 272
    Top = 378
  end
end
