object dmCaixa: TdmCaixa
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 466
  Width = 678
  object nxSession: TnxSession
    UserName = 'admin'
    Password = 'delphi9856'
    Timeout = 120000
    ServerEngine = nxRSE
    Left = 24
    Top = 16
  end
  object nxDB: TnxDatabase
    Session = nxSession
    AliasName = 'NexCafe'
    Left = 80
    Top = 16
  end
  object nxRSE: TnxRemoteServerEngine
    Transport = nxTCPIP
    Left = 136
    Top = 16
  end
  object nxTCPIP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 17200
    Left = 192
    Top = 16
  end
  object dsQVC: TDataSource
    DataSet = qVC
    Left = 247
    Top = 144
  end
  object qVC: TnxQuery
    Database = nxDB
    Timeout = 120000
    FilterOptions = [foCaseInsensitive]
    OnCalcFields = qVCCalcFields
    SQL.Strings = (
      
        'select P.Categoria, Sum(I.Total) as Total, Sum(I.Desconto) as De' +
        'sconto, Sum(I.Quant) as Quant  from MovEst I, Produto P'
      '  WHERE '
      '     (P.ID=I.Produto) and '
      '     (I.Caixa >= :CaixaI) and (I.Caixa <= :CaixaF) and '
      '     (I.TipoTran=4) and'
      '     ((not Cancelado) or (Cancelado is Null)) and'
      '     ((not FidResgate) or (FidResgate is null))'
      '  GROUP BY '
      '     P.Categoria'
      ''
      '')
    Left = 255
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CaixaI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CaixaF'
        ParamType = ptUnknown
      end>
    object qVCCategoria: TStringField
      FieldName = 'Categoria'
      Size = 35
    end
    object qVCTotal: TCurrencyField
      FieldName = 'Total'
    end
    object qVCDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object qVCTotFinal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TotFinal'
      Calculated = True
    end
    object qVCQuant: TFloatField
      FieldName = 'Quant'
    end
  end
  object tProd: TnxTable
    Database = nxDB
    Timeout = 120000
    TableName = 'Produto'
    IndexName = 'IID'
    Left = 24
    Top = 275
    object tProdDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object tProdID: TAutoIncField
      FieldName = 'ID'
    end
    object tProdCustoUnitario: TCurrencyField
      FieldName = 'CustoUnitario'
    end
    object tProdNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
  end
  object tME: TnxTable
    Database = nxDB
    Timeout = 120000
    Filter = 'Cancelado = False'
    Filtered = True
    OnCalcFields = tMECalcFields
    TableName = 'MovEst'
    IndexName = 'IProdCxMov'
    Left = 24
    Top = 224
    object tMEID: TAutoIncField
      FieldName = 'ID'
    end
    object tMETran: TIntegerField
      FieldName = 'Tran'
    end
    object tMEProduto: TIntegerField
      FieldName = 'Produto'
    end
    object tMEQuant: TFloatField
      FieldName = 'Quant'
    end
    object tMEUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object tMETotal: TCurrencyField
      FieldName = 'Total'
    end
    object tMECustoU: TCurrencyField
      FieldName = 'CustoU'
    end
    object tMEItem: TWordField
      FieldName = 'Item'
    end
    object tMEDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tMEPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tMEPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object tMEDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object tMEDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tMEEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object tMECancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tMEEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object tMECliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tMECaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tMECategoria: TStringField
      FieldName = 'Categoria'
    end
    object tMENaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object tMEITran: TIntegerField
      FieldName = 'ITran'
    end
    object tMETipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object tMESessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tMESaldoFinal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SaldoFinal'
      Calculated = True
    end
    object tMEFidResgate: TBooleanField
      FieldName = 'FidResgate'
    end
    object tMEFidPontos: TFloatField
      FieldName = 'FidPontos'
    end
  end
  object mtEst: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'SaldoInicial'
        DataType = ftFloat
      end
      item
        Name = 'Entradas'
        DataType = ftFloat
      end
      item
        Name = 'Compras'
        DataType = ftFloat
      end
      item
        Name = 'Saidas'
        DataType = ftFloat
      end
      item
        Name = 'Vendas'
        DataType = ftFloat
      end
      item
        Name = 'ValorVendas'
        DataType = ftCurrency
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'SaldoFinal'
        DataType = ftFloat
      end
      item
        Name = 'Lucro'
        DataType = ftCurrency
      end
      item
        Name = 'ID'
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
    OnCalcFields = mtEstCalcFields
    Left = 80
    Top = 96
    object mtEstSaldoInicial: TFloatField
      FieldName = 'SaldoInicial'
    end
    object mtEstEntradas: TFloatField
      FieldName = 'Entradas'
    end
    object mtEstCompras: TFloatField
      FieldName = 'Compras'
    end
    object mtEstSaidas: TFloatField
      FieldName = 'Saidas'
    end
    object mtEstVendas: TFloatField
      FieldName = 'Vendas'
    end
    object mtEstValorVendas: TCurrencyField
      FieldName = 'ValorVendas'
    end
    object mtEstDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object mtEstSaldoFinal: TFloatField
      FieldName = 'SaldoFinal'
    end
    object mtEstLucro: TCurrencyField
      FieldName = 'Lucro'
    end
    object mtEstID: TIntegerField
      FieldName = 'ID'
    end
    object mtEstFidResg: TFloatField
      FieldKind = fkCalculated
      FieldName = 'FidResg'
      Calculated = True
    end
    object mtEstEntradasTot: TFloatField
      FieldKind = fkCalculated
      FieldName = 'EntradasTot'
      Calculated = True
    end
  end
  object dsTot: TDataSource
    DataSet = mtTot
    Left = 24
    Top = 144
  end
  object dsEst: TDataSource
    DataSet = mtEst
    Left = 80
    Top = 144
  end
  object mtTot: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = -1
    FieldDefs = <
      item
        Name = 'Item'
        DataType = ftInteger
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Total'
        DataType = ftCurrency
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
    Left = 24
    Top = 96
    object mtTotItem: TIntegerField
      FieldName = 'Item'
    end
    object mtTotDescricao: TStringField
      FieldName = 'Descricao'
      Size = 40
    end
    object mtTotValor: TCurrencyField
      FieldName = 'Total'
    end
  end
  object qRFFat: TnxQuery
    Database = nxDB
    Timeout = 120000
    SQL.Strings = (
      'select'
      '  Tipo,'
      '  Count(*) as Qtd,'
      '  Sum(TotLiq) as TotLiq'
      'from '
      '  Tran'
      'where'
      
        '  (Caixa >= :CaixaI) and (Caixa <= :CaixaF) and ((Cancelado is N' +
        'ull) or (not Cancelado))'
      'group by'
      '  Tipo')
    Left = 184
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CaixaI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CaixaF'
        ParamType = ptUnknown
      end>
    object qRFFatTipo: TWordField
      FieldName = 'Tipo'
    end
    object qRFFatQtd: TLargeintField
      FieldName = 'Qtd'
    end
    object qRFFatTotLiq: TCurrencyField
      FieldName = 'TotLiq'
    end
  end
  object qDesc: TnxQuery
    Database = nxDB
    Timeout = 120000
    SQL.Strings = (
      'select'
      '  Count(ID) as Quant,'
      '  Sum(Desconto) as Total'
      'from '
      '  Tran'
      'where'
      '  ((not Cancelado) or (Cancelado is null)) and '
      '  ( ((Caixa >= :CaixaI) and (Caixa <= :CaixaF)) or'
      '    ((CaixaPag >= :CaixaI) and (CaixaPag  <= :CaixaF)) )'
      '  and (Desconto > 0.001)')
    Left = 248
    Top = 275
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CaixaI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CaixaF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CaixaI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CaixaF'
        ParamType = ptUnknown
      end>
    object qDescQuant: TLargeintField
      FieldName = 'Quant'
    end
    object qDescTotal: TCurrencyField
      FieldName = 'Total'
    end
  end
  object qCanc: TnxQuery
    Database = nxDB
    Timeout = 120000
    SQL.Strings = (
      'select'
      '  Count(ID) as Quant,'
      '  Sum(Total) as Total'
      'from '
      '  Tran'
      'where'
      '  (Cancelado = True) and '
      '  ( '
      '   ((Caixa >= :CaixaI) and (Caixa <= :CaixaF)) or'
      '    ((CaixaPag >= :CaixaI) and (CaixaPag  <= :CaixaF))'
      '  )'
      '')
    Left = 248
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CaixaI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CaixaF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CaixaI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CaixaF'
        ParamType = ptUnknown
      end>
    object qCancQuant: TLargeintField
      FieldName = 'Quant'
    end
    object qCancTotal: TCurrencyField
      FieldName = 'Total'
    end
  end
  object tCli: TnxTable
    Database = nxDB
    Timeout = 120000
    TableName = 'Cliente'
    IndexName = 'IID'
    Left = 72
    Top = 224
  end
  object tCaixa: TnxTable
    Database = nxDB
    Timeout = 120000
    OnCalcFields = tCaixaCalcFields
    TableName = 'Caixa'
    IndexName = 'IAberto'
    Left = 303
    Top = 144
    object tCaixaID: TAutoIncField
      Alignment = taLeftJustify
      FieldName = 'ID'
    end
    object tCaixaAberto: TBooleanField
      FieldName = 'Aberto'
    end
    object tCaixaUsuario: TStringField
      FieldName = 'Usuario'
    end
    object tCaixaAbertura: TDateTimeField
      FieldName = 'Abertura'
    end
    object tCaixaFechamento: TDateTimeField
      FieldName = 'Fechamento'
    end
    object tCaixaTotalFinal: TCurrencyField
      FieldName = 'TotalFinal'
    end
    object tCaixaDescontos: TCurrencyField
      FieldName = 'Descontos'
    end
    object tCaixaCancelamentos: TCurrencyField
      FieldName = 'Cancelamentos'
    end
    object tCaixaSaldoAnt: TCurrencyField
      FieldName = 'SaldoAnt'
    end
    object tCaixaObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tCaixaSangria: TCurrencyField
      FieldName = 'Sangria'
    end
    object tCaixaSupr: TCurrencyField
      FieldName = 'Supr'
    end
    object tCaixaReproc: TDateTimeField
      FieldName = 'Reproc'
    end
    object tCaixaEstSessoesQtd: TIntegerField
      FieldName = 'EstSessoesQtd'
    end
    object tCaixaEstSessoesTempo: TFloatField
      FieldName = 'EstSessoesTempo'
    end
    object tCaixaEstUrls: TIntegerField
      FieldName = 'EstUrls'
    end
    object tCaixaEstSyncOk: TBooleanField
      FieldName = 'EstSyncOk'
    end
    object tCaixaEstBuscasEng: TMemoField
      FieldName = 'EstBuscasEng'
      BlobType = ftMemo
    end
    object tCaixaEstRes: TMemoField
      FieldName = 'EstRes'
      BlobType = ftMemo
    end
    object tCaixaSaldoF: TCurrencyField
      FieldName = 'SaldoF'
    end
    object tCaixaQuebra: TCurrencyField
      FieldName = 'Quebra'
    end
    object tCaixaIDLivre: TStringField
      FieldName = 'IDLivre'
      Size = 10
    end
    object tCaixaNomeLoja: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeLoja'
      Size = 50
      Calculated = True
    end
  end
  object qFecha: TnxQuery
    Database = nxDB
    Timeout = 120000
    SQL.Strings = (
      'select'
      '  Cancelado,'
      '  Tipo,'
      '  Sum(Total) as Total,'
      '  Sum(Desconto) as Desconto,'
      '  Sum(Pago) as Pago,'
      '  Sum(Troco) as Troco,'
      '  Sum(Debito) as Debito'
      'from '
      '  Tran'
      'where'
      '  (Caixa = :Caixa)'
      'group by'
      '  Cancelado,'
      '  Tipo')
    Left = 72
    Top = 275
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Caixa'
        ParamType = ptUnknown
      end>
    object qFechaCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object qFechaTipo: TWordField
      FieldName = 'Tipo'
    end
    object qFechaTotal: TCurrencyField
      FieldName = 'Total'
    end
    object qFechaDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object qFechaPago: TCurrencyField
      FieldName = 'Pago'
    end
    object qFechaDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object qFechaTroco: TCurrencyField
      FieldName = 'Troco'
    end
  end
  object repCaixa: TfrxReport
    Version = '4.15'
    DataSet = frdbCaixa
    DataSetName = 'frdbCaixa'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39015.443900231500000000
    ReportOptions.LastChange = 41662.057447928200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo9OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <dbRF1."Bold"> = True then'
      '    Memo9.Font.Style := fsBold'
      '  else'
      
        '    Memo9.Font.Style := 0;                                      ' +
        '                                       '
      
        '  Memo9.Font.Color := <dbRF1."Cor">;                            ' +
        '                        '
      'end;'
      ''
      'procedure Memo10OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <dbRF1."Bold"> = True then'
      '    Memo10.Font.Style := fsBold'
      '  else'
      
        '    Memo10.Font.Style := 0;                                     ' +
        '                            '
      '  Memo10.Font.Color := <dbRF1."Cor">;  '
      'end;'
      ''
      'procedure dbRF2DescricaoOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <dbRF2."Bold"> = True then'
      '    dbRF2Descricao.Font.Style := fsBold'
      '  else'
      
        '    dbRF2Descricao.Font.Style := 0;                             ' +
        '                                                '
      '  dbRF2Descricao.Font.Color := <dbRF2."Cor">;  '
      'end;'
      ''
      'procedure dbRF2TotalOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <dbRF2."Bold"> = True then'
      '    dbRF2Total.Font.Style := fsBold'
      '  else'
      
        '    dbRF2Total.Font.Style := 0;                                 ' +
        '                                            '
      '  dbRF2Total.Font.Color := <dbRF2."Cor">;  '
      'end;'
      ''
      'procedure dbRF3DescricaoOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <dbRF3."Bold"> = True then'
      '    dbRF3Descricao.Font.Style := fsBold'
      '  else'
      
        '    dbRF3Descricao.Font.Style := 0;                             ' +
        '                                                '
      '  dbRF3Descricao.Font.Color := <dbRF3."Cor">;  '
      'end;'
      ''
      'procedure dbRF3TotalOnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <dbRF3."Bold"> = True then'
      '    dbRF3Total.Font.Style := fsBold'
      '  else'
      
        '    dbRF3Total.Font.Style := 0;                                 ' +
        '                                            '
      '  dbRF3Total.Font.Color := <dbRF3."Cor">;  '
      'end;'
      ''
      'begin'
      ''
      'end.')
    ShowProgress = False
    OnBeforePrint = repCaixaBeforePrint
    Left = 256
    Top = 16
    Datasets = <
      item
        DataSet = frdbPagEsp
        DataSetName = 'dbMeioPag'
      end
      item
        DataSet = dbObs
        DataSetName = 'dbObs'
      end
      item
        DataSet = dbRF1
        DataSetName = 'dbRF1'
      end
      item
        DataSet = dbRF2
        DataSetName = 'dbRF2'
      end
      item
        DataSet = dbRF3
        DataSetName = 'dbRF3'
      end
      item
        DataSet = frdbCaixa
        DataSetName = 'frdbCaixa'
      end
      item
        DataSet = frdbEst
        DataSetName = 'frdbEst'
      end
      item
        DataSet = frdbProd
        DataSetName = 'frdbProd'
      end
      item
        DataSet = frdbTot
        DataSetName = 'frdbTot'
      end
      item
        DataSet = frdbTran
        DataSetName = 'frdbTran'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Align = baLeft
          Top = 26.559060000000000000
          Width = 653.858690000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              'Caixa n.[frdbCaixa."ID"]     Inicio: [frdbCaixa."Abertura"]     ' +
              'T'#195#169'rmino: [frdbCaixa."Fechamento"]     Func: [frdbCaixa."Usuario' +
              '"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Align = baRight
          Left = 668.598857000000000000
          Top = 25.559060000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'Pag.[Page]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Align = baWidth
          Top = 46.677180000000000000
          Width = 740.409927000000000000
          ShowHint = False
          Frame.Color = clGray
          Frame.Typ = [ftTop]
        end
        object Line54: TfrxLineView
          Align = baWidth
          Top = 22.338590000000000000
          Width = 740.409927000000000000
          ShowHint = False
          Frame.Color = clGray
          Frame.Typ = [ftTop]
        end
        object Memo82: TfrxMemoView
          Align = baCenter
          Left = 222.803293500000000000
          Top = 0.779530000000000000
          Width = 294.803340000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          DataField = 'NomeLoja'
          DataSet = frdbCaixa
          DataSetName = 'frdbCaixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdbCaixa."NomeLoja"]')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        Height = 34.015770000000000000
        Top = 136.063080000000000000
        Width = 740.409927000000000000
        OnBeforePrint = 'MasterData2OnBeforePrint'
        Child = repCaixa.childRF2
        KeepChild = True
        KeepFooter = True
        RowCount = 1
        Stretched = True
        object srRF1: TfrxSubreport
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Page = repCaixa.pgRF1
        end
      end
      object Child2: TfrxChild
        Height = 22.677180000000000000
        Top = 389.291590000000000000
        Width = 740.409927000000000000
        AllowSplit = True
        Child = repCaixa.Child4
        PrintChildIfInvisible = True
        Stretched = True
        object srMovEstoque: TfrxSubreport
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Page = repCaixa.Page4
          PrintOnParent = True
        end
      end
      object childPagEsp: TfrxChild
        Height = 22.677180000000000000
        Top = 343.937230000000000000
        Width = 740.409927000000000000
        AllowSplit = True
        Child = repCaixa.Child2
        PrintChildIfInvisible = True
        Stretched = True
        object srPagEsp: TfrxSubreport
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Page = repCaixa.Page7
        end
      end
      object Child4: TfrxChild
        Height = 22.677180000000000000
        Top = 434.645950000000000000
        Width = 740.409927000000000000
        Child = repCaixa.Child5
        object srTran: TfrxSubreport
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Page = repCaixa.Page5
        end
      end
      object Child5: TfrxChild
        Height = 22.677180000000000000
        Top = 480.000310000000000000
        Width = 740.409927000000000000
        object srEstoqueAbaixoMin: TfrxSubreport
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Page = repCaixa.Page6
        end
      end
      object childRF2: TfrxChild
        Height = 30.236240000000000000
        Top = 192.756030000000000000
        Width = 740.409927000000000000
        Child = repCaixa.childRF3
        object srRF2: TfrxSubreport
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Page = repCaixa.Page8
        end
      end
      object childRF3: TfrxChild
        Height = 30.236240000000000000
        Top = 245.669450000000000000
        Width = 740.409927000000000000
        Child = repCaixa.ChildObs
        PrintChildIfInvisible = True
        object srRF3: TfrxSubreport
          Top = 1.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Page = repCaixa.Page3
        end
      end
      object ChildObs: TfrxChild
        Height = 22.677180000000000000
        Top = 298.582870000000000000
        Width = 740.409927000000000000
        Child = repCaixa.childPagEsp
        PrintChildIfInvisible = True
        object srObs: TfrxSubreport
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Page = repCaixa.Page2
        end
      end
    end
    object Page4: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      PrintIfEmpty = False
      object Header3: TfrxHeader
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Shape5: TfrxShapeView
          Top = 49.133890000000000000
          Width = 740.409927000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Color = 15066597
        end
        object Memo32: TfrxMemoView
          Left = 3.779530000000000000
          Top = 52.913420000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Produto')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line25: TfrxLineView
          Left = 207.874150000000000000
          Top = 49.133890000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo33: TfrxMemoView
          Left = 207.874150000000000000
          Top = 52.913420000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'Saldo Inicial')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line26: TfrxLineView
          Left = 272.125984250000000000
          Top = 49.133890000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo34: TfrxMemoView
          Left = 272.126160000000000000
          Top = 52.913420000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'Entradas')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line27: TfrxLineView
          Left = 328.819110000000000000
          Top = 49.133890000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo35: TfrxMemoView
          Left = 332.598640000000000000
          Top = 52.913420000000000000
          Width = 52.913385830000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'Saidas')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line28: TfrxLineView
          Left = 389.291590000000000000
          Top = 49.133890000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo36: TfrxMemoView
          Left = 393.071120000000000000
          Top = 52.913420000000000000
          Width = 60.472440940000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'Pr'#195#170'mio Fid.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line29: TfrxLineView
          Left = 457.323130000000000000
          Top = 49.133890000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo37: TfrxMemoView
          Left = 665.197280000000000000
          Top = 52.913420000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'Lucro')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Top = 26.456710000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Vendas e Movimenta'#195#167#195#163'o de Produtos')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 461.102660000000000000
          Top = 52.913420000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'Vendas')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line30: TfrxLineView
          Left = 517.795610000000000000
          Top = 49.133890000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo40: TfrxMemoView
          Left = 521.575140000000000000
          Top = 52.913420000000000000
          Width = 64.251968500000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Saldo Final')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line31: TfrxLineView
          Left = 589.606680000000000000
          Top = 49.133890000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo41: TfrxMemoView
          Left = 593.386210000000000000
          Top = 52.913420000000000000
          Width = 64.251968500000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'Vl.Vendas')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line32: TfrxLineView
          Left = 661.417750000000000000
          Top = 49.133890000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
      end
      object MasterData3: TfrxMasterData
        Height = 26.456692910000000000
        Top = 117.165430000000000000
        Width = 740.409927000000000000
        DataSet = frdbEst
        DataSetName = 'frdbEst'
        RowCount = 0
        object Shape4: TfrxShapeView
          Width = 740.409927000000000000
          Height = 26.456692910000000000
          OnBeforePrint = 'Shape2OnBeforePrint'
          ShowHint = False
        end
        object Memo26: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999990000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Descricao'
          DataSet = frdbEst
          DataSetName = 'frdbEst'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frdbEst."Descricao"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line20: TfrxLineView
          Left = 207.874150000000000000
          Height = 26.456692910000000000
          OnBeforePrint = 'Line7OnBeforePrint'
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line21: TfrxLineView
          Left = 272.126160000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line22: TfrxLineView
          Left = 328.819110000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line23: TfrxLineView
          Left = 389.291590000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line24: TfrxLineView
          Left = 457.323130000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo27: TfrxMemoView
          Left = 211.653680000000000000
          Top = 3.779529999999990000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'SaldoInicial'
          DataSet = frdbEst
          DataSetName = 'frdbEst'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdbEst."SaldoInicial"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 275.905690000000000000
          Top = 3.779529999999990000
          Width = 49.133855830000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'EntradasTot'
          DataSet = frdbEst
          DataSetName = 'frdbEst'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdbEst."EntradasTot"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 332.598640000000000000
          Top = 3.779529999999990000
          Width = 52.913385830000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Saidas'
          DataSet = frdbEst
          DataSetName = 'frdbEst'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdbEst."Saidas"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 393.071120000000000000
          Top = 3.779529999999990000
          Width = 60.472440940000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'FidResg'
          DataSet = frdbEst
          DataSetName = 'frdbEst'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdbEst."FidResg"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 461.102660000000000000
          Top = 3.779529999999990000
          Width = 52.913385830000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Vendas'
          DataSet = frdbEst
          DataSetName = 'frdbEst'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdbEst."Vendas"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line12: TfrxLineView
          Left = 517.795610000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line13: TfrxLineView
          Left = 589.606680000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line14: TfrxLineView
          Left = 661.417750000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo3: TfrxMemoView
          Left = 593.386210000000000000
          Top = 3.779529999999990000
          Width = 64.251975830000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'ValorVendas'
          DataSet = frdbEst
          DataSetName = 'frdbEst'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frdbEst."ValorVendas"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 665.197280000000000000
          Top = 3.779529999999990000
          Width = 71.811035830000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Lucro'
          DataSet = frdbEst
          DataSetName = 'frdbEst'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frdbEst."Lucro"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 521.575140000000000000
          Top = 3.779529999999990000
          Width = 64.251975830000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'SaldoFinal'
          DataSet = frdbEst
          DataSetName = 'frdbEst'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdbEst."SaldoFinal"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Footer1: TfrxFooter
        Height = 26.456710000000000000
        Top = 166.299320000000000000
        Width = 740.409927000000000000
        object Shape3: TfrxShapeView
          Width = 740.409927000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Color = 15066597
        end
        object Line16: TfrxLineView
          Left = 589.606680000000000000
          Top = 0.000017090000000053
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line17: TfrxLineView
          Left = 661.417750000000000000
          Top = 0.000017090000000053
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo19: TfrxMemoView
          Left = 593.386210000000000000
          Top = 3.779547089999990000
          Width = 64.251975830000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdbEst
          DataSetName = 'frdbEst'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frdbEst."ValorVendas">,MasterData3,2)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 665.197280000000000000
          Top = 3.779547089999990000
          Width = 71.811035830000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frdbEst
          DataSetName = 'frdbEst'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<frdbEst."Lucro">,MasterData3)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object Page5: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Header4: TfrxHeader
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Shape8: TfrxShapeView
          Top = 49.133890000000000000
          Width = 740.409927000000000000
          Height = 49.133890000000000000
          ShowHint = False
          Color = 15066597
        end
        object Line34: TfrxLineView
          Left = 64.252010000000000000
          Top = 49.133890000000000000
          Height = 49.133872910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo45: TfrxMemoView
          Left = 3.779530000000000000
          Top = 52.913420000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'M'#195#161'quina')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line35: TfrxLineView
          Left = 173.858204250000000000
          Top = 49.133890000000000000
          Height = 49.133872910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo46: TfrxMemoView
          Left = 68.031540000000000000
          Top = 52.913420000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Data e Hora')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 68.031540000000000000
          Top = 75.590600000000000000
          Width = 98.267745830000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Tipo de Transa'#195#167#195#163'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line37: TfrxLineView
          Left = 340.157700000000000000
          Top = 49.133890000000000000
          Height = 49.133872910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line38: TfrxLineView
          Left = 404.409710000000000000
          Top = 49.133890000000000000
          Height = 49.133872910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo51: TfrxMemoView
          Left = 343.937230000000000000
          Top = 52.913420000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'Valor')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line39: TfrxLineView
          Left = 468.661720000000000000
          Top = 49.133890000000000000
          Height = 49.133872910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo53: TfrxMemoView
          Left = 472.441250000000000000
          Top = 52.913420000000000000
          Width = 75.590558500000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Observa'#195#167#195#181'es')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 3.779530000000000000
          Top = 75.590600000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'Canc/FID')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 177.637910000000000000
          Top = 52.913420000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Cliente')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 177.637910000000000000
          Top = 75.590600000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          ShowHint = False
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Descri'#195#167#195#163'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 343.937230000000000000
          Top = 75.590600000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'Desconto')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 408.189240000000000000
          Top = 52.913420000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'Total Final')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 408.189240000000000000
          Top = 75.590600000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'Pago')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Top = 26.456710000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Transa'#195#167#195#181'es')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData5: TfrxMasterData
        Height = 49.133858270000000000
        Top = 139.842610000000000000
        Width = 740.409927000000000000
        DataSet = frdbTran
        DataSetName = 'frdbTran'
        RowCount = 0
        Stretched = True
        object Shape9: TfrxShapeView
          Align = baClient
          Width = 740.409927000000000000
          Height = 49.133858270000000000
          OnBeforePrint = 'Shape2OnBeforePrint'
          ShowHint = False
        end
        object Memo52: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999990000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo24OnBeforePrint'
          ShowHint = False
          DataField = 'Maq'
          DataSet = frdbTran
          DataSetName = 'frdbTran'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdbTran."Maq"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 68.031540000000000000
          Top = 26.456710000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NomeTipo'
          DataSet = frdbTran
          DataSetName = 'frdbTran'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frdbTran."NomeTipo"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 408.189240000000000000
          Top = 3.779529999999990000
          Width = 56.692915830000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'TotLiq'
          DataSet = frdbTran
          DataSetName = 'frdbTran'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frdbTran."TotLiq"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 472.441250000000000000
          Top = 3.779529999999990000
          Width = 264.567100000000000000
          Height = 41.574830000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          DataField = 'Obs'
          DataSet = frdbTran
          DataSetName = 'frdbTran'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frdbTran."Obs"]')
          ParentFont = False
        end
        object Line41: TfrxLineView
          Left = 64.252010000000000000
          Height = 49.133872910000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line36: TfrxLineView
          Left = 173.858380000000000000
          Height = 49.133872910000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line40: TfrxLineView
          Left = 340.157700000000000000
          Height = 49.133872910000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line42: TfrxLineView
          Left = 404.409710000000000000
          Height = 49.133872910000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line43: TfrxLineView
          Left = 468.661720000000000000
          Height = 49.133872910000000000
          ShowHint = False
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Memo60: TfrxMemoView
          Left = 68.031540000000000000
          Top = 3.779529999999990000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'DataHora'
          DataSet = frdbTran
          DataSetName = 'frdbTran'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frdbTran."DataHora"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 177.637910000000000000
          Top = 3.779529999999990000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NomeCliente'
          DataSet = frdbTran
          DataSetName = 'frdbTran'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frdbTran."NomeCliente"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 177.637910000000000000
          Top = 26.456710000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Descr'
          DataSet = frdbTran
          DataSetName = 'frdbTran'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frdbTran."Descr"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 408.189240000000000000
          Top = 26.456710000000000000
          Width = 56.692915830000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Pago'
          DataSet = frdbTran
          DataSetName = 'frdbTran'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frdbTran."Pago"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 343.937230000000000000
          Top = 3.779529999999990000
          Width = 56.692915830000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Total'
          DataSet = frdbTran
          DataSetName = 'frdbTran'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frdbTran."Total"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 343.937230000000000000
          Top = 26.456710000000000000
          Width = 56.692915830000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Desconto'
          DataSet = frdbTran
          DataSetName = 'frdbTran'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frdbTran."Desconto"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 3.779530000000000000
          Top = 26.456710000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo24OnBeforePrint'
          ShowHint = False
          DataField = 'CancFid'
          DataSet = frdbTran
          DataSetName = 'frdbTran'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdbTran."CancFid"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object Page6: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Header5: TfrxHeader
        Height = 79.370130000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Shape10: TfrxShapeView
          Top = 52.913420000000000000
          Width = 740.409927000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Color = 15066597
        end
        object Memo67: TfrxMemoView
          Description = 'Produto'
          Left = 3.779530000000000000
          Top = 56.692950000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Produto')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line45: TfrxLineView
          Left = 381.732530000000000000
          Top = 52.913420000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo69: TfrxMemoView
          Left = 389.291590000000000000
          Top = 56.692950000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'Estoque Atual')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line46: TfrxLineView
          Left = 476.220780000000000000
          Top = 52.913420000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo70: TfrxMemoView
          Left = 483.779840000000000000
          Top = 56.692950000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'Estoque M'#195#173'n.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line47: TfrxLineView
          Left = 566.929500000000000000
          Top = 52.913420000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo71: TfrxMemoView
          Left = 574.488560000000000000
          Top = 56.692950000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'Estoque M'#195#161'x.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line48: TfrxLineView
          Left = 657.638220000000000000
          Top = 52.913420000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo72: TfrxMemoView
          Left = 661.417750000000000000
          Top = 56.692950000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'Quant.Repor')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Top = 30.236240000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Produtos com estoque abaixo do m'#195#173'nimo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line44: TfrxLineView
          Left = 283.464750000000000000
          Top = 52.913420000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo74: TfrxMemoView
          Left = 291.023810000000000000
          Top = 56.692950000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'Desde')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData6: TfrxMasterData
        Height = 26.456692910000000000
        Top = 120.944960000000000000
        Width = 740.409927000000000000
        DataSet = frdbProd
        DataSetName = 'frdbProd'
        RowCount = 0
        object Shape11: TfrxShapeView
          Width = 740.409927000000000000
          Height = 26.456692910000000000
          OnBeforePrint = 'Shape2OnBeforePrint'
          ShowHint = False
        end
        object Memo68: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo11OnBeforePrint'
          ShowHint = False
          DataField = 'Descricao'
          DataSet = frdbProd
          DataSetName = 'frdbProd'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frdbProd."Descricao"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line49: TfrxLineView
          Left = 381.732530000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line50: TfrxLineView
          Left = 476.220780000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line51: TfrxLineView
          Left = 566.929500000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line52: TfrxLineView
          Left = 657.638220000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo75: TfrxMemoView
          Left = 389.291590000000000000
          Top = 3.779529999999990000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'EstoqueAtual'
          DataSet = frdbProd
          DataSetName = 'frdbProd'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdbProd."EstoqueAtual"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 483.779840000000000000
          Top = 3.779529999999990000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'EstoqueMin'
          DataSet = frdbProd
          DataSetName = 'frdbProd'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdbProd."EstoqueMin"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 574.488560000000000000
          Top = 3.779529999999990000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'EstoqueMax'
          DataSet = frdbProd
          DataSetName = 'frdbProd'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdbProd."EstoqueMax"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 661.417750000000000000
          Top = 3.779529999999990000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo16OnBeforePrint'
          ShowHint = False
          DataField = 'EstoqueRepor'
          DataSet = frdbProd
          DataSetName = 'frdbProd'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdbProd."EstoqueRepor"]')
          ParentFont = False
        end
        object Line53: TfrxLineView
          Left = 283.464750000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo79: TfrxMemoView
          Left = 291.023810000000000000
          Top = 3.779529999999990000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'AbaixoMinDesde'
          DataSet = frdbProd
          DataSetName = 'frdbProd'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdbProd."AbaixoMinDesde"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object Page7: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Header6: TfrxHeader
        Height = 71.811070000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo83: TfrxMemoView
          Top = 22.677180000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Valor recebido por meio de pagamento')
          ParentFont = False
          VAlign = vaCenter
        end
        object Shape12: TfrxShapeView
          Top = 45.354360000000000000
          Width = 740.409927000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Color = 15066597
        end
        object Line55: TfrxLineView
          Left = 437.275820000000000000
          Top = 45.354360000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line56: TfrxLineView
          Left = 283.464750000000000000
          Top = 45.354360000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo84: TfrxMemoView
          Left = 291.023810000000000000
          Top = 49.133890000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'Total')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo85: TfrxMemoView
          Left = 3.779530000000000000
          Top = 49.133890000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            'Meio de Pagamento')
        end
        object Memo86: TfrxMemoView
          Left = 442.205010000000000000
          Top = 49.133890000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            'Observa'#195#167#195#181'es')
        end
      end
      object MasterData7: TfrxMasterData
        Height = 26.456692910000000000
        Top = 113.385900000000000000
        Width = 740.409927000000000000
        DataSet = frdbPagEsp
        DataSetName = 'dbMeioPag'
        RowCount = 0
        object Shape13: TfrxShapeView
          Width = 740.409927000000000000
          Height = 26.456692910000000000
          OnBeforePrint = 'Shape2OnBeforePrint'
          ShowHint = False
        end
        object Line57: TfrxLineView
          Left = 283.464750000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line58: TfrxLineView
          Left = 438.425480000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object dbMeioPagMeio: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Meio'
          DataSet = frdbPagEsp
          DataSetName = 'dbMeioPag'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dbMeioPag."Meio"]')
          ParentFont = False
        end
        object dbMeioPagValor: TfrxMemoView
          Left = 291.023810000000000000
          Top = 3.779530000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Valor'
          DataSet = frdbPagEsp
          DataSetName = 'dbMeioPag'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[dbMeioPag."Valor"]')
          ParentFont = False
        end
        object dbMeioPagObs: TfrxMemoView
          Left = 442.205010000000000000
          Top = 3.779530000000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'Obs'
          DataSet = frdbPagEsp
          DataSetName = 'dbMeioPag'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dbMeioPag."Obs"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 26.456692910000000000
        Top = 200.315090000000000000
        Width = 740.409927000000000000
        object Shape14: TfrxShapeView
          Width = 740.409927000000000000
          Height = 26.456692910000000000
          OnBeforePrint = 'Shape2OnBeforePrint'
          ShowHint = False
          Color = 15066597
        end
        object Line59: TfrxLineView
          Left = 283.464750000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Line60: TfrxLineView
          Left = 438.425480000000000000
          Height = 26.456692910000000000
          ShowHint = False
          Frame.Typ = [ftLeft]
        end
        object Memo87: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'TOTAL')
          ParentFont = False
        end
        object Memo88: TfrxMemoView
          Left = 291.023810000000000000
          Top = 3.779530000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<dbMeioPag."Valor">,MasterData7)]')
          ParentFont = False
        end
      end
    end
    object pgRF1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object Header2: TfrxHeader
        Height = 30.236240000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo8: TfrxMemoView
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          Memo.UTF8 = (
            'Resumo Financeiro')
          ParentFont = False
        end
      end
      object MasterData4: TfrxMasterData
        Height = 22.677180000000000000
        Top = 71.811070000000000000
        Width = 718.110700000000000000
        DataSet = dbRF1
        DataSetName = 'dbRF1'
        RowCount = 0
        object Shape7: TfrxShapeView
          Align = baLeft
          Width = 495.118430000000000000
          Height = 22.677180000000000000
          ShowHint = False
        end
        object Memo9: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.889763780000000000
          Width = 343.937230000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo9OnBeforePrint'
          ShowHint = False
          DataField = 'Descricao'
          DataSet = dbRF1
          DataSetName = 'dbRF1'
          Memo.UTF8 = (
            '[dbRF1."Descricao"]')
        end
        object Memo10: TfrxMemoView
          Left = 359.055118110000000000
          Top = 1.889763780000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo10OnBeforePrint'
          ShowHint = False
          DataField = 'Total'
          DataSet = dbRF1
          DataSetName = 'dbRF1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[dbRF1."Total"]')
          ParentFont = False
        end
      end
    end
    object Page8: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object heRF2: TfrxHeader
        Height = 37.795300000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          Top = 16.118120000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Valores Recebidos:')
          ParentFont = False
        end
      end
      object mdRF2: TfrxMasterData
        Height = 22.677180000000000000
        Top = 79.370130000000000000
        Width = 718.110700000000000000
        DataSet = dbRF2
        DataSetName = 'dbRF2'
        RowCount = 0
        object Shape2: TfrxShapeView
          Align = baLeft
          Width = 495.118110240000000000
          Height = 22.677180000000000000
          ShowHint = False
        end
        object dbRF2Descricao: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.889763780000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'dbRF2DescricaoOnBeforePrint'
          ShowHint = False
          DataField = 'Descricao'
          DataSet = dbRF2
          DataSetName = 'dbRF2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dbRF2."Descricao"]')
          ParentFont = False
        end
        object dbRF2Total: TfrxMemoView
          Left = 359.055118110000000000
          Top = 1.889763780000000000
          Width = 128.503937010000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'dbRF2TotalOnBeforePrint'
          ShowHint = False
          DataField = 'Total'
          DataSet = dbRF2
          DataSetName = 'dbRF2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[dbRF2."Total"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 26.456710000000000000
        Top = 162.519790000000000000
        Width = 718.110700000000000000
      end
    end
    object Page3: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object mdRF3: TfrxMasterData
        Height = 22.677180000000000000
        Top = 79.370130000000000000
        Width = 718.110700000000000000
        DataSet = dbRF3
        DataSetName = 'dbRF3'
        RowCount = 0
        object Shape6: TfrxShapeView
          Align = baLeft
          Width = 495.118110236220000000
          Height = 22.677180000000000000
          ShowHint = False
        end
        object dbRF3Descricao: TfrxMemoView
          Left = 3.779530000000000000
          Top = 1.889763780000000000
          Width = 328.819110000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'dbRF3DescricaoOnBeforePrint'
          ShowHint = False
          DataField = 'Descricao'
          DataSet = dbRF3
          DataSetName = 'dbRF3'
          Memo.UTF8 = (
            '[dbRF3."Descricao"]')
        end
        object dbRF3Total: TfrxMemoView
          Left = 359.055118110000000000
          Top = 1.889763780000000000
          Width = 128.503937010000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'dbRF3TotalOnBeforePrint'
          ShowHint = False
          DataField = 'Total'
          DataSet = dbRF3
          DataSetName = 'dbRF3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[dbRF3."Total"]')
          ParentFont = False
        end
      end
      object Header7: TfrxHeader
        Height = 37.795300000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          Top = 17.338590000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Saldo de Caixa:')
          ParentFont = False
        end
      end
      object PageFooter2: TfrxPageFooter
        Height = 26.456710000000000000
        Top = 162.519790000000000000
        Width = 718.110700000000000000
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      PrintIfEmpty = False
      object MasterData1: TfrxMasterData
        Height = 30.236240000000000000
        Top = 75.590600000000000000
        Width = 718.110700000000000000
        DataSet = dbObs
        DataSetName = 'dbObs'
        RowCount = 0
        Stretched = True
        object Shape1: TfrxShapeView
          Align = baClient
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Frame.Color = clGray
        end
        object frdbCaixaObs: TfrxMemoView
          Left = 3.779530000000000000
          Top = 4.779530000000000000
          Width = 706.772110000000000000
          Height = 18.897650000000000000
          ShowHint = False
          StretchMode = smActualHeight
          DataField = 'Obs'
          DataSet = dbObs
          DataSetName = 'dbObs'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dbObs."Obs"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        Height = 34.015770000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Top = 15.118120000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Observa'#195#167#195#181'es:')
          ParentFont = False
        end
      end
    end
  end
  object PDFexp: TfrxPDFExport
    ShowDialog = False
    FileName = 'c:\meus programas\caixa.pdf'
    UseFileCache = True
    ShowProgress = False
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport (http://www.fast-report.com)'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 312
    Top = 16
  end
  object frdbCaixa: TfrxDBDataset
    Description = 'Caixa'
    RangeBegin = rbCurrent
    RangeEnd = reCurrent
    UserName = 'frdbCaixa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'Aberto=Aberto'
      'Usuario=Usuario'
      'Abertura=Abertura'
      'Fechamento=Fechamento'
      'TotalFinal=TotalFinal'
      'Descontos=Descontos'
      'Cancelamentos=Cancelamentos'
      'SaldoAnt=SaldoAnt'
      'Obs=Obs'
      'Sangria=Sangria'
      'Supr=Supr'
      'Reproc=Reproc'
      'EstSessoesQtd=EstSessoesQtd'
      'EstSessoesTempo=EstSessoesTempo'
      'EstUrls=EstUrls'
      'EstSyncOk=EstSyncOk'
      'EstBuscasEng=EstBuscasEng'
      'EstRes=EstRes'
      'SaldoF=SaldoF'
      'Quebra=Quebra'
      'IDLivre=IDLivre'
      'NomeLoja=NomeLoja')
    DataSet = tCaixa
    BCDToCurrency = False
    Left = 368
    Top = 16
  end
  object frdbTot: TfrxDBDataset
    Description = 'Resumo Financeiro'
    UserName = 'frdbTot'
    CloseDataSource = False
    DataSet = mtTot
    BCDToCurrency = False
    Left = 416
    Top = 16
  end
  object tCriar: TnxTable
    Database = nxDB
    Timeout = 120000
    TableName = 'EmailCriar'
    IndexName = 'IID'
    Left = 360
    Top = 96
    object tCriarID: TAutoIncField
      FieldName = 'ID'
    end
    object tCriarTipo: TIntegerField
      FieldName = 'Tipo'
    end
    object tCriarParametros: TMemoField
      FieldName = 'Parametros'
      BlobType = ftMemo
    end
    object tCriarDestino: TMemoField
      FieldName = 'Destino'
      BlobType = ftMemo
    end
  end
  object qCorr: TnxQuery
    Database = nxDB
    Timeout = 120000
    SQL.Strings = (
      'update tran'
      'set pago = total - desconto'
      'where (Pago > (Total - Desconto)) and (Caixa=:Caixa)')
    Left = 352
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'Caixa'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object qCorr2: TnxQuery
    Database = nxDB
    Timeout = 120000
    SQL.Strings = (
      'update itran'
      'set caixa = :Caixa'
      'where tran in (select id from tran where caixa = :Caixa)')
    Left = 560
    Top = 152
    ParamData = <
      item
        DataType = ftString
        Name = 'Caixa'
        ParamType = ptUnknown
        Value = 1
      end
      item
        DataType = ftString
        Name = 'Caixa'
        ParamType = ptUnknown
      end>
  end
  object tTran: TnxTable
    Database = nxDB
    Filter = '(Cancelado = False) and (Pago > 0)'
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    TableName = 'Tran'
    IndexName = 'IID'
    Left = 88
    Top = 328
    object tTranID: TAutoIncField
      FieldName = 'ID'
    end
    object tTranDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tTranCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tTranTipo: TWordField
      FieldName = 'Tipo'
    end
    object tTranFunc: TStringField
      FieldName = 'Func'
    end
    object tTranTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tTranDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tTranPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tTranObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tTranCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tTranCanceladoPor: TStringField
      FieldName = 'CanceladoPor'
      Size = 30
    end
    object tTranCanceladoEm: TDateTimeField
      FieldName = 'CanceladoEm'
    end
    object tTranCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tTranMaq: TWordField
      FieldName = 'Maq'
    end
    object tTranNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 50
    end
    object tTranSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tTranDescr: TStringField
      FieldName = 'Descr'
      Size = 50
    end
    object tTranDebito: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Debito'
      Calculated = True
    end
    object tTranQtdTempo: TFloatField
      FieldName = 'QtdTempo'
    end
    object tTranCredValor: TBooleanField
      FieldName = 'CredValor'
    end
  end
  object tITran: TnxTable
    Database = nxDB
    TableName = 'ITran'
    IndexName = 'ITranID'
    Left = 88
    Top = 384
    object tITranID: TAutoIncField
      FieldName = 'ID'
    end
    object tITranTran: TIntegerField
      FieldName = 'Tran'
    end
    object tITranCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tITranDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tITranTipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object tITranTipoItem: TWordField
      FieldName = 'TipoItem'
    end
    object tITranSubTipo: TWordField
      FieldName = 'SubTipo'
    end
    object tITranItemID: TIntegerField
      FieldName = 'ItemID'
    end
    object tITranSubItemID: TIntegerField
      FieldName = 'SubItemID'
    end
    object tITranItemPos: TWordField
      FieldName = 'ItemPos'
    end
    object tITranTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tITranDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tITranPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tITranCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tITranSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tITranDebito: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Debito'
      Calculated = True
    end
  end
  object frdbEst: TfrxDBDataset
    UserName = 'frdbEst'
    CloseDataSource = False
    DataSet = mtEst
    BCDToCurrency = False
    Left = 480
    Top = 16
  end
  object frdbTran: TfrxDBDataset
    UserName = 'frdbTran'
    CloseDataSource = False
    DataSet = qRepTran
    BCDToCurrency = False
    Left = 544
    Top = 16
  end
  object tRepProd: TnxTable
    Database = nxDB
    Timeout = 120000
    TableName = 'Produto'
    IndexName = 'IAbaixoMin'
    Left = 424
    Top = 147
    object tRepProdID: TAutoIncField
      FieldName = 'ID'
    end
    object tRepProdCodigo: TStringField
      FieldName = 'Codigo'
      Size = 30
    end
    object tRepProdDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object tRepProdUnid: TStringField
      FieldName = 'Unid'
      Size = 5
    end
    object tRepProdPreco: TCurrencyField
      FieldName = 'Preco'
    end
    object tRepProdObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tRepProdImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object tRepProdCategoria: TStringField
      FieldName = 'Categoria'
      Size = 35
    end
    object tRepProdFornecedor: TIntegerField
      FieldName = 'Fornecedor'
    end
    object tRepProdSubCateg: TStringField
      FieldName = 'SubCateg'
      Size = 35
    end
    object tRepProdEstoqueAtual: TFloatField
      FieldName = 'EstoqueAtual'
    end
    object tRepProdCustoUnitario: TCurrencyField
      FieldName = 'CustoUnitario'
    end
    object tRepProdEstoqueACE: TFloatField
      FieldName = 'EstoqueACE'
    end
    object tRepProdEstoqueACS: TFloatField
      FieldName = 'EstoqueACS'
    end
    object tRepProdPodeAlterarPreco: TBooleanField
      FieldName = 'PodeAlterarPreco'
    end
    object tRepProdNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object tRepProdEstoqueMin: TFloatField
      FieldName = 'EstoqueMin'
    end
    object tRepProdEstoqueMax: TFloatField
      FieldName = 'EstoqueMax'
    end
    object tRepProdAbaixoMin: TBooleanField
      FieldName = 'AbaixoMin'
    end
    object tRepProdAbaixoMinDesde: TDateTimeField
      FieldName = 'AbaixoMinDesde'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tRepProdEstoqueRepor: TFloatField
      FieldName = 'EstoqueRepor'
    end
    object tRepProdFidelidade: TBooleanField
      FieldName = 'Fidelidade'
    end
    object tRepProdFidPontos: TIntegerField
      FieldName = 'FidPontos'
    end
  end
  object frdbProd: TfrxDBDataset
    UserName = 'frdbProd'
    CloseDataSource = False
    DataSet = tRepProd
    BCDToCurrency = False
    Left = 168
    Top = 80
  end
  object qRepTran: TnxQuery
    Database = nxDB
    Timeout = 120000
    OnCalcFields = qRepTranCalcFields
    SQL.Strings = (
      'select * from Tran')
    Left = 592
    Top = 72
    object qRepTranID: TIntegerField
      FieldName = 'ID'
    end
    object qRepTranDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object qRepTranCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object qRepTranTipo: TWordField
      FieldName = 'Tipo'
    end
    object qRepTranFunc: TStringField
      FieldName = 'Func'
    end
    object qRepTranTotal: TCurrencyField
      FieldName = 'Total'
    end
    object qRepTranDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object qRepTranTotLiq: TCurrencyField
      FieldName = 'TotLiq'
    end
    object qRepTranPago: TCurrencyField
      FieldName = 'Pago'
    end
    object qRepTranDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object qRepTranObs: TnxMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object qRepTranCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object qRepTranCanceladoPor: TStringField
      FieldName = 'CanceladoPor'
      Size = 30
    end
    object qRepTranCanceladoEm: TDateTimeField
      FieldName = 'CanceladoEm'
    end
    object qRepTranCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object qRepTranMaq: TWordField
      FieldName = 'Maq'
    end
    object qRepTranNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 50
    end
    object qRepTranSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object qRepTranDescr: TStringField
      FieldName = 'Descr'
      Size = 50
    end
    object qRepTranQtdTempo: TFloatField
      FieldName = 'QtdTempo'
    end
    object qRepTranCredValor: TBooleanField
      FieldName = 'CredValor'
    end
    object qRepTranFidResgate: TBooleanField
      FieldName = 'FidResgate'
    end
    object qRepTranNomeTipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeTipo'
      Size = 40
      Calculated = True
    end
    object qRepTranCancFid: TStringField
      FieldKind = fkCalculated
      FieldName = 'CancFid'
      Size = 10
      Calculated = True
    end
  end
  object tUsuario: TnxTable
    Database = nxDB
    TableName = 'Usuario'
    IndexName = 'IUsername'
    Left = 168
    Top = 144
    object tUsuarioUsername: TStringField
      FieldName = 'Username'
    end
    object tUsuarioNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tUsuarioAdmin: TBooleanField
      FieldName = 'Admin'
    end
  end
  object qPagEsp: TnxQuery
    Database = nxDB
    Timeout = 120000
    OnCalcFields = qPagEspCalcFields
    SQL.Strings = (
      'select'
      '  Especie,'
      '  Sum(Valor) as TotalValor,'
      '  Sum(Troco) as TotalTroco'
      'from '
      '  PagEspecies'
      'where'
      
        '  (Caixa >= :CaixaI) and (Caixa <= :CaixaF) and ((Cancelado is N' +
        'ull) or (not Cancelado))'
      'group by'
      '  Especie'
      'order by'
      '  Especie')
    Left = 408
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CaixaI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CaixaF'
        ParamType = ptUnknown
      end>
    object qPagEspTotalF: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TotalF'
      Calculated = True
    end
    object qPagEspTotalValor: TCurrencyField
      FieldName = 'TotalValor'
    end
    object qPagEspTotalTroco: TCurrencyField
      FieldName = 'TotalTroco'
    end
    object qPagEspEspecie: TWordField
      FieldName = 'Especie'
    end
    object qPagEspNomeEspecie: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeEspecie'
      LookupDataSet = tEsp
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Especie'
      Size = 40
      Lookup = True
    end
    object qPagEspImg: TWordField
      FieldKind = fkLookup
      FieldName = 'Img'
      LookupDataSet = tEsp
      LookupKeyFields = 'ID'
      LookupResultField = 'Img'
      KeyFields = 'Especie'
      Lookup = True
    end
    object qPagEspObs: TStringField
      FieldKind = fkCalculated
      FieldName = 'Obs'
      Size = 50
      Calculated = True
    end
  end
  object tEsp: TnxTable
    Database = nxDB
    Timeout = 120000
    TableName = 'Especie'
    IndexName = 'IRecVer'
    Left = 360
    Top = 152
    object tEspID: TWordField
      FieldName = 'ID'
    end
    object tEspNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object tEspImg: TWordField
      FieldName = 'Img'
    end
  end
  object dsPagEsp: TDataSource
    DataSet = qPagEsp
    Left = 456
    Top = 208
  end
  object frdbPagEsp: TfrxDBDataset
    UserName = 'dbMeioPag'
    CloseDataSource = False
    FieldAliases.Strings = (
      'TotalF=Valor'
      '-TotalValor=TotalValor'
      '-TotalTroco=TotalTroco'
      '-Especie=Especie'
      'NomeEspecie=Meio'
      '-Img=Img'
      'Obs=Obs')
    DataSet = qPagEsp
    BCDToCurrency = False
    Left = 448
    Top = 88
  end
  object qRFPag: TnxQuery
    Database = nxDB
    Timeout = 120000
    SQL.Strings = (
      'select'
      '  Tipo,'
      '  Count(*) as Qtd,'
      '  Sum(Credito) as Credito,'
      '  Sum(Debito) as Debito,'
      '  Sum(Pago) as Pago,'
      '  Sum(CreditoUsado) as CreditoUsado,'
      '  Sum(Troco) as Troco'
      'from '
      '  Tran'
      'where'
      
        '  (CaixaPag >= :CaixaI) and (CaixaPag <= :CaixaF) and ((Cancelad' +
        'o is Null) or (not Cancelado))'
      'group by'
      '  Tipo'
      '')
    Left = 32
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CaixaI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CaixaF'
        ParamType = ptUnknown
      end>
    object qRFPagTipo: TWordField
      FieldName = 'Tipo'
    end
    object qRFPagQtd: TLargeintField
      FieldName = 'Qtd'
    end
    object qRFPagCredito: TCurrencyField
      FieldName = 'Credito'
    end
    object qRFPagDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object qRFPagCreditoUsado: TCurrencyField
      FieldName = 'CreditoUsado'
    end
    object qRFPagPago: TCurrencyField
      FieldName = 'Pago'
    end
    object qRFPagTroco: TCurrencyField
      FieldName = 'Troco'
    end
  end
  object mtRF1: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = -1
    FieldDefs = <
      item
        Name = 'Item'
        DataType = ftInteger
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Total'
        DataType = ftCurrency
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
    OnCalcFields = mtRF1CalcFields
    Left = 336
    Top = 336
    object mtRF1Item: TIntegerField
      FieldName = 'Item'
    end
    object mtRF1Descricao: TStringField
      FieldName = 'Descricao'
      Size = 40
    end
    object mtRF1Total: TCurrencyField
      FieldName = 'Total'
    end
    object mtRF1Bold: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'Bold'
      Calculated = True
    end
    object mtRF1Cor: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Cor'
      Calculated = True
    end
  end
  object dsRF1: TDataSource
    DataSet = mtRF1
    Left = 336
    Top = 384
  end
  object mtRF2: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = -1
    FieldDefs = <
      item
        Name = 'Item'
        DataType = ftInteger
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Total'
        DataType = ftCurrency
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
    OnCalcFields = mtRF2CalcFields
    Left = 384
    Top = 336
    object mtRF2Item: TIntegerField
      FieldName = 'Item'
    end
    object mtRF2Descricao: TStringField
      FieldName = 'Descricao'
      Size = 40
    end
    object mtRF2Total: TCurrencyField
      FieldName = 'Total'
    end
    object mtRF2Bold: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'Bold'
      Calculated = True
    end
    object mtRF2Cor: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Cor'
      Calculated = True
    end
  end
  object dsRF2: TDataSource
    DataSet = mtRF2
    Left = 384
    Top = 384
  end
  object mtRF3: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    AutoIncMinValue = -1
    FieldDefs = <
      item
        Name = 'Item'
        DataType = ftInteger
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Total'
        DataType = ftCurrency
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
    OnCalcFields = mtRF3CalcFields
    Left = 432
    Top = 336
    object mtRF3Item: TIntegerField
      FieldName = 'Item'
    end
    object mtRF3Descricao: TStringField
      FieldName = 'Descricao'
      Size = 40
    end
    object mtRF3Total: TCurrencyField
      FieldName = 'Total'
    end
    object mtRF3Bold: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'Bold'
      Calculated = True
    end
    object mtRF3Cor: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Cor'
      Calculated = True
    end
  end
  object dsRF3: TDataSource
    DataSet = mtRF3
    Left = 432
    Top = 384
  end
  object dbRF1: TfrxDBDataset
    UserName = 'dbRF1'
    CloseDataSource = False
    DataSet = mtRF1
    BCDToCurrency = False
    Left = 560
    Top = 248
  end
  object dbRF2: TfrxDBDataset
    UserName = 'dbRF2'
    CloseDataSource = False
    DataSet = mtRF2
    BCDToCurrency = False
    Left = 608
    Top = 248
  end
  object dbRF3: TfrxDBDataset
    UserName = 'dbRF3'
    CloseDataSource = False
    DataSet = mtRF3
    BCDToCurrency = False
    Left = 560
    Top = 304
  end
  object mtObs: TkbmMemTable
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
    Left = 336
    Top = 272
    object mtObsObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
  end
  object dbObs: TfrxDBDataset
    UserName = 'dbObs'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Obs=Obs')
    DataSet = mtObs
    BCDToCurrency = False
    Left = 560
    Top = 368
  end
end
