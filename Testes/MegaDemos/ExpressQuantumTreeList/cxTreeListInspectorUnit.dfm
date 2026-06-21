object frmInspector: TfrmInspector
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Property Inspector'
  ClientHeight = 413
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 340
    Width = 340
    Height = 73
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 0
    DesignSize = (
      340
      73)
    object Label1: TLabel
      Left = 5
      Top = 5
      Width = 332
      Height = 49
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 
        'Note: This dialog window was created using the ExpressVerticalGr' +
        'id. It is not included as part of the ExpressQuantumTreeList and' +
        ' must be purchased separately. The ExpressVertical grid is avail' +
        'able in data-aware, non-data aware and RTTI versions. You can le' +
        'arn more at:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -10
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object lblURL: TLabel
      Left = 6
      Top = 56
      Width = 327
      Height = 13
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
