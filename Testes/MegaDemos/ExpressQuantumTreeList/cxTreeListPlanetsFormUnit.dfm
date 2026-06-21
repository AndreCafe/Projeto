inherited frmPlanets: TfrmPlanets
  Caption = 'frmPlanets'
  ClientHeight = 494
  ClientWidth = 797
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDescription: TcxGroupBox
    Top = 446
    DesignSize = (
      797
      48)
    Width = 797
    inherited cxGroupBox6: TcxGroupBox
      DesignSize = (
        782
        33)
      Width = 782
      inherited pnlHintInternal: TPanel
        Width = 780
        inherited lblRight2: TLabel
          Left = 775
        end
        inherited lblTop2: TLabel
          Width = 780
        end
        inherited lblBottom2: TLabel
          Width = 780
        end
        inherited lblDescription: TLabel
          Width = 770
        end
      end
    end
  end
  inherited gbTreeListPlace: TcxGroupBox
    Height = 446
    Width = 797
    inherited cxGroupBox4: TcxGroupBox
      Height = 435
    end
    inherited cxGroupBox5: TcxGroupBox
      Left = 789
      Height = 435
    end
    inherited cxGroupBox2: TcxGroupBox
      Width = 793
    end
    inherited tlUnbound: TcxTreeList
      Width = 781
      Height = 435
      Bands = <
        item
        end>
      OptionsView.ColumnAutoWidth = True
      object clName: TcxTreeListColumn
        Caption.Text = 'Name'
        DataBinding.ValueType = 'String'
        Width = 183
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object clOrbitNumb: TcxTreeListColumn
        Caption.Text = '#'
        DataBinding.ValueType = 'String'
        Width = 53
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object clOrbits: TcxTreeListColumn
        Visible = False
        Caption.Text = 'Orbits'
        DataBinding.ValueType = 'String'
        Options.Hidden = True
        Options.Customizing = False
        Width = 100
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object clDistance: TcxTreeListColumn
        Caption.Text = 'Distance(000km)'
        DataBinding.ValueType = 'String'
        Width = 110
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object clPeriod: TcxTreeListColumn
        Caption.Text = 'Period(days)'
        DataBinding.ValueType = 'String'
        Width = 113
        Position.ColIndex = 4
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object clDiscoverer: TcxTreeListColumn
        Caption.Text = 'Discoverer'
        DataBinding.ValueType = 'String'
        Width = 112
        Position.ColIndex = 5
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object clDate: TcxTreeListColumn
        Caption.Text = 'Date'
        DataBinding.ValueType = 'String'
        Width = 112
        Position.ColIndex = 6
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object clRadius: TcxTreeListColumn
        Caption.Text = 'Radius(km)'
        DataBinding.ValueType = 'String'
        Width = 112
        Position.ColIndex = 7
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object clImageIndex: TcxTreeListColumn
        Visible = False
        Caption.Text = 'ImageIndex'
        DataBinding.ValueType = 'String'
        Options.Hidden = True
        Options.Customizing = False
        Position.ColIndex = 8
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
    end
  end
end
