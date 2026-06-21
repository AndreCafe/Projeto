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
    Port = 16200
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
    Left = 247
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
      end
      item
        Name = 'Faturamento'
        DataType = ftCurrency
      end
      item
        Name = 'Debitado'
        DataType = ftCurrency
      end
      item
        Name = 'Recebido'
        DataType = ftCurrency
      end
      item
        Name = 'PgDebito'
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
    object mtTotTotal: TCurrencyField
      FieldName = 'Total'
    end
    object mtTotFaturamento: TCurrencyField
      FieldName = 'Faturamento'
    end
    object mtTotDebitado: TCurrencyField
      FieldName = 'Debitado'
    end
    object mtTotRecebido: TCurrencyField
      FieldName = 'Recebido'
    end
    object mtTotPgDebito: TCurrencyField
      FieldName = 'PgDebito'
    end
  end
  object qRFFat: TnxQuery
    Database = nxDB
    Timeout = 120000
    SQL.Strings = (
      'select'
      '  TipoTran,'
      '  TipoItem,'
      '  Sum(Total) as Total,'
      '  Sum(Desconto) as Desconto'
      'from '
      '  ITran'
      'where'
      
        '  (Caixa >= :CaixaI) and (Caixa <= :CaixaF) and ((Cancelado is N' +
        'ull) or (not Cancelado))'
      'group by'
      '  TipoTran,'
      '  TipoItem')
    Left = 192
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
    object qRFFatTipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object qRFFatTipoItem: TWordField
      FieldName = 'TipoItem'
    end
    object qRFFatTotal: TCurrencyField
      FieldName = 'Total'
    end
    object qRFFatDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
  end
  object qSS: TnxQuery
    Database = nxDB
    Timeout = 120000
    SQL.Strings = (
      'select'
      '  Tipo,'
      '  Sum(Total) as Total'
      'from '
      '  Tran'
      'where'
      
        '  ((not Cancelado) or (Cancelado is null)) and ((Tipo = 9) or (T' +
        'ipo = 10)) and'
      '  (Caixa >= :CaixaI) and (Caixa <= :CaixaF)'
      'group by'
      '  Tipo')
    Left = 192
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
      end>
    object qSSTipo: TWordField
      FieldName = 'Tipo'
    end
    object qSSTotal: TCurrencyField
      FieldName = 'Total'
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
  object qGratis: TnxQuery
    Database = nxDB
    Timeout = 120000
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      'select '
      '  Cliente,'
      '  Count(Distinct(Sessao)) as Quant,'
      '  Sum(MinutosU) as MinutosU, '
      '  Sum(MinutosP) as MinutosP '
      'from '
      '  Ocupacao'
      'where'
      '     (TipoCli=1) and (Caixa >= :CaixaI) and (Caixa <= :CaixaF)'
      'group by'
      '  Cliente')
    Left = 303
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
    object qGratisCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object qGratisQuant: TLargeintField
      FieldName = 'Quant'
    end
    object qGratisMinutosU: TFloatField
      FieldName = 'MinutosU'
    end
    object qGratisMinutosP: TFloatField
      FieldName = 'MinutosP'
    end
    object qGratisNomeCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeCliente'
      LookupDataSet = tCli
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Cliente'
      Size = 50
      Lookup = True
    end
  end
  object dsGratis: TDataSource
    DataSet = qGratis
    Left = 303
    Top = 275
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
  object tSessao: TnxTable
    Database = nxDB
    Timeout = 120000
    TableName = 'Sessao'
    IndexName = 'IEncerrou'
    Left = 303
    Top = 96
  end
  object repCaixa: TfrxReport
    Version = '5.5.11'
    DataSet = frdbCaixa
    DataSetName = 'frdbCaixa'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39015.443900231500000000
    ReportOptions.LastChange = 41620.654470428200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Shape2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frdbTot."Item"> in [4, 8, 10] then begin'
      '    Shape2.Color := $00E5E5E5;'
      '  end else begin'
      '    Shape2.Color := clWhite;'
      '  end;'
      'end;'
      ''
      'procedure Line7OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frdbTot."Item"> > 4 then begin'
      '    Line7.Visible := False;'
      '    Line8.Visible := False;'
      '    Line9.Visible := False;'
      '    Line10.Visible := False;'
      '  end else begin'
      '    Line7.Visible := True;'
      '    Line8.Visible := True;'
      '    Line9.Visible := True;'
      '    Line10.Visible := True;'
      '  end;'
      'end;'
      ''
      'procedure Memo16OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frdbTot."Item"> > 10 then'
      '    Memo16.Font.Color := clRed else'
      '    Memo16.Font.Color := clBlack;'
      'end;'
      ''
      'procedure Memo12OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frdbTot."Item"> > 4 then begin'
      '    Memo12.Visible := False;'
      '    Memo13.Visible := False;'
      '    Memo14.Visible := False;'
      '    Memo15.Visible := False;'
      '  end else begin'
      '    Memo12.Visible := True;'
      '    Memo13.Visible := True;'
      '    Memo14.Visible := True;'
      '    Memo15.Visible := True;'
      '  end;'
      'end;'
      ''
      'procedure Memo24OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frdbImp."TipoImp"> = 12 then'
      '    Memo24.Font.Color := clRed else'
      '    Memo24.Font.Style := clBlack;'
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
        DataSet = frdbCaixa
        DataSetName = 'frdbCaixa'
      end
      item
        DataSet = frdbEst
        DataSetName = 'frdbEst'
      end
      item
        DataSet = frdbImp
        DataSetName = 'frdbImp'
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
        FillType = ftBrush
        Height = 52.913420000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Align = baLeft
          Top = 19.000000000000000000
          Width = 616.063390000000000000
          Height = 18.897650000000000000
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
          Top = 18.000000000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
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
          Top = 40.677180000000000000
          Width = 740.409927000000000000
          Color = clBlack
          Frame.Color = clGray
          Frame.Typ = [ftTop]
        end
        object Line54: TfrxLineView
          Align = baWidth
          Top = 16.338590000000000000
          Width = 740.409927000000000000
          Color = clBlack
          Frame.Color = clGray
          Frame.Typ = [ftTop]
        end
      end
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 132.283550000000000000
        Width = 740.409927000000000000
        Child = repCaixa.Child1
        KeepChild = True
        RowCount = 1
        Stretched = True
        object srResumoFin: TfrxSubreport
          ShiftMode = smWhenOverlapped
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = repCaixa.Page2
          PrintOnParent = True
        end
      end
      object Child2: TfrxChild
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 222.992270000000000000
        Width = 740.409927000000000000
        AllowSplit = True
        Child = repCaixa.Child3
        PrintChildIfInvisible = True
        Stretched = True
        object srMovEstoque: TfrxSubreport
          Top = 0.000000000000000014
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = repCaixa.Page4
          PrintOnParent = True
        end
      end
      object Child1: TfrxChild
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 177.637910000000000000
        Width = 740.409927000000000000
        AllowSplit = True
        Child = repCaixa.Child2
        PrintChildIfInvisible = True
        Stretched = True
        object srPagEsp: TfrxSubreport
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = repCaixa.Page7
        end
      end
      object Child3: TfrxChild
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 268.346630000000000000
        Width = 740.409927000000000000
        AllowSplit = True
        Child = repCaixa.Child4
        Stretched = True
        object srImpressoes: TfrxSubreport
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = repCaixa.Page3
        end
      end
      object Child4: TfrxChild
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 313.700990000000000000
        Width = 740.409927000000000000
        Child = repCaixa.Child5
        object srTran: TfrxSubreport
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = repCaixa.Page5
        end
      end
      object Memo82: TfrxMemoView
        Align = baCenter
        Left = 222.803293500000000000
        Top = 15.897650000000000000
        Width = 294.803340000000000000
        Height = 18.897650000000000000
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
      object Child5: TfrxChild
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 359.055350000000000000
        Width = 740.409927000000000000
        object srEstoqueAbaixoMin: TfrxSubreport
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Page = repCaixa.Page6
        end
      end
    end
    object Page2: TfrxReportPage
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
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 79.370130000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Shape1: TfrxShapeView
          Top = 52.913420000000000000
          Width = 740.409927000000000000
          Height = 26.456710000000000000
        end
        object Memo5: TfrxMemoView
          Left = 3.779530000000000000
          Top = 56.692950000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
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
        object Line2: TfrxLineView
          Left = 207.874150000000000000
          Top = 52.913420000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo6: TfrxMemoView
          Left = 211.653680000000000000
          Top = 56.692950000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'Faturamento')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line3: TfrxLineView
          Left = 313.700990000000000000
          Top = 52.913420000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo7: TfrxMemoView
          Left = 317.480520000000000000
          Top = 56.692950000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'Debitado')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line4: TfrxLineView
          Left = 419.527830000000000000
          Top = 52.913420000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo8: TfrxMemoView
          Left = 423.307360000000000000
          Top = 56.692950000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Recebido')
          VAlign = vaCenter
        end
        object Line5: TfrxLineView
          Left = 525.354670000000000000
          Top = 52.913420000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo9: TfrxMemoView
          Left = 529.134200000000000000
          Top = 56.692950000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'D'#195#169'bitos Pagos')
          VAlign = vaCenter
        end
        object Line6: TfrxLineView
          Left = 631.181510000000000000
          Top = 52.913420000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo10: TfrxMemoView
          Left = 634.961040000000000000
          Top = 56.692950000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'Total')
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Top = 30.236240000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Resumo Financeiro')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 26.456692910000000000
        Top = 120.944960000000000000
        Width = 740.409927000000000000
        DataSet = frdbTot
        DataSetName = 'frdbTot'
        RowCount = 0
        object Shape2: TfrxShapeView
          Left = -0.000000000000000210
          Width = 740.409927000000000000
          Height = 26.456692910000000000
          OnBeforePrint = 'Shape2OnBeforePrint'
        end
        object Memo11: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo11OnBeforePrint'
          DataSet = frdbTot
          DataSetName = 'frdbTot'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frdbTot."Descricao"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line7: TfrxLineView
          Left = 207.874150000000000000
          Height = 26.456692910000000000
          OnBeforePrint = 'Line7OnBeforePrint'
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line8: TfrxLineView
          Left = 313.700990000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          Left = 419.527830000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          Left = 525.354670000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line11: TfrxLineView
          Left = 631.181510000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo12: TfrxMemoView
          Left = 211.653680000000000000
          Top = 3.779529999999990000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo12OnBeforePrint'
          DataSet = frdbTot
          DataSetName = 'frdbTot'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[frdbTot."Faturamento"]')
        end
        object Memo13: TfrxMemoView
          Left = 317.480520000000000000
          Top = 3.779529999999990000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'Debitado'
          DataSet = frdbTot
          DataSetName = 'frdbTot'
          HAlign = haRight
          Memo.UTF8 = (
            '[frdbTot."Debitado"]')
        end
        object Memo14: TfrxMemoView
          Left = 423.307360000000000000
          Top = 3.779529999999990000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'Recebido'
          DataSet = frdbTot
          DataSetName = 'frdbTot'
          HAlign = haRight
          Memo.UTF8 = (
            '[frdbTot."Recebido"]')
        end
        object Memo15: TfrxMemoView
          Left = 529.134200000000000000
          Top = 3.779529999999990000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'PgDebito'
          DataSet = frdbTot
          DataSetName = 'frdbTot'
          HAlign = haRight
          Memo.UTF8 = (
            '[frdbTot."PgDebito"]')
        end
        object Memo16: TfrxMemoView
          Left = 634.961040000000000000
          Top = 3.779529999999990000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo16OnBeforePrint'
          DataField = 'Total'
          DataSet = frdbTot
          DataSetName = 'frdbTot'
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
            '[frdbTot."Total"]')
          ParentFont = False
        end
      end
      object Footer2: TfrxFooter
        FillType = ftBrush
        Height = 49.133890000000000000
        Top = 170.078850000000000000
        Width = 740.409927000000000000
        object Memo80: TfrxMemoView
          Top = 30.236240000000000000
          Width = 740.787880000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataField = 'Obs'
          DataSet = frdbCaixa
          DataSetName = 'frdbCaixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[frdbCaixa."Obs"]')
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Top = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Observa'#195#167#195#181'es:')
          ParentFont = False
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
        FillType = ftBrush
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Shape5: TfrxShapeView
          Top = 49.133890000000000000
          Width = 740.409927000000000000
          Height = 26.456710000000000000
        end
        object Memo32: TfrxMemoView
          Left = 3.779530000000000000
          Top = 52.913420000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
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
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo33: TfrxMemoView
          Left = 207.874150000000000000
          Top = 52.913420000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
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
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo34: TfrxMemoView
          Left = 272.126160000000000000
          Top = 52.913420000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
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
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo35: TfrxMemoView
          Left = 332.598640000000000000
          Top = 52.913420000000000000
          Width = 52.913385830000000000
          Height = 18.897650000000000000
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
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo36: TfrxMemoView
          Left = 393.071120000000000000
          Top = 52.913420000000000000
          Width = 60.472440940000000000
          Height = 18.897650000000000000
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
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo37: TfrxMemoView
          Left = 665.197280000000000000
          Top = 52.913420000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
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
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo40: TfrxMemoView
          Left = 521.575140000000000000
          Top = 52.913420000000000000
          Width = 64.251968500000000000
          Height = 18.897650000000000000
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
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo41: TfrxMemoView
          Left = 593.386210000000000000
          Top = 52.913420000000000000
          Width = 64.251968500000000000
          Height = 18.897650000000000000
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
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
      object MasterData3: TfrxMasterData
        FillType = ftBrush
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
        end
        object Memo26: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999990000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
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
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line21: TfrxLineView
          Left = 272.126160000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line22: TfrxLineView
          Left = 328.819110000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line23: TfrxLineView
          Left = 389.291590000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line24: TfrxLineView
          Left = 457.323130000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo27: TfrxMemoView
          Left = 211.653680000000000000
          Top = 3.779529999999990000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
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
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line13: TfrxLineView
          Left = 589.606680000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line14: TfrxLineView
          Left = 661.417750000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo3: TfrxMemoView
          Left = 593.386210000000000000
          Top = 3.779529999999990000
          Width = 64.251975830000000000
          Height = 18.897650000000000000
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
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 166.299320000000000000
        Width = 740.409927000000000000
        object Shape3: TfrxShapeView
          Width = 740.409927000000000000
          Height = 26.456710000000000000
        end
        object Line16: TfrxLineView
          Left = 589.606680000000000000
          Top = 0.000017090000000053
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line17: TfrxLineView
          Left = 661.417750000000000000
          Top = 0.000017090000000053
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo19: TfrxMemoView
          Left = 593.386210000000000000
          Top = 3.779547089999990000
          Width = 64.251975830000000000
          Height = 18.897650000000000000
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
    object Page3: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      PrintIfEmpty = False
      object Header2: TfrxHeader
        FillType = ftBrush
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        ReprintOnNewPage = True
        object Shape6: TfrxShapeView
          Top = 49.133890000000000000
          Width = 475.842827000000000000
          Height = 26.456710000000000000
        end
        object Memo21: TfrxMemoView
          Left = 3.779530000000000000
          Top = 52.913420000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Tipo de Impress'#195#163'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line15: TfrxLineView
          Left = 313.700990000000000000
          Top = 49.133890000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo22: TfrxMemoView
          Left = 325.039580000000000000
          Top = 52.913420000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            'P'#195#161'ginas')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line18: TfrxLineView
          Left = 400.630004250000000000
          Top = 49.133890000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo23: TfrxMemoView
          Left = 411.968770000000000000
          Top = 52.913420000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
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
        object Memo43: TfrxMemoView
          Top = 26.456710000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Impress'#195#181'es')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData4: TfrxMasterData
        FillType = ftBrush
        Height = 26.456692910000000000
        Top = 117.165430000000000000
        Width = 740.409927000000000000
        DataSet = frdbImp
        DataSetName = 'frdbImp'
        RowCount = 0
        object Shape7: TfrxShapeView
          Width = 475.842827000000000000
          Height = 26.456692910000000000
          OnBeforePrint = 'Shape2OnBeforePrint'
        end
        object Memo24: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999990000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo24OnBeforePrint'
          DataField = 'NomeTipoImp'
          DataSet = frdbImp
          DataSetName = 'frdbImp'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[frdbImp."NomeTipoImp"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line19: TfrxLineView
          Left = 313.700990000000000000
          Height = 26.456692910000000000
          OnBeforePrint = 'Line7OnBeforePrint'
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line33: TfrxLineView
          Left = 400.630180000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo25: TfrxMemoView
          Left = 321.260050000000000000
          Top = 3.779529999999990000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'Quant'
          DataSet = frdbImp
          DataSetName = 'frdbImp'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdbImp."Quant"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 408.189240000000000000
          Top = 3.779529999999990000
          Width = 64.251975830000000000
          Height = 18.897650000000000000
          DataField = 'Valor'
          DataSet = frdbImp
          DataSetName = 'frdbImp'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[frdbImp."Valor"]')
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
        FillType = ftBrush
        Height = 98.267780000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Shape8: TfrxShapeView
          Top = 49.133890000000000000
          Width = 740.409927000000000000
          Height = 49.133890000000000000
        end
        object Line34: TfrxLineView
          Left = 64.252010000000000000
          Top = 49.133890000000000000
          Height = 49.133872910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo45: TfrxMemoView
          Left = 3.779530000000000000
          Top = 52.913420000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
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
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo46: TfrxMemoView
          Left = 68.031540000000000000
          Top = 52.913420000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
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
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line38: TfrxLineView
          Left = 404.409710000000000000
          Top = 49.133890000000000000
          Height = 49.133872910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo51: TfrxMemoView
          Left = 343.937230000000000000
          Top = 52.913420000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
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
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo53: TfrxMemoView
          Left = 472.441250000000000000
          Top = 52.913420000000000000
          Width = 75.590558500000000000
          Height = 18.897650000000000000
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
        FillType = ftBrush
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
        end
        object Memo52: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999990000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo24OnBeforePrint'
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
          StretchMode = smMaxHeight
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line36: TfrxLineView
          Left = 173.858380000000000000
          Height = 49.133872910000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line40: TfrxLineView
          Left = 340.157700000000000000
          Height = 49.133872910000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line42: TfrxLineView
          Left = 404.409710000000000000
          Height = 49.133872910000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line43: TfrxLineView
          Left = 468.661720000000000000
          Height = 49.133872910000000000
          StretchMode = smMaxHeight
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo60: TfrxMemoView
          Left = 68.031540000000000000
          Top = 3.779529999999990000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
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
        FillType = ftBrush
        Height = 79.370130000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Shape10: TfrxShapeView
          Top = 52.913420000000000000
          Width = 740.409927000000000000
          Height = 26.456710000000000000
        end
        object Memo67: TfrxMemoView
          Description = 'Produto'
          Left = 3.779530000000000000
          Top = 56.692950000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
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
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo69: TfrxMemoView
          Left = 389.291590000000000000
          Top = 56.692950000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
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
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo70: TfrxMemoView
          Left = 483.779840000000000000
          Top = 56.692950000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo71: TfrxMemoView
          Left = 574.488560000000000000
          Top = 56.692950000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo72: TfrxMemoView
          Left = 661.417750000000000000
          Top = 56.692950000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
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
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo74: TfrxMemoView
          Left = 291.023810000000000000
          Top = 56.692950000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
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
        FillType = ftBrush
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
        end
        object Memo68: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo11OnBeforePrint'
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
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line50: TfrxLineView
          Left = 476.220780000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line51: TfrxLineView
          Left = 566.929500000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line52: TfrxLineView
          Left = 657.638220000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo75: TfrxMemoView
          Left = 389.291590000000000000
          Top = 3.779529999999990000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
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
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo79: TfrxMemoView
          Left = 291.023810000000000000
          Top = 3.779529999999990000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
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
        FillType = ftBrush
        Height = 71.811070000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo83: TfrxMemoView
          Top = 22.677180000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
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
        end
        object Line55: TfrxLineView
          Left = 437.275820000000000000
          Top = 45.354360000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line56: TfrxLineView
          Left = 283.464750000000000000
          Top = 45.354360000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo84: TfrxMemoView
          Left = 291.023810000000000000
          Top = 49.133890000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
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
          Memo.UTF8 = (
            'Meio de Pagamento')
        end
        object Memo86: TfrxMemoView
          Left = 442.205010000000000000
          Top = 49.133890000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            'Observa'#195#167#195#181'es')
        end
      end
      object MasterData7: TfrxMasterData
        FillType = ftBrush
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
        end
        object Line57: TfrxLineView
          Left = 283.464750000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line58: TfrxLineView
          Left = 438.425480000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object dbMeioPagMeio: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
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
        FillType = ftBrush
        Height = 26.456692910000000000
        Top = 200.315090000000000000
        Width = 740.409927000000000000
        object Shape14: TfrxShapeView
          Width = 740.409927000000000000
          Height = 26.456692910000000000
          OnBeforePrint = 'Shape2OnBeforePrint'
        end
        object Line59: TfrxLineView
          Left = 283.464750000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line60: TfrxLineView
          Left = 438.425480000000000000
          Height = 26.456692910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo87: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
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
    Transparency = False
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
    PdfA = False
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
  object mtImp: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'TipoImp'
        DataType = ftInteger
      end
      item
        Name = 'Quant'
        DataType = ftInteger
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'NomeTipoImp'
        DataType = ftString
        Size = 40
      end>
    IndexFieldNames = 'TipoImp'
    IndexName = 'mtImpIndex1'
    IndexDefs = <
      item
        Name = 'mtImpIndex1'
        Fields = 'TipoImp'
        Options = [ixCaseInsensitive]
      end>
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
    Left = 368
    Top = 272
    object mtImpTipoImp: TIntegerField
      FieldName = 'TipoImp'
    end
    object mtImpQuant: TIntegerField
      FieldName = 'Quant'
    end
    object mtImpValor: TCurrencyField
      FieldName = 'Valor'
    end
    object mtImpNomeTipoImp: TStringField
      FieldName = 'NomeTipoImp'
      Size = 40
    end
  end
  object tTipoImp: TnxTable
    Database = nxDB
    TableName = 'TipoImp'
    IndexName = 'IID'
    Left = 496
    Top = 272
  end
  object dsImp: TDataSource
    DataSet = mtImp
    Left = 408
    Top = 272
  end
  object tImp: TnxTable
    Database = nxDB
    TableName = 'Impressao'
    IndexName = 'ICaixaID'
    Left = 496
    Top = 208
    object tImpID: TAutoIncField
      FieldName = 'ID'
    end
    object tImpTran: TIntegerField
      FieldName = 'Tran'
    end
    object tImpCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tImpManual: TBooleanField
      FieldName = 'Manual'
    end
    object tImpDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tImpComputador: TStringField
      FieldName = 'Computador'
      Size = 200
    end
    object tImpMaquina: TWordField
      FieldName = 'Maquina'
    end
    object tImpPaginas: TWordField
      FieldName = 'Paginas'
    end
    object tImpImpressora: TStringField
      FieldName = 'Impressora'
      Size = 200
    end
    object tImpDocumento: TMemoField
      FieldName = 'Documento'
      BlobType = ftMemo
    end
    object tImpSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tImpResultado: TWordField
      FieldName = 'Resultado'
    end
    object tImpq1: TWordField
      FieldName = 'q1'
    end
    object tImpq2: TWordField
      FieldName = 'q2'
    end
    object tImpq3: TWordField
      FieldName = 'q3'
    end
    object tImpq4: TWordField
      FieldName = 'q4'
    end
    object tImpq5: TWordField
      FieldName = 'q5'
    end
    object tImpq6: TWordField
      FieldName = 'q6'
    end
    object tImpq7: TWordField
      FieldName = 'q7'
    end
    object tImpq8: TWordField
      FieldName = 'q8'
    end
    object tImpq9: TWordField
      FieldName = 'q9'
    end
    object tImpq10: TWordField
      FieldName = 'q10'
    end
    object tImpv1: TCurrencyField
      FieldName = 'v1'
    end
    object tImpv2: TCurrencyField
      FieldName = 'v2'
    end
    object tImpv3: TCurrencyField
      FieldName = 'v3'
    end
    object tImpv4: TCurrencyField
      FieldName = 'v4'
    end
    object tImpv5: TCurrencyField
      FieldName = 'v5'
    end
    object tImpv6: TCurrencyField
      FieldName = 'v6'
    end
    object tImpv7: TCurrencyField
      FieldName = 'v7'
    end
    object tImpv8: TCurrencyField
      FieldName = 'v8'
    end
    object tImpv9: TCurrencyField
      FieldName = 'v9'
    end
    object tImpv10: TCurrencyField
      FieldName = 'v10'
    end
    object tImpTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tImpDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tImpPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object tImpDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object tImpPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tImpFunc: TStringField
      FieldName = 'Func'
    end
    object tImpCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tImpCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tImpx75: TBooleanField
      FieldName = 'x75'
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
    Left = 584
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
  object qSessao: TnxQuery
    Database = nxDB
    Timeout = 120000
    SQL.Strings = (
      'select * from Sessao'
      'where  ((CaixaI >= :CaixaI) and (CaixaI<= :CaixaF))'
      'order by Inicio')
    Left = 592
    Top = 248
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
    object qSessaoID: TIntegerField
      FieldName = 'ID'
    end
    object qSessaoInicio: TDateTimeField
      FieldName = 'Inicio'
    end
    object qSessaoTermino: TDateTimeField
      FieldName = 'Termino'
    end
    object qSessaoMinutosR: TFloatField
      Alignment = taCenter
      FieldName = 'MinutosR'
    end
    object qSessaoMinutosC: TFloatField
      FieldName = 'MinutosC'
    end
    object qSessaoMaq: TWordField
      Alignment = taCenter
      FieldName = 'Maq'
    end
    object qSessaoMaqI: TWordField
      FieldName = 'MaqI'
    end
    object qSessaoEncerrou: TBooleanField
      FieldName = 'Encerrou'
    end
    object qSessaoCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object qSessaoTransfMaq: TBooleanField
      FieldName = 'TransfMaq'
    end
    object qSessaoTipoCli: TWordField
      Alignment = taCenter
      FieldName = 'TipoCli'
    end
    object qSessaoCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object qSessaoTotal: TCurrencyField
      FieldName = 'Total'
    end
    object qSessaoDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object qSessaoPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object qSessaoDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object qSessaoPago: TCurrencyField
      FieldName = 'Pago'
    end
    object qSessaoNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 50
    end
    object qSessaoFuncI: TStringField
      FieldName = 'FuncI'
      Size = 30
    end
    object qSessaoFuncF: TStringField
      FieldName = 'FuncF'
      Size = 30
    end
    object qSessaoObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object qSessaoTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object qSessaoCaixaI: TIntegerField
      FieldName = 'CaixaI'
    end
    object qSessaoCaixaF: TIntegerField
      FieldName = 'CaixaF'
    end
    object qSessaoTicksI: TIntegerField
      FieldName = 'TicksI'
    end
    object qSessaoPausado: TBooleanField
      FieldName = 'Pausado'
    end
    object qSessaoInicioPausa: TIntegerField
      FieldName = 'InicioPausa'
    end
    object qSessaoMinTicksUsados: TIntegerField
      FieldName = 'MinTicksUsados'
    end
    object qSessaoMinTicksTotal: TIntegerField
      FieldName = 'MinTicksTotal'
    end
    object qSessaoFimTicksUsados: TIntegerField
      FieldName = 'FimTicksUsados'
    end
    object qSessaoFimTicksTotal: TIntegerField
      FieldName = 'FimTicksTotal'
    end
    object qSessaoStrPausas: TMemoField
      FieldName = 'StrPausas'
      BlobType = ftMemo
    end
    object qSessaoStrTransfMaq: TMemoField
      FieldName = 'StrTransfMaq'
      BlobType = ftMemo
    end
    object qSessaoStrFechamentoCaixa: TMemoField
      FieldName = 'StrFechamentoCaixa'
      BlobType = ftMemo
    end
    object qSessaoMinutosCli: TFloatField
      FieldName = 'MinutosCli'
    end
    object qSessaoMinutosPrev: TFloatField
      FieldName = 'MinutosPrev'
    end
    object qSessaoMinutosMax: TFloatField
      FieldName = 'MinutosMax'
    end
    object qSessaoMinutosCliU: TFloatField
      FieldName = 'MinutosCliU'
    end
    object qSessaoValorCli: TCurrencyField
      FieldName = 'ValorCli'
    end
    object qSessaoValorCliU: TFloatField
      FieldName = 'ValorCliU'
    end
    object qSessaoTranI: TIntegerField
      FieldName = 'TranI'
    end
    object qSessaoTranF: TIntegerField
      FieldName = 'TranF'
    end
    object qSessaoPermitirDownload: TBooleanField
      FieldName = 'PermitirDownload'
    end
    object qSessaoVersaoRegistro: TIntegerField
      FieldName = 'VersaoRegistro'
    end
    object qSessaoCartaoTempo: TBooleanField
      FieldName = 'CartaoTempo'
    end
    object qSessaoHP1: TIntegerField
      FieldName = 'HP1'
    end
    object qSessaoHP2: TIntegerField
      FieldName = 'HP2'
    end
    object qSessaoHP3: TIntegerField
      FieldName = 'HP3'
    end
    object qSessaoHP4: TIntegerField
      FieldName = 'HP4'
    end
    object qSessaoHP5: TIntegerField
      FieldName = 'HP5'
    end
    object qSessaoHP6: TIntegerField
      FieldName = 'HP6'
    end
    object qSessaoHP7: TIntegerField
      FieldName = 'HP7'
    end
    object qSessaoRG: TStringField
      FieldKind = fkLookup
      FieldName = 'RG'
      LookupDataSet = tCli
      LookupKeyFields = 'ID'
      LookupResultField = 'RG'
      KeyFields = 'Cliente'
      Lookup = True
    end
    object qSessaoCPF: TStringField
      FieldKind = fkLookup
      FieldName = 'CPF'
      LookupDataSet = tCli
      LookupKeyFields = 'ID'
      LookupResultField = 'CPF'
      KeyFields = 'Cliente'
      Lookup = True
    end
    object qSessaoEndereco: TStringField
      FieldKind = fkLookup
      FieldName = 'Endereco'
      LookupDataSet = tCli
      LookupKeyFields = 'ID'
      LookupResultField = 'Endereco'
      KeyFields = 'Cliente'
      Size = 50
      Lookup = True
    end
    object qSessaoBairro: TStringField
      FieldKind = fkLookup
      FieldName = 'Bairro'
      LookupDataSet = tCli
      LookupKeyFields = 'ID'
      LookupResultField = 'Bairro'
      KeyFields = 'Cliente'
      Size = 30
      Lookup = True
    end
    object qSessaoDataNasc: TDateField
      FieldKind = fkLookup
      FieldName = 'DataNasc'
      LookupDataSet = tCli
      LookupKeyFields = 'ID'
      LookupResultField = 'DataNasc'
      KeyFields = 'Cliente'
      Lookup = True
    end
    object qSessaoCEP: TStringField
      FieldKind = fkLookup
      FieldName = 'CEP'
      LookupDataSet = tCli
      LookupKeyFields = 'ID'
      LookupResultField = 'CEP'
      KeyFields = 'Cliente'
      Size = 9
      Lookup = True
    end
    object qSessaoUF: TStringField
      FieldKind = fkLookup
      FieldName = 'UF'
      LookupDataSet = tCli
      LookupKeyFields = 'ID'
      LookupResultField = 'UF'
      KeyFields = 'Cliente'
      Size = 2
      Lookup = True
    end
    object qSessaoTelefone: TStringField
      FieldKind = fkLookup
      FieldName = 'Telefone'
      LookupDataSet = tCli
      LookupKeyFields = 'ID'
      LookupResultField = 'Telefone'
      KeyFields = 'Cliente'
      Lookup = True
    end
    object qSessaoCelular: TStringField
      FieldKind = fkLookup
      FieldName = 'Celular'
      LookupDataSet = tCli
      LookupKeyFields = 'ID'
      LookupResultField = 'Celular'
      KeyFields = 'Cliente'
      Lookup = True
    end
    object qSessaoCidade: TStringField
      FieldKind = fkLookup
      FieldName = 'Cidade'
      LookupDataSet = tCli
      LookupKeyFields = 'ID'
      LookupResultField = 'Cidade'
      KeyFields = 'Cliente'
      Size = 30
      Lookup = True
    end
    object qSessaoEmail: TStringField
      FieldKind = fkLookup
      FieldName = 'Email'
      LookupDataSet = tCli
      LookupKeyFields = 'ID'
      LookupResultField = 'Email'
      KeyFields = 'Cliente'
      Size = 50
      Lookup = True
    end
    object qSessaoUsername: TStringField
      FieldKind = fkLookup
      FieldName = 'Username'
      LookupDataSet = tCli
      LookupKeyFields = 'ID'
      LookupResultField = 'Username'
      KeyFields = 'Cliente'
      Size = 30
      Lookup = True
    end
    object qSessaoIPs: TnxMemoField
      FieldName = 'IPs'
      BlobType = ftMemo
    end
  end
  object dsSessao: TDataSource
    DataSet = qSessao
    Left = 592
    Top = 296
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
  object qFatPre: TnxQuery
    Database = nxDB
    Timeout = 120000
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      'select '
      '  Tipo,'
      '  IDPacPass,'
      '  Count(ID) as Quant,'
      '  Sum(Total-Desconto) as Valor'
      'from '
      '  Tempo'
      'where'
      
        '  (Caixa >= :CaixaI) and (Caixa <= :CaixaF) and ((not Cancelado)' +
        ' or (Cancelado is null)) and (( not FidResgate) or (FidResgate i' +
        's null))'
      'group by'
      '  Tipo, IDPacPass')
    Left = 368
    Top = 320
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
    object qFatPreTipo: TWordField
      FieldName = 'Tipo'
    end
    object qFatPreIDPacPass: TIntegerField
      FieldName = 'IDPacPass'
    end
    object qFatPreQuant: TLargeintField
      FieldName = 'Quant'
    end
    object qFatPreValor: TCurrencyField
      FieldName = 'Valor'
    end
  end
  object qFatPos: TnxQuery
    Database = nxDB
    Timeout = 120000
    FilterOptions = [foCaseInsensitive]
    OnCalcFields = qFatPosCalcFields
    SQL.Strings = (
      'select '
      '  Count(*) as Quant,'
      '  Sum(TotLiq) as Valor'
      'from '
      '  ITran'
      'where'
      
        '   (Caixa >= :CaixaI) and (Caixa <= :CaixaF) and (Cancelado = Fa' +
        'lse) and (TipoTran=1) and (TipoItem=0) and (TotLiq>0)')
    Left = 360
    Top = 376
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
    object qFatPosQuant: TLargeintField
      FieldName = 'Quant'
    end
    object qFatPosValor: TCurrencyField
      FieldName = 'Valor'
    end
  end
  object mtFatPrePos: TkbmMemTable
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
    Left = 440
    Top = 368
    object mtFatPrePosTipo: TStringField
      FieldName = 'Tipo'
      Size = 40
    end
    object mtFatPrePosQuant: TIntegerField
      FieldName = 'Quant'
    end
    object mtFatPrePosValor: TCurrencyField
      FieldName = 'Valor'
    end
  end
  object tTipoPass: TnxTable
    Database = nxDB
    TableName = 'TipoPass'
    IndexName = 'IID'
    Left = 528
    Top = 344
    object tTipoPassID: TAutoIncField
      FieldName = 'ID'
    end
    object tTipoPassNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
  end
  object tPacote: TnxTable
    Database = nxDB
    TableName = 'Pacote'
    IndexName = 'IID'
    Left = 528
    Top = 400
    object tPacoteID: TAutoIncField
      FieldName = 'ID'
    end
    object tPacoteDescr: TStringField
      FieldName = 'Descr'
      Size = 30
    end
  end
  object dsPrePos: TDataSource
    DataSet = mtFatPrePos
    Left = 440
    Top = 328
  end
  object qEstSearchQtd: TnxQuery
    Database = nxDB
    SQL.Strings = (
      'Select SearchEng,  Sum(Qtd) as Qtd from'
      '('
      
        '  SELECT Sessao, SearchEng, Count(Distinct(SearchArg)) as Qtd FR' +
        'OM "LogUrl"'
      '  where (SearchEng>'#39#39') and (Caixa=:Caixa)'
      '  group by sessao, searcheng'
      ') Sub'
      'group by SearchEng')
    Left = 160
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Caixa'
        ParamType = ptInput
      end>
    object qEstSearchQtdSearchEng: TStringField
      FieldName = 'SearchEng'
      Size = 2
    end
    object qEstSearchQtdQtd: TLargeintField
      FieldName = 'Qtd'
    end
  end
  object qEstSearchPag: TnxQuery
    Database = nxDB
    SQL.Strings = (
      'select SearchEng, sum(Qtd) as Qtd from '
      '('
      '  SELECT Sessao, SearchEng, Count(ID) as Qtd FROM "LogUrl"'
      '  where (SearchEng>'#39#39') and (Caixa=:Caixa)'
      '  group by sessao, searcheng'
      ') subQ'
      'group by SearchEng')
    Left = 160
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Caixa'
        ParamType = ptInput
      end>
    object qEstSearchPagSearchEng: TStringField
      FieldName = 'SearchEng'
      Size = 2
    end
    object qEstSearchPagQtd: TLargeintField
      FieldName = 'Qtd'
    end
  end
  object qEstUrl: TnxQuery
    Database = nxDB
    SQL.Strings = (
      'select sum(qtd) as qtd from '
      '('
      
        '  SELECT sessao, Host, Count(distinct(Pagina)) as Qtd FROM "LogU' +
        'rl"'
      '  where caixa=:caixa'
      '  group by sessao, host'
      ') sub')
    Left = 224
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'caixa'
        ParamType = ptInput
      end>
    object qEstUrlqtd: TLargeintField
      FieldName = 'qtd'
    end
  end
  object qEstSessoes: TnxQuery
    Database = nxDB
    SQL.Strings = (
      'select sum(minutosr) as tempo, count(id) as qtd from sessao'
      'where (caixaf=:caixa) and (minutosr>0.2) and (tipocli<>2)')
    Left = 232
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'caixa'
        ParamType = ptInput
      end>
    object qEstSessoestempo: TFloatField
      FieldName = 'tempo'
    end
    object qEstSessoesqtd: TLargeintField
      FieldName = 'qtd'
    end
  end
  object qEstRes: TnxQuery
    Database = nxDB
    SQL.Strings = (
      'select DisplayWH, Count(Numero) as qtd from Maquina'
      'group by DisplayWH')
    Left = 288
    Top = 328
    object qEstResDisplayWH: TStringField
      FieldName = 'DisplayWH'
      Size = 10
    end
    object qEstResqtd: TLargeintField
      FieldName = 'qtd'
    end
  end
  object qManut: TnxQuery
    Database = nxDB
    Timeout = 120000
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      'select '
      '  Func,'
      '  Count(Distinct(Sessao)) as Quant,'
      '  Sum(MinutosU) as MinutosU'
      'from '
      '  Ocupacao'
      'where'
      '     (TipoCli=2) and (Caixa >= :CaixaI) and (Caixa <= :CaixaF)'
      'group by'
      '  Func')
    Left = 136
    Top = 216
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
    object qManutFunc: TStringField
      FieldName = 'Func'
    end
    object qManutQuant: TLargeintField
      FieldName = 'Quant'
    end
    object qManutMinutosU: TFloatField
      FieldName = 'MinutosU'
    end
  end
  object dsManut: TDataSource
    DataSet = qManut
    Left = 136
    Top = 267
  end
  object frdbEst: TfrxDBDataset
    UserName = 'frdbEst'
    CloseDataSource = False
    DataSet = mtEst
    BCDToCurrency = False
    Left = 480
    Top = 16
  end
  object frdbImp: TfrxDBDataset
    UserName = 'frdbImp'
    CloseDataSource = False
    DataSet = mtImp
    BCDToCurrency = False
    Left = 464
    Top = 96
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
    Left = 408
    Top = 88
  end
  object qRFPag: TnxQuery
    Database = nxDB
    Timeout = 120000
    SQL.Strings = (
      'select'
      '  TipoTran,'
      '  TipoItem,'
      '  Sum(Total) as Total,'
      '  Sum(Desconto) as Desconto,'
      '  Sum(Pago) as Pago,'
      '  Sum(Debito) as Debito'
      'from '
      '  ITran'
      'where'
      
        '  (CaixaPag >= :CaixaI) and (CaixaPag <= :CaixaF) and ((Cancelad' +
        'o is Null) or (not Cancelado))'
      'group by'
      '  TipoTran,'
      '  TipoItem')
    Left = 208
    Top = 176
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
    object qRFPagTipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object qRFPagTipoItem: TWordField
      FieldName = 'TipoItem'
    end
    object qRFPagTotal: TCurrencyField
      FieldName = 'Total'
    end
    object qRFPagDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object qRFPagPago: TCurrencyField
      FieldName = 'Pago'
    end
    object qRFPagDebito: TCurrencyField
      FieldName = 'Debito'
    end
  end
  object qCred: TnxQuery
    Database = nxDB
    Timeout = 120000
    SQL.Strings = (
      'select'
      '  Sum(Credito) as Credito'
      'from '
      '  Tran'
      'where'
      
        '  (CaixaPag >= :CaixaI) and (CaixaPag <= :CaixaF) and ((Cancelad' +
        'o is Null) or (not Cancelado))'
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
    object qCredCredito: TCurrencyField
      FieldName = 'Credito'
    end
  end
end
