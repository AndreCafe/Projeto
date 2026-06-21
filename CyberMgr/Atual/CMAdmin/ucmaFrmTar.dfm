inherited FrmBase1: TFrmBase1
  Width = 444
  Height = 334
  Caption = 'FrmBase1'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 23
    Width = 436
    Height = 284
    object cxPageControl1: TcxPageControl
      Left = 0
      Top = 0
      Width = 436
      Height = 193
      ActivePage = cxTabSheet1
      Align = alTop
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
      TabOrder = 0
      ClientRectBottom = 193
      ClientRectRight = 436
      ClientRectTop = 23
      object cxTabSheet1: TcxTabSheet
        Caption = '&1- Tipos de Acesso'
        ImageIndex = 0
        object cxRadioButton1: TcxRadioButton
          Left = 32
          Top = 48
          Width = 113
          Height = 17
          Caption = 'Tarifa'#231#227'o B'#225'sica'
          TabOrder = 0
        end
        object cxRadioButton2: TcxRadioButton
          Left = 32
          Top = 80
          Width = 201
          Height = 73
          Caption = 'Pr'#233'-Pagos e Pacotes'
          TabOrder = 1
          WordWrap = True
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = 'P'#243's-Pago'
        ImageIndex = 1
      end
      object cxTabSheet3: TcxTabSheet
        Caption = 'Pr'#233'-Pago'
        ImageIndex = 2
      end
    end
    object LMDSimplePanel1: TLMDSimplePanel
      Left = 0
      Top = 244
      Width = 436
      Height = 40
      UseDockManager = False
      Align = alBottom
      Bevel.BorderSides = [fsTop]
      Bevel.Mode = bmEdge
      TabOrder = 1
      object cxButton1: TcxButton
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = 'cxButton1'
        TabOrder = 0
      end
      object cxButton2: TcxButton
        Left = 96
        Top = 8
        Width = 75
        Height = 25
        Caption = 'cxButton2'
        TabOrder = 1
      end
    end
  end
  inherited BarMgr: TdxBarManager
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'BarraTabSheet'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxBarSubItem1
            Visible = True
          end>
        Name = 'BarraTabSheet'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockControlHeights = (
      0
      0
      23
      0)
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
  end
end
