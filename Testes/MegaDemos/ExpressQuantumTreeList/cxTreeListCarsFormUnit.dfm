inherited frmCars: TfrmCars
  Caption = 'frmCars'
  ClientWidth = 617
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlDescription: TcxGroupBox
    DesignSize = (
      617
      48)
    Width = 617
    inherited cxGroupBox6: TcxGroupBox
      DesignSize = (
        602
        33)
      Width = 602
      inherited pnlHintInternal: TPanel
        Width = 600
        inherited lblRight2: TLabel
          Left = 595
        end
        inherited lblTop2: TLabel
          Width = 600
        end
        inherited lblBottom2: TLabel
          Width = 600
        end
        inherited lblDescription: TLabel
          Width = 590
        end
      end
    end
  end
  inherited gbTreeListPlace: TcxGroupBox
    Width = 617
    inherited cxGroupBox5: TcxGroupBox
      Left = 609
    end
    inherited cxGroupBox2: TcxGroupBox
      Width = 613
    end
    inherited tlDB: TcxDBTreeList
      Width = 601
      Bands = <
        item
          Caption.Text = 'Main Info'
        end
        item
          Caption.Text = 'Specifications'
        end
        item
          Caption.Text = 'Engine'
          Position.BandIndex = 1
          Position.ColIndex = 0
        end
        item
          Caption.Text = 'Gearbox'
          Position.BandIndex = 1
          Position.ColIndex = 1
        end
        item
          Caption.Text = 'Fuel Economy (mpg)'
          Position.BandIndex = 1
          Position.ColIndex = 2
        end
        item
          Caption.Text = 'Details'
        end>
      DataController.DataSource = dmTreeList.dsCars
      DataController.ParentField = 'ParentID'
      DataController.KeyField = 'ID'
      OptionsView.BandLineHeight = 30
      OptionsView.Bands = True
      OptionsView.CategorizedColumn = clnModel
      OptionsView.ColumnAutoWidth = True
      OptionsView.GridLines = tlglHorz
      OptionsView.PaintStyle = tlpsCategorized
      Styles.OnGetContentStyle = tlDBStylesGetContentStyle
      object clnModel: TcxDBTreeListColumn
        DataBinding.FieldName = 'Model'
        Width = 150
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object clnPrice: TcxDBTreeListColumn
        PropertiesClassName = 'TcxCurrencyEditProperties'
        DataBinding.FieldName = 'Price'
        Width = 68
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object clnHP: TcxDBTreeListColumn
        Caption.Text = 'Horsepower'
        DataBinding.FieldName = 'HP'
        Width = 70
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 2
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object clnDisplacement: TcxDBTreeListColumn
        Caption.Text = 'Displacement (L)'
        DataBinding.FieldName = 'Liter'
        Width = 62
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 2
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object clnCylinders: TcxDBTreeListColumn
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Items.Strings = (
          '4'
          '6'
          '8')
        Caption.Text = 'Cylinders'
        DataBinding.FieldName = 'Cyl'
        Width = 40
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 2
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object clnSpeed: TcxDBTreeListColumn
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Items.Strings = (
          '4'
          '5')
        Caption.Text = 'Speed'
        DataBinding.FieldName = 'TransmissSpeedCount'
        Width = 43
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 3
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object clnAutomatic: TcxDBTreeListColumn
        Caption.Text = 'Automatic'
        DataBinding.FieldName = 'TransmissAutomatic'
        Width = 50
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 3
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object clnCity: TcxDBTreeListColumn
        PropertiesClassName = 'TcxSpinEditProperties'
        Caption.Text = 'City'
        DataBinding.FieldName = 'MPG_City'
        Width = 20
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 4
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object clnHighway: TcxDBTreeListColumn
        PropertiesClassName = 'TcxSpinEditProperties'
        Caption.Text = 'Highway'
        DataBinding.FieldName = 'MPG_Highway'
        Width = 50
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 4
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object clnDescription: TcxDBTreeListColumn
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        DataBinding.FieldName = 'Description'
        Width = 40
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 5
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object clnHyperlink: TcxDBTreeListColumn
        PropertiesClassName = 'TcxHyperLinkEditProperties'
        DataBinding.FieldName = 'Hyperlink'
        Width = 100
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 5
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object clnPicture: TcxDBTreeListColumn
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekPict
        Properties.PictureGraphicClassName = 'TJPEGImage'
        DataBinding.FieldName = 'Picture'
        Width = 26
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 5
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 384
    Top = 96
    PixelsPerInch = 96
    object stNavy: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object stMaroon: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clMaroon
    end
  end
end
