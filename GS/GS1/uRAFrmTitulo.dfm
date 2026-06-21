object FrmTitulo: TFrmTitulo
  Left = 210
  Top = 158
  Width = 556
  Height = 390
  Caption = 'Cadastro de T'#237'tulo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object VG: TcxDBVerticalGrid
    Left = 0
    Top = 42
    Width = 548
    Height = 321
    Styles.StyleSheet = FrmPri.cxVerticalGridStyleSheetDevExpress
    Align = alClient
    OptionsView.RowHeaderWidth = 111
    OptionsView.RecordsInterval = 1
    OptionsBehavior.AlwaysShowEditor = True
    OptionsBehavior.GoToNextCellOnEnter = True
    OptionsBehavior.GoToNextCellOnTab = True
    OptionsBehavior.AllowChangeRecord = False
    OptionsBehavior.FocusFirstCellOnNewRecord = True
    OptionsData.CancelOnExit = False
    OptionsData.Deleting = False
    OptionsData.DeletingConfirmation = False
    TabOrder = 4
    DataController.DataSource = DS
    object VGTipo: TcxDBEditorRow
      Properties.HeaderAlignmentVert = vaCenter
      Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
      Properties.EditProperties.Alignment.Vert = taVCenter
      Properties.EditProperties.ImmediatePost = True
      Properties.EditProperties.ImmediateUpdateText = True
      Properties.EditProperties.Items = <
        item
          Description = 'Receber'
          Value = 'R'
        end
        item
          Description = 'Pagar'
          Value = 'P'
        end>
      Properties.DataBinding.FieldName = 'Tipo'
    end
    object VGContato: TcxDBEditorRow
      Properties.Caption = 'Contato'
      Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
      Properties.EditProperties.GridMode = True
      Properties.EditProperties.ImmediatePost = True
      Properties.EditProperties.ListColumns = <>
      Properties.DataBinding.FieldName = 'NomeContato'
    end
    object VGNomePC: TcxDBEditorRow
      Properties.Caption = 'Plano de Contas'
      Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
      Properties.EditProperties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.EditProperties.ClickKey = 113
      Properties.EditProperties.OnButtonClick = VGNomePCEditPropertiesButtonClick
      Properties.DataBinding.FieldName = 'NomePC'
    end
    object VGValor: TcxDBEditorRow
      Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
      Properties.EditProperties.UseThousandSeparator = True
      Properties.DataBinding.FieldName = 'Valor'
    end
    object VGVencimento: TcxDBEditorRow
      Properties.DataBinding.FieldName = 'Vencimento'
    end
    object VGValorPago: TcxDBEditorRow
      Properties.Caption = 'Valor Pago'
      Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
      Properties.EditProperties.UseThousandSeparator = True
      Properties.DataBinding.FieldName = 'ValorPago'
    end
    object VGPagamento: TcxDBEditorRow
      Properties.DataBinding.FieldName = 'Pagamento'
    end
    object VGDoc: TcxDBEditorRow
      Properties.DataBinding.FieldName = 'Doc'
    end
    object VGDescricao: TcxDBEditorRow
      Properties.Caption = 'Descri'#231#227'o'
      Properties.DataBinding.FieldName = 'Descricao'
    end
    object VGObs: TcxDBEditorRow
      Height = 88
      Properties.EditPropertiesClassName = 'TcxMemoProperties'
      Properties.EditProperties.ReadOnly = False
      Properties.DataBinding.FieldName = 'Obs'
    end
    object VGLancamento: TcxDBEditorRow
      Properties.Caption = 'Lan'#231'amento'
      Properties.DataBinding.FieldName = 'Lancamento'
    end
  end
  object BarMgr: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Custom 1'
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
            Item = cmSalvar
            Visible = True
          end
          item
            Item = cmCancelar
            Visible = True
          end>
        Name = 'Custom 1'
        NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = False
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Images = dmImagens.Imagens
    LargeImages = FrmPri.im32
    PopupMenuLinks = <>
    Style = bmsFlat
    UseSystemFont = True
    Left = 304
    Top = 80
    DockControlHeights = (
      0
      0
      42
      0)
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 39
    end
    object cmFechar: TdxBarLargeButton
      Caption = '&Fechar'
      Category = 0
      Hint = 'Fechar'
      Visible = ivAlways
      AutoGrayScale = False
      LargeImageIndex = 37
    end
    object cmSalvar: TdxBarLargeButton
      Caption = 'S&alvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      OnClick = cmSalvarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      LargeImageIndex = 41
    end
  end
  object MT: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'Loja'
        DataType = ftInteger
      end
      item
        Name = 'Vencimento'
        DataType = ftDate
      end
      item
        Name = 'Pagamento'
        DataType = ftDate
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'ValorPago'
        DataType = ftCurrency
      end
      item
        Name = 'Obs'
        DataType = ftMemo
      end
      item
        Name = 'Doc'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Lancamento'
        DataType = ftDateTime
      end
      item
        Name = 'Tipo'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PC'
        DataType = ftInteger
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    FilterOptions = []
    Version = '4.08b'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 1
    LocaleID = 1024
    Left = 208
    Top = 88
    object MTID: TIntegerField
      FieldName = 'ID'
    end
    object MTLoja: TIntegerField
      FieldName = 'Loja'
    end
    object MTVencimento: TDateField
      FieldName = 'Vencimento'
    end
    object MTPagamento: TDateField
      FieldName = 'Pagamento'
    end
    object MTValor: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Valor'
    end
    object MTValorPago: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'ValorPago'
    end
    object MTObs: TMemoField
      FieldName = 'Obs'
      BlobType = ftMemo
    end
    object MTDoc: TStringField
      FieldName = 'Doc'
      Size = 30
    end
    object MTDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object MTLancamento: TDateTimeField
      FieldName = 'Lancamento'
    end
    object MTTipo: TStringField
      FieldName = 'Tipo'
      Size = 1
    end
    object MTPC: TIntegerField
      FieldName = 'PC'
    end
    object MTNomeLoja: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeLoja'
      LookupDataSet = DM.qCli
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Loja'
      KeyFields = 'Loja'
      Size = 40
      Lookup = True
    end
    object MTNomePC: TStringField
      FieldKind = fkLookup
      FieldName = 'NomePC'
      LookupDataSet = DM.qPC
      LookupKeyFields = 'ID'
      LookupResultField = 'Nome'
      KeyFields = 'PC'
      Size = 40
      Lookup = True
    end
  end
  object DS: TDataSource
    DataSet = MT
    Left = 208
    Top = 120
  end
end
