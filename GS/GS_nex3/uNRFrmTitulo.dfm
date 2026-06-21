object FrmTitulo: TFrmTitulo
  Left = 210
  Top = 158
  Caption = 'Cadastro de T'#237'tulo'
  ClientHeight = 296
  ClientWidth = 439
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
    Width = 439
    Height = 254
    Align = alClient
    OptionsView.PaintStyle = psDelphi
    OptionsView.RowHeaderWidth = 120
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
      Visible = False
    end
    object VGContato: TcxDBEditorRow
      Properties.Caption = 'Contato'
      Properties.EditPropertiesClassName = 'TcxLookupComboBoxProperties'
      Properties.EditProperties.GridMode = True
      Properties.EditProperties.ImmediatePost = True
      Properties.EditProperties.KeyFieldNames = 'Codigo'
      Properties.EditProperties.ListColumns = <
        item
          FieldName = 'Loja'
        end>
      Properties.EditProperties.ReadOnly = True
      Properties.DataBinding.FieldName = 'NomeLoja'
      Visible = False
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
      Visible = False
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
    object VGSituacaoCobr: TcxDBEditorRow
      Properties.Caption = 'Situa'#231#227'o Cobran'#231'a'
      Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
      Properties.EditProperties.ImmediatePost = True
      Properties.EditProperties.ImmediateUpdateText = True
      Properties.EditProperties.Items = <
        item
          Description = 'N'#227'o cobrou ainda'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Tentando contato'
          Value = 1
        end
        item
          Description = 'Aguardando Retorno'
          Value = 2
        end
        item
          Description = 'Negocia'#231#227'o em Andamento'
          Value = 3
        end
        item
          Description = 'Renegociado. Aguarda Pagto'
          Value = 4
        end
        item
          Description = 'Pago com Atraso'
          Value = 5
        end
        item
          Description = 'Caso perdido'
          Value = 6
        end>
      Properties.DataBinding.FieldName = 'SituacaoCobr'
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
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dmImagens.Imagens
    ImageOptions.LargeImages = FrmPri.im32
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
    object BarMgrBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Custom 1'
      CaptionButtons = <>
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
          Visible = True
          ItemName = 'cmSalvar'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Custom 1'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      LargeImageIndex = 39
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
    object cmFechar: TdxBarLargeButton
      Caption = '&Fechar'
      Category = 0
      Hint = 'Fechar'
      Visible = ivAlways
      LargeImageIndex = 37
      AutoGrayScale = False
    end
    object cmSalvar: TdxBarLargeButton
      Caption = 'S&alvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      LargeImageIndex = 41
      OnClick = cmSalvarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
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
    LoadedCompletely = False
    SavedCompletely = False
    FilterOptions = []
    Version = '5.02b'
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
      Size = 60
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
      LookupDataSet = DM.tCli
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Loja'
      KeyFields = 'Loja'
      Size = 40
      Lookup = True
    end
    object MTSituacaoCobr: TWordField
      Alignment = taLeftJustify
      FieldName = 'SituacaoCobr'
    end
  end
  object DS: TDataSource
    DataSet = MT
    Left = 208
    Top = 120
  end
end
