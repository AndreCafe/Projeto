object FrmVendaPac: TFrmVendaPac
  Left = 173
  Top = 97
  Width = 377
  Height = 337
  Caption = 'Pacote'
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
  object Panel1: TPanel
    Left = 0
    Top = 26
    Width = 369
    Height = 284
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 4
    object Insp: TdxDBInspector
      Left = 5
      Top = 5
      Width = 359
      Height = 274
      Align = alClient
      DataSource = dsTab
      DefaultFields = False
      TabOrder = 0
      DividerPos = 105
      Flat = True
      Options = [dioAutoWidth, dioBandSizing, dioColumnSizing, dioDynamicColumnSizing, dioEditing, dioEnterThrough, dioNoCancel]
      Data = {
        C10000000800000008000000000000000F000000496E73704E6F6D65436F6E74
        61746F08000000000000000E000000496E73704465736372486F726173080000
        00000000000A000000496E737056616C6F724C08000000000000000C00000049
        6E7370446573636F6E746F08000000000000000E000000496E7370546F74616C
        46696E616C080000000000000007000000496E73704F62730800000000000000
        08000000496E7370526F7737080000000000000009000000496E7370526F7731
        3000000000}
      object InspNomeContato: TdxInspectorLookupRow
        FieldName = 'NomeContato'
      end
      object InspDesconto: TdxInspectorDBCurrencyRow
        FieldName = 'Desconto'
      end
      object InspTotalFinal: TdxInspectorDBRow
        FieldName = 'TotalFinal'
      end
      object InspDescrHoras: TdxInspectorLookupRow
        Caption = 'Pacote'
        FieldName = 'DescrHoras'
      end
      object InspValorL: TdxInspectorLookupRow
        Caption = 'Valor'
        FieldName = 'ValorL'
      end
      object InspRow7: TdxInspectorDBRow
        Caption = 'Usuário'
        ReadOnly = True
        FieldName = 'Usuario'
      end
      object InspObs: TdxInspectorDBMemoRow
        RowHeight = 70
        FieldName = 'Obs'
      end
      object InspRow10: TdxInspectorDBDateRow
        Caption = 'Data'
        ReadOnly = True
        FieldName = 'Inicio'
      end
    end
  end
  object BarMgr: TdxBarManager
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Controles'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 67
        FloatTop = 344
        FloatClientWidth = 69
        FloatClientHeight = 44
        IsMainMenu = True
        ItemLinks = <
          item
            Item = cmGravar
            Visible = True
          end
          item
            Item = cmCancelar
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmNovoCli
            Visible = True
          end>
        MultiLine = True
        Name = 'Controles'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        SizeGrip = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    Style = bmsFlat
    UseSystemFont = True
    Left = 112
    Top = 88
    DockControlHeights = (
      0
      0
      26
      0)
    object cmGravar: TdxBarButton
      Caption = '&Gravar'
      Category = 0
      Hint = 'Gravar'
      Visible = ivAlways
      Glyph.Data = {
        02060000424D0206000000000000360400002800000013000000170000000100
        080000000000CC010000000000000000000000010000000000001C3404002434
        1C00242424001C3C0400243C0C00244404002C5C04003C5C240044543C005C5C
        54005C5C5C00646464006C6C6C0054743C007474740044840400747C74007C7C
        7C0084848400449404006C8C540054AC0400000000008C8C8C008C948C009494
        94009C9C9C00A4A4A400ACACAC00B4B4B4006CD404006CDC040074F404007CFC
        040084FC0C0084FC14007CDC24008CFC1C008CFC240094FC240094EC3C0094FC
        2C009CFC3C0094D45C009CF44C009CFC4400A4FC4C00A4FC5400ACFC6400B4FC
        6C00B4F47400BCF48400BCFC7C00B4C4A400ACCC9400BCCCAC00BCC4B400BCCC
        B400B4E48C00BCE49400BCDCA400C4F49400C4FC8C00C0C0C000000000000000
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
        00000000000000000000000000000000000000000000000000003F3F3F3F3F3F
        191717193F3F3F3F3F3F3F3F3F003F3F3F3F3F1712111112193F3F3F3F3F3F3F
        3F003F3F3F3F19120E0C0C0E123F3F3F3F3F3F3F3F003F3F3F3F120E0C0B0B0C
        11173F3F3F3F3F3F3F003F3F3F17110C0B0A0A0B0E123F3F3F3F3F3F3F003F3F
        3F12140702010B0B0C11173F3F3F3F3F3F003F3F3F181E1E0F03100C0C0E1219
        3F3F3F3F3F003F3F3F2422231F06080C0C0C11173F3F3F3F3F003F3F2B212223
        221305170C0C0E11173F3F3F3F003F3521222323231E06090E0C0C0E12193F3F
        3F003F2B2223272726221304180E0C0C0E123F3F3F003F2926252A2F2F261F06
        08110E0C0E11173F3F0038302D232C39332E23150311110E0C0E11173F003F39
        2E28383F37312A220F0117110E0E0E1219003F3F373F3F3F3F3A30261E060917
        110E0E1117003F3F3F3F3F3F3F3F322E2315030C1712111217003F3F3F3F3F3F
        3F3F37342D2313001819171719003F3F3F3F3F3F3F3F3F3B342E231300193F3F
        3F003F3F3F3F3F3F3F3F3F3F3C3330230F011D3F3F003F3F3F3F3F3F3F3F3F3F
        3F393E31250F0D3F3F003F3F3F3F3F3F3F3F3F3F3F3F383D312320353F003F3F
        3F3F3F3F3F3F3F3F3F3F3F3F3C2A23363F003F3F3F3F3F3F3F3F3F3F3F3F3F3F
        3F3F373F3F00}
      PaintStyle = psCaptionGlyph
      ShortCut = 16455
      OnClick = cmGravarClick
    end
    object cmCancelar: TdxBarButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777778888887
        777770000000777885555558877770000000778555DDDD555877700000007D55
        DD7777555587700000007D5577777855558770000000D55877778555D5587000
        0000D5877778555D7D5870000000D587778555D77D5870000000D58778555D77
        7D5870000000D5878555D7777D5870000000D558555D7777D558700000007D55
        55D77777D587700000007D555877778555877000000077D55588885558777000
        0000777DD555555DD7777000000077777DDDDDD7777770000000777777777777
        777770000000}
      PaintStyle = psCaptionGlyph
      OnClick = cmCancelarClick
    end
    object cmNovoCli: TdxBarButton
      Caption = '&Cadastrar Cliente'
      Category = 0
      Hint = 'Cadastrar Cliente'
      Visible = ivAlways
      Glyph.Data = {
        16060000424D1606000000000000360400002800000018000000140000000100
        080000000000E001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF080707070707070808F6FF
        FFFFFFFFFFFFFFFFFFFFFF08ECDADADADADADBA3A4F707FFFFFFFFFFFFFFFFFF
        FFFFFFF5C8D1D1D2DADAD1D1D1D2A4FFFFFFFFFFFFFFFFFFFFFFFFF5D1D1DADA
        DADAECDADAD291FFFFFFFFFFFFFFFFFFFFFFFF07D1DADAE3DAEB09E2DADAD1FF
        FFFFFFFFFFFFFFFFFFFFFFFFE4DAE3E2E20909E3DADAD9FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFE4DAD293939BE2DAD9AAFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD4900
        0101014A9B6273FFFFFFFFFFFFFFFFFFFFFFFF085B00000A0C0D0D0C5CF7FFFF
        FFFFFFFFFFFFFFFFFFFFFFA400000A15151515150CF7FFFFFFFFA4A4A4FFFFFF
        FFFFFF5200000B16161616160CA5FFFFFFFFA400A4FFFFFFFFFFFF5249000B1F
        1F1F1F1F15A5FFFFFFFFA400A4FFFFFFFFFFFF5B49490A1E2767676716A5FFA4
        A4A4A400A4A4A4A4FFFFFFAD4952490A0C151F1F14F7FFA400000000000000A4
        FFFFFF085252525B5B520A0A5208FFA4A4A4A400A4A4A4A4FFFFFFFF074952A4
        F7F75A49F7FFFFFFFFFFA400A4FFFFFFFFFFFFFFFF075B525B5252F7FFFFFFFF
        FFFFA400A4FFFFFFFFFFFFFFFFFFFF07070708FFFFFFFFFFFFFFA4A4A4FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      PaintStyle = psCaptionGlyph
      OnClick = cmNovoCliClick
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 240
    Top = 98
  end
  object Tab: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = -1
    FieldDefs = <
      item
        Name = 'Contato'
        DataType = ftInteger
      end
      item
        Name = 'NomeContato'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Horas'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Valor'
        Attributes = [faRequired]
        DataType = ftCurrency
      end
      item
        Name = 'Desconto'
        DataType = ftCurrency
      end
      item
        Name = 'TotalFinal'
        DataType = ftCurrency
      end
      item
        Name = 'Motivo'
        DataType = ftInteger
      end
      item
        Name = 'NomeMotivo'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'HorasL'
        DataType = ftInteger
      end
      item
        Name = 'ValorL'
        DataType = ftCurrency
      end
      item
        Name = 'Usuario'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Numero'
        DataType = ftInteger
      end
      item
        Name = 'FormaPagto'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FormaPagtoL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Inicio'
        DataType = ftDateTime
      end
      item
        Name = 'DataPagto'
        DataType = ftDateTime
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    Version = '4.04'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    OnCalcFields = TabCalcFields
    Left = 184
    Top = 98
    object TabContato: TIntegerField
      FieldName = 'Contato'
      Visible = False
    end
    object TabNomeContato: TStringField
      DisplayLabel = 'Contato'
      FieldKind = fkLookup
      FieldName = 'NomeContato'
      LookupDataSet = Dados.tbCli
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'Contato'
      Lookup = True
    end
    object TabHoras: TIntegerField
      FieldName = 'Horas'
      Required = True
      Visible = False
    end
    object TabValor: TCurrencyField
      FieldName = 'Valor'
      Required = True
      Visible = False
    end
    object TabDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object TabTotalFinal: TCurrencyField
      DisplayLabel = 'Total Final'
      FieldKind = fkCalculated
      FieldName = 'TotalFinal'
      Calculated = True
    end
    object TabMotivo: TIntegerField
      FieldName = 'Motivo'
      Visible = False
    end
    object TabNomeMotivo: TStringField
      DisplayLabel = 'Motivo'
      FieldKind = fkLookup
      FieldName = 'NomeMotivo'
      LookupDataSet = Dados.tbMotivo
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Motivo'
      Size = 30
      Lookup = True
    end
    object TabHorasL: TIntegerField
      FieldKind = fkLookup
      FieldName = 'HorasL'
      LookupDataSet = Dados.tbPacote
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Horas'
      KeyFields = 'CodPacote'
      Lookup = True
    end
    object TabValorL: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'ValorL'
      LookupDataSet = Dados.tbPacote
      LookupKeyFields = 'Codigo'
      LookupResultField = 'ValorTotal'
      KeyFields = 'CodPacote'
      Lookup = True
    end
    object TabUsuario: TStringField
      FieldName = 'Usuario'
      Size = 10
    end
    object TabNumero: TIntegerField
      FieldName = 'Numero'
    end
    object TabFormaPagto: TStringField
      FieldName = 'FormaPagto'
    end
    object TabFormaPagtoL: TStringField
      FieldKind = fkLookup
      FieldName = 'FormaPagtoL'
      LookupDataSet = Dados.tbFPag
      LookupKeyFields = 'Descricao'
      LookupResultField = 'Descricao'
      KeyFields = 'FormaPagto'
      Lookup = True
    end
    object TabObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TabInicio: TDateTimeField
      FieldName = 'Inicio'
    end
    object TabDataPagto: TDateTimeField
      FieldName = 'DataPagto'
    end
    object TabDescrHoras: TStringField
      FieldKind = fkLookup
      FieldName = 'DescrHoras'
      LookupDataSet = Dados.tbPacote
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descr'
      KeyFields = 'CodPacote'
      Size = 30
      Lookup = True
    end
    object TabCodPacote: TWordField
      FieldName = 'CodPacote'
    end
  end
end
