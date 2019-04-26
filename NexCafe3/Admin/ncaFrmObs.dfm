object FrmObs: TFrmObs
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  BorderWidth = 5
  Caption = 'Observa'#231#245'es'
  ClientHeight = 123
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object meObs: TcxMemo
    Left = 0
    Top = 0
    Align = alTop
    Lines.Strings = (
      'meObs')
    Style.BorderStyle = ebsFlat
    TabOrder = 0
    ExplicitLeft = 40
    ExplicitTop = 24
    ExplicitWidth = 185
    Height = 89
    Width = 521
  end
  object btnSalvar: TcxButton
    Left = 2
    Top = 95
    Width = 75
    Height = 25
    Caption = '&Salvar'
    Default = True
    ModalResult = 1
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
  end
  object cxButton2: TcxButton
    Left = 83
    Top = 95
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 2
    LookAndFeel.Kind = lfFlat
  end
end
