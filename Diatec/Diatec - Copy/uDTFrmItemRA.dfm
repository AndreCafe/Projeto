object FrmItemRA: TFrmItemRA
  Left = 353
  Top = 279
  ActiveControl = VG
  BorderStyle = bsDialog
  Caption = 'Despesa'
  ClientHeight = 421
  ClientWidth = 515
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panBotoes: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 515
    Height = 34
    UseDockManager = False
    Align = alTop
    Bevel.BorderSides = [fsBottom]
    Bevel.Mode = bmEdge
    TabOrder = 0
    object btnOk: TBitBtn
      Left = 4
      Top = 4
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      TabOrder = 0
      OnClick = btnOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnCancel: TBitBtn
      Left = 83
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 34
    Width = 515
    Height = 387
    UseDockManager = False
    Align = alClient
    Bevel.BorderWidth = 5
    Bevel.Mode = bmCustom
    TabOrder = 1
    object VG: TcxDBVerticalGrid
      Left = 5
      Top = 5
      Width = 505
      Height = 377
      Align = alClient
      LookAndFeel.NativeStyle = True
      OptionsView.ShowEditButtons = ecsbAlways
      OptionsView.PaintStyle = psDelphi
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.GoToNextCellOnTab = True
      TabOrder = 0
      DataController.DataSource = dsMT
      object VGID: TcxDBEditorRow
        Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
        Properties.EditProperties.Alignment.Vert = taVCenter
        Properties.EditProperties.ReadOnly = True
        Properties.DataBinding.FieldName = 'ID'
      end
      object VGIDRA: TcxDBEditorRow
        Options.TabStop = False
        Properties.Caption = 'RA'
        Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
        Properties.EditProperties.Alignment.Vert = taVCenter
        Properties.EditProperties.ReadOnly = True
        Properties.DataBinding.FieldName = 'IDRA'
      end
      object VGData: TcxDBEditorRow
        Properties.DataBinding.FieldName = 'Data'
      end
      object VGTipo: TcxDBEditorRow
        Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.EditProperties.ImmediatePost = True
        Properties.EditProperties.ImmediateUpdateText = True
        Properties.EditProperties.Items = <
          item
            Description = 'KM'
            Value = 0
          end
          item
            Description = 'Ped'#225'gio'
            Value = 1
          end
          item
            Description = 'Alimenta'#231#227'o'
            Value = 2
          end
          item
            Description = 'Hospedagem'
            Value = 3
          end
          item
            Description = 'Outros'
            Value = 4
          end>
        Properties.EditProperties.OnChange = edTipoChange
        Properties.DataBinding.FieldName = 'Tipo'
      end
      object VGValor: TcxDBEditorRow
        Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DataBinding.FieldName = 'Valor'
      end
      object VGDescr: TcxDBEditorRow
        Height = 97
        Properties.Caption = 'Descri'#231#227'o'
        Properties.EditPropertiesClassName = 'TcxMemoProperties'
        Properties.DataBinding.FieldName = 'Descr'
      end
      object VGValorDef: TcxDBEditorRow
        Options.TabStop = False
        Properties.Caption = 'Valor Padr'#227'o'
        Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.EditProperties.DisplayFormat = 'R$ ,0.00;(R$ ,0.00)'
        Properties.EditProperties.ReadOnly = True
        Properties.DataBinding.FieldName = 'ValorDef'
      end
      object vgFechAprov: TcxCategoryRow
        Properties.Caption = 'Fechamento e Aprova'#231#227'o'
        object VGNumF: TcxDBEditorRow
          Properties.Caption = 'N'#250'mero'
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditProperties.ReadOnly = True
          Properties.DataBinding.FieldName = 'NumF'
        end
        object VGStatusTec: TcxDBEditorRow
          Properties.Caption = 'Status'
          Properties.RepositoryItem = DM.repEditStatusTec
          Properties.DataBinding.FieldName = 'StatusTec'
        end
        object VGValorTec: TcxDBEditorRow
          Properties.Caption = 'Valor Aprov.'
          Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.EditProperties.ReadOnly = True
          Properties.DataBinding.FieldName = 'ValorTec'
        end
        object VGJustDiverg: TcxDBEditorRow
          Height = 95
          Properties.Caption = 'Justificativa'
          Properties.EditPropertiesClassName = 'TcxMemoProperties'
          Properties.EditProperties.ReadOnly = True
          Properties.DataBinding.FieldName = 'JustDiverg'
        end
      end
    end
  end
  object MT: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'Sync'
        DataType = ftBoolean
      end
      item
        Name = 'Tecnico'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Cliente'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'Data'
        DataType = ftDate
      end
      item
        Name = 'ID'
        DataType = ftWord
      end
      item
        Name = 'IDRA'
        DataType = ftWord
      end
      item
        Name = 'Tipo'
        DataType = ftWord
      end
      item
        Name = 'Valor'
        DataType = ftCurrency
      end
      item
        Name = 'JustDiverg'
        DataType = ftMemo
      end
      item
        Name = 'Descr'
        DataType = ftMemo
      end
      item
        Name = 'NumF'
        DataType = ftInteger
      end
      item
        Name = 'ValorDef'
        DataType = ftCurrency
      end
      item
        Name = 'ValorCli'
        DataType = ftCurrency
      end
      item
        Name = 'ValorTec'
        DataType = ftCurrency
      end
      item
        Name = 'StatusTec'
        DataType = ftWord
      end
      item
        Name = 'LogID'
        DataType = ftInteger
      end
      item
        Name = 'StatusCli'
        DataType = ftWord
      end
      item
        Name = 'ONServ'
        DataType = ftBoolean
      end
      item
        Name = 'ExcluirServ'
        DataType = ftBoolean
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
    Left = 104
    Top = 96
    object MTSync: TBooleanField
      FieldName = 'Sync'
    end
    object MTData: TDateField
      FieldName = 'Data'
    end
    object MTValorTec: TCurrencyField
      FieldName = 'ValorTec'
    end
    object MTStatusTec: TWordField
      FieldName = 'StatusTec'
    end
    object MTID: TWordField
      Alignment = taLeftJustify
      FieldName = 'ID'
    end
    object MTIDRA: TWordField
      Alignment = taLeftJustify
      FieldName = 'IDRA'
    end
    object MTTipo: TWordField
      Alignment = taLeftJustify
      FieldName = 'Tipo'
    end
    object MTValor: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'Valor'
    end
    object MTJustDiverg: TMemoField
      FieldName = 'JustDiverg'
      BlobType = ftMemo
    end
    object MTDescr: TMemoField
      FieldName = 'Descr'
      BlobType = ftMemo
    end
    object MTNumF: TIntegerField
      Alignment = taLeftJustify
      FieldName = 'NumF'
    end
    object MTValorDef: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'ValorDef'
    end
    object MTONServ: TBooleanField
      FieldName = 'ONServ'
    end
    object MTExcluirServ: TBooleanField
      FieldName = 'ExcluirServ'
    end
  end
  object dsMT: TDataSource
    DataSet = MT
    Left = 136
    Top = 96
  end
end
