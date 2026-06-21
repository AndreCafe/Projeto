object dmRels: TdmRels
  OldCreateOrder = False
  Height = 158
  Width = 256
  object frRA: TfrxReport
    Version = '3.18'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 38714.484795706000000000
    ReportOptions.LastChange = 38777.580221793980000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 48
    Top = 32
    Datasets = <
      item
        DataSet = dbParams
        DataSetName = 'dbParams'
      end
      item
        DataSet = dbRA
        DataSetName = 'dbRA'
      end
      item
        DataSet = dbRAItem
        DataSetName = 'dbRAItem'
      end
      item
        DataSet = dbRAOS
        DataSetName = 'dbRAOS'
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
      object PageHeader2: TfrxPageHeader
        Height = 177.637910000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        Stretched = True
        object Picture1: TfrxPictureView
          Left = 7.559060000000000000
          Top = 3.779530000000001000
          Width = 219.212740000000000000
          Height = 56.692950000000000000
          AutoSize = True
          DataField = 'BitMap'
          DataSet = dbParams
          DataSetName = 'dbParams'
        end
        object Memo1: TfrxMemoView
          Left = 236.031648500000000000
          Top = 18.897635360000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Relat'#195#179'rio de Atendimento')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 597.165740000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#161'gina [Page] / [TotalPages#]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 7.559060000000000000
          Top = 75.590600000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8 = (
            'Cliente')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 7.559060000000000000
          Top = 94.488250000000000000
          Width = 510.236550000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo4OnBeforePrint'
          DataSet = dbRA
          DataSetName = 'dbRA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[dbRA."Cliente"]- [dbRA."NomeCli"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Top = 120.944960000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8 = (
            'T'#195#169'cnico')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 7.559060000000000000
          Top = 139.842610000000000000
          Width = 510.236550000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo4OnBeforePrint'
          DataSet = dbRA
          DataSetName = 'dbRA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[dbRA."Tecnico"]- [dbRA."NomeTec"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 532.913730000000000000
          Top = 71.811070000000000000
          Height = 90.708720000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo7: TfrxMemoView
          Left = 536.693260000000000000
          Top = 94.488250000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DataSet = dbRA
          DataSetName = 'dbRA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[dbRA."DataI"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 536.693260000000000000
          Top = 75.590600000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8 = (
            'Data Inicial')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 536.693260000000000000
          Top = 120.944960000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8 = (
            'Data Final')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 536.693260000000000000
          Top = 139.842610000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          DataField = 'DataF'
          DataSet = dbRA
          DataSetName = 'dbRA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[dbRA."DataF"]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Align = baWidth
          Top = 117.165430000000000000
          Width = 740.409927000000000000
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Align = baWidth
          Top = 71.811070000000000000
          Width = 740.409927000000000000
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          Align = baWidth
          Top = 162.519790000000000000
          Width = 740.409927000000000000
          Frame.Typ = [ftTop]
        end
        object Line5: TfrxLineView
          Align = baLeft
          Top = 71.811070000000000000
          Height = 90.708720000000000000
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          Align = baRight
          Left = 740.409927000000000000
          Top = 71.811070000000000000
          Height = 90.708720000000000000
          Frame.Typ = [ftLeft]
        end
      end
      object MasterData3: TfrxMasterData
        Height = 34.015770000000000000
        Top = 257.008040000000000000
        Width = 740.409927000000000000
        Child = frRA.Child1
        DataSet = dbRA
        DataSetName = 'dbRA'
        PrintChildIfInvisible = True
        PrintIfDetailEmpty = True
        RowCount = 0
        object Subreport1: TfrxSubreport
          Top = 3.779529999999965000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = frRA.Page2
        end
      end
      object Child1: TfrxChild
        Height = 162.519790000000000000
        Top = 313.700990000000000000
        Width = 740.409927000000000000
        Child = frRA.Child2
        object Shape2: TfrxShapeView
          Width = 740.409927000000000000
          Height = 151.181200000000000000
        end
        object Memo18: TfrxMemoView
          ShiftMode = smDontShift
          Left = 7.559060000000000000
          Top = 11.338590000000010000
          Width = 725.291807000000000000
          Height = 79.370130000000000000
          Clipped = False
          HAlign = haBlock
          Memo.UTF8 = (
            
              'A assinatura deste relat'#195#179'rio atesta o aceite dos servi'#195#167'os exec' +
              'utados e a consecutiva libera'#195#167#195#163'o para faturamento. Fica com es' +
              'te dispensada a assinatura individual das ordens de servi'#195#167'o di'#195 +
              #161'rias. Para detalhamento do servi'#195#167'o executado favor consultar o' +
              's relat'#195#179'rios de Ordens de Servi'#195#167'o individualizados.')
          WordBreak = True
        end
        object Line16: TfrxLineView
          Left = 226.771800000000000000
          Top = 117.165430000000000000
          Width = 495.118430000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo19: TfrxMemoView
          Left = 230.551330000000000000
          Top = 120.944960000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            'Respons'#195#161'vel Cliente')
        end
      end
      object Child2: TfrxChild
        Height = 26.456710000000000000
        Top = 498.897960000000000000
        Width = 740.409927000000000000
        Child = frRA.Child3
        object Subreport2: TfrxSubreport
          Top = 3.779530000000022000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = frRA.Page3
        end
      end
      object Child3: TfrxChild
        Height = 192.756030000000000000
        Top = 548.031849999999900000
        Width = 740.409927000000000000
        object Shape7: TfrxShapeView
          Align = baClient
          Width = 740.409927000000000000
          Height = 192.756030000000000000
        end
        object Memo36: TfrxMemoView
          ShiftMode = smDontShift
          Left = 7.559060000000000000
          Top = 45.354360000000040000
          Width = 725.291807000000000000
          Height = 79.370130000000000000
          Clipped = False
          HAlign = haBlock
          Memo.UTF8 = (
            
              'A assinatura deste relat'#195#179'rio atesta o aceite das despesas apont' +
              'adas e consecutiva libera'#195#167#195#163'o para faturamento. '
            ''
            
              '(1) Quilometragem a ser computada segundo valor vigente contratu' +
              'al na data de faturamento.'
            '(2) Despesas de quilometragem a serem inclu'#195#173'das.')
          WordBreak = True
        end
        object Line30: TfrxLineView
          Left = 226.771800000000000000
          Top = 158.740260000000000000
          Width = 495.118430000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo37: TfrxMemoView
          Left = 230.551330000000000000
          Top = 162.519789999999900000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          Memo.UTF8 = (
            'Respons'#195#161'vel Cliente')
        end
        object Line31: TfrxLineView
          Left = 102.047310000000000000
          Top = 34.015769999999970000
          Width = 283.464749999997000000
          Frame.Typ = [ftTop]
        end
        object Memo38: TfrxMemoView
          Left = 241.889722280000000000
          Top = 7.559060000000045000
          Width = 136.062992130000000000
          Height = 18.897650000000000000
          DisplayFormat.DecimalSeparator = ','
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[TotalDesp]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 181.417440000000000000
          Top = 7.559060000000045000
          Width = 52.913420000000000000
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
        object Line7: TfrxLineView
          Left = 102.047310000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft]
        end
        object Line8: TfrxLineView
          Left = 238.110390000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          Left = 385.512060000000000000
          Height = 34.015770000000000000
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          Top = 34.015770000000090000
          Width = 102.047310000000000000
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
        object Line11: TfrxLineView
          Left = 385.512060000000000000
          Top = 34.015770000000090000
          Width = 355.275820000000000000
          Frame.Color = clSilver
          Frame.Typ = [ftTop]
        end
      end
    end
    object Page2: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 37.795300000000000000
        Top = 113.385900000000000000
        Width = 740.409927000000000000
        DataSet = dbRAOS
        DataSetName = 'dbRAOS'
        RowCount = 0
        object Shape3: TfrxShapeView
          Align = baClient
          Width = 740.409927000000000000
          Height = 37.795300000000000000
        end
        object Line17: TfrxLineView
          Left = 370.393940000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft]
        end
        object Line18: TfrxLineView
          Left = 597.165740000000000000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo20: TfrxMemoView
          Left = 7.559060000000000000
          Top = 7.559059999999931000
          Width = 347.716760000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          DataField = 'ChaveOS'
          DataSet = dbRAOS
          DataSetName = 'dbRAOS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8 = (
            '[dbRAOS."ChaveOS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 374.173470000000000000
          Top = 7.559059999999931000
          Width = 219.212740000000000000
          Height = 22.677180000000000000
          DataField = 'DataOS'
          DataSet = dbRAOS
          DataSetName = 'dbRAOS'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[dbRAOS."DataOS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 604.724800000000000000
          Top = 7.559059999999931000
          Width = 120.944960000000000000
          Height = 22.677180000000000000
          DataField = 'Horas'
          DataSet = dbRAOS
          DataSetName = 'dbRAOS'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[dbRAOS."Horas"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line21: TfrxLineView
          Align = baWidth
          Top = 34.015769999999990000
          Frame.Typ = [ftLeft]
        end
      end
      object Header1: TfrxHeader
        Height = 71.811070000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        ReprintOnNewPage = True
        object Line25: TfrxLineView
          Left = 597.165740000000000000
          Top = 34.015770000000010000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft]
        end
        object Shape4: TfrxShapeView
          Align = baClient
          Width = 740.409927000000000000
          Height = 71.811070000000000000
        end
        object Memo22: TfrxMemoView
          Align = baCenter
          Left = 154.771753500000000000
          Top = 7.559059999999999000
          Width = 430.866420000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Ordens de Servi'#195#167'o Apontadas no Per'#195#173'odo')
          ParentFont = False
        end
        object Line24: TfrxLineView
          Left = 370.393940000000000000
          Top = 34.015770000000010000
          Height = 37.795300000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo24: TfrxMemoView
          Left = 11.338590000000000000
          Top = 41.574830000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'OS')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 374.173470000000000000
          Top = 41.574830000000000000
          Width = 219.212740000000000000
          Height = 22.677180000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Data')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 600.945270000000000000
          Top = 41.574830000000000000
          Width = 124.724490000000000000
          Height = 22.677180000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Horas')
          ParentFont = False
        end
        object Line19: TfrxLineView
          Top = 34.015770000000010000
          Width = 737.008350000000000000
          Frame.Typ = [ftTop]
        end
      end
    end
    object Page3: TfrxReportPage
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
      object MasterData4: TfrxMasterData
        Height = 30.236240000000000000
        Top = 105.826840000000000000
        Width = 740.409927000000000000
        DataSet = dbRAItem
        DataSetName = 'dbRAItem'
        RowCount = 0
        Stretched = True
        object Shape5: TfrxShapeView
          Align = baClient
          Width = 740.409927000000000000
          Height = 30.236240000000000000
        end
        object Memo27: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'Data'
          DataSet = dbRAItem
          DataSetName = 'dbRAItem'
          DisplayFormat.DecimalSeparator = ','
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          HAlign = haCenter
          Memo.UTF8 = (
            '[dbRAItem."Data"]')
        end
        object Memo28: TfrxMemoView
          Left = 241.889920000000000000
          Top = 3.779529999999994000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DataSet = dbRAItem
          DataSetName = 'dbRAItem'
          Memo.UTF8 = (
            '[dbRAItem."ValorStr"]')
        end
        object Memo29: TfrxMemoView
          Left = 389.291590000000000000
          Top = 3.779529999999994000
          Width = 343.937230000000000000
          Height = 18.897650000000000000
          StretchMode = smActualHeight
          Clipped = False
          DataField = 'Descr'
          DataSet = dbRAItem
          DataSetName = 'dbRAItem'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Memo.UTF8 = (
            '[dbRAItem."Descr"]')
          ParentFont = False
          WordBreak = True
        end
        object Line22: TfrxLineView
          Left = 102.047310000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Line26: TfrxLineView
          Left = 238.110390000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
        object Memo33: TfrxMemoView
          Left = 105.826840000000000000
          Top = 3.779529999999994000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DataSet = dbRAItem
          DataSetName = 'dbRAItem'
          Memo.UTF8 = (
            '[dbRAItem."NomeTipo"]')
        end
        object Line29: TfrxLineView
          Left = 385.512060000000000000
          Height = 30.236240000000000000
          StretchMode = smMaxHeight
          Frame.Typ = [ftLeft]
        end
      end
      object Header2: TfrxHeader
        Height = 64.252010000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Shape6: TfrxShapeView
          Align = baClient
          Width = 740.409927000000000000
          Height = 64.252010000000000000
        end
        object Line20: TfrxLineView
          Top = 34.015770000000010000
          Width = 740.787880000000000000
          Frame.Typ = [ftTop]
        end
        object Memo30: TfrxMemoView
          Align = baCenter
          Left = 132.094573500000000000
          Top = 3.779530000000001000
          Width = 476.220780000000000000
          Height = 26.456710000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Despesas Ressarc'#195#173'veis Apontadas no Per'#195#173'odo')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 3.779530000000000000
          Top = 37.795300000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Data')
          ParentFont = False
        end
        object Line23: TfrxLineView
          Left = 102.047310000000000000
          Top = 34.015770000000010000
          Height = 30.236240000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo32: TfrxMemoView
          Left = 105.826840000000000000
          Top = 37.795300000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Tipo')
          ParentFont = False
        end
        object Line27: TfrxLineView
          Left = 238.110390000000000000
          Top = 34.015770000000010000
          Height = 30.236240000000000000
          Frame.Typ = [ftLeft]
        end
        object Memo34: TfrxMemoView
          Left = 241.889920000000000000
          Top = 37.795300000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'Valor')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 389.291590000000000000
          Top = 37.795300000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'Observa'#195#167#195#181'es')
          ParentFont = False
        end
        object Line28: TfrxLineView
          Left = 385.512060000000000000
          Top = 34.015770000000010000
          Height = 30.236240000000000000
          Frame.Typ = [ftLeft]
        end
      end
    end
  end
  object dbRA: TfrxDBDataset
    RangeBegin = rbCurrent
    RangeEnd = reCurrent
    UserName = 'dbRA'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Sync=Sync'
      'Tecnico=Tecnico'
      'Cliente=Cliente'
      'DataI=DataI'
      'DataF=DataF'
      'LogID=LogID'
      'ChaveU=ChaveU'
      'NomeCli=NomeCli'
      'NumF=NumF'
      'StatusCli=StatusCli'
      'StatusTec=StatusTec'
      'DHUpload=DHUpload'
      'ID=ID'
      'NomeTec=NomeTec')
    DataSet = DM.tRA
    Left = 96
    Top = 32
  end
  object dbRAOS: TfrxDBDataset
    UserName = 'dbRAOS'
    OnCheckEOF = dbRAOSCheckEOF
    CloseDataSource = False
    FieldAliases.Strings = (
      'Sync=Sync'
      'Tecnico=Tecnico'
      'Cliente=Cliente'
      'DataOS=DataOS'
      'LogID=LogID'
      'ChaveU=ChaveU'
      'NumF=NumF'
      'Horas=Horas'
      'IDOS=IDOS'
      'IDRA=IDRA'
      'ChaveOS=ChaveOS')
    DataSet = DM.tRAOS
    Left = 144
    Top = 32
  end
  object dbRAItem: TfrxDBDataset
    UserName = 'dbRAItem'
    CloseDataSource = False
    DataSet = DM.tRAItem
    Left = 48
    Top = 88
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
    Left = 192
    Top = 32
  end
  object dbParams: TfrxDBDataset
    UserName = 'dbParams'
    CloseDataSource = False
    DataSet = DM.tParametro
    Left = 112
    Top = 88
  end
end
