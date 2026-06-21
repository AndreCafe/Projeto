inherited frmOLAPDrillDown: TfrmOLAPDrillDown
  Caption = 'OLAP Drill Down'
  PixelsPerInch = 96
  TextHeight = 13
  inherited UnboundPivot: TcxPivotGrid
    OptionsView.FilterFields = False
  end
  inherited pnlFilter: TPanel
    Visible = False
  end
end
