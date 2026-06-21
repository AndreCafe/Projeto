inherited frmOLAPBrowser: TfrmOLAPBrowser
  Caption = 'OLAP Browser'
  PixelsPerInch = 96
  TextHeight = 13
  inherited UnboundPivot: TcxPivotGrid
    Top = 41
    Height = 363
    OLAPDataSource = OLAPDataSource
    OnDblClick = UnboundPivotDblClick
  end
  object pnlFilter: TPanel
    Left = 0
    Top = 0
    Width = 761
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 16
      Top = 8
      Width = 105
      Height = 25
      Caption = 'New Connection'
      TabOrder = 0
      OnClick = cxButton1Click
    end
  end
  object OLAPDataSource: TcxPivotGridOLAPDataSource
    Active = False
    Left = 464
    Top = 48
  end
end
