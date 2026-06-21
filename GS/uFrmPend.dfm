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
    TabOrder = 4
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
        'Ceci'
        'AJ'
        'Andr'#233
        'Jo'#227'o')
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
    ExplicitTop = 169
    ExplicitHeight = 188
    Height = 205
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
  object DataSource1: TDataSource
    Left = 64
    Top = 224
  end
end
