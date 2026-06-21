object Form13: TForm13
  Left = 0
  Top = 0
  Caption = 'Estat'#237'sticas de Cadastro Nextar'
  ClientHeight = 591
  ClientWidth = 1075
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
    Width = 1075
    Height = 548
    Align = alClient
    TabOrder = 0
    Visible = False
    Properties.ActivePage = cxTabSheet3
    ClientRectBottom = 546
    ClientRectLeft = 2
    ClientRectRight = 1073
    ClientRectTop = 22
    object cxTabSheet3: TcxTabSheet
      Caption = 'Cadastros'
      ImageIndex = 2
      object gridCad: TcxGrid
        Left = 0
        Top = 0
        Width = 1071
        Height = 524
        Align = alClient
        TabOrder = 0
        object TVCad: TcxGridDBTableView
          Navigator.Buttons.Insert.Enabled = False
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Append.Enabled = False
          Navigator.Buttons.Delete.Enabled = False
          Navigator.Buttons.Delete.Visible = False
          Navigator.Buttons.Edit.Visible = True
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
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
            end
            item
              Format = '0'
              Kind = skSum
              Column = TVBounce
            end
            item
              Format = '0.0%'
              Kind = skAverage
              Column = TVBRate
            end
            item
              Format = '0.0%'
              Kind = skAverage
              Column = TVCadpercAbandono
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
            Width = 73
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
          object TVCadpercAbandono: TcxGridDBColumn
            Caption = '%'
            DataBinding.FieldName = 'percAbandono'
            Width = 31
          end
          object TVBounce: TcxGridDBColumn
            DataBinding.FieldName = 'Bounce'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 58
          end
          object TVBRate: TcxGridDBColumn
            Caption = 'B-Rate'
            DataBinding.FieldName = 'BounceRate'
            PropertiesClassName = 'TcxMaskEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 56
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
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Delete.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.Visible = True
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
          object TVVersao: TcxGridDBColumn
            Caption = 'Vers'#227'o'
            DataBinding.FieldName = 'UVersao'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
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
  end
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 1075
    Height = 43
    Align = alTop
    Bevel.BorderSides = [fsBottom]
    Bevel.Mode = bmEdge
    TabOrder = 1
    object lbCalc: TLabel
      Left = 858
      Top = 16
      Width = 169
      Height = 13
      Alignment = taCenter
      Caption = 'Preparando dados. Aguarde ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 298
      Top = 16
      Width = 139
      Height = 13
      Caption = 'Considerar inativo depois de '
    end
    object Label2: TLabel
      Left = 492
      Top = 16
      Width = 19
      Height = 13
      Caption = 'dias'
    end
    object Label6: TLabel
      Left = 779
      Top = 16
      Width = 19
      Height = 13
      Caption = 'dias'
    end
    object Label7: TLabel
      Left = 539
      Top = 16
      Width = 165
      Height = 13
      Caption = 'Considerar PREMIUM vencidos at'#233
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'Atualizar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 86
      Top = 5
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'Fechar'
      Default = True
      TabOrder = 1
      OnClick = Button2Click
    end
    object cmExp: TButton
      AlignWithMargins = True
      Left = 167
      Top = 5
      Width = 122
      Height = 33
      Align = alLeft
      Caption = 'Exportar'
      TabOrder = 2
      OnClick = cmExpClick
    end
    object edDias: TcxSpinEdit
      Left = 437
      Top = 11
      ParentFont = False
      Properties.ImmediatePost = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 3
      Value = 5
      Width = 49
    end
    object edDiasP: TcxSpinEdit
      Left = 709
      Top = 11
      ParentFont = False
      Properties.ImmediatePost = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 4
      Value = 10
      Width = 63
    end
  end
  object nxSession: TnxSession
    ServerEngine = nxRSE
    Left = 144
    Top = 160
  end
  object nxDB: TnxDatabase
    Session = nxSession
    AliasName = 'Registro'
    Left = 184
    Top = 152
  end
  object nxRSE: TnxRemoteServerEngine
    Transport = nxTCP
    Left = 384
    Top = 152
  end
  object nxTCP: TnxWinsockTransport
    DisplayCategory = 'Transports'
    ServerNameRuntime = '127.0.0.1'
    ServerNameDesigntime = '127.0.0.1'
    Port = 16300
    Left = 344
    Top = 152
  end
  object dsCad: TDataSource
    DataSet = mtCad
    Left = 96
    Top = 264
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
      
        'where (uobtemlic is not null) and (uobtemlic < :data) and (ativa' +
        'doem is not null)'
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
  object mtCad: TkbmMemTable
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
    Left = 64
    Top = 208
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
    object mtCadBounce: TWordField
      FieldName = 'Bounce'
    end
    object mtCadBounceRate: TFloatField
      FieldKind = fkCalculated
      FieldName = 'BounceRate'
      Calculated = True
    end
  end
  object qCad: TnxQuery
    Database = nxDB
    SQL.Strings = (
      
        'SELECT CAno as Ano, CMes as Mes, CDia as Dia, count(Distinct(Cod' +
        'igo)) as Lojas  FROM "cliente"'
      'where (cadastroem is not null) and (cadastroem < :data)'
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
      'where (ativadoem is not null) and (ativadoem < :data)'
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
    Filter = 'Ativado = True'
    TableName = 'cliente'
    IndexFieldNames = 'UAno;UMes;UDia'
    MasterFields = 'Ano;Mes;Dia'
    Left = 48
    Top = 248
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
      Size = 50
    end
    object tAbandonoUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object tAbandonoBairro: TStringField
      FieldName = 'Bairro'
      Size = 50
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
    object tAbandonoAtivado: TBooleanField
      FieldName = 'Ativado'
    end
    object tAbandonoUVersao: TStringField
      FieldName = 'UVersao'
      Size = 10
    end
  end
  object dsAbandono: TDataSource
    DataSet = tAbandono
    Left = 48
    Top = 280
  end
  object qBou: TnxQuery
    Database = nxDB
    SQL.Strings = (
      
        'SELECT UAno as Ano, UMes as Mes, UDia as Dia, count(Distinct(Cod' +
        'igo)) as Lojas FROM "cliente"'
      
        'where (uobtemlic is not null) and (uobtemlic < :data) and (ativa' +
        'doem is not null) and (udias < 2)'
      'group by UAno, UMes, UDia')
    Left = 32
    Top = 328
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'data'
        ParamType = ptInput
      end>
    object qBouAno: TWordField
      FieldName = 'Ano'
    end
    object qBouMes: TWordField
      FieldName = 'Mes'
    end
    object qBouDia: TWordField
      FieldName = 'Dia'
    end
    object qBouLojas: TLargeintField
      FieldName = 'Lojas'
    end
  end
end
