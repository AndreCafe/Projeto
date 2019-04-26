object dmComp: TdmComp
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 348
  Width = 471
  object dbTran: TfrxDBDataset
    RangeBegin = rbCurrent
    RangeEnd = reCurrent
    UserName = 'dbTran'
    CloseDataSource = False
    DataSet = tTran
    Left = 24
    Top = 144
  end
  object dbITran: TfrxDBDataset
    UserName = 'dbITran'
    CloseDataSource = False
    DataSet = tITran
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
      Size = 80
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
  end
  object repMatrix: TfrxReport
    Version = '3.18'
    DotMatrixReport = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38823.643521608800000000
    ReportOptions.LastChange = 39151.611410925930000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    ShowProgress = False
    Left = 144
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
    object Page1: TfrxDMPPage
      PaperWidth = 101.599934383375700000
      PaperHeight = 359.833100941122300000
      PaperSize = 256
      FontStyle = []
      object MasterData1: TfrxMasterData
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
        end
        object DMPMemo12: TfrxDMPMemoView
          Align = baRight
          Left = 259.200000000000000000
          Top = 17.000000000000000000
          Width = 115.200000000000000000
          Height = 17.000000000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            ' [dbITran."Total"]')
        end
        object DMPMemo14: TfrxDMPMemoView
          Align = baWidth
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[dbITran."DescrItem"]')
        end
      end
      object ReportTitle1: TfrxReportTitle
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
        end
        object DMPMemo18: TfrxDMPMemoView
          Top = 34.000000000000000000
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'CLIENTE: [dbTran."NomeCliente"]')
        end
        object DMPMemo19: TfrxDMPMemoView
          Top = 51.000000000000000000
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'FUNC---: [dbTran."Func"]')
        end
        object DMPMemo20: TfrxDMPMemoView
          Align = baWidth
          Top = 102.000000000000000000
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            
              '================================================================' +
              '==============================================')
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
        end
        object DMPMemo23: TfrxDMPMemoView
          Align = baWidth
          Top = 153.000000000000000000
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            
              '================================================================' +
              '=========================')
        end
        object DMPMemo24: TfrxDMPMemoView
          Top = 119.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'DESCRI'#195#8225#195#402'O')
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
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 136.000000000000000000
        Top = 306.000000000000000000
        Width = 384.000000000000000000
        Stretched = True
        object DMPMemo2: TfrxDMPMemoView
          Align = baWidth
          Top = 85.000000000000000000
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            
              '================================================================' +
              '=========================')
        end
        object DMPMemo3: TfrxDMPMemoView
          Align = baWidth
          Width = 240.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'SUB-TOTAL --------------------------')
          WordWrap = False
        end
        object DMPMemo4: TfrxDMPMemoView
          Align = baWidth
          Top = 17.000000000000000000
          Width = 240.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'DESCONTOS ----------------------------')
          WordWrap = False
        end
        object DMPMemo5: TfrxDMPMemoView
          Align = baWidth
          Top = 51.000000000000000000
          Width = 240.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'TOTAL PAGO ----------------------------------------')
          WordWrap = False
        end
        object DMPMemo6: TfrxDMPMemoView
          Align = baWidth
          Top = 34.000000000000000000
          Width = 240.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'TOTAL A PAGAR ----------------------------')
          WordWrap = False
        end
        object DMPMemo7: TfrxDMPMemoView
          Align = baWidth
          Top = 68.000000000000000000
          Width = 240.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'VALOR DEBITADO ----------------------------------------')
          WordWrap = False
        end
        object DMPMemo8: TfrxDMPMemoView
          Align = baRight
          Left = 220.800000000000000000
          Width = 134.400000000000000000
          Height = 17.000000000000000000
          DataSet = dbTran
          DataSetName = 'dbTran'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8 = (
            '[dbTran."Total"]')
        end
        object DMPMemo9: TfrxDMPMemoView
          Align = baRight
          Left = 220.800000000000000000
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
            '[dbTran."Desconto"]')
        end
        object DMPMemo10: TfrxDMPMemoView
          Align = baRight
          Left = 220.800000000000000000
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
            '[dbTran."Total"]')
        end
        object DMPMemo26: TfrxDMPMemoView
          Align = baRight
          Left = 220.800000000000000000
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
            '[dbTran."Pago"]')
        end
        object DMPMemo27: TfrxDMPMemoView
          Align = baRight
          Left = 220.800000000000000000
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
            '[dbTran."Debito"]')
        end
        object DMPMemo1: TfrxDMPMemoView
          Top = 119.000000000000000000
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          StretchMode = smActualHeight
          Memo.UTF8 = (
            '[dbConfig."RecRodape"]')
          WordWrap = False
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
      Size = 55
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
    Left = 88
    Top = 264
  end
  object repJT: TfrxReport
    Version = '3.18'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38825.568748067100000000
    ReportOptions.LastChange = 38825.609176794000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo13OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if ((<Line> mod 2) = 1) then'
      '    Memo13.Color := $00F5F5F5 else'
      '    Memo13.Color := $00E9E9E9;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 144
    Top = 264
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
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 355.600000000000000000
      PaperSize = 5
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 136.063080000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
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
          Left = 524.976717000000000000
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
          Left = 509.858597000000000000
          Top = 68.031540000000010000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'N.Transa'#195#167#195#163'o: [dbTran."ID"]')
        end
        object Memo8: TfrxMemoView
          Align = baRight
          Left = 449.386117000000000000
          Top = 3.779530000000001000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Data / Hora da Transa'#195#167#195#163'o: [dbTran."DataHora"]')
        end
        object Memo9: TfrxMemoView
          Top = 113.385900000000000000
          Width = 483.779840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            'Descri'#195#167#195#163'o')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Align = baRight
          Left = 627.024027000000000000
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
            'Valor a Pagar')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 491.338900000000000000
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
            'Data/Hora')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 26.456710000000000000
        Top = 215.433210000000000000
        Width = 740.409927000000000000
        DataSet = dbITran
        DataSetName = 'dbITran'
        RowCount = 0
        object Memo13: TfrxMemoView
          Align = baClient
          Width = 740.409927000000000000
          Height = 26.456710000000000000
          OnBeforePrint = 'Memo13OnBeforePrint'
          Color = 15329769
        end
        object Memo14: TfrxMemoView
          Top = 3.779530000000000000
          Width = 483.779840000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            '[dbITran."DescrItem"]')
        end
        object Memo15: TfrxMemoView
          Left = 491.338900000000000000
          Top = 3.779530000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[dbITran."DataOrig"]')
        end
        object Memo17: TfrxMemoView
          Align = baRight
          Left = 627.024122200000000000
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
      end
      object ReportSummary1: TfrxReportSummary
        Height = 154.960730000000000000
        Top = 302.362400000000000000
        Width = 740.409927000000000000
        Stretched = True
        object Memo18: TfrxMemoView
          Left = 627.401980000000000000
          Top = 15.118119999999980000
          Width = 113.385826770000000000
          Height = 132.283550000000000000
          Color = 15593713
        end
        object Shape1: TfrxShapeView
          Left = 517.795610000000000000
          Top = 15.118119999999980000
          Width = 222.614317000000000000
          Height = 132.283550000000000000
          Frame.Color = clSilver
        end
        object Line2: TfrxLineView
          Left = 517.795610000000000000
          Top = 41.574830000000020000
          Width = 222.992270000000000000
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Left = 517.795610000000000000
          Top = 68.031540000000010000
          Width = 222.992270000000000000
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          Left = 517.795610000000000000
          Top = 94.488250000000000000
          Width = 222.992270000000000000
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Memo19: TfrxMemoView
          Left = 525.354670000000000000
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
          Left = 517.795610000000000000
          Top = 120.944960000000000000
          Width = 222.992270000000000000
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Memo20: TfrxMemoView
          Left = 525.354670000000000000
          Top = 45.354359999999990000
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
          Left = 525.354670000000000000
          Top = 71.811069999999970000
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
          Left = 525.354670000000000000
          Top = 98.267779999999900000
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
        object Memo23: TfrxMemoView
          Left = 525.354670000000000000
          Top = 124.724490000000000000
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
          Left = 631.181387950000000000
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
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[dbTran."Total"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 631.181510000000000000
          Top = 45.354359999999990000
          Width = 109.228490230000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[dbTran."Desconto"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 631.181510000000000000
          Top = 71.811069999999970000
          Width = 109.228490230000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[<dbTran."Total">-<dbTran."Desconto">]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 631.181510000000000000
          Top = 98.267780000000010000
          Width = 109.228490230000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[dbTran."Pago"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 631.181510000000000000
          Top = 124.724490000000000000
          Width = 109.228490230000000000
          Height = 18.897650000000000000
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
          Top = 15.118119999999980000
          Width = 517.795610000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Memo.UTF8 = (
            '[dbConfig."RecRodape"]')
        end
      end
    end
  end
  object repJTFS: TfrxReport
    Version = '3.18'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38825.568748067100000000
    ReportOptions.LastChange = 39151.550601261570000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo13OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if ((<Line> mod 2) = 1) then'
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
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 355.600000000000000000
      PaperSize = 5
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 136.063080000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
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
          Left = 509.858597000000000000
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
          Left = 509.858597000000000000
          Top = 68.031540000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'N.Transa'#195#167#195#163'o: [dbTran."ID"]')
        end
        object Memo8: TfrxMemoView
          Align = baRight
          Left = 449.386117000000000000
          Top = 3.779530000000001000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Data / Hora da Transa'#195#167#195#163'o: [dbTran."DataHora"]')
        end
        object Memo9: TfrxMemoView
          Top = 113.385900000000000000
          Width = 483.779840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            'Descri'#195#167#195#163'o')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Align = baRight
          Left = 627.024027000000000000
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
            'Valor ')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 491.338900000000000000
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
            'Data/Hora')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 26.456710000000000000
        Top = 215.433210000000000000
        Width = 740.409927000000000000
        DataSet = dbITran
        DataSetName = 'dbITran'
        RowCount = 0
        object Memo13: TfrxMemoView
          Align = baClient
          Width = 740.409927000000000000
          Height = 26.456710000000000000
          OnBeforePrint = 'Memo13OnBeforePrint'
          Color = 15329769
        end
        object Memo14: TfrxMemoView
          Top = 3.779530000000000000
          Width = 483.779840000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            '[dbITran."DescrItem"]')
        end
        object Memo15: TfrxMemoView
          Left = 491.338900000000000000
          Top = 3.779530000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[dbITran."DataOrig"]')
        end
        object Memo17: TfrxMemoView
          Align = baRight
          Left = 627.024122200000000000
          Top = 3.779530000000000000
          Width = 113.385804800000000000
          Height = 18.897650000000000000
          DataField = 'ValorOriginal'
          DataSet = dbITran
          DataSetName = 'dbITran'
          HAlign = haRight
          Memo.UTF8 = (
            '[dbITran."ValorOriginal"]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 154.960730000000000000
        Top = 302.362400000000000000
        Width = 740.409927000000000000
        Stretched = True
        object Memo18: TfrxMemoView
          Left = 627.401980000000000000
          Top = 15.118119999999980000
          Width = 113.385826770000000000
          Height = 132.283550000000000000
          Color = 15593713
        end
        object Shape1: TfrxShapeView
          Left = 517.795610000000000000
          Top = 15.118119999999980000
          Width = 222.614317000000000000
          Height = 132.283550000000000000
          Frame.Color = clSilver
        end
        object Line2: TfrxLineView
          Left = 517.795610000000000000
          Top = 41.574830000000020000
          Width = 222.992270000000000000
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Left = 517.795610000000000000
          Top = 68.031540000000010000
          Width = 222.992270000000000000
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          Left = 517.795610000000000000
          Top = 94.488250000000000000
          Width = 222.992270000000000000
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Memo19: TfrxMemoView
          Left = 525.354670000000000000
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
          Left = 517.795610000000000000
          Top = 120.944960000000000000
          Width = 222.992270000000000000
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Memo20: TfrxMemoView
          Left = 525.354670000000000000
          Top = 45.354359999999990000
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
          Left = 525.354670000000000000
          Top = 71.811069999999970000
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
          Left = 525.354670000000000000
          Top = 98.267779999999900000
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
        object Memo23: TfrxMemoView
          Left = 525.354670000000000000
          Top = 124.724490000000000000
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
          Left = 631.181387950000000000
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
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[SUM(<dbITran."ValorOriginal">,MasterData1)]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 631.181510000000000000
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
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<dbITran."DescAnt">,MasterData1) + SUM(<dbITran."Desconto">' +
              ',MasterData1)]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 631.181510000000000000
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
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<dbITran."ValorOriginal">,MasterData1) - SUM(<dbITran."Desc' +
              'Ant">,MasterData1) - SUM(<dbITran."Desconto">,MasterData1)]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 631.181510000000000000
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
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[SUM(<dbITran."PgAnt">,MasterData1) + SUM(<dbITran."Pago">,Maste' +
              'rData1)]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 631.181510000000000000
          Top = 124.724490000000000000
          Width = 109.228490230000000000
          Height = 18.897650000000000000
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
          Top = 15.118119999999980000
          Width = 517.795610000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Memo.UTF8 = (
            '[dbConfig."RecRodape"]')
        end
      end
    end
  end
  object repMatrixFS: TfrxReport
    Version = '3.18'
    DotMatrixReport = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38823.643521608800000000
    ReportOptions.LastChange = 39151.620162523150000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    ShowProgress = False
    Left = 280
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
    object Page1: TfrxDMPPage
      PaperWidth = 101.599934383375700000
      PaperHeight = 359.833100941122300000
      PaperSize = 256
      FontStyle = []
      object MasterData1: TfrxMasterData
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
        end
        object DMPMemo14: TfrxDMPMemoView
          Align = baWidth
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            '[dbITran."DescrItem"]')
        end
      end
      object ReportTitle1: TfrxReportTitle
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
        end
        object DMPMemo18: TfrxDMPMemoView
          Top = 34.000000000000000000
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'CLIENTE: [dbTran."NomeCliente"]')
        end
        object DMPMemo19: TfrxDMPMemoView
          Top = 51.000000000000000000
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'FUNC---: [dbTran."Func"]')
        end
        object DMPMemo20: TfrxDMPMemoView
          Align = baWidth
          Top = 102.000000000000000000
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            
              '================================================================' +
              '==============================================')
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
        end
        object DMPMemo23: TfrxDMPMemoView
          Align = baWidth
          Top = 153.000000000000000000
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            
              '================================================================' +
              '=========================')
        end
        object DMPMemo24: TfrxDMPMemoView
          Top = 119.000000000000000000
          Width = 96.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'DESCRI'#195#8225#195#402'O')
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
        end
      end
      object ReportSummary1: TfrxReportSummary
        Height = 136.000000000000000000
        Top = 306.000000000000000000
        Width = 384.000000000000000000
        Stretched = True
        object DMPMemo2: TfrxDMPMemoView
          Align = baWidth
          Top = 85.000000000000000000
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            
              '================================================================' +
              '=========================')
        end
        object DMPMemo3: TfrxDMPMemoView
          Align = baWidth
          Width = 240.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'SUB-TOTAL --------------------------')
          WordWrap = False
        end
        object DMPMemo4: TfrxDMPMemoView
          Align = baWidth
          Top = 17.000000000000000000
          Width = 240.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'DESCONTOS ----------------------------')
          WordWrap = False
        end
        object DMPMemo5: TfrxDMPMemoView
          Align = baWidth
          Top = 51.000000000000000000
          Width = 240.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'TOTAL PAGO ----------------------------------------')
          WordWrap = False
        end
        object DMPMemo6: TfrxDMPMemoView
          Align = baWidth
          Top = 34.000000000000000000
          Width = 240.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'TOTAL A PAGAR ----------------------------')
          WordWrap = False
        end
        object DMPMemo7: TfrxDMPMemoView
          Align = baWidth
          Top = 68.000000000000000000
          Width = 240.000000000000000000
          Height = 17.000000000000000000
          Memo.UTF8 = (
            'VALOR DEBITADO ----------------------------------------')
          WordWrap = False
        end
        object DMPMemo8: TfrxDMPMemoView
          Align = baRight
          Left = 220.800000000000000000
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
        end
        object DMPMemo9: TfrxDMPMemoView
          Align = baRight
          Left = 220.800000000000000000
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
            
              '[SUM(<dbITran."DescAnt">,MasterData1) + SUM(<dbITran."Desconto">' +
              ',MasterData1)]')
        end
        object DMPMemo10: TfrxDMPMemoView
          Align = baRight
          Left = 220.800000000000000000
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
            
              '[SUM(<dbITran."ValorOriginal">,MasterData1) - SUM(<dbITran."Desc' +
              'Ant">,MasterData1) - SUM(<dbITran."Desconto">,MasterData1)]')
        end
        object DMPMemo26: TfrxDMPMemoView
          Align = baRight
          Left = 220.800000000000000000
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
            
              '[SUM(<dbITran."PgAnt">,MasterData1) + SUM(<dbITran."Pago">,Maste' +
              'rData1)]')
        end
        object DMPMemo27: TfrxDMPMemoView
          Align = baRight
          Left = 220.800000000000000000
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
            '[dbTran."Debito"]')
        end
        object DMPMemo1: TfrxDMPMemoView
          Top = 119.000000000000000000
          Width = 384.000000000000000000
          Height = 17.000000000000000000
          StretchMode = smActualHeight
          Memo.UTF8 = (
            '[dbConfig."RecRodape"]')
          WordWrap = False
        end
      end
    end
  end
end
