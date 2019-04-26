inherited FrmPopUpEdit: TFrmPopUpEdit
  Caption = 'FrmPopUpEdit'
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TParentedPanel
    inherited pageControlEditar: TcxPageControl
      inherited tsGrid: TcxTabSheet
        inherited Grid: TcxGrid
          ExplicitTop = 3
        end
      end
      inherited tsEdit: TcxTabSheet
        inherited panEdit: TLMDSimplePanel
          Height = 89
          ExplicitHeight = 89
          inherited butOk: TcxButton
            Left = 11
            Top = 48
            TabOrder = 2
            ExplicitLeft = 11
            ExplicitTop = 48
          end
          inherited buCancel: TcxButton
            Left = 93
            Top = 48
            ExplicitLeft = 93
            ExplicitTop = 48
          end
          object edItem: TcxTextEdit
            AlignWithMargins = True
            Left = 10
            Top = 3
            Margins.Left = 10
            Align = alTop
            ParentFont = False
            Properties.Alignment.Horz = taLeftJustify
            Properties.Alignment.Vert = taVCenter
            Style.BorderColor = clWhite
            Style.BorderStyle = ebsFlat
            Style.Edges = [bBottom]
            Style.Font.Charset = ANSI_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -15
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            TabOrder = 0
            Text = 'edItem'
            OnKeyUp = edItemKeyUp
            Width = 415
          end
        end
      end
    end
  end
  inherited BarMgr: TdxBarManager
    DockControlHeights = (
      0
      0
      0
      0)
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmEditar: TdxBarLargeButton
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited cmImprimir: TdxBarLargeButton
      ImageIndex = 22
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
  end
  inherited Query: TnxQuery
    ActiveRuntime = False
  end
  inherited dsValores: TDataSource
    DataSet = TabValores
  end
  object TabValores: TnxTable
    Database = Dados.db
    Timeout = 10000
    FilterOptions = [foCaseInsensitive]
    TableName = 'Produto'
    Left = 80
    Top = 280
  end
end
