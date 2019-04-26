inherited FrmPopupPrecoAuto: TFrmPopupPrecoAuto
  Caption = 'FrmPopupPrecoAuto'
  ClientWidth = 303
  ExplicitWidth = 311
  PixelsPerInch = 96
  TextHeight = 13
  inherited panPri: TParentedPanel
    Width = 303
    Margins.Top = 0
    BorderWidth = 0
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    ExplicitWidth = 303
    inherited pageControlEditar: TcxPageControl
      Width = 293
      ExplicitWidth = 293
      ClientRectRight = 293
      inherited tsGrid: TcxTabSheet
        Margins.Top = 0
        ExplicitWidth = 293
        ExplicitHeight = 340
        inherited Grid: TcxGrid
          Top = 41
          Width = 293
          Height = 299
          ExplicitLeft = 48
          ExplicitTop = 96
          ExplicitWidth = 293
          ExplicitHeight = 244
        end
        object LMDSimplePanel1: TLMDSimplePanel
          Left = 0
          Top = 0
          Width = 293
          Height = 41
          Align = alTop
          Bevel.Mode = bmCustom
          Bevel.StandardStyle = lsNone
          Color = clWhite
          TabOrder = 1
          object edPodeAlterarPreco: TcxDBCheckBox
            Left = -2
            Top = -2
            Caption = 'Pode alterar pre'#231'o na hora da venda'
            DataBinding.DataField = 'PodeAlterarPreco'
            DataBinding.DataSource = dsPrincipal
            Properties.Alignment = taLeftJustify
            Properties.ImmediatePost = True
            Properties.MultiLine = True
            Properties.NullStyle = nssUnchecked
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebsFlat
            Style.HotTrack = False
            Style.StyleController = FrmPri.cxEditStyleController1
            TabOrder = 0
            Transparent = True
            Width = 291
          end
          object cxLabel1: TcxLabel
            Left = 0
            Top = 20
            Caption = 'Forma de c'#225'lculo do pre'#231'o de venda:'
            ParentColor = False
            ParentFont = False
            Style.BorderStyle = ebsNone
            Style.Color = clWhite
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.TextStyle = [fsBold]
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taLeftJustify
          end
        end
      end
      inherited tsEdit: TcxTabSheet
        ExplicitWidth = 293
        inherited panEdit: TLMDSimplePanel
          Width = 293
          Height = 81
          ExplicitWidth = 293
          ExplicitHeight = 81
          DesignSize = (
            293
            81)
          object panEdMargem: TLMDSimplePanel [0]
            AlignWithMargins = True
            Left = 0
            Top = 30
            Width = 293
            Height = 24
            Margins.Left = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Bevel.Mode = bmCustom
            Bevel.StandardStyle = lsNone
            Color = clWhite
            TabOrder = 2
            object cxLabel2: TcxLabel
              Left = 0
              Top = 0
              Align = alLeft
              Caption = 'Margem de lucro'
            end
            object edMargem: TcxCurrencyEdit
              AlignWithMargins = True
              Left = 104
              Top = 0
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alLeft
              Properties.AssignedValues.EditFormat = True
              Properties.DisplayFormat = '##0.00%'
              TabOrder = 1
              ExplicitLeft = 136
              ExplicitTop = 8
              ExplicitHeight = 21
              Width = 121
            end
          end
          inherited buCancel: TcxButton [1]
            Top = 40
            ExplicitTop = 40
          end
          inherited butOk: TcxButton [2]
            Left = 3
            Top = 40
            ExplicitLeft = 3
            ExplicitTop = 40
          end
          object panEdPreco: TLMDSimplePanel
            AlignWithMargins = True
            Left = 0
            Top = 3
            Width = 293
            Height = 24
            Margins.Left = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Bevel.Mode = bmCustom
            Bevel.StandardStyle = lsNone
            Color = clWhite
            TabOrder = 3
            object cxLabel3: TcxLabel
              Left = 0
              Top = 0
              Align = alLeft
              Caption = 'Pre'#231'o de venda'
            end
            object edPreco: TcxCurrencyEdit
              AlignWithMargins = True
              Left = 95
              Top = 0
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alLeft
              Properties.AssignedValues.EditFormat = True
              Properties.DisplayFormat = ',0.00'
              TabOrder = 1
              ExplicitLeft = 104
              ExplicitHeight = 21
              Width = 121
            end
          end
        end
      end
    end
    inherited dxBarDockControl1: TdxBarDockControl
      Width = 293
      ExplicitWidth = 293
    end
  end
  inherited BarMgr: TdxBarManager
    DockControlHeights = (
      0
      0
      0
      0)
    inherited cmNovo: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmEditar: TdxBarLargeButton
      ImageIndex = 20
    end
    inherited cmApagar: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited cmImprimir: TdxBarLargeButton
      ImageIndex = 22
    end
    inherited cmLayout: TdxBarLargeButton
      ImageIndex = -1
    end
    inherited cmPeriodo: TdxBarLargeButton
      ImageIndex = -1
    end
  end
  object tabValores: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
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
    Left = 80
    Top = 280
    object tabValoresDescricao: TStringField
      DisplayWidth = 100
      FieldName = 'Descricao'
      Size = 100
    end
    object tabValoresvalor: TBooleanField
      FieldName = 'valor'
    end
  end
  object dsPrincipal: TDataSource
    Left = 120
    Top = 320
  end
  object tabResult: TkbmMemTable
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <>
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
    Left = 184
    Top = 232
    object tabResultValor: TCurrencyField
      FieldName = 'Valor'
      DisplayFormat = '"R$ "#####0.00'
    end
  end
  object dsResult: TDataSource
    DataSet = tabResult
    Left = 224
    Top = 232
  end
end
