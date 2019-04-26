object Frame1: TFrame1
  Left = 0
  Top = 0
  Width = 384
  Height = 386
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object panValores: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 384
    Height = 386
    Align = alClient
    Bevel.Mode = bmCustom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = 35
    ExplicitTop = 3
    ExplicitWidth = 310
    ExplicitHeight = 380
    object LMDSimplePanel3: TLMDSimplePanel
      AlignWithMargins = True
      Left = 3
      Top = 40
      Width = 378
      Height = 40
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Bevel.BorderSides = [fsTop]
      Bevel.Mode = bmEdge
      TabOrder = 0
      ExplicitLeft = 24
      ExplicitTop = 32
      ExplicitWidth = 100
      object cxLabel1: TcxLabel
        Left = 2
        Top = 2
        Align = alLeft
        Caption = 'Desconto'
        Properties.Alignment.Vert = taVCenter
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitHeight = 40
        AnchorY = 20
      end
      object cxLabel2: TcxLabel
        Left = 268
        Top = 2
        Align = alRight
        Caption = '-R$ 1.500,00'
        Style.TextColor = clRed
        Style.TextStyle = [fsBold]
        Properties.Alignment.Vert = taVCenter
        ExplicitLeft = 203
        ExplicitTop = 0
        ExplicitHeight = 40
        AnchorY = 20
      end
    end
    object LMDSimplePanel2: TLMDSimplePanel
      AlignWithMargins = True
      Left = 3
      Top = 120
      Width = 378
      Height = 40
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Bevel.BorderSides = [fsBottom, fsTop]
      Bevel.Mode = bmEdge
      TabOrder = 1
      ExplicitTop = 123
      ExplicitWidth = 304
      object cxLabel3: TcxLabel
        Left = 2
        Top = 2
        Align = alLeft
        Caption = 'Total a Pagar'
        Properties.Alignment.Vert = taVCenter
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitHeight = 40
        AnchorY = 20
      end
      object cxLabel4: TcxLabel
        Left = 275
        Top = 2
        Align = alRight
        Caption = 'R$ 1.500,00'
        Style.TextStyle = [fsBold]
        Properties.Alignment.Vert = taVCenter
        ExplicitLeft = 207
        ExplicitTop = 0
        ExplicitHeight = 40
        AnchorY = 20
      end
    end
    object LMDSimplePanel1: TLMDSimplePanel
      AlignWithMargins = True
      Left = 3
      Top = 0
      Width = 378
      Height = 40
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Bevel.Mode = bmCustom
      TabOrder = 2
      ExplicitLeft = 24
      ExplicitTop = 32
      ExplicitWidth = 100
      object cxLabel5: TcxLabel
        Left = 0
        Top = 0
        Align = alLeft
        Caption = 'Sub-Total'
        Properties.Alignment.Vert = taVCenter
        AnchorY = 20
      end
      object cxLabel6: TcxLabel
        Left = 277
        Top = 0
        Align = alRight
        Caption = 'R$ 1.500,00'
        Style.TextStyle = [fsBold]
        Properties.Alignment.Vert = taVCenter
        ExplicitLeft = 207
        AnchorY = 20
      end
    end
    object LMDSimplePanel4: TLMDSimplePanel
      AlignWithMargins = True
      Left = 3
      Top = 80
      Width = 378
      Height = 40
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Bevel.BorderSides = [fsTop]
      Bevel.Mode = bmEdge
      TabOrder = 3
      ExplicitTop = 123
      ExplicitWidth = 304
      object cxLabel7: TcxLabel
        Left = 2
        Top = 2
        Align = alLeft
        Caption = 'Total '#224' Pagar'
        Properties.Alignment.Vert = taVCenter
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitHeight = 40
        AnchorY = 20
      end
      object cxLabel8: TcxLabel
        Left = 310
        Top = 2
        Align = alRight
        Caption = 'R$ 0,00'
        Style.TextStyle = [fsBold]
        Properties.Alignment.Vert = taVCenter
        ExplicitLeft = 248
        ExplicitTop = 0
        ExplicitHeight = 40
        AnchorY = 20
      end
    end
  end
end
