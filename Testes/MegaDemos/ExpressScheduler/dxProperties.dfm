object frmInspector: TfrmInspector
  Left = 550
  Top = 247
  Width = 293
  Height = 456
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'ExpressInspector'
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 270
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxRTTIInspector: TcxRTTIInspector
    Left = 0
    Top = 0
    Width = 285
    Height = 347
    Align = alClient
    OptionsView.RowHeaderWidth = 132
    TabOrder = 0
    OnPropertyChanged = cxRTTIInspectorPropertyChanged
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 347
    Width = 285
    Height = 75
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      285
      75)
    object Label1: TLabel
      Left = 5
      Top = 8
      Width = 278
      Height = 51
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 
        'The ExpressVerticalGrid Suite allows you to create property insp' +
        'ectors with ease. It is available in data-aware, non-data aware ' +
        'and RTTI versions. The ExpressVerticalGrid Suite can be purchase' +
        'd separately via our website. You can learn more at:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object lblURL: TLabel
      Left = 6
      Top = 55
      Width = 272
      Height = 12
      Cursor = crHandPoint
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'http://www.devexpress.com/Products/VCL/ExVerticalGrid/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = lblURLClick
    end
  end
end
