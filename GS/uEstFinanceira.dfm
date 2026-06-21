object Form13: TForm13
  Left = 0
  Top = 0
  Caption = 'Estat'#237'sticas Financeiras  Nextar'
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
    ActivePage = cxTabSheet1
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
end
