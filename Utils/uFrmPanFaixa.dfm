object FrmPanFaixa: TFrmPanFaixa
  Left = 0
  Top = 0
  Caption = 'FrmPanFaixa'
  ClientHeight = 254
  ClientWidth = 484
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object panPri: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 484
    Height = 34
    Align = alTop
    Bevel.Mode = bmCustom
    Color = clWhite
    TabOrder = 0
    OnClick = panPriClick
    object lbDe: TcxLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Align = alLeft
      Caption = 'De'
      Properties.Alignment.Vert = taVCenter
      AnchorY = 17
    end
    object edI: TcxMaskEdit
      AlignWithMargins = True
      Left = 26
      Top = 3
      Align = alLeft
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d+'
      Properties.UseNullString = True
      Properties.OnChange = edIPropertiesChange
      Properties.OnEditValueChanged = edIPropertiesEditValueChanged
      Style.BorderColor = clSilver
      Style.BorderStyle = ebsSingle
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.IsFontAssigned = True
      TabOrder = 1
      OnEnter = edIEnter
      OnExit = edIExit
      ExplicitHeight = 21
      Width = 87
    end
    object edF: TcxMaskEdit
      AlignWithMargins = True
      Left = 146
      Top = 3
      Align = alLeft
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Properties.IgnoreMaskBlank = True
      Properties.MaskKind = emkRegExpr
      Properties.EditMask = '\d+'
      Properties.MaxLength = 0
      Properties.OnChange = edFPropertiesChange
      Style.BorderColor = clSilver
      Style.BorderStyle = ebsSingle
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 2
      OnEnter = edFEnter
      OnExit = edFExit
      ExplicitHeight = 21
      Width = 87
    end
    object lbAte: TcxLabel
      AlignWithMargins = True
      Left = 119
      Top = 3
      Align = alLeft
      Caption = 'At'#233
      Properties.Alignment.Vert = taVCenter
      AnchorY = 17
    end
    object btnApagar: TcxButton
      AlignWithMargins = True
      Left = 239
      Top = 3
      Width = 26
      Height = 28
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'btnApagar'
      TabOrder = 4
      Visible = False
      OnClick = btnApagarClick
      Colors.Default = clWhite
      OptionsImage.Glyph.Data = {
        76040000424D7604000000000000360000002800000010000000110000000100
        2000000000004004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000006F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F
        6FFF6F6F6FFF6F6F6FFF6F6F6FFF000000000000000000000000000000000000
        0000000000006F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F
        6FFF6F6F6FFF6F6F6FFF6F6F6FFF000000000000000000000000000000000000
        0000000000006F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F
        6FFF6F6F6FFF6F6F6FFF6F6F6FFF000000000000000000000000000000000000
        0000000000006F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F
        6FFF6F6F6FFF6F6F6FFF6F6F6FFF000000000000000000000000000000000000
        0000000000006F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F
        6FFF6F6F6FFF6F6F6FFF6F6F6FFF000000000000000000000000000000000000
        0000000000006F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F
        6FFF6F6F6FFF6F6F6FFF6F6F6FFF000000000000000000000000000000000000
        0000000000006F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F
        6FFF6F6F6FFF6F6F6FFF6F6F6FFF000000000000000000000000000000000000
        0000000000006F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F
        6FFF6F6F6FFF6F6F6FFF6F6F6FFF000000000000000000000000000000000000
        0000000000006F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F
        6FFF6F6F6FFF6F6F6FFF6F6F6FFF000000000000000000000000000000000000
        0000000000006F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F
        6FFF6F6F6FFF6F6F6FFF6F6F6FFF000000000000000000000000000000000000
        0000000000006F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F
        6FFF6F6F6FFF6F6F6FFF6F6F6FFF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00006F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F
        6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF0000000000000000000000000000
        00006F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F
        6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF0000000000000000000000000000
        0000000000000000000000000000000000006F6F6FFF6F6F6FFF6F6F6FFF6F6F
        6FFF000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      PaintStyle = bpsGlyph
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.AllowAllUp = True
      SpeedButtonOptions.Flat = True
      SpeedButtonOptions.Transparent = True
    end
  end
end
