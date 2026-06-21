object Form1: TForm1
  Left = 78
  Top = 123
  Width = 273
  Height = 130
  Caption = 'Chamar Suporte'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object S1: TLMDStarter
    Command = 'C:\Arquivos de programas\RealVNC\VNC4\winvnc4.exe'
    Left = 24
    Top = 32
  end
  object S2: TLMDStarter
    Command = 'C:\Arquivos de programas\RealVNC\VNC4\winvnc4.exe'
    Parameters = '-connect joaoborges.dyndns.org'
    Left = 96
    Top = 32
  end
end
