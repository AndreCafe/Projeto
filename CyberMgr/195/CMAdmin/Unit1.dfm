inherited FrmBaseGrid1: TFrmBaseGrid1
  Caption = 'FrmBaseGrid1'
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TLMDSimplePanel
    Top = 83
    Height = 233
    inherited panGrid: TLMDSimplePanel
      Top = 8
      inherited Grid: TdxDBGrid
        Filter.Criteria = {00000000}
      end
    end
    inherited bdcGrid: TdxBarDockControl
      Height = 0
    end
  end
  inherited Panel1: TPanel
    Top = 78
  end
  inherited BarMgr: TdxBarManager
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Barra2'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 26
        DockingStyle = dsTop
        FloatLeft = 164
        FloatTop = 132
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <>
        Name = 'Barra2'
        NotDocking = [dsNone, dsLeft, dsRight, dsBottom]
        OneOnRow = True
        Row = 1
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'barFiltro'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 52
        DockingStyle = dsTop
        FloatLeft = 84
        FloatTop = 72
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <>
        Name = 'barFiltro'
        NotDocking = [dsNone, dsLeft, dsRight, dsBottom]
        OneOnRow = True
        Row = 2
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'MenuPri'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 23
        FloatClientHeight = 22
        IsMainMenu = True
        ItemLinks = <>
        MultiLine = True
        Name = 'MenuPri'
        NotDocking = [dsNone, dsLeft, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True
      True)
    DockControlHeights = (
      0
      0
      78
      0)
    inherited cmFechar: TdxBarLargeButton
      ImageIndex = 37
    end
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 35
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 36
    end
    inherited cmEditar: TdxBarLargeButton
      ImageIndex = 39
    end
    inherited cmPreviewObs: TdxBarLargeButton
      ImageIndex = 38
    end
    inherited cmRefresh: TdxBarLargeButton
      ImageIndex = 26
    end
  end
end
