object FrmContato: TFrmContato
  Left = 387
  Top = 256
  BorderStyle = bsDialog
  Caption = 'Contato'
  ClientHeight = 227
  ClientWidth = 292
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 262
    Height = 13
    Caption = 'Informações de contato com a Cybermgr.com:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 150
    Height = 13
    Caption = 'E-mail: suporte@cybermgr.com'
  end
  object LMDSimpleLabel1: TLMDSimpleLabel
    Left = 104
    Top = 192
    Width = 95
    Height = 15
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    Caption = 'www.cybermgr.com'
    Jump = 'http://www.cybermgr.com'
    JumpMode = jmInternet
    Options = []
  end
  object LMDSimpleLabel2: TLMDSimpleLabel
    Left = 16
    Top = 64
    Width = 120
    Height = 15
    Caption = 'Telefone: (48) 338-1171'
    Options = []
  end
  object LMDSimpleLabel3: TLMDSimpleLabel
    Left = 16
    Top = 88
    Width = 223
    Height = 15
    Caption = 'Microsoft Messenger: suporte@cybermgr.com'
    Options = []
  end
  object LMDSimpleLabel4: TLMDSimpleLabel
    Left = 16
    Top = 112
    Width = 88
    Height = 15
    Caption = 'ICQ: 157 036 706'
    Options = []
  end
  object BitBtn1: TBitBtn
    Left = 112
    Top = 152
    Width = 75
    Height = 25
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkOK
  end
end
