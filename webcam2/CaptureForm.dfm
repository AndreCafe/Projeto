object Form1: TForm1
  Left = 364
  Top = 201
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Dr.Bob'#39's webcam capture'
  ClientHeight = 496
  ClientWidth = 824
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clRed
  Font.Height = -12
  Font.Name = 'Fixedsys'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  DesignSize = (
    824
    496)
  PixelsPerInch = 96
  TextHeight = 15
  object PreviousImage: TImage
    Left = 656
    Top = 8
    Width = 160
    Height = 120
    Anchors = [akTop, akRight]
    Stretch = True
  end
  object CaptureImage: TImage
    Left = 8
    Top = 8
    Width = 640
    Height = 480
  end
  object btnConnect: TButton
    Left = 656
    Top = 136
    Width = 73
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Connect'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnConnectClick
  end
  object btnGrab: TButton
    Left = 744
    Top = 136
    Width = 73
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Grab'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnGrabClick
  end
  object Memo1: TMemo
    Left = 656
    Top = 190
    Width = 160
    Height = 58
    Align = alCustom
    Anchors = [akTop, akRight]
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object cbMotion: TCheckBox
    Left = 744
    Top = 168
    Width = 64
    Height = 17
    Anchors = [akTop, akRight]
    Caption = 'Motion'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object btnCapture: TButton
    Left = 656
    Top = 160
    Width = 73
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Capture'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = False
    OnClick = btnCaptureClick
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = btnGrabClick
    Left = 120
    Top = 80
  end
end
