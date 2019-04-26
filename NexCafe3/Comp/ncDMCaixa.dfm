object dmCaixa: TdmCaixa
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 466
  Width = 678
  object nxSession: TnxSession
    ActiveDesigntime = True
    UserName = 'admin'
    Password = 'delphi9856'
    Timeout = 120000
    ServerEngine = nxRSE
    Left = 24
    Top = 16
  end
  object nxDB: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession
    AliasName = 'NexCafe'
    Left = 80
    Top = 16
  end
  object nxRSE: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxTCPIP
    Left = 136
    Top = 16
  end
  object nxTCPIP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    MaxBytesPerSecond = 0
    PingTime = 0
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
      '     (Cancelado <> True) and'
      '     (FidResgate <> True)'
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
      Size = 40
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
  object qTempo: TnxQuery
    Database = nxDB
    Timeout = 120000
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      'select '
      '  Maq,'
      '  Sum(MinutosU) as MinutosU, '
      '  Sum(MinutosP) as MinutosP '
      'from '
      '  Ocupacao'
      'where'
      '     (TipoCli=0) and (Caixa >= :CaixaI) and (Caixa <= :CaixaF)'
      'group by'
      '  Maq')
    Left = 192
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
    object qTempoMaq: TIntegerField
      FieldName = 'Maq'
    end
    object qTempoMinutosU: TFloatField
      FieldName = 'MinutosU'
    end
    object qTempoMinutosP: TFloatField
      FieldName = 'MinutosP'
    end
    object qTempoQuant: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Quant'
      LookupDataSet = qAuxTempo
      LookupKeyFields = 'Maq'
      LookupResultField = 'Quant'
      KeyFields = 'Maq'
      Lookup = True
    end
  end
  object dsTempo: TDataSource
    DataSet = qTempo
    Left = 192
    Top = 144
  end
  object qHora: TnxQuery
    Database = nxDB
    Timeout = 120000
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      'select '
      '  Hora,'
      '  Sum(MinutosU) as MinutosU, '
      '  Sum(MinutosP) as MinutosP '
      'from '
      '  Ocupacao'
      'where'
      '     (TipoCli=0) and (Caixa >= :CaixaI) and (Caixa <= :CaixaF)'
      'group by'
      '  Hora')
    Left = 136
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
    object qHoraHora: TWordField
      FieldName = 'Hora'
    end
    object qHoraMinutosU: TFloatField
      FieldName = 'MinutosU'
    end
    object qHoraMinutosP: TFloatField
      FieldName = 'MinutosP'
    end
    object qHoraQuant: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Quant'
      LookupDataSet = qAuxHora
      LookupKeyFields = 'Hora'
      LookupResultField = 'Quant'
      KeyFields = 'Hora'
      Lookup = True
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
    object qManutFunc: TStringField
      FieldName = 'Func'
    end
    object qManutMinutosU: TFloatField
      FieldName = 'MinutosU'
    end
    object qManutQuant: TFloatField
      FieldName = 'Quant'
    end
  end
  object dsManut: TDataSource
    DataSet = qManut
    Left = 136
    Top = 275
  end
  object dsHora: TDataSource
    DataSet = qHora
    Left = 136
    Top = 144
  end
  object mtEst: TkbmMemTable
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
        Size = 40
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
      Size = 40
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
  object qRF: TnxQuery
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
      
        '  (Caixa >= :CaixaI) and (Caixa <= :CaixaF) and (Cancelado=False' +
        ')'
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
    object qRFTipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object qRFTipoItem: TWordField
      FieldName = 'TipoItem'
    end
    object qRFTotal: TCurrencyField
      FieldName = 'Total'
    end
    object qRFDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object qRFPago: TCurrencyField
      FieldName = 'Pago'
    end
    object qRFDebito: TCurrencyField
      FieldName = 'Debito'
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
      '  (Cancelado <> True) and ((Tipo = 9) or (Tipo = 10)) and'
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
      
        '  (Cancelado <> True) and (Caixa >= :CaixaI) and (Caixa <= :Caix' +
        'aF) and (Desconto > 0.001)')
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
      end>
    object qDescTotal: TCurrencyField
      FieldName = 'Total'
    end
    object qDescQuant: TFloatField
      FieldName = 'Quant'
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
      
        '  (Cancelado = True) and (Caixa >= :CaixaI) and (Caixa <= :Caixa' +
        'F)')
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
      end>
    object qCancTotal: TCurrencyField
      FieldName = 'Total'
    end
    object qCancQuant: TFloatField
      FieldName = 'Quant'
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
    object qGratisQuant: TFloatField
      FieldName = 'Quant'
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
    Version = '3.18'
    DataSet = frdbCaixa
    DataSetName = 'frdbCaixa'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 39015.443900231490000000
    ReportOptions.LastChange = 39015.683403888900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Shape2OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <frdbTot."Item"> in [4, 8] then'
      '    Shape2.Color := $00E5E5E5 else'
      '    Shape2.Color := clWhite;'
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
      '  if <frdbTot."Item"> > 9 then'
      '    Memo16.Font.Color := clRed else'
      '    Memo16.Font.Style := clBlack;'
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
      'begin'
      ''
      'end.')
    ShowProgress = False
    Left = 248
    Top = 16
    Datasets = <
      item
        DataSet = frdbCaixa
        DataSetName = 'frdbCaixa'
      end
      item
        DataSet = frdbTot
        DataSetName = 'frdbTot'
      end>
    Variables = <>
    Style = <>
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
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Align = baLeft
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
          Left = 668.598857000000100000
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
          Top = 22.677180000000000000
          Width = 740.409927000000000000
          Frame.Color = clGray
          Frame.Typ = [ftTop]
        end
      end
      object MasterData2: TfrxMasterData
        Height = 22.677180000000000000
        Top = 105.826840000000000000
        Width = 740.409927000000000000
        RowCount = 1
        object Subreport1: TfrxSubreport
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = repCaixa.Page2
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
        Height = 79.370130000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Shape1: TfrxShapeView
          Align = baBottom
          Top = 52.913420000000000000
          Width = 740.409927000000000000
          Height = 26.456710000000000000
          Color = 15066597
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
        Height = 26.456692910000000000
        Top = 120.944960000000000000
        Width = 740.409927000000000000
        DataSet = frdbTot
        DataSetName = 'frdbTot'
        RowCount = 0
        object Shape2: TfrxShapeView
          Align = baClient
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
          Memo.UTF8 = (
            '[frdbTot."Descricao"]')
          VAlign = vaCenter
        end
        object Line7: TfrxLineView
          Left = 207.874150000000000000
          Height = 26.456692910000000000
          OnBeforePrint = 'Line7OnBeforePrint'
          Frame.Typ = [ftLeft]
        end
        object Line8: TfrxLineView
          Left = 313.700990000000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          Left = 419.527830000000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          Left = 525.354670000000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft]
        end
        object Line11: TfrxLineView
          Left = 631.181510000000000000
          Height = 26.456692910000000000
          Frame.Typ = [ftLeft]
        end
        object Memo12: TfrxMemoView
          Left = 211.653680000000000000
          Top = 3.779530000000000000
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
          Top = 3.779530000000000000
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
          Top = 3.779530000000000000
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
          Top = 3.779530000000000000
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
          Top = 3.779530000000000000
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
    end
  end
  object PDFexp: TfrxPDFExport
    ShowDialog = False
    FileName = 'c:\meus programas\caixa.pdf'
    UseFileCache = True
    ShowProgress = False
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Background = False
    Creator = 'FastReport (http://www.fast-report.com)'
    HTMLTags = True
    Left = 304
    Top = 16
  end
  object frdbCaixa: TfrxDBDataset
    Description = 'Caixa'
    RangeBegin = rbCurrent
    RangeEnd = reCurrent
    UserName = 'frdbCaixa'
    CloseDataSource = False
    DataSet = tCaixa
    Left = 368
    Top = 16
  end
  object frdbTot: TfrxDBDataset
    Description = 'Resumo Financeiro'
    UserName = 'frdbTot'
    CloseDataSource = False
    DataSet = mtTot
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
  object qTempoCli: TnxQuery
    Database = nxDB
    Timeout = 120000
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      'select '
      '  Cliente,'
      '  Count(Distinct(Sessao)) as Quant'
      'from '
      '  Ocupacao'
      'where'
      '   (TipoCli=0) and (Caixa >= :CaixaI) and (Caixa <= :CaixaF)'
      'group by'
      '  cliente')
    Left = 560
    Top = 80
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
    object qTempoCliCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object qTempoCliQuant: TFloatField
      FieldName = 'Quant'
    end
  end
  object dsTotCli: TDataSource
    DataSet = mtTotCli
    Left = 32
    Top = 376
  end
  object qAuxTempoCli: TnxQuery
    Database = nxDB
    Timeout = 120000
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      'select '
      '  Cliente,'
      '  Sum(MinutosU) as MinutosU, '
      '  Sum(MinutosP) as MinutosP '
      'from '
      '  Ocupacao'
      'where'
      '   (TipoCli=0) and (Caixa >= :CaixaI) and (Caixa <= :CaixaF)'
      'group by'
      '  cliente')
    Left = 496
    Top = 72
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
    object qAuxTempoCliCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object qAuxTempoCliMinutosU: TFloatField
      FieldName = 'MinutosU'
    end
    object qAuxTempoCliMinutosP: TFloatField
      FieldName = 'MinutosP'
    end
  end
  object qAuxTempo: TnxQuery
    Database = nxDB
    Timeout = 120000
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      'select '
      '  Maq,'
      '  Count(Distinct(Sessao)) as Quant'
      'from '
      '  Ocupacao'
      'where'
      '     (TipoCli=0) and (Caixa >= :CaixaI) and (Caixa <= :CaixaF)'
      'group by'
      '  Maq')
    Left = 496
    Top = 152
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
    object IntegerField2: TIntegerField
      FieldName = 'Maq'
    end
    object FloatField5: TFloatField
      FieldName = 'Quant'
    end
  end
  object qAuxHora: TnxQuery
    Database = nxDB
    Timeout = 120000
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      'select '
      '  Hora,'
      '  Count(Distinct(Sessao)) as Quant'
      'from '
      '  Ocupacao'
      'where'
      '     (TipoCli=0) and (Caixa >= :CaixaI) and (Caixa <= :CaixaF)'
      'group by'
      '  Hora')
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
    object WordField1: TWordField
      FieldName = 'Hora'
    end
    object FloatField6: TFloatField
      FieldName = 'Quant'
    end
  end
  object mtImp: TkbmMemTable
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
    IndexName = 'ICaixa'
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
  object qTUsado: TnxQuery
    Database = nxDB
    Timeout = 120000
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      'SELECT MinutosR From Sessao'
      'where'
      '     (TipoCli=0) and (CaixaF >= :CaixaI) and (CaixaF <= :CaixaF)')
    Left = 472
    Top = 16
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
    object qTUsadoMinutosR: TFloatField
      FieldName = 'MinutosR'
    end
  end
  object dsTU: TDataSource
    DataSet = mtTU
    Left = 560
    Top = 16
  end
  object mtTU: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Tempo'
        DataType = ftInteger
      end
      item
        Name = 'Quant'
        DataType = ftInteger
      end>
    IndexFieldNames = 'Tempo'
    IndexName = 'mtTUIndex1'
    IndexDefs = <
      item
        Name = 'mtTUIndex1'
        Fields = 'Tempo'
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
    OnCalcFields = mtTUCalcFields
    Left = 520
    Top = 16
    object mtTUTempo: TIntegerField
      FieldName = 'Tempo'
    end
    object mtTUQuant: TIntegerField
      FieldName = 'Quant'
    end
    object mtTUPerc: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Perc'
      DisplayFormat = '0.##'
      Calculated = True
    end
  end
  object qSessao: TnxQuery
    Database = nxDB
    Timeout = 120000
    SQL.Strings = (
      'select * from Sessao'
      'where ( ((CaixaI >= :CaixaI) and (CaixaI<= :CaixaF)) or'
      '             ((CaixaF >= :CaixaI) and (CaixaF <= :CaixaF)) )'
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
      
        '  (Caixa >= :CaixaI) and (Caixa <= :CaixaF) and (Cancelado=False' +
        ') and (FidResgate=False)'
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
    object qFatPreValor: TCurrencyField
      FieldName = 'Valor'
    end
    object qFatPreQuant: TFloatField
      FieldName = 'Quant'
    end
  end
  object qFatPos: TnxQuery
    Database = nxDB
    Timeout = 120000
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      'select '
      '  Count(ID) as Quant,'
      '  Sum(Total-Desconto) as Valor'
      'from '
      '  ITran'
      'where'
      
        '   (Caixa >= :CaixaI) and (Caixa <= :CaixaF) and (TipoTran=1) an' +
        'd (TipoItem=0) and'
      '   ((Total-Desconto)>0)')
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
    object qFatPosQuant: TFloatField
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
  object qCliValor: TnxQuery
    Database = nxDB
    Timeout = 120000
    SQL.Strings = (
      'select cliente, sum(pago) as valor'
      '  from tran'
      
        '  where (Caixa>=:CaixaI) and (Caixa<=:CaixaF) and (Cancelado=Fal' +
        'se) and (Tipo<>5) and'
      
        '             (Tipo<>6) and (Tipo<>7) and (Tipo<>9) and (Tipo<>10' +
        ') and (Tipo<>14)'
      '  group by cliente')
    Left = 416
    Top = 80
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
    object qCliValorcliente: TIntegerField
      FieldName = 'cliente'
    end
    object qCliValorvalor: TCurrencyField
      FieldName = 'valor'
    end
  end
  object mtTotCli: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
    IndexName = 'mtTotCliIndex1'
    IndexDefs = <
      item
        Name = 'mtTotCliIndex1'
        Fields = 'Cliente'
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
    Left = 32
    Top = 328
    object mtTotCliCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object mtTotCliQuant: TFloatField
      FieldName = 'Quant'
    end
    object mtTotCliMinutosU: TFloatField
      FieldName = 'MinutosU'
    end
    object mtTotCliMinutosP: TFloatField
      FieldName = 'MinutosP'
    end
    object mtTotCliNomeCli: TStringField
      FieldName = 'NomeCli'
      Size = 50
    end
    object mtTotCliValor: TCurrencyField
      FieldName = 'Valor'
      LookupDataSet = qCliValor
      LookupKeyFields = 'cliente'
      LookupResultField = 'valor'
      KeyFields = 'Cliente'
    end
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
      ')'
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
    object qEstSearchQtdQtd: TFloatField
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
      ')'
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
    object qEstSearchPagQtd: TFloatField
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
      ')')
    Left = 224
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'caixa'
        ParamType = ptInput
      end>
    object qEstUrlqtd: TFloatField
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
    object qEstSessoesqtd: TFloatField
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
    object qEstResqtd: TFloatField
      FieldName = 'qtd'
    end
  end
end
