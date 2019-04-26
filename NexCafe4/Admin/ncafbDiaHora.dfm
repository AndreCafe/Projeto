inherited fbTarDiaHora: TfbTarDiaHora
  Caption = 'fbTarDiaHora'
  ClientHeight = 512
  ClientWidth = 867
  ExplicitWidth = 883
  ExplicitHeight = 548
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Width = 867
    Height = 512
    ExplicitWidth = 867
    ExplicitHeight = 512
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 867
      Height = 36
      ExplicitWidth = 867
      ExplicitHeight = 36
    end
    object Paginas: TcxPageControl
      AlignWithMargins = True
      Left = 0
      Top = 42
      Width = 867
      Height = 470
      Margins.Left = 0
      Margins.Top = 6
      Margins.Right = 0
      Margins.Bottom = 0
      ActivePage = cxTabSheet1
      Align = alClient
      Style = 3
      TabOrder = 1
      ClientRectBottom = 470
      ClientRectRight = 867
      ClientRectTop = 23
      object cxTabSheet1: TcxTabSheet
        Caption = 'Internet e Jogos'
        ImageIndex = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
      object cxTabSheet2: TcxTabSheet
        Caption = 'Clientes Especiais'
        ImageIndex = 1
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 448
      end
    end
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = FrmPri.im24
    Left = 296
    Top = 160
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmSalvar'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end>
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
    object cmSalvar: TdxBarLargeButton
      Caption = '&Salvar'
      Category = 0
      Enabled = False
      Hint = 'Salvar'
      Visible = ivAlways
      LargeImageIndex = 5
      OnClick = cmSalvarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Enabled = False
      Hint = 'Cancelar'
      Visible = ivAlways
      LargeImageIndex = 4
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 264
    Top = 161
  end
  inherited pmLay: TdxBarPopupMenu
    Top = 90
  end
end
