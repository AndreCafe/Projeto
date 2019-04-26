inherited fbPrintMon: TfbPrintMon
  Caption = 'Monitor de Impress'#245'es'
  ClientHeight = 602
  ClientWidth = 1054
  ExplicitWidth = 1062
  ExplicitHeight = 629
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TLMDSimplePanel
    Width = 1054
    Height = 602
    ExplicitWidth = 1054
    ExplicitHeight = 602
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 1054
      Visible = False
      ExplicitWidth = 1054
    end
    object Grid: TcxGrid
      AlignWithMargins = True
      Left = 0
      Top = 33
      Width = 1054
      Height = 569
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      object TV: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.Visible = True
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        DataController.DataModeController.GridMode = True
        DataController.DataSource = DataSource1
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.KeyFieldNames = 'IDSeq'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <
          item
            Links = <>
            SummaryItems.Separator = ', '
            SummaryItems = <
              item
                Kind = skCount
              end>
          end>
        Filtering.ColumnPopup.MaxDropDownItemCount = 12
        OptionsBehavior.IncSearch = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        Preview.AutoHeight = False
        Preview.Visible = True
        object TVMaq: TcxGridDBColumn
          Caption = 'Maq.'
          DataBinding.FieldName = 'Maq'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Styles.Content = cxStyle1
          Width = 35
        end
        object TVPaginas: TcxGridDBColumn
          Caption = 'P'#225'g.'
          DataBinding.FieldName = 'Paginas'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Styles.Content = cxStyle1
          Width = 36
        end
        object TVStatus: TcxGridDBColumn
          DataBinding.FieldName = 'Status'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Items = <
            item
              Description = 'Novo'
              ImageIndex = 0
              Value = 1
            end
            item
              Description = 'Processando'
              Value = 2
            end
            item
              Description = 'Pausado'
              Value = 3
            end
            item
              Description = 'Processando'
              Value = 4
            end
            item
              Description = 'Abortado'
              Value = 5
            end
            item
              Description = 'Completado'
              Value = 6
            end
            item
              Description = 'Erro'
              Value = 7
            end
            item
              Description = 'Imprimindo'
              Value = 8
            end
            item
              Description = 'Apagado'
              Value = 9
            end>
          Width = 103
        end
        object TVPrinterName: TcxGridDBColumn
          Caption = 'Impressora'
          DataBinding.FieldName = 'PrinterName'
          Width = 185
        end
        object TVDocument: TcxGridDBColumn
          Caption = 'Documento'
          DataBinding.FieldName = 'Document'
          Width = 187
        end
        object TVComputerName: TcxGridDBColumn
          Caption = 'Nome Computador'
          DataBinding.FieldName = 'ComputerName'
          Width = 205
        end
        object TVUserName: TcxGridDBColumn
          Caption = 'Usu'#225'rio'
          DataBinding.FieldName = 'UserName'
          Width = 132
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
  end
  inherited BarMgr: TdxBarManager
    ImageOptions.LargeImages = nil
    Left = 288
    Top = 168
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      OldName = 'BarraTabSheet1'
    end
    inherited cmNovo: TdxBarLargeButton
      LargeImageIndex = -1
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited cmAtualizar: TdxBarLargeButton
      ShowCaption = False
    end
    inherited cmExportar: TdxBarLargeButton
      LargeImageIndex = 47
      ShowCaption = False
    end
    inherited cmImprimir: TdxBarLargeButton
      LargeImageIndex = 7
      ShowCaption = False
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    object cmJobResume: TdxBarButton
      Caption = 'Imprimir'
      Category = 0
      Hint = 'Imprimir'
      Style = cxStyle1
      Visible = ivAlways
      ImageIndex = 37
      PaintStyle = psCaptionGlyph
    end
    object cmJobDelete: TdxBarButton
      Caption = 'Cancelar Impress'#227'o'
      Category = 0
      Hint = 'Cancelar Impress'#227'o'
      Visible = ivAlways
      ImageIndex = 38
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 24
    Top = 121
  end
  inherited CP: TdxComponentPrinter
    Left = 160
    Top = 170
  end
  inherited pmLay: TdxBarPopupMenu
    Left = 328
    Top = 154
  end
  object DataSource1: TDataSource
    DataSet = Tab
    Left = 102
    Top = 229
  end
  object Tab: TnxTable
    Database = Dados.db
    FilterOptions = [foCaseInsensitive]
    TableName = 'PrintMon'
    IndexName = 'IPrinterIndexJobID'
    Left = 102
    Top = 189
    object TabJobID: TIntegerField
      FieldName = 'JobID'
    end
    object TabComputer: TStringField
      FieldName = 'Computer'
      Size = 100
    end
    object TabMaquina: TWordField
      FieldName = 'Maquina'
    end
    object TabPrinterName: TStringField
      FieldName = 'PrinterName'
      Size = 300
    end
    object TabPrinterShare: TStringField
      FieldName = 'PrinterShare'
      Size = 300
    end
    object TabPrinterPort: TStringField
      FieldName = 'PrinterPort'
      Size = 300
    end
    object TabPrinterServer: TStringField
      FieldName = 'PrinterServer'
      Size = 300
    end
    object TabUser: TStringField
      FieldName = 'User'
      Size = 300
    end
    object TabDocument: TnxMemoField
      FieldName = 'Document'
      BlobType = ftMemo
    end
    object TabPages: TIntegerField
      FieldName = 'Pages'
    end
    object TabTotalPages: TIntegerField
      FieldName = 'TotalPages'
    end
    object TabCopies: TIntegerField
      FieldName = 'Copies'
    end
    object TabClientPages: TIntegerField
      FieldName = 'ClientPages'
    end
    object TabStatus: TWordField
      FieldName = 'Status'
    end
    object TabPrinterIndex: TIntegerField
      FieldName = 'PrinterIndex'
    end
    object TabPausou: TBooleanField
      FieldName = 'Pausou'
    end
    object TabLiberacao: TWordField
      FieldName = 'Liberacao'
    end
    object TabImpID: TIntegerField
      FieldName = 'ImpID'
    end
  end
  object Timer1: TTimer
    Interval = 3000
    OnTimer = Timer1Timer
    Left = 432
    Top = 376
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 88
    Top = 112
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
end
