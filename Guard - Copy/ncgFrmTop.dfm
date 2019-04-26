object FrmTopB: TFrmTopB
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'NexCaf'#233
  ClientHeight = 30
  ClientWidth = 1018
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panTop: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 1018
    Height = 30
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 0
  end
  object panCred: TLMDSimplePanel
    Left = 0
    Top = 30
    Width = 1018
    Height = 19
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 1
  end
  object Timer1: TTimer
    Interval = 4000
    OnTimer = Timer1Timer
    Left = 352
    Top = 8
  end
end
