object FrmCliente: TFrmCliente
  Left = 241
  Top = 118
  BorderWidth = 5
  Caption = 'Dados do Cliente'
  ClientHeight = 520
  ClientWidth = 682
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panPri: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 682
    Height = 520
    UseDockManager = False
    Align = alClient
    Bevel.BorderSides = [fsTop]
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    TabOrder = 0
    object LMDSimplePanel1: TLMDSimplePanel
      Left = 0
      Top = 0
      Width = 682
      Height = 37
      UseDockManager = False
      Align = alTop
      Bevel.BorderSides = [fsTop]
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      TabOrder = 0
      object btnCancelar: TPngSpeedButton
        Left = 81
        Top = 0
        Width = 94
        Height = 37
        Align = alLeft
        Caption = '&Cancelar'
        Flat = True
        OnClick = cmCancelarClick
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200802000000FC18ED
          A3000000017352474200AECE1CE9000004744944415478DAAD955B4C5B651CC0
          7BCAE97D6DE94AB7ACD05228A51738BD89204EA39164F1125F34333EF8C083BE
          18F465660A992F73DD90CC2D630B4659240C46A6DD4403C9A2A14837F1321703
          E596D1B55C5B465BDA95F5427AF5EB39DDA12BBDC0EC3F2739E77C39DFEF77BE
          EF7FFEFF032D9E3DC1BFA8231008ABF52F2D7C708C53CC2693C984C205145030
          61BF0FBB999228573FFC4C50565A4007142A8752EF27C588BDA5B5800EC87AF4
          E5B23BC6FFEFA07E7B8E3EACB7BDDD1C78F31D368B09C3705260F875A8B8E304
          62363DBDC3F7887EE124F5EFDFE304C2F7AFBDC76D382C93563318F4A4E0DF3B
          B756566DDCEEF3F5B3FFA4CE9A10236BBB7040EB7686EE3879D102E803151AB3
          44F9C2E146B95C4AA352930F4C4FFC150A856C367BE4C6C01BB787B0D1188100
          2698C4C8839C0EA2E51EFBF316C8E7030F5F112A6784528D46A555ABB8DCFD44
          22715B004EC0E170382337AE1E191DC4E871543325461C591CE49161E6455D3C
          9E78B287AF981529B41A954A59CBE3F160B8687B899800442412753A9D217DDF
          2B861FE38F1711471DAE1D0EFAF993B4B19B801E80C9970F4A574432F0EE2AA4
          268DFE840077B87E196E1AEAA34542B866468C6CE00EDF23E6E9E3E4990940F7
          C3A4F63275AC42A2562B6B14F2122E378D9E2EC01C1B6EF703E368D3B52E2AEA
          C08E5931E26E691585FC9CAE76D29205A39FE12B2189FCD93AAD5C2665B3D93B
          E9190420A2D1E843EF2670BCD8DF8939B0B4DF1748042E5B513090A017C1A7F9
          4A62B5A2A1BE0EA5B3F0ACE6172470B198D7BB69378E6AAF7D5D1C4C34123CED
          185D77082992D6E4A56715E00EABC9A4BDDC71707303A7838B56BE9A24AFDD0D
          3D970073041CEB2CDDA7DC65334E07177F704AE7DF6A6E7CAEFE00AF24373D8F
          00D4D1BE0B5F50962CA97474AFA039913CF8715BB95090B7976415C0A6BBECF6
          56A2DF87D17D44789AC2AA0BBA011D3399C5C8D647F97B7B6601A85236FA17C2
          E93A3E121254BEBB34A9B25BF01A048E503E470601A852C6D84D9CBE4066805A
          8565B56A15C262B10EF45EAAB24CE339B75421E19C8E27056895526726B0C920
          AC24FA59D13365529946ADAC9654516954BB7D2DD2D3854C8E635901C7424EC7
          B6202DA538BD5C51036AB5B252B48FC100DF4CA2F5DAD7BCD7AFD61987F11AB4
          5621B12C8EA4202DA589F77A4C07DFBBB8B2824EA74150F2E71A0E87D71D4E8F
          BE5F69F889802E8280AE23A32321A0A0294D2DA51C742C926DF1873E6464101F
          CCE880EE759DE17CD9B6277AAA63F1378356DF4D8984B239A0F963CDECEBBD38
          DD42A29FDB051D77783C9E955B6335FD97B23920D3A94F78DD5F3D051D0BAC65
          2D1B4765BD9D191DD09FB7473C033DEC71C346387A4588086489FEBE4B7A9AA3
          54FF5DC9A63BCD014DDC1D075B396FBEBF6A5B03D0EA2AB14854BE7B7AAAC332
          3525FAA6A36473031B1C7CBFEDF9C686C45704B6D28F064C82994C269542D913
          1D77F8FCFEE5B9B9439DA7B85ED70A99F173D3D1D75F3D92AB9BEE35E2F17820
          10B45817A6A6675D2E9750500672594801E6D8DADA727B1E0683413A8DC6D9CF
          29B06067FC075507A8A10E2778D80000000049454E44AE426082}
        ExplicitHeight = 38
      end
      object btnHistorico: TPngSpeedButton
        Left = 586
        Top = 0
        Width = 96
        Height = 37
        Align = alRight
        Caption = '&Hist'#243'rico'
        Flat = True
        OnClick = cmHistoricoClick
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D65004D6920313720417567
          20323030352031303A33313A3335202B3031303075E0E4250000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          000009964944415478DAAD570B5093D915FEFE3C4820E1694220844756509405
          44F0C556AC2FA4BAA3D6BAEDD8763BC36E9D76DDA9D5EA56F1B1A3BBADBBCCE8
          3AE3AE8FF5858BA2C2AA28E2732B0202B2A282AC2250155179058D8690049290
          F4DC3FC1D1D6119CE99D39F3FF7FEEBDE7FBCEB9E79C7BC26180B1716381D26E
          7786994C0691561B9AE8E9295D64B3F504188D5DB57A7D7B617DFD8DD33939DB
          1ED1521B8973207DFF3DB85783D6897C7C2C1F58ADBD7F16096D715E5E4E619F
          DD8E670613BF256A980641410AB4B6B6917458CDE6AE5283417FB2A1E17AE1E1
          C3FBDE88CCFF10D8BDBBFE2D9349973754EB9B181D1B846E911CE63E0E4E471F
          843633CC6DCD68B8751FDD662766CE4C81542A457BBB0E8F1EB5903CB076771B
          2E3D7BA63FDED878ABF0D4A923AD03917989C08E1DD7B436ABA56CC68C48B539
          4085677D80DA171009480BBD5B4895C102880D9D78505D81BA3A1DDE7F7F363C
          3DBDD0D7E72471A0A5A505F7EEDD4553D31DABC9642CE9EE7E56D8D878A7E0C2
          85C25792794EC0E974721B375E2C9B991695FC54A181D5F00049C3C360761030
          81F7DA5C4F9315B0D3536A31A3BEE838DA3A2C58B4E80FE8EDB5BA49384917D3
          27C0CD9B35B878F12CEC769AB5F6941A8DDD87B3B3B38E121C3B4BFB4B04BEF9
          A6F237810AE1E1A84909902B84F870CACF306AC23B589B998927046A21212EB0
          F43AE9C9C14684E4FA669CCE3D86196953317A740C91B011984B5F7373338E1E
          CD875219436B85301A9F40AFFFC96930B41DDDBFFFC0DF69490B89F50502E5E7
          26A504A5B6FABD85240DD0DAA9C76FA74CC49CF43F227DD9529809B0A9A11919
          EFA52163EF09A8B5C3E02D026E9DCA21C5BD58BAF403B7F50EF4F4D89099B919
          0E8703F1F1B3306448249E3E7D4C24CCE4955C5CBA747A7D55D5D52C827DC413
          58B2E4883822DC573F654EBCDCEAAB844A46FE11038D0DF7F09777A7E3F77F5B
          09F5D0E1D8B4F843CC4AFF18B3FFB404568A05919036DFA944DEA1026CDDBAE1
          F9B9161595A1AAEA21C46219C54331844227D2D337C34C5634345460FFFE7505
          172F166FA5A5977902DBB717299C0EBB2E717A02E7A952404E9675B350F1002E
          159EC5F582C3BC35CAD87198F7D1C7E8EE82EB3C68F8E86E227BCF016CF8622D
          BCBD65FC6F99995F13781C7D0F414DCD2ECC98F111C2C2A2C1115A5DDD6522BB
          FC447979C5715A7A8A27B06AD5414590CA4F37267514E7A10A8627113090CB39
          B2F0696727B2572FA2347460FE9A2D08080E8195E2414A3B6D44D2A7BD065944
          E00B22E0E7E78BAE2E23D6ADFBD262323D91281489029DEE472C5CB81B02CA24
          0F32E8D0A175CE7DFBBECD6A6F6F2F26E8333C81F1E3C78AE7CE5DD592326DA8
          D2A27EDBE55A16A1342B24329D2D6D1448762842426123702B65814202F41001
          CB8DB33876EC0CA5F0660211E0C68D3A6464AC395D5E7EA1232565A246A50A9C
          1C1E3E46A456C7526A96A1A2E2DC79727F23A93F4652D51F84DCE79F1FCE8B19
          E937DF3F610AEC52319F1ECF23945E1C04D647116E27D7CB88A050E02251B033
          9352D4894F3F5DC92F3D73A608AB5767E454575FB9499FFF56A9541123478E18
          27168BE44D4DCDBA3B77EE9829E5AB68EE0792B6E704962EFD6AA626447D32E9
          9D619C3D2C81B7B27F9285039D004F8245BE8408D868D25E5784BCEF8F63DEBC
          39983E7D2ABFF6BBEFF2B076EDCADD0F1F3631800AB71DA124112452064A729B
          A4F5A534A421FFE4932D59DA8880F96F8F1D0547480CBA290E080F025A25E65C
          C02C1D3DC9728F966A1CC9FD1E5E323915A285502894BC924D9BB6E3B3CF3276
          74751958C1A9243193D00EB00825BFA1F79585884D46478F8D4A4BFB554E44F8
          90C4E1315A28A2926093F9A0C7EA5A202335DE5613EE5DBF88D2D272F20C87F9
          F37F89A4A444FEFCD958B3E61FCECCCCF5DBED767B367DD6B8015FACBCAF2EC5
          EE2155288262A64E9DBB2A7268D45C854222500406C0DFDF9FB639F0B8534781
          D40C1D15A9D0D0304C9B36916EC5607A0F7DAE60F9F2D5C64D9B36ECA3D79D6E
          57F7E1358373158EA70152A94706C709E2E98EBFBE62C58292AEAECED871E326
          A56A34E153FBFA589DB7536E0B09508961C3221118A88488D2253E3E9EACE7A8
          D80828536C58BC78D9FD5DBBB61E21B5BB581062806B993B79B2D9C3E9B45C8E
          8E568FD668E4D0E9EC686CD477DDBC5979A8A2E2440FB9F7AF313123783D0C84
          A3DC64E556229160C48811F4F4701310C160784A29B8AAF6C081AC02DAC04A6D
          D3800472722EFF4EA3511E183346434A84542C84FC6D565FAFA7AAF5D069363F
          E624121B0FCAD7055AA3542AA0D184F21E608484428EBC23A2ABF81105E0FAF2
          FCFCBC33A4FB00C9830109ECD9F3C3E6E1C3C3970405F9903522BADB2524626A
          34C43C91EAEAFBB87EFD367D73D06AC3F86AC72CE6A356E002679E1189C4B87B
          B781CAF0E7E7CE9F3FCB523017AE1BEFF504B66ECDFF675858E82AA5D29727C0
          802512170146462E97F2D65754D4D02D76056A7530A2A363685E42D63BDC1E10
          90E73C505B7B155BB67C995F5656FE2FD29DEFCEF9D70E2E2363737254D4C812
          A5728888013212FD045C24C4FC397B7B7BF1448A8A4A5152528C888828C4C68E
          A139299170920744B872A518DBB67D75B0B6B696112824E91C900089E7BA75DB
          D6060787AD90C9BC053299270F2895BEEC0D265E5E12FEC6CBCB3B84F2F2629E
          506C6C32121327F131505C5C809D3BBFDEDBD4D4748EF43212FAC1106012989A
          3A67C18409D3D2030343A80BF6854C26731F09130FF28407FDE68573E78EA1A3
          C34E4D462C7540466A48D9B128909CFC2EDD03FBA8A9DDF1AD5EAF67597089C4
          3818026CB08AABA46A163379F2AC5F24274F7ECFDF3F30D4DB5B45567BB98393
          05A515274EEC25F091540746D31621D5071BA5ED7EAA88CB70E4C8665B5656D6
          6EAA820769F22A49CF6009F0410D57BD0E22D0B84993D252E3E2127EEDE313E4
          E7EF1F0E7634DDDD6DD4E1FC4484E4E8EC6C804A954401E849ADD66DC4C5A592
          0776D5E5E6E632F7EF25A987BBDE0F9640FF60DEF02609F1F30B189D92F2F399
          5AAD76AEAFAF5622930DA1DEFF1A2223D3C87213DADAAA895407C5C16C3C7972
          0FA74E65E75756FE788DF6E6903463107F4EB8D7FCCE88D0BF0284A954C1E3C7
          8D1B332724247CBACD66E2D4EA143A127F8A7C011FFDEC22BA7DFB843D27677F
          B6D1682CA63DAC103D1E08FC75045E9CA7460A0124DAE8E8E8C90909090BBCBD
          7D62FCFDE3894410813BA82BAEA182555A585252CA6A3FBB07AA492CFF0F022F
          AE63CD442095E2117401A5D1B1A450551C6EB55A4D0D0D8D655555558FA9D329
          832BFDDA06E3FE3721D03F58B7E845A22661375494DB3BECCE6F20B90257FDB7
          0D56E19B12E81F2C3EE470052BEB765893CE9A75C39B80B3F11FCF7CE596E943
          DE1A0000000049454E44AE426082}
        ExplicitLeft = 81
        ExplicitHeight = 38
      end
      object btnSalvar: TPngSpeedButton
        Left = 0
        Top = 0
        Width = 81
        Height = 37
        Align = alLeft
        Caption = '&Salvar'
        Flat = True
        OnClick = cmGravarClick
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000002B744558744372656174696F6E2054696D6500536F203137204E6F76
          20323030322031393A31373A3436202B3031303041C0B5F10000000774494D45
          000000000000000973942E000000097048597300000AF000000AF00142AC3498
          000009864944415478DABD57697053D715FE9E165BF2BEC8B28D586C8F01435C
          A094B28C59C334A560321028A16142032593CCD01048499B615266924E4B4B12
          204002986D1816A7405ADA4C9A86403036668959BC520CB6658C2D5996B02CDB
          922CE92D3DF76AC1063393E98FDEF1997BDFD5F3FDBEFB9D73CF3D4FC0C026E0
          FFD3940180BF2F6D8CDE7DDAF56751AD7AC5E3435261AE84CDD303F088804A10
          F86B8AA2409264C88A085154E899F5126489E6692CD1589224286422CDC98A04
          AD20E1E4BD24FCAD3E1E31725F97DADB7122B166FB1F1F345C77D0A2FE0801E3
          86AAED1DED9DEBD5CD66487E110B0B52B1EFED0948CB180E954A20530FA44F64
          145926A020A8288ABC67160804A817F93BD6D666ECBDD885D20E23D45A05E686
          2E683A2A0E79CA36FF899669210B700209EBABECEEEF6E18D866451958382509
          451B27C0903E8C036A341AB8DDEE080199C099316006C4FAF0B356ABE524586B
          6FBD8F7DE52E7C55DD095DB416D1861CDCBF71D7EE3DB7723DFD7C96CC1154E0
          9D3AC5597A0D825A404012F0FCD404EC7D2BA8006B6AB51A959595E8EBEB2335
          544F385410848832269389F78C9095081495BBF18F73E5D0EBA290F083F9B057
          36C1FEE5B2F7E9F523644DDCC169BFAB955DE5154440C509144E89C39E37C721
          7D48165F9C81363636C2EFF74700B91BFA199B632E30180C118518817D97BA71
          BE0988D208D0261961AFB80BC7D9153B68993D64F72204BAAFDDE08B0414010B
          7E148F3DEBF2611C3282CF3105066B61FF87638049CF48F677C19E3217CAEC06
          4469C1221AF62B77E0B8F0CA4E7AFA94EC6E90C06F6BE5DEEBB720D00B7E59C0
          FC8931D8BD762C578035E657B3D9CC811821B6BBF0AEFBABC0E693929206B860
          5F1905A13D0D5151B4115ADF567E1B8E8BAB77D1B29F0C20E0BE594904C80514
          84F326E8B1E3B551C81C9AC3176304EAEAEAE0F3F906F57D78CC4033333379CF
          9AE541338A2EB950FAD0089D9A8EBE46858E4B4F21E0ADAA2102E00ACC1BA7C3
          B635B94837657102EC1474757545761D5620981BA4883B98E9F5FA603EA0DF2C
          0FCC3850DE8332879136410A1081F6B2DA270918DEAE917DB5B55C01760CE7E6
          6BF1E1AA1C6498B22304986F19707F02E160EB7F1459C0B2316B2C0FECBFDC8B
          4B9D19D0696861AD0AB68B75831308DCB94D8BAB48012230468DADBFCCE23110
          26D0D4D4C449F4977DB063989A9A1A19B3183870D58DF24E239D02769C55B096
          3E4501B1BE9EBB402417CCCE5361CB4B4307B8A0B5B535B2B3C7C1C3CAB07713
          1313233160A518385CE1C1656726B4740CD9316FBF583D3801B9A13E1884E4D2
          D9A304FC6179267741B8316919C8E331C0C6E1386044FB272AA7C38ECF2B9D38
          DDA04780523C236029A9199C80D2DC0876DA0314ACB3738177172522313983AE
          2D85BB865D60843780009BE38117138B2EA11BC5F5C528B594C2265AE9AE000C
          48436EDC348C495909AB231157CC3D683B4F0A940E4240B8DFC8F3804489E899
          0C05CFE5C9F0D3995442FEA59FF81D2A872E5336AB080A268DCDC217CEA3F8C6
          F5190A474FC6D8F41CB8035ED8BC1DB07BBB70D7DA863B2DED986E5C836929EB
          B06BEB05D84A563D4940D5662605C88F342381A5550626F0DDABE80C2B21F999
          8CE40CA8C8A72B679970DEBE09A6D136BC346E1E81B6E3AEAB06168F0D5E0A58
          37F9D34D59D14772B4B576235B998B9F043661EB8682C7086CAC91B5ED2D9172
          24580208FDFA47C6A460DDF4B106B8924F40955A8E15E317A0AAF32ADA7DCD44
          5C053781F7320262006E9F9F2BE18788871605B3D4AB71FECDFD831070B40415
          602CF89FC0C165414D4A28FC99A9C16ECC04BD063F9FA3C1C18E45F868FE1BA8
          7556C0EA6D66BAC04B85899B32A697C07BA96FE96DC796FC0318939087D72A97
          E3D6651BA44FFA3E46378A08FB3F2102D5B2EEA125A840043C58AFCC4869A6F0
          8E22C9B55033F750A5336A781AEAB4FF446C560BF233B271D3F92D553F519443
          64F848720F99978E6C738F05DBC61DC5A2E1CBB8B29F776CC3D203EF0165DD27
          71014C85EBC154FC9B6A39BADB460A28C1628DE3D391A445BE5CA346D6C831F0
          F438D1D3DD0D67672762130D58756D2D96CF29C0BD9E6A985D8D6049245EAB47
          1F29E0A3006AE9B5E0C3F1C7F1FCF0251CBCCD578FC292A9A8BC950034B4D450
          35F0014D7F1521A0EBB541152A13436520FCB450F1122FAC3E235EFEA01EA969
          71888ED7E15785A351D4F12CD6CE5E8CA2EA222C4BDA088FC6836FDC45C8D41B
          F0C06DC3F609C75098B584AF63F33562FEB9C9B869E9045AF3007B83137BC4AD
          84521C24403110EBB6537C8514089160C5E5FE9FD9D1D667C0EA9D16241B62A1
          4BD4E3552270B87D069616CC4493D98B93334E939B808F1AB76057F366144D3A
          85C2ECA57C25BBBF090BCEFD18156D9DC173DC3009E8B9D585BD122B480E0509
          BC5529C7F99C1C3492EA6920CA0AB64D6B823560C4C653014AB354D7C54463C9
          EC2C94F5ACC0D87106FCBBB1045F175C41567C1674513AE8F4D1E05212217BA0
          09852170DA1B645722552994E5DA6ED4E1337C416F1D0C1278A3424E5279B85C
          3CC18562409425BC975F0D9B9C8E2D979210A7A7B28A6ABB8979691836F4102E
          07CEA24369E639E3DC8C0A98E24740512988A12BD9219949F649B84EE02A4A2E
          126D06E67CA08F70AE369DC1357C474827F87E535E2D6DA15786A5256A388130
          09892EA60DA61274E9B2F1E9EDA1888D260254DD6A62F538F232F0ECA95948C9
          89A6E3D683CCD8787C3DE33A8CF1C36097C8E7E72747C065B6A0230DE8180995
          5405F988FB307A514228FFE20472176E9ADC288D3F929A919A6734C61030B864
          EC8AF975EA5928193FC4D63A1362A214AAEF35F0AAB4B8B136133BAB76605BED
          5FA04DA6522EE0C733E9195896B518C71AFE8A2ACBC3475766275DD1160A3EC1
          8C991973C5D2778F1EA4D9E36415618FC7C48E9856E0C97D7D778A297D54E688
          14AE82484CD6A55D40CEB86968F52720214E8F58BA783464CFE525D3CE64BC58
          FC22CE58FF0E81304456CDC878F4E1E5A178705069DF6BA0F9FBC84B1A89C5F1
          AFDFDCF2CE2FBE65FE27AB8F841C595C4AF6CCA9BEA12FBC2F6952A782AE4FD1
          1FC0C6397790621C8668BA6AB554DA6A2921694805853224AB117347E6E058F3
          111CBF570C511F45C11743572AF5DE783AC73A1ABBA0926D28487F419EA2FD69
          D5C79B57D70402BE6B847786958DFDCB1B368E2523AD30956C045914BEEF076B
          3CED7D223261A2FF8FD10EE1FFE70A58E903AC01B570C20D56ABF79099C9CAD8
          3D40D6F7F8E2EC996823394446F5BDC0838D95132964AC8A31714AC1F5BA5922
          24A39C0EF651EA625141E6E337FA5316FB5F3ED3859062712CA6C8B4A17956C7
          B943E60B4548E4F3FCBF8E70FF2A06E4B1550000000049454E44AE426082}
        ExplicitHeight = 39
      end
    end
    object LMDSimplePanel2: TLMDSimplePanel
      Left = 0
      Top = 37
      Width = 682
      Height = 5
      UseDockManager = False
      Align = alTop
      Bevel.BorderSides = [fsTop]
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      TabOrder = 1
    end
    object Paginas: TcxPageControl
      Left = 0
      Top = 42
      Width = 682
      Height = 478
      ActivePage = tsDados
      Align = alClient
      HideTabs = True
      LookAndFeel.NativeStyle = True
      Style = 6
      TabOrder = 2
      ClientRectBottom = 478
      ClientRectRight = 682
      ClientRectTop = 0
      object tsDados: TcxTabSheet
        Caption = '&Dados Cadastrais'
        ImageIndex = 2
        object InspNome: TcxDBVerticalGrid
          Left = 0
          Top = 0
          Width = 682
          Height = 478
          BorderStyle = cxcbsNone
          Align = alClient
          LayoutStyle = lsBandsView
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
          OptionsView.CellTextMaxLineCount = 3
          OptionsView.ShowEditButtons = ecsbAlways
          OptionsView.CategoryExplorerStyle = True
          OptionsView.PaintStyle = psDelphi
          OptionsView.GridLineColor = clBtnShadow
          OptionsView.RowHeaderMinWidth = 30
          OptionsView.RowHeaderWidth = 116
          OptionsView.ValueWidth = 92
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.HeaderSizing = False
          OptionsBehavior.AllowChangeRecord = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          TabOrder = 0
          DataController.DataSource = DS
          object InspCodigo: TcxDBEditorRow
            Options.TabStop = False
            Properties.Caption = '1. C'#243'digo'
            Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
            Properties.EditProperties.ReadOnly = True
            Properties.DataBinding.FieldName = 'Codigo'
          end
          object InspNomeNome: TcxDBEditorRow
            Properties.Caption = '2. Nome'
            Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.MaxLength = 40
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'Nome'
          end
          object InspNomeUsername: TcxDBEditorRow
            Properties.Caption = '3. Username'
            Properties.EditPropertiesClassName = 'TcxTextEditProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.MaxLength = 40
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'Username'
          end
          object vgSenha: TcxDBEditorRow
            Properties.Caption = '4. Senha'
            Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
            Properties.EditProperties.CaseInsensitive = False
            Properties.EditProperties.EchoMode = eemPassword
            Properties.DataBinding.FieldName = 'Senha'
          end
          object vgTipoConta: TcxDBEditorRow
            Properties.Caption = '5. Tipo da Conta'
            Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
            Properties.EditProperties.Columns = 2
            Properties.EditProperties.Items = <
              item
                Caption = 'Cliente Normal'
                Value = False
              end
              item
                Caption = 'Acesso Gr'#225'tis'
                Value = True
              end>
            Properties.DataBinding.FieldName = 'Isento'
          end
          object vgStatusConta: TcxDBEditorRow
            Properties.Caption = '6. Status da Conta'
            Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
            Properties.EditProperties.Columns = 2
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Items = <
              item
                Caption = 'Ativo'
                Value = False
              end
              item
                Caption = 'Inativo'
                Value = True
              end>
            Properties.DataBinding.FieldName = 'Inativo'
          end
          object InspNomeNickName: TcxDBEditorRow
            Properties.Caption = '7. Apelido'
            Properties.EditPropertiesClassName = 'TcxTextEditProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.MaxLength = 30
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'NickName'
          end
          object InspSexo: TcxDBEditorRow
            Properties.Caption = '8. Sexo'
            Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.EditProperties.Items = <
              item
                Description = 'Masculino'
                Value = 'M'
              end
              item
                Description = 'Feminino'
                Value = 'F'
              end>
            Properties.DataBinding.FieldName = 'Sexo'
          end
          object InspNomeTelefone: TcxDBEditorRow
            Properties.Caption = '9.Telefone'
            Properties.EditPropertiesClassName = 'TcxTextEditProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.MaxLength = 15
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'Telefone'
          end
          object InspNomeCelular: TcxDBEditorRow
            Properties.Caption = '10. Celular'
            Properties.EditPropertiesClassName = 'TcxTextEditProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.MaxLength = 15
            Properties.EditProperties.ReadOnly = False
            Properties.DataBinding.FieldName = 'Celular'
          end
          object InspNomeDataNasc: TcxDBEditorRow
            Properties.Caption = '11. Data de Nasc.'
            Properties.EditPropertiesClassName = 'TcxDateEditProperties'
            Properties.EditProperties.Alignment.Horz = taLeftJustify
            Properties.EditProperties.Alignment.Vert = taVCenter
            Properties.EditProperties.DateButtons = [btnClear, btnToday]
            Properties.EditProperties.DateOnError = deToday
            Properties.DataBinding.FieldName = 'DataNasc'
          end
          object InspNomeDBEditorRow12: TcxDBEditorRow
            Properties.Caption = '12. RG'
            Properties.DataBinding.FieldName = 'Rg'
          end
          object InspNomeDBEditorRow13: TcxDBEditorRow
            Properties.Caption = '13. CPF'
            Properties.DataBinding.FieldName = 'Cpf'
          end
          object InspNomeDBEditorRow1: TcxDBEditorRow
            Properties.Caption = '14. Nome do Pai'
            Properties.DataBinding.FieldName = 'Pai'
          end
          object InspNomeDBEditorRow2: TcxDBEditorRow
            Properties.Caption = '15. Nome da M'#227'e'
            Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
            Properties.DataBinding.FieldName = 'Mae'
          end
          object vgLimDebito: TcxDBEditorRow
            Properties.Caption = '16. Limite de D'#233'bito'
            Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DataBinding.FieldName = 'LimiteDebito'
          end
          object InspNomeTA: TcxDBEditorRow
            Properties.Caption = '17. Tipo de Acesso'
            Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.ImmediateUpdateText = True
            Properties.EditProperties.Items = <>
            Properties.DataBinding.FieldName = 'TipoAcessoPref'
          end
          object InspNomeDBEditorRow3: TcxDBEditorRow
            Properties.Caption = '18. Endere'#231'o'
            Properties.DataBinding.FieldName = 'Endereco'
          end
          object InspNomeDBEditorRow5: TcxDBEditorRow
            Properties.Caption = '19. Bairro'
            Properties.DataBinding.FieldName = 'Bairro'
          end
          object InspNomeDBEditorRow6: TcxDBEditorRow
            Properties.Caption = '20. Cidade'
            Properties.DataBinding.FieldName = 'Cidade'
          end
          object InspNomeDBEditorRow7: TcxDBEditorRow
            Properties.Caption = '21. UF'
            Properties.DataBinding.FieldName = 'UF'
          end
          object InspNomeDBEditorRow8: TcxDBEditorRow
            Properties.Caption = '22. CEP'
            Properties.DataBinding.FieldName = 'CEP'
          end
          object vgCategescola: TcxCategoryRow
            Properties.Caption = 'Escola'
            object InspEscola: TcxDBEditorRow
              Properties.Caption = '23. Nome'
              Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
              Properties.DataBinding.FieldName = 'Escola'
            end
            object vgEscolaHI: TcxDBEditorRow
              Properties.Caption = '24. Hora Inicio'
              Properties.EditPropertiesClassName = 'TcxTimeEditProperties'
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.TimeFormat = tfHourMin
              Properties.DataBinding.FieldName = 'EscolaHI'
            end
            object vgEscolaHF: TcxDBEditorRow
              Properties.Caption = '25. Hora Final'
              Properties.EditPropertiesClassName = 'TcxTimeEditProperties'
              Properties.EditProperties.ImmediatePost = True
              Properties.EditProperties.TimeFormat = tfHourMin
              Properties.DataBinding.FieldName = 'EscolaHF'
            end
          end
          object InspNomeObs: TcxDBEditorRow
            Height = 60
            Properties.Caption = '26. Observa'#231#245'es'
            Properties.EditPropertiesClassName = 'TcxMemoProperties'
            Properties.DataBinding.FieldName = 'Obs'
          end
          object InspNomeEmail: TcxDBEditorRow
            Height = 60
            Properties.Caption = '27. E-mail'
            Properties.EditPropertiesClassName = 'TcxMemoProperties'
            Properties.DataBinding.FieldName = 'Email'
          end
          object InspNomeDBEditorRow9: TcxDBEditorRow
            Height = 200
            Properties.Caption = '28. Foto'
            Properties.EditPropertiesClassName = 'TcxImageProperties'
            Properties.EditProperties.Caption = 'Clique c/ bot'#227'o direito p/ selecionar foto'
            Properties.EditProperties.GraphicClassName = 'TJPEGImage'
            Properties.EditProperties.ImmediatePost = True
            Properties.EditProperties.Stretch = True
            Properties.DataBinding.FieldName = 'Foto'
          end
        end
      end
    end
  end
  object tAux: TnxTable
    ActiveRuntime = True
    Database = Dados.db
    Timeout = 10000
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    TableName = 'Contato'
    IndexName = 'IRg'
    Left = 536
    Top = 376
  end
  object BarMgr: TdxBarManager
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
    Images = dmImagens.Imagens
    LargeImages = FrmPri.im32
    PopupMenuLinks = <>
    Style = bmsXP
    SunkenBorder = True
    UseSystemFont = True
    Left = 504
    Top = 376
    DockControlHeights = (
      0
      0
      0
      0)
    object cmGravar: TdxBarLargeButton
      Caption = '&Salvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      OnClick = cmGravarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 41
      SyncImageIndex = False
      ImageIndex = 4
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
    object cmHistorico: TdxBarLargeButton
      Caption = 'Hist'#243'rico'
      Category = 0
      Hint = 'Hist'#243'rico'
      Visible = ivAlways
      OnClick = cmHistoricoClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 48
    end
    object dxBarCombo1: TdxBarCombo
      Caption = 'Tipo da Conta'
      Category = 0
      Hint = 'Tipo da Conta'
      Visible = ivAlways
      Text = 'Cliente Normal'
      ShowCaption = True
      Width = 100
      ItemIndex = -1
    end
    object dxBarCombo2: TdxBarCombo
      Caption = 'Status da Conta'
      Category = 0
      Hint = 'Status da Conta'
      Visible = ivAlways
      ShowCaption = True
      Width = 100
      ItemIndex = -1
    end
  end
  object DS: TDataSource
    DataSet = MT
    OnStateChange = DSStateChange
    Left = 472
    Top = 376
  end
  object FMgr: TFormManager
    BarMgr = BarMgr
    PageControl = Paginas
    Left = 408
    Top = 318
  end
  object MT: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = False
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftAutoInc
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Endereco'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Bairro'
        DataType = ftString
        Size = 20
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
        Name = 'Pai'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Mae'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'EscolaHI'
        DataType = ftDateTime
      end
      item
        Name = 'EscolaHF'
        DataType = ftDateTime
      end
      item
        Name = 'Inativo'
        DataType = ftBoolean
      end
      item
        Name = 'LimiteDebito'
        DataType = ftCurrency
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Nasc'
        DataType = ftDateTime
      end
      item
        Name = 'Sexo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Cpf'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Rg'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Telefone'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'Email'
        DataType = ftMemo
      end
      item
        Name = 'CreditoM'
        DataType = ftInteger
      end
      item
        Name = 'TempoTotal'
        DataType = ftInteger
      end
      item
        Name = 'TempoInicial'
        DataType = ftInteger
      end
      item
        Name = 'Isento'
        DataType = ftBoolean
      end
      item
        Name = 'Username'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Senha'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'UltVisita'
        DataType = ftDateTime
      end
      item
        Name = 'Debito'
        DataType = ftCurrency
      end
      item
        Name = 'Escola'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NickName'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DataNasc'
        DataType = ftDateTime
      end
      item
        Name = 'Celular'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'TemDebito'
        DataType = ftBoolean
      end
      item
        Name = 'TipoAcessoPref'
        DataType = ftInteger
      end
      item
        Name = 'IncluidoEm'
        DataType = ftTimeStamp
      end
      item
        Name = 'AlteradoEm'
        DataType = ftDateTime
      end
      item
        Name = 'IncluidoPor'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'AlteradoPor'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Foto'
        DataType = ftGraphic
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
    AfterInsert = MTAfterInsert
    AfterEdit = MTAfterEdit
    Left = 440
    Top = 374
    object MTCodigo: TAutoIncField
      Alignment = taLeftJustify
      FieldName = 'Codigo'
    end
    object MTNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object MTEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object MTBairro: TStringField
      FieldName = 'Bairro'
    end
    object MTCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object MTUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object MTPai: TStringField
      FieldName = 'Pai'
      Size = 40
    end
    object MTMae: TStringField
      FieldName = 'Mae'
      Size = 40
    end
    object MTEscolaHI: TDateTimeField
      FieldName = 'EscolaHI'
    end
    object MTEscolaHF: TDateTimeField
      FieldName = 'EscolaHF'
    end
    object MTInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object MTLimiteDebito: TCurrencyField
      FieldName = 'LimiteDebito'
    end
    object MTCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object MTNasc: TDateTimeField
      FieldName = 'Nasc'
    end
    object MTSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object MTObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object MTCpf: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object MTRg: TStringField
      FieldName = 'Rg'
      Size = 14
    end
    object MTTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object MTEmail: TMemoField
      FieldName = 'Email'
      BlobType = ftMemo
    end
    object MTCreditoM: TIntegerField
      FieldName = 'CreditoM'
    end
    object MTTempoTotal: TIntegerField
      FieldName = 'TempoTotal'
    end
    object MTTempoInicial: TIntegerField
      FieldName = 'TempoInicial'
    end
    object MTIsento: TBooleanField
      FieldName = 'Isento'
    end
    object MTUsername: TStringField
      FieldName = 'Username'
      Size = 40
    end
    object MTSenha: TStringField
      FieldName = 'Senha'
      Size = 10
    end
    object MTUltVisita: TDateTimeField
      FieldName = 'UltVisita'
    end
    object MTDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object MTEscola: TStringField
      FieldName = 'Escola'
      Size = 40
    end
    object MTNickName: TStringField
      FieldName = 'NickName'
      Size = 30
    end
    object MTDataNasc: TDateTimeField
      FieldName = 'DataNasc'
    end
    object MTCelular: TStringField
      FieldName = 'Celular'
      Size = 15
    end
    object MTTemDebito: TBooleanField
      FieldName = 'TemDebito'
    end
    object MTTipoAcessoPref: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'TipoAcessoPref'
    end
    object MTIncluidoEm: TSQLTimeStampField
      FieldName = 'IncluidoEm'
    end
    object MTAlteradoEm: TDateTimeField
      FieldName = 'AlteradoEm'
    end
    object MTIncluidoPor: TStringField
      FieldName = 'IncluidoPor'
      Size = 10
    end
    object MTAlteradoPor: TStringField
      FieldName = 'AlteradoPor'
      Size = 10
    end
    object MTFoto: TGraphicField
      FieldName = 'Foto'
      BlobType = ftGraphic
    end
  end
  object L: TcxLookAndFeelController
    Left = 576
    Top = 376
  end
end
