object Form4: TForm4
  Left = 0
  Top = 0
  Caption = ' Teste intala'#231#227'o printer PS'
  ClientHeight = 401
  ClientWidth = 580
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    580
    401)
  PixelsPerInch = 96
  TextHeight = 13
  object cxButtonInsatalar: TcxButton
    Left = 8
    Top = 8
    Width = 265
    Height = 25
    Caption = 'bu Printers Reg e Detonar'
    TabOrder = 0
    OnClick = cxButtonInsatalarClick
  end
  object cxMemo1: TcxMemo
    Left = 8
    Top = 39
    Anchors = [akLeft, akTop, akRight, akBottom]
    Properties.ReadOnly = True
    Properties.ScrollBars = ssVertical
    TabOrder = 1
    Height = 267
    Width = 564
  end
  object cxButtonDesinstalar: TcxButton
    Left = 297
    Top = 8
    Width = 275
    Height = 25
    Caption = 'restore Printers Reg e Deixar em ordem'
    TabOrder = 2
    OnClick = cxButtonDesinstalarClick
  end
  object Panel2: TPanel
    Left = 8
    Top = 314
    Width = 564
    Height = 79
    Anchors = [akLeft, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      564
      79)
    object Bevel2: TBevel
      Left = 0
      Top = 0
      Width = 564
      Height = 79
      Align = alClient
      Shape = bsFrame
      ExplicitLeft = 16
      ExplicitTop = 31
      ExplicitWidth = 562
      ExplicitHeight = 89
    end
    object Label2: TLabel
      Left = 8
      Top = 38
      Width = 12
      Height = 13
      Caption = '...'
    end
    object Label3: TLabel
      Left = 8
      Top = 57
      Width = 12
      Height = 13
      Caption = '...'
    end
    object Label1: TLabel
      Left = 81
      Top = 57
      Width = 12
      Height = 13
      Caption = '...'
    end
    object ProgressBar1: TProgressBar
      Left = 8
      Top = 16
      Width = 548
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
  end
end
