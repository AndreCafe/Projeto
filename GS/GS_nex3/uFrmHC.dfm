object FrmHC: TFrmHC
  Left = 0
  Top = 0
  Caption = 'Hist'#243'rico de Contatos'
  ClientHeight = 357
  ClientWidth = 487
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 42
    Width = 487
    Height = 110
    UseDockManager = False
    Align = alTop
    Bevel.Mode = bmEdge
    TabOrder = 1
    object cxLabel1: TcxLabel
      Left = 13
      Top = 15
      Caption = 'Forma de Contato'
    end
    object cxLabel2: TcxLabel
      Left = 13
      Top = 46
      Caption = 'Por'
    end
    object edMeio: TcxDBComboBox
      Left = 110
      Top = 15
      DataBinding.DataField = 'Meio'
      DataBinding.DataSource = DataSource1
      Properties.Items.Strings = (
        'MSN'
        'Skype'
        'Tel'
        'E-mail'
        'Outros')
      Style.BorderStyle = ebsFlat
      StyleDisabled.BorderStyle = ebsFlat
      StyleHot.BorderStyle = ebsFlat
      TabOrder = 2
      Width = 144
    end
    object edPor: TcxDBComboBox
      Left = 110
      Top = 42
      DataBinding.DataField = 'Por'
      DataBinding.DataSource = DataSource1
      Properties.Items.Strings = (
        'ceci'
        'andre'
        'aj'
        'joao')
      Style.BorderStyle = ebsFlat
      TabOrder = 3
      Width = 144
    end
    object edTipo: TcxDBComboBox
      Left = 110
      Top = 69
      DataBinding.DataField = 'Tipo'
      DataBinding.DataSource = DataSource1
      Properties.Items.Strings = (
        'Suporte'
        'Vendas'
        'Cobran'#231'a'
        'Outros')
      Style.BorderStyle = ebsFlat
      StyleDisabled.BorderStyle = ebsFlat
      StyleHot.BorderStyle = ebsFlat
      TabOrder = 4
      Width = 144
    end
    object cxLabel3: TcxLabel
      Left = 13
      Top = 69
      Caption = 'Tipo de Contato'
    end
  end
  object edTexto: TcxDBRichEdit
    Left = 0
    Top = 152
    Align = alClient
    DataBinding.DataField = 'Texto'
    DataBinding.DataSource = DataSource1
    Properties.ScrollBars = ssBoth
    Style.BorderStyle = ebsFlat
    TabOrder = 5
    Height = 205
    Width = 487
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
  object DataSource1: TDataSource
    Left = 64
    Top = 224
  end
end
