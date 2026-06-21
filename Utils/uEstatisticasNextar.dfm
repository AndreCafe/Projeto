object Form13: TForm13
  Left = 0
  Top = 0
  Caption = 'Estat'#237'sticas Nextar'
  ClientHeight = 591
  ClientWidth = 1208
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Paginas: TcxPageControl
    Left = 0
    Top = 43
    Width = 1208
    Height = 548
    ActivePage = cxTabSheet3
    Align = alClient
    TabOrder = 0
    Visible = False
    ClientRectBottom = 548
    ClientRectRight = 1208
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = 'Valores Recebidos'
      ImageIndex = 0
      object gridRec: TcxGrid
        Left = 0
        Top = 0
        Width = 1208
        Height = 524
        Align = alClient
        TabOrder = 0
        object tvRec: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = DataSource1
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = '0.00'
              Kind = skSum
              Position = spFooter
              Column = tvRecTotal
            end
            item
              Format = ' R$ 0.00'
              Kind = skSum
              Column = tvRecTotal
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ' R$ 0.00'
              Kind = skSum
              Column = tvRecTotal
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Footer = True
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          OptionsView.GroupRowStyle = grsOffice11
          OptionsView.GroupSummaryLayout = gslAlignWithColumns
          object tvRecAno: TcxGridDBColumn
            DataBinding.FieldName = 'Ano'
            Visible = False
            GroupIndex = 0
          end
          object tvRecMes: TcxGridDBColumn
            DataBinding.FieldName = 'Mes'
          end
          object tvRecTotal: TcxGridDBColumn
            DataBinding.FieldName = 'Total'
            Width = 130
          end
        end
        object glRec: TcxGridLevel
          GridView = tvRec
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Vendas Realizadas'
      ImageIndex = 1
      object gridVen: TcxGrid
        Left = 0
        Top = 0
        Width = 1208
        Height = 524
        Align = alClient
        TabOrder = 0
        object TVVen: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsVen
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = '0.00'
              Kind = skSum
              Position = spFooter
              Column = cxGridDBColumn3
            end
            item
              Format = ' R$ 0.00'
              Kind = skSum
              Column = cxGridDBColumn3
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ' R$ 0.00'
              Kind = skSum
              Column = cxGridDBColumn3
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Footer = True
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          OptionsView.GroupRowStyle = grsOffice11
          OptionsView.GroupSummaryLayout = gslAlignWithColumns
          object cxGridDBColumn1: TcxGridDBColumn
            DataBinding.FieldName = 'Ano'
            Visible = False
            GroupIndex = 0
          end
          object cxGridDBColumn2: TcxGridDBColumn
            DataBinding.FieldName = 'Mes'
          end
          object cxGridDBColumn3: TcxGridDBColumn
            DataBinding.FieldName = 'Total'
            Width = 130
          end
        end
        object glVen: TcxGridLevel
          GridView = TVVen
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'Cadastros'
      ImageIndex = 2
      object gridCad: TcxGrid
        Left = 0
        Top = 0
        Width = 1208
        Height = 524
        Align = alClient
        TabOrder = 0
        object TVCad: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.Insert.Enabled = False
          NavigatorButtons.Insert.Visible = False
          NavigatorButtons.Append.Enabled = False
          NavigatorButtons.Delete.Enabled = False
          NavigatorButtons.Delete.Visible = False
          NavigatorButtons.Edit.Visible = True
          NavigatorButtons.SaveBookmark.Visible = False
          NavigatorButtons.GotoBookmark.Visible = False
          NavigatorButtons.Filter.Visible = False
          DataController.DataSource = dsCad
          DataController.DetailKeyFieldNames = 'Ano;Mes;Dia'
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = '0'
              Kind = skSum
              Column = TVCadCriacao
            end
            item
              Format = '0'
              Kind = skSum
              Column = TVCadAtivacao
            end
            item
              Format = '0'
              Kind = skSum
              Column = TVCadNaoAtivou
            end
            item
              Format = '0'
              Kind = skSum
              Column = TVCadChurn
            end
            item
              Format = '0'
              Kind = skSum
              Column = TVCadSaldo
            end
            item
              Format = '0'
              Kind = skAverage
              Column = TVCadDiasM
            end
            item
              Format = '0.0%'
              Kind = skAverage
              Column = TVCadpercAtivacao
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = 'Med=0'
              Kind = skAverage
              Column = TVCadCriacao
            end>
          DataController.Summary.SummaryGroups = <>
          DataController.OnDetailExpanded = TVCadDataControllerDetailExpanded
          OptionsSelection.CellSelect = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.Footer = True
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          OptionsView.GroupRowStyle = grsOffice11
          OptionsView.GroupSummaryLayout = gslAlignWithColumns
          OptionsView.Indicator = True
          object TVCadAno: TcxGridDBColumn
            DataBinding.FieldName = 'Ano'
            Visible = False
            GroupIndex = 0
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
          object TVCadMes: TcxGridDBColumn
            DataBinding.FieldName = 'Mes'
            Visible = False
            GroupIndex = 1
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
          object TVCadDia: TcxGridDBColumn
            DataBinding.FieldName = 'Dia'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
          object TVCadCriacao: TcxGridDBColumn
            DataBinding.FieldName = 'Criacao'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Styles.Content = cxStyle1
            Width = 79
          end
          object TVCadAtivacao: TcxGridDBColumn
            DataBinding.FieldName = 'Ativacao'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Styles.Content = cxStyle1
            Width = 78
          end
          object TVCadpercAtivacao: TcxGridDBColumn
            Caption = '%'
            DataBinding.FieldName = 'percAtivacao'
            Width = 31
          end
          object TVCadNaoAtivou: TcxGridDBColumn
            Caption = 'N-Ativou'
            DataBinding.FieldName = 'NaoAtivou'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Styles.Content = cxStyle1
            Width = 85
          end
          object TVCadpercNAtivou: TcxGridDBColumn
            Caption = '%'
            DataBinding.FieldName = 'percNAtivou'
            Width = 32
          end
          object TVCadChurn: TcxGridDBColumn
            Caption = 'Abandono'
            DataBinding.FieldName = 'Churn'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Styles.Content = cxStyle1
            Width = 83
          end
          object TVCadpercAbandono: TcxGridDBColumn
            Caption = '%'
            DataBinding.FieldName = 'percAbandono'
            Width = 31
          end
          object TVCadDiasM: TcxGridDBColumn
            Caption = 'Dias'
            DataBinding.FieldName = 'DiasM'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
          end
          object TVCadSaldo: TcxGridDBColumn
            DataBinding.FieldName = 'Saldo'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Styles.Content = cxStyle1
            Width = 85
          end
          object TVCadpercSaldo: TcxGridDBColumn
            Caption = '%'
            DataBinding.FieldName = 'percSaldo'
            Width = 25
          end
          object TVCadFree: TcxGridDBColumn
            DataBinding.FieldName = 'Free'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Styles.Content = cxStyle1
            Width = 109
          end
          object TVCadPremium: TcxGridDBColumn
            DataBinding.FieldName = 'Premium'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Styles.Content = cxStyle1
            Width = 82
          end
          object TVCadDefinitivo: TcxGridDBColumn
            DataBinding.FieldName = 'Definitivo'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Styles.Content = cxStyle1
            Width = 85
          end
          object TVCadTotal: TcxGridDBColumn
            DataBinding.FieldName = 'Total'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Styles.Content = cxStyle1
            Width = 93
          end
        end
        object TVAbandono: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.Insert.Visible = False
          NavigatorButtons.Delete.Visible = False
          NavigatorButtons.SaveBookmark.Visible = False
          NavigatorButtons.GotoBookmark.Visible = False
          NavigatorButtons.Filter.Visible = False
          DataController.DataModeController.GridMode = True
          DataController.DataSource = dsAbandono
          DataController.DetailKeyFieldNames = 'UAno;UMes;UDia'
          DataController.KeyFieldNames = 'Codigo'
          DataController.MasterKeyFieldNames = 'Ano;Mes;Dia'
          DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.Navigator = True
          OptionsView.GroupByBox = False
          object TVAbandonoUDias: TcxGridDBColumn
            Caption = 'Dias'
            DataBinding.FieldName = 'UDias'
            Options.Editing = False
            Options.Focusing = False
            Width = 52
          end
          object TVAbandonoEmailConta: TcxGridDBColumn
            Caption = 'E-mail'
            DataBinding.FieldName = 'EmailConta'
            Options.Editing = False
            Options.Focusing = False
            Width = 161
          end
          object TVAbandonoCodigo: TcxGridDBColumn
            DataBinding.FieldName = 'Codigo'
            Options.Editing = False
            Options.Focusing = False
            Width = 65
          end
          object TVAbandonoCadastroEm: TcxGridDBColumn
            Caption = 'Cadastro em'
            DataBinding.FieldName = 'CadastroEm'
            Options.Editing = False
            Options.Focusing = False
          end
          object TVAbandonoLoja: TcxGridDBColumn
            DataBinding.FieldName = 'Loja'
            Options.Editing = False
            Options.Focusing = False
            Width = 142
          end
          object TVAbandonoProprietarios: TcxGridDBColumn
            DataBinding.FieldName = 'Proprietarios'
            Options.Editing = False
            Options.Focusing = False
            Width = 91
          end
          object TVAbandonoCidade: TcxGridDBColumn
            DataBinding.FieldName = 'Cidade'
            Options.Editing = False
            Options.Focusing = False
            Width = 152
          end
          object TVAbandonoUF: TcxGridDBColumn
            DataBinding.FieldName = 'UF'
            Options.Editing = False
            Options.Focusing = False
          end
          object TVAbandonoEndereco: TcxGridDBColumn
            DataBinding.FieldName = 'Endereco'
            Options.Editing = False
            Options.Focusing = False
          end
          object TVAbandonoBairro: TcxGridDBColumn
            DataBinding.FieldName = 'Bairro'
            Options.Editing = False
            Options.Focusing = False
            Width = 125
          end
          object TVAbandonoTelefones: TcxGridDBColumn
            DataBinding.FieldName = 'Telefones'
            Options.Editing = False
            Options.Focusing = False
            Width = 74
          end
          object TVAbandonoMotivoDesist: TcxGridDBColumn
            Caption = 'Motivo abandono'
            DataBinding.FieldName = 'MotivoDesist'
            PropertiesClassName = 'TcxComboBoxProperties'
            Properties.Items.Strings = (
              'Fechou'
              'N'#227'o gostou')
          end
        end
        object glCad: TcxGridLevel
          GridView = TVCad
          Options.DetailTabsPosition = dtpTop
          object glAbandono: TcxGridLevel
            Caption = 'Abandonos'
            GridView = TVAbandono
          end
        end
      end
    end
    object cxTabSheet4: TcxTabSheet
      AlignWithMargins = True
      Caption = 'Valores a receber'
      ImageIndex = 3
      object GridAReceber: TcxGrid
        Left = 0
        Top = 0
        Width = 321
        Height = 518
        Align = alLeft
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
        object TVAReceber: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          OnFocusedRecordChanged = TVAReceberFocusedRecordChanged
          DataController.DataSource = dsAR
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = '0.00'
              Kind = skSum
              Position = spFooter
              Column = cxGridDBColumn9
            end
            item
              Format = ' R$ 0.00'
              Kind = skSum
              Column = cxGridDBColumn9
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ' R$ 0.00'
              Kind = skSum
              Column = cxGridDBColumn9
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Footer = True
          OptionsView.GroupFooters = gfVisibleWhenExpanded
          OptionsView.GroupRowStyle = grsOffice11
          OptionsView.GroupSummaryLayout = gslAlignWithColumns
          object cxGridDBColumn7: TcxGridDBColumn
            DataBinding.FieldName = 'Ano'
            Visible = False
            GroupIndex = 0
          end
          object cxGridDBColumn8: TcxGridDBColumn
            DataBinding.FieldName = 'Mes'
            Visible = False
            GroupIndex = 1
          end
          object VAReceberColumn1: TcxGridDBColumn
            DataBinding.FieldName = 'Dia'
          end
          object cxGridDBColumn9: TcxGridDBColumn
            DataBinding.FieldName = 'Total'
            Width = 130
          end
        end
        object glAReceber: TcxGridLevel
          GridView = TVAReceber
        end
      end
      object GridAR2: TcxGrid
        AlignWithMargins = True
        Left = 324
        Top = 3
        Width = 875
        Height = 512
        Align = alClient
        TabOrder = 1
        LookAndFeel.Kind = lfOffice11
        object TVAR2: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsAR2
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GroupByBox = False
          object TVAR2rLoja: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'r.Loja'
          end
          object TVAR2loja: TcxGridDBColumn
            DataBinding.FieldName = 'loja'
            Width = 172
          end
          object TVAR2Valor: TcxGridDBColumn
            DataBinding.FieldName = 'Valor'
          end
          object TVAR2Vencimento: TcxGridDBColumn
            DataBinding.FieldName = 'Vencimento'
          end
          object TVAR2Pagamento: TcxGridDBColumn
            DataBinding.FieldName = 'Pagamento'
          end
          object TVAR2ValorPago: TcxGridDBColumn
            DataBinding.FieldName = 'ValorPago'
          end
          object TVAR2Obs: TcxGridDBColumn
            DataBinding.FieldName = 'Obs'
          end
          object TVAR2Doc: TcxGridDBColumn
            DataBinding.FieldName = 'Doc'
          end
          object TVAR2Descricao: TcxGridDBColumn
            DataBinding.FieldName = 'Descricao'
          end
          object TVAR2Lancamento: TcxGridDBColumn
            DataBinding.FieldName = 'Lancamento'
          end
          object TVAR2Tipo: TcxGridDBColumn
            DataBinding.FieldName = 'Tipo'
          end
          object TVAR2PC: TcxGridDBColumn
            DataBinding.FieldName = 'PC'
          end
          object TVAR2SituacaoCobr: TcxGridDBColumn
            DataBinding.FieldName = 'SituacaoCobr'
          end
        end
        object GLAR2: TcxGridLevel
          GridView = TVAR2
        end
      end
    end
  end
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 1208
    Height = 43
    Align = alTop
    Bevel.BorderSides = [fsBottom]
    Bevel.Mode = bmEdge
    TabOrder = 1
    object lbCalc: TLabel
      Left = 216
      Top = 13
      Width = 127
      Height = 13
      Caption = 'Calculando. Aguarde ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Left = 7
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Atualizar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Fechar'
      Default = True
      TabOrder = 1
      OnClick = Button2Click
    end
    object cmExp: TButton
      Left = 471
      Top = 8
      Width = 122
      Height = 25
      Caption = 'Exportar Excel'
      TabOrder = 2
      OnClick = cmExpClick
    end
  end
  object nxSession: TnxSession
    ActiveDesigntime = True
    ServerEngine = nxRSE
    Left = 144
    Top = 160
  end
  object nxDB: TnxDatabase
    ActiveDesigntime = True
    Session = nxSession
    AliasName = 'Registro'
    Left = 184
    Top = 152
  end
  object qRec: TnxQuery
    Database = nxDB
    SQL.Strings = (
      'SELECT '
      '  "Mes", "Ano", Sum(ValorPago) as "Total" '
      'FROM'
      
        '  (select Extract(month from pagamento) as "Mes", Extract(year f' +
        'rom pagamento) as "Ano", "ValorPago" FROM "receber") as "Inner"'
      'group by ano, mes')
    Left = 272
    Top = 152
  end
  object DataSource1: TDataSource
    DataSet = qRec
    Left = 304
    Top = 152
  end
  object nxRSE: TnxRemoteServerEngine
    ActiveDesigntime = True
    Transport = nxTCP
    Left = 384
    Top = 152
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ActiveDesigntime = True
    ServerNameRuntime = 'localhost'
    ServerNameDesigntime = 'localhost'
    Port = 16300
    Left = 344
    Top = 152
  end
  object qVen: TnxQuery
    Database = nxDB
    SQL.Strings = (
      'SELECT '
      '  "Ano", "Mes", Sum(Valor) as "Total" '
      'FROM ('
      
        '  select Extract(month from lancamento) as "Mes", Extract(year f' +
        'rom lancamento) as "Ano", "Valor"  FROM "receber") as "Inner"'
      'group by ano, mes')
    Left = 272
    Top = 208
  end
  object dsVen: TDataSource
    DataSet = qVen
    Left = 304
    Top = 208
  end
  object dsCad: TDataSource
    DataSet = mtCad
    Left = 304
    Top = 264
  end
  object qCadAnt: TnxQuery
    Database = nxDB
    SQL.Strings = (
      'SELECT '
      
        '  "Dia", "Mes", "Ano", Count(Codigo) as "Lojas", Sum(LicMaq) as ' +
        '"Maquinas"'
      'FROM ('
      
        '  select Extract(day from CadastroEm) as "Dia", Extract(month fr' +
        'om CadastroEm) as "Mes", Extract(year from CadastroEm) as "Ano",' +
        ' "Codigo", "LicMaq" FROM "cliente") as "Inner"'
      'group by ano, mes, dia')
    Left = 216
    Top = 240
    object qCadAntDia: TIntegerField
      FieldName = 'Dia'
    end
    object qCadAntMes: TIntegerField
      FieldName = 'Mes'
    end
    object qCadAntAno: TIntegerField
      FieldName = 'Ano'
    end
    object qCadAntLojas: TLargeintField
      FieldName = 'Lojas'
    end
    object qCadAntMaquinas: TLargeintField
      FieldName = 'Maquinas'
    end
    object qCadAntDS: TIntegerField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'DS'
      Calculated = True
    end
  end
  object dsAR: TDataSource
    DataSet = qAR
    Left = 448
    Top = 264
  end
  object qAR: TnxQuery
    Database = nxDB
    SQL.Strings = (
      'SELECT '
      '  "Dia", "Mes", "Ano", Sum(Valor) as "Total"'
      'FROM ('
      '  select '
      
        '    Extract(day from vencimento) as "Dia", Extract(month from ve' +
        'ncimento) as "Mes", Extract(year from vencimento) as "Ano", "Val' +
        'or" FROM "receber"'
      '  where '
      '    (pagamento is null) and (Loja>0)'
      ') as "Inner"'
      'group by ano, mes, dia')
    Left = 416
    Top = 264
    object qARDia: TIntegerField
      FieldName = 'Dia'
    end
    object qARMes: TIntegerField
      FieldName = 'Mes'
    end
    object qARAno: TIntegerField
      FieldName = 'Ano'
    end
    object qARTotal: TCurrencyField
      FieldName = 'Total'
    end
  end
  object qAR2: TnxQuery
    Database = nxDB
    SQL.Strings = (
      'select c.loja, r.* from receber r, cliente c'
      
        'where (c.codigo=r.loja) and (pagamento is null) and (r.venciment' +
        'o=:venc)')
    Left = 512
    Top = 160
    ParamData = <
      item
        DataType = ftDate
        Name = 'venc'
        ParamType = ptUnknown
      end>
    object qAR2loja: TStringField
      FieldName = 'loja'
      Size = 50
    end
    object qAR2ID: TIntegerField
      FieldName = 'ID'
    end
    object qAR2rLoja: TIntegerField
      FieldName = 'r.Loja'
    end
    object qAR2Vencimento: TDateField
      FieldName = 'Vencimento'
    end
    object qAR2Pagamento: TDateField
      FieldName = 'Pagamento'
    end
    object qAR2Valor: TCurrencyField
      FieldName = 'Valor'
    end
    object qAR2ValorPago: TCurrencyField
      FieldName = 'ValorPago'
    end
    object qAR2Obs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object qAR2Doc: TStringField
      FieldName = 'Doc'
      Size = 60
    end
    object qAR2Descricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object qAR2Lancamento: TDateTimeField
      FieldName = 'Lancamento'
    end
    object qAR2Tipo: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object qAR2PC: TIntegerField
      FieldName = 'PC'
    end
    object qAR2SituacaoCobr: TWordField
      FieldName = 'SituacaoCobr'
    end
  end
  object dsAR2: TDataSource
    DataSet = qAR2
    Left = 544
    Top = 160
  end
  object Timer1: TTimer
    Interval = 200
    OnTimer = Timer1Timer
    Left = 280
    Top = 272
  end
  object qDes: TnxQuery
    Database = nxDB
    SQL.Strings = (
      
        'SELECT UAno as Ano, UMes as Mes, UDia as Dia, count(Distinct(Cod' +
        'igo)) as Lojas, sum(UDias) as UDias FROM "cliente"'
      
        'where (uobtemlic is not null) and (uobtemlic <= :data) and (ativ' +
        'adoem is not null)'
      'group by UAno, UMes, UDia')
    Left = 32
    Top = 176
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'data'
        ParamType = ptInput
      end>
    object qDesLojas: TLargeintField
      FieldName = 'Lojas'
    end
    object qDesAno: TWordField
      FieldName = 'Ano'
    end
    object qDesMes: TWordField
      FieldName = 'Mes'
    end
    object qDesDia: TWordField
      FieldName = 'Dia'
    end
    object qDesUDias: TLargeintField
      FieldName = 'UDias'
    end
  end
  object dsDES: TDataSource
    DataSet = qDes
    Left = 176
    Top = 216
  end
  object mtCad: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Ano'
        DataType = ftWord
      end
      item
        Name = 'Mes'
        DataType = ftWord
      end
      item
        Name = 'Dia'
        DataType = ftWord
      end
      item
        Name = 'Criacao'
        DataType = ftWord
      end
      item
        Name = 'Ativacao'
        DataType = ftWord
      end
      item
        Name = 'Churn'
        DataType = ftWord
      end
      item
        Name = 'Free'
        DataType = ftWord
      end
      item
        Name = 'Premium'
        DataType = ftWord
      end
      item
        Name = 'Definitivo'
        DataType = ftWord
      end>
    IndexFieldNames = 'Ano;Mes;Dia'
    IndexName = 'mtCadIndex1'
    IndexDefs = <
      item
        Name = 'mtCadIndex1'
        Fields = 'Ano;Mes;Dia'
        Options = [ixCaseInsensitive]
      end>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.02b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    OnCalcFields = mtCadCalcFields
    Left = 80
    Top = 272
    object mtCadAno: TWordField
      FieldName = 'Ano'
    end
    object mtCadMes: TWordField
      FieldName = 'Mes'
    end
    object mtCadDia: TWordField
      FieldName = 'Dia'
    end
    object mtCadCriacao: TWordField
      FieldName = 'Criacao'
    end
    object mtCadAtivacao: TWordField
      FieldName = 'Ativacao'
    end
    object mtCadChurn: TWordField
      FieldName = 'Churn'
    end
    object mtCadFree: TWordField
      FieldName = 'Free'
    end
    object mtCadPremium: TWordField
      FieldName = 'Premium'
    end
    object mtCadDefinitivo: TWordField
      FieldName = 'Definitivo'
    end
    object mtCadTotal: TWordField
      FieldKind = fkCalculated
      FieldName = 'Total'
      Calculated = True
    end
    object mtCadDS: TWordField
      FieldKind = fkCalculated
      FieldName = 'DS'
      Calculated = True
    end
    object mtCadNaoAtivou: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NaoAtivou'
      Calculated = True
    end
    object mtCadpercAtivacao: TFloatField
      FieldKind = fkCalculated
      FieldName = 'percAtivacao'
      Calculated = True
    end
    object mtCadpercNAtivou: TFloatField
      FieldKind = fkCalculated
      FieldName = 'percNAtivou'
      Calculated = True
    end
    object mtCadpercAbandono: TFloatField
      FieldKind = fkCalculated
      FieldName = 'percAbandono'
      Calculated = True
    end
    object mtCadSaldo: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Saldo'
      Calculated = True
    end
    object mtCadpercSaldo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'percSaldo'
      Calculated = True
    end
    object mtCadDias: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Dias'
      Calculated = True
    end
    object mtCadDiasM: TFloatField
      FieldKind = fkCalculated
      FieldName = 'DiasM'
      Calculated = True
    end
  end
  object qCad: TnxQuery
    Database = nxDB
    SQL.Strings = (
      
        'SELECT CAno as Ano, CMes as Mes, CDia as Dia, count(Distinct(Cod' +
        'igo)) as Lojas  FROM "cliente"'
      'where (cadastroem is not null) and (cadastroem <= :data)'
      'group by CAno, CMes, CDia')
    Left = 64
    Top = 176
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'data'
        ParamType = ptInput
      end>
    object qCadLojas: TLargeintField
      FieldName = 'Lojas'
    end
    object qCadAno: TWordField
      FieldName = 'Ano'
    end
    object qCadMes: TWordField
      FieldName = 'Mes'
    end
    object qCadDia: TWordField
      FieldName = 'Dia'
    end
  end
  object qAti: TnxQuery
    Database = nxDB
    SQL.Strings = (
      
        'SELECT AAno as Ano, AMes as Mes, ADia as Dia, count(Distinct(Cod' +
        'igo)) as Lojas  FROM "cliente"'
      'where (ativadoem is not null) and (ativadoem <= :data)'
      'group by AAno, AMes, ADia')
    Left = 32
    Top = 216
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'data'
        ParamType = ptInput
      end>
    object qAtiLojas: TLargeintField
      FieldName = 'Lojas'
    end
    object qAtiAno: TWordField
      FieldName = 'Ano'
    end
    object qAtiMes: TWordField
      FieldName = 'Mes'
    end
    object qAtiDia: TWordField
      FieldName = 'Dia'
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
  object dlgExp: TSaveDialog
    FileName = 'Exportar'
    Filter = 'Excel|*.xls|Html|*.htm|Texto|*.txt'
    FilterIndex = 0
    Left = 88
    Top = 145
  end
  object tAbandono: TnxTable
    ActiveRuntime = True
    Database = nxDB
    TableName = 'cliente'
    IndexFieldNames = 'UAno;UMes;UDia'
    MasterFields = 'Ano;Mes;Dia'
    Left = 280
    Top = 304
    object tAbandonoUDias: TWordField
      FieldName = 'UDias'
    end
    object tAbandonoEmailConta: TStringField
      FieldName = 'EmailConta'
      Size = 200
    end
    object tAbandonoCodigo: TAutoIncField
      FieldName = 'Codigo'
    end
    object tAbandonoCadastroEm: TDateTimeField
      FieldName = 'CadastroEm'
    end
    object tAbandonoLoja: TStringField
      FieldName = 'Loja'
      Size = 50
    end
    object tAbandonoCidade: TStringField
      FieldName = 'Cidade'
      Size = 30
    end
    object tAbandonoUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tAbandonoEndereco: TnxMemoField
      FieldName = 'Endereco'
      BlobType = ftMemo
    end
    object tAbandonoBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object tAbandonoTelefones: TnxMemoField
      FieldName = 'Telefones'
      BlobType = ftMemo
    end
    object tAbandonoProprietarios: TnxMemoField
      FieldName = 'Proprietarios'
      BlobType = ftMemo
    end
    object tAbandonoMotivoDesist: TStringField
      FieldName = 'MotivoDesist'
      Size = 30
    end
    object tAbandonoUAno: TWordField
      FieldName = 'UAno'
    end
    object tAbandonoUMes: TWordField
      FieldName = 'UMes'
    end
    object tAbandonoUDia: TWordField
      FieldName = 'UDia'
    end
  end
  object dsAbandono: TDataSource
    DataSet = tAbandono
    Left = 280
    Top = 336
  end
end
