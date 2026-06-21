object Form1: TForm1
  Left = 192
  Top = 133
  Width = 544
  Height = 375
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LB: TListBox
    Left = 152
    Top = 0
    Width = 384
    Height = 348
    Align = alRight
    ItemHeight = 13
    TabOrder = 0
  end
  object Server: TCSCServer
    Port = 30000
    OnConnect = ServerConnect
    OnDisconnect = ServerDisconnect
    Left = 16
    Top = 16
  end
  object MsgProc: TCSCMsgProcessor
    CustomCommBase = Server
    OnMsgRec = MsgProcMsgRec
    Left = 56
    Top = 16
  end
end
