inherited fbPMImp: TfbPMImp
  Caption = 'Tarifas'
  ClientHeight = 253
  ClientWidth = 458
  OldCreateOrder = True
  OnDestroy = FrmBasePaiDestroy
  ExplicitWidth = 474
  ExplicitHeight = 289
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Width = 458
    Height = 253
    ExplicitWidth = 458
    ExplicitHeight = 253
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 458
      ExplicitWidth = 458
    end
    object Paginas: TcxPageControl
      Left = 0
      Top = 28
      Width = 458
      Height = 225
      Align = alClient
      HideTabs = True
      HotTrack = True
      Style = 3
      TabOrder = 0
      ClientRectBottom = 225
      ClientRectRight = 458
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
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmEmAndamento'
        end
        item
          Visible = True
          ItemName = 'cmRecentes'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmJobResume'
        end
        item
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'cmJobDelete'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmEditarImp'
        end>
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
    object cmEmAndamento: TdxBarButton
      Caption = 'Em andamento'
      Category = 0
      Hint = 'Em andamento'
      Style = cxStyle1
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      Down = True
      OnClick = cmEmAndamentoClick
    end
    object cmRecentes: TdxBarButton
      Caption = 'Recentes'
      Category = 0
      Hint = 'Recentes'
      Style = cxStyle1
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      OnClick = cmRecentesClick
    end
    object cmJobResume: TdxBarButton
      Caption = 'Imprimir'
      Category = 0
      Hint = 'Imprimir'
      Style = cxStyle1
      Visible = ivAlways
      ImageIndex = 3
      PaintStyle = psCaptionGlyph
    end
    object cmJobDelete: TdxBarButton
      Caption = 'Cancelar Imp.'
      Category = 0
      Hint = 'Cancelar Impress'#227'o'
      Style = cxStyle1
      Visible = ivAlways
      ImageIndex = 41
    end
    object cmEditarImp: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
      ImageIndex = 9
    end
  end
  object FM: TFormManager
    BarMgr = FrmPri.BarMgr
    PageControl = Paginas
    Left = 96
    Top = 98
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 40
    Top = 128
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
    end
  end
end
