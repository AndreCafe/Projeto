inherited fbTarifas: TfbTarifas
  Caption = 'Tarifas'
  ClientHeight = 253
  ClientWidth = 382
  OldCreateOrder = True
  OnDestroy = FrmBasePaiDestroy
  ExplicitWidth = 398
  ExplicitHeight = 289
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Width = 382
    Height = 253
    ExplicitWidth = 382
    ExplicitHeight = 253
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 382
      Visible = False
      ExplicitWidth = 382
    end
    object Paginas: TcxPageControl
      Left = 0
      Top = 28
      Width = 382
      Height = 225
      Align = alClient
      HotTrack = True
      Style = 3
      TabOrder = 0
      ExplicitTop = 34
      ClientRectBottom = 225
      ClientRectRight = 382
      ClientRectTop = 0
    end
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      OldName = 'BarraTabSheet1'
    end
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
  end
  object FM: TFormManager
    BarMgr = FrmPri.BarMgr
    PageControl = Paginas
    Left = 232
    Top = 114
  end
end
