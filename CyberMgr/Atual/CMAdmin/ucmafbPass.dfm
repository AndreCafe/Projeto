inherited fbPassaportes: TfbPassaportes
  Left = 32
  Top = 177
  Caption = 'Lista de Passaportes'
  ClientHeight = 296
  ClientWidth = 722
  OldCreateOrder = True
  WindowState = wsMaximized
  OnClose = FrmBasePaiClose
  OnCreate = FrmBasePaiCreate
  ExplicitWidth = 730
  ExplicitHeight = 323
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 58
    Width = 722
    Height = 238
    ExplicitTop = 58
    ExplicitWidth = 722
    ExplicitHeight = 238
    object Grid: TcxGrid
      Left = 0
      Top = 0
      Width = 722
      Height = 238
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      object TV: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataModeController.GridMode = True
        DataController.DataSource = dsTab
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.KeyFieldNames = 'Numero'
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
        Filtering.ColumnPopupMaxDropDownItemCount = 12
        OptionsBehavior.IncSearch = True
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        object TVSenha: TcxGridDBColumn
          DataBinding.FieldName = 'Senha'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 20
          Properties.ReadOnly = False
          Width = 100
        end
        object TVNumero: TcxGridDBColumn
          Caption = 'N'#250'mero'
          DataBinding.FieldName = 'Numero'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          Width = 78
        end
        object TVExpirou: TcxGridDBColumn
          DataBinding.FieldName = 'Expirou'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.Alignment = taCenter
          Properties.NullStyle = nssUnchecked
          Properties.ReadOnly = False
          Properties.ValueChecked = 'True'
          Properties.ValueGrayed = ''
          Properties.ValueUnchecked = 'False'
          HeaderAlignmentHorz = taCenter
          MinWidth = 16
          Width = 89
        end
        object TVDataCompra: TcxGridDBColumn
          Caption = 'Data Compra'
          DataBinding.FieldName = 'DataCompra'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DateButtons = [btnClear, btnToday]
          Properties.DateOnError = deToday
          HeaderAlignmentHorz = taCenter
          Width = 99
        end
        object TVPrimeiroUso: TcxGridDBColumn
          Caption = 'Primeiro Uso'
          DataBinding.FieldName = 'PrimeiroUso'
          PropertiesClassName = 'TcxDateEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.DateButtons = [btnClear, btnToday]
          Properties.DateOnError = deToday
          OnGetDisplayText = TVPrimeiroUsoGetDisplayText
          HeaderAlignmentHorz = taCenter
          Width = 109
        end
        object TVAcessos: TcxGridDBColumn
          Caption = 'N'#186' Acessos'
          DataBinding.FieldName = 'Acessos'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          Width = 90
        end
        object TVTempoTotal: TcxGridDBColumn
          Caption = 'T. Total'
          DataBinding.FieldName = 'TempoTotal'
          PropertiesClassName = 'TcxTimeEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          Width = 68
        end
        object TVTempoUsado: TcxGridDBColumn
          Caption = 'T. Usado'
          DataBinding.FieldName = 'TempoUsado'
          PropertiesClassName = 'TcxTimeEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          Width = 70
        end
        object TVNomeCliente: TcxGridDBColumn
          Caption = 'Cliente'
          DataBinding.FieldName = 'NomeCliente'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownRows = 7
          Properties.ImmediateDropDown = False
          Properties.KeyFieldNames = 'Codigo'
          Properties.ListColumns = <
            item
              FieldName = 'Nome'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.MaxLength = 20
          Properties.ReadOnly = False
          Width = 148
        end
        object TVNomePass: TcxGridDBColumn
          Caption = 'Nome Passaporte'
          DataBinding.FieldName = 'NomePass'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.DropDownRows = 7
          Properties.ImmediateDropDown = False
          Properties.KeyFieldNames = 'Codigo'
          Properties.ListColumns = <
            item
              FieldName = 'Nome'
            end>
          Properties.ListOptions.ShowHeader = False
          Properties.MaxLength = 50
          Properties.ReadOnly = False
          Width = 176
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
  end
  inherited BarMgr: TdxBarManager
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'BarraTabSheet'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 216
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = cmMostrar
            UserDefine = [udWidth]
            UserWidth = 170
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmEditar
            UserDefine = [udPaintStyle]
            UserPaintStyle = psCaptionGlyph
            Visible = True
          end
          item
            BeginGroup = True
            Item = cmAtualizar
            Visible = True
          end
          item
            Item = cmExportar
            Visible = True
          end
          item
            Item = cmImprimir
            Visible = True
          end
          item
            Item = cmLayout
            Visible = True
          end>
        Name = 'BarraTabSheet'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    LargeImages = FrmPri.im32
    DockControlHeights = (
      0
      0
      58
      0)
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = 0
    end
    inherited cmEditar: TdxBarLargeButton
      Caption = '&Editar/Ver Detalhes'
      Hint = 'Editar/Ver Detalhes'
      OnClick = cmEditarClick
      GlyphLayout = glTop
      ShowCaption = True
      ImageIndex = 13
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited cmAtualizar: TdxBarLargeButton
      GlyphLayout = glTop
    end
    inherited cmExportar: TdxBarLargeButton
      GlyphLayout = glTop
      LargeImageIndex = 47
    end
    inherited cmImprimir: TdxBarLargeButton
      GlyphLayout = glTop
      LargeImageIndex = 7
    end
    inherited cmLayout: TdxBarLargeButton
      Align = iaRight
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
    object cmMostrar: TdxBarCombo
      Caption = '&Mostrar'
      Category = 0
      Hint = 'Mostrar'
      Visible = ivAlways
      Text = 'Mostrar passaportes v'#225'lidos'
      OnChange = cmMostrarChange
      ShowCaption = True
      Width = 100
      ShowEditor = False
      Items.Strings = (
        'Mostrar passaportes v'#225'lidos'
        'Mostrar passaportes expirados'
        'Mostrar todos passaportes')
      ItemIndex = 0
    end
  end
  inherited dlgExp: TSaveDialog
    Left = 128
    Top = 121
  end
  object Tab: TnxTable
    Database = Dados.db
    FilterOptions = [foCaseInsensitive]
    OnCalcFields = TabCalcFields
    TableName = 'Passaporte'
    IndexName = 'ICliNumero'
    Left = 32
    Top = 123
    object TabNumero: TAutoIncField
      FieldName = 'Numero'
    end
    object TabTipoPass: TIntegerField
      FieldName = 'TipoPass'
    end
    object TabCliente: TIntegerField
      FieldName = 'Cliente'
    end
    object TabExpirou: TBooleanField
      FieldName = 'Expirou'
    end
    object TabSenha: TStringField
      FieldName = 'Senha'
    end
    object TabPrimeiroUso: TDateTimeField
      FieldName = 'PrimeiroUso'
    end
    object TabTipoAcesso: TIntegerField
      FieldName = 'TipoAcesso'
    end
    object TabTipoExp: TWordField
      FieldName = 'TipoExp'
    end
    object TabExpirarEm: TDateTimeField
      FieldName = 'ExpirarEm'
    end
    object TabMaxSegundos: TIntegerField
      FieldName = 'MaxSegundos'
    end
    object TabSegundos: TIntegerField
      FieldName = 'Segundos'
    end
    object TabAcessos: TIntegerField
      FieldName = 'Acessos'
    end
    object TabDia1: TIntegerField
      FieldName = 'Dia1'
    end
    object TabDia2: TIntegerField
      FieldName = 'Dia2'
    end
    object TabDia3: TIntegerField
      FieldName = 'Dia3'
    end
    object TabDia4: TIntegerField
      FieldName = 'Dia4'
    end
    object TabDia5: TIntegerField
      FieldName = 'Dia5'
    end
    object TabDia6: TIntegerField
      FieldName = 'Dia6'
    end
    object TabDia7: TIntegerField
      FieldName = 'Dia7'
    end
    object TabTransacao: TIntegerField
      FieldName = 'Transacao'
    end
    object TabDataCompra: TDateTimeField
      FieldName = 'DataCompra'
    end
    object TabNomePass: TStringField
      FieldKind = fkLookup
      FieldName = 'NomePass'
      LookupDataSet = Dados.tbTipoPass
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'TipoPass'
      LookupCache = True
      Size = 50
      Lookup = True
    end
    object TabValido: TBooleanField
      FieldName = 'Valido'
    end
    object TabValor: TCurrencyField
      FieldName = 'Valor'
    end
    object TabTempoTotal: TTimeField
      FieldKind = fkCalculated
      FieldName = 'TempoTotal'
      Calculated = True
    end
    object TabTempoUsado: TTimeField
      FieldKind = fkCalculated
      FieldName = 'TempoUsado'
      Calculated = True
    end
    object TabNomeCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeCliente'
      LookupDataSet = Dados.tbCli
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Nome'
      KeyFields = 'Cliente'
      Lookup = True
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 64
    Top = 123
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 50
    Left = 94
    Top = 122
  end
end
