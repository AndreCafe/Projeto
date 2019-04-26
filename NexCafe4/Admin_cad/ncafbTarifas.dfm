inherited fbTarifas: TfbTarifas
  Caption = 'Tarifas'
  ClientHeight = 253
  ClientWidth = 382
  OldCreateOrder = True
  OnCreate = FrmBasePaiCreate
  OnDestroy = FrmBasePaiDestroy
  ExplicitWidth = 390
  ExplicitHeight = 280
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Width = 382
    Height = 225
    object Paginas: TcxPageControl
      Left = 0
      Top = 0
      Width = 382
      Height = 225
      Align = alClient
      Style = 9
      TabOrder = 0
      ExplicitWidth = 390
      ExplicitHeight = 234
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
      28
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
