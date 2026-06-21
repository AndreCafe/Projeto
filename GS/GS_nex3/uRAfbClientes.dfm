inherited fbClientes: TfbClientes
  Left = 64
  Top = 153
  Caption = 'Clientes'
  ClientHeight = 651
  ClientWidth = 922
  OldCreateOrder = True
  OnCreate = FrmBasePaiCreate
  ExplicitWidth = 930
  ExplicitHeight = 679
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 42
    Width = 922
    Height = 609
    ExplicitTop = 42
    ExplicitWidth = 922
    ExplicitHeight = 609
    object Grid: TcxGrid
      Left = 0
      Top = 165
      Width = 922
      Height = 444
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
      object tvCli: TcxGridDBTableView
        OnDblClick = tvCliDblClick
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.Insert.Visible = False
        NavigatorButtons.Delete.Visible = False
        NavigatorButtons.Edit.Visible = False
        NavigatorButtons.Post.Visible = False
        NavigatorButtons.Cancel.Visible = False
        NavigatorButtons.Refresh.Visible = False
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.Filter.TranslateLike = True
        DataController.KeyFieldNames = 'Codigo'
        DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <
          item
            Format = '0 itens'
            Kind = skCount
            FieldName = 'Codigo'
            Column = tvCliCodigo
          end
          item
            Format = '0'
            Kind = skSum
            Position = spFooter
            FieldName = 'LicMaq'
            Column = tvCliLicMaq
          end>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0'
            Kind = skCount
            FieldName = 'Codigo'
            Column = tvCliCodigo
          end
          item
            Format = '0'
            Kind = skSum
            FieldName = 'LicMaq'
            Column = tvCliLicMaq
          end
          item
            Format = '0'
            Kind = skSum
            FieldName = 'NumMaq'
            Column = tvCliNumMaq
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.IncSearch = True
        OptionsBehavior.IncSearchItem = tvCliLoja
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.Navigator = True
        OptionsView.Footer = True
        Preview.Column = tvCliTelefones
        Preview.MaxLineCount = 0
        Styles.StyleSheet = FrmPri.GridTableViewStyleSheetDevExpress
        OnColumnPosChanged = tvCliColumnPosChanged
        object tvCliCodigo: TcxGridDBColumn
          DataBinding.FieldName = 'Codigo'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 79
        end
        object tvCliLoja: TcxGridDBColumn
          DataBinding.FieldName = 'Loja'
          HeaderAlignmentVert = vaCenter
          Width = 201
        end
        object tvCliCadastroEm: TcxGridDBColumn
          Caption = 'Cadastro Em'
          DataBinding.FieldName = 'CadastroEm'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.ImmediatePost = True
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 127
        end
        object tvCliUReq: TcxGridDBColumn
          Caption = 'Ultimo Contato'
          DataBinding.FieldName = 'UObtemLic'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Width = 123
        end
        object tvCliLicMaq: TcxGridDBColumn
          Caption = 'Licen'#231'as'
          DataBinding.FieldName = 'LicMaq'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          Width = 87
        end
        object tvCliLicVenc: TcxGridDBColumn
          Caption = 'Vencimento'
          DataBinding.FieldName = 'LicVenc'
          Width = 88
        end
        object tvCliLicTipo: TcxGridDBColumn
          Caption = 'Tipo Licen'#231'a'
          DataBinding.FieldName = 'LicTipo'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Vert = taVCenter
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items = <
            item
              Description = 'Tempor'#225'ria'
              Value = 1
            end
            item
              Description = 'Definitiva'
              Value = 2
            end
            item
              Description = 'Teste Gratuito'
              Value = 3
            end
            item
              Description = 'Prospect'
              Value = 4
            end>
          Width = 106
        end
        object tvCliDBColumn2: TcxGridDBColumn
          Caption = 'Vers'#227'o'
          DataBinding.FieldName = 'UVersao'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 89
        end
        object tvCliStatus: TcxGridDBColumn
          Caption = 'Status'
          DataBinding.FieldName = 'DescrStatus'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.ListColumns = <>
          OnCustomDrawCell = tvCliStatusCustomDrawCell
          Width = 134
        end
        object tvCliTelefones: TcxGridDBColumn
          DataBinding.FieldName = 'Telefones'
          PropertiesClassName = 'TcxMemoProperties'
          Width = 140
        end
        object tvCliNumMaq: TcxGridDBColumn
          Caption = 'M'#225'quinas'
          DataBinding.FieldName = 'NumMaq'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          Width = 93
        end
        object tvCliTipoLoja: TcxGridDBColumn
          Caption = 'Tipo Loja'
          DataBinding.FieldName = 'TipoLoja'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Alignment.Vert = taVCenter
          Properties.Items = <
            item
              Description = 'Cyber Caf'#233
              Value = 0
            end
            item
              Description = 'Lan House'
              Value = 1
            end
            item
              Description = 'Ambos'
              Value = 2
            end>
          Width = 89
        end
        object tvCliUF: TcxGridDBColumn
          DataBinding.FieldName = 'UF'
          Width = 46
        end
        object tvCliCidade: TcxGridDBColumn
          DataBinding.FieldName = 'Cidade'
        end
        object tvCliSenha: TcxGridDBColumn
          DataBinding.FieldName = 'Senha'
          Width = 112
        end
        object tvCliProprietarios: TcxGridDBColumn
          DataBinding.FieldName = 'Proprietarios'
          Width = 94
        end
        object tvCliContatarEm: TcxGridDBColumn
          Caption = 'Contatar em'
          DataBinding.FieldName = 'ContatarEm'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 94
        end
        object tvCliCadastroPor: TcxGridDBColumn
          DataBinding.FieldName = 'Cadastro Por'
          Width = 97
        end
        object tvCliAtualizadoEm: TcxGridDBColumn
          Caption = 'Atualizado Em'
          DataBinding.FieldName = 'AtualizadoEm'
        end
        object tvCliAtualizadoPor: TcxGridDBColumn
          Caption = 'Atualizado Por'
          DataBinding.FieldName = 'AtualizadoPor'
        end
        object tvCliRazaoSocial: TcxGridDBColumn
          Caption = 'Raz'#227'o Social'
          DataBinding.FieldName = 'RazaoSocial'
        end
        object tvCliPais: TcxGridDBColumn
          Caption = 'Pa'#237's'
          DataBinding.FieldName = 'Pais'
          Width = 138
        end
        object tvCliEndereco: TcxGridDBColumn
          Caption = 'Endere'#231'o'
          DataBinding.FieldName = 'Endereco'
          Width = 192
        end
        object tvCliCEP: TcxGridDBColumn
          DataBinding.FieldName = 'CEP'
          Width = 64
        end
        object tvCliBairro: TcxGridDBColumn
          DataBinding.FieldName = 'Bairro'
          Width = 122
        end
        object tvCliSerieHD: TcxGridDBColumn
          Caption = 'Num. S'#233'rie'
          DataBinding.FieldName = 'SerieHD'
          Width = 169
        end
        object tvCliCNPJ: TcxGridDBColumn
          DataBinding.FieldName = 'CNPJ'
        end
        object tvCliIE: TcxGridDBColumn
          DataBinding.FieldName = 'IE'
        end
        object tvCliObs: TcxGridDBColumn
          DataBinding.FieldName = 'Obs'
          Width = 85
        end
        object tvCliEmailReg: TcxGridDBColumn
          Caption = 'E-mail Registro'
          DataBinding.FieldName = 'EmailReg'
          Width = 109
        end
        object tvCliFormaPagto: TcxGridDBColumn
          Caption = 'Negocia'#231#227'o'
          DataBinding.FieldName = 'FormaPagto'
          Width = 126
        end
        object tvCliManInicio: TcxGridDBColumn
          DataBinding.FieldName = 'ManInicio'
          Width = 85
        end
        object tvCliManVenc: TcxGridDBColumn
          DataBinding.FieldName = 'ManVenc'
          Width = 87
        end
        object tvCliEmailTec: TcxGridDBColumn
          Caption = 'E-mail T'#233'cnico'
          DataBinding.FieldName = 'EmailTec'
          Width = 122
        end
        object tvCliGerente: TcxGridDBColumn
          DataBinding.FieldName = 'Gerente'
          Width = 179
        end
        object tvCliFonteStatus: TcxGridDBColumn
          DataBinding.FieldName = 'FonteStatus'
          Visible = False
          MinWidth = 64
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Options.Sorting = False
        end
        object tvCliFundoStatus: TcxGridDBColumn
          DataBinding.FieldName = 'FundoStatus'
          Visible = False
          MinWidth = 64
          Options.Editing = False
          Options.Filtering = False
          Options.Focusing = False
          Options.IncSearch = False
          Options.Grouping = False
          Options.HorzSizing = False
          Options.Moving = False
          Options.Sorting = False
        end
      end
      object glCli: TcxGridLevel
        GridView = tvCli
      end
    end
    object LMDSimplePanel1: TLMDSimplePanel
      Left = 0
      Top = 5
      Width = 922
      Height = 155
      UseDockManager = False
      Align = alTop
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      TabOrder = 1
      object LMDSimplePanel2: TLMDSimplePanel
        Left = 0
        Top = 0
        Width = 72
        Height = 155
        UseDockManager = False
        Align = alLeft
        Bevel.BorderSides = [fsRight]
        Bevel.Mode = bmEdge
        TabOrder = 0
        object btnEncontrar: TPngSpeedButton
          Left = 2
          Top = 2
          Width = 68
          Height = 53
          Align = alTop
          Caption = '&Encontrar'
          Flat = True
          Layout = blGlyphTop
          Spacing = 0
          OnClick = btnEncontrarClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
            F80000002D744558744372656174696F6E2054696D65006A65752E20352064E9
            632E20323030322031323A32313A3130202B30313030603BD286000000077449
            4D45000000000000000973942E000000097048597300000AF000000AF00142AC
            3498000004454944415478DAED546B4C9B65183D6D69E9455B4A8B4087ED0A94
            E188355822E1B21250278680192112652626841FCA626630D31013E5C72461D1
            2CD94CC86604D90F939119244288612C0C46C1D9C555B6768361050AD2D25684
            F2B5F482CFF7A54BC81C2331D91FE39B9C7CED7B39E7B9BCEFE1E1310FDE7F5F
            A0AAAA2A213939D9CCE3F1623D3D3D5334B54588FE1B013E619BFDD1DCDC9CE2
            F3F9F243A190716B6BEB759A2A100804080683D37EBF7FD8ED769F713A9DAEB8
            D8F623052A2A2AC41919195F8AC5E2FA8D8D0D7752525250A5521D904AA57C89
            4482C4C444D01A28030ECBCBCB181919712F2D2D9D9A9E9EEE228E3542645781
            EAEAEA2F6432D9FB2C199503696969080402601806143D280B84C3618E9CCFE7
            73DF582C86A9A9294C4E4E5EA78CDA289B51E2DA24C4FE21505959E9A428754D
            4D4D484F4F472412614BC17D5D2E172852783C1EACAEAE725F5690DDA7D7EB39
            C1D9D9D9A8C562E9A5204E2D2C2CD88933B8B36CBCB2B2328742A138D0D0D0C0
            91984C2650FD31303000AD560BABD50AAFD70B2A1B8442212862D4D5D5A1BEBE
            1E54468EC46EBF8DF6F6CF18614242F74DDBAF67ADD61BF7EEF787979F9FFFAE
            48243AD3D5D5C59F9999C1DCDC1C6C361B5A5A5A909797C71174767662E2DA38
            341A0DBC3E3FA857686D6D05F58B7A24C4777D9711E629108A4471FBFA0F6E8B
            65FC2D87C361A1A31BEC2D52E4E4E41CA3DA7F52545424B4DBED686C6C844EA7
            434A8A1A3E8ABEAF7F14119E04EEE5592C3A6F414B6B35353550C8E59877F9A0
            D96F44417E061602C095311B2EB4BF3338363EF129714FB30202426A7676F651
            AA6B9B52A91473871572A855C998BCE142797929D49A34B8183ECE9F6C817771
            16AF1DA985549C0846928DE2B20208A8BD1E6AF322E1EBF75E760F0C0D7F4CBC
            FDF7DF4102419D9999594F38495757F614452F14CA906AAC84292F19013AB8C4
            0053D72CE83F7B02F224155E2A3743945787FD595AF0A9AD1B61C01788A0F7C3
            C37F0C0D5F39479CDD3B1F1A9B899A1A5B9D9B9BDB515A52A294A518F05CD51B
            90D1130C53847F52DB7E7338F0D547B53F7BBCFEBB2F969B8F18CADF96A4995E
            052F1A05130A23FABB05E7DA9A46EECCDC1B23BE6F1EB40A564449F5AF361A9F
            3DFD7C71A55C5FD30C1145B74D580F5109462FE07CC707DFAEACB8E7295BE650
            E9A113FB5E382A153CA9813CB68289BECF038343C317E93AB3B6F2FDC3BC88B5
            0CA5C160A8359B4B4EEF331F934AD53A44A31188427FE16AF7F1F5C1A11F2F46
            A3D161DA673B78F019B3F6E98CE34A853CCB393F3F73D376EBA7CDCD4DD64606
            08BFEC66769C486161E19B997A7D47AAA1582CA6EB78D73A18BA3C72B5776D6D
            CD49EB970877083282916022A8081E82951527F81FE5A6AC888AEEFE2B4FC864
            879960504826B74EA97B699EADEF244B10374C562489904808C5E739EBD8CBAE
            05F18359045DDC02E6097371929DB6BD936BFB6193BB0D768F982089FF671EF4
            9BBD0E3FD6F1BFC09EE36F7076B7AE4F32B2880000000049454E44AE426082}
          ExplicitLeft = 32
          ExplicitWidth = 66
        end
        object btnLimpar: TPngSpeedButton
          Left = 2
          Top = 55
          Width = 68
          Height = 53
          Align = alTop
          Caption = '&Limpar'
          Flat = True
          Layout = blGlyphTop
          Spacing = 0
          Visible = False
          OnClick = btnLimparClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
            F80000002B744558744372656174696F6E2054696D6500446F203134204E6F76
            20323030322032333A33313A3434202B3031303084501C480000000774494D45
            000000000000000973942E000000097048597300000B1100000B11017F645F91
            000004E64944415478DAB5557B4C536714FFDDD2025334CE072A2CB034481C6C
            4E8D51233A65980C0C539922D9D43F26CEB8319D4A9C21D3C564D1986C719521
            C3882C6844CD1407086CEA5083146869A142CBFB55E48DE5D127A5EDDDB9BDB7
            469D5B5CA65F7292F67CDFF9FDBE73BEF33B97C12B5ECC4B8C65FF3FC186A270
            58ADDB2196AC10F94C9EE5B2598C300ED5C03A9C0FD5813B74C246E6FCEF041B
            CAA6831D3E392B68EEB635CB43BD4282FCDC28FD26A0F1E104EAAA1A58537D55
            293AF292D195A71588D8172348A80803860BB6AC5F298D79D70FAD43806E00E8
            35022662B13B002B41D9CC760C16E5B4B39AB49D18562928D2CC91FC3BC14E65
            B8843595246F5DE31F360B286E0646E86E2E173041DB5602275C98C8ECE41B37
            D9307855761BEA9443B4ADE332E10992B44B31D4FE085762F5F4CFE14E2FA9C2
            5F64B2280E7F1A191C3A03286CA20D0261451445E86D2D7A8C8D508D24BEF099
            FD06586F6FD829138352C15AF277A7C0507D89701E32D855716AEDC2803D4D5D
            FD26FDCD331F4195C9A567C20EF98D2F362E8E899AE783E216BA2195C34B0C3C
            D076B1AA9BF96AD465EB60EEB561D21C1782D685BCBE22E1FD696F853196112B
            FACF7E7E156DD9A98453C54C4BAEE8CE3FB02CA0A489C5D1AC5F15B8B0351989
            7F84AF5C383FE3E00701B8D7C1974144E0F715CD6CED95EFAE417B618C82A960
            A0BC304236196FEFDBE01FBB3F719234081D674FD4409922237F1183C45B7773
            BF5EBB9A7B38755B3F9B9BFDD339BF05B11F9E4E5C3EBB7B14E8A32A88A82CDA
            F601DC4AFFE6376832E924EE9329B94622237A88219914208ACA2A92C627BCD9
            71F5F280A3F8E31FC99FC3605BEE89139FC51C7232BE78CD17387E5DC5C62C9A
            C744854E45DD000F6EA1E2A6659CD5A060773558F61E05DE25EB06FFD69EE58D
            88F4EF833725EEEDBB53343A5E10779A7C590CB69C5FFF49DCDABCC5C173DD75
            66E8D9FD7C804113FFA8122A4D4E49ADA3F964F425187BEA28A880AC55B8F9D3
            9A8A48DD3A2772D30543F5FD5E7B61C279F2653258F5957FF8C62FBBF6458678
            1B2CD4822C6F1CB88BC8FA866D3893764A8EAA0C35E62ED12034AA1579C72AA9
            413831B99EA2582E5B3133625D99419EA772951F2C26CF2F5C9B8ABD8F68CB32
            36872D359805020A73B0BC14753DA368D00F41E2258288D29B70B2A8A9D7953B
            73766D87ADE7211D197F4CB03A2D748A7451A3B1F2622E74E974095C66DCA9ED
            97CB8EC52DD93BD55BE2160C61C0C989C9251082FFCDF9582A59B1BC1975A9F1
            07D0A7B9C6F5FAE34CDEFB3988993CB393AD4995A1B7B4963C85BCD0F694246C
            5BB3E0F2AAE0196E753A05B009A1545C265CB95AA9A5943ABDABA9A2F00E7E3F
            447A617368AB4110271079510A1FB106B7771C87C3AC268F9C278893052E89D9
            DC99B42CD08BD4EECEC0337B4937286DE88642A3ED3655E556A2FEFA28CC039C
            0E6AC86E91F578061BA2F34320767E8B1B71A5F4AF9C23F7CC22F1941F3AD4D9
            EB82DF191DE7092A3BC6F0676397ADADEC7639AACFEBD1536DA716EDA3B32D82
            C8B8B132F84C3751011148162C6436E8216070B8F648F47CFFA3761A8F77AB75
            3A5769E603E86E586137734A6D17403BC91E911985C77DF623C3B8F50090A260
            E19EEEC9693A1D4BB7C7A35329457F0377C0735BAEE739F58E720314FC07E5B9
            5FAFE7AD2709B8F4660829927E6110E68C4950EC0B83FE130104608900E6F89B
            905E02C14B5FAF9CE02FBF433D253B253E440000000049454E44AE426082}
          ExplicitLeft = 1
          ExplicitTop = 91
        end
      end
      object Paginas: TcxPageControl
        Left = 77
        Top = 0
        Width = 412
        Height = 155
        ActivePage = cxTabSheet2
        Align = alLeft
        Style = 1
        TabOrder = 1
        OnChange = PaginasChange
        ClientRectBottom = 153
        ClientRectLeft = 2
        ClientRectRight = 410
        ClientRectTop = 22
        object cxTabSheet1: TcxTabSheet
          Caption = '1. Ultimos 15 Clientes'
          ImageIndex = 0
          object edUltimos: TcxSpinEdit
            Left = 147
            Top = 9
            ParentFont = False
            Properties.ImmediatePost = True
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -19
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 0
            Value = 15
            Width = 73
          end
          object cxLabel7: TcxLabel
            Left = 9
            Top = 10
            Caption = 'Mostrar ultimos'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -19
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
          object cxLabel8: TcxLabel
            Left = 226
            Top = 10
            Caption = 'cadastros'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -19
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
        end
        object cxTabSheet2: TcxTabSheet
          BorderWidth = 5
          Caption = '&2. Pesquisar'
          ImageIndex = 1
          object VG: TcxVerticalGrid
            Left = 0
            Top = 0
            Width = 393
            Height = 121
            BorderStyle = cxcbsNone
            Align = alLeft
            LookAndFeel.Kind = lfOffice11
            LookAndFeel.NativeStyle = False
            OptionsView.PaintStyle = psDelphi
            TabOrder = 0
            object vgNomeLoja: TcxEditorRow
              Properties.Caption = 'Nome da Loja'
              Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
              Properties.DataBinding.ValueType = 'String'
              Properties.Value = ''
            end
            object vgCodigo: TcxEditorRow
              Properties.Caption = 'C'#243'digo'
              Properties.EditPropertiesClassName = 'TcxSpinEditProperties'
              Properties.DataBinding.ValueType = 'Integer'
              Properties.Value = 0
            end
            object vgProp: TcxEditorRow
              Properties.Caption = 'Propriet'#225'rio'
              Properties.DataBinding.ValueType = 'String'
              Properties.Value = ''
            end
            object vgCidade: TcxEditorRow
              Properties.Caption = 'Cidade'
              Properties.DataBinding.ValueType = 'String'
              Properties.Value = ''
            end
            object vgEmail: TcxEditorRow
              Properties.Caption = 'E-mail'
              Properties.DataBinding.ValueType = 'String'
              Properties.Value = ''
            end
            object vgNS: TcxEditorRow
              Properties.Caption = 'N'#250'mero S'#233'rie'
              Properties.DataBinding.ValueType = 'String'
              Properties.Value = ''
            end
          end
        end
        object cxTabSheet3: TcxTabSheet
          Caption = '3. Todos Clientes'
          ImageIndex = 2
          object cxLabel1: TcxLabel
            Left = 9
            Top = 10
            Caption = 'Mostrar Todos os Clientes'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clBlack
            Style.Font.Height = -19
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
          end
        end
      end
      object LMDSimplePanel5: TLMDSimplePanel
        Left = 72
        Top = 0
        Width = 5
        Height = 155
        UseDockManager = False
        Align = alLeft
        Bevel.Mode = bmCustom
        TabOrder = 2
      end
    end
    object LMDSimplePanel3: TLMDSimplePanel
      Left = 0
      Top = 0
      Width = 922
      Height = 5
      UseDockManager = False
      Align = alTop
      Bevel.Mode = bmCustom
      TabOrder = 2
    end
    object LMDSimplePanel4: TLMDSimplePanel
      Left = 0
      Top = 160
      Width = 922
      Height = 5
      UseDockManager = False
      Align = alTop
      Bevel.Mode = bmCustom
      TabOrder = 3
    end
  end
  inherited BarMgr: TdxBarManager
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'BarraTabSheet'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmLayout
            Visible = True
          end>
        Name = 'BarraTabSheet'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 192
    Top = 264
    DockControlHeights = (
      0
      0
      42
      0)
    inherited cmNovo: TdxBarLargeButton
      OnClick = cmNovoClick
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      OnClick = cmEditarClick
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      OnClick = cmApagarClick
      ImageIndex = 12
    end
    inherited cmAtualizar: TdxBarLargeButton
      ShowCaption = False
      SyncImageIndex = False
      ImageIndex = 46
    end
    inherited cmLayout: TdxBarLargeButton
      Align = iaRight
      LargeImageIndex = 17
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object cmMostrarTel: TdxBarButton
      Caption = 'Mostrar Telefones'
      Category = 0
      Hint = 'Mostrar Telefones'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = cmMostrarTelClick
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 328
    Top = 241
  end
  inherited CP: TdxComponentPrinter
    Left = 264
    Top = 258
  end
  inherited dlgExp: TSaveDialog
    Left = 392
    Top = 249
  end
  inherited pmLay: TdxBarPopupMenu
    Left = 152
    Top = 266
  end
  inherited pmPeriodo: TdxBarPopupMenu
    Left = 352
    Top = 380
  end
end
