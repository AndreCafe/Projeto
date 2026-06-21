object FrmAprov: TFrmAprov
  Left = 283
  Top = 139
  BorderStyle = bsDialog
  Caption = 'Aprova'#231#227'o de Despesa'
  ClientHeight = 390
  ClientWidth = 501
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panBotoes: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 501
    Height = 34
    Align = alTop
    Bevel.BorderSides = [fsBottom]
    Bevel.Mode = bmEdge
    TabOrder = 0
    object lbDifPadrao: TLMDLabel
      Left = 191
      Top = 2
      Width = 222
      Height = 30
      Bevel.Mode = bmCustom
      Align = alRight
      Alignment = agCenter
      AutoSize = False
      Color = clRed
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      Caption = 'ATEN'#199#195'O, Valor diferente do valor padr'#227'o: '
    end
    object lbValorDef: TLMDLabel
      Left = 413
      Top = 2
      Width = 86
      Height = 30
      Bevel.Mode = bmCustom
      Align = alRight
      Alignment = agCenter
      AutoSize = False
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = []
      ParentColor = False
      ParentFont = False
      ShowAccelChar = False
      Transparent = False
      Caption = 'ValorDef'
    end
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
    Width = 501
    Height = 356
    Align = alClient
    Bevel.BorderInnerWidth = 5
    Bevel.Mode = bmStandard
    TabOrder = 1
    object gbDados: TGroupBox
      Left = 6
      Top = 6
      Width = 489
      Height = 112
      Align = alTop
      Caption = 'Dados do Item '
      Enabled = False
      TabOrder = 0
      object VG: TcxDBVerticalGrid
        Left = 2
        Top = 15
        Width = 485
        Height = 95
        Align = alClient
        LookAndFeel.Kind = lfStandard
        OptionsView.CellTextMaxLineCount = 3
        OptionsView.AutoScaleBands = False
        OptionsView.PaintStyle = psDelphi
        OptionsView.GridLineColor = clBtnShadow
        OptionsView.RowHeaderMinWidth = 30
        OptionsView.RowHeaderWidth = 106
        OptionsView.ValueWidth = 92
        TabOrder = 0
        OnDrawValue = VGDrawValue
        DataController.DataSource = DM.dsRAItem
        object VGTipo1: TcxDBEditorRow
          Expanded = False
          Properties.EditPropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.EditProperties.Alignment.Horz = taLeftJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.DropDownRows = 7
          Properties.EditProperties.Items = <
            item
              Description = 'KM'
              ImageIndex = 0
              Value = '0'
            end
            item
              Description = 'Ped'#225'gio'
              ImageIndex = 1
              Value = '1'
            end
            item
              Description = 'Alimenta'#231#227'o'
              ImageIndex = 2
              Value = '2'
            end
            item
              Description = 'Hospedagem'
              ImageIndex = 3
              Value = '3'
            end
            item
              Description = 'Outros'
              ImageIndex = 4
              Value = '4'
            end>
          Properties.EditProperties.ReadOnly = True
          Properties.DataBinding.FieldName = 'Tipo'
        end
        object VGValor1: TcxDBEditorRow
          Expanded = False
          Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.EditProperties.Alignment.Horz = taLeftJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.AssignedValues.MaxValue = True
          Properties.EditProperties.AssignedValues.MinValue = True
          Properties.EditProperties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Properties.EditProperties.Nullable = False
          Properties.EditProperties.ReadOnly = True
          Properties.DataBinding.FieldName = 'Valor'
        end
        object VGDescr1: TcxDBEditorRow
          Expanded = False
          Height = 53
          Properties.Caption = 'Descri'#231#227'o'
          Properties.EditPropertiesClassName = 'TcxMemoProperties'
          Properties.EditProperties.Alignment = taLeftJustify
          Properties.EditProperties.MaxLength = 0
          Properties.EditProperties.ReadOnly = True
          Properties.EditProperties.ScrollBars = ssBoth
          Properties.DataBinding.FieldName = 'Descr'
        end
        object VGValorDef1: TcxDBEditorRow
          Properties.Caption = 'Vl.Padr'#227'o'
          Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.EditProperties.Alignment.Horz = taLeftJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.AssignedValues.MaxValue = True
          Properties.EditProperties.AssignedValues.MinValue = True
          Properties.EditProperties.DisplayFormat = 'R$ ,0.00;-R$ ,0.00'
          Properties.EditProperties.Nullable = False
          Properties.EditProperties.ReadOnly = False
          Properties.DataBinding.FieldName = 'ValorDef'
          Visible = False
        end
      end
    end
    object gbTec: TGroupBox
      Left = 6
      Top = 224
      Width = 489
      Height = 122
      Align = alTop
      Caption = 'Aprova'#231#227'o p/ T'#233'cnico'
      TabOrder = 1
      object lbValorTec: TLabel
        Left = 8
        Top = 46
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object lbMotivo: TLMDLabel
        Left = 146
        Top = 44
        Width = 34
        Height = 15
        Bevel.Mode = bmCustom
        Options = []
        Caption = 'Motivo'
      end
      object LMDSimplePanel2: TLMDSimplePanel
        Left = 2
        Top = 15
        Width = 485
        Height = 22
        Align = alTop
        Bevel.Mode = bmCustom
        TabOrder = 0
        object bt3: TLMDSpeedButton
          Tag = 3
          Left = 291
          Top = 0
          Width = 97
          Height = 22
          Caption = 'Reprovado'
          OnClick = bt0Click
          Align = alLeft
          ButtonStyle = ubsFlat
        end
        object bt2: TLMDSpeedButton
          Tag = 2
          Left = 194
          Top = 0
          Width = 97
          Height = 22
          Caption = 'Aprov.Diverg.'
          ParentFont = False
          OnClick = bt0Click
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Align = alLeft
          ButtonStyle = ubsFlat
        end
        object bt1: TLMDSpeedButton
          Tag = 1
          Left = 97
          Top = 0
          Width = 97
          Height = 22
          Caption = 'Aprov.Integral'
          ParentFont = False
          OnClick = bt0Click
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Align = alLeft
          ButtonStyle = ubsFlat
        end
        object bt0: TLMDSpeedButton
          Left = 0
          Top = 0
          Width = 97
          Height = 22
          Caption = 'Pendente'
          OnClick = bt0Click
          Align = alLeft
          ButtonStyle = ubsFlat
        end
      end
      object edValorTec: TcxDBCurrencyEdit
        Left = 44
        Top = 44
        DataBinding.DataField = 'ValorTec'
        DataBinding.DataSource = dsMT
        Enabled = False
        Properties.ReadOnly = False
        Style.BorderStyle = ebs3D
        TabOrder = 1
        Width = 82
      end
      object edMotivo: TcxDBMemo
        Left = 184
        Top = 43
        DataBinding.DataField = 'JustDiverg'
        DataBinding.DataSource = dsMT
        Enabled = False
        Style.BorderStyle = ebs3D
        TabOrder = 2
        Height = 72
        Width = 297
      end
    end
    object gbCli: TGroupBox
      Left = 6
      Top = 126
      Width = 489
      Height = 90
      Align = alTop
      Caption = 'Aprova'#231#227'o p/ Cliente'
      TabOrder = 2
      object lbValorCli: TLabel
        Left = 9
        Top = 53
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object LMDSimplePanel3: TLMDSimplePanel
        Left = 2
        Top = 15
        Width = 485
        Height = 22
        Align = alTop
        Bevel.Mode = bmCustom
        TabOrder = 0
        object bc4: TLMDSpeedButton
          Tag = 4
          Left = 291
          Top = 0
          Width = 97
          Height = 22
          Caption = 'N'#227'o Cobrar'
          ParentFont = False
          OnClick = bc1Click
          Font.Charset = ANSI_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Align = alLeft
          ButtonStyle = ubsFlat
        end
        object bc3: TLMDSpeedButton
          Tag = 3
          Left = 194
          Top = 0
          Width = 97
          Height = 22
          Caption = 'Aprov.Diverg.'
          ParentFont = False
          OnClick = bc1Click
          Font.Charset = ANSI_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Align = alLeft
          ButtonStyle = ubsFlat
        end
        object bc2: TLMDSpeedButton
          Tag = 2
          Left = 97
          Top = 0
          Width = 97
          Height = 22
          Caption = 'Aprov.Integral'
          ParentFont = False
          OnClick = bc1Click
          Font.Charset = ANSI_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Align = alLeft
          ButtonStyle = ubsFlat
        end
        object bc1: TLMDSpeedButton
          Tag = 1
          Left = 0
          Top = 0
          Width = 97
          Height = 22
          Caption = 'Pendente'
          ParentFont = False
          OnClick = bc1Click
          Font.Charset = ANSI_CHARSET
          Font.Color = clBtnText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Align = alLeft
          ButtonStyle = ubsFlat
        end
        object bc0: TLMDSpeedButton
          Left = 388
          Top = 0
          Width = 97
          Height = 22
          Caption = 'Cliente N'#227'o Paga'
          Visible = False
          OnClick = bc1Click
          Align = alLeft
          ButtonStyle = ubsFlat
        end
      end
      object edValorCli: TcxDBCurrencyEdit
        Left = 48
        Top = 49
        DataBinding.DataField = 'ValorCli'
        DataBinding.DataSource = dsMT
        Enabled = False
        Properties.ReadOnly = False
        Style.BorderStyle = ebs3D
        TabOrder = 1
        Width = 81
      end
    end
    object LMDSimplePanel4: TLMDSimplePanel
      Left = 6
      Top = 118
      Width = 489
      Height = 8
      Align = alTop
      Bevel.Mode = bmCustom
      TabOrder = 3
    end
    object LMDSimplePanel5: TLMDSimplePanel
      Left = 6
      Top = 216
      Width = 489
      Height = 8
      Align = alTop
      Bevel.Mode = bmCustom
      TabOrder = 4
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
        Name = 'DataI'
        DataType = ftDate
      end
      item
        Name = 'DataF'
        DataType = ftDate
      end
      item
        Name = 'Item'
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
    Left = 198
    Top = 96
    object MTSync: TBooleanField
      FieldName = 'Sync'
    end
    object MTTecnico: TStringField
      FieldName = 'Tecnico'
      Size = 6
    end
    object MTCliente: TStringField
      FieldName = 'Cliente'
      Size = 8
    end
    object MTDataI: TDateField
      FieldName = 'DataI'
    end
    object MTDataF: TDateField
      FieldName = 'DataF'
    end
    object MTItem: TWordField
      FieldName = 'Item'
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
      FieldName = 'NumF'
    end
    object MTValorDef: TCurrencyField
      Alignment = taLeftJustify
      FieldName = 'ValorDef'
    end
    object MTValorCli: TCurrencyField
      FieldName = 'ValorCli'
    end
    object MTValorTec: TCurrencyField
      FieldName = 'ValorTec'
    end
    object MTStatusTec: TWordField
      FieldName = 'StatusTec'
    end
    object MTLogID: TIntegerField
      FieldName = 'LogID'
    end
    object MTStatusCli: TWordField
      FieldName = 'StatusCli'
    end
  end
  object dsMT: TDataSource
    DataSet = MT
    Left = 230
    Top = 96
  end
end
