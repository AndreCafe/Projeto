object FrmRel: TFrmRel
  Left = 385
  Top = 252
  Width = 362
  Height = 320
  Caption = 'Relatórios'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBCaixa
    NoDataBehaviors = [ndMessageDialog, ndBlankReport]
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    DeviceType = 'Screen'
    Left = 69
    Top = 55
    Version = '6.03'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBCaixa'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26723
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentWidth = True
        Pen.Color = clGray
        mmHeight = 13229
        mmLeft = 0
        mmTop = 11377
        mmWidth = 197300
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Pen.Color = clGray
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8996
        mmLeft = 48154
        mmTop = 13494
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Fechamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 49742
        mmTop = 14023
        mmWidth = 19050
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'Fechamento'
        DataPipeline = ppDBCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBCaixa'
        mmHeight = 3704
        mmLeft = 49742
        mmTop = 17992
        mmWidth = 26723
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Pen.Color = clGray
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8996
        mmLeft = 77788
        mmTop = 13494
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Usuário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 79375
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'Usuario'
        DataPipeline = ppDBCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBCaixa'
        mmHeight = 3704
        mmLeft = 79375
        mmTop = 17992
        mmWidth = 29633
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 170657
        mmTop = 15875
        mmWidth = 17198
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Pen.Color = clGray
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8996
        mmLeft = 18521
        mmTop = 13229
        mmWidth = 1323
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'Numero'
        DataPipeline = ppDBCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBCaixa'
        mmHeight = 3704
        mmLeft = 4233
        mmTop = 17992
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Número'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 4233
        mmTop = 14023
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Abertura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 20108
        mmTop = 14023
        mmWidth = 14023
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'Abertura'
        DataPipeline = ppDBCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBCaixa'
        mmHeight = 3704
        mmLeft = 20108
        mmTop = 17992
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Caixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 22
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 9260
        mmLeft = 73554
        mmTop = 0
        mmWidth = 20373
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 60590
      mmPrintPosition = 0
      object ppShape10: TppShape
        UserName = 'Shape10'
        Pen.Color = clSilver
        mmHeight = 29369
        mmLeft = 0
        mmTop = 1323
        mmWidth = 81756
        BandType = 4
      end
      object ppSubReport2: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = False
        NewPrintJob = False
        ParentPrinterSetup = False
        ShiftRelativeTo = ppSubReport1
        TraverseAllData = False
        DataPipelineName = 'ppEstoque'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 41804
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppEstoque
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297127
          PrinterSetup.mmPaperWidth = 210079
          PrinterSetup.PaperSize = 9
          Left = 176
          Top = 152
          Version = '6.03'
          mmColumnWidth = 0
          DataPipelineName = 'ppEstoque'
          object ppTitleBand3: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 18785
            mmPrintPosition = 0
            object ppShape4: TppShape
              UserName = 'Shape4'
              ParentWidth = True
              Pen.Color = clGray
              Pen.Width = 2
              mmHeight = 7620
              mmLeft = 0
              mmTop = 11377
              mmWidth = 197379
              BandType = 1
            end
            object ppLabel6: TppLabel
              UserName = 'Label6'
              Caption = 'Produtos e Serviços'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              Font.Size = 11
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4763
              mmLeft = 0
              mmTop = 5556
              mmWidth = 38365
              BandType = 1
            end
            object ppLabel8: TppLabel
              UserName = 'Label8'
              Caption = 'Produto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 2117
              mmTop = 12965
              mmWidth = 11906
              BandType = 1
            end
            object ppLabel11: TppLabel
              UserName = 'Label11'
              Caption = 'Operação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 97631
              mmTop = 12965
              mmWidth = 14817
              BandType = 1
            end
            object ppLabel7: TppLabel
              UserName = 'Label7'
              Caption = 'Quantidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 118534
              mmTop = 12965
              mmWidth = 17463
              BandType = 1
            end
            object ppLabel9: TppLabel
              UserName = 'Label9'
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 142611
              mmTop = 12965
              mmWidth = 7938
              BandType = 1
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              Caption = 'Estoque Atual'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 165365
              mmTop = 12965
              mmWidth = 21696
              BandType = 1
            end
          end
          object ppDetailBand3: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5556
            mmPrintPosition = 0
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'Descricao'
              DataPipeline = ppEstoque
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppEstoque'
              mmHeight = 4233
              mmLeft = 27252
              mmTop = 529
              mmWidth = 69056
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'DBText13'
              DataField = 'TipoMov'
              DataPipeline = ppEstoque
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppEstoque'
              mmHeight = 3704
              mmLeft = 97631
              mmTop = 794
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText11: TppDBText
              UserName = 'DBText11'
              DataField = 'Quant'
              DataPipeline = ppEstoque
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppEstoque'
              mmHeight = 4233
              mmLeft = 118534
              mmTop = 529
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              BlankWhenZero = True
              DataField = 'TotalDesc'
              DataPipeline = ppEstoque
              DisplayFormat = '$#.##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppEstoque'
              mmHeight = 4233
              mmLeft = 142611
              mmTop = 529
              mmWidth = 19844
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              DataField = 'EstoqueAtual'
              DataPipeline = ppEstoque
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppEstoque'
              mmHeight = 3704
              mmLeft = 165365
              mmTop = 794
              mmWidth = 17198
              BandType = 4
            end
            object ppLine7: TppLine
              UserName = 'Line7'
              Pen.Color = clSilver
              ParentWidth = True
              Position = lpBottom
              Weight = 0.75
              mmHeight = 2646
              mmLeft = 0
              mmTop = 2910
              mmWidth = 197379
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'DBText5'
              DataField = 'Produto'
              DataPipeline = ppEstoque
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppEstoque'
              mmHeight = 3302
              mmLeft = 2381
              mmTop = 1058
              mmWidth = 23813
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 7408
            mmPrintPosition = 0
            object ppShape5: TppShape
              UserName = 'Shape5'
              ParentHeight = True
              ParentWidth = True
              Pen.Color = clGray
              Pen.Width = 2
              mmHeight = 7408
              mmLeft = 0
              mmTop = 0
              mmWidth = 197379
              BandType = 7
            end
            object ppDBCalc5: TppDBCalc
              UserName = 'DBCalc5'
              AutoSize = True
              DataField = 'ValorVendas'
              DataPipeline = ppEstoque
              DisplayFormat = ' $#.##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'ppEstoque'
              mmHeight = 4233
              mmLeft = 39423
              mmTop = 1323
              mmWidth = 34883
              BandType = 7
            end
            object ppLabel13: TppLabel
              UserName = 'Label13'
              Caption = 'Valor Total Vendas = '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 2381
              mmTop = 1323
              mmWidth = 36248
              BandType = 7
            end
          end
        end
      end
      object ppSubReport3: TppSubReport
        UserName = 'SubReport3'
        ExpandAll = False
        NewPrintJob = False
        ParentPrinterSetup = False
        ShiftRelativeTo = ppSubReport2
        TraverseAllData = False
        DataPipelineName = 'ppDBLancExtra'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 48948
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = ppDBLancExtra
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297127
          PrinterSetup.mmPaperWidth = 210079
          PrinterSetup.PaperSize = 9
          Left = 248
          Top = 224
          Version = '6.03'
          mmColumnWidth = 0
          DataPipelineName = 'ppDBLancExtra'
          object ppTitleBand4: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 19844
            mmPrintPosition = 0
            object ppShape6: TppShape
              UserName = 'Shape6'
              ParentWidth = True
              Pen.Color = clGray
              Pen.Width = 2
              mmHeight = 7673
              mmLeft = 0
              mmTop = 12171
              mmWidth = 197379
              BandType = 1
            end
            object ppLabel14: TppLabel
              UserName = 'Label14'
              Caption = 'Descrição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 95250
              mmTop = 13758
              mmWidth = 15346
              BandType = 1
            end
            object ppLabel16: TppLabel
              UserName = 'Label16'
              Caption = 'Tipo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 3175
              mmTop = 13758
              mmWidth = 6350
              BandType = 1
            end
            object ppLabel22: TppLabel
              UserName = 'Label22'
              Caption = 'Operação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 48948
              mmTop = 13758
              mmWidth = 14817
              BandType = 1
            end
            object ppLabel23: TppLabel
              UserName = 'Label23'
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 71438
              mmTop = 13758
              mmWidth = 7938
              BandType = 1
            end
            object ppLabel25: TppLabel
              UserName = 'Label25'
              Caption = 'Lançamentos Extras'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              Font.Size = 11
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4763
              mmLeft = 0
              mmTop = 6615
              mmWidth = 37835
              BandType = 1
            end
          end
          object ppDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              DataField = 'Descricao'
              DataPipeline = ppDBLancExtra
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBLancExtra'
              mmHeight = 3704
              mmLeft = 96309
              mmTop = 529
              mmWidth = 96838
              BandType = 4
            end
            object ppLine8: TppLine
              UserName = 'Line8'
              Pen.Color = clSilver
              ParentWidth = True
              Position = lpBottom
              Weight = 0.75
              mmHeight = 1852
              mmLeft = 0
              mmTop = 3175
              mmWidth = 197379
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'DBText16'
              DataField = 'Tipo'
              DataPipeline = ppDBLancExtra
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBLancExtra'
              mmHeight = 3704
              mmLeft = 2646
              mmTop = 529
              mmWidth = 44450
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              DataField = 'ValorFator'
              DataPipeline = ppDBLancExtra
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBLancExtra'
              mmHeight = 3704
              mmLeft = 71702
              mmTop = 529
              mmWidth = 23019
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'DBText18'
              DataField = 'OperacaoSt'
              DataPipeline = ppDBLancExtra
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBLancExtra'
              mmHeight = 3704
              mmLeft = 48948
              mmTop = 529
              mmWidth = 18256
              BandType = 4
            end
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 7673
            mmPrintPosition = 0
            object ppShape7: TppShape
              UserName = 'Shape7'
              ParentWidth = True
              Pen.Color = clGray
              Pen.Width = 2
              mmHeight = 7673
              mmLeft = 0
              mmTop = 0
              mmWidth = 197379
              BandType = 7
            end
            object ppLabel24: TppLabel
              UserName = 'Label24'
              Caption = 'Total final de lançamentos extras'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 2381
              mmTop = 1852
              mmWidth = 48154
              BandType = 7
            end
            object ppDBCalc6: TppDBCalc
              UserName = 'DBCalc6'
              DataField = 'ValorFator'
              DataPipeline = ppDBLancExtra
              DisplayFormat = '$#.##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'ppDBLancExtra'
              mmHeight = 4233
              mmLeft = 71438
              mmTop = 1588
              mmWidth = 24077
              BandType = 7
            end
          end
        end
      end
      object ppSubReport4: TppSubReport
        UserName = 'SubReport4'
        ExpandAll = False
        NewPrintJob = False
        ParentPrinterSetup = False
        ShiftRelativeTo = ppSubReport3
        TraverseAllData = False
        DataPipelineName = 'ppDBPacote'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 55563
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport4: TppChildReport
          AutoStop = False
          DataPipeline = ppDBPacote
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297127
          PrinterSetup.mmPaperWidth = 210079
          PrinterSetup.PaperSize = 9
          Left = 168
          Top = 144
          Version = '6.03'
          mmColumnWidth = 0
          DataPipelineName = 'ppDBPacote'
          object ppTitleBand5: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 21960
            mmPrintPosition = 0
            object ppShape8: TppShape
              UserName = 'Shape8'
              ParentWidth = True
              Pen.Color = clGray
              Pen.Width = 2
              mmHeight = 7673
              mmLeft = 0
              mmTop = 14288
              mmWidth = 197379
              BandType = 1
            end
            object ppLabel15: TppLabel
              UserName = 'Label15'
              Caption = 'Pacotes Vendidos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              Font.Size = 11
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4763
              mmLeft = 2117
              mmTop = 8731
              mmWidth = 33602
              BandType = 1
            end
            object ppLabel27: TppLabel
              UserName = 'Label27'
              Caption = 'Número de Horas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 5292
              mmTop = 15875
              mmWidth = 26723
              BandType = 1
            end
            object ppLabel28: TppLabel
              UserName = 'Label28'
              Caption = 'Quantidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 37306
              mmTop = 15875
              mmWidth = 17463
              BandType = 1
            end
            object ppLabel29: TppLabel
              UserName = 'Label29'
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 59796
              mmTop = 15875
              mmWidth = 7938
              BandType = 1
            end
            object ppLabel30: TppLabel
              UserName = 'Label30'
              Caption = 'Desconto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 83873
              mmTop = 15875
              mmWidth = 14552
              BandType = 1
            end
            object ppLabel31: TppLabel
              UserName = 'Label31'
              Caption = 'Total '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 108215
              mmTop = 15875
              mmWidth = 8467
              BandType = 1
            end
          end
          object ppDetailBand5: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object ppLine9: TppLine
              UserName = 'Line9'
              Pen.Color = clSilver
              Weight = 0.75
              mmHeight = 265
              mmLeft = 265
              mmTop = 4763
              mmWidth = 197300
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'DBText19'
              DataField = 'Horas'
              DataPipeline = ppDBPacote
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              OnFormat = ppDBText19Format
              DataPipelineName = 'ppDBPacote'
              mmHeight = 3704
              mmLeft = 14552
              mmTop = 529
              mmWidth = 8202
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DBText20'
              DataField = 'Quantidade'
              DataPipeline = ppDBPacote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPacote'
              mmHeight = 3704
              mmLeft = 37306
              mmTop = 529
              mmWidth = 16669
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText21'
              DataField = 'Valor'
              DataPipeline = ppDBPacote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPacote'
              mmHeight = 3704
              mmLeft = 59796
              mmTop = 529
              mmWidth = 19844
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              BlankWhenZero = True
              DataField = 'Desconto'
              DataPipeline = ppDBPacote
              DisplayFormat = '$#.##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPacote'
              mmHeight = 4233
              mmLeft = 83873
              mmTop = 265
              mmWidth = 19844
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText101'
              BlankWhenZero = True
              DataField = 'TotalFinal'
              DataPipeline = ppDBPacote
              DisplayFormat = '$#.##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBPacote'
              mmHeight = 3704
              mmLeft = 108215
              mmTop = 529
              mmWidth = 14817
              BandType = 4
            end
          end
          object ppSummaryBand4: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 7673
            mmPrintPosition = 0
            object ppShape9: TppShape
              UserName = 'Shape9'
              ParentWidth = True
              Pen.Color = clGray
              Pen.Width = 2
              mmHeight = 7673
              mmLeft = 0
              mmTop = 0
              mmWidth = 197379
              BandType = 7
            end
            object ppDBCalc7: TppDBCalc
              UserName = 'DBCalc7'
              DataField = 'Quantidade'
              DataPipeline = ppDBPacote
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPacote'
              mmHeight = 3704
              mmLeft = 37306
              mmTop = 1852
              mmWidth = 16933
              BandType = 7
            end
            object ppDBCalc8: TppDBCalc
              UserName = 'DBCalc8'
              DataField = 'Valor'
              DataPipeline = ppDBPacote
              DisplayFormat = '$#.##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'ppDBPacote'
              mmHeight = 3704
              mmLeft = 59796
              mmTop = 1852
              mmWidth = 16933
              BandType = 7
            end
            object ppDBCalc9: TppDBCalc
              UserName = 'DBCalc9'
              BlankWhenZero = True
              DataField = 'Quantidade'
              DataPipeline = ppDBPacote
              DisplayFormat = '$#.##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'ppDBPacote'
              mmHeight = 3704
              mmLeft = 83873
              mmTop = 1852
              mmWidth = 21167
              BandType = 7
            end
            object ppDBCalc10: TppDBCalc
              UserName = 'DBCalc10'
              DataField = 'TotalFinal'
              DataPipeline = ppDBPacote
              DisplayFormat = '$#.##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'ppDBPacote'
              mmHeight = 4233
              mmLeft = 108215
              mmTop = 1588
              mmWidth = 22754
              BandType = 7
            end
          end
        end
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'Máquinas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 2381
        mmWidth = 14817
        BandType = 4
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = 'Produtos e Serviços'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 13758
        mmWidth = 30692
        BandType = 4
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'Pacotes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 19315
        mmWidth = 12700
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Pen.Color = clSilver
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 0
        mmTop = 7408
        mmWidth = 81756
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        Pen.Color = clSilver
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 12965
        mmWidth = 81756
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line102'
        Pen.Color = clSilver
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 18521
        mmWidth = 81756
        BandType = 4
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'Sub-Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 25400
        mmWidth = 16140
        BandType = 4
      end
      object ppShape11: TppShape
        UserName = 'Shape101'
        Pen.Color = clSilver
        mmHeight = 23019
        mmLeft = 84931
        mmTop = 1323
        mmWidth = 81756
        BandType = 4
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'Lanç. Extras - Entradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 86519
        mmTop = 2381
        mmWidth = 36513
        BandType = 4
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = 'Saldo Caixa Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 86519
        mmTop = 13758
        mmWidth = 31485
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line103'
        Pen.Color = clSilver
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 84931
        mmTop = 7408
        mmWidth = 81756
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Pen.Color = clSilver
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 84931
        mmTop = 12965
        mmWidth = 81756
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Pen.Color = clSilver
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 84931
        mmTop = 18521
        mmWidth = 81756
        BandType = 4
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        Caption = 'Total Final '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 86519
        mmTop = 19315
        mmWidth = 19050
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Pen.Color = clSilver
        Position = lpLeft
        Weight = 0.75
        mmHeight = 28840
        mmLeft = 42333
        mmTop = 1588
        mmWidth = 4233
        BandType = 4
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        Pen.Color = clSilver
        Position = lpLeft
        Weight = 0.75
        mmHeight = 22754
        mmLeft = 128323
        mmTop = 1323
        mmWidth = 4233
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        OnGetText = ppDBText24GetText
        BlankWhenZero = True
        DataField = 'AcessoDesc'
        DataPipeline = ppDBCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBCaixa'
        mmHeight = 4233
        mmLeft = 43656
        mmTop = 2381
        mmWidth = 34131
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        OnGetText = ppDBText24GetText
        BlankWhenZero = True
        DataField = 'Vendas'
        DataPipeline = ppDBCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBCaixa'
        mmHeight = 4233
        mmLeft = 43656
        mmTop = 13758
        mmWidth = 34131
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        OnGetText = ppDBText24GetText
        DataField = 'SubTotal'
        DataPipeline = ppDBCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBCaixa'
        mmHeight = 4233
        mmLeft = 43656
        mmTop = 25400
        mmWidth = 34131
        BandType = 4
      end
      object ppDBText28: TppDBText
        OnPrint = ppDBText28Print
        UserName = 'DBText28'
        OnGetText = ppDBText24GetText
        BlankWhenZero = True
        DataField = 'LancExtrasE'
        DataPipeline = ppDBCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBCaixa'
        mmHeight = 4233
        mmLeft = 129646
        mmTop = 2381
        mmWidth = 33867
        BandType = 4
      end
      object ppDBText29: TppDBText
        OnPrint = ppDBText29Print
        UserName = 'DBText29'
        OnGetText = ppDBText24GetText
        BlankWhenZero = True
        DataField = 'SaldoAnt'
        DataPipeline = ppDBCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBCaixa'
        mmHeight = 4233
        mmLeft = 129646
        mmTop = 13758
        mmWidth = 34131
        BandType = 4
      end
      object ppDBText31: TppDBText
        OnPrint = ppDBText31Print
        UserName = 'DBText31'
        OnGetText = ppDBText24GetText
        DataField = 'TotalFinal'
        DataPipeline = ppDBCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBCaixa'
        mmHeight = 4233
        mmLeft = 129646
        mmTop = 19315
        mmWidth = 34396
        BandType = 4
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'Descontos s/ Máquinas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 8202
        mmWidth = 36248
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        OnGetText = ppDBText24GetText
        BlankWhenZero = True
        DataField = 'Descontos'
        DataPipeline = ppDBCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBCaixa'
        mmHeight = 4233
        mmLeft = 43656
        mmTop = 8202
        mmWidth = 33602
        BandType = 4
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Pen.Color = clSilver
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 24342
        mmWidth = 81756
        BandType = 4
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = 'Lanç. Extras - Saída'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 86519
        mmTop = 8202
        mmWidth = 31485
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        OnGetText = ppDBText24GetText
        BlankWhenZero = True
        DataField = 'LancExtrasS'
        DataPipeline = ppDBCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBCaixa'
        mmHeight = 4233
        mmLeft = 129646
        mmTop = 8202
        mmWidth = 34131
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        OnGetText = ppDBText24GetText
        BlankWhenZero = True
        DataField = 'Pacotes'
        DataPipeline = ppDBCaixa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBCaixa'
        mmHeight = 4233
        mmLeft = 43656
        mmTop = 19315
        mmWidth = 33602
        BandType = 4
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        ParentPrinterSetup = False
        TraverseAllData = False
        Visible = False
        DataPipelineName = 'ppDBAcesso'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 34396
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppDBAcesso
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297127
          PrinterSetup.mmPaperWidth = 210079
          PrinterSetup.PaperSize = 9
          Template.FileName = 'C:\Projetos\CyberMgr\maquinas.rtm'
          Left = 192
          Top = 168
          Version = '6.03'
          mmColumnWidth = 0
          DataPipelineName = 'ppDBAcesso'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 18256
            mmPrintPosition = 0
            object ppShape2: TppShape
              UserName = 'Shape2'
              ParentWidth = True
              Pen.Color = clGray
              Pen.Width = 2
              mmHeight = 7408
              mmLeft = 0
              mmTop = 10848
              mmWidth = 197379
              BandType = 1
            end
            object ppLabel20: TppLabel
              UserName = 'Label20'
              Caption = 'Máquina'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 3175
              mmTop = 12171
              mmWidth = 12965
              BandType = 1
            end
            object ppLabel17: TppLabel
              UserName = 'Label17'
              Caption = 'Tempo de Uso'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 22754
              mmTop = 12171
              mmWidth = 22225
              BandType = 1
            end
            object ppLabel18: TppLabel
              UserName = 'Label18'
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 52917
              mmTop = 12171
              mmWidth = 7938
              BandType = 1
            end
            object ppLabel26: TppLabel
              UserName = 'Label26'
              Caption = 'Máquinas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              Font.Size = 11
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4763
              mmLeft = 0
              mmTop = 5027
              mmWidth = 17992
              BandType = 1
            end
          end
          object ppHeaderBand2: TppHeaderBand
            Visible = False
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object ppLine1: TppLine
              UserName = 'Line1'
              Pen.Color = clSilver
              Weight = 0.75
              mmHeight = 265
              mmLeft = 265
              mmTop = 4763
              mmWidth = 197300
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText5'
              DataField = 'Maquina'
              DataPipeline = ppDBAcesso
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBAcesso'
              mmHeight = 3704
              mmLeft = 6085
              mmTop = 529
              mmWidth = 6085
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DBText7'
              DataField = 'TempoCobrado'
              DataPipeline = ppDBAcesso
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              OnFormat = ppDBText7Format
              DataPipelineName = 'ppDBAcesso'
              mmHeight = 3704
              mmLeft = 22754
              mmTop = 529
              mmWidth = 16669
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'DBText8'
              DataField = 'Valor'
              DataPipeline = ppDBAcesso
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBAcesso'
              mmHeight = 3704
              mmLeft = 52917
              mmTop = 529
              mmWidth = 19844
              BandType = 4
            end
          end
          object ppFooterBand2: TppFooterBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 6879
            mmPrintPosition = 0
            object ppShape3: TppShape
              UserName = 'Shape3'
              ParentWidth = True
              Pen.Color = clGray
              Pen.Width = 2
              mmHeight = 6879
              mmLeft = 0
              mmTop = 0
              mmWidth = 197379
              BandType = 7
            end
            object ppLine3: TppLine
              UserName = 'Line3'
              Pen.Color = clSilver
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 529
              mmTop = 0
              mmWidth = 196057
              BandType = 7
            end
            object ppDBCalc1: TppDBCalc
              UserName = 'DBCalc1'
              DataField = 'TempoCobrado'
              DataPipeline = ppDBAcesso
              DisplayFormat = 'hh:mm:ss'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              OnFormat = ppDBCalc1Format
              DataPipelineName = 'ppDBAcesso'
              mmHeight = 3704
              mmLeft = 22754
              mmTop = 1323
              mmWidth = 17727
              BandType = 7
            end
            object ppDBCalc2: TppDBCalc
              UserName = 'DBCalc2'
              DataField = 'Valor'
              DataPipeline = ppDBAcesso
              DisplayFormat = '$#####.##'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'ppDBAcesso'
              mmHeight = 3704
              mmLeft = 52917
              mmTop = 1323
              mmWidth = 20108
              BandType = 7
            end
          end
        end
      end
      object lbAguardando: TppLabel
        UserName = 'd'
        Caption = '** Acessos Aguardando Pagamento = R$ 35,90'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 4318
        mmLeft = 86519
        mmTop = 25400
        mmWidth = 79121
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Color = clSilver
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 3969
        mmLeft = 0
        mmTop = 5821
        mmWidth = 197300
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 20108
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 185474
        mmTop = 1323
        mmWidth = 10583
        BandType = 8
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Impresso em:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 1588
        mmWidth = 17198
        BandType = 8
      end
    end
  end
  object ppDBCaixa: TppDBPipeline
    DataSource = dsCaixa
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DBCaixa'
    Left = 101
    Top = 55
    object ppDBCaixappField1: TppField
      FieldAlias = 'Numero'
      FieldName = 'Numero'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBCaixappField2: TppField
      FieldAlias = 'Abertura'
      FieldName = 'Abertura'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBCaixappField3: TppField
      FieldAlias = 'Fechamento'
      FieldName = 'Fechamento'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBCaixappField4: TppField
      FieldAlias = 'Usuario'
      FieldName = 'Usuario'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDBCaixappField5: TppField
      FieldAlias = 'LancExtrasE'
      FieldName = 'LancExtrasE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBCaixappField6: TppField
      FieldAlias = 'LancExtrasS'
      FieldName = 'LancExtrasS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDBCaixappField7: TppField
      FieldAlias = 'Descontos'
      FieldName = 'Descontos'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDBCaixappField8: TppField
      FieldAlias = 'Internet'
      FieldName = 'Internet'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDBCaixappField9: TppField
      FieldAlias = 'Pacotes'
      FieldName = 'Pacotes'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDBCaixappField10: TppField
      FieldAlias = 'Vendas'
      FieldName = 'Vendas'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDBCaixappField11: TppField
      FieldAlias = 'SaldoAnt'
      FieldName = 'SaldoAnt'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDBCaixappField12: TppField
      FieldAlias = 'Aberto'
      FieldName = 'Aberto'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDBCaixappField13: TppField
      FieldAlias = 'Obs'
      FieldName = 'Obs'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDBCaixappField14: TppField
      FieldAlias = 'TotLancExtra'
      FieldName = 'TotLancExtra'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDBCaixappField15: TppField
      FieldAlias = 'SubTotal'
      FieldName = 'SubTotal'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDBCaixappField16: TppField
      FieldAlias = 'TotalFinal'
      FieldName = 'TotalFinal'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDBCaixappField17: TppField
      FieldAlias = 'AcessoDesc'
      FieldName = 'AcessoDesc'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
  end
  object dsCaixa: TDataSource
    DataSet = tbCaixa
    Left = 160
    Top = 99
  end
  object tbCaixa: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Numero'
        DataType = ftAutoInc
      end
      item
        Name = 'Abertura'
        DataType = ftDateTime
      end
      item
        Name = 'Fechamento'
        DataType = ftDateTime
      end
      item
        Name = 'Usuario'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'LancExtrasE'
        DataType = ftCurrency
      end
      item
        Name = 'LancExtrasS'
        DataType = ftCurrency
      end
      item
        Name = 'Descontos'
        DataType = ftCurrency
      end
      item
        Name = 'Internet'
        DataType = ftCurrency
      end
      item
        Name = 'Pacotes'
        DataType = ftCurrency
      end
      item
        Name = 'Vendas'
        DataType = ftCurrency
      end
      item
        Name = 'SaldoAnt'
        DataType = ftCurrency
      end
      item
        Name = 'Aberto'
        DataType = ftBoolean
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'AguardandoPagto'
        DataType = ftCurrency
      end>
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'INumero'
        Fields = 'Numero'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IAberto'
        Fields = 'Aberto'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'IDia'
        Fields = 'Abertura'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'INumero'
    SessionName = 'SesPad'
    TableName = 'Caixa'
    OnCalcFields = tbCaixaCalcFields
    Left = 104
    Top = 99
    object tbCaixaNumero: TAutoIncField
      FieldName = 'Numero'
    end
    object tbCaixaAbertura: TDateTimeField
      FieldName = 'Abertura'
    end
    object tbCaixaFechamento: TDateTimeField
      FieldName = 'Fechamento'
    end
    object tbCaixaUsuario: TStringField
      FieldName = 'Usuario'
      Size = 10
    end
    object tbCaixaLancExtrasE: TCurrencyField
      FieldName = 'LancExtrasE'
    end
    object tbCaixaLancExtrasS: TCurrencyField
      FieldName = 'LancExtrasS'
    end
    object tbCaixaDescontos: TCurrencyField
      FieldName = 'Descontos'
    end
    object tbCaixaInternet: TCurrencyField
      FieldName = 'Internet'
    end
    object tbCaixaPacotes: TCurrencyField
      FieldName = 'Pacotes'
    end
    object tbCaixaVendas: TCurrencyField
      FieldName = 'Vendas'
    end
    object tbCaixaSaldoAnt: TCurrencyField
      FieldName = 'SaldoAnt'
    end
    object tbCaixaAberto: TBooleanField
      FieldName = 'Aberto'
    end
    object tbCaixaObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tbCaixaTotLancExtra: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TotLancExtra'
      Calculated = True
    end
    object tbCaixaSubTotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SubTotal'
      Calculated = True
    end
    object tbCaixaTotalFinal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TotalFinal'
      Calculated = True
    end
    object tbCaixaAcessoDesc: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'AcessoDesc'
      Calculated = True
    end
    object tbCaixaAguardandoPagto: TCurrencyField
      FieldName = 'AguardandoPagto'
    end
  end
  object dsEstoque: TDataSource
    DataSet = qEstoque
    Left = 160
    Top = 131
  end
  object tbLancExtra: TffTable
    DatabaseName = 'DB'
    FieldDefs = <
      item
        Name = 'Numero'
        DataType = ftAutoInc
      end
      item
        Name = 'Dia'
        DataType = ftDateTime
      end
      item
        Name = 'Caixa'
        DataType = ftInteger
      end
      item
        Name = 'Usuario'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'Entrada'
        DataType = ftBoolean
      end
      item
        Name = 'Tipo'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end>
    IndexDefs = <
      item
        Name = 'Sequential Access Index'
        Options = [ixUnique, ixCaseInsensitive, ixExpression]
      end
      item
        Name = 'IDia'
        Fields = 'Dia'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'ICaixa'
        Fields = 'Caixa'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'ICaixa'
    MasterFields = 'Numero'
    MasterSource = Dados.dsCaixa
    SessionName = 'SesPad'
    TableName = 'LancExtra'
    OnCalcFields = tbLancExtraCalcFields
    Left = 104
    Top = 131
    object tbLancExtraNumero: TAutoIncField
      FieldName = 'Numero'
    end
    object tbLancExtraDia: TDateTimeField
      FieldName = 'Dia'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object tbLancExtraCaixa: TIntegerField
      FieldName = 'Caixa'
    end
    object tbLancExtraUsuario: TStringField
      FieldName = 'Usuario'
      Size = 10
    end
    object tbLancExtraEntrada: TBooleanField
      FieldName = 'Entrada'
    end
    object tbLancExtraTipo: TStringField
      FieldName = 'Tipo'
      Size = 30
    end
    object tbLancExtraDescricao: TStringField
      FieldName = 'Descricao'
      Size = 40
    end
    object tbLancExtraValor: TCurrencyField
      FieldName = 'Valor'
    end
    object tbLancExtraObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object tbLancExtraValorFator: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorFator'
      Calculated = True
    end
    object tbLancExtraOperacaoSt: TStringField
      FieldKind = fkCalculated
      FieldName = 'OperacaoSt'
      Size = 7
      Calculated = True
    end
  end
  object dsAcessos: TDataSource
    DataSet = qAcesso
    Left = 192
    Top = 99
  end
  object dsLancExtra: TDataSource
    DataSet = tbLancExtra
    Left = 192
    Top = 131
  end
  object ppDBAcesso: TppDBPipeline
    DataSource = dsAcessos
    UserName = 'DBAcesso'
    Left = 133
    Top = 55
    MasterDataPipelineName = 'ppDBCaixa'
  end
  object ppDBLancExtra: TppDBPipeline
    DataSource = dsLancExtra
    UserName = 'DBLancExtra'
    Left = 165
    Top = 55
    MasterDataPipelineName = 'ppDBCaixa'
  end
  object ppEstoque: TppDBPipeline
    DataSource = dsEstoque
    UserName = 'DBEstoque'
    Left = 197
    Top = 55
    MasterDataPipelineName = 'ppDBCaixa'
  end
  object qAcesso: TffQuery
    DatabaseName = 'DB'
    SessionName = 'SesPad'
    SQL.Strings = (
      
        'select Maquina, Sum(ValorFinalAcesso) as Valor, Sum(Desconto) as' +
        ' Desconto, Sum(TempoCobrado - '
      'Floor(TempoCobrado)) as TempoCobrado FROM Acesso'
      
        'WHERE (Maquina >0) and (Caixa = :NumCaixa) and (not (DataPagto i' +
        's Null))'
      'GROUP BY Maquina')
    OnCalcFields = qAcessoCalcFields
    Left = 69
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NumCaixa'
        ParamType = ptInput
        Value = 10
      end>
    object qAcessoMaquina: TWordField
      FieldName = 'Maquina'
    end
    object qAcessoValor: TCurrencyField
      FieldName = 'Valor'
    end
    object qAcessoDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object qAcessoTempoCobrado: TFloatField
      FieldName = 'TempoCobrado'
    end
    object qAcessoNome: TStringField
      FieldKind = fkCalculated
      FieldName = 'Nome'
      Calculated = True
    end
    object qAcessoTotalFinal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalFinal'
      Calculated = True
    end
    object qAcessoTempo: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'Tempo'
      Calculated = True
    end
    object qAcessoValorFinal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorFinal'
      Calculated = True
    end
  end
  object qEstoque: TffQuery
    DatabaseName = 'DB'
    SessionName = 'SesPad'
    SQL.Strings = (
      
        'select I.Produto, I.TipoMov , Sum(I.Quant) as Quant, Sum(I.Total' +
        ') as Total, Sum(I.Desconto) as '
      'Desconto FROM '
      'ItensME I'
      'where (Caixa=:NumCaixa) '
      'GROUP BY Produto, TipoMov')
    OnCalcFields = qEstoqueCalcFields
    Left = 69
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NumCaixa'
        ParamType = ptInput
        Value = 0
      end>
    object qEstoqueTipoMov: TStringField
      FieldName = 'TipoMov'
      Size = 15
    end
    object qEstoqueQuant: TFloatField
      FieldName = 'Quant'
    end
    object qEstoqueTotal: TCurrencyField
      FieldName = 'Total'
    end
    object qEstoqueEstoqueAtual: TFloatField
      FieldKind = fkLookup
      FieldName = 'EstoqueAtual'
      LookupDataSet = Dados.tbPro
      LookupKeyFields = 'Codigo'
      LookupResultField = 'EstoqueAtual'
      KeyFields = 'Produto'
      Lookup = True
    end
    object qEstoqueValorVendas: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorVendas'
      Calculated = True
    end
    object qEstoqueDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object qEstoqueTotalDesc: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TotalDesc'
      Calculated = True
    end
    object qEstoqueProduto: TStringField
      FieldName = 'Produto'
      Size = 15
    end
    object qEstoqueDescricao: TStringField
      FieldKind = fkLookup
      FieldName = 'Descricao'
      LookupDataSet = Dados.tbPro
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'Produto'
      Size = 40
      Lookup = True
    end
  end
  object qPacote: TffQuery
    DatabaseName = 'DB'
    SessionName = 'SesPad'
    SQL.Strings = (
      
        'select Tempo as Horas, Count(Numero) as Quantidade, Sum(Valor) a' +
        's Valor, Sum(Desconto) as Desconto '
      'FROM Acesso'
      'WHERE (Tipo=1) and (Caixa = :NumCaixa)'
      'GROUP BY Horas')
    OnCalcFields = qPacoteCalcFields
    Left = 69
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NumCaixa'
        ParamType = ptInput
        Value = 10
      end>
    object qPacoteTotalFInal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TotalFinal'
      Calculated = True
    end
    object qPacoteValor: TCurrencyField
      FieldName = 'Valor'
    end
    object qPacoteDesconto: TCurrencyField
      FieldName = 'Desconto'
    end
    object qPacoteHoras: TDateTimeField
      FieldName = 'Horas'
    end
    object qPacoteQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
  end
  object dsPacote: TDataSource
    DataSet = qPacote
    Left = 160
    Top = 192
  end
  object ppDBPacote: TppDBPipeline
    DataSource = dsPacote
    UserName = 'DBPacote'
    Left = 229
    Top = 55
  end
end
