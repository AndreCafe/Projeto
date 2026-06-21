object dmComp: TdmComp
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 565
  Width = 790
  object dbTran: TfrxDBDataset
    RangeBegin = rbCurrent
    RangeEnd = reCurrent
    UserName = 'dbTran'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'DataHora=DataHora'
      'Cliente=Cliente'
      'Tipo=Tipo'
      'Func=Func'
      'Total=Total'
      'Desconto=Desconto'
      'Pago=Pago'
      'Debito=Debito'
      'Obs=Obs'
      'Cancelado=Cancelado'
      'CanceladoPor=CanceladoPor'
      'CanceladoEm=CanceladoEm'
      'Caixa=Caixa'
      'Maq=Maq'
      'NomeCliente=NomeCliente'
      'Sessao=Sessao'
      'Descr=Descr'
      'NomeTipo=NomeTipo'
      'TotLiq=TotLiq'
      'DebitoAnt=DebitoAnt'
      'DebitoPago=DebitoPago'
      'CreditoAnt=CreditoAnt'
      'Credito=Credito'
      'CreditoUsado=CreditoUsado'
      'Troco=Troco'
      'CaixaPag=CaixaPag'
      'QtdTempo=QtdTempo'
      'CredValor=CredValor'
      'PagPend=PagPend')
    DataSet = tTran
    BCDToCurrency = False
    Left = 24
    Top = 144
  end
  object dbITran: TfrxDBDataset
    UserName = 'dbITran'
    CloseDataSource = False
    DataSet = tITran
    BCDToCurrency = False
    Left = 80
    Top = 144
  end
  object dsItran: TDataSource
    DataSet = Dados.tbTran
    Left = 80
    Top = 80
  end
  object dsTran: TDataSource
    DataSet = Dados.tbTran
    Left = 24
    Top = 80
  end
  object tTran: TnxTable
    Database = Dados.db
    OnCalcFields = tTranCalcFields
    TableName = 'Tran'
    IndexName = 'IID'
    Left = 24
    Top = 24
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
    object tTranTipoPago: TWordField
      FieldName = 'TipoPago'
    end
    object tTranDebito: TCurrencyField
      FieldName = 'Debito'
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
    object tTranNomeTipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeTipo'
      Size = 50
      Calculated = True
    end
    object tTranTotLiq: TCurrencyField
      FieldName = 'TotLiq'
    end
    object tTranDebitoAnt: TCurrencyField
      FieldName = 'DebitoAnt'
    end
    object tTranDebitoPago: TCurrencyField
      FieldName = 'DebitoPago'
    end
    object tTranCreditoAnt: TCurrencyField
      FieldName = 'CreditoAnt'
    end
    object tTranCredito: TCurrencyField
      FieldName = 'Credito'
    end
    object tTranCreditoUsado: TCurrencyField
      FieldName = 'CreditoUsado'
    end
    object tTranTroco: TCurrencyField
      FieldName = 'Troco'
    end
    object tTranCaixaPag: TIntegerField
      FieldName = 'CaixaPag'
    end
    object tTranQtdTempo: TFloatField
      FieldName = 'QtdTempo'
    end
    object tTranCredValor: TBooleanField
      FieldName = 'CredValor'
    end
    object tTranPagPend: TBooleanField
      FieldName = 'PagPend'
    end
  end
  object tITran: TnxTable
    Database = Dados.db
    OnCalcFields = tITranCalcFields
    TableName = 'ITran'
    IndexName = 'ITranID'
    Left = 80
    Top = 24
    object tITranID: TAutoIncField
      FieldName = 'ID'
    end
    object tITranTran: TIntegerField
      FieldName = 'Tran'
    end
    object tITranCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tITranSessao: TIntegerField
      FieldName = 'Sessao'
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
    object tITranDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object tITranPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tITranCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tITranNomeTipoItem: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeTipoItem'
      Size = 30
      Calculated = True
    end
    object tITranPgAnt: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'PgAnt'
      Calculated = True
    end
    object tITranDescrItem: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescrItem'
      Size = 100
      Calculated = True
    end
    object tITranDescrPg: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescrPg'
      Size = 80
      Calculated = True
    end
    object tITranValorOriginal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorOriginal'
      Calculated = True
    end
    object tITranDescAnt: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'DescAnt'
      Calculated = True
    end
    object tITranDataOrig: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'DataOrig'
      Calculated = True
    end
    object tITranQuant: TStringField
      FieldKind = fkCalculated
      FieldName = 'Quant'
      Size = 50
      Calculated = True
    end
    object tITranQuantUnid: TStringField
      FieldKind = fkCalculated
      FieldName = 'QuantUnid'
      Size = 60
      Calculated = True
    end
    object tITranUnitario: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Unitario'
      Calculated = True
    end
  end
  object repSerial: TfrxReport
    Version = '5.5.11'
    DotMatrixReport = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Generic Text'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38823.643521608800000000
    ReportOptions.LastChange = 41617.563664548600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure ReportSummary1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <dbTran."Troco"> < 0.01 then begin'
      '    meTrocoP.Visible := False;'
      '    meTroco.Visible := False;'
      '  end;'
      '  if <dbTran."Credito"> < 0.01 then begin'
      '    meCreditoP.Visible := False;'
      '    meCredito.Visible := False;'
      '  end;      '
      '  if <dbTran."Debito"> < 0.01 then begin'
      '    meDebitadoP.Visible := False;'
      '    meDebitado.Visible := False;'
      '  end;  '
      'end;'
      ''
      'begin'
      ''
      'end.')
    ShowProgress = False
    Left = 360
    Top = 32
    Datasets = <
      item
        DataSet = dbCliente
        DataSetName = 'dbCliente'
      end
      item
        DataSet = dbConfig
        DataSetName = 'dbConfig'
      end
      item
        DataSet = dbITran
        DataSetName = 'dbITran'
      end
      item
        DataSet = dbProduto
        DataSetName = 'dbProduto'
      end
      item
        DataSet = dbTran
        DataSetName = 'dbTran'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxDMPPage
      PaperWidth = 121.919921260050900000
      PaperHeight = 359.833100941122300000
      PaperSize = 256
      LeftMargin = 2.539998359584390000
      RightMargin = 2.539998359584390000
      EndlessHeight = True
      FontStyle = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 17.000000000000000000
        Top = 204.000000000000000000
        Width = 441.600000000000000000
        DataSet = dbITran
        DataSetName = 'dbITran'
        RowCount = 0
        Stretched = True
        object DMPMemo13: TfrxDMPMemoView
          Align = baLeft
          Width = 307.200000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[dbITran."QuantUnid"] X [dbITran."DescrItem"]')
          WordWrap = False
          TruncOutboundText = True
        end
        object DMPMemo15: TfrxDMPMemoView
          Left = 307.200000000000000000
          Width = 134.400000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          FontStyle = []
          Memo.UTF8 = (
            ' = [dbITran."Total"]')
          ParentFont = False
          WordWrap = False
          TruncOutboundText = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 153.000000000000000000
        Top = 17.000000000000000000
        Width = 441.600000000000000000
        object DMPMemo16: TfrxDMPMemoView
          Align = baLeft
          Width = 268.800000000000000000
          Height = 17.000000000000000000
          FontStyle = []
          Memo.UTF8 = (
            '[dbConfig."RecNomeLoja"]')
          ParentFont = False
          TruncOutboundText = False
        end
        object DMPMemo17: TfrxDMPMemoView
          Align = baLeft
          Left = 268.800000000000000000
          Width = 172.800000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy hh:mm'
          DisplayFormat.Kind = fkDateTime
          FontStyle = []
          Memo.UTF8 = (
            ' [dbTran."DataHora"]')
          ParentFont = False
          WordWrap = False
          TruncOutboundText = False
        end
        object DMPMemo18: TfrxDMPMemoView
          Top = 34.000000000000000000
          Width = 441.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'CLIENTE: [dbTran."NomeCliente"]')
          TruncOutboundText = False
        end
        object DMPMemo19: TfrxDMPMemoView
          Top = 51.000000000000000000
          Width = 441.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'FUNC---: [dbTran."Func"]')
          TruncOutboundText = False
        end
        object DMPMemo20: TfrxDMPMemoView
          Align = baWidth
          Top = 102.000000000000000000
          Width = 441.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '==============================================')
          WordWrap = False
          TruncOutboundText = True
        end
        object DMPMemo21: TfrxDMPMemoView
          Align = baWidth
          Top = 85.000000000000000000
          Width = 441.600000000000000000
          Height = 17.000000000000000000
          FontStyle = []
          Memo.UTF8 = (
            '[dbTran."NomeTipo"] - No.:[dbTran."ID"]')
          ParentFont = False
          TruncOutboundText = False
        end
        object DMPMemo23: TfrxDMPMemoView
          Align = baWidth
          Top = 136.000000000000000000
          Width = 441.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '==============================================')
          WordWrap = False
          TruncOutboundText = True
        end
        object DMPMemo24: TfrxDMPMemoView
          Top = 119.000000000000000000
          Width = 201.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'Quant. X Produto')
          TruncOutboundText = False
        end
        object DMPMemo25: TfrxDMPMemoView
          Left = 316.800000000000000000
          Top = 119.000000000000000000
          Width = 124.800000000000000000
          Height = 17.000000000000000000
          FontStyle = []
          Memo.UTF8 = (
            'VALOR')
          ParentFont = False
          TruncOutboundText = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 204.000000000000000000
        Top = 255.000000000000000000
        Width = 441.600000000000000000
        OnBeforePrint = 'ReportSummary1OnBeforePrint'
        Stretched = True
        object DMPMemo2: TfrxDMPMemoView
          Align = baWidth
          Top = 136.000000000000000000
          Width = 441.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            
              '================================================================' +
              '=========================')
          TruncOutboundText = False
        end
        object DMPMemo3: TfrxDMPMemoView
          Align = baLeft
          Top = 17.000000000000000000
          Width = 153.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'SUB-TOTAL ======')
          WordWrap = False
          TruncOutboundText = False
        end
        object DMPMemo4: TfrxDMPMemoView
          Align = baLeft
          Top = 34.000000000000000000
          Width = 153.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'DESCONTOS ======')
          WordWrap = False
          TruncOutboundText = False
        end
        object DMPMemo5: TfrxDMPMemoView
          Align = baLeft
          Top = 68.000000000000000000
          Width = 153.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'TOTAL PAGO =====')
          WordWrap = False
          TruncOutboundText = False
        end
        object DMPMemo6: TfrxDMPMemoView
          Align = baLeft
          Top = 51.000000000000000000
          Width = 153.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'TOTAL A PAGAR ==')
          WordWrap = False
          TruncOutboundText = False
        end
        object meDebitadoP: TfrxDMPMemoView
          Align = baLeft
          Top = 119.000000000000000000
          Width = 153.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'VALOR DEBITADO =')
          WordWrap = False
          TruncOutboundText = False
        end
        object DMPMemo8: TfrxDMPMemoView
          Left = 153.600000000000000000
          Top = 17.000000000000000000
          Width = 134.400000000000000000
          Height = 17.000000000000000000
          DataSet = dbTran
          DataSetName = 'dbTran'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          FontStyle = []
          Memo.UTF8 = (
            '[dbTran."Total"]')
          ParentFont = False
          TruncOutboundText = False
        end
        object DMPMemo9: TfrxDMPMemoView
          Left = 153.600000000000000000
          Top = 34.000000000000000000
          Width = 134.400000000000000000
          Height = 17.000000000000000000
          DataSet = dbTran
          DataSetName = 'dbTran'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          FontStyle = []
          Memo.UTF8 = (
            '[dbTran."Desconto"]')
          ParentFont = False
          TruncOutboundText = False
        end
        object DMPMemo10: TfrxDMPMemoView
          Left = 153.600000000000000000
          Top = 51.000000000000000000
          Width = 134.400000000000000000
          Height = 17.000000000000000000
          DataSet = dbTran
          DataSetName = 'dbTran'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          FontStyle = []
          Memo.UTF8 = (
            '[dbTran."Total"]')
          ParentFont = False
          TruncOutboundText = False
        end
        object DMPMemo26: TfrxDMPMemoView
          Left = 153.600000000000000000
          Top = 68.000000000000000000
          Width = 134.400000000000000000
          Height = 17.000000000000000000
          DataSet = dbTran
          DataSetName = 'dbTran'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          FontStyle = []
          Memo.UTF8 = (
            '[dbTran."Pago"]')
          ParentFont = False
          TruncOutboundText = False
        end
        object meDebitado: TfrxDMPMemoView
          Left = 153.600000000000000000
          Top = 119.000000000000000000
          Width = 134.400000000000000000
          Height = 17.000000000000000000
          DataSet = dbTran
          DataSetName = 'dbTran'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          FontStyle = []
          Memo.UTF8 = (
            '[dbTran."Debito"]')
          ParentFont = False
          TruncOutboundText = False
        end
        object DMPMemo1: TfrxDMPMemoView
          Top = 170.000000000000000000
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          StretchMode = smActualHeight
          Memo.UTF8 = (
            '[dbConfig."RecRodape"]')
          WordWrap = False
          TruncOutboundText = False
        end
        object DMPMemo11: TfrxDMPMemoView
          Align = baWidth
          Width = 441.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            
              '================================================================' +
              '=========================')
          TruncOutboundText = False
        end
        object meTrocoP: TfrxDMPMemoView
          Align = baLeft
          Top = 85.000000000000000000
          Width = 153.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'TROCO ==========')
          WordWrap = False
          TruncOutboundText = False
        end
        object meTroco: TfrxDMPMemoView
          Left = 153.600000000000000000
          Top = 85.000000000000000000
          Width = 134.400000000000000000
          Height = 17.000000000000000000
          DataSet = dbTran
          DataSetName = 'dbTran'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          FontStyle = []
          Memo.UTF8 = (
            '[dbTran."Troco"]')
          ParentFont = False
          TruncOutboundText = False
        end
        object meCreditoP: TfrxDMPMemoView
          Align = baLeft
          Top = 102.000000000000000000
          Width = 153.600000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'CREDITADO ======')
          WordWrap = False
          TruncOutboundText = False
        end
        object meCredito: TfrxDMPMemoView
          Left = 153.600000000000000000
          Top = 102.000000000000000000
          Width = 134.400000000000000000
          Height = 17.000000000000000000
          DataSet = dbTran
          DataSetName = 'dbTran'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          FontStyle = []
          Memo.UTF8 = (
            '[dbTran."Credito"]')
          ParentFont = False
          TruncOutboundText = False
        end
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 144
    Top = 88
  end
  object tRec: TnxTable
    Database = Dados.db
    TableName = 'Recibo'
    IndexName = 'ICliente'
    Left = 144
    Top = 144
    object tRecID: TAutoIncField
      FieldName = 'ID'
    end
    object tRecCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tRecTran: TIntegerField
      FieldName = 'Tran'
    end
  end
  object tAuxTran: TnxTable
    Database = Dados.db
    TableName = 'Tran'
    IndexName = 'IID'
    Left = 24
    Top = 208
    object tAuxTranID: TAutoIncField
      FieldName = 'ID'
    end
    object tAuxTranDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tAuxTranCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tAuxTranTipo: TWordField
      FieldName = 'Tipo'
    end
    object tAuxTranFunc: TStringField
      FieldName = 'Func'
    end
    object tAuxTranTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tAuxTranDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tAuxTranPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tAuxTranDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object tAuxTranObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tAuxTranCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tAuxTranCanceladoPor: TStringField
      FieldName = 'CanceladoPor'
      Size = 30
    end
    object tAuxTranCanceladoEm: TDateTimeField
      FieldName = 'CanceladoEm'
    end
    object tAuxTranCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tAuxTranMaq: TWordField
      FieldName = 'Maq'
    end
    object tAuxTranNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 50
    end
    object tAuxTranSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tAuxTranTipoPago: TWordField
      FieldName = 'TipoPago'
    end
    object tAuxTranDescr: TStringField
      FieldName = 'Descr'
      Size = 50
    end
  end
  object txtExp: TfrxTXTExport
    ShowDialog = False
    FileName = 'C:\Documents and Settings\IBM\Desktop\teste.prn'
    UseFileCache = True
    ShowProgress = False
    OverwritePrompt = False
    DataOnly = False
    ScaleWidth = 0.750000000000000000
    ScaleHeight = 1.000000000000000000
    Borders = False
    Pseudogrpahic = False
    PageBreaks = False
    OEMCodepage = False
    EmptyLines = False
    LeadSpaces = False
    PrintAfter = False
    PrinterDialog = True
    UseSavedProps = True
    Left = 144
    Top = 208
  end
  object tSessao: TnxTable
    Database = Dados.db
    TableName = 'Sessao'
    IndexName = 'IID'
    Left = 216
    Top = 144
    object tSessaoID: TAutoIncField
      FieldName = 'ID'
    end
    object tSessaoInicio: TDateTimeField
      FieldName = 'Inicio'
    end
    object tSessaoTermino: TDateTimeField
      FieldName = 'Termino'
    end
    object tSessaoMinutosR: TFloatField
      FieldName = 'MinutosR'
    end
    object tSessaoMinutosC: TFloatField
      FieldName = 'MinutosC'
    end
    object tSessaoMaq: TWordField
      FieldName = 'Maq'
    end
    object tSessaoMaqI: TWordField
      FieldName = 'MaqI'
    end
    object tSessaoEncerrou: TBooleanField
      FieldName = 'Encerrou'
    end
    object tSessaoCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tSessaoTransfMaq: TBooleanField
      FieldName = 'TransfMaq'
    end
    object tSessaoTipoCli: TWordField
      FieldName = 'TipoCli'
    end
    object tSessaoCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tSessaoTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tSessaoDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tSessaoPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object tSessaoDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object tSessaoPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tSessaoNomeCliente: TStringField
      FieldName = 'NomeCliente'
      Size = 50
    end
    object tSessaoFuncI: TStringField
      FieldName = 'FuncI'
      Size = 30
    end
    object tSessaoFuncF: TStringField
      FieldName = 'FuncF'
      Size = 30
    end
    object tSessaoObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tSessaoTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object tSessaoCaixaI: TIntegerField
      FieldName = 'CaixaI'
    end
    object tSessaoCaixaF: TIntegerField
      FieldName = 'CaixaF'
    end
    object tSessaoTicksI: TIntegerField
      FieldName = 'TicksI'
    end
    object tSessaoPausado: TBooleanField
      FieldName = 'Pausado'
    end
    object tSessaoInicioPausa: TIntegerField
      FieldName = 'InicioPausa'
    end
    object tSessaoMinTicksUsados: TIntegerField
      FieldName = 'MinTicksUsados'
    end
    object tSessaoMinTicksTotal: TIntegerField
      FieldName = 'MinTicksTotal'
    end
    object tSessaoFimTicksUsados: TIntegerField
      FieldName = 'FimTicksUsados'
    end
    object tSessaoFimTicksTotal: TIntegerField
      FieldName = 'FimTicksTotal'
    end
    object tSessaoStrPausas: TMemoField
      FieldName = 'StrPausas'
      BlobType = ftMemo
    end
    object tSessaoStrTransfMaq: TMemoField
      FieldName = 'StrTransfMaq'
      BlobType = ftMemo
    end
    object tSessaoStrFechamentoCaixa: TMemoField
      FieldName = 'StrFechamentoCaixa'
      BlobType = ftMemo
    end
    object tSessaoMinutosCli: TFloatField
      FieldName = 'MinutosCli'
    end
    object tSessaoMinutosPrev: TFloatField
      FieldName = 'MinutosPrev'
    end
    object tSessaoMinutosMax: TFloatField
      FieldName = 'MinutosMax'
    end
    object tSessaoMinutosCliU: TFloatField
      FieldName = 'MinutosCliU'
    end
    object tSessaoValorCli: TCurrencyField
      FieldName = 'ValorCli'
    end
    object tSessaoValorCliU: TFloatField
      FieldName = 'ValorCliU'
    end
    object tSessaoTranI: TIntegerField
      FieldName = 'TranI'
    end
    object tSessaoTranF: TIntegerField
      FieldName = 'TranF'
    end
  end
  object tMovEst: TnxTable
    Database = Dados.db
    TableName = 'MovEst'
    IndexName = 'IID'
    Left = 216
    Top = 208
    object tMovEstID: TAutoIncField
      FieldName = 'ID'
    end
    object tMovEstTran: TIntegerField
      FieldName = 'Tran'
    end
    object tMovEstProduto: TIntegerField
      FieldName = 'Produto'
    end
    object tMovEstQuant: TFloatField
      FieldName = 'Quant'
    end
    object tMovEstUnitario: TCurrencyField
      FieldName = 'Unitario'
    end
    object tMovEstTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tMovEstCustoU: TCurrencyField
      FieldName = 'CustoU'
    end
    object tMovEstItem: TWordField
      FieldName = 'Item'
    end
    object tMovEstDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tMovEstPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tMovEstPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object tMovEstDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object tMovEstDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tMovEstEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object tMovEstCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tMovEstEstoqueAnt: TFloatField
      FieldName = 'EstoqueAnt'
    end
    object tMovEstCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tMovEstCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tMovEstCategoria: TStringField
      FieldName = 'Categoria'
    end
    object tMovEstNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object tMovEstITran: TIntegerField
      FieldName = 'ITran'
    end
    object tMovEstTipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object tMovEstSessao: TIntegerField
      FieldName = 'Sessao'
    end
  end
  object tTempo: TnxTable
    Database = Dados.db
    TableName = 'Tempo'
    IndexName = 'IID'
    Left = 216
    Top = 80
    object tTempoID: TAutoIncField
      FieldName = 'ID'
    end
    object tTempoDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tTempoFunc: TStringField
      FieldName = 'Func'
    end
    object tTempoTipo: TWordField
      FieldName = 'Tipo'
    end
    object tTempoMinutos: TFloatField
      FieldName = 'Minutos'
    end
    object tTempoIDPacPass: TIntegerField
      FieldName = 'IDPacPass'
    end
    object tTempoPassaporte: TIntegerField
      FieldName = 'Passaporte'
    end
    object tTempoTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tTempoDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tTempoPagoPost: TCurrencyField
      FieldName = 'PagoPost'
    end
    object tTempoDescPost: TCurrencyField
      FieldName = 'DescPost'
    end
    object tTempoPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tTempoCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object tTempoMaq: TWordField
      FieldName = 'Maq'
    end
    object tTempoSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tTempoCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
    object tTempoTran: TIntegerField
      FieldName = 'Tran'
    end
    object tTempoCaixa: TIntegerField
      FieldName = 'Caixa'
    end
  end
  object tImp: TnxTable
    Database = Dados.db
    TableName = 'Impressao'
    IndexName = 'IID'
    Left = 216
    Top = 24
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
  end
  object tAuxITran: TnxTable
    Database = Dados.db
    TableName = 'ITran'
    IndexFieldNames = 'TipoItem;ItemID;Tran'
    Left = 24
    Top = 264
    object tAuxITranID: TAutoIncField
      FieldName = 'ID'
    end
    object tAuxITranTran: TIntegerField
      FieldName = 'Tran'
    end
    object tAuxITranCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tAuxITranSessao: TIntegerField
      FieldName = 'Sessao'
    end
    object tAuxITranDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object tAuxITranTipoTran: TWordField
      FieldName = 'TipoTran'
    end
    object tAuxITranTipoItem: TWordField
      FieldName = 'TipoItem'
    end
    object tAuxITranSubTipo: TWordField
      FieldName = 'SubTipo'
    end
    object tAuxITranItemID: TIntegerField
      FieldName = 'ItemID'
    end
    object tAuxITranSubItemID: TIntegerField
      FieldName = 'SubItemID'
    end
    object tAuxITranItemPos: TWordField
      FieldName = 'ItemPos'
    end
    object tAuxITranTotal: TCurrencyField
      FieldName = 'Total'
    end
    object tAuxITranDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object tAuxITranDebito: TCurrencyField
      FieldName = 'Debito'
    end
    object tAuxITranPago: TCurrencyField
      FieldName = 'Pago'
    end
    object tAuxITranCancelado: TBooleanField
      FieldName = 'Cancelado'
    end
  end
  object tPro: TnxTable
    Database = Dados.db
    Timeout = 10000
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    TableName = 'Produto'
    IndexName = 'IID'
    Left = 80
    Top = 208
    object tProCodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
      Size = 15
    end
    object tProUnid: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'Unid'
      Size = 5
    end
    object tProPreco: TCurrencyField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'Preco'
    end
    object tProObs: TMemoField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tProImagem: TGraphicField
      FieldName = 'Imagem'
      BlobType = ftGraphic
    end
    object tProEstoqueAtual: TFloatField
      FieldName = 'EstoqueAtual'
    end
    object tProCustoUnitario: TCurrencyField
      FieldName = 'CustoUnitario'
    end
    object tProEstoqueACE: TFloatField
      FieldName = 'EstoqueACE'
    end
    object tProEstoqueACS: TFloatField
      FieldName = 'EstoqueACS'
    end
    object tProEstoqueFinal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'EstoqueFinal'
      Calculated = True
    end
    object tProDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object tProCategoria: TStringField
      FieldName = 'Categoria'
      Size = 35
    end
    object tProSubCateg: TStringField
      FieldName = 'SubCateg'
      Size = 35
    end
    object tProPodeAlterarPreco: TBooleanField
      FieldName = 'PodeAlterarPreco'
    end
    object tProNaoControlaEstoque: TBooleanField
      FieldName = 'NaoControlaEstoque'
    end
    object tProID: TAutoIncField
      FieldName = 'ID'
    end
  end
  object dbConfig: TfrxDBDataset
    UserName = 'dbConfig'
    CloseDataSource = False
    DataSet = Dados.tbConfig
    BCDToCurrency = False
    Left = 88
    Top = 264
  end
  object repWin: TfrxReport
    Version = '5.5.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 38825.568748067100000000
    ReportOptions.Name = 'NEXCAFE_RECIBO'
    ReportOptions.LastChange = 41557.654348449080000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo13OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if ((<Line> mod 2) = 1) then'
      '    Memo13.Color := $00F5F5F5 else'
      '    Memo13.Color := $00E9E9E9;'
      'end;'
      ''
      'procedure ReportSummary1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <dbTran."Troco"> = 0 then begin'
      '//    meTrocoP.Visible := False;'
      '//    meTroco.Visible := False;'
      
        '//    lineTroco.Visible := False;                               ' +
        '                                               '
      '  end;'
      '  if <dbTran."Credito"> = 0 then begin'
      '    meCreditoP.Visible := False;'
      '    meCredito.Visible := False;'
      
        '    lineCredito.Visible := False;                               ' +
        '                                               '
      '  end;      '
      '  if <dbTran."Debito"> = 0 then begin'
      '    meDebitadoP.Visible := False;'
      '    meDebitado.Visible := False;'
      
        '    lineDebitado.Visible := False;                              ' +
        '                                                '
      '  end;      '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 144
    Top = 264
    Datasets = <
      item
        DataSet = dbCliente
        DataSetName = 'dbCliente'
      end
      item
        DataSet = dbConfig
        DataSetName = 'dbConfig'
      end
      item
        DataSet = dbITran
        DataSetName = 'dbITran'
      end
      item
        DataSet = dbProduto
        DataSetName = 'dbProduto'
      end
      item
        DataSet = dbTran
        DataSetName = 'dbTran'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 136.063080000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Width = 347.716760000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dbConfig."RecNomeLoja"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Top = 37.795300000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            'Cliente: ')
        end
        object Memo3: TfrxMemoView
          Left = 52.913420000000000000
          Top = 37.795300000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[dbTran."NomeCliente"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baRight
          Left = 502.677490000000000000
          Top = 37.795300000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'Funcion'#195#161'rio: [dbTran."Func"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Top = 64.252010000000000000
          Width = 393.071120000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[dbTran."NomeTipo"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Align = baRight
          Left = 487.559370000000000000
          Top = 68.031540000000010000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'N.Transa'#195#167#195#163'o: [dbTran."ID"]')
        end
        object Memo8: TfrxMemoView
          Align = baRight
          Left = 427.086890000000000000
          Top = 3.779530000000001000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Data / Hora da Transa'#195#167#195#163'o: [dbTran."DataHora"]')
        end
        object Memo9: TfrxMemoView
          Top = 113.385900000000000000
          Width = 468.661720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            'Quantidade X Descri'#195#167#195#163'o')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Align = baRight
          Left = 604.724800000000000000
          Top = 113.385900000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            'Valor Total')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 476.220780000000000000
          Top = 113.385900000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            'Valor Unit'#195#161'rio')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 215.433210000000000000
        Width = 718.110700000000000000
        DataSet = dbITran
        DataSetName = 'dbITran'
        RowCount = 0
        object Memo13: TfrxMemoView
          Align = baClient
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          OnBeforePrint = 'Memo13OnBeforePrint'
        end
        object Memo15: TfrxMemoView
          Align = baRight
          Left = 476.220875200000000000
          Top = 3.779529999999994000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'Unitario'
          DataSet = dbITran
          DataSetName = 'dbITran'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[dbITran."Unitario"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Align = baRight
          Left = 604.724895200000000000
          Top = 3.779529999999994000
          Width = 113.385804800000000000
          Height = 18.897650000000000000
          DataField = 'Total'
          DataSet = dbITran
          DataSetName = 'dbITran'
          HAlign = haRight
          Memo.UTF8 = (
            '[dbITran."Total"]')
        end
        object Rich1: TfrxRichView
          Top = 3.779530000000000000
          Width = 472.441005910000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6465
            666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C5C66636861
            727365743020417269616C3B7D7B5C66315C666E696C205461686F6D613B7D7D
            0D0A7B5C2A5C67656E657261746F72204D7366746564697420352E34312E3135
            2E313531353B7D5C766965776B696E64345C7563315C706172645C6673323020
            5B6462495472616E2E225175616E74556E6964225D205C6220585C623020205B
            6462495472616E2E2244657363724974656D225D5C66315C667331365C706172
            0D0A7D0D0A00}
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 204.094620000000000000
        Top = 302.362400000000000000
        Width = 718.110700000000000000
        OnBeforePrint = 'ReportSummary1OnBeforePrint'
        Stretched = True
        object Line2: TfrxLineView
          Left = 496.338900000000000000
          Top = 41.574830000000000000
          Width = 222.992270000000000000
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Left = 496.338900000000000000
          Top = 68.031540000000000000
          Width = 222.992270000000000000
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          Left = 497.338900000000000000
          Top = 94.488250000000000000
          Width = 222.992270000000000000
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Memo19: TfrxMemoView
          Left = 498.897960000000000000
          Top = 18.897650000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Sub-Total')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 497.338900000000000000
          Top = 120.944960000000000000
          Width = 222.992270000000000000
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Memo20: TfrxMemoView
          Left = 498.897960000000000000
          Top = 45.354360000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Descontos')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 498.897960000000000000
          Top = 71.811070000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Total a Pagar')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 498.897960000000000000
          Top = 98.267780000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Valor Pago')
          ParentFont = False
        end
        object meDebitadoP: TfrxMemoView
          Left = 498.897637800000000000
          Top = 151.724490000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Valor Debitado')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 604.724409450000000000
          Top = 18.897650000000000000
          Width = 109.228490230000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[dbTran."Total"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 604.724800000000000000
          Top = 45.354360000000000000
          Width = 109.228490230000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[dbTran."Desconto"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 604.724800000000000000
          Top = 71.811070000000000000
          Width = 109.228490230000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[<dbTran."Total">-<dbTran."Desconto">]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 604.724800000000000000
          Top = 98.267780000000000000
          Width = 109.228490230000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[dbTran."Pago"]')
          ParentFont = False
        end
        object meDebitado: TfrxMemoView
          Left = 604.724409450000000000
          Top = 151.724490000000000000
          Width = 109.228490230000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[dbTran."Debito"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Align = baWidth
          Top = 15.118119999999980000
          Width = 498.897960000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Memo.UTF8 = (
            '[dbConfig."RecRodape"]')
        end
        object Line5: TfrxLineView
          Left = 496.354670000000000000
          Top = 15.118120000000000000
          Width = 222.992270000000000000
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object lineDebitado: TfrxLineView
          Left = 496.251968500000000000
          Top = 174.401670000000000000
          Width = 222.992270000000000000
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object meTrocoP: TfrxMemoView
          Left = 498.897637800000000000
          Top = 124.724490000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<dbTran."Troco"> <= 0'
          Highlight.FillType = ftBrush
          Memo.UTF8 = (
            'Troco')
          ParentFont = False
        end
        object meTroco: TfrxMemoView
          Left = 604.724409450000000000
          Top = 124.724490000000000000
          Width = 109.228490230000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '<dbTran."Troco"> <= 0'
          Highlight.FillType = ftBrush
          Memo.UTF8 = (
            '[dbTran."Troco"]')
          ParentFont = False
        end
        object lineTroco: TfrxLineView
          Left = 496.118430000000000000
          Top = 147.401670000000000000
          Width = 222.992270000000000000
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object meCreditoP: TfrxMemoView
          Left = 498.897637800000000000
          Top = 177.637910000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Creditado')
          ParentFont = False
        end
        object meCredito: TfrxMemoView
          Left = 604.724409450000000000
          Top = 177.637910000000000000
          Width = 109.228490230000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[dbTran."Credito"]')
          ParentFont = False
        end
        object lineCredito: TfrxLineView
          Left = 496.251968500000000000
          Top = 200.315090000000000000
          Width = 222.992270000000000000
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object repWinFS: TfrxReport
    Version = '5.5.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 38825.568748067100000000
    ReportOptions.Name = 'NEXCAFE_RECIBO'
    ReportOptions.LastChange = 41816.737371712960000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo13OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '      if ((<Line> mod 2) = 1) then'
      '    Memo13.Color := $00F5F5F5 else'
      '    Memo13.Color := $00E9E9E9;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 216
    Top = 264
    Datasets = <
      item
        DataSet = dbCliente
        DataSetName = 'dbCliente'
      end
      item
        DataSet = dbConfig
        DataSetName = 'dbConfig'
      end
      item
        DataSet = dbITran
        DataSetName = 'dbITran'
      end
      item
        DataSet = dbProduto
        DataSetName = 'dbProduto'
      end
      item
        DataSet = dbTran
        DataSetName = 'dbTran'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 136.063080000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Width = 347.716760000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dbConfig."RecNomeLoja"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Top = 37.795300000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            'Cliente: ')
        end
        object Memo3: TfrxMemoView
          Left = 52.913420000000000000
          Top = 37.795300000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[dbTran."NomeCliente"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baRight
          Left = 487.559370000000000000
          Top = 37.795300000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'Funcion'#195#161'rio: [dbTran."Func"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Top = 64.252010000000000000
          Width = 393.071120000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[dbTran."NomeTipo"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Align = baRight
          Left = 487.559370000000000000
          Top = 68.031540000000010000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'N.Transa'#195#167#195#163'o: [dbTran."ID"]')
        end
        object Memo8: TfrxMemoView
          Align = baRight
          Left = 427.086890000000000000
          Top = 3.779530000000001000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Data / Hora da Transa'#195#167#195#163'o: [dbTran."DataHora"]')
        end
        object Memo9: TfrxMemoView
          Top = 113.385900000000000000
          Width = 476.220780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            'Quantidade X Descri'#195#167#195#163'o')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Align = baRight
          Left = 589.606680000000000000
          Top = 113.385900000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'Valor Total')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 215.433210000000000000
        Width = 718.110700000000000000
        DataSet = dbITran
        DataSetName = 'dbITran'
        RowCount = 0
        object Memo13: TfrxMemoView
          Align = baClient
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          OnBeforePrint = 'Memo13OnBeforePrint'
        end
        object Memo15: TfrxMemoView
          Align = baRight
          Left = 589.606680000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = 'ValorOriginal'
          DataSet = dbITran
          DataSetName = 'dbITran'
          HAlign = haCenter
          Memo.UTF8 = (
            '[dbITran."ValorOriginal"]')
        end
        object Rich1: TfrxRichView
          Width = 472.441005910000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6465
            666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C5C66636861
            727365743020417269616C3B7D7B5C66315C666E696C205461686F6D613B7D7D
            0D0A7B5C2A5C67656E657261746F72204D7366746564697420352E34312E3135
            2E313531353B7D5C766965776B696E64345C7563315C706172645C6673323020
            5B6462495472616E2E225175616E74556E6964225D205C6220585C623020205B
            6462495472616E2E2244657363724974656D225D5C66315C667331365C706172
            0D0A7D0D0A00}
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 215.433210000000000000
        Top = 302.362400000000000000
        Width = 718.110700000000000000
        Stretched = True
        object Memo18: TfrxMemoView
          Left = 604.724800000000000000
          Top = 15.118119999999980000
          Width = 113.385826770000000000
          Height = 132.283550000000000000
        end
        object Shape1: TfrxShapeView
          Left = 438.425480000000000000
          Top = 15.118120000000000000
          Width = 279.307267000000000000
          Height = 162.519790000000000000
          Frame.Color = clSilver
        end
        object Line2: TfrxLineView
          Left = 439.102660000000000000
          Top = 41.574830000000000000
          Width = 279.685220000000000000
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Left = 439.102660000000000000
          Top = 98.031540000000000000
          Width = 279.685220000000000000
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          Left = 439.102660000000000000
          Top = 124.488250000000000000
          Width = 279.685220000000000000
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Memo19: TfrxMemoView
          Left = 442.205010000000000000
          Top = 18.897650000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Sub-Total')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 439.102660000000000000
          Top = 150.944960000000000000
          Width = 279.685220000000000000
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Memo20: TfrxMemoView
          Left = 442.205010000000000000
          Top = 75.354360000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Descontos')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 442.205010000000000000
          Top = 101.811070000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Total Final a Pagar')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 442.205010000000000000
          Top = 128.267780000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Total Final Pago')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 442.205010000000000000
          Top = 154.724490000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Valor Debitado')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 594.504207950000000000
          Top = 18.897650000000000000
          Width = 116.787550230000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<dbITran."ValorOriginal">,MasterData1)]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 594.504330000000000000
          Top = 75.354360000000000000
          Width = 116.787550230000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<dbITran."DescAnt">,MasterData1) + SUM(<dbITran."Desconto">' +
              ',MasterData1)]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 594.504330000000000000
          Top = 101.811070000000000000
          Width = 116.787550230000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<dbITran."ValorOriginal">,MasterData1) - SUM(<dbITran."Desc' +
              'Ant">,MasterData1) - SUM(<dbITran."Desconto">,MasterData1) - SUM' +
              '(<dbITran."PgAnt">,MasterData1)]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 594.504330000000000000
          Top = 128.267780000000000000
          Width = 116.787550230000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<dbITran."Pago">,MasterData1)]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 594.504330000000000000
          Top = 154.724490000000000000
          Width = 116.787550230000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[dbTran."Debito"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Align = baWidth
          Top = 15.118119999999980000
          Width = 438.425480000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Memo.UTF8 = (
            '[dbConfig."RecRodape"]')
        end
        object Line5: TfrxLineView
          Left = 438.425480000000000000
          Top = 71.811070000000000000
          Width = 279.685220000000000000
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Memo4: TfrxMemoView
          Left = 442.205010000000000000
          Top = 49.133890000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Pago Antecipadamente')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 594.504330000000000000
          Top = 49.133890000000000000
          Width = 116.787550230000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<dbITran."PgAnt">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object repSerialFS: TfrxReport
    Version = '5.5.11'
    DotMatrixReport = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 38823.643521608800000000
    ReportOptions.LastChange = 41416.939210995370000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    ShowProgress = False
    Left = 288
    Top = 24
    Datasets = <
      item
        DataSet = dbConfig
        DataSetName = 'dbConfig'
      end
      item
        DataSet = dbITran
        DataSetName = 'dbITran'
      end
      item
        DataSet = dbTran
        DataSetName = 'dbTran'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxDMPPage
      PaperWidth = 101.599934383375700000
      PaperHeight = 359.833100941122300000
      PaperSize = 256
      FontStyle = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 51.000000000000000000
        Top = 221.000000000000000000
        Width = 384.000000000000000000
        DataSet = dbITran
        DataSetName = 'dbITran'
        RowCount = 0
        object DMPMemo11: TfrxDMPMemoView
          Align = baWidth
          Top = 34.000000000000000000
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            
              '----------------------------------------------------------------' +
              '-------------------------------------------------')
          TruncOutboundText = False
        end
        object DMPMemo12: TfrxDMPMemoView
          Align = baRight
          Left = 201.600000000000000000
          Top = 17.000000000000000000
          Width = 172.800000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            ' [dbITran."ValorOriginal"]')
          TruncOutboundText = False
        end
        object DMPMemo14: TfrxDMPMemoView
          Align = baWidth
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[dbITran."DescrItem"]')
          TruncOutboundText = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 170.000000000000000000
        Top = 17.000000000000000000
        Width = 384.000000000000000000
        object DMPMemo16: TfrxDMPMemoView
          Align = baWidth
          Width = 201.600000000000000000
          Height = 17.000000000000000000
          FontStyle = [fsxBold]
          Memo.UTF8 = (
            '[dbConfig."RecNomeLoja"]')
          ParentFont = False
          TruncOutboundText = False
        end
        object DMPMemo17: TfrxDMPMemoView
          Align = baRight
          Left = 201.600000000000000000
          Width = 172.800000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy hh:mm'
          DisplayFormat.Kind = fkDateTime
          HAlign = haRight
          Memo.UTF8 = (
            ' [dbTran."DataHora"]')
          TruncOutboundText = False
        end
        object DMPMemo18: TfrxDMPMemoView
          Top = 34.000000000000000000
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'CLIENTE: [dbTran."NomeCliente"]')
          TruncOutboundText = False
        end
        object DMPMemo19: TfrxDMPMemoView
          Top = 51.000000000000000000
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'FUNC---: [dbTran."Func"]')
          TruncOutboundText = False
        end
        object DMPMemo20: TfrxDMPMemoView
          Align = baWidth
          Top = 102.000000000000000000
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            
              '================================================================' +
              '==============================================')
          TruncOutboundText = False
        end
        object DMPMemo21: TfrxDMPMemoView
          Align = baWidth
          Top = 85.000000000000000000
          Width = 259.200000000000000000
          Height = 17.000000000000000000
          FontStyle = [fsxBold]
          Memo.UTF8 = (
            '[dbTran."NomeTipo"]')
          ParentFont = False
          TruncOutboundText = False
        end
        object DMPMemo22: TfrxDMPMemoView
          Align = baRight
          Left = 259.200000000000000000
          Top = 85.000000000000000000
          Width = 115.200000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            ' #[dbTran."ID"]')
          TruncOutboundText = False
        end
        object DMPMemo23: TfrxDMPMemoView
          Align = baWidth
          Top = 153.000000000000000000
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            
              '================================================================' +
              '=========================')
          TruncOutboundText = False
        end
        object DMPMemo24: TfrxDMPMemoView
          Top = 119.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'DESCRICAO')
          TruncOutboundText = False
        end
        object DMPMemo25: TfrxDMPMemoView
          Align = baRight
          Left = 259.200000000000000000
          Top = 136.000000000000000000
          Width = 115.200000000000000000
          Height = 17.000000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'VL.PAGAR')
          TruncOutboundText = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 153.000000000000000000
        Top = 306.000000000000000000
        Width = 384.000000000000000000
        Stretched = True
        object DMPMemo2: TfrxDMPMemoView
          Align = baWidth
          Top = 102.000000000000000000
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            
              '================================================================' +
              '=========================')
          TruncOutboundText = False
        end
        object DMPMemo3: TfrxDMPMemoView
          Align = baWidth
          Width = 240.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'SUB-TOTAL --------------:')
          WordWrap = False
          TruncOutboundText = False
        end
        object DMPMemo4: TfrxDMPMemoView
          Align = baWidth
          Top = 34.000000000000000000
          Width = 240.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'DESCONTOS --------------:')
          WordWrap = False
          TruncOutboundText = False
        end
        object DMPMemo5: TfrxDMPMemoView
          Align = baWidth
          Top = 68.000000000000000000
          Width = 240.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'TOTAL FINAL PAGO -------:')
          WordWrap = False
          TruncOutboundText = False
        end
        object DMPMemo6: TfrxDMPMemoView
          Align = baWidth
          Top = 51.000000000000000000
          Width = 240.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'TOTAL FINAL A PAGAR ----:')
          WordWrap = False
          TruncOutboundText = False
        end
        object DMPMemo7: TfrxDMPMemoView
          Align = baWidth
          Top = 85.000000000000000000
          Width = 240.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'VALOR DEBITADO ---------:')
          WordWrap = False
          TruncOutboundText = False
        end
        object DMPMemo8: TfrxDMPMemoView
          Align = baRight
          Left = 230.400000000000000000
          Width = 134.400000000000000000
          Height = 17.000000000000000000
          DataSet = dbTran
          DataSetName = 'dbTran'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<dbITran."ValorOriginal">,MasterData1)]')
          TruncOutboundText = False
        end
        object DMPMemo9: TfrxDMPMemoView
          Align = baRight
          Left = 230.400000000000000000
          Top = 34.000000000000000000
          Width = 134.400000000000000000
          Height = 17.000000000000000000
          DataSet = dbTran
          DataSetName = 'dbTran'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<dbITran."DescAnt">,MasterData1) + SUM(<dbITran."Desconto">' +
              ',MasterData1)]')
          TruncOutboundText = False
        end
        object DMPMemo10: TfrxDMPMemoView
          Align = baRight
          Left = 230.400000000000000000
          Top = 51.000000000000000000
          Width = 134.400000000000000000
          Height = 17.000000000000000000
          DataSet = dbTran
          DataSetName = 'dbTran'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<dbITran."ValorOriginal">,MasterData1) - SUM(<dbITran."Desc' +
              'Ant">,MasterData1) - SUM(<dbITran."Desconto">,MasterData1) - SUM' +
              '(<dbITran."PgAnt">,MasterData1)]')
          TruncOutboundText = False
        end
        object DMPMemo26: TfrxDMPMemoView
          Align = baRight
          Left = 230.400000000000000000
          Top = 68.000000000000000000
          Width = 134.400000000000000000
          Height = 17.000000000000000000
          DataSet = dbTran
          DataSetName = 'dbTran'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<dbITran."Pago">,MasterData1)]')
          TruncOutboundText = False
        end
        object DMPMemo27: TfrxDMPMemoView
          Align = baRight
          Left = 230.400000000000000000
          Top = 85.000000000000000000
          Width = 134.400000000000000000
          Height = 17.000000000000000000
          DataSet = dbTran
          DataSetName = 'dbTran'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[dbTran."Debito"]')
          TruncOutboundText = False
        end
        object DMPMemo1: TfrxDMPMemoView
          Top = 136.000000000000000000
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          StretchMode = smActualHeight
          Memo.UTF8 = (
            '[dbConfig."RecRodape"]')
          WordWrap = False
          TruncOutboundText = False
        end
        object DMPMemo13: TfrxDMPMemoView
          Align = baWidth
          Top = 17.000000000000000000
          Width = 240.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'PAGAMENTOS ANTECIPADOS -:')
          WordWrap = False
          TruncOutboundText = False
        end
        object DMPMemo15: TfrxDMPMemoView
          Align = baRight
          Left = 230.400000000000000000
          Top = 17.000000000000000000
          Width = 134.400000000000000000
          Height = 17.000000000000000000
          DataSet = dbTran
          DataSetName = 'dbTran'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<dbITran."PgAnt">,MasterData1)]')
          TruncOutboundText = False
        end
      end
    end
  end
  object ApdComPort1: TApdComPort
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    Left = 288
    Top = 104
  end
  object repWinBFS_OLD: TfrxReport
    Version = '5.5.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'MP-4200 TH'
    PrintOptions.PrintMode = pmScale
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 38823.643521608800000000
    ReportOptions.LastChange = 41417.012603449080000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    ShowProgress = False
    Left = 296
    Top = 248
    Datasets = <
      item
        DataSet = dbConfig
        DataSetName = 'dbConfig'
      end
      item
        DataSet = dbITran
        DataSetName = 'dbITran'
      end
      item
        DataSet = dbTran
        DataSetName = 'dbTran'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      PaperWidth = 74.000000000000000000
      PaperHeight = 150.000000000000000000
      PaperSize = 119
      LeftMargin = 2.000000000000000000
      RightMargin = 2.000000000000000000
      TopMargin = 2.000000000000000000
      BottomMargin = 2.000000000000000000
      BackPictureVisible = False
      BackPicturePrintable = False
      EndlessHeight = True
      LargeDesignHeight = True
      TitleBeforeHeader = False
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 31.597696270000000000
        Top = 170.078850000000000000
        Width = 264.567100000000000000
        DataSet = dbITran
        DataSetName = 'dbITran'
        RowCount = 0
        object DMPMemo14: TfrxMemoView
          Align = baWidth
          Width = 264.567100000000000000
          Height = 15.118110240000000000
          Memo.UTF8 = (
            '[dbITran."DescrItem"]')
        end
        object DMPMemo12: TfrxMemoView
          Align = baRight
          Left = 91.767100000000000000
          Top = 15.118110239999990000
          Width = 172.800000000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            ' [dbITran."ValorOriginal"]')
          WordWrap = False
        end
        object DMPMemo11: TfrxMemoView
          Align = baWidth
          Top = 30.236220472440950000
          Width = 264.567100000000000000
          Height = 3.779527559055118000
          GapY = -8.000000000000000000
          Memo.UTF8 = (
            
              '----------------------------------------------------------------' +
              '-------------------------------------------------')
          WordWrap = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 90.708661417322830000
        Top = 18.897650000000000000
        Width = 264.567100000000000000
        object DMPMemo16: TfrxMemoView
          Align = baWidth
          Width = 192.341812640000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dbConfig."RecNomeLoja"]')
          ParentFont = False
        end
        object DMPMemo17: TfrxMemoView
          Align = baRight
          Left = 192.341812640000000000
          Width = 72.225287360000000000
          Height = 34.241379310000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy hh:mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            ' [dbTran."DataHora"]')
          ParentFont = False
        end
        object DMPMemo18: TfrxMemoView
          Top = 15.118110240000000000
          Width = 384.000000000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'CLIENTE: [dbTran."NomeCliente"]')
          ParentFont = False
        end
        object DMPMemo19: TfrxMemoView
          Top = 30.236220470000000000
          Width = 384.000000000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'FUNC---: [dbTran."Func"]')
          ParentFont = False
        end
        object DMPMemo20: TfrxMemoView
          Align = baWidth
          Top = 60.472440940000000000
          Width = 264.567100000000000000
          Height = 7.559055120000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          GapY = -6.000000000000000000
          Memo.UTF8 = (
            
              '================================================================' +
              '==============================================')
          ParentFont = False
          WordWrap = False
        end
        object DMPMemo21: TfrxMemoView
          Align = baWidth
          Top = 45.354330710000000000
          Width = 149.367100000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dbTran."NomeTipo"]')
          ParentFont = False
        end
        object DMPMemo22: TfrxMemoView
          Align = baRight
          Left = 149.367100000000000000
          Top = 45.354330710000000000
          Width = 115.200000000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            ' #[dbTran."ID"]')
          ParentFont = False
          WordWrap = False
        end
        object DMPMemo23: TfrxMemoView
          Align = baWidth
          Top = 83.149606300000000000
          Width = 264.567100000000000000
          Height = 7.559055120000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          GapY = -4.000000000000000000
          Memo.UTF8 = (
            
              '================================================================' +
              '=========================')
          ParentFont = False
          WordWrap = False
        end
        object DMPMemo24: TfrxMemoView
          Left = 0.827586210000000000
          Top = 68.031496060000000000
          Width = 96.000000000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'DESCRI'#195#8225#195#402'O')
          ParentFont = False
        end
        object DMPMemo25: TfrxMemoView
          Align = baRight
          Left = 149.367100000000000000
          Top = 68.031496060000000000
          Width = 115.200000000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'VL.PAGAR')
          ParentFont = False
          WordWrap = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 109.543290000000000000
        Top = 260.787570000000000000
        Width = 264.567100000000000000
        Stretched = True
        object DMPMemo2: TfrxMemoView
          Align = baWidth
          Top = 76.000000000000000000
          Width = 264.567100000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            
              '================================================================' +
              '=========================')
          WordWrap = False
          Wysiwyg = False
        end
        object DMPMemo3: TfrxMemoView
          Align = baWidth
          Width = 130.167100000000000000
          Height = 15.118110240000000000
          Memo.UTF8 = (
            'SUB-TOTAL --------------------------')
          WordWrap = False
          Wysiwyg = False
        end
        object DMPMemo4: TfrxMemoView
          Align = baWidth
          Top = 15.118110240000020000
          Width = 130.167100000000000000
          Height = 15.118110240000000000
          Memo.UTF8 = (
            'DESCONTOS ----------------------------')
          WordWrap = False
          Wysiwyg = False
        end
        object DMPMemo5: TfrxMemoView
          Align = baWidth
          Top = 45.354330710000000000
          Width = 130.167100000000000000
          Height = 15.118110240000000000
          Memo.UTF8 = (
            'TOTAL PAGO ----------------------------------------')
          WordWrap = False
          Wysiwyg = False
        end
        object DMPMemo6: TfrxMemoView
          Align = baWidth
          Top = 30.236220469999980000
          Width = 130.167100000000000000
          Height = 15.118110240000000000
          Memo.UTF8 = (
            'TOTAL A PAGAR ----------------------------')
          WordWrap = False
          Wysiwyg = False
        end
        object DMPMemo7: TfrxMemoView
          Align = baWidth
          Top = 60.472440940000010000
          Width = 130.167100000000000000
          Height = 15.118110240000000000
          Memo.UTF8 = (
            'VALOR DEBITADO ----------------------------------------')
          WordWrap = False
          Wysiwyg = False
        end
        object DMPMemo8: TfrxMemoView
          Align = baRight
          Left = 130.167100000000000000
          Width = 134.400000000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataSet = dbTran
          DataSetName = 'dbTran'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<dbITran."ValorOriginal">,MasterData1)]')
          WordWrap = False
        end
        object DMPMemo9: TfrxMemoView
          Align = baRight
          Left = 130.167100000000000000
          Top = 15.118110240000000000
          Width = 134.400000000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataSet = dbTran
          DataSetName = 'dbTran'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<dbITran."DescAnt">,MasterData1) + SUM(<dbITran."Desconto">' +
              ',MasterData1)]')
          WordWrap = False
        end
        object DMPMemo10: TfrxMemoView
          Align = baRight
          Left = 130.167100000000000000
          Top = 30.236220470000000000
          Width = 134.400000000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataSet = dbTran
          DataSetName = 'dbTran'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<dbITran."ValorOriginal">,MasterData1) - SUM(<dbITran."Desc' +
              'Ant">,MasterData1) - SUM(<dbITran."Desconto">,MasterData1)]')
          WordWrap = False
        end
        object DMPMemo26: TfrxMemoView
          Align = baRight
          Left = 130.167100000000000000
          Top = 45.354330710000000000
          Width = 134.400000000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataSet = dbTran
          DataSetName = 'dbTran'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<dbITran."PgAnt">,MasterData1) + SUM(<dbITran."Pago">,Maste' +
              'rData1)]')
          WordWrap = False
        end
        object DMPMemo27: TfrxMemoView
          Align = baRight
          Left = 130.167100000000000000
          Top = 60.472440940000010000
          Width = 134.400000000000000000
          Height = 15.118110240000000000
          AutoWidth = True
          DataSet = dbTran
          DataSetName = 'dbTran'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[dbTran."Debito"]')
          WordWrap = False
        end
        object DMPMemo1: TfrxMemoView
          Top = 93.000000000000000000
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          StretchMode = smActualHeight
          Memo.UTF8 = (
            '[dbConfig."RecRodape"]')
        end
      end
    end
  end
  object repWinB: TfrxReport
    Version = '5.5.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 38825.568748067100000000
    ReportOptions.Name = 'NEXCAFE_RECIBO'
    ReportOptions.LastChange = 41551.574874803240000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure ReportSummary1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if <dbTran."Troco"> < 0.01 then begin'
      '    meTrocoP.Visible := False;'
      '    meTroco.Visible := False;'
      
        '    lineTroco.Visible := False;                                 ' +
        '                                             '
      '  end;'
      '  if <dbTran."Credito"> < 0.01 then begin'
      '    meCreditoP.Visible := False;'
      '    meCredito.Visible := False;'
      
        '    lineCredito.Visible := False;                               ' +
        '                                               '
      '  end;      '
      '  if <dbTran."Debito"> < 0.01 then begin'
      '    meDebitadoP.Visible := False;'
      '    meDebitado.Visible := False;'
      
        '    lineDebitado.Visible := False;                              ' +
        '                                                '
      '  end;  '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 304
    Top = 184
    Datasets = <
      item
        DataSet = dbCliente
        DataSetName = 'dbCliente'
      end
      item
        DataSet = dbConfig
        DataSetName = 'dbConfig'
      end
      item
        DataSet = dbITran
        DataSetName = 'dbITran'
      end
      item
        DataSet = dbProduto
        DataSetName = 'dbProduto'
      end
      item
        DataSet = dbTran
        DataSetName = 'dbTran'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 74.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      EndlessHeight = True
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 139.842610000000000000
        Top = 18.897650000000000000
        Width = 279.685220000000000000
        object Memo1: TfrxMemoView
          Align = baLeft
          Width = 211.653582360000000000
          Height = 26.456710000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dbConfig."RecNomeLoja"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 32.133890000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            'Cliente: ')
        end
        object Memo3: TfrxMemoView
          Left = 52.913420000000000000
          Top = 30.795300000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[dbTran."NomeCliente"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baLeft
          Top = 56.692949999999990000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Funcion'#195#161'rio: [dbTran."Func"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 1.000000000000000000
          Top = 80.252010000000000000
          Width = 393.071120000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[dbTran."NomeTipo"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Align = baRight
          Left = -229.551330000000000000
          Top = 82.031540000000010000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'N.Transa'#195#167#195#163'o: [dbTran."ID"]')
        end
        object Memo8: TfrxMemoView
          Align = baRight
          Left = 215.433258820000000000
          Width = 64.251961180000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[dbTran."DataHora"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Align = baWidth
          Top = 116.165430000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            'Qtd. X Descri'#195#167#195#163'o')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Align = baRight
          Left = 166.299320000000000000
          Top = 108.267780000000000000
          Width = 113.385900000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            'Unit'#195#161'rio'
            'Total')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 52.913402910000000000
        Top = 219.212740000000000000
        Width = 279.685220000000000000
        DataSet = dbITran
        DataSetName = 'dbITran'
        RowCount = 0
        Stretched = True
        object Line6: TfrxLineView
          Align = baWidth
          Top = 39.795300000000000000
          Width = 279.685220000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo4: TfrxMemoView
          Align = baRight
          Left = 196.535560000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataField = 'Unitario'
          DataSet = dbITran
          DataSetName = 'dbITran'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[dbITran."Unitario"]')
          ParentFont = False
        end
        object Rich1: TfrxRichView
          Align = baWidth
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6465
            666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C205461686F
            6D613B7D7D0D0A7B5C2A5C67656E657261746F72204D7366746564697420352E
            34312E31352E313531353B7D5C766965776B696E64345C7563315C706172645C
            66305C66733136205B6462495472616E2E225175616E74556E6964225D205C62
            20585C623020205B6462495472616E2E2244657363724974656D225D5C706172
            0D0A7D0D0A00}
        end
        object Memo11: TfrxMemoView
          Align = baRight
          Left = 196.535560000000000000
          Top = 18.897650000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataField = 'Total'
          DataSet = dbITran
          DataSetName = 'dbITran'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[dbITran."Total"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 213.110390000000000000
        Top = 332.598640000000000000
        Width = 279.685220000000000000
        OnBeforePrint = 'ReportSummary1OnBeforePrint'
        Stretched = True
        object Line2: TfrxLineView
          Align = baWidth
          Top = 22.574830000000000000
          Width = 279.685220000000000000
          StretchMode = smActualHeight
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Memo19: TfrxMemoView
          Align = baLeft
          Top = 1.338590000000011000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Sub-Total')
          ParentFont = False
        end
        object textoDesconto: TfrxMemoView
          Align = baLeft
          Top = 25.795300000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Descontos')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Align = baLeft
          Top = 50.252009999999990000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Total a Pagar')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Align = baLeft
          Top = 75.708720000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Valor Pago')
          ParentFont = False
        end
        object meDebitadoP: TfrxMemoView
          Align = baLeft
          Top = 153.078850000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Visible = False
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Valor Debitado')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Align = baRight
          Left = 170.456729770000000000
          Top = 2.000000000000000000
          Width = 109.228490230000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[dbTran."Total"]')
          ParentFont = False
        end
        object campoDesconto: TfrxMemoView
          Align = baRight
          Left = 170.456729770000000000
          Top = 26.574830000000020000
          Width = 109.228490230000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[dbTran."Desconto"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Align = baRight
          Left = 170.456729770000000000
          Top = 50.811069999999970000
          Width = 109.228490230000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[<dbTran."Total">-<dbTran."Desconto">]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Align = baRight
          Left = 170.456729770000000000
          Top = 75.708720000000000000
          Width = 109.228490230000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[dbTran."Pago"]')
          ParentFont = False
        end
        object meDebitado: TfrxMemoView
          Align = baRight
          Left = 170.456729770000000000
          Top = 153.637910000000000000
          Width = 109.228490230000000000
          Height = 18.897650000000000000
          Visible = False
          StretchMode = smActualHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[dbTran."Debito"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Align = baWidth
          Top = 186.653680000000000000
          Width = 279.685220000000000000
          Height = 26.456710000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          Memo.UTF8 = (
            '[dbConfig."RecRodape"]')
        end
        object separadorDesconto: TfrxLineView
          Align = baWidth
          Top = 47.692949999999990000
          Width = 279.685220000000000000
          StretchMode = smActualHeight
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Align = baWidth
          Top = 72.149659999999990000
          Width = 279.685220000000000000
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          Align = baWidth
          Top = 97.385900000000000000
          Width = 279.685220000000000000
          StretchMode = smActualHeight
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object lineDebitado: TfrxLineView
          Align = baWidth
          Top = 175.756030000000000000
          Width = 279.685220000000000000
          Visible = False
          OnBeforePrint = 'separadorValorDebitadoOnBeforePrint'
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object meTrocoP: TfrxMemoView
          Align = baLeft
          Top = 101.047310000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Troco')
          ParentFont = False
        end
        object lineTroco: TfrxLineView
          Align = baWidth
          Top = 123.724490000000000000
          Width = 279.685220000000000000
          StretchMode = smActualHeight
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object meTroco: TfrxMemoView
          Align = baRight
          Left = 170.456729770000000000
          Top = 101.047310000000000000
          Width = 109.228490230000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[dbTran."Troco"]')
          ParentFont = False
        end
        object meCreditoP: TfrxMemoView
          Align = baLeft
          Top = 127.724490000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Creditado')
          ParentFont = False
        end
        object lineCredito: TfrxLineView
          Align = baWidth
          Top = 150.401670000000000000
          Width = 279.685220000000000000
          StretchMode = smActualHeight
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object meCredito: TfrxMemoView
          Align = baRight
          Left = 170.456729770000000000
          Top = 127.724490000000000000
          Width = 109.228490230000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[dbTran."Credito"]')
          ParentFont = False
        end
      end
    end
  end
  object repCustom: TfrxReport
    Version = '5.5.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 41551.724324039350000000
    ReportOptions.LastChange = 41551.724324039350000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 376
    Top = 96
    Datasets = <
      item
        DataSet = dbCliente
        DataSetName = 'dbCliente'
      end
      item
        DataSet = dbConfig
        DataSetName = 'dbConfig'
      end
      item
        DataSet = dbITran
        DataSetName = 'dbITran'
      end
      item
        DataSet = dbProduto
        DataSetName = 'dbProduto'
      end
      item
        DataSet = dbTran
        DataSetName = 'dbTran'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
    end
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PictureType = gpPNG
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 416
    Top = 344
  end
  object frxMailExport1: TfrxMailExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ShowExportDialog = True
    SmtpPort = 25
    UseIniFile = True
    TimeOut = 60
    ConfurmReading = False
    UseMAPI = SMTP
    Left = 520
    Top = 344
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
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
    Left = 472
    Top = 336
  end
  object Designer: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    GradientEnd = 11982554
    GradientStart = clWindow
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    MemoParentFont = False
    Left = 640
    Top = 248
  end
  object frxRichObject1: TfrxRichObject
    Left = 568
    Top = 240
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 536
    Top = 240
  end
  object frxCheckBoxObject1: TfrxCheckBoxObject
    Left = 496
    Top = 200
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 440
    Top = 240
  end
  object frxDialogControls1: TfrxDialogControls
    Left = 408
    Top = 240
  end
  object dbProduto: TfrxDBDataset
    RangeBegin = rbCurrent
    RangeEnd = reCurrent
    UserName = 'dbProduto'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Codigo=Codigo'
      'Unid=Unid'
      'Preco=Preco'
      'Obs=Obs'
      'Imagem=Imagem'
      'EstoqueAtual=EstoqueAtual'
      'CustoUnitario=CustoUnitario'
      'EstoqueACE=EstoqueACE'
      'EstoqueACS=EstoqueACS'
      'EstoqueFinal=EstoqueFinal'
      'Descricao=Descricao'
      'Categoria=Categoria'
      'SubCateg=SubCateg'
      'PodeAlterarPreco=PodeAlterarPreco'
      'NaoControlaEstoque=NaoControlaEstoque'
      'ID=ID')
    DataSet = tPro
    BCDToCurrency = False
    Left = 184
    Top = 368
  end
  object repWinBFS: TfrxReport
    Version = '5.5.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 38825.568748067100000000
    ReportOptions.Name = 'NEXCAFE_RECIBO'
    ReportOptions.LastChange = 41586.473194791670000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      
        'procedure separadorValorDebitadoOnBeforePrint(Sender: TfrxCompon' +
        'ent);'
      'begin'
      '  if <dbTran."Debito"><0.01 then begin'
      '    campoValorDebitado.Visible := False;'
      '    textoValorDebitado.Visible := False;'
      
        '    separadorValorDebitado.Visible := False;                    ' +
        '                                                                ' +
        '    '
      '  end;            '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 280
    Top = 344
    Datasets = <
      item
        DataSet = dbCliente
        DataSetName = 'dbCliente'
      end
      item
        DataSet = dbConfig
        DataSetName = 'dbConfig'
      end
      item
        DataSet = dbITran
        DataSetName = 'dbITran'
      end
      item
        DataSet = dbProduto
        DataSetName = 'dbProduto'
      end
      item
        DataSet = dbTran
        DataSetName = 'dbTran'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 74.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 256
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      EndlessHeight = True
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 139.842610000000000000
        Top = 18.897650000000000000
        Width = 279.685220000000000000
        object Memo1: TfrxMemoView
          Align = baLeft
          Width = 211.653582360000000000
          Height = 26.456710000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[dbConfig."RecNomeLoja"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Top = 32.133890000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            'Cliente: ')
        end
        object Memo3: TfrxMemoView
          Left = 52.913420000000000000
          Top = 30.795300000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[dbTran."NomeCliente"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Align = baLeft
          Top = 56.692949999999990000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Funcion'#195#161'rio: [dbTran."Func"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 1.000000000000000000
          Top = 80.252010000000000000
          Width = 393.071120000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Frame.Width = 0.500000000000000000
          Memo.UTF8 = (
            '[dbTran."NomeTipo"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Align = baRight
          Left = -229.551330000000000000
          Top = 82.031540000000010000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'N.Transa'#195#167#195#163'o: [dbTran."ID"]')
        end
        object Memo8: TfrxMemoView
          Align = baRight
          Left = 215.433258820000000000
          Width = 64.251961180000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[dbTran."DataHora"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Align = baWidth
          Top = 116.165430000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            'Descri'#195#167#195#163'o')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Align = baRight
          Left = 166.299320000000000000
          Top = 115.826840000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            'Valor')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 26.456692910000000000
        Top = 219.212740000000000000
        Width = 279.685220000000000000
        DataSet = dbITran
        DataSetName = 'dbITran'
        RowCount = 0
        Stretched = True
        object Line6: TfrxLineView
          Align = baWidth
          Top = 22.795300000000000000
          Width = 279.685220000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo4: TfrxMemoView
          Align = baRight
          Left = 196.535560000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DataField = 'ValorOriginal'
          DataSet = dbITran
          DataSetName = 'dbITran'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[dbITran."ValorOriginal"]')
          ParentFont = False
        end
        object Rich1: TfrxRichView
          Align = baWidth
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'DescrItem'
          DataSet = dbITran
          DataSetName = 'dbITran'
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6465
            666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C205461686F
            6D613B7D7D0D0A7B5C2A5C67656E657261746F72204D7366746564697420352E
            34312E31352E313531353B7D5C766965776B696E64345C7563315C706172645C
            66305C66733136205B6462495472616E2E2244657363724974656D225D5C7061
            720D0A7D0D0A00}
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 192.756030000000000000
        Top = 306.141930000000000000
        Width = 279.685220000000000000
        Stretched = True
        object Line2: TfrxLineView
          Align = baWidth
          Top = 22.574830000000000000
          Width = 279.685220000000000000
          StretchMode = smActualHeight
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Memo19: TfrxMemoView
          Align = baLeft
          Top = 1.338590000000011000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Sub-Total')
          ParentFont = False
        end
        object textoDesconto: TfrxMemoView
          Align = baLeft
          Top = 51.795300000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Descontos')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Align = baLeft
          Top = 76.252010000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Total Final a Pagar')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Align = baLeft
          Top = 101.708720000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Total Final Pago')
          ParentFont = False
        end
        object textoValorDebitado: TfrxMemoView
          Align = baLeft
          Top = 126.165430000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Valor Debitado')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Align = baRight
          Left = 159.118139770000000000
          Top = 2.000000000000000000
          Width = 120.567080230000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<dbITran."ValorOriginal">,MasterData1)]')
          ParentFont = False
        end
        object campoDesconto: TfrxMemoView
          Align = baRight
          Left = 159.118139770000000000
          Top = 52.574830000000000000
          Width = 120.567080230000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<dbITran."DescAnt">,MasterData1) + SUM(<dbITran."Desconto">' +
              ',MasterData1)]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Align = baRight
          Left = 159.118139770000000000
          Top = 76.811070000000000000
          Width = 120.567080230000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<dbITran."ValorOriginal">,MasterData1) - SUM(<dbITran."Desc' +
              'Ant">,MasterData1) - SUM(<dbITran."Desconto">,MasterData1) - SUM' +
              '(<dbITran."PgAnt">,MasterData1)]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Align = baRight
          Left = 159.118139770000000000
          Top = 101.708720000000000000
          Width = 120.567080230000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<dbITran."Pago">,MasterData1)]')
          ParentFont = False
        end
        object campoValorDebitado: TfrxMemoView
          Align = baRight
          Left = 159.118139770000000000
          Top = 126.724490000000000000
          Width = 120.567080230000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[dbTran."Debito"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Align = baWidth
          Top = 171.535560000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          Memo.UTF8 = (
            '[dbConfig."RecRodape"]')
        end
        object separadorDesconto: TfrxLineView
          Align = baWidth
          Top = 73.692950000000000000
          Width = 279.685220000000000000
          StretchMode = smActualHeight
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Align = baWidth
          Top = 98.149660000000000000
          Width = 279.685220000000000000
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          Align = baWidth
          Top = 123.385900000000000000
          Width = 279.685220000000000000
          StretchMode = smActualHeight
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object separadorValorDebitado: TfrxLineView
          Align = baWidth
          Top = 148.842610000000000000
          Width = 279.685220000000000000
          OnBeforePrint = 'separadorValorDebitadoOnBeforePrint'
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Line1: TfrxLineView
          Align = baWidth
          Top = 49.133890000000000000
          Width = 279.685220000000000000
          StretchMode = smActualHeight
          Color = clBlack
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          Align = baLeft
          Top = 26.456710000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            'Pago Antecipamente')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Align = baRight
          Left = 159.118139770000000000
          Top = 27.236240000000000000
          Width = 120.567080230000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<dbITran."PgAnt">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object tCliente: TnxTable
    Database = Dados.db
    TableName = 'Cliente'
    IndexName = 'IID'
    Left = 80
    Top = 352
  end
  object dbCliente: TfrxDBDataset
    RangeBegin = rbCurrent
    RangeEnd = reCurrent
    UserName = 'dbCliente'
    CloseDataSource = False
    DataSet = tCliente
    BCDToCurrency = False
    Left = 152
    Top = 456
  end
  object dmExp: TfrxDotMatrixExport
    ShowDialog = False
    UseFileCache = True
    ShowProgress = False
    OverwritePrompt = False
    DataOnly = False
    EscModel = 0
    GraphicFrames = False
    OEMConvert = False
    PageBreaks = False
    SaveToFile = True
    UseIniSettings = True
    Left = 144
    Top = 328
  end
end
