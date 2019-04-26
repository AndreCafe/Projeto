object Form9: TForm9
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form9'
  ClientHeight = 234
  ClientWidth = 564
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 17
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 564
    Height = 49
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 0
    object lbAtualizacaoNecessaria: TcxLabel
      Left = 0
      Top = 0
      Align = alClient
      Caption = 'Atualiza'#231#227'o Necess'#225'ria'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -19
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.TextStyle = [fsBold, fsUnderline]
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      ExplicitLeft = 216
      ExplicitTop = 16
      ExplicitWidth = 57
      ExplicitHeight = 21
      AnchorX = 282
      AnchorY = 25
    end
  end
  object lbMsg: TcxLabel
    AlignWithMargins = True
    Left = 15
    Top = 54
    Margins.Left = 15
    Margins.Top = 5
    Margins.Right = 15
    Margins.Bottom = 15
    Align = alTop
    Caption = 
      'Sua vers'#227'o do NexCaf'#233' est'#225' desatualizada. '#201' necess'#225'rio atualizar' +
      ' assim que poss'#237'vel pois em 31/03/2015 a vers'#227'o que voc'#234' est'#225' us' +
      'ando deixar'#225' de funcionar.'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Properties.WordWrap = True
    ExplicitTop = 49
    Width = 534
  end
  object cxButton1: TcxButton
    Left = 15
    Top = 168
    Width = 146
    Height = 38
    Caption = 'Baixar agora!'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = cxButton1Click
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
  end
end
