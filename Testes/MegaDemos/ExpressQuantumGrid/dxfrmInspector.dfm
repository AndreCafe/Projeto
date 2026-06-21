object frmInspector: TfrmInspector
  Left = 680
  Top = 293
  Width = 348
  Height = 439
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'Property Inspector'
  Color = clBtnFace
  Constraints.MinWidth = 270
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 12
  object pnlBottom: TPanel
    Left = 0
    Top = 328
    Width = 332
    Height = 73
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      332
      73)
    object Label1: TcxLabel
      Left = 5
      Top = 5
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 
        'The ExpressVerticalGrid Suite allows you to create property insp' +
        'ectors with ease and can be purchased separately via our website' +
        '. It is available in data-aware, non-data aware and RTTI version' +
        's. You can learn more at:'
      Properties.WordWrap = True
      Height = 49
      Width = 332
    end
    object lblURL: TcxLabel
      Left = 6
      Top = 54
      Cursor = crHandPoint
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'http://www.devexpress.com/Products/VCL/ExVerticalGrid/'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -9
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsUnderline]
      Style.IsFontAssigned = True
      OnClick = lblURLClick
      Height = 13
      Width = 327
    end
  end
end
