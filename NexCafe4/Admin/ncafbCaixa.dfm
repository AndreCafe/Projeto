inherited fbCaixa: TfbCaixa
  Left = 170
  Top = 150
  Caption = 'Caixa'
  ClientHeight = 501
  ClientWidth = 740
  OldCreateOrder = True
  OnDestroy = FrmBasePaiDestroy
  ExplicitWidth = 756
  ExplicitHeight = 537
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Width = 740
    Height = 501
    HelpType = htKeyword
    ExplicitWidth = 740
    ExplicitHeight = 501
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 740
      Visible = False
      ExplicitWidth = 740
    end
    object Paginas: TcxPageControl
      Left = 0
      Top = 28
      Width = 740
      Height = 473
      Cursor = crHandPoint
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      HotTrack = True
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = True
      MultiLine = True
      NavigatorPosition = npLeftTop
      Style = 6
      TabOrder = 0
      ExplicitTop = 31
      ClientRectBottom = 473
      ClientRectRight = 740
      ClientRectTop = 0
    end
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = FrmPri.im32
    Left = 112
    Top = 264
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
  inherited MenuGrid: TcxGridPopupMenu
    Left = 48
    Top = 305
  end
  inherited dlgExp: TSaveDialog
    Left = 48
    Top = 249
  end
  object FM: TFormManager
    BarMgr = FrmPri.BarMgr
    PageControl = Paginas
    OnChange = FMChange
    Left = 248
    Top = 132
  end
  object Timer1: TTimer
    Interval = 50
    Left = 192
    Top = 170
  end
end
