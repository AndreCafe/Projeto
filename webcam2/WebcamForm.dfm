object FrmWebcam: TFrmWebcam
  Left = 0
  Top = 0
  Caption = 'Webcam Demo'
  ClientHeight = 401
  ClientWidth = 561
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 358
    Top = 0
    Width = 178
    Height = 144
  end
  object OldImage: TImage
    Left = 358
    Top = 181
    Width = 178
    Height = 144
    Stretch = True
  end
  object pnlWebcam: TPanel
    Left = 0
    Top = 0
    Width = 352
    Height = 288
    BevelOuter = bvNone
    Caption = 'Webcam not connected'
    Color = clBtnShadow
    ParentBackground = False
    TabOrder = 0
  end
  object btnConnect: TButton
    Left = 8
    Top = 294
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 1
    OnClick = btnConnectClick
  end
  object btnDisconnect: TButton
    Left = 89
    Top = 294
    Width = 75
    Height = 25
    Caption = 'Disconnect'
    TabOrder = 2
    OnClick = btnDisconnectClick
  end
  object btnGrabFrame: TButton
    Left = 170
    Top = 294
    Width = 75
    Height = 25
    Caption = 'Grab Frame'
    TabOrder = 3
    OnClick = btnGrabFrameClick
  end
  object btnConfiguration: TButton
    Left = 251
    Top = 294
    Width = 75
    Height = 25
    Caption = 'Configuration'
    TabOrder = 4
    OnClick = btnConfigurationClick
  end
  object edtWebcamImageFileName: TEdit
    Left = 8
    Top = 336
    Width = 145
    Height = 21
    TabOrder = 5
    Text = 'd:\Filename.bmp'
  end
  object btnSave: TButton
    Left = 170
    Top = 334
    Width = 75
    Height = 25
    Caption = 'Save DIB'
    TabOrder = 6
    OnClick = btnSaveClick
  end
  object cbPreview: TCheckBox
    Left = 264
    Top = 336
    Width = 62
    Height = 17
    Caption = 'Preview'
    TabOrder = 7
    OnClick = cbPreviewClick
  end
  object btnCopy: TButton
    Left = 358
    Top = 150
    Width = 75
    Height = 25
    Caption = 'Copy'
    TabOrder = 8
    OnClick = btnCopyClick
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 8000
    OnTimer = btnCopyClick
    Left = 344
    Top = 336
  end
end
