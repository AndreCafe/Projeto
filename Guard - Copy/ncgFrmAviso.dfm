object FrmAviso: TFrmAviso
  Left = 139
  Top = 31
  BorderStyle = bsDialog
  Caption = 'Tempo acabando'
  ClientHeight = 158
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesigned
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbTam: TLMDLabel
    Left = 0
    Top = 72
    Width = 418
    Height = 15
    Bevel.Mode = bmCustom
    Alignment = agCenter
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    Visible = False
    Caption = 
      '     Aten'#231#227'o: Seu tempo est'#225' acabando ... Faltam 5 minutos apena' +
      's !!     '
  end
  object panMsg: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 325
    Height = 41
    Align = alTop
    Bevel.WidthOuter = 2
    Bevel.BorderColor = clBlack
    Bevel.BorderWidth = 3
    Bevel.Mode = bmCustom
    TabOrder = 0
    ExplicitWidth = 331
    object lbTempo: TLMDLabel
      Left = 3
      Top = 3
      Width = 319
      Height = 35
      Bevel.Mode = bmCustom
      Align = alClient
      Alignment = agCenter
      AutoSize = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MultiLine = True
      Options = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Caption = 'Aten'#231#227'o: Seu tempo est'#225' acabando ... Faltam 5 minutos apenas !!'
      ExplicitWidth = 325
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 200
    OnTimer = Timer1Timer
    Left = 168
    Top = 40
  end
  object Timer2: TTimer
    Interval = 10000
    OnTimer = Timer2Timer
    Left = 224
    Top = 40
  end
end
