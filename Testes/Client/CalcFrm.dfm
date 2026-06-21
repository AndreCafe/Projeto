object frmCalc: TfrmCalc
  Left = 0
  Top = 0
  Caption = 'Calculator'
  ClientHeight = 105
  ClientWidth = 462
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object edInput: TEdit
    Left = 8
    Top = 41
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object bnAdd: TButton
    Left = 135
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 1
    OnClick = bnAddClick
  end
  object bnSubtract: TButton
    Left = 216
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Subtract'
    TabOrder = 2
    OnClick = bnSubtractClick
  end
  object bnMultiply: TButton
    Left = 297
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Multiply'
    TabOrder = 3
    OnClick = bnMultiplyClick
  end
  object bnDivide: TButton
    Left = 378
    Top = 39
    Width = 75
    Height = 25
    Caption = 'Divide'
    TabOrder = 4
    OnClick = bnDivideClick
  end
  object bnClear: TButton
    Left = 135
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 5
    OnClick = bnClearClick
  end
  object bnResult: TButton
    Left = 135
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Result'
    TabOrder = 6
    OnClick = bnResultClick
  end
  object edResult: TEdit
    Left = 216
    Top = 72
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 7
  end
end
