object FrmTar: TFrmTar
  Left = 0
  Top = 0
  Caption = 'Tarefa'
  ClientHeight = 357
  ClientWidth = 487
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 42
    Width = 487
    Height = 132
    UseDockManager = False
    Align = alTop
    Bevel.Mode = bmEdge
    TabOrder = 1
    object cxLabel2: TcxLabel
      Left = 13
      Top = 13
      Caption = 'Lan'#231'ado por'
    end
    object edPor: TcxDBComboBox
      Left = 84
      Top = 11
      DataBinding.DataField = 'Por'
      DataBinding.DataSource = DataSource1
      Properties.Items.Strings = (
        'ceci'
        'andre'
        'aj'
        'joao')
      Style.BorderStyle = ebsFlat
      TabOrder = 1
      Width = 122
    end
    object cxLabel3: TcxLabel
      Left = 13
      Top = 41
      Caption = 'Para'
    end
    object edPara: TcxDBComboBox
      Left = 84
      Top = 39
      DataBinding.DataField = 'Para'
      DataBinding.DataSource = DataSource1
      ParentFont = False
      Properties.Items.Strings = (
        'ceci'
        'andre'
        'aj'
        'joao')
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 3
      Width = 122
    end
    object edLancadoEm: TcxDBDateEdit
      Left = 288
      Top = 11
      DataBinding.DataField = 'DataHora'
      DataBinding.DataSource = DataSource1
      Style.BorderStyle = ebsFlat
      Style.ButtonStyle = btsFlat
      TabOrder = 4
      Width = 144
    end
    object edResolvido: TcxDBDateEdit
      Left = 288
      Top = 68
      DataBinding.DataField = 'ResolvidoEm'
      DataBinding.DataSource = DataSource1
      Style.BorderStyle = ebsFlat
      Style.ButtonStyle = btsFlat
      TabOrder = 5
      Visible = False
      Width = 144
    end
    object cxLabel1: TcxLabel
      Left = 217
      Top = 12
      Caption = 'Lan'#231'ado em'
    end
    object cxLabel4: TcxLabel
      Left = 13
      Top = 70
      Caption = 'Situa'#231#227'o'
    end
    object lbResolvido: TcxLabel
      Left = 217
      Top = 69
      Caption = 'Resolvido em'
      Visible = False
    end
    object edPend: TcxDBImageComboBox
      Left = 84
      Top = 68
      DataBinding.DataField = 'Pendente'
      DataBinding.DataSource = DataSource1
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.Items = <
        item
          Description = 'Pendente'
          ImageIndex = 0
          Value = True
        end
        item
          Description = 'Resolvido'
          Value = False
        end>
      Properties.OnChange = edPendPropertiesChange
      Style.BorderStyle = ebsFlat
      TabOrder = 9
      Width = 122
    end
    object cxLabel5: TcxLabel
      Left = 13
      Top = 97
      Caption = 'Loja'
    end
    object edLoja: TcxDBLookupComboBox
      Left = 84
      Top = 96
      DataBinding.DataField = 'NomeLoja'
      DataBinding.DataSource = DataSource1
      Properties.ClearKey = 46
      Properties.DropDownAutoSize = True
      Properties.GridMode = True
      Properties.ImmediatePost = True
      Properties.IncrementalFiltering = False
      Properties.ListColumns = <>
      Style.BorderStyle = ebsFlat
      TabOrder = 11
      Width = 348
    end
    object cxLabel6: TcxLabel
      Left = 217
      Top = 40
      Caption = 'Realizar Em'
    end
    object edRealizarEm: TcxDBDateEdit
      Left = 288
      Top = 39
      DataBinding.DataField = 'RealizarEm'
      DataBinding.DataSource = DataSource1
      Style.BorderStyle = ebsFlat
      Style.ButtonStyle = btsFlat
      TabOrder = 13
      Width = 144
    end
  end
  object edObs: TcxDBMemo
    Left = 0
    Top = 174
    Align = alClient
    DataBinding.DataField = 'Texto'
    DataBinding.DataSource = DataSource1
    Style.BorderStyle = ebsFlat
    TabOrder = 5
    Height = 183
    Width = 487
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
    Left = 248
    Top = 224
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
  object DataSource1: TDataSource
    Left = 64
    Top = 224
  end
end
