object FrmEspera: TFrmEspera
  Left = 0
  Top = 0
  Caption = 'Lista de Espera'
  ClientHeight = 252
  ClientWidth = 382
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
    Top = 44
    Width = 382
    Height = 4
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 0
  end
  object LMDSimplePanel2: TLMDSimplePanel
    Left = 0
    Top = 48
    Width = 382
    Height = 204
    Align = alClient
    Bevel.Mode = bmEdge
    TabOrder = 5
    object panTipoCli: TLMDSimplePanel
      Left = 2
      Top = 2
      Width = 378
      Height = 40
      Align = alTop
      Bevel.Mode = bmCustom
      TabOrder = 0
      object rbAvulso: TcxRadioButton
        Left = 8
        Top = 12
        Width = 97
        Height = 17
        Caption = 'Cliente &Avulso'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbAvulsoClick
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = True
      end
      object rbCad: TcxRadioButton
        Left = 111
        Top = 12
        Width = 113
        Height = 17
        Caption = 'Cliente &Cadastrado'
        TabOrder = 1
        OnClick = rbCadClick
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = True
      end
    end
    object Paginas: TcxPageControl
      Left = 2
      Top = 42
      Width = 378
      Height = 60
      ActivePage = tsCad
      Align = alTop
      HideTabs = True
      LookAndFeel.Kind = lfFlat
      Style = 5
      TabOrder = 1
      ClientRectBottom = 60
      ClientRectRight = 378
      ClientRectTop = 0
      object tsAvulso: TcxTabSheet
        Caption = 'tsAvulso'
        ImageIndex = 0
        object cxLabel1: TcxLabel
          Left = 8
          Top = 16
          Caption = 'Cliente'
        end
        object edAvulso: TcxTextEdit
          Left = 51
          Top = 15
          TabOrder = 1
          Text = 'edAvulso'
          Width = 262
        end
      end
      object tsCad: TcxTabSheet
        Caption = 'tsCad'
        ImageIndex = 1
        object cxLabel3: TcxLabel
          Left = 8
          Top = 16
          Caption = 'Cliente'
        end
        object edCad: TcxPopupEdit
          Left = 102
          Top = 14
          Properties.PopupAutoSize = False
          Properties.PopupHeight = 300
          Properties.PopupWidth = 550
          Properties.ReadOnly = True
          Properties.OnCloseUp = edCadPropertiesCloseUp
          Properties.OnInitPopup = edCadPropertiesInitPopup
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 1
          Text = 'edCad'
          OnEnter = edCadEnter
          Width = 262
        end
      end
    end
    object cxLabel2: TcxLabel
      Left = 10
      Top = 103
      Caption = 'Cart'#227'o de Tempo'
    end
    object edCartao: TcxTextEdit
      Left = 103
      Top = 103
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 3
      Text = 'edCartao'
      Width = 147
    end
    object lbObs: TcxLabel
      Left = 10
      Top = 150
      Caption = 'Obs'
    end
    object edObs: TcxTextEdit
      Left = 104
      Top = 149
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 5
      Text = 'edAvulso'
      Width = 262
    end
  end
  object BarMgr: TdxBarManager
    AllowReset = False
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
    SunkenBorder = True
    UseSystemFont = True
    Left = 240
    Top = 56
    DockControlHeights = (
      0
      0
      44
      0)
    object BarMgrBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Controles'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 164
      FloatTop = 132
      FloatClientWidth = 23
      FloatClientHeight = 22
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmGravar'
        end
        item
          Visible = True
          ItemName = 'cmCancelar'
        end>
      MultiLine = True
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Controles'
      OneOnRow = True
      Row = 0
      ShowMark = False
      SizeGrip = False
      UseOwnFont = False
      UseRecentItems = False
      Visible = True
      WholeRow = True
    end
    object BarMgrBar2: TdxBar
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
      FloatLeft = 363
      FloatTop = 333
      FloatClientWidth = 84
      FloatClientHeight = 44
      ItemLinks = <>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'Custom 1'
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = False
      WholeRow = True
    end
    object cmGravar: TdxBarLargeButton
      Caption = '&Salvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      LargeImageIndex = 41
      OnClick = cmGravarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
      SyncImageIndex = False
      ImageIndex = 28
    end
    object cmCancelar: TdxBarLargeButton
      Caption = '&Cancelar'
      Category = 0
      Hint = 'Cancelar'
      Visible = ivAlways
      LargeImageIndex = 49
      OnClick = cmCancelarClick
      AutoGrayScale = False
      GlyphLayout = glLeft
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 256
    Top = 96
  end
end
