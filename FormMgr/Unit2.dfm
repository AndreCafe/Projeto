inherited FrmTeste: TFrmTeste
  Caption = 'FrmTeste'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 52
    Height = 225
    BevelInner = bvRaised
    BorderWidth = 5
    object Memo1: TMemo
      Left = 6
      Top = 6
      Width = 386
      Height = 213
      Align = alClient
      Lines.Strings = (
        'Memo1')
      TabOrder = 0
    end
  end
  inherited BarMgr: TdxBarManager
    Bars = <
      item
        Caption = 'BarraComum'
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
            Item = cmBotao1
            Visible = True
          end
          item
            Item = cmBotao2
            Visible = True
          end
          item
            Item = cmBotao3
            Visible = True
          end>
        Name = 'BarraComum'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'BarraTabSheet'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 26
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxBarButton1
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarButton2
            Visible = True
          end>
        Name = 'BarraTabSheet'
        OneOnRow = True
        Row = 1
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
      52
      0)
    object cmBotao1: TdxBarButton
      Caption = 'Botao 1'
      Category = 0
      Hint = 'Botao 1'
      Visible = ivAlways
    end
    object cmBotao2: TdxBarButton
      Caption = 'Botao 2'
      Category = 0
      Hint = 'Botao 2'
      Visible = ivAlways
    end
    object cmBotao3: TdxBarButton
      Caption = 'Botao 3'
      Category = 0
      Hint = 'Botao 3'
      Visible = ivAlways
    end
    object dxBarButton1: TdxBarButton
      Caption = 'Tabsheet 1'
      Category = 0
      Hint = 'Tabsheet 1'
      Visible = ivAlways
      OnClick = dxBarButton1Click
    end
    object dxBarButton2: TdxBarButton
      Caption = 'Tabsheet 2'
      Category = 0
      Hint = 'Tabsheet 2'
      Visible = ivAlways
    end
  end
end
