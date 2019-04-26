object FrameValor: TFrameValor
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object panValor: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 320
    Height = 40
    Margins.Top = 0
    Margins.Bottom = 0
    Align = alTop
    Bevel.BorderSides = [fsBottom]
    Bevel.Mode = bmEdge
    TabOrder = 0
    ExplicitLeft = -58
    ExplicitWidth = 378
    object lbPrompt: TcxLabel
      Left = 2
      Top = 2
      Align = alLeft
      Caption = 'Sub-Total'
      Properties.Alignment.Vert = taVCenter
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitHeight = 40
      AnchorY = 20
    end
    object lbValor: TcxLabel
      Left = 217
      Top = 2
      Align = alRight
      Caption = 'R$ 1.500,00'
      Style.TextStyle = [fsBold]
      Properties.Alignment.Vert = taVCenter
      ExplicitLeft = 244
      ExplicitTop = 0
      ExplicitHeight = 40
      AnchorY = 20
    end
  end
end
