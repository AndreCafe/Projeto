inherited fbTarifas: TfbTarifas
  Caption = 'Tarifas'
  ClientHeight = 253
  ClientWidth = 382
  OldCreateOrder = True
  OnDestroy = FrmBasePaiDestroy
  ExplicitWidth = 390
  ExplicitHeight = 280
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TParentedPanel
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
      TabOrder = 0
      Properties.CustomButtons.Buttons = <>
      Properties.HotTrack = True
      Properties.Style = 3
      LookAndFeel.NativeStyle = False
      ClientRectBottom = 225
      ClientRectRight = 382
      ClientRectTop = 0
    end
  end
  inherited BarMgr: TdxBarManager
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
