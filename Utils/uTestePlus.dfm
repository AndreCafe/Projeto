object Form41: TForm41
  Left = 0
  Top = 0
  Caption = 'Form41'
  ClientHeight = 512
  ClientWidth = 646
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 176
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 24
    Top = 216
    Width = 489
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object Button2: TButton
    Left = 392
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 104
    Top = 280
    Width = 481
    Height = 185
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
  object Button3: TButton
    Left = 520
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 520
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Produtos'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 520
    Top = 159
    Width = 75
    Height = 25
    Caption = 'Adesoes'
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 519
    Top = 190
    Width = 75
    Height = 25
    Caption = 'Parceiros'
    TabOrder = 7
    OnClick = Button6Click
  end
  object HC: TRtcHttpClient
    ServerAddr = 'dev.nexcafe.com.br'
    ServerPort = '80'
    FixupRequest.EncodeQuery = True
    AutoConnect = True
    Left = 40
    Top = 56
  end
  object Req: TRtcDataRequest
    AutoSyncEvents = True
    Client = HC
    AutoRepost = 5
    OnBeginRequest = ReqBeginRequest
    OnResponseDone = ReqResponseDone
    Left = 104
    Top = 56
  end
  object Req2: TRtcDataRequest
    AutoSyncEvents = True
    Client = HC
    AutoRepost = 5
    OnBeginRequest = ReqBeginRequest
    OnDataReceived = Req2DataReceived
    Left = 144
    Top = 56
  end
  object postTran: TRtcDataRequest
    AutoSyncEvents = True
    Client = HC
    AutoRepost = 5
    OnBeginRequest = ReqBeginRequest
    OnResponseDone = postTranResponseDone
    Left = 192
    Top = 56
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 376
    Top = 56
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer2Timer
    Left = 464
    Top = 48
  end
  object RtcDataRequest1: TRtcDataRequest
    Left = 104
    Top = 136
  end
  object RtcHttpClient1: TRtcHttpClient
    Left = 264
    Top = 88
  end
end
