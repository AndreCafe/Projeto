object dmRels: TdmRels
  OldCreateOrder = False
  Height = 202
  Width = 265
  object dbDesp: TfrxDBDataset
    UserName = 'Despesas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Sync=Sync'
      'Tecnico=Tecnico'
      'Cliente=Cliente'
      'Data=Data'
      'ID=ID'
      'IDRA=IDRA'
      'Tipo=Tipo'
      'Valor=Valor'
      'JustDiverg=JustDiverg'
      'Descr=Descr'
      'NumF=NumF'
      'ValorDef=ValorDef'
      'ValorCli=ValorCli'
      'ValorTec=ValorTec'
      'StatusTec=StatusTec'
      'LogID=LogID'
      'StatusCli=StatusCli'
      'ONServ=ONServ'
      'ExcluirServ=ExcluirServ'
      'NomeCli=NomeCli'
      'ValorFinal=ValorFinal'
      'NomeTipo=NomeTipo'
      'DataI=DataI'
      'DataF=DataF'
      'ValorStr=ValorStr'
      'OSDia=OSDia')
    DataSet = Q
    Left = 104
    Top = 8
  end
  object Q: TnxQuery
    Database = DM.dbUp
    OnCalcFields = QCalcFields
    SQL.Strings = (
      'select *, '
      '(Select Min(DataI) as DataI from RA) as DataI,'
      '(Select Max(DataF) as DataF from RA) as DataF'
      'from raitem')
    Left = 152
    Top = 8
    object QSync: TBooleanField
      FieldName = 'Sync'
    end
    object QTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object QCliente: TStringField
      FieldName = 'Cliente'
      Size = 8
    end
    object QData: TDateField
      FieldName = 'Data'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QID: TWordField
      FieldName = 'ID'
    end
    object QIDRA: TWordField
      FieldName = 'IDRA'
    end
    object QTipo: TWordField
      FieldName = 'Tipo'
    end
    object QValor: TCurrencyField
      FieldName = 'Valor'
    end
    object QJustDiverg: TMemoField
      FieldName = 'JustDiverg'
      BlobType = ftMemo
    end
    object QDescr: TMemoField
      FieldName = 'Descr'
      BlobType = ftMemo
    end
    object QNumF: TIntegerField
      FieldName = 'NumF'
      DisplayFormat = '00000'
    end
    object QValorDef: TCurrencyField
      FieldName = 'ValorDef'
    end
    object QValorCli: TCurrencyField
      FieldName = 'ValorCli'
    end
    object QValorTec: TCurrencyField
      FieldName = 'ValorTec'
    end
    object QStatusTec: TWordField
      FieldName = 'StatusTec'
    end
    object QLogID: TIntegerField
      FieldName = 'LogID'
    end
    object QStatusCli: TWordField
      FieldName = 'StatusCli'
    end
    object QONServ: TBooleanField
      FieldName = 'ONServ'
    end
    object QExcluirServ: TBooleanField
      FieldName = 'ExcluirServ'
    end
    object QNomeCli: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeCli'
      LookupDataSet = DM.mtCli
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Cliente'
      Size = 40
      Lookup = True
    end
    object QValorFinal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorFinal'
      Calculated = True
    end
    object QNomeTipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeTipo'
      Size = 12
      Calculated = True
    end
    object QDataI: TDateField
      FieldName = 'DataI'
    end
    object QDataF: TDateField
      FieldName = 'DataF'
    end
    object QValorStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'ValorStr'
      Calculated = True
    end
    object QOSDia: TStringField
      FieldKind = fkCalculated
      FieldName = 'OSDia'
      Size = 24
      Calculated = True
    end
  end
  object frDesp: TfrxReport
    Version = '3.18'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38715.378249872700000000
    ReportOptions.LastChange = 38812.993549456020000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 56
    Top = 8
    Datasets = <
      item
        DataSet = dbPar
        DataSetName = 'dbPar'
      end
      item
        DataSet = dbDesp
        DataSetName = 'Despesas'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      Orientation = poLandscape
      PaperWidth = 279.400000000000000000
      PaperHeight = 215.900000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 64.252010000000000000
        Top = 18.897650000000000000
        Width = 980.410081999999900000
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = 354.141960999999900000
          Top = 18.897650000000000000
          Width = 272.126160000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Detalhamento de Despesas')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          Left = 11.338590000000000000
          Top = 3.779530000000001000
          Width = 204.094620000000000000
          Height = 49.133890000000000000
          DataField = 'BitMap'
          DataSet = dbPar
          DataSetName = 'dbPar'
        end
        object Memo23: TfrxMemoView
          Left = 782.362710000000000000
          Top = 3.779530000000001000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Frame.Color = clGray
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#] de [TotalPages#]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 151.181200000000000000
        Top = 143.622140000000000000
        Width = 980.410081999999900000
        Condition = 'Despesas."Cliente"'
        ReprintOnNewPage = True
        StartNewPage = True
        object Shape2: TfrxShapeView
          Left = 0.000000000000000888
          Top = 124.724490000000000000
          Width = 980.410082000000000000
          Height = 26.456710000000000000
        end
        object Memo11: TfrxMemoView
          Left = 400.630180000000000000
          Top = 128.504020000000000000
          Width = 204.094488190000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'OS do Dia')
          ParentFont = False
        end
        object Shape1: TfrxShapeView
          Width = 978.520317000000000000
          Height = 71.811070000000000000
        end
        object Line1: TfrxLineView
          Top = 34.015769999999970000
          Width = 978.898270000000000000
          Frame.Typ = [ftTop]
        end
        object Memo2: TfrxMemoView
          Left = 11.338590000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8 = (
            'Cliente')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 11.338590000000000000
          Top = 11.338590000000010000
          Width = 574.488560000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[Despesas."NomeCli"] - [Despesas."NomeCli"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 11.338590000000000000
          Top = 34.015769999999970000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8 = (
            'Data Inicial')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 188.976500000000000000
          Top = 34.015769999999970000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8 = (
            'Data Final')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 389.291590000000000000
          Top = 34.015769999999970000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8 = (
            'ID Fechamento')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 173.858380000000000000
          Top = 34.015769999999970000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft]
        end
        object Line3: TfrxLineView
          Left = 370.393940000000000000
          Top = 34.015769999999970000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo7: TfrxMemoView
          Left = 389.291590000000000000
          Top = 49.133890000000010000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'NumF'
          DataSet = dbDesp
          DataSetName = 'Despesas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '00000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[Despesas."NumF"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 105.826840000000000000
          Top = 128.504020000000000000
          Width = 120.944881890000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Tipo')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 234.330860000000000000
          Top = 128.504020000000000000
          Width = 158.740172130000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Valor')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 3.779530000000000000
          Top = 128.504020000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Data')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Left = 102.047310000000000000
          Top = 124.724490000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          Left = 230.551330000000000000
          Top = 124.724490000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          Left = 396.850650000000000000
          Top = 124.724490000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          Left = 608.504330000000000000
          Top = 124.724490000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo12: TfrxMemoView
          Left = 612.283860000000000000
          Top = 128.504020000000000000
          Width = 362.834828740000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Observa'#195#167#195#181'es')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 11.338590000000000000
          Top = 49.133890000000010000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataSet = dbDesp
          DataSetName = 'Despesas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[Despesas."DataI"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 188.976500000000000000
          Top = 49.133890000000010000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'DataF'
          DataSet = dbDesp
          DataSetName = 'Despesas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[Despesas."DataF"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Align = baCenter
          Left = 284.220656000000000000
          Top = 102.047310000000000000
          Width = 411.968770000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Despesas Ressarc'#195#173'veis Apontadas no Per'#195#173'odo')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Height = 26.456710000000000000
        Top = 317.480520000000000000
        Width = 980.410081999999900000
        DataSet = dbDesp
        DataSetName = 'Despesas'
        RowCount = 0
        Stretched = True
        object Shape3: TfrxShapeView
          Align = baClient
          Width = 980.410081999999900000
          Height = 26.456710000000000000
        end
        object Memo13: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000022000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'Data'
          DataSet = dbDesp
          DataSetName = 'Despesas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          HAlign = haCenter
          Memo.UTF8 = (
            '[Despesas."Data"]')
        end
        object Memo14: TfrxMemoView
          Left = 105.826840000000000000
          Top = 3.779530000000022000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Despesas."NomeTipo"]')
        end
        object Memo15: TfrxMemoView
          Left = 234.330860000000000000
          Top = 3.779530000000022000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'ValorStr'
          DataSet = dbDesp
          DataSetName = 'Despesas'
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8 = (
            '[Despesas."ValorStr"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 400.630180000000000000
          Top = 3.779530000000022000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          DataField = 'OSDia'
          DataSet = dbDesp
          DataSetName = 'Despesas'
          HAlign = haCenter
          Memo.UTF8 = (
            '[Despesas."OSDia"]')
        end
        object Memo17: TfrxMemoView
          Left = 612.283860000000000000
          Top = 3.779530000000022000
          Width = 362.834880000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          DataField = 'Descr'
          DataSet = dbDesp
          DataSetName = 'Despesas'
          Memo.UTF8 = (
            '[Despesas."Descr"]')
        end
        object Line8: TfrxLineView
          Left = 102.047310000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          Left = 230.551330000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          Left = 396.850650000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line11: TfrxLineView
          Left = 608.504330000000000000
          Height = 26.456710000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 147.401670000000000000
        Top = 366.614410000000000000
        Width = 980.410081999999900000
        object Line12: TfrxLineView
          Width = 978.898270000000000000
          Frame.Typ = [ftTop]
        end
        object Line13: TfrxLineView
          Height = 26.456692910000000000
          Frame.Color = clSilver
          Frame.Typ = [ftLeft]
        end
        object Line14: TfrxLineView
          Top = 26.456709999999990000
          Width = 978.898270000000000000
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Line15: TfrxLineView
          Left = 978.898270000000000000
          Height = 26.456692910000000000
          Frame.Color = clSilver
          Frame.Typ = [ftLeft]
        end
        object Line16: TfrxLineView
          Left = 102.047310000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Line17: TfrxLineView
          Left = 230.551330000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Line18: TfrxLineView
          Left = 396.850650000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Line19: TfrxLineView
          Left = 102.047310000000000000
          Top = 26.456709999999990000
          Width = 294.803340000000000000
          Frame.Typ = [ftTop]
        end
        object Memo18: TfrxMemoView
          Left = 132.283550000000000000
          Top = 3.779530000000022000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'Total')
          ParentFont = False
        end
        object Line20: TfrxLineView
          Left = 608.504330000000000000
          Height = 26.456710000000000000
          Frame.Color = clSilver
          Frame.Typ = [ftLeft]
        end
        object Memo19: TfrxMemoView
          Left = 234.330860000000000000
          Top = 3.779530000000022000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<Despesas."ValorFinal">,MasterData1)]')
          ParentFont = False
        end
        object Shape4: TfrxShapeView
          Align = baWidth
          Top = 52.913420000000030000
          Width = 980.410081999999900000
          Height = 94.488250000000000000
        end
        object Memo20: TfrxMemoView
          Left = 7.559060000000000000
          Top = 56.692949999999990000
          Width = 891.969080000000000000
          Height = 83.149660000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'OBS: '
            ''
            
              '1-Valor unit'#195#161'rio do Km utilizado para o c'#195#161'lculo do valor total' +
              ' da quilometragem = [VlKMCli]2-Despesa apontada em dia sem OS po' +
              'de referir-se a T'#195#169'cnico em transito.'
            
              '3-Caso mais de uma OS tenha sido apontada no mesmo dia ser'#195#161' rel' +
              'acionada somente a primeira.  ')
          ParentFont = False
        end
      end
    end
  end
  object pdfExp: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Background = False
    Creator = 'FastReport (http://www.fast-report.com)'
    HTMLTags = True
    Left = 200
    Top = 8
  end
  object dbPar: TfrxDBDataset
    UserName = 'dbPar'
    CloseDataSource = False
    DataSet = DM.Tab
    Left = 112
    Top = 72
  end
  object frIntCli: TfrxReport
    Version = '3.18'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38715.378249872700000000
    ReportOptions.LastChange = 38812.985962997680000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 48
    Top = 72
    Datasets = <
      item
        DataSet = dbPar
        DataSetName = 'dbPar'
      end
      item
        DataSet = dbRAF
        DataSetName = 'dbRAF'
      end
      item
        DataSet = dbDesp
        DataSetName = 'Despesas'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 128.504020000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = 130.204808500000000000
          Top = 3.779530000000001000
          Width = 480.000310000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Resumo de Integra'#195#167#195#163'o Financeira (Clientes)')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 548.031850000000000000
          Top = 7.559059999999999000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Frame.Color = clGray
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#] de [TotalPages#]')
        end
        object Shape2: TfrxShapeView
          Align = baWidth
          Top = 102.047310000000000000
          Width = 740.409927000000000000
          Height = 26.456710000000000000
        end
        object Memo11: TfrxMemoView
          Left = 400.630180000000000000
          Top = 105.826840000000000000
          Width = 105.826708190000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Dt.Inicial')
          ParentFont = False
        end
        object Shape1: TfrxShapeView
          Align = baWidth
          Top = 37.795300000000000000
          Width = 740.409927000000000000
          Height = 41.574830000000000000
        end
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Top = 37.795300000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8 = (
            'Data Final')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 207.874150000000000000
          Top = 37.795300000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8 = (
            'ID Fechamento')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 188.976500000000000000
          Top = 37.795300000000000000
          Height = 41.574830000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo7: TfrxMemoView
          Left = 207.874150000000000000
          Top = 52.913420000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          DataSet = dbDesp
          DataSetName = 'Despesas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '00000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[dbRAF."ID"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 105.826840000000000000
          Top = 105.826840000000000000
          Width = 287.244201890000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Nome')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 3.779530000000000000
          Top = 105.826840000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'C'#195#179'digo')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Left = 102.047310000000000000
          Top = 102.047310000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          Left = 396.850650000000000000
          Top = 102.047310000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          Left = 510.236550000000000000
          Top = 102.047310000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo22: TfrxMemoView
          Left = 7.559060000000000000
          Top = 52.913420000000000000
          Width = 173.858380000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          DataSet = dbDesp
          DataSetName = 'Despesas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[dbRAF."DataF"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 514.016080000000000000
          Top = 105.826840000000000000
          Width = 105.826708190000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Dt.Final')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 623.622450000000000000
          Top = 102.047310000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo3: TfrxMemoView
          Left = 627.401980000000000000
          Top = 105.826840000000000000
          Width = 105.826708190000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Valor')
          ParentFont = False
        end
        object Line8: TfrxLineView
          Left = 321.260050000000000000
          Top = 37.795300000000010000
          Height = 41.574830000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo13: TfrxMemoView
          Left = 340.157700000000000000
          Top = 37.795300000000000000
          Width = 200.315090000000000000
          Height = 15.118120000000000000
          DataSet = dbRAF
          DataSetName = 'dbRAF'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8 = (
            'Data / Hora do Fechamento')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 340.157700000000000000
          Top = 52.913420000000000000
          Width = 253.228510000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          DataSet = dbRAF
          DataSetName = 'dbRAF'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy '#224's hh:mm'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[dbRAF."DHFechaCli"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 26.456710000000000000
        Top = 253.228510000000000000
        Width = 740.409927000000000000
        object Line13: TfrxLineView
          Height = 26.456692910000000000
          Frame.Color = clSilver
          Frame.Typ = [ftLeft]
        end
        object Shape4: TfrxShapeView
          Align = baWidth
          Width = 740.409927000000000000
          Height = 26.456710000000000000
        end
        object Memo4: TfrxMemoView
          Left = 400.630180000000000000
          Top = 3.779529999999937000
          Width = 105.826708190000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Despesas."DataI"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 105.826840000000000000
          Top = 3.779529999999994000
          Width = 287.244201890000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Despesas."NomeCli"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Despesas."Cliente"]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 102.047310000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          Left = 396.850650000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Line14: TfrxLineView
          Left = 510.236550000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo17: TfrxMemoView
          Left = 514.016080000000000000
          Top = 3.779529999999994000
          Width = 105.826708190000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[Despesas."DataF"]')
          ParentFont = False
        end
        object Line16: TfrxLineView
          Left = 623.622450000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo18: TfrxMemoView
          Left = 627.401980000000000000
          Top = 3.779529999999994000
          Width = 105.826708190000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<Despesas."ValorFinal">,MasterData1)]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Top = 230.551330000000000000
        Width = 740.409927000000000000
        DataSet = dbDesp
        DataSetName = 'Despesas'
        RowCount = 0
      end
      object GroupHeader1: TfrxGroupHeader
        Top = 207.874150000000000000
        Visible = False
        Width = 740.409927000000000000
        Condition = 'Despesas."Cliente"'
      end
      object ReportSummary1: TfrxReportSummary
        Height = 26.456710000000000000
        Top = 340.157700000000000000
        Width = 740.409927000000000000
        object Shape3: TfrxShapeView
          ShiftMode = smDontShift
          Left = 623.244094490000000000
          Width = 116.787401574803100000
          Height = 26.456710000000000000
        end
        object Memo15: TfrxMemoView
          Left = 627.401980000000000000
          Top = 3.779530000000022000
          Width = 105.826708190000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<Despesas."ValorFinal">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object dbRAF: TfrxDBDataset
    UserName = 'dbRAF'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'DHCriacao=DHCriacao'
      'DHFechaCli=DHFechaCli'
      'DHFechaTec=DHFechaTec'
      'DataI=DataI'
      'DataF=DataF')
    DataSet = DM.tRAF
    Left = 168
    Top = 72
  end
  object frIntTec: TfrxReport
    Version = '3.18'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38715.378249872700000000
    ReportOptions.LastChange = 38812.985175057870000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 48
    Top = 128
    Datasets = <
      item
        DataSet = dbPar
        DataSetName = 'dbPar'
      end
      item
        DataSet = dbRAF
        DataSetName = 'dbRAF'
      end
      item
        DataSet = dbTec
        DataSetName = 'dbTec'
      end>
    Variables = <>
    Style = <>
    object Page1: TfrxReportPage
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageHeader1: TfrxPageHeader
        Height = 128.504020000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Align = baCenter
          Left = 130.204808500000000000
          Top = 3.779530000000001000
          Width = 480.000310000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Resumo de Integra'#195#167#195#163'o Financeira (T'#195#169'cnicos)')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 548.031850000000000000
          Top = 7.559059999999999000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Frame.Color = clGray
          HAlign = haRight
          Memo.UTF8 = (
            '[Page#] de [TotalPages#]')
        end
        object Shape2: TfrxShapeView
          Align = baWidth
          Top = 102.047310000000000000
          Width = 740.409927000000000000
          Height = 26.456710000000000000
        end
        object Memo11: TfrxMemoView
          Left = 400.630180000000000000
          Top = 105.826840000000000000
          Width = 105.826708190000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Dt.Inicial')
          ParentFont = False
        end
        object Shape1: TfrxShapeView
          Align = baWidth
          Top = 37.795300000000000000
          Width = 740.409927000000000000
          Height = 41.574830000000000000
        end
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Top = 37.795300000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8 = (
            'Data Final')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 207.874150000000000000
          Top = 37.795300000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8 = (
            'ID Fechamento')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 188.976500000000000000
          Top = 37.795300000000000000
          Height = 41.574830000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo7: TfrxMemoView
          Left = 207.874150000000000000
          Top = 52.913420000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          DataSet = dbDesp
          DataSetName = 'Despesas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '00000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[dbRAF."ID"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 105.826840000000000000
          Top = 105.826840000000000000
          Width = 287.244201890000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Nome')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 3.779530000000000000
          Top = 105.826840000000000000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'C'#195#179'digo')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Left = 102.047310000000000000
          Top = 102.047310000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          Left = 396.850650000000000000
          Top = 102.047310000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          Left = 510.236550000000000000
          Top = 102.047310000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo22: TfrxMemoView
          Left = 7.559060000000000000
          Top = 52.913420000000000000
          Width = 173.858380000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          DataSet = dbDesp
          DataSetName = 'Despesas'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[dbRAF."DataF"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 514.016080000000000000
          Top = 105.826840000000000000
          Width = 105.826708190000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Dt.Final')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 623.622450000000000000
          Top = 102.047310000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo3: TfrxMemoView
          Left = 627.401980000000000000
          Top = 105.826840000000000000
          Width = 105.826708190000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Valor')
          ParentFont = False
        end
        object Line8: TfrxLineView
          Left = 321.260050000000000000
          Top = 37.795300000000010000
          Height = 41.574830000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo13: TfrxMemoView
          Left = 340.157700000000000000
          Top = 37.795300000000000000
          Width = 200.315090000000000000
          Height = 15.118120000000000000
          DataSet = dbRAF
          DataSetName = 'dbRAF'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8 = (
            'Data / Hora do Fechamento')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 340.157700000000000000
          Top = 52.913420000000000000
          Width = 253.228510000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          DataSet = dbRAF
          DataSetName = 'dbRAF'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy '#224's hh:mm'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[dbRAF."DHFechaCli"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Height = 26.456710000000000000
        Top = 253.228510000000000000
        Width = 740.409927000000000000
        object Line13: TfrxLineView
          Height = 26.456692910000000000
          Frame.Color = clSilver
          Frame.Typ = [ftLeft]
        end
        object Shape4: TfrxShapeView
          Align = baWidth
          Width = 740.409927000000000000
          Height = 26.456710000000000000
        end
        object Memo4: TfrxMemoView
          Left = 400.630180000000000000
          Top = 3.779529999999994000
          Width = 105.826708190000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[dbTec."DataI"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 105.826840000000000000
          Top = 3.779529999999994000
          Width = 287.244201890000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[dbTec."NomeTec"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 94.488188980000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[dbTec."Tecnico"]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 102.047310000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          Left = 396.850650000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Line14: TfrxLineView
          Left = 510.236550000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo17: TfrxMemoView
          Left = 514.016080000000000000
          Top = 3.779529999999994000
          Width = 105.826708190000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[dbTec."DataF"]')
          ParentFont = False
        end
        object Line16: TfrxLineView
          Left = 623.622450000000000000
          Height = 26.456710000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo18: TfrxMemoView
          Left = 627.401980000000000000
          Top = 3.779529999999994000
          Width = 105.826708190000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<dbTec."ValorFinal">,MasterData1)]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        Top = 230.551330000000000000
        Width = 740.409927000000000000
        DataSet = dbTec
        DataSetName = 'dbTec'
        RowCount = 0
      end
      object GroupHeader1: TfrxGroupHeader
        Top = 207.874150000000000000
        Visible = False
        Width = 740.409927000000000000
        Condition = 'dbTec."Tecnico"'
      end
      object ReportSummary1: TfrxReportSummary
        Height = 26.456710000000000000
        Top = 340.157700000000000000
        Width = 740.409927000000000000
        object Shape3: TfrxShapeView
          ShiftMode = smDontShift
          Left = 623.244094490000000000
          Width = 116.787401574803100000
          Height = 26.456710000000000000
        end
        object Memo15: TfrxMemoView
          Left = 627.401980000000000000
          Top = 3.779530000000022000
          Width = 105.826708190000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<dbTec."ValorFinal">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object qTec: TnxQuery
    Database = DM.dbUp
    OnCalcFields = qTecCalcFields
    SQL.Strings = (
      'select *, '
      '(Select Min(DataI) as DataI from RA) as DataI,'
      '(Select Max(DataF) as DataF from RA) as DataF'
      'from raitem')
    Left = 112
    Top = 128
    object qTecNomeCli: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeCli'
      LookupDataSet = DM.mtCli
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Cliente'
      Size = 40
      Lookup = True
    end
    object qTecNomeTipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeTipo'
      Size = 12
      Calculated = True
    end
    object qTecValorStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'ValorStr'
      Calculated = True
    end
    object qTecSync: TBooleanField
      FieldName = 'Sync'
    end
    object qTecTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object qTecCliente: TStringField
      FieldName = 'Cliente'
      Size = 8
    end
    object qTecData: TDateField
      FieldName = 'Data'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qTecID: TWordField
      FieldName = 'ID'
    end
    object qTecIDRA: TWordField
      FieldName = 'IDRA'
    end
    object qTecTipo: TWordField
      FieldName = 'Tipo'
    end
    object qTecValor: TCurrencyField
      FieldName = 'Valor'
    end
    object qTecJustDiverg: TMemoField
      FieldName = 'JustDiverg'
      BlobType = ftMemo
    end
    object qTecDescr: TMemoField
      FieldName = 'Descr'
      BlobType = ftMemo
    end
    object qTecNumF: TIntegerField
      FieldName = 'NumF'
    end
    object qTecValorDef: TCurrencyField
      FieldName = 'ValorDef'
    end
    object qTecValorCli: TCurrencyField
      FieldName = 'ValorCli'
    end
    object qTecValorTec: TCurrencyField
      FieldName = 'ValorTec'
    end
    object qTecStatusTec: TWordField
      FieldName = 'StatusTec'
    end
    object qTecLogID: TIntegerField
      FieldName = 'LogID'
    end
    object qTecStatusCli: TWordField
      FieldName = 'StatusCli'
    end
    object qTecONServ: TBooleanField
      FieldName = 'ONServ'
    end
    object qTecExcluirServ: TBooleanField
      FieldName = 'ExcluirServ'
    end
    object qTecDataI: TDateField
      FieldName = 'DataI'
    end
    object qTecDataF: TDateField
      FieldName = 'DataF'
    end
    object qTecValorFinal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorFinal'
      Calculated = True
    end
    object qTecNomeTec: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeTec'
      LookupDataSet = DM.mtTec
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Tecnico'
      Size = 40
      Lookup = True
    end
  end
  object dbTec: TfrxDBDataset
    UserName = 'dbTec'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NomeCli=NomeCli'
      'NomeTipo=NomeTipo'
      'ValorStr=ValorStr'
      'Sync=Sync'
      'Tecnico=Tecnico'
      'Cliente=Cliente'
      'Data=Data'
      'ID=ID'
      'IDRA=IDRA'
      'Tipo=Tipo'
      'Valor=Valor'
      'JustDiverg=JustDiverg'
      'Descr=Descr'
      'NumF=NumF'
      'ValorDef=ValorDef'
      'ValorCli=ValorCli'
      'ValorTec=ValorTec'
      'StatusTec=StatusTec'
      'LogID=LogID'
      'StatusCli=StatusCli'
      'ONServ=ONServ'
      'ExcluirServ=ExcluirServ'
      'DataI=DataI'
      'DataF=DataF'
      'ValorFinal=ValorFinal'
      'NomeTec=NomeTec')
    DataSet = qTec
    Left = 168
    Top = 128
  end
end
