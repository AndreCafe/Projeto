inherited fbPassaportes: TfbPassaportes
  Left = 32
  Top = 177
  Caption = 'Lista de Passaportes'
  ClientHeight = 447
  ClientWidth = 722
  OldCreateOrder = True
  WindowState = wsMaximized
  OnClose = FrmBasePaiClose
  OnCreate = FrmBasePaiCreate
  ExplicitWidth = 738
  ExplicitHeight = 483
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TPanel
    Top = 60
    Width = 722
    Height = 387
    ExplicitTop = 60
    ExplicitWidth = 722
    ExplicitHeight = 387
    object Grid: TcxGrid
      Left = 0
      Top = 57
      Width = 722
      Height = 330
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      object TV: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.Insert.Visible = False
        NavigatorButtons.Delete.Enabled = False
        NavigatorButtons.Delete.Visible = False
        NavigatorButtons.Edit.Enabled = False
        NavigatorButtons.Edit.Visible = False
        NavigatorButtons.Post.Visible = False
        NavigatorButtons.Cancel.Enabled = False
        NavigatorButtons.Cancel.Visible = False
        NavigatorButtons.Filter.Enabled = False
        NavigatorButtons.Filter.Visible = False
        DataController.DataModeController.GridMode = True
        DataController.DataSource = dsTab
        DataController.Filter.MaxValueListCount = 1000
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Filter.Active = True
        DataController.Filter.AutoDataSetFilter = True
        DataController.KeyFieldNames = 'ID'
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
        OptionsData.Inserting = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsView.Navigator = True
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.Indicator = True
        Preview.AutoHeight = False
        object TVSenha: TcxGridDBColumn
          DataBinding.FieldName = 'Senha'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taLeftJustify
          Properties.MaxLength = 20
          Properties.ReadOnly = True
          Width = 100
        end
        object TVNumero: TcxGridDBColumn
          Caption = 'N'#250'mero'
          DataBinding.FieldName = 'ID'
          PropertiesClassName = 'TcxMaskEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.MaxLength = 0
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          Options.Focusing = False
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
          Options.Focusing = False
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
          Options.Focusing = False
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
          Options.Focusing = False
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
          Options.Focusing = False
          Width = 90
        end
        object TVTempoTotal: TcxGridDBColumn
          Caption = 'T. Total'
          DataBinding.FieldName = 'TempoTotal'
          PropertiesClassName = 'TcxTimeEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          Options.Focusing = False
          Width = 68
        end
        object TVTempoUsado: TcxGridDBColumn
          Caption = 'T. Usado'
          DataBinding.FieldName = 'TempoUsado'
          PropertiesClassName = 'TcxTimeEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.ReadOnly = False
          HeaderAlignmentHorz = taCenter
          Options.Focusing = False
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
          Options.Focusing = False
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
          Options.Focusing = False
          Width = 176
        end
      end
      object GL: TcxGridLevel
        GridView = TV
      end
    end
    object panFiltro: TLMDSimplePanel
      Left = 0
      Top = 0
      Width = 722
      Height = 57
      UseDockManager = False
      Align = alTop
      Bevel.Mode = bmEdge
      TabOrder = 1
      object panMostrar: TLMDSimplePanel
        Left = 2
        Top = 2
        Width = 200
        Height = 53
        UseDockManager = False
        Align = alLeft
        Bevel.BorderSides = [fsRight]
        Bevel.Mode = bmEdge
        TabOrder = 0
        object rgValidos: TcxRadioButton
          Left = 8
          Top = 25
          Width = 57
          Height = 17
          Caption = 'V'#225'lidos'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rgValidosClick
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = True
        end
        object lbOpMostrar: TcxLabel
          Left = 8
          Top = 6
          Caption = 'Mostrar Passaportes'
        end
        object rgExpirados: TcxRadioButton
          Tag = 1
          Left = 66
          Top = 25
          Width = 73
          Height = 17
          Caption = 'Expirados'
          TabOrder = 2
          OnClick = rgValidosClick
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = True
        end
        object rgTodos: TcxRadioButton
          Tag = 2
          Left = 138
          Top = 25
          Width = 54
          Height = 17
          Caption = 'Todos'
          TabOrder = 3
          OnClick = rgValidosClick
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = True
        end
      end
      object LMDSimplePanel3: TLMDSimplePanel
        Left = 202
        Top = 2
        Width = 183
        Height = 53
        UseDockManager = False
        Align = alLeft
        Bevel.BorderSides = []
        Bevel.Mode = bmEdge
        TabOrder = 1
        object edSenha: TcxTextEdit
          Left = 9
          Top = 23
          Enabled = False
          Properties.OnChange = edSenhaPropertiesChange
          Style.BorderStyle = ebsFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          Width = 168
        end
        object cbPesqSenha: TcxCheckBox
          Left = 5
          Top = 3
          Caption = 'Pesquisar por Senha do Cartao'
          Properties.ImmediatePost = True
          Style.BorderStyle = ebsFlat
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 1
          OnClick = cbPesqSenhaClick
          Width = 174
        end
      end
    end
  end
  inherited BarMgr: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = FrmPri.im32
    LookAndFeel.NativeStyle = True
    Style = bmsUseLookAndFeel
    Left = 64
    Top = 200
    DockControlHeights = (
      0
      0
      60
      0)
    inherited BarMgrBar1: TdxBar
      ItemLinks = <
        item
          UserDefine = [udPaintStyle]
          UserPaintStyle = psCaptionGlyph
          Visible = True
          ItemName = 'cmEditar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmAtualizar'
        end
        item
          Visible = True
          ItemName = 'cmExportar'
        end
        item
          Visible = True
          ItemName = 'cmImprimir'
        end
        item
          Visible = True
          ItemName = 'cmLayout'
        end>
    end
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
  end
  inherited MenuGrid: TcxGridPopupMenu
    Left = 24
    Top = 201
  end
  inherited CP: TdxComponentPrinter
    Top = 138
  end
  inherited dlgExp: TSaveDialog
    Left = 136
    Top = 185
  end
  inherited pmLay: TdxBarPopupMenu
    Top = 130
  end
  inherited pmPeriodo: TdxBarPopupMenu
    Left = 208
    Top = 212
  end
  object Tab: TnxTable
    Database = Dados.db
    FilterOptions = [foCaseInsensitive]
    OnCalcFields = TabCalcFields
    TableName = 'Passaporte'
    IndexName = 'ICliExpID'
    Left = 24
    Top = 171
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
    object TabDataCompra: TDateTimeField
      FieldName = 'DataCompra'
    end
    object TabNomePass: TStringField
      FieldKind = fkLookup
      FieldName = 'NomePass'
      LookupDataSet = Dados.tbTipoPass
      LookupKeyFields = 'ID'
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
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'Cliente'
      Lookup = True
    end
    object TabID: TAutoIncField
      FieldName = 'ID'
    end
    object TabTran: TIntegerField
      FieldName = 'Tran'
    end
    object TabSessao: TIntegerField
      FieldName = 'Sessao'
    end
  end
  object dsTab: TDataSource
    DataSet = Tab
    Left = 56
    Top = 171
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 50
    Left = 102
    Top = 170
  end
end
