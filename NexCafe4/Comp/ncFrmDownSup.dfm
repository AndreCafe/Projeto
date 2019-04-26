object FrmDownSup: TFrmDownSup
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  BorderWidth = 10
  Caption = 'Download suporte remoto'
  ClientHeight = 162
  ClientWidth = 404
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PB: TProgressBar
    Left = 0
    Top = 106
    Width = 404
    Height = 17
    Align = alTop
    TabOrder = 0
  end
  object cxLabel1: TcxLabel
    Left = 0
    Top = 0
    Align = alTop
    AutoSize = False
    Caption = 'Aguarde o t'#233'rmino do download do software de suporte remoto ...'
    Style.BorderStyle = ebsNone
    Style.TextStyle = [fsBold]
    Properties.Alignment.Horz = taCenter
    Height = 27
    Width = 404
    AnchorX = 202
  end
  object cxButton1: TcxButton
    Left = 161
    Top = 131
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    Default = True
    TabOrder = 2
    OnClick = cxButton1Click
    LookAndFeel.NativeStyle = True
  end
  object cxLabel2: TcxLabel
    Left = 0
    Top = 27
    Align = alTop
    AutoSize = False
    Caption = 
      'O servi'#231'o de suporte remoto est'#225' dispon'#237'vel de segunda '#224' sexta-f' +
      'eira das 9 '#224's 18h.'#13#10#13#10'Fora desse hor'#225'rio '#233' necess'#225'rio solicitar ' +
      'atendimento pelo celular de plant'#227'o de suporte t'#233'cnico (48-9607 ' +
      '7121) antes de acionar o suporte remoto.'
    Style.TextColor = 4934475
    Properties.WordWrap = True
    Height = 79
    Width = 404
  end
  object ActionManager1: TActionManager
    Left = 32
    Top = 128
    StyleName = 'XP Style'
    object DownURL: TDownLoadURL
      Category = 'Internet'
      Caption = '&Download URL'
      Hint = 'Download from URL'
      OnDownloadProgress = DownURLDownloadProgress
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 24
    Top = 40
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 56
    Top = 40
  end
end
