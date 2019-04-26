inherited FrmPopupUnidade: TFrmPopupUnidade
  Caption = 'FrmPopupUnidade'
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TParentedPanel
    inherited pageControlEditar: TcxPageControl
      inherited tsEdit: TcxTabSheet
        ExplicitWidth = 0
        ExplicitHeight = 0
        inherited panEdit: TLMDSimplePanel
          inherited edItem: TcxTextEdit
            Style.IsFontAssigned = True
            ExplicitHeight = 21
          end
        end
      end
    end
  end
  inherited BarMgr: TdxBarManager
    DockControlHeights = (
      0
      0
      0
      0)
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmEditar: TdxBarLargeButton
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited cmImprimir: TdxBarLargeButton
      ImageIndex = 22
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
  end
end
