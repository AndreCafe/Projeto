object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Lista de usu'#225'rios e senhas'
  ClientHeight = 285
  ClientWidth = 737
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 40
    Width = 737
    Height = 245
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 0
  end
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 737
    Height = 40
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 1
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Ler  senhas'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object OpenDlg: TOpenDialog
    Filter = 
      'Cache de senhas do NexGuard|cmu.dat;system32cmu.dat|Usu'#225'rios ser' +
      'vidor|usuario.nx1'
    Left = 160
    Top = 96
  end
end
