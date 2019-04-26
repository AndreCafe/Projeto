inherited fbFornecedores: TfbFornecedores
  Caption = 'fbFornecedores'
  ExplicitWidth = 676
  ExplicitHeight = 378
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TParentedPanel
    inherited dxBarDockControl1: TdxBarDockControl
      Height = 44
      ExplicitHeight = 44
    end
    object panMostrar: TPanel
      Left = 0
      Top = 44
      Width = 668
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitTop = 32
      object panBusca: TLMDSimplePanel
        Left = 0
        Top = 0
        Width = 668
        Height = 36
        Align = alClient
        Bevel.BorderSides = [fsTop]
        Bevel.Mode = bmStandard
        Bevel.StandardStyle = lsNone
        TabOrder = 0
        object lbBusca: TcxLabel
          Left = 7
          Top = 7
          Caption = 'Busca por Nome'
        end
        object edBusca: TcxMaskEdit
          Left = 97
          Top = 7
          Properties.MaskKind = emkRegExpr
          Properties.MaxLength = 0
          Properties.OnChange = edBuscaPropertiesChange
          Style.BorderStyle = ebsFlat
          Style.Color = clWhite
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clWhite
          Style.TextStyle = [fsBold]
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.BorderStyle = ebsFlat
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleFocused.TextColor = clBlack
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 1
          OnKeyUp = edBuscaKeyUp
          Width = 280
        end
        object btnAchar: TcxButton
          Left = 381
          Top = 4
          Width = 37
          Height = 27
          Cursor = crHandPoint
          TabOrder = 2
          OnClick = btnAcharClick
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          OptionsImage.Glyph.Data = {
            36090000424D3609000000000000360000002800000018000000180000000100
            2000000000000009000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000010000
            0009000000120000001200000009000000010000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000003000000130000
            0036000000550000005400000036000000140000000300000000000000000000
            0000000000010000000100000001000000000000000000000000000000000000
            00000000000000000000000000000000000000000002000000150A0A0A5C1818
            19A2131313A70505059A000000870000004A0000001200000001000000020000
            000D0000001D000000240000001D0000000C0000000200000000000000000000
            000000000000000000000000000000000002000000131818186D555556F7927D
            70FF978478FF4B4F50F80A0A0AA3000000830000003000000009000000140000
            0042000000750000008800000073000000400000001200000001000000000000
            0000000000000000000000000002000000130F0F0F655C5F5FF5CCA17EFFEBB5
            88FFE7B285FFD9AB8BFF464749F20202029C000000580000002A111212683B3C
            3DD8525558FB2D2F30D6070707A0000000850000003A0000000A000000000000
            00000000000000000003000000140C0C0C61484949F194877FFFFFD5A0FFFFD4
            A6FFFFD3A5FFFFCC98FFA28D7CFF0F0F0FA6000000881111117F5B5A5BF5BB94
            7AFFD5A17DFFBE9F8BFF484C4EF40505059E0000006700000018000000000000
            000000000003000000170C0C0C64424242EE818182FFA6968DFFFFE1BCFFFFE3
            C7FFFFE1C2FFFFDBB2FFD7B391FF212324CB101010A5535658F6B69A80FFFFCD
            98FFFCCA99FFF7C390FFBEA48DFF1A1C1DBD0000008000000021000000000000
            0004000000180F0F0F6F414141F4868686FF9A9B9CFFA5A0A1FFEDCEB8FFFFF9
            EBFFFFEFE0FFFFE6C6FFC6AB8FFF3C3F41FF4F4F4FFF8D9093FFE1BB99FFFFDE
            B9FFFFDDBBFFFFD8AFFFFBCD9DFF3B3E41E70000008100000021000000030000
            001A11111176434343F7565656FFA4A4A4FFB2B3B3FFC4C6C7FFA9948FFFE5D5
            D0FFFDEFE4FFFFE6C9FF726B64FF4E4F51FFA0A0A0FFA7A8AAFFCBB1A1FFFFF0
            DBFFFFEEDEFFFFE4C9FFFFDAADFF3E4245E900000065000000170000000F1313
            137B3D3D3DFA777777FF4E4E4EFFB1B1B1FFD0D0D0FFE4E5E5FFD1D2D3FF9284
            83FF9B857FFF776C69FF4C4C4DFF6B6B6BFFB9B9B9FFC7C7C8FFB5ACAAFFE3CC
            C4FFFFFDF8FFFFF2DBFFD1B59AFF2A2B2CB500000035000000091515156A3737
            37FDD6D6D6FFB1B1B1FF8F8F8FFF616161FFD4D4D4FFFFFFFFFFFFFFFFFF9797
            97FF5B5C5DFF757677FF646464FF585858FFD2D2D2FFE2E2E2FFE7E9E9FFA499
            97FFB39A92FFB0968BFF5C5959E90B0B0B460000000D00000001363636D84E4E
            4EFFA9A9A9FF959595FFC8C8C8FFB6B6B6FF6B6B6BFF898989FF565656FF4343
            43FF565656FF5B5B5BFF4A4A4AFF9E9E9EFFF5F5F5FFFFFFFFFFFFFFFFFFD5D6
            D6FF585A5AF638393A960909092A0000000700000001000000003F3F3FE04F4F
            4FFFB4B4B4FFCDCDCDFFC9C9C9FFC1C1C1FFBDBDBDFFA2A2A2FF888888FF7373
            73FF5F5F5FFF4A4A4AFF434343FF5C5C5CFF7D7D7DFF7F7F7FFF5A5A5AFC1717
            17A70606063200000009000000010000000000000000000000002B2B2B8E5858
            58FF616161FFACACACFFC4C4C4FFB9B9B9FFB0B0B0FFAAAAAAFFA3A3A3FF9E9E
            9EFF9F9F9FFFA1A1A1FFA2A2A2FFA0A0A0FF696969FF272727CA0A0A0A4B0000
            000C000000020000000000000000000000000000000000000000030303083A3A
            3A9D626262F44F4F4FDE595959D67C7C7CFD878787FF909090FF979797FF9F9F
            9FFFA0A0A0FFA1A1A1FF888888FF404040E91414147400000013000000040000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000200000001000000010A0A0A1619191947262626753D3D3DCB4C4C
            4CFF4F4F4FFF3B3B3BD31F1F1F8F050505220000000700000001000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000020202041818
            1842181818400000000900000003000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          SpeedButtonOptions.GroupIndex = 1
          SpeedButtonOptions.CanBeFocused = False
          SpeedButtonOptions.AllowAllUp = True
          SpeedButtonOptions.Flat = True
        end
      end
    end
    object Grid: TcxGrid
      Left = 0
      Top = 80
      Width = 668
      Height = 271
      Align = alClient
      TabOrder = 2
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      ExplicitTop = 68
      ExplicitHeight = 283
      object TVprod: TcxGridDBTableView
        OnDblClick = cmEditarFornecedorClick
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        Navigator.Visible = True
        DataController.DataSource = dsTab
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.KeyFieldNames = 'ID'
        DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '0.00'
            Kind = skSum
          end
          item
            Format = '0.00'
            Kind = skSum
          end>
        DataController.Summary.SummaryGroups = <
          item
            Links = <>
            SummaryItems.Separator = ', '
            SummaryItems = <
              item
                Kind = skCount
              end>
          end>
        Filtering.ColumnPopup.MaxDropDownItemCount = 12
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        object TVprodID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
        end
        object TVprodNome: TcxGridDBColumn
          DataBinding.FieldName = 'Nome'
        end
        object TVprodEndereco: TcxGridDBColumn
          DataBinding.FieldName = 'Endereco'
        end
        object TVprodBairro: TcxGridDBColumn
          DataBinding.FieldName = 'Bairro'
        end
        object TVprodCidade: TcxGridDBColumn
          DataBinding.FieldName = 'Cidade'
        end
        object TVprodUF: TcxGridDBColumn
          DataBinding.FieldName = 'UF'
        end
        object TVprodCEP: TcxGridDBColumn
          DataBinding.FieldName = 'CEP'
        end
        object TVprodObs: TcxGridDBColumn
          DataBinding.FieldName = 'Obs'
        end
        object TVprodCpf: TcxGridDBColumn
          Caption = 'CNPJ'
          DataBinding.FieldName = 'Cpf'
        end
        object TVprodRg: TcxGridDBColumn
          Caption = 'IE'
          DataBinding.FieldName = 'Rg'
        end
        object TVprodTelefone: TcxGridDBColumn
          DataBinding.FieldName = 'Telefone'
        end
        object TVprodEmail: TcxGridDBColumn
          DataBinding.FieldName = 'Email'
        end
        object TVprodCelular: TcxGridDBColumn
          DataBinding.FieldName = 'Celular'
        end
        object TVprodIncluidoEm: TcxGridDBColumn
          DataBinding.FieldName = 'IncluidoEm'
        end
        object TVprodAlteradoEm: TcxGridDBColumn
          DataBinding.FieldName = 'AlteradoEm'
        end
        object TVprodIncluidoPor: TcxGridDBColumn
          DataBinding.FieldName = 'IncluidoPor'
        end
        object TVprodAlteradoPor: TcxGridDBColumn
          DataBinding.FieldName = 'AlteradoPor'
        end
      end
      object GL: TcxGridLevel
        GridView = TVprod
      end
    end
  end
  inherited BarMgr: TdxBarManager
    Left = 48
    Top = 152
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmNovoFornecedor'
        end
        item
          Visible = True
          ItemName = 'cmEditarFornecedor'
        end
        item
          Visible = True
          ItemName = 'cmApagarFornecedor'
        end>
    end
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    object cmNovoFornecedor: TdxBarLargeButton
      Caption = '&Novo'
      Category = 0
      Hint = 'Novo'
      Visible = ivAlways
      LargeImageIndex = 37
      OnClick = cmNovoFornecedorClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      SyncImageIndex = False
      ImageIndex = 0
    end
    object cmEditarFornecedor: TdxBarLargeButton
      Caption = '&Editar'
      Category = 0
      Hint = 'Editar'
      Visible = ivAlways
      LargeImageIndex = 38
      OnClick = cmEditarFornecedorClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmApagarFornecedor: TdxBarLargeButton
      Caption = '&Apagar'
      Category = 0
      Hint = 'Apagar'
      Visible = ivAlways
      LargeImageIndex = 40
      OnClick = cmApagarFornecedorClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Top = 153
  end
  object Tab: TnxTable
    Database = Dados.db
    Timeout = 10000
    Filter = 'fornecedor = true'
    Filtered = True
    TableName = 'Cliente'
    IndexName = 'IFornecedorNome'
    Left = 72
    Top = 88
    object TabID: TAutoIncField
      FieldName = 'ID'
    end
    object TabNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object TabEndereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object TabBairro: TStringField
      FieldName = 'Bairro'
    end
    object TabCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object TabUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object TabCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object TabSexo: TStringField
      FieldName = 'Sexo'
      Size = 1
    end
    object TabObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TabCpf: TStringField
      FieldName = 'Cpf'
      Size = 14
    end
    object TabRg: TStringField
      FieldName = 'Rg'
      Size = 14
    end
    object TabTelefone: TStringField
      FieldName = 'Telefone'
      Size = 15
    end
    object TabEmail: TnxMemoField
      FieldName = 'Email'
      BlobType = ftMemo
    end
    object TabMinutos: TFloatField
      FieldName = 'Minutos'
    end
    object TabPassaportes: TFloatField
      FieldName = 'Passaportes'
    end
    object TabMinutosUsados: TFloatField
      FieldName = 'MinutosUsados'
    end
    object TabMinutosIniciais: TFloatField
      FieldName = 'MinutosIniciais'
    end
    object TabIsento: TBooleanField
      FieldName = 'Isento'
    end
    object TabUsername: TStringField
      FieldName = 'Username'
      Size = 40
    end
    object TabPai: TStringField
      FieldName = 'Pai'
      Size = 40
    end
    object TabMae: TStringField
      FieldName = 'Mae'
      Size = 40
    end
    object TabSenha: TStringField
      FieldName = 'Senha'
    end
    object TabUltVisita: TDateTimeField
      FieldName = 'UltVisita'
    end
    object TabDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object TabEscola: TStringField
      FieldName = 'Escola'
      Size = 40
    end
    object TabEscolaHI: TDateTimeField
      FieldName = 'EscolaHI'
    end
    object TabEscolaHF: TDateTimeField
      FieldName = 'EscolaHF'
    end
    object TabNickName: TStringField
      FieldName = 'NickName'
      Size = 30
    end
    object TabDataNasc: TDateTimeField
      FieldName = 'DataNasc'
    end
    object TabCelular: TStringField
      FieldName = 'Celular'
      Size = 15
    end
    object TabTemDebito: TBooleanField
      FieldName = 'TemDebito'
    end
    object TabLimiteDebito: TCurrencyField
      FieldName = 'LimiteDebito'
    end
    object TabFoto: TGraphicField
      FieldName = 'Foto'
      BlobType = ftGraphic
    end
    object TabIncluidoEm: TDateTimeField
      FieldName = 'IncluidoEm'
    end
    object TabAlteradoEm: TDateTimeField
      FieldName = 'AlteradoEm'
    end
    object TabIncluidoPor: TStringField
      FieldName = 'IncluidoPor'
      Size = 10
    end
    object TabAlteradoPor: TStringField
      FieldName = 'AlteradoPor'
      Size = 10
    end
    object TabTitEleitor: TStringField
      FieldName = 'TitEleitor'
      Size = 13
    end
    object TabFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
    object TabFidTotal: TFloatField
      FieldName = 'FidTotal'
    end
    object TabFidResg: TFloatField
      FieldName = 'FidResg'
    end
    object TabAniversario: TStringField
      FieldName = 'Aniversario'
      Size = 4
    end
    object TabCotaImpEspecial: TBooleanField
      FieldName = 'CotaImpEspecial'
    end
    object TabCotaImpDia: TIntegerField
      FieldName = 'CotaImpDia'
    end
    object TabCotaImpMes: TIntegerField
      FieldName = 'CotaImpMes'
    end
    object TabSemFidelidade: TBooleanField
      FieldName = 'SemFidelidade'
    end
    object TabTemCredito: TBooleanField
      FieldName = 'TemCredito'
    end
    object TabNaoGuardarCredito: TBooleanField
      FieldName = 'NaoGuardarCredito'
    end
    object TabPermiteLoginSemCred: TBooleanField
      FieldName = 'PermiteLoginSemCred'
    end
    object TabCHorario: TIntegerField
      FieldName = 'CHorario'
    end
    object TabOpCHorario: TWordField
      FieldName = 'OpCHorario'
    end
    object TabHP1: TIntegerField
      FieldName = 'HP1'
    end
    object TabHP2: TIntegerField
      FieldName = 'HP2'
    end
    object TabHP3: TIntegerField
      FieldName = 'HP3'
    end
    object TabHP4: TIntegerField
      FieldName = 'HP4'
    end
    object TabHP5: TIntegerField
      FieldName = 'HP5'
    end
    object TabHP6: TIntegerField
      FieldName = 'HP6'
    end
    object TabHP7: TIntegerField
      FieldName = 'HP7'
    end
    object TabInativo: TBooleanField
      FieldName = 'Inativo'
    end
    object TabTipoAcessoPref: TIntegerField
      FieldName = 'TipoAcessoPref'
    end
    object TabFornecedor: TBooleanField
      FieldName = 'Fornecedor'
    end
    object TabValorCred: TCurrencyField
      FieldName = 'ValorCred'
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 104
    Top = 88
  end
end
