object chFrameBase: TchFrameBase
  Left = 0
  Top = 0
  Width = 320
  Height = 281
  TabOrder = 0
  object LMDSplitterPanel1: TLMDSplitterPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 281
    BackFX.AlphaBlend.Strength = 0.600000023841857900
    Bevel.BorderInnerWidth = 5
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsNone
    Bars = <
      item
        OldPosition = -1
        Position = 155
        PosPercent = 58
      end>
    Orientation = spHorzDown
    Align = alClient
    TabOrder = 0
    object spConversas: TLMDSplitterPane
      Bevel.Mode = bmStandard
      Bevel.StandardStyle = lsNone
      object Conversas: TchpcConversas
        Left = 0
        Top = 0
        Width = 310
        Height = 155
        Align = alClient
        LookAndFeel.NativeStyle = False
        Options = [pcoGoDialog, pcoNoArrows]
        TabOrder = 0
        OnPageChanging = ConversasPageChanging
        ClientRectBottom = 155
        ClientRectRight = 310
        ClientRectTop = 0
      end
    end
    object spTexto: TLMDSplitterPane
      Bevel.Mode = bmStandard
    end
  end
end
