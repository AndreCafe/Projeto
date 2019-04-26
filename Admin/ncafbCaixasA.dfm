inherited fbCaixasA: TfbCaixasA
  Left = 293
  Top = 145
  Caption = 'Caixas Anteriores'
  ClientHeight = 344
  ClientWidth = 888
  OldCreateOrder = True
  ExplicitWidth = 896
  ExplicitHeight = 371
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TParentedPanel
    Width = 888
    Height = 344
    ExplicitWidth = 888
    ExplicitHeight = 344
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 888
      Height = 44
      ExplicitWidth = 888
      ExplicitHeight = 44
    end
    object LMDSimplePanel1: TLMDSimplePanel
      AlignWithMargins = True
      Left = 0
      Top = 47
      Width = 888
      Height = 297
      Margins.Left = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Bevel.Mode = bmStandard
      TabOrder = 1
      object Grid: TcxGrid
        Left = 1
        Top = 1
        Width = 886
        Height = 295
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alClient
        BorderStyle = cxcbsNone
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        object TV: TcxGridDBTableView
          OnDblClick = cmEditarClick
          OnMouseUp = TVMouseUp
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.Insert.Enabled = False
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Delete.Enabled = False
          Navigator.Buttons.Delete.Visible = False
          Navigator.Buttons.Edit.Enabled = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Enabled = False
          Navigator.Buttons.Post.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.SaveBookmark.Enabled = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Enabled = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.Visible = True
          FilterBox.CustomizeDialog = False
          FilterBox.Visible = fvNever
          DataController.DataSource = dsTab
          DataController.Filter.MaxValueListCount = 1000
          DataController.Filter.Options = [fcoCaseInsensitive]
          DataController.KeyFieldNames = 'ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0'
              Kind = skCount
              Column = VNumero1
            end>
          DataController.Summary.SummaryGroups = <
            item
              Links = <>
              SummaryItems.Separator = ', '
              SummaryItems = <
                item
                  Kind = skCount
                end>
            end>
          DateTimeHandling.Filters = [dtfMonths, dtfYears]
          DateTimeHandling.IgnoreTimeForFiltering = True
          DateTimeHandling.MonthFormat = 'mm'
          DateTimeHandling.YearFormat = 'yyyy'
          DateTimeHandling.DateFormat = 'dd/mm/yyyy'
          DateTimeHandling.Grouping = dtgByDate
          DateTimeHandling.HourFormat = 'hh:mm'
          Filtering.ColumnPopup.MaxDropDownItemCount = 12
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.Footer = True
          OptionsView.FooterAutoHeight = True
          OptionsView.FooterMultiSummaries = True
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          OptionsView.Indicator = True
          Preview.Column = TVObs
          Preview.MaxLineCount = 0
          Preview.Visible = True
          object VNumero1: TcxGridDBColumn
            Caption = 'N'#250'm'
            DataBinding.FieldName = 'ID'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Width = 54
          end
          object TDIDLivre: TcxGridDBColumn
            Caption = 'ID. Extra'
            DataBinding.FieldName = 'IDLivre'
          end
          object VUsuario1: TcxGridDBColumn
            Caption = 'Usu'#225'rio'
            DataBinding.FieldName = 'Usuario'
            Width = 76
          end
          object VAbertura1: TcxGridDBColumn
            DataBinding.FieldName = 'Abertura'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            DateTimeGrouping = dtgByDate
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
          object VFechamento1: TcxGridDBColumn
            DataBinding.FieldName = 'Fechamento'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            DateTimeGrouping = dtgByDate
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
          object TVSaldoAnt: TcxGridDBColumn
            Caption = 'Saldo Inicial'
            DataBinding.FieldName = 'SaldoAnt'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            Width = 82
          end
          object TVTotal: TcxGridDBColumn
            Caption = 'Total'
            DataBinding.FieldName = 'TotalFinal'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            OnCustomDrawCell = TVTotalCustomDrawCell
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Width = 78
          end
          object TVSupr: TcxGridDBColumn
            Caption = '$ Adicionado'
            DataBinding.FieldName = 'Supr'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            OnGetDisplayText = TVSangriaGetDisplayText
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderGlyphAlignmentHorz = taCenter
            Width = 95
          end
          object TVSangria: TcxGridDBColumn
            Caption = '$ Retirado'
            DataBinding.FieldName = 'Sangria'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            OnGetDisplayText = TVSangriaGetDisplayText
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 87
          end
          object TVSaldoFinal: TcxGridDBColumn
            AlternateCaption = 'Saldo Final Calculado Automaticamente'
            Caption = 'Saldo Final'
            DataBinding.FieldName = 'SaldoFinal'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            OnCustomDrawCell = TVTotalCustomDrawCell
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Width = 81
          end
          object TVSaldoF: TcxGridDBColumn
            AlternateCaption = 'Saldo Final Informado pelo usu'#225'rio'
            Caption = 'Saldo Final Informado'
            DataBinding.FieldName = 'SaldoF'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 120
          end
          object TVQuebra: TcxGridDBColumn
            Caption = 'Quebra de Caixa'
            DataBinding.FieldName = 'Quebra'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 103
          end
          object TVReproc: TcxGridDBColumn
            Caption = 'Reprocessado em'
            DataBinding.FieldName = 'Reproc'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 105
          end
          object TVObs: TcxGridDBColumn
            Caption = 'Observa'#231#245'es'
            DataBinding.FieldName = 'Obs'
          end
        end
        object GL: TcxGridLevel
          GridView = TV
        end
      end
    end
  end
  inherited BarMgr: TdxBarManager
    Top = 96
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMgrBar1: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmEditar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmTotalizar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmCorrigir'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmEmail'
        end
        item
          Visible = True
          ItemName = 'cmObs'
        end>
      OldName = 'BarraTabSheet1'
      UseRestSpace = True
    end
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      Caption = '&Ver Detalhes'
      Hint = 'Ver Detalhes'
      LargeImageIndex = 99
      OnClick = cmEditarClick
      ShowCaption = True
      ImageIndex = 73
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
    object cmTotalizar: TdxBarLargeButton
      Caption = 'Totalizar Per'#237'odo'
      Category = 0
      Hint = 
        'Somar todos caixas de um per'#237'odo. Ex: caixa do m'#234's, da semana, d' +
        'o ano.'
      Visible = ivAlways
      LargeImageIndex = 42
      OnClick = cmTotalizarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmVerDet: TdxBarButton
      Caption = 'Ver Detalhes'
      Category = 0
      Hint = 'Ver Detalhes'
      Visible = ivAlways
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'Caixas Anteriores'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmVerAtual'
        end>
    end
    object cmVerAtual: TdxBarButton
      Caption = 'Ver Caixa Atual'
      Category = 0
      Hint = 'Ver Caixa Atual'
      Visible = ivAlways
      OnClick = cmVerAtualClick
    end
    object cmCorrigeDataHora: TdxBarLargeButton
      Caption = 'Corrigir Data/Hora'
      Category = 0
      Hint = 'Corrigir Caixa'
      Visible = ivAlways
      LargeImageIndex = 58
      OnClick = cmCorrigeDataHoraClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmReprocessar: TdxBarLargeButton
      Caption = 'Reprocessar Caixa'
      Category = 0
      Hint = 'Reprocessar Caixa'
      Visible = ivAlways
      LargeImageIndex = 46
      OnClick = cmReprocessarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmObs: TdxBarLargeButton
      Align = iaRight
      Caption = 'Mostrar Observa'#231#245'es'
      Category = 0
      Hint = 'Mostrar Observa'#231#245'es'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      LargeImageIndex = 112
      OnClick = cmObsClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      ShowCaption = False
    end
    object cmCorrigir: TdxBarLargeButton
      Caption = 'Corrigir'
      Category = 0
      Hint = 'Corrigir'
      Visible = ivAlways
      LargeImageIndex = 38
      OnClick = cmCorrigeDataHoraClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmEmail: TdxBarLargeButton
      Caption = 'Reenviar caixa por e-mail'
      Category = 0
      Hint = 'Reenviar caixa por e-mail'
      Visible = ivAlways
      LargeImageIndex = 71
      OnClick = cmEmailClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
  end
  inherited MenuGrid: TcxGridPopupMenu
    Grid = Grid
    Left = 24
    Top = 105
  end
  inherited pmLay: TdxBarPopupMenu
    Left = 256
    Top = 234
  end
  object Tab: TnxTable
    Database = Dados.db
    Filter = 'Aberto = False'
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    FlipOrder = True
    OnCalcFields = TabCalcFields
    TableName = 'Caixa'
    IndexName = 'IID'
    Left = 104
    Top = 179
    object TabID: TAutoIncField
      FieldName = 'ID'
    end
    object TabAberto: TBooleanField
      FieldName = 'Aberto'
    end
    object TabUsuario: TStringField
      FieldName = 'Usuario'
    end
    object TabAbertura: TDateTimeField
      FieldName = 'Abertura'
    end
    object TabFechamento: TDateTimeField
      FieldName = 'Fechamento'
    end
    object TabTotalFinal: TCurrencyField
      FieldName = 'TotalFinal'
    end
    object TabDescontos: TCurrencyField
      FieldName = 'Descontos'
    end
    object TabCancelamentos: TCurrencyField
      FieldName = 'Cancelamentos'
    end
    object TabSaldoAnt: TCurrencyField
      FieldName = 'SaldoAnt'
    end
    object TabObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object TabSaldoFinal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SaldoFinal'
      Calculated = True
    end
    object TabSangria: TCurrencyField
      FieldName = 'Sangria'
    end
    object TabSupr: TCurrencyField
      FieldName = 'Supr'
    end
    object TabReproc: TDateTimeField
      FieldName = 'Reproc'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object TabEstSessoesQtd: TIntegerField
      FieldName = 'EstSessoesQtd'
    end
    object TabEstSessoesTempo: TFloatField
      FieldName = 'EstSessoesTempo'
    end
    object TabEstUrls: TIntegerField
      FieldName = 'EstUrls'
    end
    object TabEstSyncOk: TBooleanField
      FieldName = 'EstSyncOk'
    end
    object TabEstBuscasEng: TnxMemoField
      FieldName = 'EstBuscasEng'
      BlobType = ftMemo
    end
    object TabEstRes: TnxMemoField
      FieldName = 'EstRes'
      BlobType = ftMemo
    end
    object TabSaldoF: TCurrencyField
      FieldName = 'SaldoF'
    end
    object TabQuebra: TCurrencyField
      FieldName = 'Quebra'
    end
    object TabIDLivre: TStringField
      FieldName = 'IDLivre'
      Size = 10
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 144
    Top = 179
  end
  object pmCaixa: TdxBarPopupMenu
    BarManager = BarMgr
    ItemLinks = <
      item
        Visible = True
        ItemName = 'cmEditar'
      end
      item
        Visible = True
        ItemName = 'cmTotalizar'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmCorrigeDataHora'
      end
      item
        BeginGroup = True
        Visible = True
        ItemName = 'cmReprocessar'
      end>
    UseOwnFont = False
    Left = 304
    Top = 104
  end
end
