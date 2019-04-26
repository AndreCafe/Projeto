object FrmPMNaoPausar: TFrmPMNaoPausar
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Exce'#231#245'es - Imprimir direto'
  ClientHeight = 316
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 14
  object edPMNaoPausar: TcxMemo
    AlignWithMargins = True
    Left = 10
    Top = 58
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    ParentFont = False
    Properties.ScrollBars = ssVertical
    Style.BorderStyle = ebsFlat
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 0
    Height = 205
    Width = 409
  end
  object lbInfoImpNex: TcxLabel
    AlignWithMargins = True
    Left = 10
    Top = 10
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 0
    Align = alTop
    Caption = 
      'Imprimir direto (sem confirma'#231#227'o) as impress'#245'es vindas dos segui' +
      'ntes computadores:'
    ParentColor = False
    ParentFont = False
    Style.Color = clWhite
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.TextColor = clBlack
    Style.TextStyle = []
    Style.IsFontAssigned = True
    Properties.WordWrap = True
    Transparent = True
    Width = 409
  end
  object LMDSimplePanel1: TLMDSimplePanel
    AlignWithMargins = True
    Left = 10
    Top = 273
    Width = 409
    Height = 33
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alBottom
    Bevel.Mode = bmCustom
    TabOrder = 2
    object cxButton1: TcxButton
      Left = 0
      Top = 0
      Width = 81
      Height = 33
      Cursor = crHandPoint
      Align = alLeft
      Caption = '&Ok'
      Default = True
      ModalResult = 1
      TabOrder = 0
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
    end
    object cxButton2: TcxButton
      AlignWithMargins = True
      Left = 91
      Top = 0
      Width = 80
      Height = 33
      Cursor = crHandPoint
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
    end
  end
end
