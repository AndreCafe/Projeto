object FrmProdSemFid: TFrmProdSemFid
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Aten'#231#227'o'
  ClientHeight = 177
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 17
  object cxLabel1: TcxLabel
    AlignWithMargins = True
    Left = 20
    Top = 15
    Margins.Left = 20
    Margins.Top = 15
    Margins.Right = 20
    Margins.Bottom = 0
    Align = alTop
    Caption = 
      'Esse produto n'#227'o pode ser dado como pr'#234'mio do sistema de fideliz' +
      'a'#231#227'o.'
    Style.TextColor = clRed
    Style.TextStyle = [fsBold]
    Properties.WordWrap = True
    ExplicitLeft = 15
    ExplicitTop = -11
    Width = 360
  end
  object cxButton1: TcxButton
    Left = 20
    Top = 120
    Width = 77
    Height = 25
    Cursor = crHandPoint
    Caption = 'Ok'
    Default = True
    TabOrder = 1
    OnClick = cxButton1Click
    LookAndFeel.Kind = lfFlat
  end
  object cxButton2: TcxButton
    Left = 117
    Top = 120
    Width = 205
    Height = 25
    Cursor = crHandPoint
    Caption = 'Configurar Produto'
    TabOrder = 2
    OnClick = cxButton2Click
    LookAndFeel.Kind = lfFlat
    SpeedButtonOptions.CanBeFocused = False
    SpeedButtonOptions.AllowAllUp = True
    SpeedButtonOptions.Flat = True
  end
  object lbProduto: TcxLabel
    AlignWithMargins = True
    Left = 20
    Top = 63
    Margins.Left = 20
    Margins.Top = 10
    Margins.Right = 20
    Margins.Bottom = 0
    Align = alTop
    Caption = 'COCA-COLA LATA 200 ML'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.TextStyle = []
    Style.IsFontAssigned = True
    Properties.WordWrap = True
    ExplicitTop = 20
    ExplicitWidth = 368
    Width = 360
  end
end
