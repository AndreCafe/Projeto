inherited FrmBaseOpcaoImgTxt: TFrmBaseOpcaoImgTxt
  Caption = 'FrmBaseOpcaoImgTxt'
  ClientHeight = 194
  ClientWidth = 541
  ExplicitWidth = 547
  ExplicitHeight = 219
  PixelsPerInch = 96
  TextHeight = 16
  inherited panPri: TLMDSimplePanel
    Width = 521
    Height = 111
    ExplicitWidth = 521
    ExplicitHeight = 111
    object panTopo: TLMDSimplePanel
      Left = 0
      Top = 0
      Width = 521
      Height = 49
      Align = alTop
      Bevel.Mode = bmCustom
      ParentColor = True
      TabOrder = 0
      object img: TImage
        Left = 0
        Top = 0
        Width = 48
        Height = 48
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        AutoSize = True
        Constraints.MaxHeight = 48
        Constraints.MinWidth = 48
      end
    end
    object lbDescr: TcxLabel
      AlignWithMargins = True
      Left = 58
      Top = 49
      Margins.Left = 58
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 10
      Align = alTop
      Caption = 'TEXTO '#13#10'TEXTO'#13#10'TEXTO'
      Style.TextColor = 6250335
      Properties.WordWrap = True
      Width = 463
    end
  end
  inherited LMDSimplePanel1: TLMDSimplePanel
    Top = 152
    Width = 521
    ExplicitTop = 152
    ExplicitWidth = 521
  end
end
