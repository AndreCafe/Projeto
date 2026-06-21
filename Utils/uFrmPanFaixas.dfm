object FrmFaixas: TFrmFaixas
  Left = 0
  Top = 0
  Caption = 'FrmFaixas'
  ClientHeight = 359
  ClientWidth = 579
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panPri: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 579
    Height = 57
    AutoSize = True
    Align = alTop
    Bevel.Mode = bmCustom
    ParentColor = True
    TabOrder = 0
    ExplicitTop = 25
    object panItens: TLMDSimplePanel
      Left = 0
      Top = 0
      Width = 579
      Height = 41
      Align = alTop
      Bevel.Mode = bmCustom
      ParentColor = True
      TabOrder = 0
    end
    object lbAdd: TcxLabel
      Left = 3
      Top = 40
      Cursor = crHandPoint
      Caption = 'Adicionar'
      Style.HotTrack = True
      Style.TextColor = clBlack
      StyleHot.BorderStyle = ebsNone
      StyleHot.TextColor = clBlue
      StyleHot.TextStyle = [fsUnderline]
      OnClick = btnAdicionarClick
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 168
    Top = 112
  end
  object Fly: TLMDFlyoutController
    Active = False
    Destination = fopBottom
    TriggerDistance = 10
    Step = 10
    Left = 192
    Top = 208
  end
  object cxEditStyleController1: TcxEditStyleController
    Left = 96
    Top = 160
    PixelsPerInch = 96
  end
end
