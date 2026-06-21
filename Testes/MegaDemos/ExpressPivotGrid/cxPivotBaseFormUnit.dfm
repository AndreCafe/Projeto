object cxPivotGridDemoUnitForm: TcxPivotGridDemoUnitForm
  Left = 238
  Top = 285
  Align = alClient
  BorderStyle = bsNone
  ClientHeight = 320
  ClientWidth = 802
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBPivotGrid: TcxDBPivotGrid
    Left = 0
    Top = 0
    Width = 802
    Height = 320
    Align = alClient
    FieldHeaderImages = dmPivot.imgHeaders
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    GroupHeaderImages = dmPivot.imgCategories
    Groups = <>
    OptionsSelection.MultiSelect = True
    ParentFont = False
    TabOrder = 0
    OnDblClick = DBPivotGridDblClick
  end
end
