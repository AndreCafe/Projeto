inherited fbVendasTab: TfbVendasTab
  Caption = 'Vendas'
  ClientHeight = 408
  ClientWidth = 672
  OldCreateOrder = True
  OnDestroy = FrmBasePaiDestroy
  ExplicitWidth = 680
  ExplicitHeight = 435
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TParentedPanel
    Width = 672
    Height = 408
    ExplicitWidth = 672
    ExplicitHeight = 408
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 672
      Height = 22
      UseOwnSunkenBorder = False
      Visible = False
      ExplicitWidth = 672
      ExplicitHeight = 22
    end
    object Paginas: TcxPageControl
      Left = 0
      Top = 22
      Width = 672
      Height = 386
      Cursor = crHandPoint
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Properties.CustomButtons.Buttons = <>
      Properties.HotTrack = True
      Properties.Options = [pcoAlwaysShowGoDialogButton, pcoGradient, pcoGradientClientArea, pcoRedrawOnResize, pcoUsePageColorForTab]
      Properties.Style = 6
      Properties.TabSlants.Positions = []
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
      TabSlants.Positions = []
      OnDrawTabEx = PaginasDrawTabEx
      ClientRectBottom = 386
      ClientRectRight = 672
      ClientRectTop = 0
    end
  end
  inherited BarMgr: TdxBarManager
    Top = 168
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      BorderStyle = bbsNone
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
  inherited MenuGrid: TcxGridPopupMenu
    Top = 129
  end
  inherited pmLay: TdxBarPopupMenu
    Left = 192
    Top = 218
  end
  object FM: TFormManager
    BarMgr = FrmPri.BarMgr
    PageControl = Paginas
    Left = 232
    Top = 114
  end
end
