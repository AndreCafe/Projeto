object FrmPri: TFrmPri
  Left = 290
  Top = 271
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'NEX Admin'
  ClientHeight = 562
  ClientWidth = 1105
  Color = 16118503
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object pgMaq: TcxPageControl
    Left = 0
    Top = 0
    Width = 1105
    Height = 562
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    Color = clWindowFrame
    Font.Charset = ANSI_CHARSET
    Font.Color = 7895160
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    Properties.ActivePage = tsNexAdmin
    Properties.CustomButtons.Buttons = <>
    Properties.HideTabs = True
    Properties.HotTrack = True
    Properties.Options = [pcoAlwaysShowGoDialogButton, pcoCloseButton, pcoFixedTabWidthWhenRotated, pcoGoDialog, pcoGradient, pcoGradientClientArea, pcoRedrawOnResize]
    Properties.Style = 9
    Properties.TabSlants.Positions = [spLeft, spRight]
    Properties.TabWidth = 175
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    TabSlants.Positions = [spLeft, spRight]
    OnCanClose = pgMaqCanClose
    ClientRectBottom = 562
    ClientRectRight = 1105
    ClientRectTop = 0
    object tsNexAdmin: TcxTabSheet
      Caption = 'Gerenciador'
      Color = clBtnFace
      ImageIndex = 0
      ParentColor = False
      DesignSize = (
        1105
        562)
      object dsPri: TdxDockSite
        Left = 90
        Top = 22
        Width = 1015
        Height = 540
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Color = clBtnFace
        ManagerColor = False
        Align = alClient
        DockingType = 5
        OriginalWidth = 1015
        OriginalHeight = 540
        object dxLayoutDockSite1: TdxLayoutDockSite
          Left = 109
          Top = 0
          Width = 882
          Height = 540
          Color = clBtnFace
          ManagerColor = False
          ParentShowHint = False
          ShowHint = False
          DockingType = 0
          OriginalWidth = 300
          OriginalHeight = 200
          object dxLayoutDockSite4: TdxLayoutDockSite
            Left = 0
            Top = 0
            Width = 882
            Height = 540
            DockingType = 0
            OriginalWidth = 300
            OriginalHeight = 200
            object dxLayoutDockSite3: TdxLayoutDockSite
              Left = 0
              Top = 0
              Width = 558
              Height = 540
              DockingType = 0
              OriginalWidth = 300
              OriginalHeight = 200
              object dxLayoutDockSite2: TdxLayoutDockSite
                Left = 0
                Top = 0
                Width = 558
                Height = 540
                DockingType = 0
                OriginalWidth = 300
                OriginalHeight = 200
              end
              object dpPaginas: TdxDockPanel
                Left = 0
                Top = 0
                Width = 558
                Height = 540
                Color = clBtnFace
                ManagerColor = False
                AllowDock = [dtClient]
                AllowDockClients = []
                AllowFloating = False
                AutoHide = False
                Caption = 'P'#225'ginas'
                CaptionButtons = []
                ShowCaption = False
                DockingType = 0
                OriginalWidth = 185
                OriginalHeight = 140
                object btnChat: TLMDSpeedButton
                  Left = 78
                  Top = 362
                  Width = 60
                  Height = 24
                  Caption = 'CHAT'
                  Color = clYellow
                  ParentFont = False
                  AutoSize = False
                  ButtonLayout.Spacing = 0
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ButtonStyle = ubsFlat
                end
                object Paginas: TcxPageControl
                  Left = 0
                  Top = 0
                  Width = 554
                  Height = 536
                  Align = alClient
                  Color = clBtnFace
                  ParentBackground = False
                  ParentColor = False
                  TabOrder = 0
                  Properties.CustomButtons.Buttons = <>
                  Properties.HideTabs = True
                  Properties.HotTrack = True
                  Properties.Style = 5
                  LookAndFeel.Kind = lfStandard
                  LookAndFeel.NativeStyle = False
                  ClientRectBottom = 536
                  ClientRectRight = 554
                  ClientRectTop = 0
                end
                object panPremium: TLMDSimplePanel
                  Left = 26
                  Top = 362
                  Width = 263
                  Height = 27
                  Bevel.Mode = bmCustom
                  ParentColor = True
                  TabOrder = 1
                  Visible = False
                  object LMDSimplePanel1: TLMDSimplePanel
                    AlignWithMargins = True
                    Left = 30
                    Top = 0
                    Width = 233
                    Height = 27
                    Margins.Left = 30
                    Margins.Top = 0
                    Margins.Right = 0
                    Margins.Bottom = 0
                    Align = alClient
                    Bevel.Mode = bmCustom
                    ParentColor = True
                    TabOrder = 0
                    object btnAss: TLMDSpeedButton
                      Left = 0
                      Top = 0
                      Width = 233
                      Height = 27
                      Cursor = crHandPoint
                      Margins.Left = 30
                      Margins.Top = 1
                      Margins.Right = 1
                      Margins.Bottom = 1
                      Caption = '...'
                      Color = clSilver
                      ParentFont = False
                      AutoSize = False
                      OnClick = cmComprarAssClick
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clBlack
                      Font.Height = -12
                      Font.Name = 'Segoe UI'
                      Font.Style = []
                      Align = alClient
                      ButtonStyle = ubsDelphiFlat
                      ExplicitWidth = 320
                    end
                  end
                end
              end
            end
            object dpAtalhosDir2: TdxDockPanel
              Left = 558
              Top = 0
              Width = 324
              Height = 540
              Color = clBtnFace
              ManagerColor = False
              Visible = False
              OnVisibleChanged = dpAtalhosDir2VisibleChanged
              AllowFloating = False
              AutoHide = False
              Caption = 'Atalhos'
              CaptionButtons = [cbMaximize, cbHide]
              OnResize = dpAtalhosDir2Resize
              OnRestoreDockPosition = dpAtalhosDir2RestoreDockPosition
              DockingType = 3
              OriginalWidth = 324
              OriginalHeight = 140
            end
          end
          object dpRevisarProduto: TdxDockPanel
            Left = 0
            Top = 0
            Width = 252
            Height = 140
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ManagerFont = False
            Visible = False
            AllowFloating = True
            AutoHide = True
            Caption = 'Revisar produtos'
            CaptionButtons = [cbMaximize, cbHide]
            AutoHidePosition = 2
            DockingType = 3
            OriginalWidth = 252
            OriginalHeight = 140
          end
        end
        object dpAtalhos: TdxDockPanel
          Left = 0
          Top = 0
          Width = 109
          Height = 540
          Margins.Left = 1
          Color = clBtnFace
          ManagerColor = False
          Visible = False
          AllowDock = [dtLeft]
          AllowDockClients = []
          AllowFloating = False
          AutoHide = False
          Caption = 'Exibir'
          CaptionButtons = [cbHide]
          ImageIndex = 27
          ShowCaption = False
          DockingType = 1
          OriginalWidth = 101
          OriginalHeight = 140
        end
      end
      object dxBarDockControl1: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 1105
        Height = 22
        Margins.Left = 0
        Margins.Top = 4
        Margins.Right = 0
        Margins.Bottom = 2
        Align = dalTop
        BarManager = BarMgr
        Color = 16118503
        ParentColor = False
        SunkenBorder = False
        UseOwnColor = True
        UseOwnSunkenBorder = True
      end
      object dxBarDockControl2: TdxBarDockControl
        AlignWithMargins = True
        Left = 5
        Top = 24
        Width = 80
        Height = 538
        Margins.Left = 5
        Margins.Top = 2
        Margins.Right = 5
        Margins.Bottom = 0
        Align = dalLeft
        BarManager = BarMgr
        Color = clBtnFace
        ParentColor = False
        SunkenBorder = False
        UseOwnColor = True
        UseOwnSunkenBorder = True
      end
    end
    object cxTabSheet1: TcxTabSheet
      Caption = 'Maq 15 - Acesso Remoto'
      Color = 12895428
      Font.Charset = ANSI_CHARSET
      Font.Color = 8289918
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ImageIndex = 1
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 1028
      ExplicitHeight = 559
    end
  end
  object BarMgr: TdxBarManager
    AllowCallFromAnotherForm = True
    AutoAlignBars = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default'
      'Caixa')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    ImageOptions.Images = dmImagens.im16
    ImageOptions.LargeImages = dmImagens.im32
    ImageOptions.StretchGlyphs = False
    ImageOptions.UseLargeImagesForLargeIcons = True
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = ''
    MenusShowRecentItemsFirst = False
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    ShowFullMenusAfterDelay = False
    UseBarHintWindow = False
    UseSystemFont = False
    Left = 272
    Top = 120
    DockControlHeights = (
      0
      0
      0
      0)
    object BarMgrBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'MenuPri'
      CaptionButtons = <>
      Color = clBtnFace
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 276
      FloatTop = 213
      FloatClientWidth = 23
      FloatClientHeight = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarSubItem4'
        end
        item
          Visible = True
          ItemName = 'cmSubExibir'
        end
        item
          Visible = True
          ItemName = 'cmAlterarSenha'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem2'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton5'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmComprarAss'
        end
        item
          Visible = True
          ItemName = 'cmVerCod'
        end>
      MultiLine = True
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OldName = 'MenuPri'
      OneOnRow = True
      Row = 0
      UseOwnFont = True
      UseRestSpace = True
      Visible = True
      WholeRow = True
    end
    object BarMgrBar2: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'BarraComum'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 28
      DockingStyle = dsTop
      FloatLeft = 276
      FloatTop = 213
      FloatClientWidth = 23
      FloatClientHeight = 22
      ItemLinks = <>
      OldName = 'BarraComum'
      OneOnRow = True
      Row = 1
      UseOwnFont = False
      Visible = False
      WholeRow = True
    end
    object BarMgrBar3: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'Custom 1'
      CaptionButtons = <>
      Color = clBtnFace
      DockControl = dxBarDockControl2
      DockedDockControl = dxBarDockControl2
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 935
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmVendas'
        end
        item
          Visible = True
          ItemName = 'cmClientes'
        end
        item
          Visible = True
          ItemName = 'cmProdutos'
        end
        item
          Visible = True
          ItemName = 'cmFornecedores'
        end
        item
          Visible = True
          ItemName = 'cmDebitos'
        end
        item
          Visible = True
          ItemName = 'cmCaixa'
        end
        item
          Visible = True
          ItemName = 'cmUsuarios'
        end
        item
          Visible = True
          ItemName = 'cmEstatisticas'
        end>
      MultiLine = True
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      RotateWhenVertical = False
      Row = 0
      UseOwnFont = True
      UseRestSpace = True
      Visible = True
      WholeRow = False
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = '&Arquivo'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmTrocarUsuario'
        end>
      ItemOptions.Size = misNormal
    end
    object cmTrocarUsuario: TdxBarButton
      Caption = 'Login'
      Category = 0
      Hint = 'Login'
      Visible = ivNever
      OnClick = cmTrocarUsuarioClick
    end
    object cmAlterarSenha: TdxBarButton
      Caption = 'Alterar Senha'
      Category = 0
      Enabled = False
      Hint = 'Alterar Senha'
      Visible = ivAlways
      OnClick = cmAlterarSenhaClick
    end
    object dxBarButton3: TdxBarButton
      Caption = '&Op'#231#245'es'
      Category = 0
      Hint = 'Op'#231#245'es'
      Visible = ivAlways
    end
    object dxBarButton4: TdxBarButton
      Caption = '&Tarifas'
      Category = 0
      Hint = 'Tarifas'
      Visible = ivAlways
    end
    object cmSair: TdxBarButton
      Align = iaRight
      Caption = '&Sair'
      Category = 0
      Hint = 'Sair'
      Visible = ivAlways
      OnClick = cmSairClick
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = 'A&juda'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton6'
        end
        item
          Visible = True
          ItemName = 'dxBarButton9'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmSuporteRemoto'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmAbrirServ'
        end>
      ItemOptions.ShowShortCuts = True
      ItemOptions.Size = misNormal
    end
    object dxBarButton6: TdxBarButton
      Caption = 'Suporte T'#233'cnico / Contato'
      Category = 0
      Hint = 'Suporte T'#233'cnico / Contato'
      Visible = ivAlways
      OnClick = dxBarButton6Click
    end
    object dxBarButton9: TdxBarButton
      Caption = 'Hist'#243'rico de Vers'#245'es'
      Category = 0
      Hint = 'Hist'#243'rico de Vers'#245'es'
      Visible = ivNever
      OnClick = dxBarButton9Click
    end
    object dxBarSubItem3: TdxBarSubItem
      Caption = '&Exibir'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object cmExibir: TdxBarImageCombo
      Caption = 'E&xibir'
      Category = 0
      Hint = 'Exibir'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000000000000080FFFFFFFFFFFFF080FDEBFFFFFFFFF080FB6DF00F00F
        0F080F9ACFFFFFFFFF080FFFFFFFFFFFFF080C9D6CCCCCCCCC080C46BCFFFFCF
        FC080CBAECCCCCCCCC080FFFFFFFFFFFFF080F64AFFFFFFFFF080F496F00F000
        0F080F94BFFFFFFFFF080FFFFFFFFFFFFF080000000000000008}
      ShowCaption = True
      Items.Strings = (
        'M'#225'quinas'
        'Clientes'
        'Produtos'
        'Impress'#245'es'
        'Caixa'
        'Op'#231#245'es'
        'Tarifas'
        'Usu'#225'rios')
      ItemIndex = -1
      ImageIndexes = (
        0
        1
        10
        7
        9
        17
        18
        19)
    end
    object cmExportar: TdxBarButton
      Caption = 'Exportar'
      Category = 0
      Enabled = False
      Hint = 'Exportar'
      Visible = ivAlways
      ShortCut = 16453
      OnClick = cmExportarClick
    end
    object cmImprimir: TdxBarButton
      Caption = 'Imprimir'
      Category = 0
      Enabled = False
      Hint = 'Imprimir'
      Visible = ivAlways
      ImageIndex = 22
      ShortCut = 16464
      OnClick = cmImprimirClick
    end
    object cmSubExibir: TdxBarSubItem
      Caption = 'E&xibir'
      Category = 0
      Enabled = False
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmVendas'
        end
        item
          Visible = True
          ItemName = 'cmClientes'
        end
        item
          Visible = True
          ItemName = 'cmProdutos'
        end
        item
          Visible = True
          ItemName = 'cmFornecedores'
        end
        item
          Visible = True
          ItemName = 'cmDebitos'
        end
        item
          Visible = True
          ItemName = 'cmCaixa'
        end
        item
          Visible = True
          ItemName = 'cmUsuarios'
        end
        item
          Visible = True
          ItemName = 'cmEstatisticas'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmMostrarTextoBotoes'
        end>
    end
    object cmMostrarTextoBotoes: TdxBarButton
      Caption = 'Mostrar Texto dos Bot'#245'es'
      Category = 0
      Hint = 'Mostrar Texto dos Bot'#245'es'
      Visible = ivAlways
      OnClick = cmMostrarTextoBotoesClick
    end
    object cmSuporteRemoto: TdxBarButton
      Caption = 'Chamar Suporte T'#233'cnico (F8)'
      Category = 0
      Hint = 'Chamar Suporte T'#233'cnico (F8)'
      Visible = ivAlways
      OnClick = cmSuporteRemotoClick
    end
    object dxBarButton1: TdxBarButton
      Caption = 'Senha de Suporte'
      Category = 0
      Hint = 'Senha de Suporte'
      Visible = ivAlways
    end
    object dxBarSubItem4: TdxBarSubItem
      Caption = 'Arquivo'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmImprimir'
        end
        item
          Visible = True
          ItemName = 'cmExportar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarSubItem5'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmSair'
        end>
      ItemOptions.Size = misNormal
    end
    object dxBarSubItem5: TdxBarSubItem
      Caption = 'Layout'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cmLayoutAddRemCols'
        end
        item
          Visible = True
          ItemName = 'cmLaySalvar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'cmLayRestaurar'
        end>
    end
    object cmLayoutAddRemCols: TdxBarButton
      Caption = 'Adicionar ou remover colunas'
      Category = 0
      Hint = 'Adicionar ou remover colunas'
      Visible = ivAlways
      ImageIndex = 21
      OnClick = cmLayoutAddRemColsClick
    end
    object cmLaySalvar: TdxBarButton
      Caption = 'Salvar'
      Category = 0
      Hint = 'Salvar'
      Visible = ivAlways
      ImageIndex = 34
      OnClick = cmLaySalvarClick
    end
    object cmLayRestaurar: TdxBarButton
      Caption = 'Restaurar layout padr'#227'o'
      Category = 0
      Hint = 'Restaurar layout padr'#227'o'
      Visible = ivAlways
      OnClick = cmLayRestaurarClick
    end
    object cmClientes: TdxBarLargeButton
      Tag = 1
      Caption = 'Clientes'
      Category = 0
      Hint = 'Gerenciar clientes'
      Style = cxStyle1
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      LargeImageIndex = 1
      OnClick = cmMaquinasClick
      Width = 80
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmProdutos: TdxBarLargeButton
      Tag = 2
      Caption = 'Produtos'
      Category = 0
      Hint = 'Gerenciar produtos'
      Style = cxStyle1
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      LargeImageIndex = 2
      OnClick = cmMaquinasClick
      Width = 80
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmCaixa: TdxBarLargeButton
      Tag = 5
      Caption = 'Caixa'
      Category = 0
      Hint = 'Caixa: abrir, fechar, corrigir ...'
      Style = cxStyle1
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      LargeImageIndex = 9
      OnClick = cmMaquinasClick
      Width = 80
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmUsuarios: TdxBarLargeButton
      Tag = 6
      Caption = 'Usu'#225'rios'
      Category = 0
      Hint = 'Gerenciamento de funcion'#225'rios'
      Style = cxStyle1
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      LargeImageIndex = 25
      OnClick = cmMaquinasClick
      Width = 80
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmEstatisticas: TdxBarLargeButton
      Tag = 7
      Caption = 'Estat'#237'sticas'
      Category = 0
      Hint = 'Estat'#237'sticas da loja'
      Style = cxStyle1
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      LargeImageIndex = 88
      OnClick = cmMaquinasClick
      Width = 80
      SyncImageIndex = False
      ImageIndex = -1
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'Config.Maq.'
      Category = 0
      Hint = 'Configura'#231#227'o das M'#225'quinas Clientes'
      Visible = ivAlways
      ButtonStyle = bsChecked
      LargeImageIndex = 110
      AutoGrayScale = False
    end
    object cmAbrirServ: TdxBarButton
      Caption = 'Abrir servidor Nex (NexServ)'
      Category = 0
      Hint = 'Abrir servidor Nex (NexServ)'
      Visible = ivAlways
      OnClick = cmAbrirServClick
    end
    object dxBarButton2: TdxBarButton
      Caption = 'Logoff     (trocar funcion'#225'rio)'
      Category = 0
      Hint = 'Trocar funcion'#225'rio'
      Visible = ivAlways
      OnClick = dxBarButton2Click
    end
    object dxBarButton7: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object cmVerCod: TdxBarButton
      Align = iaRight
      Caption = 'Loja | Versao'
      Category = 0
      Hint = 'Loja | Versao'
      Visible = ivAlways
      ImageIndex = 84
      PaintStyle = psCaptionGlyph
      OnClick = cmVerCodClick
    end
    object cmComprarAss: TdxBarButton
      Caption = 'Comprar Assinatura Premium'
      Category = 0
      Hint = 'Acessar o site de compra de assinatura do NexCaf'#233
      Visible = ivAlways
      ImageIndex = 85
      PaintStyle = psCaptionGlyph
      OnClick = cmComprarAssClick
    end
    object cmVendas: TdxBarLargeButton
      Caption = 'Vendas'
      Category = 0
      Hint = 'Vendas'
      Style = styleSelecionado
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      Down = True
      LargeImageIndex = 10
      OnClick = cmMaquinasClick
      AutoGrayScale = False
      Width = 80
      SyncImageIndex = False
      ImageIndex = -1
    end
    object cmFornecedores: TdxBarLargeButton
      Tag = 3
      Caption = 'Fornecedores'
      Category = 0
      Hint = 'Fornecedores'
      Style = cxStyle1
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      LargeImageIndex = 130
      OnClick = cmMaquinasClick
      Width = 80
    end
    object cmDebitos: TdxBarLargeButton
      Tag = 4
      Caption = 'D'#233'bitos'
      Category = 0
      Hint = 'D'#233'bitos'
      Style = cxStyle1
      Visible = ivNever
      ButtonStyle = bsChecked
      GroupIndex = 1
      LargeImageIndex = 94
      OnClick = cmMaquinasClick
      Width = 80
    end
    object dxBarButton5: TdxBarButton
      Caption = 'www.programanex.com.br'
      Category = 0
      Hint = 'www.programanex.com.br'
      Style = cxStyle48
      Visible = ivAlways
      OnClick = dxBarButton5Click
    end
  end
  object cxEditStyleController1: TcxEditStyleController
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = False
    Style.TransparentBorder = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.Color = 7471103
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleFocused.TextStyle = [fsBold]
    StyleHot.LookAndFeel.NativeStyle = False
    Left = 232
    Top = 184
    PixelsPerInch = 96
  end
  object FM: TFormManager
    BarMgr = BarMgr
    PageControl = Paginas
    OnChange = FMChange
    Left = 200
    Top = 184
  end
  object HC: TcxHintStyleController
    HintStyleClassName = 'TcxHintStyle'
    HintStyle.Animate = cxhaFadeIn
    HintStyle.CaptionFont.Charset = ANSI_CHARSET
    HintStyle.CaptionFont.Color = clWindowText
    HintStyle.CaptionFont.Height = -13
    HintStyle.CaptionFont.Name = 'Tahoma'
    HintStyle.CaptionFont.Style = [fsBold]
    HintStyle.Font.Charset = ANSI_CHARSET
    HintStyle.Font.Color = clWindowText
    HintStyle.Font.Height = -13
    HintStyle.Font.Name = 'Tahoma'
    HintStyle.Font.Style = []
    HintStyle.IconType = cxhiInformation
    HintStyle.Rounded = True
    HintPause = 200
    HintHidePause = 3500
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    Left = 200
    Top = 152
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 232
    Top = 120
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15329769
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14211272
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14738136
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7897176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 524288
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = 524288
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4194368
      Font.Charset = ANSI_CHARSET
      Font.Color = clPurple
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7897176
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = 7897176
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      TextColor = 4802889
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 11055248
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 8292193
      TextColor = clWhite
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clBlack
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 9279343
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7897176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11458790
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14150898
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11458790
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4630214
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = 14150898
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11458790
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4630214
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11458790
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clMaroon
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4630214
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12615680
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxStyle31: TcxStyle
      Tag = 9
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = 5723991
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor]
      Color = clWhite
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBackground
      TextColor = clWhite
    end
    object cxStyle36: TcxStyle
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12582911
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clGray
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clGray
    end
    object cxStyle41: TcxStyle
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle43: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBackground
      TextColor = clWhite
    end
    object cxStyle44: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clWindow
    end
    object cxStyle45: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle46: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = 15934
    end
    object cxStyle47: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxStyle48: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      TextColor = clBlue
    end
    object styleSelecionado: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxStyle49: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object GridTableViewStyleSheetEggplant: TcxGridTableViewStyleSheet
      Caption = 'Eggplant'
      Styles.Content = cxStyle1
      Styles.ContentEven = cxStyle2
      Styles.ContentOdd = cxStyle3
      Styles.Inactive = cxStyle8
      Styles.Selection = cxStyle11
      Styles.Footer = cxStyle4
      Styles.Group = cxStyle5
      Styles.GroupByBox = cxStyle6
      Styles.Header = cxStyle7
      Styles.Indicator = cxStyle9
      Styles.Preview = cxStyle10
      BuiltIn = True
    end
    object cxVerticalGridStyleSheetEggplant: TcxVerticalGridStyleSheet
      Caption = 'Eggplant'
      Styles.Background = cxStyle12
      Styles.Content = cxStyle14
      Styles.Inactive = cxStyle16
      Styles.Selection = cxStyle17
      Styles.Category = cxStyle13
      Styles.Header = cxStyle15
      BuiltIn = True
    end
    object GridTableViewStyleSheetMaple: TcxGridTableViewStyleSheet
      Caption = 'Maple'
      Styles.Content = cxStyle18
      Styles.ContentEven = cxStyle19
      Styles.ContentOdd = cxStyle20
      Styles.Inactive = cxStyle25
      Styles.Selection = cxStyle28
      Styles.Footer = cxStyle21
      Styles.Group = cxStyle22
      Styles.GroupByBox = cxStyle23
      Styles.Header = cxStyle24
      Styles.Indicator = cxStyle26
      Styles.Preview = cxStyle27
      BuiltIn = True
    end
  end
  object dckMgr: TdxDockingManager
    AutoHideInterval = 0
    AutoHideMovingInterval = 0
    AutoShowInterval = 0
    Color = clBtnFace
    DefaultHorizContainerSiteProperties.AllowFloating = False
    DefaultHorizContainerSiteProperties.CaptionButtons = [cbMaximize, cbHide]
    DefaultHorizContainerSiteProperties.Dockable = True
    DefaultHorizContainerSiteProperties.ImageIndex = -1
    DefaultVertContainerSiteProperties.AllowFloating = False
    DefaultVertContainerSiteProperties.CaptionButtons = [cbMaximize, cbHide]
    DefaultVertContainerSiteProperties.Dockable = True
    DefaultVertContainerSiteProperties.ImageIndex = -1
    DefaultTabContainerSiteProperties.AllowFloating = False
    DefaultTabContainerSiteProperties.CaptionButtons = [cbMaximize, cbHide]
    DefaultTabContainerSiteProperties.Dockable = True
    DefaultTabContainerSiteProperties.ImageIndex = -1
    DefaultTabContainerSiteProperties.TabsProperties.TabPosition = tpTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    Options = [doActivateAfterDocking, doDblClickDocking, doFloatingOnTop, doTabContainerHasCaption, doTabContainerCanAutoHide, doSideContainerHasCaption, doSideContainerCanAutoHide, doTabContainerCanInSideContainer, doImmediatelyHideOnAutoHide, doHideAutoHideIfActive, doRedrawOnResize]
    Left = 168
    Top = 152
    PixelsPerInch = 96
  end
  object MT: TkbmMemTable
    Active = True
    DesignActivation = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'DataHora'
        DataType = ftDateTime
      end
      item
        Name = 'Texto'
        DataType = ftMemo
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
    Left = 168
    Top = 120
    object MTDataHora: TDateTimeField
      FieldName = 'DataHora'
    end
    object MTTexto: TMemoField
      FieldName = 'Texto'
      BlobType = ftMemo
    end
  end
  object DataSource1: TDataSource
    DataSet = MT
    Left = 200
    Top = 120
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 336
    Top = 128
  end
  object TimerChat: TTimer
    Enabled = False
    Interval = 500
    Left = 368
    Top = 160
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer2Timer
    Left = 368
    Top = 128
  end
  object AE: TApplicationEvents
    OnException = AEException
    OnShortCut = AEShortCut
    Left = 168
    Top = 184
  end
  object FingRead: TGrFingerComp
    Active = False
    OnFingerPrint = FingReadFingerPrint
    Left = 272
    Top = 152
  end
  object TimerHint: TTimer
    Enabled = False
    Interval = 4000
    OnTimer = TimerHintTimer
    Left = 400
    Top = 128
  end
  object dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    Left = 312
    Top = 208
    object lfPadrao: TdxLayoutStandardLookAndFeel
      ItemOptions.ControlBorderStyle = lbsFlat
    end
  end
  object TimerPlusUpdateAll: TTimer
    Enabled = False
    OnTimer = TimerPlusUpdateAllTimer
    Left = 400
    Top = 160
  end
  object logos_plus: TcxImageList
    Height = 54
    Width = 152
    FormatVersion = 1
    DesignInfo = 9961704
    ImageInfo = <
      item
        Image.Data = {
          76800000424D7680000000000000360000002800000098000000360000000100
          20000000000040800000000000000000000000000000000000009A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFACAC
          ACFFACACACFFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9999
          99FF999999FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9999
          99FF999999FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFBFBF
          BFFFBFBFBFFFE6E6E6FFE6E6E6FFE6E6E6FFD3D3D3FFBFBFBFFFD3D3D3FFE6E6
          E6FFE6E6E6FFD3D3D3FFB1B1B1FFACACACFFACACACFFC9C9C9FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFC9C9C9FFBFBFBFFFDCDCDCFFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFD3D3D3FFB1B1B1FFACACACFFACACACFFC9C9C9FFE6E6
          E6FFE6E6E6FFE1E1E1FFC9C9C9FFB1B1B1FFACACACFFACACACFFBBBBBBFFE1E1
          E1FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9999
          99FF999999FFB6B6B6FFACACACFFACACACFFC4C4C4FFE6E6E6FFE6E6E6FFE6E6
          E6FFD8D8D8FFB1B1B1FFACACACFFB1B1B1FFD3D3D3FFBFBFBFFFBFBFBFFFE6E6
          E6FFE6E6E6FFBFBFBFFFBFBFBFFFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFD3D3D3FFB6B6B6FFACACACFFACACACFFBBBBBBFFDCDCDCFFE6E6E6FFE6E6
          E6FFD3D3D3FFB6B6B6FFACACACFFACACACFFB6B6B6FFCECECEFFE6E6E6FFE6E6
          E6FFBFBFBFFFBFBFBFFFE6E6E6FFE6E6E6FFBFBFBFFFBFBFBFFFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFD3D3D3FFB1B1B1FFACACACFFACACACFFC9C9
          C9FFE6E6E6FFE6E6E6FFE1E1E1FFC9C9C9FFB1B1B1FFACACACFFACACACFFBBBB
          BBFFE1E1E1FFE6E6E6FFE6E6E6FFDCDCDCFFBFBFBFFFC9C9C9FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9999
          99FF999999FFE6E6E6FFE6E6E6FFE6E6E6FFBFBFBFFF999999FFBFBFBFFFE6E6
          E6FFC9C9C9FF999999FF999999FFACACACFF9E9E9EFF999999FFB6B6B6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE1E1E1FF999999FF999999FFBBBBBBFFE6E6E6FFE6E6
          E6FFE6E6E6FFC9C9C9FF999999FF999999FFACACACFF9E9E9EFF999999FFB6B6
          B6FFE6E6E6FFBFBFBFFF999999FF999999FFA7A7A7FFA2A2A2FF999999FF9E9E
          9EFFE1E1E1FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9999
          99FF999999FF999999FFACACACFF9E9E9EFF999999FFB6B6B6FFE6E6E6FFDCDC
          DCFF9E9E9EFF999999FFA7A7A7FFA2A2A2FF999999FF999999FF999999FFE6E6
          E6FFE6E6E6FF999999FF999999FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFC9C9
          C9FF999999FF999999FFA7A7A7FFA2A2A2FF999999FFACACACFFE6E6E6FFC9C9
          C9FF999999FF999999FFA2A2A2FFA7A7A7FF999999FF999999FFD3D3D3FFE6E6
          E6FF999999FF999999FFE6E6E6FFE6E6E6FF999999FF999999FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFC9C9C9FF999999FF999999FFACACACFF9E9E9EFF9999
          99FFB6B6B6FFE6E6E6FFBFBFBFFF999999FF999999FFA7A7A7FFA2A2A2FF9999
          99FF9E9E9EFFE1E1E1FFE6E6E6FFD3D3D3FF999999FFACACACFFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9999
          99FF999999FFE6E6E6FFE6E6E6FFE6E6E6FFBFBFBFFF999999FFBFBFBFFFE1E1
          E1FF999999FF999999FFD8D8D8FFE6E6E6FFE1E1E1FFA2A2A2FF999999FFC9C9
          C9FFE6E6E6FFE6E6E6FFC4C4C4FF999999FF999999FF9E9E9EFFE6E6E6FFE6E6
          E6FFE1E1E1FF999999FF999999FFD8D8D8FFE6E6E6FFE1E1E1FFA2A2A2FF9999
          99FFC9C9C9FFBFBFBFFFB1B1B1FFDCDCDCFFE6E6E6FFE6E6E6FFB1B1B1FF9999
          99FFC4C4C4FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9999
          99FF999999FFE1E1E1FFE6E6E6FFE1E1E1FFA2A2A2FF999999FFD3D3D3FFC4C4
          C4FF999999FFB1B1B1FFE6E6E6FFE6E6E6FFC4C4C4FF999999FF999999FFE6E6
          E6FFE6E6E6FF999999FF999999FFE6E6E6FFE6E6E6FFE6E6E6FFDCDCDCFF9999
          99FF999999FFC9C9C9FFE6E6E6FFE6E6E6FFD3D3D3FFBBBBBBFFDCDCDCFF9999
          99FF999999FFC9C9C9FFE6E6E6FFE6E6E6FFDCDCDCFFB6B6B6FFD8D8D8FFE6E6
          E6FF999999FF999999FFE6E6E6FFE6E6E6FF999999FF999999FFE6E6E6FFE6E6
          E6FFE6E6E6FFE1E1E1FF999999FF999999FFD8D8D8FFE6E6E6FFE1E1E1FFA2A2
          A2FF999999FFC9C9C9FFBFBFBFFFB1B1B1FFDCDCDCFFE6E6E6FFE6E6E6FFB1B1
          B1FF999999FFC4C4C4FFE6E6E6FFDCDCDCFFBFBFBFFFC9C9C9FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9999
          99FF999999FFE6E6E6FFE6E6E6FFE6E6E6FFBFBFBFFF999999FFBFBFBFFFC9C9
          C9FF999999FFB1B1B1FFE6E6E6FFE6E6E6FFE6E6E6FFC4C4C4FF999999FFB6B6
          B6FFE6E6E6FFE6E6E6FFA7A7A7FF999999FF9E9E9EFF999999FFCECECEFFE6E6
          E6FFC9C9C9FF999999FFB1B1B1FFE6E6E6FFE6E6E6FFE6E6E6FFC4C4C4FF9999
          99FFB6B6B6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE1E1E1FFACACACFF9999
          99FFBFBFBFFFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9999
          99FF999999FFE6E6E6FFE6E6E6FFE6E6E6FFC4C4C4FF999999FFBBBBBBFFBFBF
          BFFF999999FFBBBBBBFFE6E6E6FFE6E6E6FFE6E6E6FF999999FF999999FFE6E6
          E6FFE6E6E6FF999999FF999999FFE6E6E6FFE6E6E6FFE6E6E6FFC9C9C9FF9999
          99FFA7A7A7FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFC9C9C9FF9999
          99FFACACACFFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FF999999FF999999FFE6E6E6FFE6E6E6FF999999FF999999FFE6E6E6FFE6E6
          E6FFE6E6E6FFC9C9C9FF999999FFB1B1B1FFE6E6E6FFE6E6E6FFE6E6E6FFC4C4
          C4FF999999FFB6B6B6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE1E1E1FFACAC
          ACFF999999FFBFBFBFFFE6E6E6FFE6E6E6FFD3D3D3FFDCDCDCFFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9999
          99FF999999FFE6E6E6FFE6E6E6FFE6E6E6FFBFBFBFFF999999FFBFBFBFFFBFBF
          BFFF999999FFBFBFBFFFE6E6E6FFE6E6E6FFE6E6E6FFD3D3D3FF999999FFACAC
          ACFFE6E6E6FFD8D8D8FF999999FFA2A2A2FFC9C9C9FF999999FFB1B1B1FFE6E6
          E6FFBFBFBFFF999999FFBFBFBFFFE6E6E6FFE6E6E6FFE6E6E6FFD3D3D3FF9999
          99FFACACACFFE6E6E6FFD8D8D8FFB6B6B6FFA7A7A7FF999999FF999999FF9999
          99FFD3D3D3FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9999
          99FF999999FFE6E6E6FFE6E6E6FFE6E6E6FFD3D3D3FF999999FFACACACFFD3D3
          D3FF999999FF999999FFBFBFBFFFD3D3D3FFE1E1E1FF999999FF999999FFE6E6
          E6FFE6E6E6FF999999FF999999FFE6E6E6FFE6E6E6FFE6E6E6FFBFBFBFFF9999
          99FFBFBFBFFFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFBFBFBFFF9999
          99FFB6B6B6FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFDCDCDCFFE6E6
          E6FF999999FF999999FFE6E6E6FFE6E6E6FF999999FF999999FFE6E6E6FFE6E6
          E6FFE6E6E6FFBFBFBFFF999999FFBFBFBFFFE6E6E6FFE6E6E6FFE6E6E6FFD3D3
          D3FF999999FFACACACFFE6E6E6FFD8D8D8FFB6B6B6FFA7A7A7FF999999FF9999
          99FF999999FFD3D3D3FFE6E6E6FFE6E6E6FF999999FFBFBFBFFFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9999
          99FF999999FFE6E6E6FFE6E6E6FFE6E6E6FFBFBFBFFF999999FFBFBFBFFFBFBF
          BFFF999999FFBFBFBFFFE6E6E6FFE6E6E6FFE6E6E6FFD3D3D3FF999999FFACAC
          ACFFE6E6E6FFB6B6B6FF999999FFBBBBBBFFE1E1E1FF999999FF999999FFE1E1
          E1FFBFBFBFFF999999FFBFBFBFFFE6E6E6FFE6E6E6FFE6E6E6FFD3D3D3FF9999
          99FFACACACFFDCDCDCFF999999FF999999FF999999FFA7A7A7FFB6B6B6FFD3D3
          D3FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9999
          99FF999999FFE6E6E6FFE6E6E6FFE6E6E6FFD3D3D3FF999999FFACACACFFE6E6
          E6FFBFBFBFFF9E9E9EFF999999FF999999FF999999FF999999FF999999FFE6E6
          E6FFE6E6E6FF999999FF999999FFE6E6E6FFE6E6E6FFE6E6E6FFBFBFBFFF9999
          99FFBFBFBFFFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFBFBFBFFF9999
          99FF999999FF999999FF999999FF999999FF999999FF999999FFBFBFBFFFE6E6
          E6FF999999FF999999FFE6E6E6FFE6E6E6FF999999FF999999FFE6E6E6FFE6E6
          E6FFE6E6E6FFBFBFBFFF999999FFBFBFBFFFE6E6E6FFE6E6E6FFE6E6E6FFD3D3
          D3FF999999FFACACACFFDCDCDCFF999999FF999999FF999999FFA7A7A7FFB6B6
          B6FFD3D3D3FFE6E6E6FFE6E6E6FFE6E6E6FF999999FFBFBFBFFFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9999
          99FF999999FFE6E6E6FFE6E6E6FFE6E6E6FFBFBFBFFF999999FFBFBFBFFFC9C9
          C9FF999999FFB1B1B1FFE6E6E6FFE6E6E6FFE6E6E6FFC4C4C4FF999999FFB6B6
          B6FFE6E6E6FF9E9E9EFF999999FFD8D8D8FFE6E6E6FFB1B1B1FF999999FFC4C4
          C4FFC9C9C9FF999999FFB1B1B1FFE6E6E6FFE6E6E6FFE6E6E6FFC4C4C4FF9999
          99FFB6B6B6FFBFBFBFFF999999FFA7A7A7FFE1E1E1FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9999
          99FF999999FFE6E6E6FFE6E6E6FFE6E6E6FFC9C9C9FF999999FFB1B1B1FFE6E6
          E6FFE6E6E6FFE6E6E6FFD3D3D3FFC9C9C9FFBFBFBFFF999999FF999999FFE6E6
          E6FFE6E6E6FF999999FF999999FFE1E1E1FFE6E6E6FFE6E6E6FFC9C9C9FF9999
          99FFA7A7A7FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFC9C9C9FF9999
          99FFB1B1B1FFD3D3D3FFD3D3D3FFD3D3D3FFB6B6B6FF999999FFBFBFBFFFE6E6
          E6FF999999FF999999FFE6E6E6FFE6E6E6FF999999FF999999FFE1E1E1FFE6E6
          E6FFE6E6E6FFC9C9C9FF999999FFB1B1B1FFE6E6E6FFE6E6E6FFE6E6E6FFC4C4
          C4FF999999FFB6B6B6FFBFBFBFFF999999FFA7A7A7FFE1E1E1FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF999999FFB6B6B6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9999
          99FF999999FFC4C4C4FFE6E6E6FFE6E6E6FFACACACFF999999FFC4C4C4FFDCDC
          DCFF999999FF999999FFD8D8D8FFE6E6E6FFE1E1E1FFA2A2A2FF999999FFC9C9
          C9FFC9C9C9FF999999FFA7A7A7FFE6E6E6FFE6E6E6FFCECECEFF999999FFA2A2
          A2FFDCDCDCFF999999FF999999FFD8D8D8FFE6E6E6FFE1E1E1FFA2A2A2FF9999
          99FFC9C9C9FFC4C4C4FF999999FFB1B1B1FFE6E6E6FFE6E6E6FFDCDCDCFFB6B6
          B6FFD8D8D8FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9999
          99FF999999FFC4C4C4FFE6E6E6FFE6E6E6FFACACACFF999999FFC4C4C4FFE6E6
          E6FFC9C9C9FFD8D8D8FFE6E6E6FFE6E6E6FFD3D3D3FF999999FF9E9E9EFFE6E6
          E6FFE6E6E6FF999999FF999999FFA2A2A2FFC9C9C9FFD3D3D3FFDCDCDCFF9E9E
          9EFF999999FFC9C9C9FFE6E6E6FFE6E6E6FFCECECEFFBBBBBBFFE1E1E1FF9E9E
          9EFF9E9E9EFFD8D8D8FFE6E6E6FFE1E1E1FFA2A2A2FF999999FFD3D3D3FFE6E6
          E6FF999999FF999999FFE6E6E6FFE6E6E6FF999999FF999999FFA2A2A2FFC9C9
          C9FFD3D3D3FFD8D8D8FF999999FF999999FFD8D8D8FFE6E6E6FFE1E1E1FFA2A2
          A2FF999999FFC9C9C9FFC4C4C4FF999999FFB1B1B1FFE6E6E6FFE6E6E6FFDCDC
          DCFFB6B6B6FFD8D8D8FFE6E6E6FFD3D3D3FF999999FFACACACFFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9999
          99FF999999FF999999FFA2A2A2FFA2A2A2FF999999FF9E9E9EFFE1E1E1FFE6E6
          E6FFC9C9C9FF999999FF999999FFACACACFF9E9E9EFF999999FFB6B6B6FFE6E6
          E6FFB1B1B1FF999999FFC4C4C4FFE6E6E6FFE6E6E6FFE6E6E6FF9E9E9EFF9999
          99FFD8D8D8FFC9C9C9FF999999FF999999FFACACACFF9E9E9EFF999999FFB6B6
          B6FFE6E6E6FFDCDCDCFF9E9E9EFF999999FFA2A2A2FFA7A7A7FF999999FF9999
          99FFD3D3D3FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9999
          99FF999999FF999999FFA2A2A2FFA2A2A2FF999999FFA2A2A2FFE1E1E1FFE6E6
          E6FFACACACFF999999FFA2A2A2FFACACACFF999999FF999999FFBBBBBBFFE6E6
          E6FFE6E6E6FF999999FF999999FF9E9E9EFF999999FF999999FFD3D3D3FFC9C9
          C9FF999999FF999999FFA7A7A7FFA2A2A2FF999999FFACACACFFE6E6E6FFC9C9
          C9FF999999FF999999FFACACACFF9E9E9EFF999999FFACACACFFE6E6E6FFE6E6
          E6FF999999FF999999FFE6E6E6FFE6E6E6FF999999FF999999FF9E9E9EFF9999
          99FF999999FFD3D3D3FFC9C9C9FF999999FF999999FFACACACFF9E9E9EFF9999
          99FFB6B6B6FFE6E6E6FFDCDCDCFF9E9E9EFF999999FFA2A2A2FFA7A7A7FF9999
          99FF999999FFD3D3D3FFE6E6E6FFD3D3D3FF999999FFACACACFFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFBFBF
          BFFFBFBFBFFFD3D3D3FFB1B1B1FFACACACFFB1B1B1FFD8D8D8FFE6E6E6FFE6E6
          E6FFE6E6E6FFD3D3D3FFB1B1B1FFACACACFFACACACFFC9C9C9FFE6E6E6FFE6E6
          E6FFBFBFBFFFBFBFBFFFDCDCDCFFE6E6E6FFE6E6E6FFE6E6E6FFC9C9C9FFBFBF
          BFFFD3D3D3FFE6E6E6FFD3D3D3FFB1B1B1FFACACACFFACACACFFC9C9C9FFE6E6
          E6FFE6E6E6FFE6E6E6FFDCDCDCFFBBBBBBFFACACACFFACACACFFB1B1B1FFC9C9
          C9FFE1E1E1FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFBFBF
          BFFFBFBFBFFFCECECEFFB1B1B1FFACACACFFB6B6B6FFDCDCDCFFE6E6E6FFE6E6
          E6FFCECECEFFB6B6B6FFACACACFFACACACFFB1B1B1FFC9C9C9FFE6E6E6FFE6E6
          E6FFE6E6E6FFBFBFBFFFBFBFBFFFE1E1E1FFC4C4C4FFBFBFBFFFDCDCDCFFE6E6
          E6FFD3D3D3FFB6B6B6FFACACACFFACACACFFBBBBBBFFD8D8D8FFE6E6E6FFE6E6
          E6FFD3D3D3FFB6B6B6FFACACACFFACACACFFC4C4C4FFE1E1E1FFE6E6E6FFE6E6
          E6FFBFBFBFFFBFBFBFFFE6E6E6FFE6E6E6FFBFBFBFFFBFBFBFFFE1E1E1FFC4C4
          C4FFBFBFBFFFDCDCDCFFE6E6E6FFD3D3D3FFB1B1B1FFACACACFFACACACFFC9C9
          C9FFE6E6E6FFE6E6E6FFE6E6E6FFDCDCDCFFBBBBBBFFACACACFFACACACFFB1B1
          B1FFC9C9C9FFE1E1E1FFE6E6E6FFD3D3D3FF999999FFACACACFFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFD3D3D3FFD3D3D3FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFD3D3D3FF999999FFACACACFFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FF999999FF999999FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFD3D3D3FF999999FFACACACFFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFBFBFBFFFBFBFBFFFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFDCDCDCFFBFBFBFFFC9C9C9FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE1E1E1FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3
          D3FFD3D3D3FFDCDCDCFFDCDCDCFFD3D3D3FFDCDCDCFFE6E6E6FFE6E6E6FFDCDC
          DCFFD3D3D3FFDCDCDCFFE6E6E6FFE6E6E6FFDCDCDCFFD3D3D3FFDCDCDCFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFDCDCDCFFD3D3D3FFD3D3
          D3FFC4C4C4FFBFBFBFFFC9C9C9FFE1E1E1FFE6E6E6FFE6E6E6FFDCDCDCFFD3D3
          D3FFDCDCDCFFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFD8D8D8FFBFBF
          BFFFBFBFBFFFBFBFBFFFD8D8D8FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE1E1
          E1FFD3D3D3FFD8D8D8FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFD8D8
          D8FFBFBFBFFFBFBFBFFFBFBFBFFFD8D8D8FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFD3D3D3FF999999FF999999FF999999FF999999FF999999FF9999
          99FF999999FFBFBFBFFFBFBFBFFF999999FFBFBFBFFFE6E6E6FFE6E6E6FFBFBF
          BFFF999999FFBFBFBFFFE6E6E6FFE6E6E6FFBFBFBFFF999999FFBFBFBFFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFBFBFBFFF999999FF9999
          99FF999999FF999999FF999999FFA7A7A7FFE1E1E1FFE6E6E6FFBFBFBFFF9999
          99FFBFBFBFFFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFB6B6B6FF999999FF9999
          99FF999999FF999999FF999999FFB1B1B1FFE6E6E6FFE6E6E6FFE6E6E6FFC4C4
          C4FF999999FF9E9E9EFFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFB6B6B6FF9999
          99FF999999FF999999FF999999FF999999FFB1B1B1FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFD3D3D3FF999999FFA7A7A7FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3
          D3FFD3D3D3FFDCDCDCFFBFBFBFFF999999FFBFBFBFFFE6E6E6FFE6E6E6FFBFBF
          BFFF999999FFBFBFBFFFE6E6E6FFE6E6E6FFBFBFBFFF999999FFBFBFBFFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFBFBFBFFF999999FFB1B1
          B1FFDCDCDCFFE1E1E1FFB6B6B6FF999999FFB6B6B6FFE6E6E6FFBFBFBFFF9999
          99FFBFBFBFFFE6E6E6FFE6E6E6FFE6E6E6FFBFBFBFFF999999FF9E9E9EFFCECE
          CEFFE6E6E6FFD8D8D8FFB6B6B6FFACACACFFE6E6E6FFE6E6E6FFE6E6E6FFA2A2
          A2FF999999FF999999FFC9C9C9FFE6E6E6FFE6E6E6FFBFBFBFFF999999FF9E9E
          9EFFCECECEFFE6E6E6FFD8D8D8FFB6B6B6FFACACACFFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFD3D3D3FF999999FFACACACFFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFBFBFBFFF999999FFBFBFBFFFE6E6E6FFE6E6E6FFBFBF
          BFFF999999FFBFBFBFFFE6E6E6FFE6E6E6FFBFBFBFFF999999FFBFBFBFFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFBFBFBFFF999999FFBFBF
          BFFFE6E6E6FFE6E6E6FFE1E1E1FF999999FF999999FFE1E1E1FFBFBFBFFF9999
          99FFBFBFBFFFE6E6E6FFE6E6E6FFE6E6E6FFA7A7A7FF999999FFC9C9C9FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFD8D8D8FF9999
          99FF999999FF999999FFB1B1B1FFE6E6E6FFE6E6E6FFA7A7A7FF999999FFC9C9
          C9FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFD3D3D3FF999999FFACACACFFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFBFBFBFFF999999FFBFBFBFFFE6E6E6FFE6E6E6FFBFBF
          BFFF999999FFBFBFBFFFE6E6E6FFE6E6E6FFBFBFBFFF999999FFBFBFBFFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFBFBFBFFF999999FFBFBF
          BFFFE6E6E6FFE6E6E6FFE6E6E6FFACACACFF999999FFD3D3D3FFBFBFBFFF9999
          99FFBFBFBFFFE6E6E6FFE6E6E6FFE6E6E6FF999999FF999999FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFB6B6B6FF9999
          99FFBFBFBFFF9E9E9EFF999999FFDCDCDCFFE6E6E6FF999999FF999999FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFD3D3D3FF999999FFACACACFFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFBFBFBFFF999999FFBFBFBFFFE6E6E6FFE6E6E6FFBFBF
          BFFF999999FFBFBFBFFFE6E6E6FFE6E6E6FFBFBFBFFF999999FFBFBFBFFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFBFBFBFFF999999FFBFBF
          BFFFE6E6E6FFE6E6E6FFE6E6E6FFACACACFF999999FFD3D3D3FFBFBFBFFF9999
          99FFBFBFBFFFE6E6E6FFE6E6E6FFE6E6E6FF999999FF999999FF999999FF9999
          99FF999999FF999999FF999999FF999999FFE6E6E6FFE1E1E1FF9E9E9EFF9999
          99FFDCDCDCFFB6B6B6FF999999FFC4C4C4FFE6E6E6FF999999FF999999FF9999
          99FF999999FF999999FF999999FF999999FF999999FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFD3D3D3FF999999FFA7A7A7FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3
          D3FFD3D3D3FFE6E6E6FFBFBFBFFF999999FFBFBFBFFFE6E6E6FFE6E6E6FFBFBF
          BFFF999999FFBFBFBFFFE6E6E6FFE6E6E6FFBFBFBFFF999999FFBFBFBFFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFBFBFBFFF999999FFBFBF
          BFFFE6E6E6FFE6E6E6FFE6E6E6FFA7A7A7FF999999FFD3D3D3FFBFBFBFFF9999
          99FFBFBFBFFFE6E6E6FFE6E6E6FFE6E6E6FF9E9E9EFF999999FFBFBFBFFFBFBF
          BFFFBFBFBFFFBFBFBFFF999999FF999999FFE6E6E6FFC9C9C9FF999999FFA7A7
          A7FFE6E6E6FFCECECEFF999999FFA2A2A2FFE6E6E6FF9E9E9EFF999999FFBFBF
          BFFFBFBFBFFFBFBFBFFFBFBFBFFF999999FF999999FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFD3D3D3FF999999FF999999FF999999FF999999FF999999FF9999
          99FF999999FFE6E6E6FFBFBFBFFF999999FFB1B1B1FFE6E6E6FFE6E6E6FFB6B6
          B6FF999999FFB1B1B1FFE6E6E6FFE6E6E6FFB6B6B6FF999999FFBFBFBFFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFBFBFBFFF999999FFB1B1
          B1FFE6E6E6FFE6E6E6FFDCDCDCFF999999FF999999FFE6E6E6FFBFBFBFFF9999
          99FF9E9E9EFFC9C9C9FFE6E6E6FFE6E6E6FFB6B6B6FF999999FFC4C4C4FFE6E6
          E6FFE6E6E6FFD3D3D3FF999999FFA7A7A7FFE6E6E6FFACACACFF999999FFC9C9
          C9FFE6E6E6FFE6E6E6FFA2A2A2FF999999FFD3D3D3FFB6B6B6FF999999FFC4C4
          C4FFE6E6E6FFE6E6E6FFD3D3D3FF999999FFA7A7A7FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFD3D3D3FF999999FFA7A7A7FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3
          D3FFD3D3D3FFE6E6E6FFBFBFBFFF999999FF999999FFA2A2A2FFBBBBBBFF9999
          99FF999999FF999999FFA2A2A2FFBBBBBBFF999999FF999999FFD8D8D8FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFBFBFBFFF999999FF9999
          99FFA2A2A2FFBFBFBFFFA2A2A2FF999999FFBBBBBBFFE6E6E6FFBFBFBFFF9999
          99FF999999FF999999FF999999FFACACACFFDCDCDCFF9E9E9EFF999999FFB6B6
          B6FFBBBBBBFF9E9E9EFF999999FFC4C4C4FFDCDCDCFF999999FF999999FFE1E1
          E1FFE6E6E6FFE6E6E6FFBBBBBBFF999999FFB6B6B6FFDCDCDCFF9E9E9EFF9999
          99FFB6B6B6FFBBBBBBFF9E9E9EFF999999FFC4C4C4FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFD3D3D3FF999999FFACACACFFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFC9C9C9FFACACACFFBBBBBBFFA2A2A2FF999999FF9E9E
          9EFFC4C4C4FFD3D3D3FFA2A2A2FF999999FF9E9E9EFFC4C4C4FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFBFBFBFFF999999FFB1B1
          B1FFA7A7A7FF999999FF999999FFB6B6B6FFE1E1E1FFE6E6E6FFC9C9C9FFACAC
          ACFFC4C4C4FFBFBFBFFFACACACFFBBBBBBFFE6E6E6FFD8D8D8FFB1B1B1FF9999
          99FF999999FFA2A2A2FFBFBFBFFFE6E6E6FFCECECEFFACACACFFBBBBBBFFE6E6
          E6FFE6E6E6FFE6E6E6FFD8D8D8FFACACACFFB1B1B1FFE6E6E6FFD8D8D8FFB1B1
          B1FF999999FF999999FFA2A2A2FFBFBFBFFFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFD3D3D3FF999999FFACACACFFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFBFBFBFFF999999FFBFBF
          BFFFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFD3D3D3FF999999FF9E9E9EFFACACACFFACACACFFACACACFFACAC
          ACFFACACACFFC9C9C9FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFBFBFBFFF999999FFBFBF
          BFFFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFD8D8D8FFACACACFFACACACFFACACACFFACACACFFACACACFFACAC
          ACFFACACACFFC9C9C9FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFBFBFBFFF999999FFBFBF
          BFFFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFDCDCDCFFD3D3D3FFDCDC
          DCFFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6
          E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FFE6E6E6FF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF}
      end
      item
        Image.Data = {
          76800000424D7680000000000000360000002800000098000000360000000100
          20000000000040800000000000000000000000000000000000009A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFD
          FFFFFDF9FEFFFFFEFFFFFFFFFEFFFDFFFCFFFCFEFDFFFDFFFFFFFAFFFCFFFCFF
          FBFFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFD
          FDFFFDFDFDFFFEFEFEFFFFFFFFFFFEFEFEFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFBFBFBFFFEFEFEFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFFFFFFBFBFBFFFDFD
          FDFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFAFAFAFFFCFCFCFFFCFCFCFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFDFCFEFFFDFCFDFFFFFEFFFFFCFAFFFFF6F8FDFFF6FAFCFFF9FBFFFFFCFB
          FFFFFFFFFFFFFEFEFEFFFEFEFEFFFDFDFDFFFDFDFDFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFEFEFEFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFBFBFBFFFEFEFEFFFFFFFFFFFFFFFFFFFBFBFBFFFCFCFCFFFFFFFFFFFFFF
          FFFFFFFFFFFFFBFBFBFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFEFEFFFDFFFDFFFCFCFFFFFAFAFFFFFDFFFBFFF9FFF2FFF2F9F7FFFAFB
          FFFFFFFFFFFFFEFEFEFFFCFCFCFFFFFFFFFFF5F5F5FFEDEDEDFFF0F0F0FFF1F1
          F1FFFAFAFAFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFEFE
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFCFCFCFFFDFDFDFFFFFFFFFFFDFDFDFFFFFFFFFFECECECFFEFEFEFFFEEEE
          EEFFF5F5F5FFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFFCFCFCFFFBFBFBFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
          FFFFFBFDFDFFFDFFF8FFFCFFFEFFFEFFFFFFF6FDE5FFCEE5ACFFD4E6BEFFFFFF
          FCFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFCCCCCCFF626262FF494949FF8181
          81FFEAEAEAFFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFFEFEFEFFFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FFFFFFFFFF969696FF545454FF5B5B
          5BFF9A9A9AFFF5F5F5FFFFFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFDFEFDFFFEFEFFFFFEFDFFFFFEFEFFFFFFFFFEFFFFFFFCFFFFFFFDFFFEFC
          FFFFFBF9FDFFFFFFF9FFFFFFF7FFEBF8DCFFB1D688FF608F29FF98BA6DFFFEFF
          F2FFFFFDFFFFFFFFFFFFFEFEFEFFFFFFFFFFB4B4B4FF111111FF000000FF3737
          37FFD7D7D7FFFFFFFFFFFDFDFDFFFEFEFEFFFEFEFEFFFBFBFBFFFDFDFDFFFEFE
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFDFD
          FDFFFEFEFEFFFCFCFCFFFDFDFDFFFFFFFFFFFFFFFFFF8B8B8BFF0D0D0DFF0000
          00FF414141FFE7E7E7FFFFFFFFFFFAFAFAFFFEFEFEFFFCFCFCFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFE
          FEFFFFFFFFFFFFFFFFFFFEFEFEFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFEFEFFFEFEFEFFFDFDFDFFFFFFFFFFFEFEFEFFFFFFFFFFFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFDFDFDFFFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFEFE
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFE
          FDFFF6FCF9FFFAFAFDFFFBF9FDFFFCFBFEFFFFFFFBFFFFFEF4FFFFFDF8FFFEF7
          FFFFFDF3FFFFF5F9EAFFD0E6A9FF74B933FF3F9E00FF419F00FFA0C974FFFFFF
          FFFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFBABABAFF222222FF000000FF4848
          48FFDCDCDCFFFFFFFFFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFDFDFDFFFCFC
          FCFFFEFEFEFFFEFEFEFFFEFEFEFFFDFDFDFFFEFEFEFFFDFDFDFFFEFEFEFFFDFD
          FDFFFCFCFCFFFFFFFFFFFAFAFAFFFEFEFEFFFFFFFFFFEFEFEFFF2D2D2DFF0A0A
          0AFF050505FFD4D4D4FFFFFFFFFFFFFFFFFFFCFCFCFFFDFDFDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFBFBFBFFFFFFFFFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
          FEFFFCFCFCFFFFFFFFFFFCFCFCFFFFFFFFFFFDFDFDFFFFFFFFFFFCFCFCFFFDFD
          FDFFFFFFFFFFFEFEFEFFFCFCFCFFF7F7F7FFFFFFFFFFFBFBFBFFFEFEFEFFFCFC
          FCFFFCFCFCFFFCFCFCFFF9F9F9FFFFFFFFFFFCFCFCFFFDFDFDFFFCFCFCFFFFFF
          FFFFFEFEFEFFFEFEFEFFFDFDFDFFFBFBFBFFFDFDFDFFFEFEFEFFFEFEFEFFFFFF
          FFFFFCFCFCFFFDFDFDFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
          FFFFF8F8F8FFFBFBFBFFFEFEFEFFFEFEFEFFFDFDFDFFFEFEFEFFFFFFFFFFFAFA
          FAFFFCFCFCFFFFFFFFFFFEFEFEFFFEFEFEFFFEFEFEFFFFFFFFFFFEFEFEFFFFFF
          FFFFFEFEFEFFFEFEFEFFF9F9F9FFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
          FFFFFFFBFDFFFBFCF6FFFFFFF5FFFFFFFBFFFFFEFFFFFEFBFFFFFFFDFFFFFFFF
          FDFFD7F3B9FF9DC567FF609425FF479200FF48A600FF4CA400FF9BBF73FFFFFE
          FFFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFBABABAFF242424FF000000FF4646
          46FFDCDCDCFFFFFFFFFFFCFCFCFFFFFFFFFFF7F7F7FFF8F8F8FFFFFFFFFFFEFE
          FEFFFFFFFFFFFFFFFFFFF7F7F7FFF9F9F9FFFFFFFFFFFDFDFDFFFCFCFCFFFEFE
          FEFFFDFDFDFFFDFDFDFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFF5B5B5BFF0F0F
          0FFF020202FF959595FFF9F9F9FFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFDFD
          FDFFFFFFFFFFFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFEFE
          FEFFFAFAFAFFFDFDFDFFFFFFFFFFFFFFFFFFF8F8F8FFFFFFFFFFFFFFFFFFFEFE
          FEFFFEFEFEFFFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFFFCFCFCFFFDFD
          FDFFFEFEFEFFFEFEFEFFFFFFFFFFFDFDFDFFFEFEFEFFFFFFFFFFFDFDFDFFFEFE
          FEFFFDFDFDFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFCFCFCFFFCFC
          FCFFFBFBFBFFFEFEFEFFFDFDFDFFFAFAFAFFFDFDFDFFFFFFFFFFFFFFFFFFFDFD
          FDFFFFFFFFFFFFFFFFFFFEFEFEFFFAFAFAFFFEFEFEFFFEFEFEFFFFFFFFFFFDFD
          FDFFFDFDFDFFFCFCFCFFFBFBFBFFFDFDFDFFFDFDFDFFFBFBFBFFFEFEFEFFFEFE
          FEFFFFFFFFFFFFFFFFFFFBFBFBFFFFFFFFFFFAFAFAFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
          FDFFFEFAF6FFFFFFF7FFFFFEF8FFFEFBFDFFFCF9FFFFFFFFFFFFEEFDE6FFB5D9
          94FF65B123FF559A04FF4A9400FF4AA400FF4FB100FF4AA200FF94B36BFFFFF9
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBFF262626FF000000FF4848
          48FFDCDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFFDFD
          FDFFFBFBFBFFFEFEFEFFFBFBFBFFFFFFFFFFFFFFFFFFFAFAFAFFFEFEFEFFFFFF
          FFFFFCFCFCFFFFFFFFFFFEFEFEFFF9F9F9FFFDFDFDFFFFFFFFFF999999FF2121
          21FF0A0A0AFF585858FFF1F1F1FFFDFDFDFFFFFFFFFFFEFEFEFFFFFFFFFFFAFA
          FAFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFF9F9F9FFFFFFFFFFFFFFFFFFFEFE
          FEFFFFFFFFFFFDFDFDFFFDFDFDFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFCFC
          FCFFFEFEFEFFFDFDFDFFFEFEFEFFFDFDFDFFFDFDFDFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF9F9F9FFFCFCFCFFFDFDFDFFF9F9F9FFFBFBFBFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFCFCFCFFFDFDFDFFFFFFFFFFFFFFFFFFFDFD
          FDFFFEFEFEFFFDFDFDFFFFFFFFFFFCFCFCFFFEFEFEFFFEFEFEFFFCFCFCFFFBFB
          FBFFFDFDFDFFFAFAFAFFFDFDFDFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFEFEFFF8F8F8FFFDFDFDFFFEFEFEFFFFFFFFFFF9F9F9FFFFFFFFFFFEFE
          FEFFFFFFFFFFFDFDFDFFFCFCFCFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FEFFFFFEFAFFFFF7FDFFFFF7FFFFFFFEFFFFF8FEFAFFCBE8AEFF86C04AFF4C96
          01FF3E9A00FF50A700FF57AD03FF4CAC00FF48AD00FF489F00FF92B169FFFFF6
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCBCBCFF292929FF000000FF4A4A
          4AFFE3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFAFAFAFFFFFF
          FFFFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFFFFFFFFFFFFFFFFFFE2E2E2FF3232
          32FF0A0A0AFF242424FFDDDDDDFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FFFEFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFDFDFDFFFAFAFAFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
          FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFFF8F8F8FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFDFDFDFFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFDFDFDFFFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFE
          FEFFFBFBFBFFF5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
          FFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFFFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
          FFFFFFFAFFFFFFFAFFFFFFFCFFFFE2F3D3FFABD675FF5BA50FFF419300FF4FA6
          00FF4DA806FF51A901FF51A303FF48A401FF4AAB00FF4DA300FF95B46BFFFFF7
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFBDBDBDFF2E2E2EFF000000FF5E5E
          5EFFDBDBDBFFBBBBBBFF7B7B7BFF868686FFC0C0C0FFFDFDFDFFFFFFFFFFFAFA
          FAFFFFFFFFFFFCFCFCFFD0D0D0FF8D8D8DFF7D7D7DFFB2B2B2FFFBFBFBFFC1C1
          C1FF9F9F9FFFA5A5A5FFE9E9E9FFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFF6060
          60FF151515FF080808FFAFAFAFFFFDFDFDFFFFFFFFFFFBFBFBFFFFFFFFFFF9F9
          F9FFB5B5B5FFA4A4A4FFA9A9A9FFEBEBEBFFFFFFFFFFFFFFFFFFE7E7E7FFA5A5
          A5FFA9A9A9FFB4B4B4FFF9F9F9FFFEFEFEFFF7F7F7FFBFBFBFFF9C9C9CFFACAC
          ACFFE2E2E2FFFDFDFDFFF6F6F6FFFFFFFFFFECECECFFB3B3B3FF858585FF7C7C
          7CFF8F8F8FFFC7C7C7FFFAFAFAFFFFFFFFFFFFFFFFFFF3F3F3FFBDBDBDFF9D9D
          9DFFABABABFFE1E1E1FFFFFFFFFFFFFFFFFFDCDCDCFFA7A7A7FF9C9C9CFFC1C1
          C1FFF9F9F9FFFFFFFFFFE1E1E1FFA8A8A8FF9A9A9AFFC0C0C0FFF6F6F6FFFDFD
          FDFFFBFBFBFFFFFFFFFFEBEBEBFFB3B3B3FF808080FF7D7D7DFF929292FFC9C9
          C9FFFFFFFFFFFFFFFFFFF0F0F0FFAAAAAAFFA3A3A3FFA8A8A8FFA6A6A6FFA2A2
          A2FFA8A8A8FFA9A9A9FFAAAAAAFF9F9F9FFFD8D8D8FFFDFDFDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF2FFEBFFBDDD9FFF70AC2EFF4A9C00FF4DA700FF52AA01FF50A5
          05FF51A503FF53A403FF58A40BFF4EA606FF48A700FF449A00FF8EB263FFFFF8
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFBEBEBEFF313131FF090909FF5C5C
          5CFF777777FF1D1D1DFF000000FF010101FF242424FFB2B2B2FFFCFCFCFFFBFB
          FBFFFFFFFFFFB8B8B8FF3D3D3DFF020202FF000000FF0F0F0FFF929292FF3B3B
          3BFF080808FF141414FFCBCBCBFFFFFFFFFFFAFAFAFFFFFFFFFFFFFFFFFF9A9A
          9AFF333333FF0F0F0FFF6F6F6FFFF3F3F3FFFFFFFFFFF7F7F7FFFFFFFFFFF5F5
          F5FF454545FF090909FF161616FFC7C7C7FFFFFFFFFFFAFAFAFFB6B6B6FF0909
          09FF0E0E0EFF444444FFF7F7F7FFFFFFFFFFEAEAEAFF565656FF020202FF2121
          21FFA3A3A3FFFFFFFFFFFFFFFFFFE5E5E5FF6E6E6EFF151515FF000000FF0000
          00FF000000FF2A2A2AFF9F9F9FFFFFFFFFFFFFFFFFFFDEDEDEFF454545FF0000
          00FF2F2F2FFFB8B8B8FFFFFFFFFFFFFFFFFFABABABFF121212FF000000FF5656
          56FFECECECFFFFFFFFFFB2B2B2FF1E1E1EFF000000FF4F4F4FFFDADADAFFFFFF
          FFFFFFFFFFFFE7E7E7FF6F6F6FFF151515FF000000FF000000FF000000FF3434
          34FFB6B6B6FFF5F5F5FFECECECFF404040FF040404FF121212FF111111FF0E0E
          0EFF0A0A0AFF0B0B0BFF0B0B0BFF0B0B0BFF929292FFF9F9F9FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFCBEDB9FF91C564FF579D0DFF4A9C00FF52A800FF53A803FF4EA204FF50A3
          04FF5AA900FF5CA803FF5AA208FF4CA106FF49A701FF479B00FF88AD59FFF8F4
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFBFBFBFFF333333FF161616FF2B2B
          2BFF1B1B1BFF1F1F1FFF1F1F1FFF171717FF070707FF474747FFDFDFDFFFFFFF
          FFFFFAFAFAFF5E5E5EFF090909FF151515FF2B2B2BFF252525FF222222FF2323
          23FF181818FF1B1B1BFFD7D7D7FFFFFFFFFFFCFCFCFFFBFBFBFFFFFFFFFF9F9F
          9FFF303030FF1B1B1BFF333333FFEAEAEAFFFFFFFFFFFDFDFDFFFFFFFFFFFCFC
          FCFF404040FF1E1E1EFF1C1C1CFFD3D3D3FFFFFFFFFFF7F7F7FFBCBCBCFF1919
          19FF1A1A1AFF484848FFFFFFFFFFFEFEFEFFEEEEEEFF5E5E5EFF131313FF2C2C
          2CFFA9A9A9FFFFFFFFFFF5F5F5FF979797FF0E0E0EFF0E0E0EFF272727FF4848
          48FF202020FF060606FF313131FFC6C6C6FFFFFFFFFFDDDDDDFF525252FF0707
          07FF333333FFBEBEBEFFFFFFFFFFFFFFFFFFB0B0B0FF191919FF050505FF6565
          65FFF0F0F0FFFFFFFFFFB8B8B8FF2F2F2FFF030303FF585858FFDFDFDFFFFFFF
          FFFFFFFFFFFF818181FF121212FF070707FF333333FF484848FF1E1E1EFF0808
          08FF272727FFD3D3D3FFFFFFFFFF8F8F8FFF232323FF181818FF1A1A1AFF2323
          23FF171717FF161616FF141414FF070707FFA1A1A1FFF9F9F9FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFBFFFBFFFDFFFBFFFCFFF9FFFBFE
          F8FFFFFCFFFFFFFFFCFFFFFFFAFFFCFCFCFFFFFEFFFFFFFFFFFFE9FDD8FFAED3
          85FF67B123FF519D00FF4BA000FF54AC00FF52A801FF4EA303FF4FA403FF52A7
          00FF55AA00FF54A302FF5EA205FF55A201FF4BA900FF39A100FF7EAA6AFFF8E9
          F9FFFFFFFFFFFEFEFEFFFDFDFDFFFFFFFFFFC1C1C1FF373737FF1B1B1BFF1111
          11FF626262FFBFBFBFFF949494FF2F2F2FFF151515FF1D1D1DFFB6B6B6FFFFFF
          FFFFBFBFBFFF3B3B3BFF131313FF2C2C2CFF9C9C9CFFBFBFBFFF585858FF2121
          21FF1E1E1EFF262626FFD5D5D5FFFFFFFFFFFFFFFFFFFCFCFCFFFFFFFFFF6969
          69FF1C1C1CFF252525FF1B1B1BFFBFBFBFFFFDFDFDFFFCFCFCFFFFFFFFFFFAFA
          FAFF434343FF262626FF242424FFD8D8D8FFFFFFFFFFFBFBFBFFC1C1C1FF1D1D
          1DFF242424FF4D4D4DFFFFFFFFFFFEFEFEFFEEEEEEFF656565FF1C1C1CFF3232
          32FFA8A8A8FFFFFFFFFFDCDCDCFF3F3F3FFF0E0E0EFF373737FFA6A6A6FFD3D3
          D3FF959595FF212121FF141414FF6B6B6BFFFFFFFFFFE5E5E5FF5A5A5AFF0A0A
          0AFF373737FFBBBBBBFFFFFFFFFFFFFFFFFFB2B2B2FF242424FF0F0F0FFF6565
          65FFEDEDEDFFFFFFFFFFB8B8B8FF343434FF090909FF5B5B5BFFE6E6E6FFFFFF
          FFFFD9D9D9FF3D3D3DFF0D0D0DFF393939FFA6A6A6FFD5D5D5FF797979FF2121
          21FF050505FF979797FFFAFAFAFFEAEAEAFF494949FF1D1D1DFF181818FF6767
          67FFA6A6A6FFA9A9A9FFA2A2A2FF9E9E9EFFE0E0E0FFFAFAFAFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFCFFFAFFF9FFF7FDF7FFF9FEF9FFFCFF
          F9FFFFFCFBFFFEF7FDFFFBF5FCFFFFFFFFFFFCFFF8FFC0E1A3FF7FB941FF56A0
          01FF4BA200FF53A800FF51A902FF4DA501FF49A300FF4BA400FF4CA500FF55A7
          02FF56A704FF4CA602FF54A302FF4A9D00FF49A515FF37AD38FF78B488FFF5E5
          E7FFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFC2C2C2FF3A3A3AFF181818FF2B2B
          2BFFC1C1C1FFFFFFFFFFFFFFFFFF646464FF191919FF121212FF969696FFFFFF
          FFFF959595FF2C2C2CFF181818FF5C5C5CFFF0F0F0FFFFFFFFFFB7B7B7FF3737
          37FF202020FF252525FFD0D0D0FFFFFFFFFFFDFDFDFFFFFFFFFFF1F1F1FF4141
          41FF1D1D1DFF272727FF1C1C1CFF7F7F7FFFFAFAFAFFFCFCFCFFFFFFFFFFFBFB
          FBFF4B4B4BFF262626FF2A2A2AFFD6D6D6FFFFFFFFFFFCFCFCFFBFBFBFFF2020
          20FF272727FF4D4D4DFFFFFFFFFFFFFFFFFFEFEFEFFF696969FF1D1D1DFF3535
          35FFA4A4A4FFFFFFFFFFC1C1C1FF131313FF1E1E1EFF616161FFFFFFFFFFFFFF
          FFFFE4E4E4FF383838FF010101FF464646FFF1F1F1FFEDEDEDFF5A5A5AFF0F0F
          0FFF393939FFB8B8B8FFFFFFFFFFFFFFFFFFB6B6B6FF252525FF111111FF6363
          63FFEAEAEAFFFFFFFFFFB8B8B8FF373737FF111111FF5A5A5AFFE0E0E0FFFFFF
          FFFFA9A9A9FF313131FF171717FF757575FFFAFAFAFFFFFFFFFFE2E2E2FF3D3D
          3DFF060606FF4B4B4BFFE4E4E4FFFFFFFFFF787878FF282828FF191919FF6666
          66FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFEFFFFFFFEFFFCFBFDFFFEF8FFFFFFFC
          FEFFF9FEF3FFFFFAFFFFFFFDFFFFDDEBDAFF9DCA6BFF60A912FF4C9B00FF50A1
          02FF4EA708FF4CA505FF4CA404FF4CA300FF4CA401FF4DA500FF4DA600FF58A3
          02FF5C9F03FF43A700FF41A700FF41A729FF53B56BFF47BE8AFF73BB99FFE9E5
          DEFFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFC3C3C3FF3D3D3DFF161616FF5050
          50FFD6D6D6FFFFFFFFFFFFFFFFFF909090FF202020FF0C0C0CFF848484FFFFFF
          FFFF8F8F8FFF202020FF191919FF8B8B8BFFF5F5F5FFFFFFFFFFE5E5E5FF4B4B
          4BFF222222FF252525FFCCCCCCFFFFFFFFFFFDFDFDFFFFFFFFFFB6B6B6FF3333
          33FF2D2D2DFF2D2D2DFF232323FF484848FFECECECFFFFFFFFFFFCFCFCFFFAFA
          FAFF4C4C4CFF282828FF2B2B2BFFD2D2D2FFFFFFFFFFFDFDFDFFC0C0C0FF2121
          21FF282828FF4F4F4FFFFDFDFDFFFFFFFFFFEFEFEFFF6A6A6AFF1E1E1EFF3737
          37FFACACACFFFFFFFFFFA4A4A4FF151515FF272727FF848484FFFFFFFFFFFFFF
          FFFFEBEBEBFF7B7B7BFF2C2C2CFF5E5E5EFFDDDDDDFFE9E9E9FF595959FF1414
          14FF393939FFB7B7B7FFFFFFFFFFFFFFFFFFB4B4B4FF2A2A2AFF161616FF6161
          61FFE6E6E6FFFFFFFFFFBBBBBBFF383838FF141414FF565656FFDEDEDEFFFFFF
          FFFF8A8A8AFF272727FF0F0F0FFFA5A5A5FFFFFFFFFFFFFFFFFFFEFEFEFF6D6D
          6DFF373737FF616161FFDADADAFFFFFFFFFFD2D2D2FF3E3E3EFF272727FF2222
          22FFB7B7B7FFFCFCFCFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFBFFFFFFF8FFFFFFF7FFFFFFFB
          FFFFFCFFFFFFF4FFF2FFB4D59BFF6DA635FF58A201FF50A800FF4DA700FF52AA
          02FF4BA20CFF4BA106FF4DA201FF52A500FF57AA00FF58AC00FF55AA00FF56A2
          00FF509D00FF3FAA12FF49BA40FF4CC67CFF4FCC98FF39C193FF64B09DFFE2DC
          E0FFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFC3C3C3FF404040FF191919FF5B5B
          5BFFD9D9D9FFFFFFFFFFFFFFFFFF9D9D9DFF262626FF141414FF757575FFFCFC
          FCFF808080FF1F1F1FFF131313FF9C9C9CFFFEFEFEFFFFFFFFFFF9F9F9FF5656
          56FF272727FF262626FFC7C7C7FFFFFFFFFFFFFFFFFFFFFFFFFF797979FF2D2D
          2DFF444444FF595959FF333333FF2B2B2BFFC2C2C2FFFDFDFDFFFCFCFCFFFBFB
          FBFF4F4F4FFF2C2C2CFF303030FFCBCBCBFFFEFEFEFFFDFDFDFFC0C0C0FF2424
          24FF2C2C2CFF505050FFF7F7F7FFFFFFFFFFF0F0F0FF6C6C6CFF212121FF3A3A
          3AFFA0A0A0FFFFFFFFFF9B9B9BFF1C1C1CFF303030FF989898FFFFFFFFFFFFFF
          FFFFFFFFFFFFEFEFEFFFDDDDDDFFE6E6E6FFF9F9F9FFE5E5E5FF636363FF1919
          19FF3A3A3AFFB4B4B4FFFFFFFFFFFFFFFFFFB4B4B4FF2C2C2CFF1B1B1BFF5F5F
          5FFFE1E1E1FFFFFFFFFFBDBDBDFF3A3A3AFF191919FF525252FFDBDBDBFFFFFF
          FFFF787878FF222222FF161616FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFEDED
          EDFFDEDEDEFFEDEDEDFFFCFCFCFFFFFFFFFFFFFFFFFF626262FF2D2D2DFF1F1F
          1FFF6B6B6BFFF3F3F3FFFDFDFDFFFEFEFEFFFDFDFDFFFDFDFDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFBFFFFFFFDFFFFFFFFFFFFFEFF
          FBFFCDEDC6FF89BC5EFF5AA40EFF50A700FF50A700FF53A807FF51A609FF499F
          00FF51A102FF57A401FF5AA901FF5DAA00FF5AA700FF56A500FF50A200FF4FA3
          07FF4BAF2FFF4CC063FF4CC496FF3BC49CFF3DCC8AFF35CA81FF66AB94FFE0D1
          DCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4C4C4FF424242FF1C1C1CFF5D5D
          5DFFDDDDDDFFFFFFFFFFFFFFFFFF9F9F9FFF2E2E2EFF212121FF6B6B6BFFEDED
          EDFF767676FF252525FF171717FF9E9E9EFFFFFFFFFFFFFFFFFFFFFFFFFF5E5E
          5EFF2D2D2DFF282828FFC0C0C0FFFFFFFFFFFFFFFFFFFCFCFCFF535353FF2D2D
          2DFF5E5E5EFF9F9F9FFF3D3D3DFF2F2F2FFF8B8B8BFFF5F5F5FFFFFFFFFFFBFB
          FBFF535353FF313131FF353535FFC3C3C3FFFEFEFEFFFDFDFDFFC0C0C0FF2929
          29FF313131FF505050FFF0F0F0FFFFFFFFFFF0F0F0FF707070FF252525FF3C3C
          3CFF9A9A9AFFFFFFFFFF909090FF1E1E1EFF373737FF868686FFDFDFDFFFD7D7
          D7FFD7D7D7FFDEDEDEFFE3E3E3FFE4E4E4FFF6F6F6FFE3E3E3FF626262FF1D1D
          1DFF3D3D3DFFB1B1B1FFFFFFFFFFFFFFFFFFB5B5B5FF2F2F2FFF1F1F1FFF5D5D
          5DFFDCDCDCFFFFFFFFFFBEBEBEFF3F3F3FFF1F1F1FFF505050FFD9D9D9FFFFFF
          FFFF707070FF242424FF2C2C2CFF909090FFC8C8C8FFC8C8C8FFC4C4C4FFC8C8
          C8FFCACACAFFC9C9C9FFE6E6E6FFFEFEFEFFFFFFFFFFB4B4B4FF383838FF3131
          31FF343434FFCCCCCCFFFCFCFCFFFDFDFDFFFFFFFFFFFBFBFBFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFFFEFFFFFFF1FFDFF4C5FFADD2
          8CFF5DA51EFF57A402FF51A800FF52AC00FF4EA400FF4A9D03FF4DA00AFF53A5
          0BFF56A400FF5DA900FF5EA900FF55A100FF499900FF479F0FFF4FAD22FF55B8
          47FF4DC380FF47CA8FFF3EC2A1FF2DBB98FF36C584FF38CA7CFF6BAF85FFDFD1
          CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C5C5FF454545FF1F1F1FFF5B5B
          5BFFDBDBDBFFFFFFFFFFFFFFFFFFA9A9A9FF3A3A3AFF262626FF6A6A6AFFEBEB
          EBFF787878FF2B2B2BFF252525FF9B9B9BFFF9F9F9FFFFFFFFFFFFFFFFFF6363
          63FF303030FF2E2E2EFFBABABAFFFEFEFEFFFFFFFFFFD4D4D4FF434343FF2929
          29FF797979FFDCDCDCFF464646FF363636FF5E5E5EFFE6E6E6FFFFFFFFFFFCFC
          FCFF565656FF343434FF393939FFBDBDBDFFFEFEFEFFFDFDFDFFC1C1C1FF2D2D
          2DFF353535FF515151FFE7E7E7FFFFFFFFFFEFEFEFFF727272FF282828FF3C3C
          3CFF9E9E9EFFFFFFFFFF878787FF222222FF393939FF404040FF535353FF4B4B
          4BFF494949FF515151FF484848FF5A5A5AFFB8B8B8FFF3F3F3FF676767FF2121
          21FF424242FFACACACFFFFFFFFFFFFFFFFFFB8B8B8FF323232FF222222FF5D5D
          5DFFD9D9D9FFFFFFFFFFC1C1C1FF444444FF242424FF505050FFD9D9D9FFFFFF
          FFFF717171FF292929FF3B3B3BFF424242FF484848FF434343FF3E3E3EFF4949
          49FF4E4E4EFF3D3D3DFFC4C4C4FFFFFFFFFFFFFFFFFFF8F8F8FF595959FF2E2E
          2EFF2C2C2CFF898989FFF3F3F3FFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFF4FAEAFFBCD89CFF76AF43FF509A
          0EFF53AF00FF4DA200FF50A100FF50A204FF4DA100FF50A601FF4FA404FF4B9E
          03FF57AA00FF53A500FF4DA100FF469D09FF40A021FF44B048FF4CC46CFF51CB
          8DFF49C6A4FF34C288FF37C28AFF3BC795FF41C68CFF37C282FF65AE88FFDAD0
          CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6C6C6FF484848FF242424FF5959
          59FFD5D5D5FFFFFFFFFFFFFFFFFFA9A9A9FF383838FF222222FF686868FFE5E5
          E5FF787878FF292929FF2B2B2BFF929292FFF3F3F3FFFFFFFFFFFFFFFFFF6666
          66FF323232FF353535FFB3B3B3FFFCFCFCFFFFFFFFFF979797FF3D3D3DFF2C2C
          2CFF969696FFFDFDFDFF666666FF3A3A3AFF444444FFC3C3C3FFFCFCFCFFFDFD
          FDFF595959FF373737FF3C3C3CFFB7B7B7FFFDFDFDFFFDFDFDFFC2C2C2FF3131
          31FF393939FF515151FFE0E0E0FFFFFFFFFFEFEFEFFF767676FF2C2C2CFF4040
          40FF9C9C9CFFFFFFFFFF939393FF2E2E2EFF393939FF2B2B2BFF353535FF3535
          35FF363636FF2F2F2FFF292929FF3D3D3DFFADADADFFFCFCFCFF686868FF2525
          25FF454545FFA5A5A5FFFFFFFFFFFFFFFFFFB9B9B9FF363636FF252525FF6060
          60FFD6D6D6FFFFFFFFFFC1C1C1FF494949FF282828FF535353FFD8D8D8FFFFFF
          FFFF7C7C7CFF2B2B2BFF323232FF343434FF3A3A3AFF383838FF333333FF3535
          35FF313131FF292929FFC4C4C4FFFCFCFCFFFFFFFFFFFFFFFFFF9D9D9DFF3737
          37FF363636FF4F4F4FFFCBCBCBFFF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFF5FCE6FF94C767FF439A00FF3EA7
          00FF54A204FF57A809FF54A403FF51A401FF55AC00FF51A900FF4EA600FF53AB
          00FF50AC00FF47A200FF45A102FF4CAF28FF52C25BFF4BCC86FF36C89FFF32BF
          A2FF41C295FF38CA88FF41C984FF40CA88FF44C883FF3BC58AFF5BA69EFFCBC5
          D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7C7FF4B4B4BFF282828FF5757
          57FFCCCCCCFFFFFFFFFFFFFFFFFFA3A3A3FF363636FF292929FF727272FFE2E2
          E2FF7F7F7FFF2D2D2DFF2D2D2DFF888888FFF1F1F1FFFFFFFFFFFCFCFCFF6666
          66FF303030FF383838FFB0B0B0FFF9F9F9FFFFFFFFFF676767FF393939FF3838
          38FFACACACFFFFFFFFFF8F8F8FFF3F3F3FFF393939FF9E9E9EFFEFEFEFFFFEFE
          FEFF5B5B5BFF3A3A3AFF3E3E3EFFB4B4B4FFFEFEFEFFFDFDFDFFC2C2C2FF3434
          34FF3C3C3CFF4F4F4FFFDCDCDCFFFFFFFFFFEFEFEFFF787878FF2F2F2FFF4646
          46FF929292FFFFFFFFFF9F9F9FFF2B2B2BFF3A3A3AFF7A7A7AFFD5D5D5FFE3E3
          E3FFC1C1C1FF4F4F4FFF323232FF434343FFBFBFBFFFF1F1F1FF636363FF2A2A
          2AFF484848FFA0A0A0FFFFFFFFFFFFFFFFFFBBBBBBFF393939FF272727FF6161
          61FFD7D7D7FFFFFFFFFFC1C1C1FF4B4B4BFF2B2B2BFF575757FFC8C8C8FFFFFF
          FFFF888888FF303030FF343434FF858585FFC9C9C9FFE4E4E4FFC4C4C4FF5454
          54FF2D2D2DFF4B4B4BFFB7B7B7FFFBFBFBFFFCFCFCFFFFFFFFFFE6E6E6FF5555
          55FF343434FF363636FF979797FFE9E9E9FFFCFCFCFFFEFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFEFFFFF7FDFAFFEAF8E2FFCAE3B5FF94B9
          71FF48A500FF55A602FF58A305FF57A401FF57AA00FF57A900FF59A601FF56A2
          03FF479D02FF47A926FF48B757FF46C480FF3FC893FF39C793FF3AC68CFF3AC3
          8CFF37BF92FF3AC38BFF3FC786FF4BC686FF54C78BFF2EC38DFF64AF94FFDDC9
          C8FFFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C9C9FF4E4E4EFF303030FF5858
          58FFBDBDBDFFFFFFFFFFFFFFFFFF999999FF363636FF2A2A2AFF797979FFE9E9
          E9FF838383FF3E3E3EFF2E2E2EFF7F7F7FFFE0E0E0FFFFFFFFFFF0F0F0FF5D5D
          5DFF3A3A3AFF3D3D3DFFA9A9A9FFFDFDFDFFE3E3E3FF4F4F4FFF3E3E3EFF4F4F
          4FFFC1C1C1FFFFFFFFFFC0C0C0FF414141FF414141FF767676FFDDDDDDFFF6F6
          F6FF686868FF383838FF444444FFAEAEAEFFF6F6F6FFF7F7F7FFC8C8C8FF3434
          34FF3E3E3EFF5B5B5BFFD5D5D5FFF9F9F9FFF2F2F2FF797979FF333333FF4A4A
          4AFF9C9C9CFFF7F7F7FFB1B1B1FF262626FF454545FF858585FFF0F0F0FFFFFF
          FFFFDDDDDDFF535353FF323232FF4E4E4EFFD1D1D1FFF0F0F0FF676767FF2E2E
          2EFF494949FFA2A2A2FFF5F5F5FFFFFFFFFFBCBCBCFF3C3C3CFF2A2A2AFF6565
          65FFCECECEFFFFFFFFFFC3C3C3FF515151FF2E2E2EFF5B5B5BFFC5C5C5FFFFFF
          FFFF9A9A9AFF3D3D3DFF2C2C2CFF8E8E8EFFEDEDEDFFFFFFFFFFD2D2D2FF5454
          54FF3A3A3AFF515151FFC1C1C1FFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFF9191
          91FF3D3D3DFF3C3C3CFF6B6B6BFFD4D4D4FFEAEAEAFFFDFDFDFFFAFAFAFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFFFFFAFDFEFFFEFFFAFFFDFFF1FFEEF8
          DDFFBFE4AEFF83B34FFF569705FF50A100FF50AA00FF49A100FF4B9D00FF4FA4
          09FF49B23FFF54C661FF4DCC83FF39C58EFF31BF91FF38C290FF43C98DFF47C7
          8CFF3FC18FFF3BC489FF3BC986FF42C685FF4BC78EFF2CC693FF69AF92FFDCC1
          BFFFF8FAFBFFFFFFFFFFFCFCFCFFFFFFFFFFC8C8C8FF4E4E4EFF353535FF4B4B
          4BFFA5A5A5FFFEFEFEFFFFFFFFFF838383FF303030FF333333FF8E8E8EFFF4F4
          F4FF9D9D9DFF424242FF313131FF6B6B6BFFD5D5D5FFFFFFFFFFD2D2D2FF5858
          58FF363636FF434343FFA9A9A9FFFFFFFFFFB0B0B0FF4C4C4CFF3A3A3AFF6161
          61FFCCCCCCFFFFFFFFFFE7E7E7FF575757FF414141FF5D5D5DFFC8C8C8FFE9E9
          E9FF5F5F5FFF4A4A4AFF454545FFA5A5A5FFEFEFEFFFFDFDFDFFB8B8B8FF3737
          37FF474747FF4B4B4BFFD1D1D1FFFDFDFDFFEFEFEFFF6B6B6BFF393939FF4747
          47FF999999FFFCFCFCFFC0C0C0FF373737FF393939FF6E6E6EFFE6E6E6FFFFFF
          FFFFCFCFCFFF444444FF343434FF676767FFDDDDDDFFDFDFDFFF6E6E6EFF3434
          34FF4B4B4BFF989898FFF4F4F4FFFFFFFFFFB6B6B6FF3F3F3FFF323232FF6767
          67FFC3C3C3FFFFFFFFFFC7C7C7FF464646FF272727FF626262FFC2C2C2FFFFFF
          FFFFB2B2B2FF464646FF383838FF808080FFD4D4D4FFFFFFFFFFBABABAFF5151
          51FF2F2F2FFF737373FFD3D3D3FFFEFEFEFFFDFDFDFFFFFFFFFFFFFFFFFFCFCF
          CFFF585858FF3C3C3CFF474747FFB7B7B7FFE1E1E1FFF9F9F9FFFFFFFFFFFDFD
          FDFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFDFFFFFFFAFBFFFFFFF8FFFFFF
          F8FFFDF5FDFFEAF7E5FFB7E296FF83BE43FF5A9E0AFF449807FF42AE2DFF47C3
          56FF49C47FFF49CC89FF3DC991FF30C18EFF32BF8FFF3EC490FF48C48CFF46C4
          89FF3FC78AFF42C888FF43CB88FF3FC184FF3FC08BFF27CD9DFF67BCA2FFD3C1
          C0FFF6F5F6FFFFFFFFFFFAFAFAFFFFFFFFFFC9C9C9FF505050FF3F3F3FFF3B3B
          3BFF787878FFD7D7D7FFABABABFF575757FF3F3F3FFF464646FFA0A0A0FFFDFD
          FDFFBDBDBDFF4C4C4CFF414141FF464646FF999999FFD7D7D7FF797979FF4949
          49FF404040FF434343FFB6B6B6FFF2F2F2FF777777FF494949FF3E3E3EFF8383
          83FFD6D6D6FFF7F7F7FFFEFEFEFF737373FF3F3F3FFF4D4D4DFFB6B6B6FFD7D7
          D7FF5C5C5CFF434343FF404040FF696969FFC9C9C9FFD2D2D2FF777777FF4646
          46FF3B3B3BFF4E4E4EFF929292FFCCCCCCFFC5C5C5FF4B4B4BFF414141FF5555
          55FF939393FFF1F1F1FFDCDCDCFF616161FF3A3A3AFF595959FFB8B8B8FFE2E2
          E2FF8A8A8AFF393939FF3F3F3FFF848484FFFBFBFBFFE8E8E8FF6D6D6DFF3333
          33FF393939FF747474FFD4D4D4FFD5D5D5FF797979FF373737FF373737FF7C7C
          7CFFD4D4D4FFF6F6F6FFC2C2C2FF5B5B5BFF3D3D3DFF616161FFB8B8B8FFFDFD
          FDFFCFCFCFFF5C5C5CFF353535FF5F5F5FFFB9B9B9FFDCDCDCFF797979FF4343
          43FF393939FF989898FFE0E0E0FFDEDEDEFFD8D8D8FFC4C4C4FFBCBCBCFFB9B9
          B9FF626262FF474747FF404040FF888888FFD4D4D4FFDDDDDDFFFCFCFCFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFBFFFFFFF9FFFFFFFBFEFFFFFE
          FFFFFFFFFBFFFFFEFFFFFFFFF7FFE5FAD6FF98D692FF4FB969FF33C074FF39CF
          90FF44C595FF37BF8BFF34C08BFF38C691FF3DC892FF40C48EFF46C18BFF48C5
          8CFF3EC988FF42C284FF43C486FF3EC189FF3CCE9DFF26E7B8FF5AD1B8FFBFBF
          BFFFF1ECEDFFFFFFFFFFFEFEFEFFFFFFFFFFCBCBCBFF555555FF3D3D3DFF4E4E
          4EFF4A4A4AFF484848FF515151FF414141FF424242FF676767FFB9B9B9FFF8F8
          F8FFEAEAEAFF737373FF434343FF474747FF525252FF494949FF494949FF4A4A
          4AFF494949FF3E3E3EFFC8C8C8FFC7C7C7FF5A5A5AFF434343FF424242FFA7A7
          A7FFD8D8D8FFF0F0F0FFFFFFFFFF9D9D9DFF484848FF474747FF919191FFD5D5
          D5FF565656FF444444FF545454FF4E4E4EFF484848FF4E4E4EFF454545FF4444
          44FF494949FF606060FF454545FF555555FF484848FF474747FF3E3E3EFF5858
          58FFB5B5B5FFECECECFFFAFAFAFFA1A1A1FF414141FF444444FF565656FF5353
          53FF424242FF3E3E3EFF666666FFBEBEBEFFF6F6F6FFE5E5E5FF737373FF3D3D
          3DFF494949FF4A4A4AFF555555FF505050FF444444FF474747FF3D3D3DFF9595
          95FFD2D2D2FF808080FF555555FF4A4A4AFF3F3F3FFF4D4D4DFF515151FFA8A8
          A8FFE0E0E0FF777777FF3F3F3FFF3F3F3FFF5A5A5AFF575757FF484848FF3F3F
          3FFF626262FFC7C7C7FFFCFCFCFF787878FF4B4B4BFF464646FF484848FF5151
          51FF454545FF444444FF444444FF525252FFC7C7C7FFD8D8D8FFE8E8E8FFF9F9
          F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFCFFFFFFFBFFFFFEFCFFFFFDFD
          FFFFFBFFFCFFFDFFF6FFF2FCF2FFBDF3F1FF74E2E4FF40D2C7FF35CBA9FF3ECB
          99FF42C293FF3DC08CFF3DC389FF43C98AFF45C98AFF43C389FF45C48FFF4BC4
          90FF49C084FF3DBE85FF30CC92FF2BDFA7FF31F2C3FF26FFD8FF5BD8C2FFBCB7
          B8FFEDE8E9FFFFFFFFFFFFFFFFFFFFFFFFFFCBCBCBFF656565FF454545FF7474
          74FF797979FF595959FF4A4A4AFF515151FF585858FF969696FFDFDFDFFFFCFC
          FCFFFFFFFFFFB7B7B7FF575757FF444444FF4C4C4CFF4F4F4FFF7F7F7FFF5D5D
          5DFF4F4F4FFF4C4C4CFFC6C6C6FFA2A2A2FF5C5C5CFF4C4C4CFF4E4E4EFFC6C6
          C6FFDCDCDCFFF0F0F0FFFFFFFFFFC4C4C4FF616161FF505050FF646464FFD5D5
          D5FF5B5B5BFF525252FF515151FF949494FF525252FF4F4F4FFF4D4D4DFF5454
          54FF6E6E6EFFB8B8B8FF6C6C6CFF545454FF484848FF4B4B4BFF5B5B5BFF7E7E
          7EFFDCDCDCFFE4E4E4FFFFFFFFFFE9E9E9FF858585FF4D4D4DFF454545FF5252
          52FF4B4B4BFF656565FFA4A4A4FFEEEEEEFFFFFFFFFFE8E8E8FF7C7C7CFF4545
          45FF606060FF7B7B7BFF6C6C6CFF505050FF494949FF494949FF5F5F5FFFC9C9
          C9FFDCDCDCFF727272FF434343FF4C4C4CFF484848FF4A4A4AFF464646FF9393
          93FFF3F3F3FFD4D4D4FF7A7A7AFF474747FF525252FF505050FF494949FF5F5F
          5FFFABABABFFECECECFFFFFFFFFF787878FF4B4B4BFF545454FF525252FF5050
          50FF515151FF565656FF515151FF494949FFB1B1B1FFDEDEDEFFE8E8E8FFF8F8
          F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFF9FBFEFFF2FCFEFFF4FE
          FFFFF9F7FDFFC8F6F9FF79E7E2FF3ED0C3FF31C9B8FF3ED2BFFF43D8C3FF3FD4
          B9FF43CC9DFF42CA98FF3FC38AFF3EC082FF42C485FF44C68BFF3DC28CFF3EBC
          89FF47BF90FF3BD5A3FF26EEBAFF14FFCDFF15FFD8FF19FFDFFF6ED8C6FFD2B9
          BDFFE8E8E7FFFDFDFDFFFEFEFEFFFFFFFFFFE5E5E5FFB6B6B6FFA8A8A8FFD0D0
          D0FFF8F8F8FFC1C1C1FF878787FF959595FFCECECEFFFAFAFAFFFFFFFFFFF4F4
          F4FFFCFCFCFFFFFFFFFFD1D1D1FF929292FF919191FFC1C1C1FFECECECFFC6C6
          C6FFB1B1B1FFB9B9B9FFEFEFEFFFD7D7D7FFB6B6B6FFB6B6B6FFBBBBBBFFF7F7
          F7FFF5F5F5FFFEFEFEFFFEFEFEFFF5F5F5FFB8B8B8FFB8B8B8FFB7B7B7FFEBEB
          EBFFBFBFBFFFB9B9B9FFB0B0B0FFF8F8F8FFD5D5D5FFA8A8A8FF888888FFA7A7
          A7FFE4E4E4FFFFFFFFFFE9E9E9FFABABABFF8B8B8BFF949494FFB4B4B4FFF3F3
          F3FFFFFFFFFFFBFBFBFFFDFDFDFFFFFFFFFFF0F0F0FFB8B8B8FF939393FF8787
          87FFA9A9A9FFDDDDDDFFFFFFFFFFFCFCFCFFFFFFFFFFF2F2F2FFC5C5C5FFACAC
          ACFFC5C5C5FFF8F8F8FFE1E1E1FF9F9F9FFF8A8A8AFFA7A7A7FFDCDCDCFFFFFF
          FFFFF6F6F6FFD1D1D1FF8F8F8FFF4F4F4FFF464646FF656565FF878787FFBBBB
          BBFFEEEEEEFFFFFFFFFFEFEFEFFFBFBFBFFF8E8E8EFF868686FFAFAFAFFFE0E0
          E0FFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFFBABABAFFB2B2B2FFB2B2B2FFBBBB
          BBFFAEAEAEFFB8B8B8FFAEAEAEFFB2B2B2FFD3D3D3FFFBFBFBFFFEFEFEFFFDFD
          FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFBFFFAFFFEFFF0FFFDFFDCF8
          F5FF99E8E0FF5BD0CCFF28C9C0FF27D8BFFF37E0B9FF3ED9B3FF3CD6BCFF3AD8
          C5FF36D7BAFF3AD2B0FF3ECCA2FF40C693FF40C58CFF3FC68AFF3EC889FF37CF
          95FF29E2B8FF35F5CAFF2AFFD8FF19FEDEFF10FED8FF12FFD9FF73DACAFFD9C1
          C5FFE2E2E2FFF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFF9F9F9FFFCFC
          FCFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF9F9F9FFFDFDFDFFFBFBFBFFFFFFFFFFFAFAFAFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFAFAFAFFFFFFFFFFFCFCFCFFF5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFFDFDFDFFFEFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
          FEFFFEFEFEFFFFFFFFFFD0D0D0FF636363FF464646FF808080FFEAEAEAFFECEC
          ECFFD1D1D1FFF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFDFD
          FDFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFF8FEF9FFE0FBF4FFB9F3E4FF83D8
          C7FF22D7BCFF3CD7B9FF44D7B7FF37D6BEFF26D6C5FF26D5C2FF38D4B6FF40D7
          B4FF2CDAC8FF38D9C2FF46DBBFFF49D7B4FF3DC89EFF34C795FF44D8A0FF39F3
          BDFF0EFFDBFF29FFD9FF27FDD6FF22FCD9FF29FCDCFF15FFDBFF62DFC9FFD4C5
          C7FFDFDCDDFFF0F0F0FFFFFFFFFFFEFEFEFFFDFDFDFFFEFEFEFFFFFFFFFFFEFE
          FEFFFFFFFFFFFAFAFAFFFBFBFBFFFEFEFEFFFFFFFFFFFBFBFBFFFDFDFDFFFFFF
          FFFFFBFBFBFFFBFBFBFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFEFE
          FEFFFFFFFFFFFEFEFEFFFCFCFCFFFEFEFEFFFFFFFFFFFEFEFEFFFBFBFBFFFEFE
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFF
          FFFFFBFBFBFFFFFFFFFFFDFDFDFFF8F8F8FFFFFFFFFFFFFFFFFFFEFEFEFFFFFF
          FFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFFFFFFAFAFAFFFAFA
          FAFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFDFDFDFFFCFCFCFFFFFFFFFFFCFC
          FCFFF7F7F7FFFFFFFFFFFBFBFBFFFEFEFEFFFCFCFCFFFFFFFFFFFBFBFBFFFCFC
          FCFFFEFEFEFFF9F9F9FFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFCFC
          FCFFFEFEFEFFFFFFFFFFC7C7C7FF5D5D5DFF3B3B3BFF8C8C8CFFF4F4F4FFF0F0
          F0FFD8D8D8FFE6E6E6FFF9F9F9FFFEFEFEFFFEFEFEFFFEFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
          FDFFFFFFFFFFFDFDFDFFFFFFFFFFFEFEFEFFFFFFFFFFF9F9F9FFFDFDFDFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFEFDFF95EADDFF38D2BAFF1AD3
          B6FF43D1C0FF32D6C1FF24D6C0FF2AD6BEFF3DD5BFFF44D5C1FF3AD3BFFF34D3
          BBFF41D9B6FF3FD6B8FF42D7BFFF3DD7C4FF32D4C6FF29D6CDFF31E6DFFF2DF8
          E4FF12FFD3FF1BFED4FF1CFDD1FF1EFFD6FF34FCD8FF0AFFDDFF57E3CCFFE8C6
          C9FFDFDFDFFFEDEDEDFFFFFFFFFFFDFDFDFFFDFDFDFFFEFEFEFFFDFDFDFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFDFD
          FDFFFEFEFEFFFFFFFFFFC6C6C6FF5B5B5BFF393939FF858585FFEFEFEFFFFBFB
          FBFFE7E7E7FFE4E4E4FFF0F0F0FFFDFDFDFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5FDFCFFBDF0E8FF7BDECEFF5AD8
          C4FF2FD5BAFF34D3BAFF3DD2BBFF4AD3BEFF51D3BFFF48D5BFFF34D9BFFF2ADB
          BFFF3CD6BFFF39D4BDFF3CD5C1FF3FD7C7FF3CD7CCFF35D8CFFF33DDD6FF3AE6
          D9FF33F4D6FF21F4D5FF28F6D9FF32FDE1FF23F7D6FF00FDD8FF63DDCCFFF5CA
          CCFFE4E6E6FFEDEDEDFFFFFFFFFFFEFEFEFFFEFEFEFFFEFEFEFFFDFDFDFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFFFBFB
          FBFFFFFFFFFFFFFFFFFFD4D4D4FF8E8E8EFF767676FFA4A4A4FFF1F1F1FFFFFF
          FFFFF8F8F8FFF7F7F7FFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFEFFFFFFFD5FEF8FFBEFA
          F0FF72E6D1FF53D3BCFF3BCFB6FF37D8BEFF37D8BEFF33D0B8FF38D5BDFF3DDD
          C6FF35D6C5FF36D6C5FF3BD5C9FF3ED7CDFF40D9D4FF3EDAD6FF38D8D4FF35D1
          CFFF41D3CEFF50E3DDFF33F3DFFF07FADBFF19FFE5FF0AFBD8FF67DDC3FFF5D8
          DAFFEAEBEBFFEAEAEAFFFDFDFDFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
          FDFFFCFCFCFFFFFFFFFFFFFFFFFFFDFDFDFFF7F7F7FFFEFEFEFFFFFFFFFFFEFE
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFDFEFFFFFEFFFFFFFFFFFFFBFF
          FFFFE2FFF7FFB2F2E4FF70E3CFFF3CD9C0FF2AD7BBFF2DD3BBFF3FD0BDFF43D0
          C0FF31D4CDFF39D8D0FF3BD8D2FF3BD5D1FF3DD6D5FF41D8D9FF3ED4D5FF39D0
          D4FF3AD5DBFF3FD3D5FF33D7D1FF27E6D5FF1FF0D3FF1DFFE0FF69EAD3FFD8D6
          D3FFF2EDEEFFE7E7E7FFF8F8F8FFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFA
          FAFFFBFBFBFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFCFC
          FCFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFFFFFDFFFFFFFDFFFFFFFA
          FDFFFFFFFEFFFDFFFFFFDFFBF6FFB5EEE5FF7FE0D7FF53DBCCFF39D8CAFF30D5
          C8FF37D2D1FF3CD9D7FF3CD9D7FF37D5D2FF39D3D3FF3ED6D7FF41D5D7FF41D2
          D9FF36D3DDFF28D5D7FF31D3D1FF48D2CCFF47E4D3FF24EACBFF6DD9C6FFE4E2
          E0FFF1EDEFFFE9E9E9FFF6F6F6FFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
          FDFFFEFEFEFFFDFDFDFFFDFDFDFFFEFEFEFFFEFEFEFFFFFFFFFFFEFEFEFFFEFE
          FEFFFEFEFEFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFEFEFFFFFDFEFFFDFA
          FAFFF9FFFDFFFFFCFEFFFFFFFFFFFFFFFFFFB8EFF3FF5BD4CDFF28D4CAFF27DE
          D3FF41D1D3FF3FD7D7FF3CD8D7FF34D6D4FF35D4D3FF3BD5D5FF3ED6D6FF44D2
          D6FF4BCFD8FF42D9DCFF2EE2DCFF36D9CFFF57D1C6FF79CFC7FFC8DBDBFFFDED
          F1FFEDEEEEFFF1F1F1FFF8F8F8FFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFDFD
          FDFFFFFFFFFFFDFDFDFFFDFDFDFFFEFEFEFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFDFDFDFFFEFEFEFFFFFFFFFFFFFFFFFFFBFBFBFFFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFEFEFFFAFFFFFFF9FEFEFFF8FC
          FCFFFFFEFFFFFFFFFFFFDFF9F9FF9CEAE7FF59DFD9FF36D5CFFF37D5D2FF44D6
          D6FF4BD3D5FF42D4D5FF39D5D5FF33D8D5FF34DAD5FF39D9D4FF3FD5D3FF3DD4
          D2FF35D8D7FF2EE0DCFF2DD6D0FF6FC4C7FFBCD1D7FFE8EFF2FFFFF5FFFFFBEC
          F2FFEEF2F0FFF9F9F9FFFDFDFDFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFD
          FDFFFFFFFFFFFFFFFFFFFDFDFDFFFCFCFCFFFEFEFEFFFFFFFFFFFEFEFEFFFEFE
          FEFFFFFFFFFFFEFEFEFFFDFDFDFFFEFEFEFFFFFFFFFFFDFDFDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFDFFFDFEFDFFFFFFFFFFFFFF
          FFFFFBF9FFFFBFF2F2FF6DE3DEFF35D6CCFF24D1CAFF33D6D4FF3FD9DAFF3BD5
          D6FF36D7D2FF38D7D4FF3ED7D5FF42D5D6FF41D5D4FF37D5D3FF29D9D5FF2CDD
          D4FF44DACBFF53CDC5FF92CECEFFE2DCE5FFFFF8FEFFFAFDFCFFF5F4F8FFFDF8
          FBFFFAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFFFEFE
          FEFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFF9FDFEFFE5F9
          FBFF8CE5E7FF54D3D2FF2DD2CAFF2CD8D1FF3AD5D3FF44D2D5FF42D4D5FF32D5
          D3FF28D8D1FF39D6D3FF44D5D5FF40D6D5FF35D8D6FF35D9D8FF3CDADAFF4AD5
          CFFF75D0C0FFBEDDDBFFFCF2F3FFFFFFFFFFFBFEFEFFEFF8F6FFF9FAF8FFFFFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FFFEFFCFF8F6FF90EDE6FF63E4
          DCFF2DD9D5FF30D1CFFF38D2CFFF3AD5D4FF36D7D5FF39D8D5FF3FD7D4FF3FD3
          D3FF3CD6D9FF46D6D8FF3FD8D6FF27DAD1FF1FDBCFFF40D6CEFF79CBCEFFA4D1
          D6FFCDEFECFFF9FFFFFFFFFFFFFFFFF6FAFFFCF9FAFFF8FFFEFFFDFEFEFFFFFD
          FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFBFCFFA0EBE9FF45D9D1FF11CF
          C4FF2BD7D8FF3BD6D9FF49D8DAFF44D8D9FF33D5D3FF2DD6D0FF31D8D2FF3BD5
          D2FF40D3D8FF35D4D3FF2CD4CFFF34D7CFFF5ADED5FF97E8E4FFD4EDEEFFF5F5
          F8FFFFFFFFFFFFFBFFFFFFF8FDFFFFFAFDFFFDFEFEFFF9FFFFFFFCFFFEFFFFFF
          FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FDFEFFCEF2F7FF95E4EAFF6AD9
          DFFF34CECFFF35D2D4FF31D6D5FF31D8D3FF38D8D5FF40D8D5FF46D8D6FF42D7
          D4FF2DD7D3FF36D4CFFF54D7D3FF89E4E3FFC8F6F7FFF2FEFEFFFFFFFFFFFFFF
          FFFFFCF8FBFFFFFDFFFFFFFDFFFFFFFFFFFFF9FFFFFFF9FFFEFFFFFFFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFFFFFCFCFFFFF1FAFEFFDAF4
          FCFF83E4E7FF60E0DDFF36D7CFFF27D5CDFF30D8D1FF39D7D3FF3BD5D2FF33D4
          D0FF2AD5C9FF70DED9FFBDECEFFFEEFBFCFFFBFFFFFFFFFFFFFFFFFCFCFFFDFA
          FAFFF8FDFEFFFBFFFFFFF8FDFCFFF4FCFAFFF6FFFDFFFCFFFEFFFFFCF9FFFEFB
          FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFDFFFFFFFBFFFFFFFCFFFBFFFFFFF2FF
          FFFFEFFDFFFFCEF6F4FF93E5E1FF61DAD3FF40D6CFFF2ECFCAFF2ECFCDFF48DB
          D9FF94EFE3FFCFF7F4FFFCFEFFFFFFFDFFFFFBFDFCFFF3FDFBFFFFFEFEFFFDFD
          FDFFF6FEFCFFF8FEFDFFFAFFFEFFFAFEFDFFFDFFFDFFFFFFFBFFFFFEFBFFFFFE
          FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFCFFFEFFFAFFFAFFFFFFF7FFFFFFF7FFFDFFF9FFF9FF
          FAFFFFFDF5FFFEFEFCFFF3FBFCFFC7F9F8FF80E8E9FF5CD7DBFF6DDCE7FFA7F0
          FBFFF7FEFBFFFDFEFEFFFFFFFEFFFDFEFFFFFCFEFEFFF8FDFDFFF8FEFEFFF9FE
          FEFFFEFCFCFFFEFFFFFFFFFFFEFFFFFFFEFFFFFFFDFFFFFFFCFFFDFFFBFFFCFF
          FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFFFFFFFEFFFEFFFFFFFEFFFFFFFEFFFFFFFEFFFFFF
          FEFFFFFFFEFFFFFFFFFFFFFFFFFFFDFFFFFFF4FDFEFFF0FBFCFFF3FCFEFFF9FE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFEFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A
          9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF}
      end
      item
        Image.Data = {
          76800000424D7680000000000000360000002800000098000000360000000100
          2000000000004080000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000D3A465FFCC92
          43FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A
          35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A
          35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A
          35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A
          35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A
          35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A
          35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A
          35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A
          35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A
          35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A
          35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A
          35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A
          35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A
          35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A
          35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A
          35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A
          35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A
          35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A35FFC88A
          35FFC88A35FFC88A35FFC88A35FFC88A34FFCC9241FFCE9950FFBD863BFFC78C
          39FFD6AB6FFFD6A869FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A7
          67FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A7
          67FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A7
          67FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A7
          67FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A7
          67FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A7
          67FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A7
          67FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A7
          67FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A7
          67FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A7
          67FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A7
          67FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A7
          67FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A7
          67FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A7
          67FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A7
          67FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A7
          67FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A7
          67FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A767FFD5A7
          67FFD5A767FFD5A767FFD6A768FFD6AA6EFFC78F42FFC07F25FFB97C2CFFD6AC
          72FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7B17FFFBB791CFFB77C2DFFD4A9
          70FFFFFFFFFFF9F3EFFFF7EBDBFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EB
          DDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EB
          DDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EB
          DDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EB
          DDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EB
          DDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EB
          DDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EB
          DDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EB
          DDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EB
          DDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EB
          DDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EB
          DDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EB
          DDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EB
          DDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EB
          DDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EB
          DDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EB
          DDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EB
          DDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EBDDFFF6EB
          DDFFF6EBDDFFF6EAD9FFFBF6F0FFFFFFFFFFD7B17BFFBC7818FFB67B2CFFD1A7
          6DFFFEFEFDFFD7B079FFC37F1EFFC88833FFC78831FFC88831FFC88831FFC788
          31FFC88831FFC78831FFC88831FFC88831FFC88831FFC88831FFC78831FFC888
          31FFC78831FFC88831FFC78831FFC88831FFC78831FFC78730FFC78731FFC787
          31FFC78731FFC78731FFC78731FFC78731FFC78731FFC78831FFC78831FFC786
          2FFFC6852DFFC6862DFFC6862DFFC6862DFFC6862DFFC78730FFC78731FFC787
          31FFC78731FFC78731FFC78731FFC78731FFC78731FFC78731FFC78731FFC788
          31FFC78831FFC7882FFFC6852DFFC6862DFFC6862DFFC6862DFFC6852DFFC785
          2DFFC78830FFC78731FFC78731FFC78731FFC78731FFC78831FFC78730FFC685
          2DFFC6862DFFC6862DFFC6862DFFC6862DFFC6862DFFC7862EFFC6862EFFC686
          2DFFC6862DFFC6862DFFC6862DFFC6862DFFC6862DFFC6862DFFC6862DFFC686
          2DFFC6862DFFC6862DFFC6862DFFC6862DFFC6862DFFC6862EFFC78730FFC888
          2FFFC9882EFFC9882FFFC9882FFFC9882FFFC9882EFFC88831FFC78731FFC787
          31FFC78731FFC78731FFC78731FFC88730FFC9882EFFC9882EFFC9882FFFC988
          2FFFC9882FFFC8882FFFC78731FFC78731FFC78731FFC78731FFC78731FFC787
          31FFC78731FFC78731FFC78731FFC78831FFC78831FFC88830FFC9882FFFC988
          2FFFC9882FFFC9882FFFC9882EFFC8882EFFC78730FFC78731FFC78731FFC787
          31FFC78731FFC78731FFC78831FFC9892FFFCC8A2CFFCD8B29FFCD8B2AFFCD8B
          29FFCC8A2BFFCD8A2AFFCC8A2BFFCA892DFFC8882FFFC78730FFC78731FFC787
          31FFC78732FFC37D1EFFE2C399FFFFFEFEFFD5AE78FFBB7615FFB8771EFFD2A8
          6FFFFEFDFCFFD4A769FFBB720EFFC37F20FFBD7612FFBA7109FFBA720DFFBA72
          0BFFBA720DFFBA720BFFBA720CFFBA720CFFBA720CFFBA720CFFBA720BFFBA72
          0DFFBA720BFFBA720DFFBA710AFFBB720BFFBF7A17FFC28021FFC07D1EFFC17D
          1EFFC17D1EFFC07D1EFFC17D1EFFC17D1EFFC07D1EFFC17E1FFFC07D1FFFBD78
          19FFBB7514FFBC7514FFBC7614FFBB7514FFBE7715FFC07B1CFFC07D1FFFC17D
          1EFFC17D1EFFC07D1EFFC17D1EFFC17D1EFFC07D1EFFC17D1EFFC17D1EFFC07D
          1EFFC27E1FFFBF7A1CFFBE7716FFBC7515FFBD7614FFBB7515FFBC7515FFBE77
          15FFC07C1DFFC07D20FFC17D1EFFC07D1EFFC17D1EFFC07D1FFFC07B1AFFBB76
          16FFBD7614FFBB7515FFBD7614FFBB7515FFBC7516FFBD791BFFBF7714FFBB75
          15FFBD7614FFBB7515FFBD7614FFBB7515FFBD7614FFBB7515FFBC7515FFBC75
          15FFBB7515FFBD7614FFBB7515FFBD7614FFBB7515FFC07715FFC27E1DFFC781
          16FFC88115FFC78016FFC78016FFC78116FFC68017FFC17C1CFFC07D1EFFC17D
          1EFFC17D1EFFC17D1EFFBF7D1EFFC27E1CFFC68116FFC78115FFC78016FFC780
          16FFC88115FFC88115FFC27E1CFFBF7C20FFC17D1EFFC07D1EFFC07D1EFFC17D
          1EFFC07D1EFFC07D1EFFC17D1EFFC07C1FFFC17D1CFFC67F17FFC88115FFC780
          16FFC78016FFC78016FFC98114FFC57F1AFFBF7C20FFC07D1FFFC07D1EFFC07D
          1FFFC17D1EFFC98114FFCD8410FFC78016FFB97926FFAF7430FFAE7331FFAD73
          32FFB3762CFFB2762DFFB67729FFC07C1DFFC88115FFCE850FFFCA8315FFC37E
          1BFFC17E20FFB86F08FFDDBD92FFFFFEFEFFD3AB76FFB26F14FFB6741AFFCEA4
          6BFFFEFDFCFFD3A96BFFB6700EFFBE7D24FFC6924CFFCFA362FFCC9E5EFFCE9E
          5BFFCD9E5FFFCE9E5CFFCD9E5EFFCD9E5DFFCD9E5DFFCD9E5DFFCE9E5CFFCC9E
          5EFFCE9E5CFFCC9E5EFFCF9F5DFFCD9E5DFFC38C3DFFBC7A1DFFBD7D24FFBE7E
          24FFBE7E24FFBD7E24FFBE7E24FFBE7E24FFBE7F25FFBB781AFFBD7E23FFDBB5
          81FFEDDAC0FFE8D1B2FFE8D1B1FFE9D4B6FFE6CEADFFCC9852FFBA7517FFBE7E
          23FFBD7E24FFBD7E24FFBE7E24FFBE7E24FFBD7E24FFBE7E24FFBE7E24FFBD7D
          25FFBA7311FFC38F48FFE1C7A3FFEAD4B6FFE8D1B1FFE8D1B1FFEBD6B8FFE1C5
          A0FFC18739FFBE7A1CFFBE7E23FFBD7E24FFBE7F26FFBA7412FFC68C3CFFE5CA
          A5FFE9D2B4FFE8D1B1FFE8D1B1FFE8D1B1FFE8D1B1FFD5AB75FFE5CBA6FFE8D1
          B2FFE8D1B1FFE8D1B1FFE8D1B1FFE8D1B1FFE8D1B1FFE8D1B1FFE8D1B1FFE8D1
          B1FFE8D1B1FFE8D1B1FFE8D1B1FFE8D1B1FFE9D2B3FFE4C391FFB47831FF6A51
          83FF5A4B9EFF644F91FF634F93FF5E4D9AFF6D5585FFB67929FFC6821BFFBC7E
          25FFBE7E24FFBF7E22FFC6811AFFA77142FF604D97FF5C4B9BFF644F92FF634F
          93FF5A4B9EFF795A79FFBF7D26FFC8821CFFBD7E26FFBD7E24FFBD7E24FFBE7E
          24FFBD7E24FFBD7E24FFBE7E25FFC17F20FFC68019FF886265FF5A4B9DFF614E
          95FF634F93FF645092FF574AA2FF6E5581FFB4782DFFC4801CFFBF7D24FFCA83
          18FFCD8515FFA9733FFF7A5B76FF5D4C99FF413EBAFF2E34CEFF3035CCFF2D33
          CFFF3739C5FF3639C7FF3C3BC0FF4D44ABFF655090FF7C5B72FFA06F4BFFB77A
          2DFFC07F23FFB87210FFDFBF92FFFFFEFDFFD3AB75FFB6700DFFB7751AFFCDA2
          69FFFEFDFCFFD1A66BFFB26B0BFFB6761EFFE9D2B3FFFFFFFFFFFFFFFFFFFFFE
          FFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFF
          FFFFFFFEFFFFFFFFFFFFFFFFFFFFFBF9F6FFD3AF80FFAF6601FFBB7C22FFBB7C
          23FFBB7B22FFBB7B22FFBB7B22FFBC7C23FFBB7C23FFB46E0EFFBA7921FFE9D3
          B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFCFFCEA36AFFB16907FFBA7B
          21FFBB7C23FFBB7B22FFBB7B22FFBB7B22FFBB7B22FFBB7B22FFBB7B23FFBB7C
          26FFB06700FFCC9E5DFFF8F2EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF6
          F0FFC18C44FFB46F11FFBA7B21FFBB7C23FFBC7B23FFB06706FFD6AE7AFFFBF8
          F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF8F5FFD4AB74FFFCFAF6FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9EEDCFFA76E39FF272B
          CEFF0C23FCFF1D2BE5FF1B2AE8FF1225F3FF2F34CEFFAF752EFFC98211FFBA7A
          24FFBB7B22FFBB7B23FFC88213FFAA7138FF2D32D0FF0720FFFF1D2BE5FF1C2A
          E6FF0E24F8FF232DDDFF98674AFFCF8406FFB87822FFBB7B22FFBB7B22FFBB7B
          22FFBB7B22FFBB7B22FFB97A24FFC9800FFFB77829FF413DBDFF0B22FDFF1B2A
          E9FF1C2AE7FF1A2AEAFF021FFFFF5246A3FFBC7B23FFCA8210FFCA8311FFA36E
          41FF56479FFF2831D9FF1B29E9FF1A29EBFF1E2CE6FF212EE2FF232EE0FF222E
          E1FF202DE4FF202DE3FF1F2CE4FF1B2AEAFF1B2AE8FF1828EAFF1A29E6FF7D5C
          6FFFC37E15FFB56E0CFFDBBC91FFFEFEFDFFD2AA75FFB06A09FFB27018FFCBA1
          67FFFEFDFCFFCBA169FFAD6707FFB7751BFFEDD7B5FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF9F6FFD2AE7EFFAC6200FFB9781DFFB776
          1CFFB7761CFFB7761CFFB7761CFFB7761CFFB8771EFFB26C0CFFB6751BFFE6D0
          B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFEFFCCA26CFFAE6704FFB776
          1BFFB7761CFFB7761CFFB7761CFFB7761CFFB7761CFFB7761CFFB7761CFFB978
          1FFFAB6401FFC39455FFF6EFE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0
          E7FFBE883FFFB26E0FFFB7751BFFB7761DFFB67417FFB06C0DFFE4D1BAFFFEFE
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2C9A5FFC08A41FFFBF8F4FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E7CCFFA76C30FF3332
          C2FF1A2AEBFF2A32D6FF2831D9FF202DE4FF3A39C1FFAD722AFFC47C0AFFB775
          1FFFB7761CFFB6761DFFBD7815FFBC7815FF6B5283FF1628F2FF2730DAFF2932
          D8FF212EE1FF1C2BE9FF73557DFFC87E07FFBA7817FFB6761EFFB7761CFFB776
          1CFFB7761CFFB7761CFFB8761CFFCB7F02FF8E624FFF2931D7FF1D2BE9FF2932
          D8FF2931D8FF202DE3FF202DE1FF895F57FFCA7F01FFC07A0EFF765874FF2631
          DCFF1829EEFF232EE0FF2831DAFF2831D8FF2931D8FF2931D8FF2831D8FF2931
          D8FF2931D8FF2831D8FF2831D8FF2831D8FF2831D8FF2631DCFF1125F4FF7456
          76FFC37D12FFB16906FFDBBB8FFFFFFEFDFFCFA770FFAA680FFFAA6A16FFC99F
          66FFFEFDFCFFCCA164FFAC6401FFB06F17FFE5CDAFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF8F5FFD1AC7AFFA75F00FFB5741BFFB473
          1AFFB4731AFFB4731AFFB4731AFFB4731AFFB5741CFFAE6909FFB37219FFE5CF
          B1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFCBA16AFFAB6402FFB675
          1AFFB6751BFFB4731AFFB4731AFFB4731AFFB4731AFFB4731AFFB4731AFFB574
          1EFFAA6100FFC49450FFF6EFE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF2
          E3FFBF863AFFB06B0EFFB5731AFFB6751CFFB06B0DFFB67A28FFF5EDE1FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCD9D5CFFBF8535FFFCF8F4FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EDD7FFA46A29FF3334
          C3FF1A2AEBFF2A32D6FF2831D9FF212DE4FF3939C1FFA96F2AFFC37908FFB271
          1DFFB4731AFFB4731AFFB4731AFFBF780CFF8E614DFF212DE2FF212EE4FF2931
          D7FF2731DBFF182AF1FF4B40AAFFB57317FFC17A08FFB2721CFFB47319FFB473
          19FFB47319FFB3721AFFBA7611FFC57B03FF695081FF1A2BEDFF232EE0FF2931
          D8FF2A32D6FF1729F0FF393AC3FFB37320FFC77D03FF594996FF192AECFF222E
          E1FF2A31D7FF2831D9FF2831D9FF2931D8FF2531DDFF212EE3FF1F2DE7FF1F2D
          E7FF1E2DE6FF242EDFFF2831D8FF2831D9FF2831D9FF2730DBFF1829EDFF7353
          6FFFBD780FFFAE6604FFDABA8FFFFFFEFEFFCDA56FFFAC6501FFAB6916FFC79D
          65FFFEFDFCFFCA9E63FFA75F00FFAD6C13FFE1CAADFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF9F5FFD0AC7AFFA35A00FFB2711AFFB170
          18FFB17018FFB17018FFB17018FFB17017FFB06F17FFAB6608FFAE6C13FFDFC7
          AAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFDFFC89F68FFA86100FFB170
          17FFB17018FFB17018FFB17018FFB17018FFB17018FFB17018FFB17018FFB373
          1CFFA55C00FFC1924FFFF6EFE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EE
          E5FFB78034FFAB6709FFB16F17FFB3731DFFA55D00FFC99E64FFFAF5F0FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F4EDFFB2731DFFBC8232FFFCF9F5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF8F3FFF0E4D1FFF0E3D2FFF0E3D2FFEFE4
          D6FFF0E3D2FFEFE3D3FFEFE4D6FFF0E3D3FFF2E8D8FFEBD1A9FFA06830FF3233
          C0FF1A2BEDFF2A32D6FF2831D9FF202DE5FF3839C2FFA66A23FFBC7508FFB070
          1AFFB17018FFB17018FFAF6F18FFB97307FFAA6E25FF4540B7FF1527F4FF2A32
          D6FF2A32D7FF1C2BEAFF2831D7FF946444FFD07F00FFBA740AFFBA740BFFBA74
          0BFFBA740BFFB7730CFFCB7D00FFB57217FF433DB1FF1829F1FF2931D9FF2831
          D9FF2831D8FF1227F8FF6A4F7BFFC87C00FF6B517DFF192AEDFF222EE2FF2931
          D8FF2831D9FF2931D7FF2831D8FF1D2CEAFF1F2DE6FF3336CBFF483FAAFF4E41
          A1FF4941ACFF3236CDFF2730DAFF2831D9FF2831D9FF2730DBFF192BEDFF7251
          6CFFB8740EFFAA6200FFD9B98DFFFFFEFDFFC9A26FFFA76102FFAA6915FFC79C
          65FFFEFDFCFFCA9F64FFA35B00FFAA670CFFE2CCADFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFBF7F2FFD6B58AFFC29250FFC99D64FFC79B62FFC99D62FFC79B
          62FFC99D62FFC79C62FFCA9F65FFC99E65FFB67F37FFA96509FFAD6C13FFAD6C
          13FFAD6C13FFAD6C13FFAD6C13FFAD6C13FFAE6D15FFA76103FFA96610FFDFC8
          AAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFDFFC79C64FFA45D00FFAD6C
          13FFAD6C13FFAD6C13FFAD6C13FFAD6C13FFAD6C13FFAD6C13FFAD6C13FFAC6D
          15FFA15900FFC08E4CFFF6EEE4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4EE
          E5FFB88035FFA86405FFAD6C12FFAB6A12FFA35A00FFE2C8A7FFFEFDFCFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFE3CDB0FFA25A08FFBC8339FFFCF9F5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFEFFEBDAC5FFAC6A12FFAB6609FFAD6B11FFAD6C
          15FFAD6A0DFFAD6B13FFAD6C14FFAD6A0DFFAE6C13FFB46D06FF9F662AFF3536
          C8FF1A2BECFF2A32D6FF2831D9FF202EE4FF3537C4FF9E6327FFB97200FFAB6C
          16FFAD6C13FFAD6C13FFAC6C14FFB26E0DFFB56F09FF6A4D74FF1427F3FF2531
          DEFF2931D6FF2630DBFF212FE3FF4640ADFF6E5072FF684D7CFF664C7EFF664C
          7EFF664C7EFF654C7FFF6D4F72FF5A478FFF2A32D5FF222EE2FF2931D8FF2A32
          D6FF1E2DEAFF232DDDFFA0662AFF905E3BFF252FDAFF1E2DE8FF2931D7FF2831
          D9FF2931D7FF2430E1FF1B2AEBFF423AADFF81564FFFA6681FFFB46F0CFFB671
          07FFBF7400FF7B5864FF2630DCFF2630DCFF2831D8FF2730DBFF1A2BEEFF7150
          6AFFB57009FFA35D00FFD6B78DFFFEFEFDFFC9A26FFFA35E02FFA2600BFFC398
          5FFFFEFDFCFFC5995EFF9F5700FFAA670DFFE2CCADFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF9F3EBFFC18C48FF964800FFA35D00FFA15B00FFA05A00FFA15B
          00FFA05A00FFA15B00FFA15A00FFA05A00FFA56209FFAB6B14FFAA6912FFAA69
          12FFAA6912FFAA6912FFAA6912FFAA6912FFAB6A14FFA45E02FFA7640BFFDFC7
          A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFEFFC69A62FFA25A00FFA96A
          13FFAA6A13FFAA6A13FFAA6912FFAA6912FFAA6912FFAA6912FFAA6912FFAB6B
          15FF9D5500FFBC8A48FFF5EDE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6EF
          E6FFB37C34FFA45F04FFAC6B14FFA05A00FFAE7021FFF4EADBFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFC5995FFF9B5301FFB9833CFFFCF9F5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFEFFE8D7C4FFA26009FFA56206FFA7650BFFA864
          0AFFA7650BFFA8640BFFA8640AFFA7650BFFA86409FFAD6903FF9D6324FF3537
          C5FF1B2CEDFF2931D6FF2831D9FF202EE4FF3537C5FF9E6224FFB66D00FFA767
          16FFA96913FFA96913FFAA6913FFAB6910FFB76F00FF8E5E3DFF2832D9FF1B2B
          EDFF2932D6FF2931D8FF2931D8FF222EE2FF1C2BEAFF1D2CE8FF1D2CE8FF1D2C
          E8FF1D2CE8FF1D2CE8FF1C2BEAFF1E2CE7FF2630DBFF2931D7FF2831D9FF2A32
          D7FF1329F8FF4C40A0FFAA6815FF534298FF1B2BEDFF2731DAFF2831D8FF2931
          D7FF2530DEFF1829F0FF5B4482FFAD6A0DFFB97000FFB06C06FFAB6A10FFAA69
          12FFBC7200FF83594FFF2730DDFF2630DDFF2931D8FF2730DBFF1B2BEDFF6E4F
          6BFFB16D09FFA05800FFD7B68BFFFFFEFDFFC9A26FFF9E5B03FFAA712AFFC79F
          6CFFFEFDFBFFC09359FF9A5100FFA4610BFFE2CCADFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF8F4F0FFBF9462FF9A5200FFA76714FFA66511FFA66511FFA665
          11FFA66511FFA66511FFA66511FFA66511FFA66511FFA66511FFA66511FFA665
          10FFA66510FFA66511FFA66510FFA66510FFA76613FFA05B02FFA4620CFFDDC5
          A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFEFFBC8F5AFF934600FFA059
          00FF9F5900FF9F5A00FFA26009FFA56310FFA56411FFA66511FFA66510FFA867
          14FF995100FFBB8948FFF6EDE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6EF
          E6FFB37B33FFA15C03FFA6630EFF974C00FFCAA474FFFAF7F2FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF6F0E9FFAA6D1CFF9C5600FFB6813DFFFBF9F5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFEFFE9D8C5FFA4630EFFA4620CFFA66511FFA665
          11FFA66511FFA66511FFA66612FFA66512FFA66511FFAC6808FF985F23FF3435
          C1FF1B2CEEFF2932D6FF2831D9FF202DE5FF3637C3FFA36420FFBB6D00FFAC67
          05FFAE6804FFAB6705FFA9660CFFA56413FFB06A03FFA46515FF473DA6FF1528
          F7FF2932D8FF2831D9FF2831D9FF2831D9FF2831DAFF2831DAFF2831DAFF2831
          DAFF2831DAFF2831DAFF2731DAFF2731D9FF2831D9FF2831D9FF2931D8FF2430
          E1FF1629F3FF7C5452FF8F5B31FF2E32CCFF1F2DE8FF2A31D7FF2831D8FF2931
          D8FF1429FAFF54428CFFAB670DFFAE6907FFA66511FFA66512FFA66511FFA564
          13FFB66C00FF7D5455FF2731DBFF2530DDFF2831D8FF2730DBFF1B2BEDFF6F4E
          6BFFAD6808FF9D5600FFD3B38BFFFEFEFDFFC7A06FFF9C5903FFBD9673FFD1B5
          A3FFFEFDFCFFC8A47EFFA25F0EFFA3600DFFDEC7ACFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF9F4EFFFC09561FF995200FFA56413FFA46311FFA46311FFA463
          11FFA46311FFA46311FFA46311FFA46311FFA46310FFA46310FFA46310FFA463
          10FFA46310FFA46310FFA46310FFA46310FFA56412FF9E5801FFA05D0CFFDCC5
          A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFDBC0A1FFC3965DFFCAA2
          6AFFC79D68FFBE8F55FFAE762DFFA05F08FF9B5600FF9F5D08FFA46311FFA666
          14FF954D00FFB98649FFF5EDE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8EF
          E4FFA96F28FF954C00FF924600FFAD7129FFF1E7D9FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFD5B997FFA05E0AFF9C5700FFB27E3DFFFBF8F5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFEFFE9D8C2FFA05E08FF9D5905FF9F5E0CFF9F5E
          0CFF9F5E0CFF9F5E0CFF9F5D0BFFA05E0BFFA15F0AFFA96406FF975D24FF3536
          C2FF1B2CEEFF2931D6FF2831D9FF242FE0FF2E33CEFF6F4C63FF825545FF7850
          51FF7F5550FF925B3CFFA16116FFAB6603FFAE6700FFAE6700FF704C6CFF1B2B
          F0FF242FDFFF2931D8FF2831D9FF2831D8FF2631DAFF232FE2FF222FE4FF222F
          E3FF222FE4FF222FE4FF2630DCFF2931D8FF2831D9FF2831D9FF2932D7FF1C2C
          EDFF2A32D5FF9B6021FF734E61FF222EE2FF242FE0FF2831D8FF2A32D6FF192B
          EFFF3133D3FF995E2CFFAE6700FFA4630FFFA36211FFA46212FFAA6606FFAA65
          03FFBB6C00FF7F544FFF2630DCFF2630DDFF2931D8FF2730DBFF1B2CEDFF6E4E
          69FFAC6605FF995300FFD1B18BFFFEFEFDFFC79F6DFF9D5901FFB98D73FFCFB2
          A4FFFEFEFDFFD4B7A4FFB48466FFB38264FFE1CFBFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF8F3EEFFB88A5AFF8A3C00FF9A5500FF995300FF995300FF9953
          00FF995300FF985200FF975200FF9E5B07FFA36313FFA16110FFA16110FFA261
          11FFA26111FFA26111FFA26111FFA26211FFA36212FF9A5501FF9D5C0DFFDCC5
          A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFDFBFFEDDECDFFC59C66FF9C590AFF9A5502FFA464
          14FF944B00FFB98648FFF5EEE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF6
          F0FFC7A071FFB68648FFC59F70FFF0E6DCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFB6854CFF9C5908FF995400FFB37E3AFFFBF8F5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFEFFE7D6C1FF9C5A0CFF9B5706FF9D5C11FF9D5C
          11FF9D5C11FF9D5C10FF9D5B0CFFA05E0CFFA05E0BFFA76308FF955C22FF3536
          C2FF1B2CEEFF2931D6FF2831D9FF2831D8FF2730DAFF212EE3FF212EE4FF212E
          E4FF212FE5FF2631DDFF3636C0FF564288FF8C5933FFBA6B00FF8F5833FF2B31
          D2FF1D2CECFF2A32D6FF2831D9FF2731DCFF2B32D5FF3234C6FF3134C7FF3235
          C8FF3134C7FF3134C6FF2C33D2FF2731DCFF2831D9FF2831D9FF2932D8FF1529
          F7FF4D3D91FFA9640CFF594593FF1E2DEBFF2731DBFF2831D8FF2731DAFF1529
          F8FF5B4487FFA8630BFFA76308FFA06111FFA3620EFFA15E0BFF8B5533FF8053
          46FF8F5B32FF634877FF2730DAFF2630DCFF2831D9FF2730DBFF1C2CEDFF6C4C
          6BFFA86407FF965100FFCFAE89FFFEFEFDFFC59E70FF995503FFB88C71FFCFB1
          A2FFFEFDFDFFCFB1A0FFB38265FFB78A71FFE3D5CBFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFCF9F6FFD9BEA0FFB98D5EFFC09969FFC09869FFC09869FFC098
          69FFC09769FFC29A6CFFC59C6DFFAF793AFF965303FF9E5F11FF9C5B0CFF9652
          02FF975302FF965202FF965201FF965201FF9C5B0CFF975304FF99560AFFDCC3
          A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5D5C2FFA66B27FF9651
          00FF8F4600FFB5844CFFF4EDE4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFE5D2BDFF9D5B13FF9C5A0AFF955001FFB17B37FFFBF8F5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F4F2FFE6D6C3FFEAD8BEFFEAD8BFFFEAD8
          BFFFEAD8BFFFEAD8BFFFEAD9C0FFEBDAC2FFE1CAABFFA96919FF894D16FF3537
          C4FF1B2CEEFF2A31D6FF2831D9FF2831D9FF2831D9FF2831D9FF2831D9FF2831
          D9FF2831D9FF2731D9FF232FE1FF1A2BF1FF2330E2FF6A4A6BFFA56003FF5842
          86FF1329FCFF2932D7FF2931D7FF1D2DECFF3234C8FF815141FF9D5B0EFF8F57
          21FF985A18FF985B1FFF4C3F9CFF192BEEFF2631DCFF2931D8FF2530DEFF1B2C
          F1FF794E4CFFA35F03FF423AABFF1D2DEBFF2731DAFF2931D8FF242FE0FF1B2C
          EFFF704C5EFFA66002FFA05F0CFF9D5E13FFA36004FFA45F03FF433BADFF1E2E
          EAFF222FE2FF2630DDFF2831D9FF2831D9FF2831D9FF2730DBFF1D2DEEFF6948
          68FFA56005FF944E00FFD0AF89FFFEFEFDFFC29B6DFF925004FFB48672FFCFB1
          A2FFFEFDFDFFCDB0A5FFAE7A5FFFB4846BFFE3D3C4FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFCF9FFCEAB80FF8A3F00FF934E00FFA56D32FFD7BC
          9EFFD8BFA3FFD1B699FFD5BBA0FFD5BBA0FFB6864DFF8B4100FF95530BFFDBC3
          A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9DAC9FFA368
          26FF843700FFB0804EFFF3ECE5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFE8DACAFFA26318FF934F04FF9B5C14FF904C00FFAD783DFFFBF8F5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EEE5FFAA6C20FF864713FF3639
          C4FF1B2CEEFF2931D6FF2831D9FF2831D9FF2831D9FF2730DBFF2630DCFF2730
          DAFF2831D9FF2831D9FF2831D8FF2A31D7FF1F2DE8FF1A2BEEFF654668FF7D50
          44FF2230E7FF212FE3FF2A32D5FF202EE6FF212FE4FF724C5BFFB16400FF9F5C
          03FFAD6100FF965A26FF3836BBFF1A2CEFFF2831D9FF2A31D6FF1D2DEEFF2B31
          CFFF935827FFA05C0BFF3C37B1FF1E2DEAFF2831DAFF2931D7FF2230E4FF202D
          E5FF774A44FFA45E00FF9A5A11FF985A14FF9F5C0AFFA35E02FF463AA2FF1F2E
          E8FF2330E1FF2730DBFF2831D9FF2831D9FF2831D9FF2730DBFF1C2DEDFF6747
          69FFA25F07FF8F4900FFCEAC86FFFEFEFDFFC19A6FFF935105FFB48572FFCFB1
          A2FFFEFDFDFFCDAD9CFFAE7962FFB18068FFE3D2C6FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFDFBFAFFCEB198FF905112FF914F07FFB2814DFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8A682FF7F3200FF93500DFFDBC3
          A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEAF
          8CFF843900FFAC7A49FFF4EDE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFE4D4C3FFB68A5AFF915009FF93530EFF8F4B03FFAA753BFFFBF8F5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E8E2FFA3661FFF834413FF3838
          C4FF1B2CEEFF2A31D6FF2831D9FF2831D9FF2731DAFF2530E0FF2630E0FF2430
          E1FF212EE4FF2731DBFF2831D8FF2831D9FF2A31D7FF1E2EEBFF3234C5FF6C48
          5CFF413AAAFF192CF3FF2A32D5FF2631DCFF1B2CF1FF4F3E91FF9C5A08FF9F5C
          07FFA55C00FF6F4A57FF2430E0FF212EE6FF2931D6FF2731D9FF172CF9FF4E3D
          92FFA85E00FF93561EFF3735BAFF1F2EE9FF2831D9FF2931D8FF2230E4FF212E
          E2FF784B44FF9D5905FF985811FF955815FF9C5A0DFF9F5A00FF46399FFF212F
          E5FF2631DEFF2731DBFF2731DBFF2731DBFF2731DBFF2630DDFF1C2DEFFF6849
          69FF9D5B07FF8A4500FFCAAA89FFFEFEFDFFC19B71FF945206FFB48571FFCDAE
          9FFFFEFDFDFFCCAD9FFFAE7861FFB28068FFE3D2C5FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFDFEFFDAC6BFFFAA7760FFAB765CFFC39E88FFFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4A382FF7B2E00FF8D4A0BFFD8C0
          A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDFFC6A37EFF9E6324FFA773
          3CFFBF9972FFF1E8DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2E9
          DBFF92521BFFA46F41FFF3EDE5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFDFCFFFFFDFCFFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFD7BE9FFF935411FF894400FFA9753EFFFBF8F5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4EDE5FFA36421FF824213FF383A
          C4FF1B2CEEFF2A31D6FF2831D9FF2330E2FF3033CAFF73484BFF87502DFF734A
          54FF504094FF2530DEFF242FE2FF2931D8FF2831D8FF2630DDFF2430E1FF533E
          88FF5C4177FF1C2DEFFF2530DEFF2A32D6FF1D2CEEFF3335C7FF84502FFFA45B
          00FF9A5605FF543F87FF1D2DEFFF2730DCFF2932D6FF212EE5FF202DE8FF6D48
          5BFFAA5D00FF915417FF3A37B4FF1E2EEBFF2831DAFF2931D8FF242FE1FF1E2E
          EBFF704A57FF9A5503FF96550FFF935516FF96560DFF9D5600FF4239A3FF1C2D
          EDFF212EE3FF242FE0FF232FE1FF242FE0FF232FDFFF212EE5FF162BF8FF6044
          72FF9C5807FF894300FFCBAB89FFFEFEFDFFBF976DFF8C490AFFB1826EFFCDAD
          9EFFFEFDFDFFC8A89CFFA9735BFFB07F67FFE3D1C6FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFDFFFEFEFDFFFEFDFDFFFEFEFDFFFEFEFDFFFEFE
          FDFFFEFEFDFFFFFFFFFFFDFDFDFFD8C2BAFFA9745EFFB17C66FFB98B7CFFD0B4
          A9FFD2B6A5FFCEB09CFFD1B5A2FFD2B5A2FFBD937EFF9F6744FFA26E45FFDCC8
          B9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFBFFAF8258FF7B3200FF8744
          00FF7A2F00FFA16936FFEFE4D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFA46E3AFF9F683AFFF0E7E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F5
          EFFFBA9065FFA77346FFAB7B4EFFB1855FFFCFB098FFF8F3F0FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFC4A382FF813D04FFA67139FFFBF8F5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F2ECFFDCC8B9FFDDCAB6FFDDCBB8FFDDCB
          B8FFDDCBB8FFDDCBB8FFDDCBB8FFDFCDBAFFD3BBA5FF9C5D1BFF80441BFF3538
          C6FF1C2CEBFF2931D6FF2831D9FF2230E3FF3335C3FF884F24FFA15700FF9754
          05FF9B5602FF644369FF1C2DEFFF242FE0FF2931D8FF2831D9FF1E2DEAFF443B
          A7FF6B4962FF2D32CFFF1F2EEAFF2A32D5FF232FE3FF2430E2FF6B465CFFA657
          00FF8A501EFF3E37AEFF1C2DF0FF2931D7FF2931D7FF1B2EF3FF3635BFFF834C
          2BFFA05500FF935411FF433AA5FF1E2DEAFF2731DAFF2931D8FF2630DCFF192C
          F6FF5E4376FF965309FF93520FFF8E5017FF925211FF93520EFF764A47FF6946
          60FF6C475AFF6B465CFF6D4758FF6B465CFF6D4758FF6A465CFF69465FFF804C
          35FF925112FF854100FFCAAA89FFFEFEFDFFC0976CFF8E4B08FFAD7D69FFCDAD
          9EFFFEFDFDFFC7A79AFFA8725AFFAD7A65FFE1CEC6FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFAF8F7FFD3BAAFFFB98F7DFFC49D8BFFC29B8AFFC29B8AFFC29B
          8AFFC29B8AFFC39C8BFFC39D8CFFB98D7BFFAE7C66FFB27F69FFB07D66FFAA75
          5EFFA9745DFFAA755FFFA9745EFFA9745EFFAF7D66FFB17C67FFB2806DFFE2D0
          CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFC4A38EFF985D39FFA069
          48FF975C32FF8C4C14FFD6BEA9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFAC7D5CFFA0693CFFEFE4DCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7EF
          E8FF9A612DFF7C3600FF854206FF844102FF792F00FFAE7D60FFF7F1EFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF4EEE4FF8F4F15FF9D6532FFFAF7F5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFEFFE3D2BFFF854104FF833F00FF864406FF8644
          06FF864406FF864406FF864406FF864405FF87450AFF904D0CFF864F25FF3437
          C5FF1D2DECFF2931D7FF2831D9FF222EE4FF3234C6FF834E2DFF985303FF894D
          1BFF955108FF884D20FF3736BCFF1C2DF1FF2A31D6FF2931D8FF1E2EEDFF3635
          BFFF71474BFF473A9CFF192CF5FF2932D6FF2730DBFF1C2DEEFF513D8BFFA255
          00FF7A493CFF2A32D5FF202FE9FF2A31D6FF2730DBFF192CF7FF513F8EFF9351
          0BFF965103FF975201FF503D8CFF202FE8FF2630DDFF2831D8FF2932D6FF182C
          F7FF3B37B6FF8B4F1AFF935008FF8E5018FF8B4D17FF8D4F17FF945108FF9753
          06FF965203FF975307FF975202FF965206FF975303FF965206FF975304FF9050
          10FF8E511AFF7F3B00FFC8A789FFFEFEFDFFB9926BFF823E02FFAE7E6AFFCDAD
          9EFFFEFDFDFFC6A699FFA6715AFFAD7A64FFE1CEC6FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF9F6F4FFC2A194FF9E634CFFAB7560FFAA745FFFAA745FFFAA74
          5FFFAA745FFFAA745FFFA9745EFFAD7864FFB1806AFFB17F69FFB07E69FFB17F
          69FFB17F69FFB17F69FFB17F69FFB17F69FFB1806AFFAA745FFFAB7864FFE0CF
          C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFCAAB9FFFA9735FFFB281
          6EFFB07D6AFFA8725AFFDAC3B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFBA947CFFAD7F58FFF1E8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F1
          F2FFA06A40FF824105FF874810FF894911FF823E01FF813D00FFE7DACEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA36F3DFF975E2DFFF9F6F4FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFEFFE8DACDFF8B4B11FF85440BFF884811FF8848
          11FF884811FF884811FF884811FF884810FF884811FF8D4B0AFF814925FF3638
          C5FF1D2DECFF2931D7FF2831D9FF2230E3FF3335C6FF814A29FF954E00FF874B
          19FF904D08FF874B19FF3E38ACFF1A2CF4FF2A31D6FF2931D8FF1F2EEBFF2F33
          CBFF7D4A32FF67425CFF1A2CF5FF2731DBFF2931D7FF1D2EF0FF3735BCFF8E4C
          0EFF6D4452FF1F2FECFF232FE2FF2A32D6FF212FE5FF232FE3FF6D4554FF964F
          00FF8B4B12FF954D00FF644264FF2530DFFF232FE2FF2931D8FF2931D7FF232F
          E2FF202FEBFF65425DFF924D02FF8D4C0FFF8A4B16FF8A4C15FF894B15FF8A4B
          16FF894B16FF8A4B16FF894B16FF8A4B16FF894A15FF884810FF884911FF8949
          0DFF88480DFF7B3600FFC7A787FFFEFEFDFFBD9981FF975D2DFFAE7E6AFFC9A9
          9BFFFEFDFDFFC7A698FFA36D57FFAA7763FFE1CFC6FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF9F6F5FFC6A69BFFA36D56FFAE7C68FFAD7B67FFAD7B67FFAD7B
          67FFAD7B67FFAD7B67FFAD7B67FFAD7B67FFAD7B66FFAD7B66FFAD7B66FFAD7B
          66FFAD7B66FFAD7B66FFAD7B66FFAD7B66FFAE7C67FFA8725CFFAB7863FFE1CF
          C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDFFC8A79BFFA36D56FFAE7C
          68FFA7725CFFA46F5AFFE1CFC8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC39F93FFBB9486FFF3EDEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F4
          F5FFB38A75FFA06949FFA06B4EFFA16C4DFF975D35FF975B34FFEDE2DBFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF8562FF996237FFF9F7F4FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFEFFE5D6D0FF86440BFF844205FF87460BFF8746
          0BFF87460BFF87460BFF87460CFF88480FFF88480DFF8B4705FF7B4223FF3436
          C5FF1A29ECFF2730D6FF262FD9FF202DE3FF3132C6FF7E482AFF904900FF884A
          15FF924B02FF814624FF3334C2FF1C2DEFFF2930D6FF2830D8FF1E2EECFF2F33
          CEFF834926FF7D4732FF2430E0FF212EE7FF2B32D5FF1F2FEBFF2D31CCFF6E43
          4AFF543E85FF1D2EF0FF2730DBFF2A31D5FF1A2DF3FF3D39B4FF81461CFF8F49
          03FF894C1AFF924B00FF7E482CFF3234C7FF1F2EE9FF2830D7FF2730D9FF2830
          D7FF1F2DE5FF2831DDFF6B414CFF8D4400FF8A4606FF88470BFF884910FF8747
          0DFF87470CFF87460CFF87460CFF87460CFF89470BFF8D4B0DFF935212FF9256
          28FF995F38FF945935FFD3B8A7FFFEFEFEFFD1B3A6FFB07D67FFAD7D69FFC8A7
          99FFFEFDFDFFC6A597FFA36B53FFA77462FFE1CEC6FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF9F5F4FFC29F93FF9D6249FFA8755EFFA8735CFFA8735CFFA873
          5CFFA8735CFFA8735CFFA8735CFFA8745DFFAB7964FFAC7A65FFAC7A65FFAC7A
          65FFAC7A65FFAC7A65FFAC7A65FFAC7A65FFAD7B66FFA6715BFFA97761FFE0CE
          C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFEFFC19E91FF995D45FFA26B
          54FF9E6650FFC6A597FFF9F5F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFB58A7DFFB78C7DFFF4EEECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F3
          F1FFB48977FFA26954FFA6705DFFA7725FFFA7715EFFD5BAACFFFCF9F7FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7A596FFB1846FFFFAF7F5FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFEFFEADED4FF955D38FF90552BFF93572BFF9256
          29FF8D5025FF8B4E22FF8D4D1AFF894914FF884511FF8C480BFF855033FF3E40
          C5FF2436EDFF2D37D8FF2C37DAFF2534E8FF3438C9FF844623FF964400FF8E44
          00FF874108FF553A76FF1C2EF2FF222CDFFF252BD9FF232BDBFF1928EFFF3533
          B7FF854415FF8B440BFF3A33A8FF1224F6FF2228D4FF1E29E0FF232BD9FF4334
          9CFF3630B2FF1C27E3FF2329D7FF2027D9FF1526F3FF543A75FF8C4600FF8845
          01FF854409FF894400FF8D4300FF4E387DFF1B2AEAFF202CE2FF262ED9FF272F
          DBFF2932DAFF1F2FEDFF2734DFFF5D4578FF864D22FF914C0DFF934F11FF9654
          19FF965724FF9B5D2AFFA16234FFA56938FFA46F50FF927885FF937A85FFAD7B
          66FFB07E6CFFA7725FFFD8BFB6FFFEFEFEFFCEB0A2FFAA745CFFAD7D6AFFC8A6
          99FFFEFDFDFFC5A598FFA06954FFA5725FFFDDCBC3FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF9F6F5FFC7A89CFFA5715FFFB18371FFB0826FFFB0826FFFB082
          6FFFB0826FFFB0826FFFB18370FFAF816FFFA87866FFA97762FFA97763FFA977
          62FFA97762FFA97763FFA97762FFA97762FFAA7864FFA36E58FFA6735FFFDFCD
          C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFDECAC2FFC8A696FFCFB3
          A6FFE3D3CDFFFBF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E9
          E1FFA7735DFFB48B7DFFF5EFEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF9
          F8FFD5BDB2FFCBAC9CFFD0B3A5FFD7BDB3FFEBDFDCFFFDFCFCFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF9683FFB28573FFFBF7F7FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F0E9FFCFB6AEFFD1B4A8FFD3B6A9FFD0B3
          AAFFCEB3ABFFCFB3ABFFD2B3A7FFCDB1A9FFD1B4A9FFC19885FF9E726BFF6B7E
          D4FF5D85F5FF5E79E5FF5D7AE6FF5B7BEBFF627ADCFF827289FF8B7072FF8371
          82FF666AB5FF4C66EBFF4D69E9FF4E63E1FF4A5FE2FF4A61E5FF4561EFFF645D
          A7FF9D5C28FFA15D1DFF6D5889FF3A56F5FF4058E6FF4355DEFF4254DFFF4457
          E1FF4256E2FF3D4FDFFF4253DCFF3E58F0FF4355DFFF7F575DFF9E5B21FF975C
          31FF965D35FF965D37FFA15F21FF8C5D50FF505DD3FF4867F2FF5067E3FF526B
          E3FF5670E5FF5872E4FF5B7AE9FF547AF7FF6A81DCFF817FB3FF8F7D97FF987E
          8CFF9C7D84FF9C7D86FF9A8090FF9084A5FF7485D0FF608AFAFF827FAFFFAC79
          63FFAA7862FFA06A54FFD4BBB1FFFEFEFEFFCCAEA1FFA9725AFFAC7863FFC8A8
          9AFFFEFDFDFFC3A295FF9D6753FFA5725FFFDDCBC3FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFEFEFEFFF8F4F1FFF2EBEBFFF5EFEEFFF5EFEEFFF5EFEEFFF5EF
          EEFFF5EFEEFFF5EFEEFFF8F4F4FFE9DDD9FFB28473FFA06953FFA97763FFA876
          62FFA87662FFA87662FFA87662FFA87662FFA97763FFA26D57FFA5725FFFDFCC
          C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1B6
          AAFF955A44FFB89184FFF5F0EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF3ECE9FFA57462FFB18572FFFBF8F7FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFCFFE0CABDFF96675FFF6F85
          D6FF628BF7FF6A8AE7FF698AE8FF698AE7FF698AEAFF638BF7FF628CFBFF648B
          F8FF648DF6FF6B8EEAFF6C8DE7FF6C8DE9FF6D8EE7FF6790F3FF6D8EE8FF9980
          8AFFB37759FFB0765BFF9C7D81FF6F8FE5FF6894F8FF6C8CE7FF698AE9FF6E91
          EAFF6E90E9FF6A8AE9FF6C8DE9FF6694FCFF808BC5FFAC7C67FFAF775DFFA978
          68FFAA7A69FFAA7A6AFFAB7A6BFFB47858FF9A8086FF6D8DE5FF668FF5FF6B8D
          E8FF6A8BE8FF6A8BE9FF698AE8FF6A8AE8FF6589F0FF608AF7FF6289F4FF6587
          EDFF6686E6FF6687E9FF6487EEFF6088F4FF6388F0FF5F8AF9FF807EB2FFA873
          5CFFA97662FF9F6853FFD3BAB0FFFEFEFEFFCCADA1FFA6705AFFAA755FFFC7A5
          99FFFEFDFDFFC4A295FF9D6451FFA26F5DFFDECBC3FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EAE7FFB48776FF9A634FFFA87664FFA572
          61FFA67461FFA67461FFA67361FFA67361FFA77662FF9F6956FFA16D5CFFDDCB
          C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0CFC9FFA676
          67FF945642FFBC9486FFF5EFEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFC6A798FF99614FFFB38877FFFBF8F7FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFAFFDAC0B3FF97665FFF6F84
          D6FF608AF7FF6887E7FF6787E8FF6787E8FF6787E8FF6787E9FF6687E9FF6787
          E9FF6787E8FF6787E8FF6787E8FF6787E6FF6389F1FF6189F5FF867CA4FFAD71
          51FFA7735EFFAC7357FFA47362FF7781C5FF5D8AFBFF6887E7FF6888E8FF6787
          E8FF6787E8FF6888E7FF6589EEFF6089F6FF877B9DFFAA7054FFA8745DFFA674
          62FFA77461FFA67361FFA67562FFA5725FFFAC6F50FF957783FF6B86E0FF5F89
          F8FF6687EAFF6787E6FF6787E8FF6787E8FF6787E7FF6787E7FF6687E9FF6587
          ECFF6588ECFF6588ECFF6687EAFF6787E8FF6787E6FF608AF7FF7980C0FFA772
          5DFFA67260FF9B6552FFD3B9B0FFFEFEFEFFCBADA0FFA6705AFFAA7560FFC7A5
          99FFFEFDFDFFC0A093FF986150FFA16D5CFFDFCBC4FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF2EAE6FFB28574FF996250FFA77462FFA471
          60FFA57261FFA47160FFA57261FFA47261FFA57362FF9E6855FFA16D5CFFDECC
          C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFAFFD4BCB3FFA37262FFA06B
          59FF985E4AFFBA9588FFF5F0EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFCFAF8FFC9AA9CFFA06C5CFF9C6654FFB28778FFFBF9F8FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFBFFDDC6B7FF93665BFF6B84
          DCFF5F8BFAFF6688EBFF6588ECFF6588ECFF6588ECFF6588ECFF6688ECFF6588
          ECFF6588ECFF6588EDFF6388F2FF6189F6FF6A86E1FF8B7A97FFAA7054FFA770
          58FFA47262FFA7725DFFA96F53FF887B9CFF608AF8FF6289F2FF6588EAFF6588
          ECFF6588ECFF6688EBFF5F8BFAFF6986E4FF987478FFAB6F50FFA57262FFA471
          60FFA57261FFA47160FFA57261FFA47261FFA47060FFAB7051FF9F746BFF7B81
          BDFF6589EFFF6189F5FF6488F0FF6588ECFF6687EAFF6687E9FF6787E8FF6787
          E8FF6787E8FF6787E8FF6687E9FF6687EBFF6688EBFF5F89FBFF7383CEFFA270
          61FFA6715EFF9B6451FFD2B8AFFFFEFEFEFFCAAC9FFFA56F59FFAA755FFFC5A3
          97FFFEFDFDFFC09E92FF975F4EFFA06C5AFFE3D1C8FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF2EBE7FFB28776FF965D4BFFA37260FFA26F
          5EFFA26F5EFFA26F5EFFA26F5EFFA26F5EFFA3705FFF9B6553FF9F6B5BFFD9C6
          C0FFFFFFFFFFF9F6F4FFF9F5F4FFF9F5F4FFF9F5F4FFF9F5F4FFF9F5F4FFF8F4
          F3FFF6F3F2FFF4EEE9FFE7DAD3FFCDB0A5FFAD8070FF996252FF9E6957FFA573
          61FF955D4AFFB79082FFF1E8E4FFFCFAFAFFF9F5F4FFF9F5F4FFF9F5F4FFF9F5
          F4FFF9F5F4FFF9F5F4FFF9F5F4FFF9F5F4FFF9F5F4FFF9F6F5FFF8F2F2FFEFE7
          E4FFD3BCB3FFAF8373FF9B6452FFA26E5CFF9C6654FFB08375FFF5EFEDFFF9F6
          F4FFF9F5F4FFF9F5F4FFF9F5F4FFF9F5F4FFF9F5F4FFF9F5F4FFF9F5F4FFF9F5
          F4FFF9F5F4FFF9F5F4FFF9F5F4FFFAF6F5FFF8F3F1FFD7BCACFF93665AFF6E83
          D6FF628AF6FF6787E8FF6787E9FF6787E9FF6787E9FF6787E9FF6687EAFF6987
          E6FF6B87E2FF6F84D6FF7980C0FF8A7997FF9E7168FFA76D51FFA46E5AFFA26F
          60FFA26F5EFFA26F5FFFA76C51FF997274FF6E85D8FF628AF6FF6787E8FF6787
          E9FF6787E9FF6687E9FF608AF8FF7C80BAFFA3705EFFA56E56FFA26F5FFFA26F
          5EFFA26F5EFFA26F5EFFA26E5EFFA26F5EFFA26F5EFFA16F5FFFA66D53FFA76E
          55FF95737CFF817CACFF7084D4FF6887E7FF6489F2FF6389F4FF6389F2FF6389
          F3FF6389F3FF6289F4FF628AF7FF6489F1FF6787EAFF6A86E2FF7F7EB1FF9F6F
          61FFA46F5DFF98614EFFD1B8AFFFFEFEFEFFCAAB9FFFA46D56FFA57161FFC5A3
          98FFFEFDFDFFBE9C90FF965F4FFFA06B5AFFC39F92FFD7C3BFFFD4BEB9FFD4BE
          B9FFD4BEB9FFD4BEB9FFD4BEB9FFD4BEB9FFD4BEB9FFD4BEB9FFD4BEB9FFD4BE
          B9FFD4BEB9FFD4BEB9FFD7C2BEFFCEB4ADFFA77666FF996352FFA16F5DFFA06D
          5CFFA06D5CFFA06D5CFFA06D5CFFA06D5CFFA06D5CFF9F6C5AFFA06E5BFFAA7B
          6DFFAF8377FFAE8174FFAD8074FFAD8074FFAD8074FFAD8074FFAE8175FFAB7E
          73FFA87A6EFFA4715EFF9B6451FF986150FF9C6856FFA06D5CFFA06D5CFFA06E
          5CFF9D6A58FFA47160FFAD8072FFAE8175FFAD8074FFAD8074FFAD8074FFAD80
          74FFAD8074FFAD8074FFAD8074FFAD8074FFAD8074FFAE8175FFAA7B6EFFA06B
          59FF996250FF9C6756FFA06E5DFFA06D5CFF9F6D5AFFA16F60FFAB7E73FFAE81
          74FFAD8074FFAD8074FFAD8074FFAD8074FFAD8074FFAD8074FFAD8074FFAD80
          74FFAD8074FFAD8074FFAD8074FFAD8074FFAE8175FFA87866FF9E6B5CFF9571
          76FF93737EFF94727BFF94727BFF94727BFF94727BFF94727CFF94727BFF9872
          75FF9A7270FFA06F62FFA46C55FFA46B52FFA26C58FFA06D5CFFA06D5CFFA06D
          5CFFA06D5CFFA06D5CFFA16D5AFFA16D5BFF987170FF92737FFF94727BFF9472
          7BFF94727BFF94727CFF93727FFF9C716CFFA26E5AFFA06D5BFFA06D5CFFA06D
          5CFFA06D5CFFA06D5CFFA06D5CFFA06D5CFFA06D5CFFA06D5CFFA06D5CFFA06D
          5BFFA26C56FFA56A4FFFA16D5CFF977173FF8F7588FF897A98FF857EA7FF827E
          ABFF827EADFF837DA8FF87799AFF8D778CFF95737BFF9F6F64FFA36C55FFA06D
          5BFFA06E5DFF965E4EFFD1B7AFFFFEFEFEFFC8A99DFFA26C55FF9F6E61FFC5A3
          97FFFEFDFDFFBE9A8EFF955B4BFF9E695AFF976152FF955C4BFF945C4CFF945C
          4CFF945C4CFF945C4CFF945C4CFF945C4CFF945C4CFF945C4CFF945C4CFF945C
          4CFF945C4CFF945C4CFF945C4BFF965E4DFF9C6558FF9D695AFF9D6859FF9D68
          59FF9D6859FF9D6859FF9D6859FF9D6859FF9D6859FF9D6859FF9D6758FF9962
          53FF955E4FFF965F50FF975F50FF975F50FF975F50FF975F50FF975F50FF975F
          50FF976051FF996254FF9C6758FF9D6859FF9D6859FF9D6859FF9D6859FF9D68
          59FF9E695AFF9B6556FF965F51FF965E50FF975F50FF975F50FF975F50FF975F
          50FF975F50FF975F50FF975F50FF975F50FF975F50FF975F50FF986051FF9A64
          56FF9D6859FF9D6859FF9D6859FF9D6859FF9D6859FF9B6657FF965E50FF965F
          50FF975F50FF975F50FF975F50FF975F50FF975F50FF975F50FF975F50FF975F
          50FF975F50FF975F50FF975F50FF975F50FF965E50FF996254FF9D6859FFA066
          50FFA1654EFFA0654FFFA0654FFFA0654FFFA0654FFFA0654FFFA0654FFFA065
          50FF9F6551FF9E6655FF9D6758FF9C6859FF9C6859FF9D6859FF9D6859FF9D68
          59FF9D6859FF9D6859FF9C685AFF9D6757FF9F6550FFA0654EFFA0654FFFA065
          4FFFA0654FFFA0654FFFA0654EFF9E6653FF9D6859FF9D6859FF9D6859FF9D68
          59FF9D6859FF9D6859FF9D6859FF9D6859FF9D6859FF9D6859FF9D6859FF9D68
          59FF9C6859FF9C685AFF9D6755FF9F6550FFA2654BFFA1664DFFA2674DFFA267
          4FFFA2674FFFA3664CFFA1654CFFA0654EFFA06550FF9E6652FF9D6858FF9D68
          59FF9D695AFF925748FFCFB3ACFFFEFEFEFFC5A7A0FF9E6955FF9F6D5FFFC2A1
          95FFFDFDFDFFB9968BFF8D5243FF996456FF986153FF976052FF976152FF9761
          52FF976152FF976152FF976152FF976152FF976152FF976152FF976152FF9761
          52FF976152FF976152FF976152FF976052FF986153FF986254FF986254FF9862
          54FF986254FF986254FF986254FF986254FF986254FF986254FF986254FF9862
          54FF986254FF986254FF986254FF986254FF986254FF986254FF986254FF9862
          54FF986254FF986254FF986254FF986254FF986254FF986254FF986254FF9862
          54FF986254FF986254FF986254FF986254FF986254FF986254FF986254FF9862
          54FF986254FF986254FF986254FF986254FF986254FF986254FF986254FF9862
          54FF986254FF986254FF986254FF986254FF986254FF986254FF986254FF9862
          54FF986254FF986254FF986254FF986254FF986254FF986254FF986254FF9862
          54FF986254FF986254FF986254FF986254FF986254FF986254FF986254FF9862
          54FF986254FF986254FF986254FF986254FF986254FF986254FF986254FF9862
          54FF986254FF986254FF986254FF986254FF986254FF986254FF986254FF9862
          54FF986254FF986254FF986254FF986254FF986254FF986254FF986254FF9862
          54FF986254FF986254FF986254FF986254FF986254FF986254FF986254FF9862
          54FF986254FF986254FF986254FF986254FF986254FF986254FF986254FF9862
          54FF986254FF986254FF986254FF986254FF986254FF986153FF986153FF9861
          53FF986152FF986153FF986254FF986254FF986254FF986254FF986254FF9862
          54FF986355FF8F5444FFCFB4ABFFFEFEFEFFC7A69CFF9D6551FF9F6C5EFFC4A0
          94FFFFFFFFFFF0E9E7FFE3D6D4FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DB
          D8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DB
          D8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DB
          D8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DB
          D8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DB
          D8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DB
          D8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DB
          D8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DB
          D8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DB
          D8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DB
          D8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DB
          D8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DB
          D8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DB
          D8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DB
          D8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DB
          D8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DB
          D8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DB
          D8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DBD8FFE7DB
          D8FFE7DBD8FFE5D7D4FFF5F0EEFFFFFFFFFFC6A89DFF976356FFA06E60FFC09C
          92FFFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFC5A49AFF9B6453FF9F6F65FF9D6A
          5BFFAC8276FFAC8175FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB80
          74FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB80
          74FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB80
          74FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB80
          74FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB80
          74FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB80
          74FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB80
          74FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB80
          74FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB80
          74FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB80
          74FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB80
          74FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB80
          74FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB80
          74FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB80
          74FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB80
          74FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB80
          74FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB80
          74FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB8074FFAB80
          74FFAB8074FFAB8074FFAB8175FFAE8377FF9D6F60FF9C6858FFBE9D93FFB38C
          83FFAF847AFFAF847AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF85
          7AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF85
          7AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF85
          7AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF85
          7AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF85
          7AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF85
          7AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF85
          7AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF85
          7AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF85
          7AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF85
          7AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF85
          7AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF85
          7AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF85
          7AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF85
          7AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF85
          7AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF85
          7AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF85
          7AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF857AFFAF85
          7AFFAF857AFFAF857AFFAF847AFFAE8379FFB28D83FFB9958BFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          76800000424D7680000000000000360000002800000098000000360000000100
          2000000000004080000000000000000000000000000000000000F9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF6F5
          F5FCF6F5F5FCF6F5F5FCF6F5F5FCF8F7F7FEF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF6F6F8FFF0F2F6FFEBEFF5FFD8E4F2FFCFDBF1FFC3D3
          EFFFBCCDEDFFBBCCEDFFC0D1EFFFC8D6F0FFD9E4F3FFECF0F5FFEFF1F6FFF5F6
          F7FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF8F7
          F8FFF1F2F6FED7E2F1FFBCCEEFFF92B0E7FE7399DDFF5A84D0FE507ED0FF4A7C
          D1FF477BD2FE477BD3FF4A7CD2FF4D7DD0FE5682D0FF678ED7FE86A6E5FFABC1
          EEFFCAD8EEFEEFF2F6FFF7F7F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF6F6F7FFE2EAF4FFC2D3
          EEFF93B0E3FF5884CDFF356CC5FF2A6AD2FF256CDBFF216DDEFF216EE0FF206F
          E1FF1F70E0FF2071E0FF206FE0FF216FE1FF236EE0FF246CDEFF286BD7FF3069
          CBFF4272C6FF7EA0DDFFADC4E9FFDFE8F5FFF3F5F7FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF7F7F8FFE6ECF4FFB4C6E7FE7196D9FF3F73
          D3FF2267CFFE1F6FD9FF2076DDFF2176DEFE2076E0FF1F75DFFE1F75E0FF1E76
          E0FF1E75DFFE1F77E0FF1E76E0FF1E75DFFE1F76E0FF1F75DFFE1F75E0FF2275
          DFFF2072DBFE2069D4FF2B69D0FF5E86D7FE97B1E0FFD9E3F4FFF7F7F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFEFF2F5FEC1D2F0FF779ADCFF477BD0FE2A6FD4FF2370
          DCFF2073DFFE1E75E0FF1D76DFFF1F77DEFE1F77DFFF1E76DDFE1F77DFFF1F77
          DFFF1E76DDFE1F77DFFF1E77DFFF1E76DDFE1F77DFFF1E76DEFE1E76DFFF1F76
          DFFF1F75DFFE1F74E1FF2172DFFF276FD6FE3773D1FF618BD7FFA1B9E6FEE7EC
          F5FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF8F8F8FFE3EBF4FF9DB8E5FF5481D2FF2D6FD6FF2270DCFF1F74E0FF1F76
          DFFF1E76DFFF1E76DFFF1D77DFFF1F77DFFF1F77DFFF1F77DFFF1F77DFFF1F77
          DFFF1F77DFFF1E77DFFF1E77DFFF1F77DEFF1F77DFFF1F77DFFF1F77DFFF1F77
          DFFF1E76DFFF1E76DFFF1F76DFFF1F75E0FF2073DEFF276FD9FF3E74D2FF799C
          DCFFD4DFF1FFF8F7F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF7F7
          F8FFDEE6F3FE8CAADFFF4077D4FE2770D7FF2174DDFF1F75DEFE1E76E0FF1E76
          DFFF1E76DDFE1F77DFFF1F77DFFF1E76DDFE1F77DFFF1E76DDFE1F77DFFF1F77
          DFFF1E76DDFE1D77DFFF1D77DFFF1E77DDFE1F77DFFF1E76DDFE1F77DFFF1F77
          DFFF1E76DDFE1F77DFFF1F77DFFF1E76DEFE1E75E0FF1F74DFFF2471DAFE3170
          D4FF6A91D8FEBACDECFFF7F7F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF6F6F7FFC6D6
          F0FF799DDBFE3170D0FF2070DBFE1F75DFFF1F77DFFF1E76DDFE1F77DFFF1F77
          DFFF1E76DDFE1F77DFFF1F77DFFF1E76DDFE1F77DFFF1E76DDFE1F77DFFF1F77
          DFFF1E76DDFE1D77DFFF1E77DFFF1E76DDFE1F77DFFF1E76DDFE1F77DFFF1F77
          DFFF1E76DDFE1F77DFFF1F77DFFF1E76DDFE1E77DFFF1E76DFFF1F75DEFE1F73
          DFFF276DD3FE4F80D1FFAEC5EBFFF5F5F7FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF8F7F8FFD4E1F3FF799D
          DAFF3272D0FF2072DEFF1F76E0FF1F77DEFF1F77DFFF1F77DFFF1F77DFFF1E76
          DFFF1E77DFFF1F77DFFF1F78DFFF1F77DFFF1F77DFFF1F77DFFF1F77DFFF1F77
          DFFF1F77DFFF1F77DFFF1F77DFFF1F77DFFF1F77DFFF1F77DFFF1F77DFFF1F77
          DFFF1F77DFFF1F78DFFF1F77DFFF1F77DFFF1E77DFFF1E77DFFF1F77DFFF1F76
          DFFF1F73DFFF216ED7FF5A88D2FFAFC5EBFFF7F7F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF8F8F8FFD3DFF1FE84A6DEFF2A6F
          D2FF2072DCFE1E75DFFF1F77DDFE1F77DEFF1F77DDFF1F77DCFE1F77DDFF1F77
          DDFF1F77DDFE1F77DFFF1F77DFFF1E76DDFE1F77DFFF1E76DDFE1F77DFFF1F77
          DFFF1E76DDFE1F77DFFF1F77DFFF1E76DDFE1F77DFFF1E76DDFE1F77DFFF1F77
          DFFF1F76DDFE1F77DEFF1F77DEFF2077DCFE1F77DDFF1F77DDFF1F77DDFE1F77
          DEFF1F76DEFE2075E0FF256FD8FF5383D4FEB7CBEBFFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFEBF0F6FF8CAEE2FF3B77D1FF2072
          DEFF1F76E0FF1F77DFFF2078DDFF277AD7FF2D7CD2FF307DD0FF2F7CD0FF2C7C
          D3FF2579D9FF2078DEFF1F77DFFF1F77DFFF1F77DFFF1E77DFFF1F77DFFF1F77
          DFFF1F77DFFF1F77DFFF1F77DFFF1F77DFFF1F77DFFF1F77DFFF1E76DFFF1F77
          DFFF1F77DEFF2279DBFF297BD6FF2F7CD0FF307DD0FF2E7DD1FF2A7BD4FF2279
          DBFF1F77DFFF1F76DFFF2074E0FF2870D5FF6692D9FFD3E0F3FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF3F5F7FFADC6E9FF457ED3FE2271DAFF1F76
          DFFF1E76DEFE2078DDFF3A88DEFE7DB8E9FFA5D0EBFFA9D2EAFEAAD2EBFF9FCC
          EAFF72ADE5FE2F81DBFF1F77DEFF1E76DDFE1E77DFFF1D76DDFE1E77DFFF1F77
          DFFF1E76DDFE1F77DFFF1F77DFFF1E76DDFE1F77DFFF1E76DDFE1E76DFFF1E76
          DFFF2279DBFE5399E1FF8EC2EAFFA5D1EAFEA9D4EBFFA7D2EBFF92C4E9FE589E
          E5FF2279DAFE1F77DEFF1F76DFFF2073DDFE3074D6FF7FA4DFFFE9EEF5FEF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF8F7F8FFC7D9F1FF618ED7FF2772D5FE1F75DEFF1F77
          DFFF1E76DDFE287CDAFF77AFE2FECFECF7FFEDF9FBFFEFF8FBFEF0FAFCFFEAF7
          FAFFC8E4F6FE60A0E2FF2178DCFF1E77DDFE1F77DFFF1E76DDFE1F77DFFF1F77
          DFFF1E76DDFE1F77DFFF1F77DFFF1E76DDFE1F77DFFF1E76DEFE1D75E0FF1D75
          E0FF2E7FD9FEADD2F2FFE0F3F9FFEDF8FAFEF0FAFCFFEEF9FCFFDFF3F8FEADD8
          F0FF3882D6FE2077DDFF1F77DFFF1E76DEFE2273DBFF3E79D2FF9AB9E6FEF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFEDF1F6FF91B1E3FF3777D6FF2074DDFF1F77DFFF1E77
          DFFF1E77DEFF2E80DAFF91BFE7FFE5F6FAFFFBFDFDFFFDFEFEFFFDFEFEFFFAFD
          FDFFE5F4FAFF76AEE4FF2378DCFF1F77DFFF1F77DFFF1F77DFFF1F77DFFF1F77
          DFFF1F77DFFF1F77DFFF1F77DFFF1F77DFFF1F77DFFF1E76DFFF1D75E0FF1E76
          DFFF3482D8FFD0E8F6FFF5FBFCFFFCFEFEFFFDFEFEFFFDFEFEFFF3FBFCFFC7E6
          F5FF478DDAFF2178DDFF1F77DFFF1E76DFFF1F75DFFF2872D9FF5C8BD9FFE9EF
          F6FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF8F7F7FFF8F7F7FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF8F7F7FFF5F4F4FFECEAEAFFE3E1E1FFECEBEAFFF6F5
          F4FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF8F7F7FFF8F7F7FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF8F7
          F7FFF1EFEEFFE7E5E5FFD7D5D6FFE9E7E7FFF3F2F2FFF9F8F7FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF7F7F8FFC2D5EDFE5185D3FF2473DAFF1E75DFFE1E76DFFF1E77
          DFFF1E76DDFE2F81D9FF94C0E7FEE7F6FAFFFCFDFDFFFDFDFDFEFEFFFFFFFCFF
          FFFFE9F4FAFE7BB0E4FF2378DCFF1E76DDFE1F77DFFF1E76DDFE1F77DFFF1F77
          DFFF1E76DDFE1F76DFFF1E76DFFF1E76DDFE1F77DFFF1E76DDFE1F77DFFF1F77
          DEFF3582D5FED6EBF6FFF8FDFEFFFDFDFDFEFFFFFFFFFEFEFEFFF3FAFBFECAE7
          F5FF4A8ED8FE2178DDFF1F77DFFF1E76DDFE1E76E0FF1F73DEFF3375D3FE95B4
          E1FFF8F7F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF1F0F0FEC8C6C5FFB5B2B2FEB7B4B3FFC9C7C5FFF2F1F1FFF9F8
          F8FFF9F8F8FFDBD8D7FEC9C6C4FFE1DEDDFEEDEBEBFFCCCAC9FFD1CFCDFEF8F7
          F7FFF9F8F8FFF9F8F8FFEAE9E8FFCAC7C6FFD5D4D3FEF9F8F8FFF9F8F8FFF9F8
          F8FFC0BCBBFF898686FE878483FF8F8D8BFFC8C5C5FEF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFB5B3B2FF898683FF878480FE928F8EFFECE9E9FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFA7A4A2FE878581FF878483FF9B98
          96FEC2BFBFFF969392FE878483FF898684FFAEAAA9FEF8F7F6FFF9F8F8FFF9F8
          F8FFF7F6F6FFC8C6C6FF969393FE827F7DFF7C7A78FE797776FF7E7A77FF8682
          7FFE9D9B99FFC4C1C1FFA3A1A0FE878483FF868382FE888482FFEFEEEDFFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF2F1F1FFB2AFAEFF8C89
          87FE817C7AFF7B7876FF787773FE7C7977FF84817EFF999796FEC9C7C6FFF3F2
          F1FEF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF3F5F7FF8CB0E5FE3174D2FF2075DEFF1E76DEFE1E77DEFF1F77
          DFFF1E76DDFE2F81DAFF93C0E7FEE7F6FAFFFCFDFDFFFDFDFDFEFEFFFFFFFCFF
          FFFFE8F4F9FE7AAFE3FF2378DCFF1E76DDFE1F77DFFF1E76DDFE1F77DFFF1E77
          DFFF1E76DEFE1D75E0FF1D76E0FF1E76DDFE1F77DFFF1E76DDFE1F77DFFF1F77
          DEFF3482D6FED5EBF6FFF8FDFEFFFDFDFDFEFFFFFFFFFEFEFEFFF3FAFBFEC9E7
          F5FF4A8ED9FE2078DCFF1D77DFFF1E76DEFE1F76DFFF1F75DFFF2573D8FE5E8D
          D8FFE1EAF4FEF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFD4D3D4FF91908FFE767572FF706F6BFE716F6BFF777571FF8B8A87FED6D4
          D4FFF5F3F3FF918F8DFE76746FFF979592FEA9A7A6FF7C7A77FF7F7D79FED4D3
          D0FFF9F8F8FFF6F5F5FF9B9895FF767470FF807F7CFEDDDCDAFFF9F8F8FFF9F8
          F8FFABA8A5FF676461FE62605DFF6D6A67FFB6B3B2FEF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF8F7F7FF9C9A98FF64635DFF63605BFE726E6AFFCECBCAFFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF6F5F5FF8B8885FE63605BFF62605CFF7B7A
          76FEACAAA8FF767570FE62605CFF64615FFF93908EFEF7F5F5FFF9F8F8FFF6F5
          F5FFA3A09FFF797674FF686563FE62605DFF61605DFE61605EFF62605CFF6361
          5CFE6A6863FF938F8EFF848180FE62605DFF62605DFE63615AFFE6E5E4FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFEFEEEEFF8D8B89FE706D6BFF6462
          60FE62605DFF62605DFF615F5DFE62605DFF62605DFF686663FE7A7876FFB0AE
          ADFEEAE9E8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFE3EDF6FF4C85D6FF2372DCFF1F76DFFF1F77DFFF1F77DFFF1F77
          DFFF1E76DFFF2B7EDBFF86BBE6FFDFF3F9FFFAFDFEFFFEFEFFFFFEFFFFFFF8FD
          FDFFDCF0F9FF6DA9E4FF2278DCFF1F76DEFF1F77DEFF1F77DEFF1F77DEFF1E76
          DFFF1E76DFFF1D75E0FF1E76E0FF1F77DFFF1F77DFFF1F77DFFF1F77DFFF1F76
          DEFF3081DAFFC3E1F5FFF0FAFCFFFDFEFEFFFFFFFFFFFEFEFEFFF0FAFBFFBEE1
          F3FF4089D9FF2078DDFF1D77DFFF1D77DFFF1E77DFFF1F77DFFF2075DEFF3074
          D7FFA2C1E9FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFDDDB
          DAFF787774FF646360FF666461FF767472FF83827EFF807F7BFF71706CFF7A78
          74FFBEBDBCFF7E7D7BFF61605BFF888682FF9C9B99FF6A6764FF6C6B65FFC2C1
          BFFFF9F8F8FFF6F5F5FF8B8986FF62605DFF6F6E69FFD0CDCCFFF9F8F8FFF9F8
          F8FFABA8A6FF666462FF62605EFF6D6A68FFB8B4B4FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF7F6F6FF9B9B9AFF64625FFF615F5DFF726E6BFFCFCCCCFFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF7F5F5FF8C8988FF62605DFF62605DFF7B7A
          76FFABAAA8FF767570FF62605DFF636160FF939191FFF7F6F6FFF8F7F7FF9B99
          97FF6A6764FF62605EFF62605EFF63625FFF6B6965FF797773FF7D7C77FF7472
          6DFF686660FF8D8988FF848383FF62605EFF62605DFF63605CFFEBE9E9FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF1F0EFFF858481FF64625FFF62605EFF6361
          5FFF6D6A68FF7C7A77FF82807CFF787672FF666360FF62605EFF62605EFF6E6D
          69FFA2A09FFFF5F4F4FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF6F6F8FFB9CFEDFF2E74CFFE1F74DFFF1E76DFFF1E76DDFE1F77DFFF1F77
          DFFF1D76DFFE247ADBFF5A9DDEFEBAE0F4FFE7F7FBFFECF8FBFEEDF9FCFFE3F6
          FAFFAFD5EFFE4990DBFF2178DBFF2178DAFE2279DAFF2279D9FE2279DAFF2278
          DCFF2077DCFE1F77DEFF1F77DFFF1E76DDFE1F77DFFF1E76DDFE1F77DFFF1F77
          DEFF297DD9FE8FBCE6FFDBEFF8FFF5FBFBFEFAFDFDFFF7FCFDFFDFF0F7FE93C3
          EBFF2D7DD5FE1F77DDFF1D77DFFF1E76DEFE1F77DFFF1E76DFFF1E75DFFE216F
          D7FF78A2DDFEF6F6F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF1EFEFFE9490
          8DFF62615DFF656461FE939290FFCCC9C9FEE0DEDEFFDBDAD9FFBEBDBCFE7B7A
          77FF7E7D7AFF6D6D6BFE60605CFF868582FE9D9A99FF6B6765FF6C6B65FEC3C1
          BFFFF9F8F8FFF7F6F6FF979491FF716F6BFF7D7A77FEECEBEBFFF9F8F8FFF9F8
          F8FFABA9A6FF666561FE615F5DFF6C6A68FFB6B3B3FEF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF7F6F6FF9B999BFF63615FFF615F5DFE726E6DFFCFCCCCFFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF6F5F5FF8B8887FE62605EFF62605DFF7B7A
          76FEACABA8FF767471FE62605DFF63615FFF929090FEF4F3F4FFB8B7B6FF6C6B
          67FE62605EFF62605EFF666462FE898887FFB9B8B6FED2D0CEFFD8D5D5FFC9C7
          C5FEACAAA7FFAEABAAFF858483FE62605DFF62605DFE63605CFFEBE9E9FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FF9D9C99FF64645FFF61605DFE62605EFF7573
          71FEAFADACFFD5D3D2FFDDDBDAFECFCDCBFF989492FF656260FE61605EFF6060
          5CFE706F6CFFC6C4C3FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFE8EFF6FF81A6D8FF2675D7FF1E75E0FF1E76DFFF1E77DFFF1E77DFFF1F77
          DFFF1F77E0FF1F77DEFF277CDCFF3D8ADCFF5097DFFF5599E0FF5599E0FF4E96
          E0FF3A88DBFF297CD7FF3A86DAFF69A4E2FF79AEE3FF7BAFE3FF79AEE3FF62A1
          E2FF3684DAFF2179DDFF1F77DFFF1F77DFFF1F77DFFF1F77DFFF1F77DFFF1E77
          DFFF2479DAFF5391D2FF93B8DBFFB9CDE0FFBDCEE0FFB9CDE1FF9CBCDBFF5493
          D4FF247AD9FF1F78DEFF1E76DFFF1E76DFFF1F77DFFF1E77DFFF1E76E0FF2074
          DDFF467ECEFFD8E5F3FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFB8B5B4FF6D6B
          68FF63615EFF8C8B88FFDFDEDDFFF7F6F5FFF8F7F6FFF8F7F6FFF6F5F4FFCFCE
          CCFF74736FFF62615EFF61615CFF878684FF9B999AFF696765FF6C6B65FFC3C2
          C0FFF9F8F8FFF9F8F8FFF9F8F8FFF7F6F5FFF8F6F6FFF9F8F8FFF9F8F8FFF9F8
          F8FFABA9A7FF666461FF615F5DFF6D6A69FFB7B4B5FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF7F6F6FF9B9A9CFF636160FF62605EFF726E6DFFCFCCCCFFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF6F5F5FF8C8988FF62605EFF62605EFF7B7A
          77FFACABA9FF767472FF62605EFF646160FF939191FFE5E3E4FF787675FF6360
          5FFF615F5EFF656461FF92908EFFE5E3E3FFF6F5F5FFF8F7F6FFF8F7F6FFF7F7
          F6FFF3F3F2FFE7E7E6FF898886FF62605DFF62605DFF63605CFFEBE9E9FFF9F8
          F8FFF9F8F8FFF9F8F8FFF1F0F0FF6F6C69FF61605DFF62605EFF6F6C69FFB5B3
          B4FFF3F1F1FFF8F7F6FFF8F7F6FFF7F6F5FFE6E5E4FF93928FFF646260FF6260
          5EFF63615EFF9A9796FFF2F0F0FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF8F7
          F7FEC8DCF2FF5A8ED4FF2276DAFE1E76DFFF1E77DFFF1D76DDFE1E77DFFF1F77
          DFFF1E77DDFE1F77DFFF1E76DDFE2077DEFF2278DEFF2277DDFE2278DEFF2177
          DFFF2077DDFE3583DBFF92C4ECFFD1ECF6FEDFF2F9FFDFF1F9FEDEF3F9FFCCEB
          F6FF85BBE7FE2E81DCFF1F77DFFF1E76DDFE1F77DFFF1E76DDFE1F77DFFF1E77
          DEFF297DDAFE90C3ECFFD0ECF6FFE3F3F8FEE7F4F9FFE4F3F9FFD1ECF6FE95C7
          EEFF2E7FD6FE1F78DDFF1E76DFFF1E76DDFE1F77DFFF1F77DFFF1E76DEFE2076
          DEFF2B6FCBFEACC9EDFFF9F8F8FFF9F8F8FFF9F8F8FFF8F6F6FF949292FE6260
          5EFF6E6B68FFB9B6B5FEF3F2F2FFF6F5F4FEF8F7F6FFF8F7F6FFF6F5F4FEEFEE
          EDFF9E9C9AFF656360FE62615CFF868582FE9C9A9AFF696765FF6C6B65FEC3C2
          BFFFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFABA8A7FF666462FE62605EFF6D6A68FFB6B3B4FEF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF7F6F6FF9B9A9CFF636260FF615F5DFE726E6DFFCECCCCFFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF6F5F5FF8B8887FE62605EFF62605DFF7B7A
          77FEABABA8FF767472FE62605EFF63615FFF918F8FFECBC8CAFF63615FFF615F
          5EFE615F5EFF787674FFCECECEFEF9F8F8FFF8F7F7FEF9F8F7FFF9F8F7FFF7F7
          F6FEF8F8F7FFEEEEEDFF888785FE62605DFF615F5DFE63605CFFEBE9E9FFF9F8
          F8FFF9F8F8FFF9F8F8FFBEBABBFE63605DFF62605EFF62605EFE8C8B89FFE2E1
          E0FEF8F7F6FFF8F7F6FFF6F5F4FEF8F7F6FFF7F6F5FFC3C1BEFE706F6BFF615F
          5EFE625F5EFF7F7B7AFFD4D1D1FEF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFE7E6
          E6EDAFCBF0FF4482D9FF2076DBFE1E77DFFF1F77DFFF1E76DDFE1F77DFFF1E77
          DFFF1E77DDFE1F77DFFF1E76DDFE1E76DFFF1E76DFFF1E76DEFE1F77DFFF1F77
          DFFF2077DCFE4C92DEFFBCDEF3FFEEF8FAFEF8FCFDFFF8FBFDFEF8FCFDFFECF8
          FBFFB5D7F1FE3D8ADCFF1F77DFFF1E76DDFE1F77DFFF1E76DDFE1F77DFFF1F77
          DEFF3180D8FEC6E3F6FFEFF9FCFFF7FBFCFEFAFDFEFFF9FCFEFFECF8FAFEC0E3
          F3FF438AD7FE2078DCFF1D75E0FF1E76DEFE1F77DEFF1F77DEFF1E76DDFE2077
          DEFF2470D3FE8AB1EAFFF7F7F8FFF9F8F8FFF9F8F8FFEFEDEDFF83807FFE6260
          5EFF7A7674FFD6D4D5FEF7F6F6FFF6F5F5FEF8F7F6FFF8F7F6FFF6F5F4FEF7F6
          F5FFBCB9B8FF6D6B68FE62615CFF868582FE9D9A9AFF6B6765FF6C6B65FEC3C2
          BFFFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFAAA8A7FF666462FE62605EFF6D6A68FFB6B3B4FEF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF7F6F6FF9B9A9CFF636260FF615F5DFE726E6DFFCECBCCFFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF6F5F5FF8B8887FE615F5DFF615F5DFF7B7A
          77FEABABA8FF767472FE62605EFF63615FFF908E8DFEB2AEAFFF62605EFF615F
          5DFE646260FF888786FFE6E6E6FEFAF9F9FFF8F7F7FEFAF9F9FFFAF9F9FFF8F7
          F7FEF9F8F8FFEEEEEDFF888785FE62605DFF615F5DFE63605CFFE6E5E5FFF9F8
          F8FFF9F8F8FFF9F8F8FFA7A3A2FE635F5CFF62605EFF656461FEA2A09FFFEEED
          ECFEF8F7F6FFF8F7F6FFF7F6F5FEF8F7F6FFF8F7F6FFD9D8D7FE7E7C79FF615F
          5EFE625F5FFF6F6C6AFFCAC7C6FEF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FF97BBEAFF3278DBFF1F76DEFF1F77DFFF1F77DFFF1F77DFFF1F77DFFF1D77
          DFFF1E77DFFF1F77DFFF1F77DFFF1E76DFFF1E76DFFF1F77DFFF1F77DFFF1F77
          DFFF2077DCFF5497DEFFC7E3F4FFF5FBFDFFFEFEFFFFFFFFFFFFFEFFFFFFF4FB
          FCFFC4DFF4FF438DDBFF2077DEFF1F77DFFF1F77DFFF1F77DFFF1F77DFFF1F77
          DEFF3583D7FFD5ECF7FFF6FCFCFFFDFEFFFFFFFFFFFFFEFEFEFFF4FBFCFFCAE8
          F5FF4B8FD9FF2078DCFF1E76DFFF1F77DFFF1F77DFFF1F77DEFF1F77DEFF1F76
          DFFF2172DCFF689BE1FFF4F5F8FFF9F8F8FFF9F8F8FFDEDCDDFF787573FF6260
          5EFF817D7AFFE5E4E4FFF9F8F8FFF9F7F7FFF8F7F7FFF8F8F7FFF8F7F6FFF8F7
          F6FFCDCAC9FF74736EFF62615CFF888683FF9C9A9AFF696765FF6C6B65FFC3C2
          C0FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFABA8A7FF666462FF62605EFF6C6968FFB6B3B3FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF7F6F6FF9B9A9CFF646260FF62605EFF716D6CFFCCCACAFFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF6F5F5FF8C8988FF62605EFF62605EFF7B7A
          77FFACABA9FF767472FF62605EFF636160FF908E8EFFA5A1A1FF62605EFF6160
          5EFF676563FF9B9A99FFEDEDEDFFFAF9F9FFFAF9F9FFFAF9F9FFFAF9F9FFFAF9
          F9FFFAF9F9FFF0EFEFFF8A8887FF62605DFF62605EFF62605DFFD4D4D3FFF9F8
          F8FFF9F8F8FFF9F8F8FF9F9B9BFF625F5DFF62605EFF6A6766FFB2B0AFFFF2F1
          F0FFF8F7F6FFF8F7F6FFF8F7F6FFF8F7F6FFF8F7F6FFE7E5E4FF85847FFF625F
          5EFF625F5EFF6B6866FFC5C3C1FFF9F8F8FFF9F8F8FFF9F8F8FFF8F7F7FEF9F8
          F8FF87B1E3FF2672D8FF1F75DEFE1F77DFFF1F77DFFF1E76DDFE1F77DFFF1D77
          DFFF1E76DDFE1F77DFFF1E76DDFE1F77DFFF1F77DFFF1E76DDFE1F77DFFF1F77
          DFFF2077DBFE5496DDFFC8E3F4FFF4FBFCFEFEFEFFFFFDFDFDFEFEFFFFFFF4FB
          FCFFC4DEF3FE438DDBFF2077DEFF1E76DDFE1F77DFFF1E76DDFE1F77DFFF1F77
          DEFF3582D6FED5ECF7FFF7FCFDFFFCFDFDFEFFFFFFFFFEFEFEFFF3FAFBFECAE7
          F5FF4B8ED8FE2078DCFF1F77DFFF1E76DDFE1F77DFFF1F77DEFF1E77DDFE1F76
          DFFF2073DEFE538DD8FFF1F4F7FFF9F8F8FFF9F8F8FFD5D3D4FF74726FFE6260
          5EFF837F7CFFE8E7E7FEF9F8F8FFF8F7F7FEF9F8F7FFF8F8F7FFF6F6F5FEF8F7
          F6FFD2D0CFFF767571FE62615CFF868582FE9B9999FF686665FF6A6964FEC0BF
          BDFFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFABA8A7FF666462FE62605EFF696665FFACAAA9FEF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF7F6F6FF999899FF646160FF615F5DFE6E6A69FFC5C2C1FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF6F5F5FF888583FE62605EFF62605EFF7C7A
          78FEACAAAAFF767573FE62605EFF63615FFF8F8D8CFEA6A2A1FF62605EFF615F
          5DFE676563FF979695FFEBEAEBFEFAF9F9FFF8F7F7FEFAF9F9FFFAF9F9FFF8F7
          F7FEFAF9F9FFF0EEEFFF888786FE62605EFF625F5EFE62605CFFC9CAC9FFF9F8
          F8FFF9F8F8FFF9F8F8FF9E9C9CFE62605EFF62605EFF696765FEAFAEADFFF0EF
          EFFEF8F7F6FFF8F7F6FFF6F5F4FEF8F7F6FFF8F7F6FFE4E2E1FE84827EFF615F
          5DFE62605EFF6B6866FFC5C3C2FEF9F8F8FFF9F8F8FFF9F8F8FFF8F7F7FEF9F8
          F8FF7AA7E0FF2070D8FF1E75DFFE1D76DFFF1E76DFFF1E76DDFE1F77DFFF1E77
          DFFF1E76DDFE1E77DFFF1D76DDFE1D77DFFF1E77DFFF1E76DDFE1F77DFFF1F77
          DFFF2077DBFE5094DEFFC1E1F3FFF2FAFBFEFBFDFEFFFBFDFDFEFAFEFDFFEFF9
          FBFFBADAF3FE3F8ADBFF1F77DEFF1E76DDFE1F77DFFF1E76DDFE1F77DFFF1F77
          DEFF3381D7FECCE6F6FFF2FAFCFFFAFDFDFEFCFEFEFFFBFEFEFFF0F9FAFEC4E5
          F4FF468CD9FE2078DCFF1F77DFFF1E76DDFE1F77DFFF1F77DFFF1E76DDFE1F76
          DFFF1F74E0FE4685D3FFF0F3F7FFF9F8F8FFF9F8F8FFE5E3E4FF787573FE6260
          5EFF7E7C79FFE1E0E0FEF9F8F8FFF8F7F7FEFAF9F8FFF9F9F8FFF8F7F7FEF9F8
          F8FFCAC7C6FF72716DFE62615CFF868582FE9C9A9AFF696665FF656260FEB7B5
          B2FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFABA8A7FF666462FE62605EFF646260FF9C9998FEF9F8F7FFF9F8F8FFF9F8
          F8FFF9F8F8FFF7F5F6FF928F90FF64615FFF615F5DFE676563FFB1AFAEFFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF5F4F4FF7F7D7AFE62605EFF62605EFF7D7B
          7AFEB0ACACFF777573FE62605EFF63615FFF908E8EFEB7B4B4FF62605EFF625F
          5EFE63615FFF838281FFE2E2E2FEFAF9F9FFF8F7F7FEFAF9F9FFFAF9F9FFF8F7
          F7FEFAF9F9FFF0EEEFFF888686FE62605EFF615F5DFE62605CFFAFAFAEFFF7F6
          F6FFF9F8F8FFF9F8F8FFB3B2B1FE62605CFF62605EFF646360FE9D9C9AFFECEB
          EBFEF8F7F6FFF8F7F6FFF7F5F4FEF8F7F6FFF8F7F6FFD5D3D2FE7C7976FF615F
          5DFE62605DFF73706DFFCCCAC9FEF9F8F8FFF9F8F8FFF9F8F8FFF8F7F7FEF9F8
          F8FF75A3E0FF2070DAFF1D75E0FF1E77DFFF1E77DFFF1F77DFFF1F77DFFF1F77
          DFFF1F77DFFF1E77DFFF1E77DFFF1E77DFFF1E77DEFF1F77DEFF1F77DFFF1F77
          DFFF1F77DDFF3C88DCFFA3D0EEFFE1F4F9FFEEF8FBFFF0F9FBFFEDF8FBFFDAF2
          F9FF98C8EEFF3484DDFF2077DEFF2077DEFF2077DEFF2077DEFF2077DEFF2077
          DEFF2D7FDBFFA5CFF0FFDDF2F8FFEFF9FBFFF2F9FBFFEFF9FBFFE0F3F9FFA6D3
          F0FF3281D8FF1F77DDFF1F77DFFF1F77DFFF1F77DFFF1F77DFFF1F77DFFF1F76
          DFFF1E74E2FF4687D4FFF0F3F7FFF9F8F8FFF9F8F8FFF1F0F0FF83807DFF6260
          5CFF777673FFD4D4D3FFF8F7F7FFFAF9F9FFFAF9F9FFFAF9F9FFF9F8F8FFF9F8
          F7FFBAB9B6FF6B6A66FF62615CFF888683FF9C9A9AFF696665FF63605DFFA5A2
          A0FFF8F7F7FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFABA8A7FF666462FF62605EFF62605DFF868582FFEEEEEDFFF9F8F8FFF9F8
          F8FFF9F8F8FFEFEEEEFF807D7DFF63605EFF62605EFF63615EFF93918FFFF5F4
          F4FFF9F8F8FFF9F8F8FFF9F8F8FFE4E1E1FF73706DFF62605EFF62605EFF817E
          7EFFB5B3B4FF777573FF62605EFF63615FFF939090FFD4D2D4FF656261FF6260
          5EFF62605EFF73716FFFC1C0BFFFF7F7F6FFF9F8F8FFFAF9F9FFFAF9F9FFFAF9
          F9FFFAF9F9FFF0EFEFFF8A8887FF62605EFF62605EFF62605DFF858381FFE7E6
          E6FFF9F8F8FFF9F8F8FFDAD8D9FF63615DFF62605EFF62605DFF868482FFDBD9
          D8FFF8F7F6FFF9F7F6FFF8F7F6FFF8F7F6FFF6F5F4FFBAB8B6FF6D6A68FF625F
          5EFF62605EFF878381FFE3E2E2FFF9F8F8FFF9F8F8FFF9F8F8FFF8F7F7FEF9F8
          F8FF719FDFFF2071DAFF1D75DFFE1E77DFFF1E77DFFF1E76DDFE1F77DFFF1F77
          DFFF1F77DDFE2178DFFF2279DEFE237ADFFF237ADFFF247BDEFE257BDFFF257C
          E0FF267CDEFE2E81DBFF579ADFFF95C0EBFEAACCEFFFABCDEEFEA9CCEFFF8FBE
          ECFF5697DBFE3383D9FF3787DDFF408BDAFE448DDBFF438BDAFE3F8BDBFF3685
          DDFF3280D6FE669DD4FFABCBE8FFCEDDEBFED3E1EAFFCFDFEBFFB1CCE6FE619C
          D8FF267BD7FE1F77DEFF1F77DFFF1E76DDFE1F77DFFF1F77DFFF1E76DDFE1F76
          DFFF1E74E0FE4688D5FFF0F3F7FFF9F8F8FFF9F8F8FFF8F7F6FF959290FE6261
          5CFF696865FFADACAAFEF3F2F2FFF8F7F7FEFAF9F9FFFAF9F9FFF8F7F6FEEDEC
          EBFF959492FF63625FFE62605CFF868583FE9C9A9AFF686665FF635F5DFE7E79
          77FFEEECECFFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFABA8A7FF666462FE62605EFF62605DFF696863FEA1A09EFFF2F1F1FEF8F7
          F7FFF7F6F6FFA9A7A8FE6C6A69FF62605EFF615F5DFE62605EFF6C6967FFAEAC
          ABFEF5F4F4FFF8F7F7FFF6F5F5FFA4A1A0FF696562FE62605EFF62605EFF8A89
          87FEBABAB9FF767573FE62605EFF63615FFF929090FEECEBECFF8C8B89FF6462
          60FE62605EFF63625FFF82807EFED0CECEFFEFEEEEFEF8F7F7FFF9F8F8FFF4F4
          F4FEEFEDEDFFE7E6E6FF888686FE62605EFF615F5DFE62605EFF686664FF9B98
          97FEE3E2E2FFF7F6F6FFE1E0E0FE757371FF62605EFF615F5DFE696664FFA8A6
          A5FEEEEDECFFF8F7F6FFF7F6F5FEF6F6F5FFDCDADAFF858280FE646160FF625F
          5EFE656260FFA6A2A1FFF5F3F3FEF9F8F8FFF9F8F8FFF9F8F8FFF8F7F7FEF9F8
          F8FF73A1E0FF2071DBFF1E75E0FF1F77DFFF1E76DEFF1F77DEFF2279DFFF287E
          E1FF2C81E1FF3186E2FF3589E4FF3A8DE6FF3B8DE6FF3C8EE6FF3C8FE6FF3C8F
          E6FF3C8EE6FF3D90E5FF4191E4FF4691E1FF4792E1FF4893E0FF4792E1FF4592
          E2FF4692E1FF64A2E1FFACD3F1FFCFE8F7FFDAEDF8FFD9ECF8FFCFE8F6FFA7D0
          EFFF70A5DDFF93BCE3FFCAE2F3FFE5EFF5FFE8F1F4FFE4EFF4FFC9E0F1FF7EB3
          E1FF2F81D9FF227ADEFF1F77DEFF1F77DEFF1F77DFFF1F77DFFF1F77DFFF1F76
          DFFF1E75E1FF4788D5FFF0F3F7FFF9F8F8FFF9F8F8FFF9F8F8FFB9B8B8FF6D6C
          67FF62605DFF7E7E7BFFD1D1D0FFF7F7F6FFFAF9F9FFFAF9F9FFF6F5F4FFBCBB
          BAFF6C6A68FF62605EFF62605DFF888684FF9C9A9AFF686665FF656362FF6866
          64FF979694FFECEBEBFFF8F7F7FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFABA8A7FF666462FF62605EFF676563FF6C6A69FF636160FF817F7EFF9B98
          97FF8E8C8AFF686665FF62605EFF62605EFF646260FF787676FF6F6D6CFF6563
          61FF898684FF9A9896FF868582FF696765FF62605EFF62605EFF63625EFFAFAD
          ACFFC4C2C1FF777573FF62605EFF636160FF939091FFF7F6F6FFEBE9E9FF7B79
          76FF63615EFF62605EFF63615EFF72706EFF979695FFB3B2B1FFBBB9B8FFABAA
          A8FF92908EFFABA9A9FF8A8887FF62605EFF62605EFF737170FF686665FF6361
          5FFF706E6AFF858481FF8C8B88FF807F7CFF6B6968FF62605EFF62605EFF6A68
          66FF9B9897FFC2C0BFFFCAC9C8FFBABAB8FF807F7CFF62605DFF62605EFF6462
          5EFF7F7B77FFDFDCDCFFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF8F7F7FEF9F8
          F8FF77A6E1FF2071DAFF1F75DFFE1F77DEFF2479DEFF2E81E0FE3789E4FF3D8E
          E6FF4090E6FE4192E6FF4392E6FE4494E7FF4494E7FF4593E5FE4494E7FF4494
          E6FF4593E5FE4594E6FF4494E7FF4593E5FE4594E6FF4493E5FE4594E6FF4694
          E6FF4C95E1FE92BFEBFFE1F3F9FFF2F9FBFEF9FDFEFFF7FCFDFEF2FBFCFFDCF2
          F8FFA6C6E4FECDE4F4FFECF8FBFFF5FBFDFEF9FEFEFFF7FCFCFFEAF7F9FEBEE2
          F3FF5899DFFE3B8BE3FF3084E2FF287EDEFE2279DEFF1F77DEFF1F76DDFE1F76
          DFFF1E74E1FE4687D5FFF0F3F7FFF9F8F8FFF9F8F8FFF9F8F8FFF5F4F4FF9491
          8EFF63615FFF656361FE868582FFB7B6B6FED2D2D2FFCBCAC9FFA7A6A5FE7675
          74FF767473FF6A6867FE62605DFF868583FE9C9A9AFF696665FF747370FE8786
          84FF6B6A66FF7F7D7AFE908E8BFF9E9B99FFD1D0CFFEF9F8F8FFF9F8F8FFF9F8
          F8FFABA8A7FF666462FE62605EFF737271FF9A9797FE706E6CFF63615FFE6461
          5FFF63615FFF62605EFE61605DFF63615FFF73716FFEC1BFC0FFA5A4A3FF6967
          64FE64615FFF64625FFE63615EFF63605EFF625F5DFE62605DFF767470FFE0DF
          DFFECBC9C8FF787472FE63605EFF63615FFF928F90FEF7F6F6FFF9F8F8FFCFCE
          CEFE777471FF64625FFF625F5EFE62605FFF636160FE656360FF676360FF6462
          5FFE666360FF949191FF888686FE62605EFF615F5DFE8D8A8AFF928F8EFF6866
          63FE62615DFF63615EFF676662FE989796FFA29F9FFF686662FE62605DFF6260
          5EFE666361FF6D6B69FF72716FFE696865FF63615FFF635F5DFE64625EFF7B79
          75FEBAB6B4FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF8F7F7FEF9F8
          F8FF80ADE2FF2272D9FF2076DEFE297EE0FF3C8CE5FF4694E6FE4B98E8FF4D99
          E9FF4C97E7FE4C99E8FF4C97E7FE4C99E8FF4C99E8FF4C97E7FE4C99E8FF4C99
          E8FF4D97E7FE4C99E8FF4C99E8FF4C97E7FE4C99E8FF4C97E7FE4C99E8FF4C99
          E8FF559AE1FEAACBEEFFEFF8FBFFFAFDFDFEFEFFFFFFFDFDFDFEFBFEFEFFECF7
          FAFFC3D4E5FEE8F2F7FFF8FDFEFFFCFDFDFEFEFFFFFFFDFEFEFFF5FBFBFED5ED
          F7FF76A9E0FE5099E6FF4796E7FF4391E6FE388AE4FF2B7FE1FF2278DDFE1F76
          DFFF1E74DFFE4A89D6FFF0F3F7FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFECEB
          ECFF848382FF6A6866FE64625FFF6B6968FE716F6DFF6F6F6AFF6E6D69FE8886
          87FFB3B2B4FF767474FE62605DFF868583FE9C9A9AFF696765FF7B7A77FEC2C1
          C0FF8C8B88FF696765FE62615EFF6C6B67FFAAA8A7FEF9F8F8FFF9F8F8FFF9F8
          F8FFB2B0AEFF74716FFE706D6CFF848280FFD3D0D0FEB8B5B7FF7C7B78FE6B69
          68FF656361FF656260FE6A6866FF7F7E7BFFB5B4B5FEF9F8F8FFF6F5F5FFA7A6
          A5FE777573FF6B6967FE646261FF656260FF6C6967FE7E7C7AFFC1BFBEFFF9F8
          F8FFF2F1F0FF83807EFE716D6CFF716F6DFF9C9A98FEF8F6F7FFF9F8F8FFF9F8
          F8FFE0DEDEFF92908FFF747271FE6A6766FF64625FFE63605DFF666260FF6B69
          67FE73716DFF9D9B9AFF918F90FE6F6D6CFF6F6D6BFE9B9897FFD5D3D4FF9998
          95FE71706DFF666462FF666462FEA6A5A3FFF3F1F1FFBDBCBAFE7F7E7BFF6F6D
          6BFE676562FF63615EFF62605DFE64625FFF6B6866FF757170FE92918FFFCBCA
          C9FEF8F7F7FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF8F7F7FEF9F8
          F8FF8DB7E6FF2B77D9FF2479DEFF3B8CE6FF4D98E9FF529CE9FF539DE9FF539D
          E9FF539DE9FF539DE9FF539DE9FF539DE9FF539DE9FF539DE9FF539DE9FF539D
          E9FF549CE9FF549CE9FF539DE9FF539DE9FF539DE9FF539DE9FF539DE9FF539D
          E9FF5C9FE4FFAFCEEFFFF2F9FCFFFCFEFEFFFFFFFFFFFFFFFFFFFDFEFEFFEEF7
          FAFFC9D7E5FFEBF4F7FFFAFEFEFFFEFFFFFFFFFFFFFFFEFFFFFFF7FDFEFFD9EE
          F7FF7EAEE1FF589EE6FF529DE9FF529CE9FF4E99E8FF4391E7FF2F83E1FF2077
          DFFF1F74DEFF5A94DCFFF1F4F7FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFE6E5E4FF9E9C9CFF817F7DFF7B7877FF7A7876FF81807CFF989795FFE4E3
          E3FFD3D2D3FF787776FF62605DFF888785FFB1AFAFFF8B8887FF999695FFF1EF
          EFFFE6E5E5FF9B9898FF837F7DFF858280FFB9B5B4FFF9F8F8FFF9F8F8FFF9F8
          F8FFF1F0F0FFB7B4B4FFB4B2B3FFC0BEBEFFF9F8F8FFF9F8F8FFE4E3E2FFA6A3
          A3FF908F8EFF8E8D8CFFA2A09FFFD7D6D5FFF9F8F8FFF9F8F8FFF9F8F8FFF8F7
          F7FFD1CFCFFFA3A1A2FF8D8C8CFF8D8A8AFFA3A1A0FFD8D5D5FFF9F8F8FFF9F8
          F8FFF9F8F8FFCBC9C9FFB4B1B2FFB5B2B3FFD6D4D3FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF5F4F4FFCDCBCBFFA09D9EFF8C8B8AFF868483FF8E8B8AFFA3A2
          A1FFBDBDBBFFEAE9E9FFD7D5D6FFB4B1B2FFB4B2B2FFCBC9C9FFF9F8F8FFF7F6
          F5FFBCBBBBFF949291FF8C8989FFBFBCBCFFF9F8F8FFF9F8F8FFF2F1F1FFB1B0
          B0FF969393FF8A8786FF868583FF8C8A89FFA29F9FFFC4C1C2FFF0EFEFFFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFD0CF
          CFD5A2C6EDFF3C81DBFF297DDBFE4A97E9FF59A0EAFF5CA0E9FE5CA1EAFF5CA1
          EAFF5CA0E9FE5CA1EAFF5CA0E9FE5CA1EAFF5CA1EAFF5CA0E9FE5CA1EAFF5CA1
          EAFF5CA0E9FE5CA1EAFF5CA1EAFF5CA0E9FE5CA1EAFF5CA0E9FE5CA1EAFF5CA2
          EAFF64A3E4FEB0D0EFFFF1F9FCFFFBFCFCFEFEFFFFFFFDFDFDFEFCFEFEFFEEF8
          FAFFC8D7E5FEECF3F7FFFAFDFEFFFCFDFDFEFEFFFFFFFEFEFEFFF6FCFCFEDAEE
          F7FF82B1E1FE61A2E7FF5CA1EAFF5CA0E9FE5BA1EAFF579FEAFF4692E6FE2077
          DDFF2173D7FE77A8E7FFF6F6F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF6F5F5FFEBEAEAFEEFEDEDFFF6F5F5FFF9F8F8FFF9F8
          F8FFEFEEEEFF787775FE62605DFF8A8886FEF5F4F4FFF8F7F7FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF7F6F6FFF4F3F3FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF8F8F8FFF8F7F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF8F7F7FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF8F7
          F7FEB8D4F2FF4E8CD8FF2C7DDAFE4C98E9FF60A3EBFF63A4E9FE64A6EAFF64A5
          EBFF64A4E9FE64A6EAFF64A4E9FE64A6EAFF65A6EAFF65A5E9FE65A6EAFF64A6
          EAFF64A4E9FE64A5EAFF64A6EAFF64A5E9FE65A6EAFF65A5E9FE65A6EAFF64A6
          EAFF69A7E5FEA7CBEEFFE7F6FAFFF5FAFBFEFAFDFDFFF8FCFCFEF6FCFCFFE5F5
          F9FFB9D1E5FEDCEBF5FFF2FBFCFFF8FCFCFEFAFDFDFFF9FDFDFFF0F9FBFED1EA
          F6FF7FB0E2FE67A6E8FF64A5EAFF64A5E9FE63A6EAFF5FA4EBFF4E97E7FE2177
          DCFF2573D1FE95BDEDFFF8F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF2F1F1FF797775FE62605DFF8A8986FEF8F7F7FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFD1E4F5FF6B9BD6FF2B7BD9FF4893E8FF66A7ECFF6BAAEBFF6BABEBFF6CAA
          EBFF6CAAEAFF6CAAEBFF6DAAEBFF72ACE9FF76AFE9FF78AFE9FF78AFEAFF75AE
          E9FF70ACE9FF6EACEAFF6FACE9FF74AEE9FF77AFEAFF77B0E9FF77AFEAFF72AD
          E9FF72ACE7FF8BB7E6FFC6E1F1FFE0EEF5FFE7F1F6FFE7F1F5FFE0EFF5FFC1DF
          EFFF94BBE0FFACCEE9FFD5E9F4FFE5F1F6FFE5F2F6FFE4F1F6FFD7EAF4FFACCE
          EEFF78ADE6FF6EABEAFF6CABEBFF6CABEBFF6BAAECFF63A6EDFF4A95E7FF2177
          DCFF3378CDFFB9D6EFFFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF2F1F0FF797775FF625F5DFF8B8A87FFF8F7F7FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFB2B0AFFF9B9A98FF9C9B99FFBBB9B8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFEFF3F7FF99BAE3FF2E7AD5FE408CE4FF69A8ECFF72ACEAFE73AEEAFF74AE
          EBFF73ADE9FE77AFE9FF85B5E7FEA7CCEDFFBBD9F1FFBCD9F0FEBDDAF1FFB9D7
          F1FFA3C8EAFE8AB5E3FF97C0E8FFB3D4EEFEBCDAF1FFBCD9F0FEBCD9F1FFB0D2
          EFFF95BDE5FE92B8DFFFBAD3E9FFD6E3EDFEDFE8EFFFDEE7EEFED8E5EEFFB6D1
          E8FF93B7DDFEA4C4E1FFC9DDEDFFDCE6EEFEDFE8EFFFDDE7EFFFCDDCEBFEA2C3
          E6FF7EAFE4FE75AEEAFF73AEEAFF73ADE9FE71ADECFF63A6EDFF3D8AE2FE2276
          DAFF5992D7FEEEF3F7FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF2F1F0FF787775FE615F5DFF8A8987FEF8F7F7FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFEFEEEEFF777573FE62605DFF63625EFF92908EFEF7F6F6FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF8F8F8FFCBDEF2FF387FD3FF3785DFFF64A5EBFF77B1ECFF7AB2EBFF7BB2
          EBFF7BB2EBFF85B5E7FFAED0EDFFE4F4FAFFF8FDFEFFFAFDFEFFFAFDFEFFF5FB
          FDFFE2F0F7FFBBD2E9FFCFE5F3FFF1FAFCFFF9FDFEFFFAFDFEFFF8FDFDFFEDF8
          FBFFCDE1EFFFBFD3E9FFE7F3F8FFF9FDFDFFFEFEFEFFFDFEFEFFFAFDFEFFE5F3
          F9FFBAD1E7FFD5E5F2FFF2F9FBFFFCFEFEFFFEFEFEFFFDFEFEFFF3FAFCFFCFE6
          F5FF8FB9E5FF7EB3EAFF7AB2EBFF7AB2EBFF76B0EDFF5EA2EBFF3081DEFF2676
          D6FF8AB6E4FFF8F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF2F1F0FF797775FF61605DFF8A8A88FFF8F7F7FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFEFEEEEFF777572FF62605DFF63625FFF93928FFFF7F7F6FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFEEF4F7FF679EDEFE327DD5FF569BE6FF78B2ECFE81B5EBFF82B6
          EAFF82B5E9FE90BDE8FFC4DDF0FEF1FAFCFFFEFFFFFFFDFDFDFEFEFFFFFFFDFF
          FFFFF3F8FAFED9E4F0FFE4F0F6FFF9FCFCFEFEFFFFFFFDFDFDFEFEFFFFFFF8FD
          FDFFE4EEF3FEDBE6EFFFF4FAFBFFFBFDFDFEFFFFFFFFFDFDFDFEFDFEFEFFF1FA
          FBFFD2E1ECFEEEF5F9FFFAFEFEFFFDFDFCFEFFFFFFFFFEFFFFFFF7FCFCFEE1F1
          F8FF9FC3E8FE87B7E9FF82B6EAFF7FB5EAFE76B1EDFF4C96E7FF287BD9FE4387
          D9FFB5D3EEFEF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF2F1F0FF797775FE615F5DFF8A8888FEF8F7F7FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF2F1F1FF8D8987FE7B7875FF7B7A77FFA3A2A0FEF8F7F7FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF5F6F7FF9FC4E9FE3F82D0FF458EE0FF74ADECFE86B8ECFF88BA
          EBFF88B9E9FE98C1E8FFCDE0F0FEF4FBFCFFFEFFFFFFFDFDFDFEFEFFFFFFFDFF
          FFFFF6F9FBFEE1E8F0FFE9F2F6FFFAFCFCFEFEFFFFFFFDFDFDFEFEFFFFFFF9FE
          FEFFE9F1F4FEE2EBF0FFF7FBFDFFFCFDFDFEFFFFFFFFFDFDFDFEFDFEFEFFF4FA
          FBFFD9E5ECFEF3F8FAFFFBFEFEFFFDFDFDFEFFFFFFFFFEFFFFFFF9FCFCFEE6F3
          F9FFA7C7E8FE8EBBE9FF88B9EBFF82B6ECFE6EABECFF3B89E1FF2B7BD6FE71A3
          DCFFF0F4F7FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF4F3F3FF908E8BFE7D7B79FF9F9D9DFEF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF1F0F0FFE2E0E0FFE2E1E0FFF2F1F1FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFD4E6F4FF6FA0DDFF3881D9FF65A2E8FF86B9EDFF8FBE
          ECFF91BFEBFFA0C5E9FFD2E3F2FFF6FBFCFFFEFFFFFFFFFFFFFFFEFFFFFFFDFE
          FEFFF7FAFCFFE3EAF1FFEAF2F7FFFBFDFDFFFEFEFFFFFEFEFFFFFEFEFFFFF8FE
          FEFFEAF2F5FFE4ECF1FFF8FCFDFFFDFFFFFFFFFFFFFFFFFFFFFFFDFEFEFFF5FA
          FBFFDDE7EDFFF3F7F9FFFCFEFEFFFEFFFFFFFFFFFFFFFFFFFFFFFAFEFEFFE8F5
          F9FFAFCBEAFF96C0EAFF8EBEECFF80B7EEFF559AE6FF2C7DDAFF4386D7FFB4D0
          EDFFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF2F1F1FFEAE9E9FFF5F4F4FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF3F5F6FEA4C7ECFF4B8AD8FF4E90DCFE7AB2ECFF93C1
          EDFF98C2EBFEA6C8EAFFD0E1F1FEF4FBFCFFFDFEFDFFFDFDFCFEFEFFFFFFFBFE
          FEFFF4F8FAFEDFE8F1FFE8F2F7FFF7FCFCFEFDFEFEFFFCFDFDFEFDFFFFFFF7FD
          FEFFE6F0F4FEE0EAEFFFF6FCFDFFFBFDFDFEFEFFFFFFFDFDFDFEFCFDFDFFF3FA
          FBFFD7E4ECFEEFF5F9FFFAFDFEFFFCFDFDFEFEFFFFFFFEFEFEFFF8FCFCFEE7F4
          F9FFB0CCEAFE9CC3EBFF90BFEDFF72ADEBFE3C89DFFF317DD6FF70A4E0FEF4F6
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFE0EDF6FF81ADDFFF4484D3FE5C9CE4FF91C0
          EFFF9DC5EDFEA9C9ECFFC2DAEFFEE5F2F8FFF2F8FBFFF2F8FAFEF3F9FBFFF0F8
          FBFFE2EEF6FEC9DBECFFD7E7F3FFEBF5F9FEF2F9FBFFF3F8FAFEF3F9FBFFEBF6
          FAFFD3E4F0FECADCECFFE5F2F9FFF0F7FAFEF4F9FBFFF3F8FAFEF1F8FBFFE3F0
          F8FFC5D8EAFED8E7F3FFECF6FAFFF2F8FAFEF3F9FBFFF3F9FBFFECF5F9FED6E8
          F5FFADCBEAFE9FC6EEFF83B9EEFF5096E2FE2D7ED8FF5792D9FFB7D5EEFEF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF8F8F8FFC8DDF2FF6199DCFF4387D6FF79AF
          EAFF9CC6F0FFA9CBEFFFB2CFEDFFC3DAEFFFCFE1F1FFD0E2F0FFD0E3F0FFCEE1
          F0FFC0D8EFFFB4CFECFFBBD4EEFFCBDFF0FFD1E2F1FFD2E3F0FFD1E3F0FFC9DE
          F0FFB9D4EDFFB5D0ECFFC3D9F0FFCEE1F0FFD3E3F0FFD3E3F0FFCEE1F0FFC2D8
          F0FFB5D0EDFFBAD3EDFFC8DDF0FFD0E2F0FFD0E3F0FFD0E2F0FFCADEF0FFBAD3
          EFFFA9CCEEFF9AC6F1FF5DA0E6FF3080D9FF4188DAFF9CC3EBFFF6F7F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF4F6F7FFADCDEAFE5D94D4FF4A8D
          DBFF81B5EBFEA7CCF0FFB0CEEEFEB5D1EEFFB7D2ECFFB8D1EBFEB9D2ECFFB8D2
          EDFFB5D0EEFEB4D0EEFFB5D1EFFFB6D1ECFEB8D2ECFFB7D1EBFEB9D2ECFFB7D1
          EDFFB3D0EDFEB5D1EFFFB6D1EEFFB6D1EBFEB9D2ECFFB8D1EBFEB7D2ECFFB6D1
          EEFFB4CFEEFEB4D1EEFFB6D1EEFFB7D1EBFEB8D2ECFFB7D2ECFFB5D0ECFEB1D0
          EEFF9EC8EFFE70ACEAFF3482DCFF3980D3FE87B4E2FFEBF2F7FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFE8F1F7FFADCCECFF528D
          D3FF4E8ED6FF88BCEDFFACD0F2FFB5D3F1FFB9D5F0FFBBD5F0FFBBD5F0FFBAD5
          F0FFBBD5F0FFB9D5F0FFB9D5F0FFBAD5F0FFBAD5F0FFB9D5F0FFBAD5F0FFBAD5
          F0FFB9D5F0FFBBD5F0FFBAD5F0FFB9D5F0FFBAD5F0FFBAD5F0FFBAD5F0FFBAD5
          F0FFBCD5F0FFBAD5F0FFBAD5F0FFBAD5F0FFBAD5F0FFB9D5F0FFB4D3F0FFA5CC
          F2FF72AEEAFF3A86DBFF3A81D4FF7CACE1FFE2EDF5FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFE5EFF6FF98BF
          E5FF518DD1FE5192DBFF8EBDEAFEAFD2F1FFBBD7F1FFBED7F0FEC1D9F0FFC0D9
          F0FFBFD8EFFEC0D9F0FFC0D9F0FFC0D8EFFEC1D9F1FFBFD8EFFEC1D9F0FFC2D9
          F1FFBFD8EFFEC1D9F0FFC1D8F0FFBFD8EFFEC1D9F0FFC1D8EFFEC1D9F0FFC1D9
          F0FFC1D8EFFEC0D9F0FFC0D9F0FFBFD7EFFEBED8F1FFB9D6F1FFA7CEF0FE79B1
          E9FF3D87DAFE337DD5FF7BAADFFFC9DFF1FEF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFE4EF
          F7FFAACCEAFE6197D3FF4E8DD5FE7AAFE6FFA8CEF0FFBDD9F1FEC7DDF2FFC7DD
          F2FFC7DCF0FEC8DDF2FFC9DEF2FFC7DDF0FEC8DEF2FFC7DDF0FEC9DEF2FFC9DE
          F2FFC7DDF0FEC9DEF2FFC9DEF2FFC7DDF0FEC9DEF2FFC8DDF0FEC8DEF2FFC9DE
          F2FFC7DCF0FEC9DEF0FFC8DEF1FFC3DBF0FEBAD7F2FF98C5EEFF66A1E2FE3C85
          D9FF4486D3FE84B0E1FFDDECF6FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFE8F2F7FFB0D0EBFF649CDCFF528DD1FF73A8E0FF99C4EDFFBAD9F3FFC7E0
          F4FFCEE1F3FFD0E2F2FFD1E2F3FFD0E3F2FFD0E3F2FFD0E3F2FFD0E3F2FFD0E3
          F2FFD0E3F2FFD0E2F1FFD0E3F2FFD0E3F2FFD1E3F2FFD0E3F2FFD0E3F2FFD0E3
          F2FFCFE2F2FFCCE1F2FFC5DFF3FFAED3F1FF8DBDEBFF5C9ADEFF3D84D4FF4B8B
          D7FF8EBBE7FFDEECF5FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF2F6F7FFC8DEF1FE86B1DDFF5591D3FF5491D6FE7EB1E3FFA3C9
          EBFFC0DAF0FECDE2F2FFD2E4F3FFD3E4F2FED6E6F3FFD7E5F2FED9E7F3FFD9E7
          F3FFD8E6F1FEDAE7F3FFD9E7F3FFD7E6F1FED8E7F3FFD5E4F2FED3E5F3FFD0E4
          F2FFC8E0F1FEB7D7F1FF97C3EAFF67A1E0FE4389D9FF4186D5FF679DD9FEAACA
          EBFFF0F4F6FEF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF8F8F8FFE0EEF6FFA7CAEBFF76A4D9FE538DCCFF5894
          D5FF70A8E2FE94C2EEFFB3D7F0FFC3E0F0FECEE5F3FFD5E7F3FEDBEAF4FFDDEB
          F4FFDFEBF2FEE0ECF4FFDDEBF4FFD9E9F3FED4E8F3FFCBE3F2FEBFDFF1FFAAD2
          F0FF89BAEBFE60A0E1FF498CD8FF4082CEFE5993D7FF90BAE8FFCCE3F3FEF6F7
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF4F6F8FFD4E7F4FFA2C9EAFF6CA5
          DFFF488AD2FF4C8BD1FF5B94CEFF79AADCFF91BDE7FFA8CDEEFFB8D8F1FFBFDF
          F1FFBFE0F1FFC0E0F1FFBDDEF1FFB3D7F0FF9EC7EDFF89B7E6FF6AA1D9FF508F
          D1FF4287D3FF3A84D3FF5192D9FF8DBBE8FFC0DBF1FFF1F5F7FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF5F6F8FFEDF4
          F7FFCCE1F2FE9FC1E2FF75A4D3FF5993D3FE488BD5FF3780D3FE2F7CD3FF2C7B
          D2FF2B7AD1FE2C7BD3FF2B7BD2FF2B7BD1FE327FD4FF3E84D5FE5090D6FF669C
          D4FF86B0DBFEBDD7EFFFEAF2F7FFF3F5F7FEF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF7F7F8FFEBF3F6FFD2E8F4FFB7D7F1FEA3CBEFFF8FBDE8FE88B7E5FF85B5
          E4FF82B4E3FE84B5E4FF84B5E4FF83B4E3FE8BBAE7FF99C3EBFEAFD2F2FFC8E2
          F4FFE9F1F6FEF8F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF4F3F3FADFDEDEE4C0C0C0C5C0C0C0C5C0C0
          C0C5C0C0C0C5C0C0C0C5C0C0C0C5C0C0C0C5C0C0C0C5EEEDEDF4F5F4F4FBF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8
          F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FFF9F8F8FF}
      end
      item
        Image.Data = {
          76800000424D7680000000000000360000002800000098000000360000000100
          20000000000040800000000000000000000000000000000000007F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFEFFFFFFFCFB
          F3FFD1C7B6FFC1B395FFB4A27EFFAB9A70FFAC9E75FF71674CFF221B0FFF1717
          10FF0C0C07FF000000FF070500FF7B7258FFC0B391FF3E351CFF807967FFFFFF
          FFFFFDFFFDFFFDFDFFFFFEFDFFFFFFFEFEFFFFFFFEFFFCFDFDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFCFFFFFFFFFF
          FFFFE2DCCEFFC8BA9DFFB8A884FFAC9A72FFAC9C72FF9F9372FF362F1BFF1B19
          0FFF12120EFF010000FF000000FF322B15FFC8BD9BFF6C6246FF3A331AFFEFEB
          DBFFFFFFFFFFFDFDFFFFFEFDFFFFFFFEFDFFFEFFFCFFFEFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFFFFFFFF
          FFFFF5F2EBFFCFC8AFFFC2B596FFAF9F7BFFAA9772FFB2A37DFF6A6142FF211F
          10FF1C1912FF0A0807FF000000FF000000FF8C856BFFB5AA8BFF3B2F11FF8982
          70FFFCFBF2FFFFFEFFFFFFFEFFFFFFFDFFFFFEFEFDFFFFFFFDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFCFEFFFFFF
          FFFFFFFFF9FFE2DFCCFFC6BEA3FFB4A787FFA89875FFAF9F76FF958C67FF3631
          1CFF1E1A10FF13110EFF020201FF000000FF413C28FFC5B99AFF786C51FF473D
          2AFFE1DDCEFFFFFFFFFFFEFCFDFFFEFDFFFFFDFDFEFFFDFFFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFEFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFDFDFFFFFE
          FEFFFFFFFBFFF2F2E6FFCBC6B0FFBBB094FFB0A07FFFA7986EFFABA177FF655A
          3FFF20190DFF15120EFF0A0705FF000000FF0D0A02FF9C8E72FFBAAD94FF271D
          06FF9E9680FFFFFFF8FFFFFFFEFFFDFDFEFFFEFEFFFFFDFDFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FDFFFEFDFEFFFEFFFFFFFDFCFCFFFFFDFDFFFFFEFEFFFFFDFFFFFFFFFEFFFDFF
          FFFFFCFFFFFFFCFFFFFFFDFFFFFFFEFFFFFFFCFFFFFFFCFFFFFFFDFFFFFFFEFE
          FCFFFDFDFDFFFEFEFEFFFEFFFDFFFFFFFFFFFFFFFFFFFCFFFFFFFDFDFFFFFFFD
          FFFFFDFDFDFFFFFFFDFFFFFFFDFFFFFFFFFFFEFEFDFFFFFFFDFFFDFFFCFFFEFE
          FCFFFFFEFDFFFFFEFDFFFFFEFFFFFCFEFFFFFEFDFEFFFFFFFDFFFDFFFCFFFEFE
          FEFFFDFEFFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFDFFFFFF
          FFFFFCFFFFFFFCFEFFFFFCFFFFFFFFFEFFFFFDFEFCFFFFFFFDFFFFFFFDFFFEFE
          FAFFFCFFFDFFFEFEFAFFE3DED0FFC9BBA1FFB7AA87FFAB9E74FFB1A17BFF9382
          65FF372D1BFF1B1611FF14110CFF040202FF000000FF413926FFC7BCA2FF6E61
          45FF52482AFFDAD5C5FFFFFFFFFFFEFFFEFFFFFEFFFFFFFDFFFFFEFDFFFFFDFE
          FEFFFCFFFCFFFFFEFDFFFDFDFEFFFFFFFFFFFFFDFFFFFDFEFFFFFCFFFFFFFDFE
          FEFFFFFFFEFFFFFFFDFFFFFEFDFFFFFFFFFFFDFDFDFFFFFFFFFFFFFDFFFFFDFD
          FDFFFEFEFEFFFDFDFDFFFDFEFEFFFBFDFEFFFEFFFEFFFDFEFEFFFFFDFFFFFCFF
          FFFFFCFFFFFFFDFFFDFFFFFFFDFFFFFFFFFFFEFDFFFFFDFCFFFFFFFEFFFFFDFD
          FDFFFFFFFDFFFFFFFDFFFEFFFDFFFFFFFFFFFCFFFFFFFBFEFEFFFEFEFFFFFFFF
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFF
          FFFFFDFDFFFFFCFEFFFFFCFFFFFFFCFEFEFFFEFEFEFFFEFDFFFFFFFDFFFFFFFE
          FFFFFFFFFFFFFFFFFFFFFCFFFFFFFDFDFDFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFDFDFDFF7F7F7FFF7F7F7FFFFFFF
          FEFFFCFEFDFFFBFFFEFFFDFEFEFFFEFDFEFFFEFDFEFFFFFFFFFFFFFFF9FFFFFD
          F3FFFBF6E7FFFCF6E4FFFFF6E7FFFFF4E6FFFBF4E6FFFCF4E6FFFFFFF4FFFEFF
          FCFFFDFDFEFFFEFDFFFFFEFFFDFFFEFEFEFFFEFEFEFFFCFEFEFFFDFEFEFFFDFD
          FEFFFEFEFEFFFFFEFDFFFFFFFEFFFEFFFFFFFDFEFEFFFEFFFEFFFBFDFEFFFFFE
          FDFFFFFFFCFFFEFFFCFFFFFFFEFFFEFDFEFFFEFEFEFFFEFEFEFFFEFEFDFFFDFE
          FEFFFEFFFEFFFFFFFEFFFFFFFEFFFFFFFFFFFFFEFFFFFFFEFFFFFFFFFEFFFFFF
          FFFFFCFFFFFFFBFEFFFFFCFEFFFFFFFDFFFFFEFEFEFFFFFFFEFFFEFDFDFFFFFE
          FFFFFCFFFEFFFEFFFFFFF8F4ECFFCEC5B0FFBDB091FFAEA07CFFAD9E79FFA99C
          77FF5E543EFF1F1A0FFF191610FF0A0805FF000000FF0E0B04FF5D5545FF534A
          31FF64593DFFCAC0ABFFE1D9CDFFF1EDE7FFFFFFFEFFFDFEFFFFFEFDFEFFFDFE
          FDFFFDFFFDFFFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFEFFFCFFFEFFFEFE
          FDFFFEFEFEFFFFFEFEFFFFFDFDFFFFFFFFFFFEFFFEFFFDFFFDFFFEFEFFFFFEFE
          FFFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFEFEFFFFFEFEFFFFFEFFFFFCFF
          FFFFFDFFFFFFFCFFFEFFFFFFFEFFFFFFFFFFFEFEFFFFFFFEFFFFFCFDFDFFFDFE
          FEFFFFFFFEFFFEFFFDFFFDFFFCFFFFFFFEFFFEFFFFFFFFFFFFFFFFFFFFFFF9F7
          F4FFEFEDEAFFEBE9E6FFECEAE7FFEDECEAFFEAE9E7FFF3F1EFFFFAFAF6FFFFFF
          FEFFFFFFFFFFFDFEFFFFFDFEFEFFFEFEFDFFFEFEFDFFFEFEFFFFFEFDFEFFF2F2
          F2FFE6E6E5FFECEDECFFFCFDFDFFFFFFFFFFFDFDFDFFFEFEFEFFFEFEFEFFFFFF
          FFFFF3F3F3FFE6E6E6FFEAEAEAFFFDFDFDFFFFFFFFFF7F7F7FFF7F7F7FFFFDFF
          FFFFFBFDFCFFFAFFFEFFFAFEFDFFFFFFFFFFFFFFFFFFFEFAF2FFF4E7D5FFEAD9
          C0FFECD9BBFFE8D7B3FFEFD7B7FFF1D7B9FFEED9B9FFE9D4B6FFF8EBD5FFFEFF
          FDFFFDFDFFFFFFFDFFFFFCFEFEFFFEFFFEFFFFFEFEFFFCFEFEFFFBFFFDFFFBFF
          FCFFFEFEFEFFFFFDFDFFFFFFFFFFFBFFFFFFFCFFFFFFFBFEFFFFFDFEFEFFFFFD
          FDFFFFFFFDFFFDFFFCFFFEFFFFFFFDFDFDFFFDFEFFFFFDFDFFFFFEFCFFFFFDFF
          FFFFFDFFFDFFFFFFFEFFFFFFFDFFFFFEFFFFFFFDFFFFFEFDFFFFFEFEFFFFFDFF
          FFFFFCFFFDFFFCFFFEFFFCFDFEFFFEFCFFFFFEFEFFFFFEFEFEFFFDFDFEFFFEFC
          FEFFFEFEFFFFFCFEFFFFFFFFFFFFDFD9C8FFC2B79DFFB6A78BFFA99B76FFAFA3
          7CFF8F8767FF282412FF1C1911FF17150EFF000000FF000000FF413F37FFA9A3
          93FFC3B59DFFD8C8AEFFD0C3AFFFEAE3D9FFFFFFFDFFF8FEFDFFFDFEFEFFFEFF
          FDFFFDFEFCFFFFFFFDFFFCF9F6FFF8F6F3FFFFFEFCFFFEFFFEFFFCFFFCFFFFFF
          FFFFFDFCFDFFFFFEFFFFFFFDFFFFFFFFFFFFFDFFFEFFFCFFFEFFFFFFFFFFFEFE
          FEFFFFFEFDFFFFFEFFFFFFFEFEFFFFFFFEFFFFFDFEFFFFFDFEFFFFFFFFFFFEFF
          FFFFFCFFFFFFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFCFEFEFFFBFE
          FEFFFDFEFEFFFDFEFDFFFEFEFEFFFFFFFFFFFFFFFDFFE4E0DEFFCAC8C5FFB6B1
          ACFFB4B0AAFFB1ADA7FFAFABA6FFADA9A4FFB0ACA7FFB3B1ADFFB6B6B1FFC8C6
          C5FFE4E3E2FFFFFFFFFFFFFFFFFFFEFEFDFFFEFEFCFFFFFFFFFFF7F7F6FFB9BB
          B9FFABAAA6FFB0B1AEFFEBECECFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFDFDF
          DFFFB3B3B3FFA8A8A8FFA1A1A1FFE6E6E6FFFFFFFFFF7F7F7FFF7F7F7FFFFCFF
          FFFFFEFFFCFFFCFFFCFFFFFFFCFFFFFCF2FFF6EACFFFECD7B1FFECD3AEFFEDD6
          B6FFEDDBBFFFF0E5CDFFF4E6CFFFF0DBC0FFF0D6B2FFF0D4B1FFF2E1C9FFFFFF
          FEFFFEFFFFFFFFFFFFFFFBFEFFFFFCFCFEFFFFFEFFFFFDFFFDFFFEFFFDFFFFFF
          FEFFFCFEFFFFFEFFFFFFFEFDFDFFFBFFFFFFFCFEFFFFFEFDFFFFFDFFFFFFFCFD
          FFFFFFFEFFFFFBFFFCFFFEFFFFFFFFFFFFFFFFFFFDFFFFFEFEFFFEFDFEFFF9FE
          FFFFFEFEFFFFFEFFFDFFFFFFFDFFFFFDFFFFFFFDFFFFFBFFFFFFFBFFFFFFFCFF
          FFFFFEFFFFFFFFFEFEFFFFFFFFFFFDFCFFFFFFFEFFFFFCFFFDFFFDFFFAFFFFFE
          FFFFFDFDFFFFFDFEFEFFFFFFFFFFF5F0E7FFCDC4AFFFBBB194FFAFA17DFFB09E
          76FFB5A781FF4D432CFF19150BFF0E0900FF3C362CFF2A271DFF6D685EFFF4EC
          DAFFBCAC92FFD8CAADFFD2C7AFFFEAE4D7FFFFFFFCFFFAFEFFFFFAFEFEFFFDFF
          FFFFFFFFFDFFEDE9DFFFCABDADFFC8BBABFFDDD4CAFFFFFEFBFFFEFEFFFFFBFD
          FDFFFEFFFFFFFEFEFDFFFFFFFEFFFEFDFDFFFEFFFFFFFCFEFEFFFFFDFFFFFEFE
          FFFFFDFEFCFFFFFDFFFFFFFFFFFFFFFEFDFFFFFEFFFFFFFEFFFFFFFFFDFFFFFF
          FFFFFEFFFFFFFCFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFBFDFDFFFCFEFEFFFBFE
          FEFFFDFDFEFFFFFFFFFFFFFFFFFFE7E3E0FFB5B0AAFFB1ABA3FFACA8A0FFB6B3
          AEFFC1BEB9FFCECBC8FFCECCC8FFCECDC9FFC5C4C3FFBBB9B8FFADABAAFFACA9
          A5FFA9A6A1FFC0BDB9FFFCFBF7FFFFFFFEFFFEFFFDFFFFFFFEFFF5F5F4FFB7B4
          B4FFACAAA7FFAFAEACFFEDEEECFFFFFFFFFFFFFFFFFFF2F2F2FFB9B9B9FFA0A0
          A0FFA3A3A3FFA8A8A8FFD4D4D4FFFEFEFEFFFEFEFEFF7F7F7FFF7F7F7FFFFEFF
          FEFFFBFFFCFFFFFFFAFFFFFAECFFF2DBC1FFEFD6B3FFEFD9B0FFECDABEFFF7ED
          D8FFFFFAECFFFFFFF8FFFFFFFAFFFFF9EBFFF2E4D0FFEFE1CEFFFBF3E6FFFFFF
          FDFFFEFEFEFFFDFFFFFFFCFEFFFFFEFDFFFFFFFFFFFFFFFFFCFFFFFFFBFFFFFF
          FBFFFFFFFEFFFFFEFDFFFFFFFFFFFBFEFEFFFEFDFFFFFFFDFFFFFFFEFEFFFFFF
          FFFFFFFFFCFFFFFFFCFFFFFEFDFFFFFFFFFFFFFFFCFFFFFFFCFFFFFFFDFFFFFF
          FFFFFEFEFEFFFFFFFFFFFFFFFDFFFFFDFFFFFFFDFFFFFCFFFFFFFBFFFFFFFCFF
          FFFFFFFFFFFFFFFEFCFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFDFFFDFF
          FDFFFDFFFEFFFFFFFEFFFFFFFEFFFFFFFBFFE3DECDFFC3BBA3FFB5A888FFB2A0
          7AFFB9A781FF8A7B5DFF413822FF716552FFDED4C2FF665E50FF171206FFD0C7
          B5FFC5B69DFFD0C0A6FFD4C7B5FFEBE6DAFFFFFFFEFFFDFEFEFFFFFFFFFFFFFF
          FFFFFFFFFEFFF0EBE1FFCFC1AFFFCFC0ADFFD7CCBEFFFEFEF7FFFFFFFFFFFFFF
          FFFFFFFFFFFFFDFFFEFFFDFFFDFFFEFFFFFFFDFEFEFFFBFEFDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFF
          FFFFFEFFFFFFFCFFFFFFFFFFFFFFFFFFFFFFFDFEFDFFFCFEFEFFFCFEFEFFFDFE
          FEFFFEFEFEFFFFFFFEFFD8D6D2FFB3AFA9FFB6AFA8FFB6B0AAFFD0CEC9FFEEEE
          EAFFFAF8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F9F7FFE7E6E6FFB8B5
          B3FFB1AEAAFFA9A5A0FFD9D6D1FFFFFFFFFFFEFFFDFFFFFFFFFFF3F4F2FFB8B6
          B5FFABA9A8FFB4B2B1FFF7F5F4FFFFFEFDFFD4D4D4FFADADADFFA3A3A3FFA5A5
          A5FFBABABAFFEAEAEAFFFFFFFFFFFFFFFFFFFEFEFEFF7F7F7FFF7F7F7FFFFFFF
          FEFFFCFFFFFFFDFBEEFFEDDBBEFFF4D8B3FFF2D6B2FFF0DEBEFFFDFBEEFFFFFF
          FCFFFEFEFFFFFFFFFDFFFFFFFDFFFFFFFEFFFFFFFDFFFFFFFEFFFFFFFDFFFFFF
          FDFFFEFEFEFFFEFFFDFFFFFFFEFFFFFEFAFFFFF6EEFFF4EDDDFFF8EEDFFFF8EE
          DBFFF9EEE0FFFFF9EDFFFFFFFEFFFEFFFEFFFDFDFEFFFFFFFFFFFEFDFAFFF5EF
          E4FFF3EADCFFF9F5E9FFFFFFFEFFFEFBF5FFF4F0E3FFF5EBDCFFF6ECDCFFF5EF
          E3FFFFFEF8FFFFFFFDFFFFFFFDFFFFFEFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFAFFFFFFF7FFFEF9EEFFF6F2E6FFF0E9DFFFECE6DCFFF8F5F0FFFEFF
          FEFFFDFFFDFFFBFAF1FFF0E8DEFFF1EADEFFEDEADCFFCDC7B5FFC1B49AFFB8A6
          82FFB5A17CFFB29F7BFFA69571FFB19E7CFFCEBFA5FFB5AB9BFF1E1B0CFFA7A1
          90FFE7D8C1FFC4B39CFFD5C7B6FFEDE9DEFFFFFFFFFFFEFDFBFFEBE7E0FFE7E3
          DDFFE9E6DCFFE2DACEFFD0C3B2FFD0C1B0FFD4C9BAFFE9E2D6FFE8E4DBFFE4E1
          D8FFE7E7E2FFFFFFFFFFFEFFFEFFFFFFFFFFFFFFFFFFFFFFFEFFF9F8F2FFEAE7
          E1FFE4E0D8FFE4DFDAFFE3DFDAFFEBE9E2FFF9F7F3FFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFFFFFFFCFFFFFFFFFFFFFFFFFFFFFFFEFFFDFFFEFEFEFFFDFEFFFFFFFF
          FEFFFFFFFFFFDEDBD7FFB3AFA6FFBAB5ABFFB5B1AAFFE4E0DBFFFFFFFCFFFFFF
          FFFFFDFFFFFFFCFEFEFFFDFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFDED9
          D8FFADAAA5FFAFAAA6FFC3BFBCFFFFFFFFFFFFFEFFFFFFFFFFFFF3F3F3FFB3B4
          B3FFACAAAAFFB8B4B5FFE3E1E0FFBDBABAFFA7A6A6FFA0A0A0FFAAAAAAFFD9D9
          D9FFFBFBFBFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FFFFFFFDF4FFEFE0C6FFF1D7B3FFF0D7B3FFF1E3CCFFFFFFF9FFFFFFFFFFFFFE
          FDFFFFFEFDFFFFFEFFFFFEFFFEFFFCFFFEFFFBFDFDFFFBFEFEFFFEFDFFFFFEFD
          FFFFFFFFFDFFFEFDF3FFF9E6CAFFF0D8B7FFEACFAEFFECD3AFFFEBD3ADFFEED3
          AEFFEBD4AFFFE6D1AFFFF1E1C7FFFEFCF3FFFFFFFDFFFFFFFDFFF9F6EAFFE9D4
          B9FFEDD3AFFFEAD5B7FFF8E4C7FFE9D3B5FFE4CCADFFE6CEAFFFE8D1B2FFE3CF
          AFFFE2D0B8FFFDFBEDFFFFFFFDFFFDFFFDFFFFFFFBFFFBF6EAFFF5E5D1FFEFDC
          C3FFE6D3BAFFE3D1B5FFD8C7AAFFDBC8ABFFE1CBAEFFE0C9B0FFE6D5BDFFFFFC
          F5FFFFFFF9FFE8DBC7FFDAC5A9FFD7C6ADFFEAE2D3FFECE7D6FFC6C0A9FFBEB3
          97FFBFAE89FFA48E5FFFAA925FFF9C8756FFC2B38FFFF7EFDDFF807E74FF2019
          0CFFDECDB8FFCEB89FFFD2C1ADFFF0E8E0FFFFFFFFFFFAF7F5FFD0C8BAFFC2B9
          A8FFC8BBAAFFCCBDAAFFD4C5B1FFD2C4B2FFCDC1B0FFC3B9A6FFC6B9A4FFC3B6
          A2FFC3BFB2FFFFFEFCFFFFFFFFFFFFFDF9FFE6DDD1FFCCC4B3FFBDB4A4FFBBB3
          A3FFBBB3A3FFB9B3A7FFBDB4A8FFBBB2A3FFB9B0A1FFCBC8BFFFFAFAF8FFFDFE
          FFFFFCFFFFFFFCFFFFFFFEFFFEFFFFFEFDFFFDFDFDFFFEFDFFFFFEFCFDFFFFFF
          FEFFFDFAF6FFB6B3ABFFB7B3A9FFB2B0A7FFE6E5E0FFFFFFFFFFFFFFFFFFFFFD
          FCFFFFFEFDFFFDFEFCFFFFFFFEFFFEFEFEFFFFFEFEFFFFFEFFFFFFFFFFFFEAE6
          E5FFACA9A5FFB0ABA8FFBFBBBAFFFFFFFFFFFFFDFFFFFEFFFFFFEFF0F0FFB1B1
          B2FFADABABFFADABABFFA6A4A3FFAAA8A8FFB1B0B0FFCFCFCFFFFEFEFEFFFFFF
          FFFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FFFFF9F1DEFFECD6B7FFF2D9B4FFEDDDBFFFFFFDF1FFFFFFFFFFFDFFFFFFFFFD
          FDFFFFFEFEFFFFFDFEFFFEFEFEFFFEFFFFFFFAFDFDFFFCFEFEFFFDFDFEFFFEFF
          FFFFFFFDF4FFF2E1C8FFEED6B1FFEED5B1FFF1DBBDFFF7EBD3FFFCF2DEFFF9EF
          D9FFF4DFC2FFEFD9B5FFE8D4B1FFF0E4D0FFFFFFF8FFFFFFFDFFFBF7ECFFEED9
          BCFFF5D9B2FFF2D8B5FFEBD2B1FFEAD4B7FFF3E4CFFFFBF1DEFFF0DEC4FFEDD4
          B1FFE8CFB0FFF4E7D3FFFFFFFDFFFEFFFFFFFCF8EFFFE1D1B5FFE6D1AFFFE7D0
          AEFFEBD7BBFFF3E4CBFFF6ECD5FFF6ECD6FFE4D3BCFFDBCAB0FFE0D0BCFFFBF8
          F3FFFFFDFAFFE7D4BDFFE3CEAFFFE3CEB4FFF3EEE1FFFFFFF6FFD1CCBEFFC9C0
          A8FFC7B792FFAB9364FFAC935FFFA89260FFB3A581FFEDE5D2FFD7D5C8FF120B
          00FF9A876FFFDBC9ACFFC3B59FFFF1EBE2FFFFFFFFFFFFFFFEFFFAF7F0FFEEE9
          E1FFEDE7DEFFE8DFD2FFD1C3AFFFD1C2AFFFD0C6B6FFE8E4D8FFEDE9DEFFEAE4
          DAFFF6F3EEFFFFFFFFFFFAF9F7FFD8CFC6FFC1B7A7FFC3B9A7FFC5BBACFFD8D1
          C6FFE5E1D7FFE9E7E0FFD8D3C9FFC3BAABFFC2B8AAFFD1CBC2FFFFFEFDFFFBFE
          FFFFFCFEFEFFFCFFFFFFFEFFFDFFFFFEFEFFFFFEFEFFFEFDFFFFFEFDFEFFFFFF
          FFFFEDEAE6FFAFACA3FFBAB4ABFFBDBBB3FFFFFFFFFFFFFEFEFFFEFFFDFFFEFE
          FDFFFFFDFDFFFEFFFEFFFDFDFEFFFDFEFEFFFFFEFEFFFFFFFFFFFFFFFFFFCECC
          C9FFADA9A6FFACAAA5FFCAC6C5FFFFFFFFFFFEFDFFFFFFFFFFFFECEDEDFFAFAF
          AFFFAEACABFFB0AEADFFAEACABFFACAAAAFFDFDEDEFFFFFFFFFFFFFFFFFFFEFE
          FEFFFDFDFDFFFDFDFDFFFEFEFEFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FEFFF8E7CCFFEFD6B2FFF1D8B2FFF7ECD5FFFFFFFCFFFEFCFFFFFBFEFEFFFFFF
          FFFFFFFEFFFFFFFEFDFFFFFFFEFFFFFFFEFFFFFFFEFFFFFFFCFFFFFFFEFFFFFF
          FEFFF9EEDDFFF0D6B3FFF4D9B2FFF3DDBDFFFCF9EAFFFFFFFAFFFFFFFFFFFFFF
          FFFFFDF7E9FFF0DCBCFFF2D8B2FFEEDABEFFFEFAEDFFFFFFFDFFFAF6ECFFEBDA
          BEFFF1D5B0FFF1D5B2FFEDD6B9FFFBF5E2FFFFFFF9FFFFFFFFFFF5ECDAFFEBD1
          B0FFECD2AFFFF3E3CEFFFFFFFFFFFFFFFFFFFCF6ECFFDECCADFFE7D1ACFFE1CD
          AEFFE8D7C2FFF0E3CFFFEEE7D5FFFCF6EBFFFBF1E1FFF9F1DDFFF8F5E5FFFFFE
          FBFFFDFCF7FFE8D4BDFFE3CDB1FFE0CEB8FFF6F2E8FFFFFFFFFFEEEAE4FFD0CB
          B5FFCFC2A2FFAC9569FFAE9362FFAC9363FFC0AF8CFFD0C7B1FFFFFBEDFF5952
          40FF46371CFFDBC8ACFFC9BAA5FFF0ECE1FFFFFFFEFFFDFEFDFFFEFFFFFFFEFF
          FFFFFFFFFFFFF8F3EDFFD1C4B2FFD1C3ADFFCFC6B8FFFBFAF6FFFFFFFFFFFEFF
          FFFFFEFFFFFFFFFFFFFFE5DDD8FFC3BAADFFC8BDABFFCDC6B9FFF2ECE5FFFFFE
          FDFFFFFFFFFFFFFFFFFFDAD9D1FFBDB8A8FFC0B5A8FFE0DAD2FFFFFFFFFFFFFF
          FFFFFCFEFEFFFCFFFFFFFFFFFEFFFFFFFDFFFFFEFEFFFFFEFFFFFEFDFEFFFFFF
          FFFFE5E2DEFFB0ACA3FFB9B4A9FFBEBBB2FFFFFFFFFFFFFFFFFFFEFEFDFFFFFE
          FEFFFFFFFEFFFEFCFFFFFDFDFEFFFBFDFEFFFFFFFFFFFFFFFFFFEDEBE9FFB0AF
          ABFFAEADA8FFA8A6A2FFE7E4E3FFFFFFFFFFFFFFFFFFFFFFFFFFEAEBEBFFAFB0
          AEFFACA9A8FFAEACABFFA7A5A4FFA8A6A6FFB0AFAFFFCACBCBFFFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFEFEFEFF7F7F7FFF7F7F7FFFFFFF
          FEFFF7E7D1FFF0D7B3FFF5D8B3FFF3E2C6FFFFFEF1FFFEFFFFFFFEFFFEFFFDFE
          FEFFFFFFFFFFFEFEF5FFFCF6E8FFF8E5D0FFF1E0C1FFF4E7D6FFFEFDFAFFFEFF
          FEFFF5E9D5FFF4D8B2FFF2D9B1FFF5E4CCFFFFFFF7FFFEFFFFFFFCFDFFFFFFFF
          FFFFFEF9E9FFF3DCC0FFF0D6B3FFECDABDFFFEFBEFFFFFFFFFFFF6F2E4FFE9D5
          B5FFF6D8B3FFF2D8B9FFFDF6E7FFFFFFFEFFFFFEFFFFFFFFFDFFF1E8D6FFEAD2
          AFFFECD1B0FFF2E2CDFFFFFFFEFFFFFFFFFFFFFFFCFFFFFFF7FFF6F2E5FFF0EA
          DCFFECE5D9FFE4DCCDFFE2D7C2FFDECDB4FFDFCBB0FFEFE1CBFFFDFDEFFFFFFF
          FEFFFFFDF6FFE9DAC2FFE2CDB1FFDACBB4FFF1ECE3FFFFFFFFFFFFFFFFFFEDE9
          E0FFD6CDB4FFB29F78FFAE9368FFAD9368FFC1AF8BFFBFB499FFE5E0D0FFE3DC
          CAFF403316FF8A7958FFC0B094FFD4CDB8FFFFFFFBFFFFFEFFFFFCFBFDFFFFFE
          FFFFFFFFFDFFF8F5EEFFD2C8B5FFD1C2ABFFD2C5B3FFF9F8F2FFFFFFFFFFFFFF
          FFFFFAFEFCFFFFFFFBFFDED2C8FFC8BAAAFFC6BDABFFE3DDD3FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFEAE6E0FFC0BAAAFFBBB5A8FFE2DFD7FFFFFFFFFFFEFE
          FDFFFEFEFFFFFBFEFEFFFEFFFDFFFFFFFEFFFEFFFDFFFDFCFFFFFFFEFFFFFFFE
          FFFFF8F6F3FFB6B2A9FFBAB4A7FFB6B0A6FFD7D4D0FFF9F8F8FFFFFFFFFFFFFF
          FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFCFAFFDAD7D5FFB0ADA8FFAEAD
          A8FFADABA8FFD4D1D1FFFFFFFFFFFEFFFDFFFEFFFCFFFFFFFFFFEBEBEAFFADAA
          AAFFADACA7FFB9B8B8FFE0E0E0FFB8B9B9FFA7A6A6FFA3A1A1FFA8A6A6FFD3D2
          D2FFF5F5F5FFFFFFFFFFFFFFFFFFFEFEFEFFFDFDFDFF7F7F7FFF7F7F7FFFFFFF
          FDFFFBF7EAFFECD9BFFFF1D6B4FFF0D7B5FFF4E2C7FFFAF0DEFFFFF9EAFFFDF7
          E7FFF6EEDBFFF2E3C8FFEDD8B8FFECD3B2FFE7D2B4FFE5DAC8FFFDFCF9FFFCFE
          FDFFFDF7E9FFEBD5B6FFF2D9B1FFF2D9B7FFF8EAD2FFFEF5E5FFFFF9E8FFFAF0
          DFFFF4E0C4FFEFD8B5FFE9D5B3FFF2E8D4FFFFFFFAFFFFFFFDFFF5F0DDFFEBD5
          B5FFF2D6B0FFF2E0C4FFFFFFF5FFFDFFFFFFFEFFFDFFFFFFFDFFF5EADCFFE9D0
          B1FFEDD3AFFFEEDDC5FFFFFFFAFFFEFAF2FFEDE2D2FFEFE4CFFFF3EAD5FFFEF6
          E4FFFFFAEBFFFFFAE9FFFFF7DDFFF0DABCFFE9D2B2FFDCC8B1FFE6DDCFFFFFFF
          FDFFFFFFF9FFEBE0CBFFDCCAAEFFE1CDB0FFE6DBC6FFF9F4E9FFFEF6EDFFF9F1
          E2FFD8C9ADFFBCA47DFFB59B6EFFAA9267FFC2B08AFFBEB192FFCBC2ADFFEFE5
          CFFF604F2EFF3E2B08FFB4A488FFBBB19CFFEFEAE2FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFEFAFFD8CDBFFFD5C8B1FFD4C9B3FFFEFCF5FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFDFFE5E0D7FFC3B8A9FFC8BEAEFFC9C1B4FFE1DED4FFF8F3
          EBFFF4F2EBFFEDEAE6FFD8D1C7FFC4BBABFFC2BAACFFCDCABEFFFFFFF9FFFEFF
          FDFFFDFDFEFFFDFDFEFFFEFEFEFFFFFFFEFFFEFFFDFFFDFDFFFFFDFDFFFFFDFE
          FEFFFFFFFFFFE0DDD8FFB8B3ABFFB4ADA7FFB4AFA9FFC3BCB9FFD7D4D2FFE6E5
          E3FFF0EEEDFFF1F0EDFFECEBE7FFDBD9D4FFC3C0BCFFAEADA7FFACA8A3FFB0AC
          A8FFD4D3D2FFFEFDFCFFFFFFFFFFFEFEFDFFFFFFFEFFFFFFFFFFE9E8E9FFABA9
          A8FFABA9A8FFB7B5B5FFFAFAFAFFFAFAFAFFD2D2D2FFB2B0B0FFA4A2A2FFA6A4
          A4FFB4B3B3FFD6D5D5FFEEEFEFFFFCFCFCFFFEFEFEFF7F7F7FFF7F7F7FFFFFFF
          FDFFFFFFFDFFFDF6E7FFF2DEC3FFEBD3AFFFEED2B0FFEDD4B3FFEAD8BDFFECD7
          B9FFECD3B1FFEDD3B1FFEBD2AEFFF1DCBBFFFCEEDAFFFDFDF4FFFFFEFCFFFDFE
          FCFFFFFFFBFFF7EFDAFFE9D5B3FFECD4AEFFEFD4B1FFEFD8B7FFEDD8B9FFEFD4
          B5FFECD3B3FFEAD2B2FFF1E3C8FFFEFFF4FFFFFFFDFFFFFFFDFFF6F0DFFFE5D2
          B5FFEBD4B3FFE9DDC5FFFFFEF6FFFDFEFFFFFEFEFCFFFFFFFDFFFDF3ECFFE4CE
          B4FFEBD4B2FFE4D2B7FFFEFAF3FFFFF7E9FFDDCBB1FFDECBACFFE3D0B0FFE4D0
          B4FFE3CFBAFFE4D0BBFFE2D1B6FFE2CEAFFFE3CCAFFFDBC8B2FFF1E8DBFFFFFF
          FCFFFFFFFCFFF3EEE0FFD7C9B1FFDDC9ABFFDBCAAEFFDBCBB5FFDACAB8FFDCCD
          B4FFCBB597FFB9A17BFFB69E76FFA79268FFBBAA83FFBFB294FFBCB297FFDED1
          B5FF917E5CFF392605FF887A60FFD7CDBCFFC2BCB2FFFFFFFFFFFFFFFFFFEDEB
          E9FFFDFBF8FFE2DED9FFADA595FF9F9278FF998E79FFB3ADA3FFCBCAC6FFE3E2
          E1FFF2F1EEFFFFFFFFFFFFFFFFFFDBD5CBFFBEB4A8FFC0B8A7FFC0B7A5FFC5BE
          ADFFC3BDAFFFBEB6AEFFBAB2A7FFBFB5A6FFC0B6A7FFB8B4A7FFD8D8D0FFFEFF
          FDFFFEFDFEFFFFFEFFFFFFFEFEFFFFFFFDFFFFFFFEFFFDFEFEFFFCFFFFFFFCFE
          FEFFFEFEFEFFFFFFFEFFECEAE9FFCAC6C2FFB0AAA6FFADA69EFFACA69FFFB1AD
          A6FFB4B1ACFFB3AFAAFFB1AEA9FFAAA7A1FFA8A59FFFA9A5A0FFC1BDB8FFEBE7
          E5FFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFCFCFDFFFFFFFFFFE6E6E5FFB4B2
          B2FFBFBDBCFFBFBEBDFFF5F5F6FFFFFFFFFFFFFFFFFFF3F2F2FFCAC8C8FFA7A5
          A5FF9E9C9CFFA3A1A1FFA4A4A4FFB4B4B4FFFDFDFDFF7F7F7FFF7F7F7FFFFFFF
          FFFFFFFEFDFFFFFFFCFFFFFFFDFFFEF7E9FFF7EDDDFFF5E7D1FFF3EACDFFF4E7
          CFFFF4E9D6FFFAF4E4FFFFFBEEFFFFFFFBFFFFFFFFFFFFFEFFFFFDFCFDFFFFFF
          FDFFFEFEFCFFFFFFFDFFFFFFF4FFF9F4E3FFF2EAD3FFF5E9CEFFF6E9D0FFF2E7
          D2FFF7EFE3FFFEFBEFFFFFFFFEFFFFFFFCFFFDFEFDFFFFFFFFFFFCFBF4FFF0E9
          D6FFF0E6CFFFF3EEE1FFFFFEF8FFFEFEFFFFFFFFFEFFFFFFFFFFFFFFF9FFEFE8
          DAFFF0E3CEFFF3EAD8FFFFFDFAFFFFFFFDFFFFFFF6FFF7F1E5FFF1EDDCFFEEE4
          D1FFF0E4D1FFF2E4CEFFF0E3D0FFEFE7D8FFF3ECE0FFFFFCF6FFFFFFFFFFFFFD
          FDFFFFFFFEFFFFFFFDFFFEFBF4FFEDEBE0FFE6E1D1FFEAE2D1FFEDE2D0FFEAE2
          D0FFF2ECDAFFD2C7ADFFBDAF8BFFB7A47FFFB7A785FFB4A987FFB1A685FFB7AA
          89FFB7AA89FF5B4C2FFF3B2F1CFFE4DED0FF9B958BFF686561FF1B1919FF0200
          00FF7F7761FF685C43FF716545FF827655FF8B7D5FFF91886FFF807864FF766B
          5AFF776E5EFF898475FFB6B3A6FFE4DFD8FFF2EEE8FFE8E8DFFFDEDBD1FFDBD8
          CEFFDAD8CEFFDBDAD1FFE9E9E2FFEDEAE5FFE3E0D8FFD7D1C9FFE3E1DCFFFFFE
          FDFFFDFEFEFFFBFDFDFFFCFEFFFFFCFEFEFFFFFEFCFFFFFFFFFFFEFDFEFFFDFF
          FFFFFBFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFBFAFBFFEEECE9FFE5E2DDFFD4D1
          CBFFD2D1CCFFD4D1CFFFCFCDCDFFD8D7D5FFE9E8E5FFF6F6F6FFFFFFFFFFFFFF
          FFFFFEFEFEFFFEFFFEFFFEFEFEFFFFFFFFFFFFFFFDFFFFFFFFFFFDFCF8FF8D89
          85FF42403FFF8A8988FFFEFFFDFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFAFB
          FBFFE9EAEAFFD0D0D0FFC8C8C8FFD6D6D6FFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FFFFFEFDFEFFFFFEFFFFFFFFFDFFFFFFECFFFDEABDFFECCF90FFF0D28DFFF1CF
          8FFFF4D9A3FFFFF2C6FFFFFFEEFFFFFFFCFFFFFFFFFFFFFDFFFFFEFDFDFFFDFE
          FDFFFDFEFDFFFEFFFCFFFFFFFAFFFFFCDBFFF7DFA8FFEDCF8DFFEFD18DFFEFD4
          99FFFFF5CDFFFFFFF4FFFFFFFAFFFFFFFCFFFCFDFEFFFEFFFCFFFFFCEDFFEED8
          A9FFE6C88AFFF3E9C5FFFFFFF4FFFFFEFFFFFFFDFEFFFDFEFEFFFFFFF4FFF4DD
          B5FFE1C289FFEFDDB0FFFFFFF8FFFFFFFCFFFFFFFAFFFFFFE0FFF4E0B7FFE6CB
          95FFE3C590FFE3C68EFFE2C490FFF2DDB6FFFFFFE4FFFFFFFDFFFDFEFFFFFEFE
          FDFFFEFFFEFFFCFEFCFFFFFFFFFFF5E6C8FFDEC79BFFDCC08EFFDBBE8DFFDBC3
          94FFF3E3BEFFE8CB9FFFB69660FFB89A67FFBFAB7FFFB3A581FFA89D79FFB8A6
          7DFFC3A879FF8C6C3AFF372003FF383028FF18150FFF000000FF151004FF5A52
          3CFFA49978FFC2B18DFFB1996EFF9F8555FFB7A076FFE1D1B0FFD2CAB1FFCBC2
          A8FFCABFA8FFAEA692FFA09886FFA1988BFFAB9F91FFCABFA7FFC5B59BFFB9A8
          8DFFB5A58BFFC7BBA7FFF2EADAFFFFFFFDFFCEC6B2FFA99A87FFDCD2C6FFFFFF
          FDFFFFFFFFFFFCFDFDFFFCFDFDFFFEFEFEFFFFFEFDFFFEFFFDFFFEFEFEFFFDFE
          FEFFFEFDFDFFFDFEFEFFFDFEFEFFFEFDFFFFFFFFFFFFFFFFFCFFD5D1C8FFAFA8
          9CFF9D998CFF9E9790FF9E9891FFB8B3ACFFEFEBE7FFFFFFFFFFFFFFFFFFFDFD
          FDFFFEFEFEFFFDFDFDFFFEFEFEFFFFFEFEFFFEFEFDFFFFFFFFFFD1CFCEFF110E
          0BFF000000FF282826FFE9E9E8FFFFFFFFFFFDFDFDFFFCFDFDFFFFFEFEFFFFFF
          FFFFEAEAEAFFA2A2A2FF848484FFBCBCBCFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FFFFFDFDFEFFFFFFFEFFFFFFF3FFD5AE6FFFC98A2FFFD1871BFFD68B1CFFD88A
          1CFFD4871FFFCE9539FFCEAD6FFFFFFCDBFFFFFFFEFFFFFFFBFFFFFFFEFFFDFD
          FEFFFEFEFDFFFFFFFBFFF7EFCCFFCE9D56FFCD8822FFD1891AFFD68B19FFD087
          1DFFC69039FFEBD09EFFFFFFF8FFFFFFFDFFFEFEFFFFFFFFFDFFEEE3C5FFBD85
          34FFBF7B13FFC79B57FFFFFBE5FFFDFEFFFFFFFDFEFFFFFFFFFFFCFDE5FFB97F
          32FFB87411FFB57D32FFFCF2DEFFFFFFFFFFE8D5B0FFB28743FFB07622FFB273
          18FFB27317FFB37314FFAF6F14FFAB6F20FFA68145FFF0E4C6FFFFFFFFFFFDFF
          FCFFFEFFFCFFFFFFFFFFDDCDABFF966724FF9A6312FF9D640FFF9B620DFF965F
          10FF9A6620FF986822FF8F5C11FF815514FFBA9F6AFFB5A67DFFB2A682FFB29A
          6AFF825918FF89580FFF76521DFF1E1002FF3C362BFF77705DFFABA283FFBCB3
          90FFC6B792FFBCA880FF71501DFF683F05FF74521BFFBEAB84FFBBB59AFFC2BB
          9DFFCAC1A6FFCEC3A9FFD3C8B2FFDFD0B9FF6E583AFF4E3008FF543406FF4E2E
          01FF4E3004FF4A2A04FF614726FF756245FF49300EFF321900FF65523BFFF7F6
          EDFFFFFFFFFFFEFDFDFFFEFEFEFFFDFDFDFFFFFEFDFFFEFFFDFFFEFEFDFFFEFF
          FFFFFFFCFFFFFCFEFEFFFFFFFFFFFFFFFFFFBDBAB3FF4B4638FF271A0DFF1D10
          00FF1A0F00FF180B00FF170B00FF170901FF312820FF99968FFFFFFFFFFFFFFF
          FFFFFDFEFEFFFDFDFDFFFFFFFFFFFFFDFDFFFEFEFEFFFFFFFFFFB7B6B4FF0000
          00FF020000FF252525FFE1E1E0FFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFABAB
          ABFF222222FF000000FF000000FF101010FFF1F1F1FF7F7F7FFF7F7F7FFFFFFF
          FEFFFDFFFBFFFFFFDBFFD4A050FFCD8113FFE2901AFFDC8C17FFD78A16FFDB8B
          16FFDE8B16FFDD8F1CFFD38616FFC37F1CFFF2D398FFFFFFEDFFFEFFFEFFFFFE
          FDFFFFFFFDFFF9F0CAFFC68223FFD58714FFDD911AFFDB8D17FFDD8B14FFDF8D
          13FFDD8F17FFBC7A13FFF1CD8CFFFFFFFEFFFEFEFFFFFFFFFAFFE9DBADFFC284
          2AFFCE861CFFCC994BFFFFF9DCFFFFFFFFFFFFFDFDFFFFFFFFFFFBEAC9FFB77A
          1EFFCB8011FFB57C2BFFFEF3DDFFFEE5BAFFA06714FFBE7716FFBE7A12FFB677
          0FFFB77310FFB6720FFFB2720EFFB87816FFAA6D0CFF96681EFFEDDFBEFFFFFF
          FDFFFFFFFCFFE8DDBCFF926323FFA86A0FFFA66B10FF9E630CFF9B610DFF9B5E
          0EFF965D0CFF9B6412FF9D6615FF85560EFFC1A06CFFBCAC87FFA9A185FF5A48
          1FFF79510FFF905C11FF825616FFBAA27EFFE3D3B8FFD6CCAFFFC5BDA0FFC0B5
          97FFCDBD9EFFBEAA8AFF73511DFF744606FF6F4A0EFFB29C73FFC1B89CFFC2BA
          9CFFC6BEA2FFC3B99EFFC7BA9BFF816A3CFF4E2F00FF5D3D0EFF5C3707FF5732
          03FF4F2F03FF513204FF4C3001FF452D00FF4B3006FF3B2500FF8F8265FFFFFF
          F7FFFBFFFFFFFCFDFFFFFDFDFDFFFFFFFFFFFEFEFFFFFEFEFDFFFFFFFEFFFDFD
          FDFFFFFEFFFFFFFFFFFFFDFCF3FF716655FF0D0000FF211300FF231400FF1E0F
          00FF1A0C00FF190A00FF1A0D00FF1A0E00FF160A00FF010000FF433B32FFF0EF
          EAFFFFFFFFFFFDFEFDFFFFFDFCFFFDFEFCFFFCFDFDFFFFFFFFFFB8B6B5FF0100
          00FF040000FF292727FFE3E3E2FFFFFFFFFFFFFFFFFFFFFFFFFF5A5A5AFF0000
          00FF000000FF000000FF000000FF202121FFF8F8F8FF7F7F7FFF7F7F7FFFFFFF
          FDFFFFFFF1FFE4BD7DFFCF8518FFE5921BFFCE871EFFD79F4EFFE9D194FFEAC3
          83FFD49948FFD0871EFFE19019FFE19118FFC48522FFDEBF88FFFFFEF1FFFFFF
          FBFFFFFFEFFFCCA262FFD28717FFE0911CFFCF8B28FFE3B872FFECCA86FFD297
          3FFFD68A16FFDC8F19FFC48831FFFFF6DDFFFFFFFDFFFFFFF7FFE7D49CFFC280
          22FFCD8619FFCDA257FFFFFFE5FFFDFFFFFFFDFEFDFFFFFFFFFFF8DDB7FFBB7B
          18FFCC8210FFC08734FFFFFAE3FFF6E1BCFF98661BFFA8690FFFB38033FFCEAB
          70FFD9C290FFD9C591FFC89D5CFFAF7221FFB77817FFA26914FFC3A876FFFFFF
          F9FFFFFFFBFFD8BE8FFF996317FFA76B11FFA57228FFC9AE78FFCFBA92FFC7A6
          76FFB2884DFF935F15FF9A6311FF8B5B13FFC9A977FFADA081FF514A35FF3A28
          05FF805817FF905C11FF7F5617FFC6AF89FFDCCBAFFFCDC1A9FFC9C0A8FFC9C0
          A7FFD0C4ABFFC9B79BFF755221FF74480AFF6E4B11FFB9A37EFFCABFA7FFC7BE
          A3FFC8BEA4FFCDC0A4FFB0A07CFF5A3E0DFF613F08FF5A3A08FF5D3F12FF987E
          5BFF9D8666FF644E2AFF452C00FF523708FF4D3207FF423010FFCCC8B6FFFFFF
          FFFFFBFFFEFFFDFDFEFFFEFEFDFFFEFEFEFFFDFDFDFFFDFEFEFFFCFDFDFFFEFE
          FEFFFFFFFFFFFDFCF8FF797060FF1B0B00FF2F1D06FF201000FF231807FF5D55
          48FF908A80FFA09B8FFF6A6256FF281F14FF0F0500FF1D1405FF040000FF4F49
          43FFFFFEFCFFFFFFFFFFFFFEFDFFFEFFFEFFFCFEFEFFFFFFFFFFBCBAB9FF0400
          00FF010000FF2B2727FFE3E3E2FFFFFFFFFFF1F1F0FF545454FF000000FF0301
          01FF000000FF0C0909FF777676FFD7D7D7FFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FEFFF6EFCFFFCC903CFFDF8E15FFD88A19FFDEAB5DFFFEF6D7FFFFFFFFFFFFFF
          FAFFFCF7DBFFEAC477FFC7851EFFD88B14FFDA8B14FFBE8737FFF9F7D9FFFFFF
          FFFFFFECC4FFC6882EFFDD911EFFCA831AFFF0D08BFFFFFFF4FFFFFFFBFFF9F3
          CEFFD89638FFDB8C18FFCB821DFFDEC493FFFFFFF7FFFFFFF6FFE6D195FFC381
          1FFFCD8619FFCAA35AFFFFFFE9FFFCFFFFFFFDFEFBFFFFFFFEFFE8CA9FFFBD79
          13FFCB800DFFCA9443FFFFFFEBFFFFFFEFFFE8C89BFFE4B77AFFF4E5C3FFFFFF
          F8FFFFFFFFFFFFFFFFFFFFFFEAFFD8BA7AFFAE6D16FFA86E16FFBD965BFFFFFF
          EFFFFFFFF9FFD5AC77FF9D6415FF9C6413FFC3A66FFFFFFFF5FFFFFFFFFFFFFF
          F7FFFFFFECFF956828FF935E0DFF8C5D16FFD4B788FF7E735AFF231F0EFF907F
          5BFF8F6526FF8A570FFF7C5418FFC4B18BFFE1D4BAFFD9CEBDFFD5CEBBFFD5CF
          BBFFD8CFBBFFD0C1A8FF7A5829FF6F4507FF6E4B13FFC5AE8AFFD4C7B2FFCDC2
          AEFFCCBEACFFD2C1A6FF9D865EFF593909FF5F3E08FF593A0AFFAE9973FFD1C4
          AAFFD7CAB4FFD8CAB1FF7F6A48FF4C2E03FF4A3004FF5A4C31FFF8F6EFFFFFFF
          FFFFFEFFFEFFFDFDFDFFFDFDFDFFFEFEFEFFFFFFFEFFFCFEFFFFFBFEFEFFFEFF
          FEFFFFFFFFFFB8B0A6FF241300FF2D1B03FF1A0D00FF3F3225FFCAC3BAFFF9FA
          F8FFFFFFFFFFFFFFFFFFFEFEF9FFE0DDD5FF474237FF030000FF1A1106FF0400
          00FF918C87FFFFFFFFFFFFFFFFFFFEFEFEFFFBFEFEFFFFFFFFFFC3C1BFFF0C08
          03FF030000FF292626FFE8E8E7FFFFFFFFFF4B4A49FF000000FF010000FF0000
          00FF080606FFC4C2C2FFFFFFFFFFFFFFFFFFFBFEFEFF7F7F7FFF7F7F7FFFFFFF
          FDFFEFCE8BFFCA8620FFD88E1AFFD29844FFFFF8D4FFFFFFFFFFFEFFFCFFFFFE
          FCFFFFFFFEFFFFFFFFFFFCF0CDFFCE9F5AFFC18122FFCBA467FFFDFBEEFFFFFF
          FFFFEACC96FFD68A19FFDE8C17FFD8A154FFFFFFEAFFFFFFFCFFFEFFFFFFFFFF
          FCFFF3E6B6FFCC8A2DFFD48818FFD5A556FFFFFBDFFFFFFFFBFFE6D49CFFC480
          22FFD18519FFCF9C53FFFFFBE0FFFDFFFFFFFEFFFBFFFFFFFEFFDCBD8CFFBC74
          0FFFC67B0EFFD3A45BFFFFFFFEFFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFFFFFFFFFFFFFFFFFFEAFFD4A960FFAE6F13FFA56C18FFBFA168FFFFFF
          F5FFFFFFF3FFC19859FF9F6410FF976315FFCBBB94FFFFFFFDFFFDFDFCFFFFFF
          FCFFFFFFF7FF8C662EFF925D11FF906520FF866A3DFF8F8167FFCAC1B0FFEFDD
          B9FF956D30FF88540DFF7E5417FFCAB691FFEBE0C8FFDED8C8FFE0D9C8FFE0D9
          C9FFE1DBC8FFD4C7ACFF785624FF734705FF704C12FFCBB796FFD7D0C1FFD1CB
          B7FFCEC7B4FFD4C6AAFF89724BFF573708FF5B3808FF80633DFFC8B597FFBDB2
          96FFBDB497FFD1CAB0FFB9A88AFF4E2E06FF442500FF917F6BFFFFFFFFFFFFFE
          FFFFFFFCFEFFFFFEFEFFFDFCFFFFFFFEFFFFFEFEFDFFFDFEFFFFFDFEFFFFFFFF
          FFFFFFFFFEFF3C3322FF211200FF281400FF544638FFFAF7F5FFFFFFFFFFFFFF
          FFFFFEFFFFFFFDFFFEFFFFFFFFFFFFFFFFFFFFFFFFFF4D4B43FF0C0500FF150C
          00FF170D07FFC8C6C1FFFFFFFFFFFBFEFEFFFBFDFDFFFFFFFFFFC2C1BEFF0A06
          02FF010000FF33302EFFE9E8E3FF444240FF000000FF050303FF000000FF3835
          35FFF0EEEEFFFFFFFFFFFFFFFFFFFEFEFEFFFCFEFEFF7F7F7FFF7F7F7FFFFFFF
          FCFFEDBC6DFFCF8717FFD28615FFDFBA77FFFFFFEDFFFEFEFFFFFCFFFDFFFCFD
          FDFFFCFDFEFFFDFDFEFFFFFFFBFFFFFAE1FFFBE5BDFFFFFAE1FFFFFFFAFFFFFF
          FFFFE3C488FFD98A14FFDB8911FFE7B771FFFFFFF3FFFEFEFDFFFDFDFFFFFFFF
          FCFFF9F0D2FFD39743FFD68815FFD3983FFFFFF2D3FFFFFFFFFFE5D7A8FFC180
          23FFD48718FFD3953FFFFFF3D3FFFEFFFFFFFFFFFCFFFFFFFCFFDCBB89FFBB73
          0FFFC1770CFFD9AB66FFFFFFFFFFFDFEFEFFFFFEFEFFFEFFFEFFFFFFFFFFFFFF
          F4FFFFF9DCFFEFDEB8FFCFA569FFAE7218FFB97714FF9E6719FFD8C59EFFFFFF
          FFFFFFFDEBFFBC914DFFA1670EFF98651BFFD7C8A7FFFFFFFCFFFFFFFEFFFFFF
          FCFFFFFDE3FF886127FF925F14FF885C15FF95794BFFDBCFBAFFE7E3D4FFEADA
          BDFF967037FF86540DFF7C5417FFCAB693FFF0E8D6FFE2DED2FFE6E2D5FFE5E0
          D2FFEAE3D2FFDBCEB6FF72511EFF744904FF714D15FFD6C4A7FFDCD6C8FFD4CE
          BBFFD5CFBDFFDCCFB4FF846D45FF583808FF583908FF8B744DFFC4B597FFB9AE
          90FFBBB090FFC7BDA2FF988867FF462A00FF422600FF9A8972FFFFFFFFFFFFFD
          FFFFFFFDFEFFFFFFFFFFFDFDFEFFFEFEFFFFFEFDFFFFFEFDFFFFFDFDFEFFFFFF
          FFFFE8E2D7FF180D00FF2D1B05FF1F0E00FFCBC2B8FFFFFFFFFFFDFDFEFFFEFF
          FFFFFEFEFEFFFFFFFEFFFFFFFFFFFEFDFEFFFFFFFFFFDCDAD5FF262219FF130B
          00FF0B0100FF6F6A63FFFFFFFFFFFCFEFFFFFCFDFCFFFFFFFFFFC1C0BDFF0905
          00FF060300FF231F1DFF474440FF000000FF050302FF000000FF393838FFEBEA
          EAFFFFFFFFFFFEFEFEFFFFFEFEFFFEFEFEFFFDFDFDFF7F7F7FFF7F7F7FFFFFFF
          FBFFEAB562FFD38817FFCF8315FFE7C791FFFFFFF6FFFCFDFCFFFCFFFEFFFBFD
          FDFFFBFEFEFFFFFFFFFFFDFEFEFFFCFEFFFFFFFFFFFFFFFFFFFFFEFEFFFFFFFF
          FFFFE0C383FFD88A12FFDB8912FFE5B670FFFFFFF2FFFDFEFEFFFEFEFFFFFFFF
          FBFFFEF6DCFFD8A050FFD98917FFCF8F32FFFCECC9FFFFFFFFFFEADDB3FFC184
          2BFFD68917FFCA8523FFF1DFB4FFFFFFFFFFFFFEFFFFFFFFFEFFDDBD8AFFBA76
          0EFFC1780DFFDBAD69FFFFFFFFFFFBFDFCFFFFFFFDFFFFFFF3FFE0CDAAFFB596
          5EFFB1853EFFB17722FFB47213FFBA7715FFAA670AFFAC7D3CFFFFF9E8FFFFFF
          FFFFFEFAE9FFB6873FFFA3670EFF996921FFE0D2B5FFFFFFFFFFFFFFFFFFFFFF
          FAFFF6E3C5FF885F22FF946014FF83550DFFE0C796FFF2ECDBFFDCDCD4FFEBDE
          C6FF9B753DFF86540DFF7C5318FFCAB997FFF3EADBFFE7E2DBFFE6E3DAFFE6E3
          D8FFF1E9D9FFDACEB6FF70511DFF724703FF704E15FFD9C9ADFFE0DBCFFFDAD3
          C0FFDAD4C4FFE0D4B9FF876F47FF573705FF573807FF927B53FFCDC0A0FFB9AE
          90FFBAAE8CFFC6BA9DFF8A7653FF472C00FF482C01FF766449FFEBE6DDFFFFFF
          FFFFFDFEFFFFFDFFFFFFFFFFFEFFFEFEFEFFFEFDFFFFFFFEFEFFFEFEFFFFFFFF
          FFFFC7C1B4FF130400FF2E1C02FF382918FFFFFFFFFFFEFFFFFFFDFEFCFFFEFE
          FDFFFEFEFEFFFFFEFEFFFFFEFEFFFEFEFDFFFFFDFEFFFFFFFFFF827D77FF0D03
          00FF130A00FF1D160EFFF5F3F3FFFFFFFFFFFDFFFCFFFFFFFFFFCAC9C7FF110E
          0BFF070200FF090500FF000000FF060201FF000000FF2C2A2AFFEFEFEFFFFFFF
          FFFFFDFDFDFFFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFF7F7F7FFF7F7F7FFFFFFF
          FCFFEFBC70FFCD8819FFCD8516FFDEBD83FFFFFFF3FFFFFEFEFFFDFFFCFFFFFF
          FCFFFEFEFCFFFFFEFDFFFEFDFDFFFCFFFEFFFEFDFEFFFBFDFDFFFEFDFFFFFFFF
          FFFFE9C890FFD88918FFDC8C16FFD9A255FFFEFEE8FFFFFFFBFFF9FDFDFFFFFF
          FBFFFBF2D7FFD79A4AFFDA8716FFD09235FFFCEFC9FFFFFFFEFFEEE3BBFFC387
          32FFDD8B18FFCD8214FFD2A15EFFFFFFEEFFFFFFFBFFFFFFFFFFDEBE8CFFB677
          0DFFBF780CFFDDAC69FFFFFFFFFFFEFFFFFFFFFCE8FFC28E44FFA4650BFFB873
          14FFB67412FFB5700EFFB17010FFA6701EFFB4935BFFFFFFE9FFFFFFFFFFFFFF
          FFFFFCF9E7FFB2813AFFA56711FF9B6723FFE5D6BAFFFFFFFEFFFFFEFEFFEFED
          E4FFE6D2B3FF8E6424FF936010FF855711FFF7DAB2FFF0E9DBFFE2DFD8FFF9E9
          D0FFA68049FF80520BFF7B5316FFCDB997FFFDF3E6FFEBE5E2FFEAE7DEFFE9E8
          DDFFF4EFE0FFDDCFB8FF6A4915FF734805FF72501BFFE9D9BFFFE2DFD5FFE2DB
          CBFFDFD6C9FFEDDEC6FF997E5AFF5A3706FF5C3705FF7B5E37FFD7C6ABFFC3BB
          9FFFBDB592FFC5B79AFF7D6745FF492C01FF472A00FF816D4DFFB7B19DFFF2F3
          ECFFFCFFFFFFFAFFFFFFFCFDFDFFFFFDFCFFFFFFFFFFFFFEFEFFFFFEFEFFFFFF
          FFFFB1A99DFF170800FF251600FF4C4132FFFFFFFFFFFEFFFCFFFFFFFFFFFEFE
          FEFFFEFFFFFFFEFDFEFFFFFEFFFFFDFCFFFFFEFEFFFFFFFFFFFFEAE7E5FF1F18
          0EFF140A00FF010000FFABA7A5FFFFFFFFFFFFFEFEFFFFFFFFFFCBC9C8FF100D
          0BFF090700FF0B0703FF090501FF000000FF524D4EFFFAF9F9FFFFFFFFFFFEFE
          FEFFFEFEFEFFFEFEFEFFFEFEFEFFFDFDFDFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FCFFF0CC8AFFCC8721FFD68B1BFFD5AB60FFFFFFE4FFFDFFFFFFFEFEFDFFFDFE
          FDFFFFFDFDFFFFFEFDFFFFFFFEFFFDFEFCFFFEFEFDFFFFFFFFFFFEFEFFFFFFFF
          FFFFFADDACFFD08823FFDE911CFFC68629FFFDF1C1FFFFFFFBFFFEFFFFFFFFFF
          FCFFF5EBC6FFD08E35FFD98817FFD19640FFFFF3D4FFFFFFFFFFF0E7C4FFC58B
          38FFDC8A15FFD78917FFB97C1FFFF8E5AEFFFFFFFDFFFFFFFDFFE6C694FFB978
          0FFFBE760BFFDDAD6AFFFFFFFFFFFFFFFFFFF6E5C5FFA7690DFFC67E13FFBE7D
          1AFFB98438FFBA8C4CFFD8B683FFECDAB5FFFFFFEDFFFFFFFEFFFFFFFEFFFFFF
          FFFFFBF8E6FFB07F37FFA86A10FF9B6821FFE4D6BCFFFFFFFDFFFEFFFAFFE3E0
          D2FFE6CFADFF8F6324FF946113FF82520DFFEED3ABFFF1EDE0FFE7E9E1FFFEED
          D8FFA7834DFF83530BFF7C5414FFCEB998FFFDF2E6FFEBE7E5FFEBE9E3FFEBE9
          E3FFF6F0E5FFDDCDB7FF6A4818FF704708FF704F1AFFEFE0C7FFE4E3D9FFE5DE
          D3FFE3DBCFFFEEE2CFFFB1A081FF573709FF613C06FF56390AFFB49F7DFFDED1
          B7FFC1BA9BFFCABFA2FF7B6744FF492D01FF452900FF8C7856FFBFB59FFFB3B1
          A6FFFFFFFFFFF9FDFFFFFDFDFDFFFFFEFEFFFFFEFEFFFDFEFEFFFDFFFFFFFFFF
          FFFFBEB6AAFF160600FF2A1A00FF403324FFFFFFFFFFFDFFFEFFFEFDFEFFFDFD
          FDFFFDFFFDFFFDFDFEFFFEFDFEFFFEFDFEFFFCFEFEFFFDFFFFFFFFFFFFFF514B
          44FF090000FF000000FF746F6BFFFFFFFFFFFEFEFEFFFFFFFFFFCCCBCAFF1210
          0DFF090500FF0C0701FF070100FF100C09FFF2F0EEFFFFFFFFFFFEFEFEFFFCFD
          FDFFFDFEFEFFFDFDFDFFFEFEFEFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FBFFF1E2B3FFC88529FFDD8F19FFCE9336FFFEEFC8FFFFFFFFFFFDFDFEFFFDFD
          FEFFFFFEFFFFFFFEFFFFFFFFFDFFFEFEFDFFFFFFFFFFFEFDFCFFFEFFFEFFFDFF
          FEFFFFFFDBFFC38D39FFDB8F1CFFD08819FFDBAB5DFFFFFFF5FFFFFFFFFFFFFF
          FAFFEFCE8EFFCA8522FFD58819FFD7A75EFFFFFDE2FFFFFFFFFFF5EACBFFC68E
          3CFFDB8A16FFDC8C1AFFCF8415FFC7913CFFFFF9DCFFFFFFFFFFDEB983FFBA76
          0FFFBE760FFFDEB272FFFFFFFFFFFFFFFFFFF2D9B6FFA96B0BFFC88114FFBA80
          24FFFFF0BEFFFDFDE8FFFFFFFBFFFFFFFFFFFEF6E4FFE5D3B8FFF7F3E2FFFFFF
          FFFFFDFAE6FFB3833BFFA6690EFF9C6A1EFFE0D2B5FFFFFFFEFFF7F6EDFFDFD9
          C6FFDBC29CFF885B1DFF986316FF7F4F09FFEBD2A9FFF3F3E7FFE9EAE8FFFFF1
          DDFFA98550FF84530BFF7B5212FFCEB799FFFFF7ECFFEBEAE6FFEEEDE5FFEFEC
          E7FFFFFDF2FFDFD2BAFF6D4918FF6F4606FF795825FFF7ECD0FFECE8DDFFECE5
          D9FFE7DFD4FFE7E2D2FFD5CAB5FF5D4318FF603D04FF593B06FF5A3F14FFD0BD
          9EFFDFD7BAFFDBD0B4FF97825EFF452B00FF462C00FF7B6642FFDDCFB8FFA49D
          8EFFEEEDE8FFFFFFFFFFFEFFFFFFFFFEFBFFFFFFFEFFFCFEFEFFFCFFFFFFFFFF
          FFFFD3CBBFFF110100FF2D1B02FF332314FFFFFFFFFFFEFFFFFFFAFCFEFFFEFD
          FEFFFEFFFDFFFFFFFFFFFDFEFCFFFFFFFEFFFCFDFCFFFCFEFFFFFFFFFFFF8883
          7FFF030000FF060000FF544E49FFFFFFFFFFFEFEFFFFFFFFFFFFD5D4D2FF1C18
          17FF070400FF0A0701FF090401FF000000FF6F6D6AFFFFFFFFFFFFFFFFFFFEFE
          FEFFFDFEFEFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FBFFFAF4DAFFD19A49FFE08D15FFD88B1CFFE6C88AFFFFFFF9FFFEFFFFFFFDFF
          FFFFFBFEFFFFFCFFFFFFFBFFFDFFFDFEFDFFFFFEFEFFFEFFFEFFFEFEFDFFFCFE
          FDFFFFFFFDFFEACF9CFFC67E0EFFE4941BFFCD8416FFDEA451FFFAE8A6FFF2CD
          87FFCF8720FFE2911AFFC9821CFFE2CA9BFFFFFFF9FFFFFFFDFFF6ECCDFFC890
          3FFFD98916FFDA8A19FFD88A1AFFC98018FFC98C30FFFAD886FFC7903AFFC581
          19FFB57417FFF3CB98FFFFFFFFFFFFFFFFFFFAF2D4FFB2741BFFC07A14FFB476
          15FFCC9A4AFFF5E6B8FFFDFDEBFFFFFDE6FFA97E3FFF955A01FFA37530FFF6EF
          D8FFFFFDEDFFB78944FFA4670EFF986215FFCBBB95FFFFFFFCFFD9D6CBFFD4CE
          B8FFA28C65FF875C1EFF9D6516FF7A4803FFEBD2ABFFFBFBF3FFEDEBEDFFFFF7
          E4FFAC8854FF7F5309FF7A5113FFC7B28FFFFFFAECFFF5F2E8FFF7F2E2FFF1E9
          D4FFE2CAACFFC8AA80FF724A13FF75480AFF79561FFFD1B894FFF3E4CCFFEDE0
          C7FFE9E0CFFFE4E3D7FFECEBDAFFB8A887FF4A2900FF613D09FF593506FF4F32
          09FF836C45FFB6A17CFF77603AFF4B3103FF4B3003FF5F4723FFCDBFA3FFCCC4
          AFFFA5A396FFFAFAF5FFFFFEFDFFFFFFFEFFFDFDFDFFFEFEFEFFFCFEFFFFFFFF
          FFFFF3EDE4FF241A05FF291A01FF221300FFCFC9BEFFFFFFFFFFFCFEFEFFFFFE
          FEFFFFFEFDFFFFFFFDFFFFFFFEFFFEFEFDFFFFFFFFFFFEFEFEFFFFFFFFFFB7B1
          ACFF040000FF080300FF3F3A31FFFFFFFFFFFFFFFEFFFFFFFFFFD3D3D1FF1C19
          15FF070400FF070500FF040100FF060202FF000000FF656363FFFFFFFFFFFFFF
          FFFFFFFFFFFFFEFEFEFFFEFEFEFFFEFEFEFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FCFFFFFFF6FFE3BE7EFFD6891BFFDB8C18FFD19543FFFCF8D3FFFFFFFCFFFEFE
          FFFFFEFEFFFFFDFEFDFFFEFEFDFFFEFEFEFFFFFDFEFFFFFEFEFFFDFDFDFFFDFE
          FEFFFFFFFEFFFFFFE8FFD6A352FFC98318FFE8941EFFD78818FFD58C24FFCB85
          1DFFE18F1AFFD98B18FFC9903BFFFFFDE4FFFFFFFEFFFFFFFCFFF3E9C8FFC78D
          39FFD88A17FFD48D1FFFCE881EFFCC841BFFCF8616FFC78016FFC7811AFFCC86
          16FFAC7422FFFDEECAFFFFFFFFFFFFFEFFFFFFFFF2FFCFA96CFFA66C14FFC07B
          16FFB47415FFAA7322FFC29859FFD7B475FFB37A27FFB17111FFAC7A2EFFF2E9
          D0FFFFFFF4FFC59859FFA0650FFF986211FFC7B182FFFFFFEBFFD8D4C6FFB9B3
          9CFF95805DFF936B2DFF9A6413FF7D4B05FFE6CCA4FFFEFDF7FFEEEDEFFFFFFC
          EBFFAD8A56FF80520AFF785113FFC5B291FFFFFDF2FFFBF3E5FF9C825FFF7252
          24FF6E4D17FF714D11FF784D10FF794E0FFF6F4A0DFF664612FF715125FF6446
          1BFF7C6749FFF6EEDDFFE7E2D6FFF5E9D7FF8A7352FF4A2D00FF593906FF5C3B
          0BFF4C2E02FF51350CFF492E03FF533709FF4D2F03FF4C3713FFB8AB8EFFD6CB
          B6FFA6A190FFD4D4CAFFFFFFFFFFFFFDFEFFFEFEFEFFFDFDFDFFFEFDFEFFFFFF
          FFFFFFFFFDFF453B2AFF241300FF1F0E00FF8C8577FFFFFFFFFFFBFDFEFFFEFE
          FDFFFFFEFDFFFFFFFEFFFEFFFEFFFDFCFEFFFFFFFFFFFEFDFEFFFFFFFFFFB8B2
          ACFF030000FF090500FF35322BFFFFFFFFFFFFFFFFFFFFFFFFFFD8D7D6FF201C
          1AFF040100FF1E1B17FF302D29FF010000FF030100FF000000FF838181FFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFF7F7F7FFF7F7F7FFFFEFF
          FDFFFEFFFFFFFFEBC0FFCA892DFFE0911EFFCB831CFFEBBF79FFFFFFFFFFFFFE
          FCFFFEFBFFFFFFFFFEFFFEFDFDFFFFFEFEFFFDFEFFFFFEFEFFFFFEFEFFFFFEFE
          FFFFFEFDFFFFFFFFFBFFFFF3CEFFD7A358FFC67911FFD88615FFD58815FFD78A
          16FFCE8314FFC08123FFF6E2A8FFFFFFFDFFFFFDFFFFFFFFFDFFEDE3C5FFBF88
          34FFD28716FFD69838FFFFD681FFBA812CFFBB7910FFC47F14FFC07D14FFAF70
          0AFFC89D5DFFFFFFF1FFFFFFFFFFFFFDFEFFFFFFFAFFFEF8DEFFD4AE72FFA668
          11FFAC690EFFB26E10FFB36F0EFFB3710EFFB87616FFAD7017FFB88842FFFEF5
          DDFFFFFFF9FFC5A16DFF8E590BFF8A580BFFBCA171FFEDE0C7FFDDD7C8FF978F
          78FFC0AC8FFF9B7844FF84540BFF683E00FFDCC4A0FFFFFFF9FFF1F2F4FFFFFD
          EFFFAE8956FF7F510AFF7B5315FFC6B494FFFFFFFAFFEDE1D1FF745020FF6841
          00FF704902FF6F4906FF774D0DFF764E0FFF6E4A09FF684204FF653D03FF5B34
          00FF4E330BFFF1E1CEFFEFE5DBFFEAE1D9FFEADFCAFFA3936DFF4A3103FF4525
          00FF4D2D02FF4B2A03FF492C01FF402500FF3F2500FF8E7B58FFC7BC9FFFCCBF
          A8FFC1B9A7FFC7C5B7FFFFFFFBFFFEFEFFFFFDFEFEFFFEFEFFFFFFFDFFFFFFFF
          FEFFFFFFFFFF817869FF1F0E00FF281800FF403626FFEAEAE7FFFFFFFFFFFEFE
          FEFFFFFFFFFFFEFEFEFFFCFEFFFFFDFDFFFFFEFEFEFFFDFDFEFFFFFFFFFFB2AD
          A6FF010000FF080300FF3C3833FFFFFFFFFFFDFEFFFFFFFFFFFFDEDEDDFF2522
          22FF000000FF33322FFFD6D2CEFF1A1717FF000000FF030101FF000000FFA2A1
          A1FFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFF7F7F7FFF7F7F7FFFFEFD
          FEFFFBFDFDFFFFFFFCFFDEBF89FFCB8211FFE4931AFFC77F1BFFF9DDAEFFFFFF
          F6FFFBFEFDFFFCFDFDFFFEFDFEFFFFFFFFFFFFFFFEFFFFFFFCFFFFFFFFFFFFFF
          FEFFFEFFFDFFFEFEFDFFFFFFFCFFFFFFFBFFFAE8C7FFD5B785FFC7A76CFFC7A7
          69FFDCBF8FFFFFFADDFFFFFFFEFFFEFFFBFFFDFFFFFFFFFFFCFFF5F0DAFFC394
          51FFB9781DFFCCA464FFFFFFE7FFFFFFF0FFD7BC8FFFC0A16BFFBE9E69FFE0C8
          9EFFFFFFF1FFFFFFFFFFFDFFFDFFFEFEFCFFFEFFFBFFFFFFFFFFFFFFFFFFFFFC
          E8FFD4BD97FFBA955EFFB47C30FFAF6D11FFB46E0DFFA1650BFFB69052FFFFFD
          E9FFFFFFFFFFEEEAD7FFAB956FFFA99468FFE4D9BBFFDFD6C1FFCFC8B4FF938D
          76FFDAD2C1FFE7D9C1FF968056FF9D8A68FFFFFAE8FFFBF8F2FFF6F5F8FFFFFD
          EDFFAA8856FF84530DFF7B5014FFC9B296FFFFFFF6FFFCF9EEFFA79476FF7A5F
          32FF886B38FF8D6E3EFF744B13FF774B0CFF77551DFF836134FF785A30FF6C55
          2CFF988B6DFFFAF2E3FFEAE3D5FFE5DFD4FFE7E0D4FFF3ECDAFFE8E0CAFFA195
          7AFF7A6847FF77603EFF765E3EFF998868FFC3B395FFCCBFA3FFC2B79AFFC4B8
          9CFFCBC2A9FFAFAA97FFF3F0E9FFFFFFFFFFFDFFFFFFFCFCFDFFFDFEFFFFFEFF
          FEFFFFFFFFFFE2E0D7FF332614FF2B1E01FF1A0D00FF72695AFFFFFFFFFFFFFF
          FFFFFFFCFEFFFEFDFEFFFFFDFFFFFEFDFDFFFFFFFFFFFFFFFEFFFFFFFFFF7670
          6AFF060000FF050000FF585450FFFFFFFFFFFBFFFFFFFFFFFFFFDCDCDBFF2521
          20FF000000FF1F1D1CFFE5E5E1FFF1EFEEFF0C0A0BFF000000FF000000FF0200
          00FFAFACACFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFFFDFE
          FDFFFEFDFEFFFFFFFEFFFFFFE2FFCE9336FFD68C18FFDB8D1BFFCB933EFFFAEE
          BFFFFFFFFAFFFDFDFFFFFFFFFFFFFFFFF0FFE9CC96FFE4C58FFFFFF1CFFFFFFF
          FCFFFDFDFEFFFDFDFEFFFEFFFFFFFFFFFEFFFFFFFBFFFFFFF9FFFFFFF6FFFFFF
          F5FFFFFFFAFFFFFFFCFFFDFEFFFFFCFEFCFFFCFEFDFFFEFEFDFFFFFFF8FFFCEC
          CEFFF1D9B1FFFCF3DAFFFFFFFCFFFEFFFFFFFFFFF9FFFFFFF8FFFFFFF8FFFFFF
          FBFFFFFFFDFFFCFDFFFFFBFFFDFFFEFDFBFFFEFFFCFFFBFDFFFFFEFDFFFFFFFF
          FFFFFFFFFFFFFFFFF3FFFAE8C4FFDCC192FFC09960FFB3915CFFE0D0B1FFFFFF
          F9FFFFFFFDFFFFFFFCFFFFFFFFFFFFFFFDFFEAE3D1FFDAD2BCFFC1B9A2FF8782
          6BFFE2DCCFFFFFFFFBFFFFFFEEFFFFFFF3FFFBF9EFFFF9F7F2FFF8F7F8FFFFFB
          EDFFA78556FF80510CFF7B5214FFC8B290FFFFFEF2FFFAF7F2FFFFFAECFFF5EA
          D6FFFFF9DFFFDAC6A3FF6D4712FF6F4406FF8F6F3AFFF6E7C9FFF0E3D1FFF0E5
          CFFFFDF3E3FFEDE6DAFFE6E2D5FFE9E3DBFFE8E0D7FFE3DDD2FFE3E0D1FFEEE9
          D5FFF1E8CFFFEFE0C8FFE6D8C0FFD8CDB5FFCABEA4FFBDB295FFBCB394FFC3B6
          9AFFD0C6ABFFADA68FFFD2CEC6FFFFFFFFFFFCFEFDFFFDFCFEFFFEFEFFFFFEFE
          FDFFFFFFFFFFFFFFFEFF847C70FF211100FF2D1A01FF1E0D00FFA59A92FFFFFF
          FFFFFFFFFFFFFDFDFEFFFDFDFFFFFEFEFEFFFFFFFEFFFFFFFFFFF9F6F2FF2E26
          1CFF110800FF000000FF7F7B76FFFFFFFFFFFCFFFFFFFFFFFFFFDFDFDDFF2823
          22FF000000FF1D1A18FFD6D6D2FFFFFFFFFFB2B1B0FF080606FF000000FF0000
          00FF0C0A0AFFD6D6D6FFFFFFFFFFFEFEFEFFFEFEFEFF7F7F7FFF7F7F7FFFFDFF
          FCFFFEFEFFFFFEFFFFFFFFFFFBFFEDD89CFFC58323FFE09018FFD98C17FFCA99
          48FFFFF4CEFFFFFFFFFFFFFFFFFFF4D9AEFFC27A16FFC47C15FFE4B671FFFFFF
          FFFFFDFCFFFFFEFCFEFFFFFFFFFFFEFCFEFFFCFDFDFFFCFEFCFFFCFEFCFFFDFF
          FEFFFCFEFDFFFDFDFFFFFEFDFDFFFBFDFDFFFCFEFEFFFCFEFFFFFEFEFDFFFFFF
          FFFFFFFFFFFFFBFFFDFFFDFDFFFFFCFDFFFFFDFEFCFFFDFDFCFFFFFFFEFFFFFD
          FEFFFFFDFFFFFFFEFFFFFDFFFCFFFDFEFDFFFFFFFFFFFCFEFFFFFDFEFEFFFFFE
          FEFFFCFCFEFFFEFEFFFFFFFFFDFFFFFFFEFFFFFDF1FFFEFCF1FFFFFFFCFFFDFE
          FBFFFFFFFBFFFFFEFDFFFFFFFFFFF6F4F1FFD7CFC1FFDCD3BFFFA7A088FF9890
          7DFFF9F6EAFFFAFAF0FFF4F0EAFFF5F5F0FFF8F7F2FFF9F6F4FFF7F6F8FFFFFE
          EDFFAE8F60FF7B520DFF795111FFC2AC85FFFFFFF3FFF5F3F3FFF7F4EFFFFBF6
          F7FFFFFFFCFFC8B59AFF694412FF6F4607FF846736FFF8F0DEFFEEEFEEFFF0ED
          E6FFF0EAE2FFEAE5DDFFE8E6DCFFE9E5DEFFE5E1D8FFE6E0D5FFE0DACEFFDFDB
          CAFFDED9C6FFD9D3BFFFD4CCB9FFD0C8B2FFCDC1AAFFC3B79BFFBBB093FFC0B4
          98FFCFC3A7FFBFB59DFFADAA9DFFFFFFFFFFFCFDFDFFFDFEFEFFFEFDFFFFFEFF
          FEFFFDFCFEFFFFFFFFFFEBEBE5FF352514FF250F00FF291604FF1E0F00FFA198
          8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF8FF68645BFF1006
          00FF160C01FF020000FFCAC6C1FFFFFFFFFFFDFFFFFFFFFFFFFFE3E2E0FF2A25
          25FF010000FF181514FFD1D1CDFFFFFFFFFFFFFFFFFF878686FF000000FF0402
          02FF000000FF303030FFFCFCFCFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FEFFFAFEFDFFFEFEFEFFFFFFFDFFFFFFF8FFEBCB90FFD0861EFFDD901AFFD88B
          18FFCB841FFFEFC275FFFBDE92FFD29438FFD88F1CFFD08915FFE5B460FFFFFF
          FEFFFCFFFFFFFCFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFCFFFFFFFCFEFFFFFDFE
          FFFFFEFFFFFFFFFEFFFFFFFFFFFFFDFFFFFFFCFFFDFFFFFFFDFFFFFDFFFFFFFF
          FFFFFFFFFEFFFFFFFCFFFFFEFFFFFFFDFFFFFCFFFFFFFCFFFEFFFCFFFEFFFEFF
          FFFFFFFFFDFFFFFFFDFFFFFEFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFFFFFFFFFF
          FEFFFFFFFFFFFDFFFFFFFFFFFEFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFCFFFFFE
          FCFFFFFEFDFFFFFFFEFFFFFFFFFFE1DFD5FFCEC8B7FFDAD0BFFF908677FFBCB4
          A6FFFFFFF6FFF8F8F4FFF4EFEDFFF9F5F3FFF8F6F6FFF7F5F6FFF8F6F9FFFFFF
          F2FFB49365FF7C500DFF7B5112FFC3AC88FFFFFFF5FFF7F4F5FFF8F4F0FFF3F2
          EEFFFFFDF3FFC4B297FF633F0CFF683B00FF907245FFFCF2E0FFEDEEEBFFEDEB
          E3FFEAE7E0FFEBE8DFFFE9E7DDFFE6E7DAFFE3E5D9FFE1E1D6FFE2DCD1FFE2D9
          D0FFE2DACBFFDED8C5FFD8D0BCFFD4CDB4FFCBC5AAFFC1BA9FFFBBB396FFBDB1
          95FFC8BC9FFFCCC3A9FFA39B8CFFFFFEF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFEFFFFFFFFFFFFFFDFDBD4FF201400FF231300FF281906FF0F02
          00FF302616FF827C70FFB8B4A9FFA39C92FF665B58FF22170EFF070000FF180F
          02FF040000FF55514EFFFFFFFFFFFFFFFEFFFFFFFEFFFFFFFFFFE2E1DFFF2B27
          24FF020000FF130F0FFFCCCBCBFFFFFFFFFFFFFFFFFFFFFFFFFF696767FF0000
          00FF010000FF000000FF595959FFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFFFCFF
          FDFFFAFFFEFFFEFEFEFFFFFFFFFFFFFFFDFFFFFFEBFFEAC588FFC27F1FFFDE8E
          1BFFE39119FFD1881AFFD78A1AFFDE8E1BFFE1941CFFD28716FFE9B364FFFFFF
          FFFFF9FFFFFFFBFEFEFFFFFFFEFFFFFFFFFFFEFFFFFFFDFFFFFFFDFDFFFFFFFD
          FFFFFFFFFFFFFFFDFFFFFFFEFFFFFEFFFFFFFDFFFDFFFDFFFDFFFFFEFFFFFFFE
          FFFFFFFEFEFFFFFFFCFFFFFFFEFFFFFDFFFFFDFEFFFFFCFFFDFFFEFFFDFFFFFF
          FEFFFFFFFDFFFEFFFDFFFFFEFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFEFFFFFF
          FDFFFFFFFFFFFFFFFEFFFFFFFDFFFFFFFDFFFFFDFFFFFFFDFFFFFFFFFEFFFFFE
          FEFFFFFEFFFFFEFFFEFFFFFFF9FFDBD5C8FFD4CCB8FFD7CDBCFF7B6F62FFCBC4
          B7FFFFFFFAFFF5F7F4FFF6F3F3FFF7F4F4FFF5F5F4FFFAF7F7FFF7F6F9FFFFFF
          F2FFB19162FF7E500EFF7A5012FFC1AB88FFFFFFF7FFF6F6F5FFFAF7F4FFF7F5
          F3FFFEFBF3FFDFD5C3FF79613EFF6D522BFFC0B095FFFFFAEDFFEBEDE7FFEBEC
          E6FFECEBE6FFEAE7E2FFEBE8DEFFE9E8DCFFE4E4D8FFE4E3D9FFE5E0D4FFE4DA
          CEFFE4DBCEFFE0D8CAFFD7D1C0FFD3CDB8FFCEC8AFFFC4BCA4FFBAB296FFB9AE
          92FFC6BB9FFFCCC0A8FFADA691FFEEECE4FFFFFFFFFFFFFFFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFDFFFFFFFCFEFFFFFFFFFFFFBDB8ADFF372E1BFF140900FF2818
          05FF1C0E00FF140800FF170D00FF150900FF0D0000FF190D02FF191002FF0100
          00FF3B3633FFDEDEDAFFFFFFFFFFFEFFFEFFFEFEFDFFFFFFFFFFE2E0DFFF2924
          24FF030000FF0C0808FFC4C4C3FFFFFFFFFFFFFFFEFFFFFFFFFFF9F9F9FF3D3C
          3CFF000000FF000000FF040404FFC3C3C3FFFFFFFFFF7F7F7FFF7F7F7FFFFCFF
          FDFFFCFFFEFFFEFEFDFFFFFFFFFFFFFEFEFFFEFFFFFFFFFFF5FFECD08FFFCA87
          2CFFCC7F14FFCC8312FFCE8210FFD48512FFDF8F1FFFCA8018FFEBB772FFFFFF
          FFFFF9FEFFFFFEFEFEFFFFFFFDFFFFFFFFFFFDFFFFFFFFFFFFFFFFFEFFFFFFFE
          FFFFFFFFFFFFFFFEFFFFFFFEFFFFFFFFFEFFFDFFFDFFFCFFFDFFFFFFFEFFFFFD
          FFFFFFFDFFFFFDFFFFFFFEFFFFFFFFFEFFFFFEFDFFFFFDFFFEFFFFFFFEFFFFFF
          FFFFFFFFFEFFFCFFFEFFFDFFFFFFFEFFFFFFFFFFFFFFFEFFFFFFFFFFFDFFFFFF
          FDFFFFFEFFFFFFFFFEFFFFFFFDFFFFFFFDFFFEFEFFFFFDFEFFFFFEFEFEFFFFFD
          FFFFFEFCFFFFFDFFFDFFF9F8EFFFD4CFBFFFD6CCB6FFD0C5B2FF796F5EFFDFD8
          CCFFFFFFFCFFF5F4F4FFF5F3F3FFF5F5F4FFF6F7F4FFF9F7F6FFFAF9FAFFFFFF
          F1FFB08F62FF7F500DFF7B5012FFC0AA8BFFFFFFF9FFF6F8F8FFF8F9F7FFF6F5
          F4FFF9F8F4FFFBF8F0FFF2EFE3FFF0EEE0FFFAF7EEFFF5F2EBFFEEEDE9FFEAEC
          EBFFEEEDE9FFECE9E3FFEBE8E0FFEDE9DFFFE9E4DCFFE5E3DBFFE8E3D6FFE5DE
          CEFFE3DACDFFE1D7CEFFDBD2C6FFD6CEBCFFD1C9B5FFC9C1A8FFBEB599FFB9AF
          93FFC1B69BFFCAC0A5FFB4AC99FFE8E4DAFFFFFFFFFFFFFFFDFFFFFFFEFFFFFF
          FFFFFFFFFFFFFDFFFEFFFBFEFFFFFFFFFFFFFFFFFFFFDFDDD6FF615B4CFF0400
          00FF0D0200FF0F0000FF0C0000FF0D0000FF090000FF010000FF020000FF6661
          5DFFEFECECFFFFFFFFFFFBFDFDFFFDFEFFFFFFFEFEFFFFFFFFFFE5E4E4FF221F
          1DFF000000FF010000FFC4C5C3FFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFD5D5
          D5FF0E0E0EFF000000FF000000FFAEAEAEFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FFFFFEFFFCFFFEFFFBFFFFFFFEFFFDFDFDFFFEFDFEFFFEFFFFFFFFFFFDFFFFFF
          EDFFEED5AFFFD2B780FFDABC87FFDEB97FFFC98F37FFB58035FFF9E2B7FFFFFF
          FFFFFCFEFEFFFFFFFEFFFFFFFFFFFFFDFFFFFFFDFFFFFFFFFFFFFEFFFEFFFDFF
          FDFFFEFFFDFFFEFFFFFFFEFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFEFFFEFFFEFF
          FEFFFFFFFEFFFFFFFDFFFEFFFDFFFCFFFDFFFFFFFFFFFFFDFFFFFFFFFFFFFFFF
          FFFFFDFFFFFFFCFFFFFFFEFFFFFFFEFFFFFFFFFFFFFFFFFDFFFFFFFFFFFFFFFF
          FFFFFFFDFFFFFFFDFFFFFFFDFFFFFFFDFFFFFDFFFFFFFCFFFFFFFDFEFEFFFFFE
          FFFFFEFFFFFFFDFFFFFFEFEFE8FFCFC9B8FFD3CAB5FFCBBFA8FF817765FFE2DC
          CFFFFFFFFEFFF8F6F5FFF6F4F3FFF7F6F6FFF8F5F4FFFCF8F7FFFCF9FCFFFFFF
          F5FFB0946AFF744503FF744506FFBFAB8AFFFFFFF9FFF8F7F7FFF6F7F5FFF9F8
          F4FFF9F6F3FFFBF7F5FFFBFAF2FFF9F7EFFFF5F2EEFFF5EDEAFFEFEAE8FFEFEC
          E8FFF1EAE5FFF0EAE5FFEEEAE1FFECEAE2FFEAE7DFFFE6E5DCFFE8E3D8FFE9E1
          D5FFE6DDD0FFE0D8CAFFDFD8C7FFD9D1C1FFD4CCB8FFCCC4ABFFC1B89CFFBCB2
          95FFBFB397FFC9BFA5FFB3A993FFD9D4CAFFFFFFFFFFFFFFFEFFFFFFFDFFFFFF
          FFFFFFFFFFFFFFFFFDFFFEFEFFFFFEFDFFFFFEFDFFFFFFFFFFFFFFFFFFFFF4F2
          F0FFA5A29AFF7B746CFF7C766DFF757268FF838278FFCECEC8FFFFFEFAFFFFFF
          FFFFFFFFFFFFFDFFFFFFFCFFFFFFFDFEFEFFFFFDFFFFFEFFFFFFFFFFFFFFBDBB
          BAFF646363FFA2A3A3FFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFFFFF
          FFFFDBDBDBFF616161FF8C8C8CFFFBFBFBFFFFFFFFFF7F7F7FFF7F7F7FFFFEFF
          FFFFFCFEFDFFFEFFFEFFFEFEFDFFFEFDFCFFFEFDFEFFFDFDFEFFFDFFFEFFFEFF
          FBFFFFFFFBFFFFFFF8FFFFFFF9FFFFFFF7FFFFF1C9FFFEEDCCFFFFFFF0FFFEFF
          FAFFFDFEFDFFFFFDFFFFFFFEFFFFFEFEFFFFFDFEFFFFFFFEFFFFFEFFFDFFFDFF
          FDFFFDFFFEFFFDFFFFFFFCFFFFFFFEFFFFFFFEFDFFFFFFFFFFFFFCFFFFFFFDFF
          FEFFFFFFFEFFFDFFFEFFFDFFFEFFFDFFFEFFFFFEFFFFFFFEFFFFFFFFFFFFFFFF
          FFFFFEFFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFEFFFFFDFFFEFFFDFF
          FEFFFFFEFEFFFFFEFFFFFFFEFFFFFFFEFFFFFEFFFFFFFCFFFFFFFCFEFEFFFFFF
          FEFFFEFEFEFFFFFFFFFFF0EEE7FFCEC7B5FFD1CBB5FFC3BAA5FF8A8271FFE9E5
          D8FFFFFFFCFFF8F7F6FFF5F3F1FFF7F8F6FFF9F8F7FFFDFAF8FFFBF9FAFFFFFF
          FBFFE3D8C3FFA8916BFFAC9370FFEBE2D1FFFFFDF7FFFAF8F8FFFAF8F6FFF9F7
          F6FFF6F6F6FFF8F4F4FFFAF8F4FFF6F5F0FFF4F1EFFFF4F0EDFFF1EDE8FFECEB
          E6FFF1ECE6FFEDE8E3FFEDEAE2FFEAE8E0FFE9E8DFFFE8E6DDFFE7E4DAFFE6E2
          D7FFE3DED1FFDED9C8FFDCD5C6FFDBD2C4FFD6CDBAFFCCC4ABFFC2B89DFFBEB1
          94FFC0B396FFCDC1A5FFB4A893FFCFC9BFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFF
          FFFFFFFFFFFFFFFFFDFFFFFFFEFFFCFDFDFFFEFEFEFFFFFDFDFFFEFCFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
          FFFFFFFEFEFFFDFEFCFFFDFEFDFFFEFDFDFFFEFDFFFFFCFEFEFFFEFDFDFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFDFEFFFEFEFEFFFDFDFDFFFDFD
          FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFF7F7F7FFF7F7F7FFFFCFF
          FFFFF9FDFEFFFAFEFFFFFEFEFEFFFEFEFDFFFFFFFFFFFCFCFCFFFDFEFDFFFEFE
          FCFFFFFEFEFFFDFEFDFFFDFEFEFFFFFEFEFFFCFFFFFFFEFFFFFFFEFEFCFFFFFF
          FEFFFFFEFDFFFFFDFFFFFEFDFFFFFCFFFFFFFCFFFFFFFFFDFFFFFFFFFDFFFFFF
          FDFFFFFFFFFFFFFFFFFFFEFFFFFFFCFFFFFFFDFEFFFFFFFFFFFFFEFDFFFFFEFF
          FFFFFFFFFFFFFCFFFFFFFDFFFFFFFFFFFFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFFFFFFFFFFFDFFFDFFFFFFFCFFFDFFFCFF
          FDFFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFEFEFDFFFFFF
          FBFFFFFFFCFFFEFDFDFFE9E3DBFFD0C9B8FFD1CBB7FFC2BCA8FF908979FFE9E5
          DAFFFFFFFEFFF7FAF8FFF8F6F2FFFAF9F7FFFDFEFEFFFBFBFBFFFDFBFBFFFBFA
          FAFFFCFFFEFFFFFFFCFFFFFFFCFFFFFFFCFFFAF9F9FFFAF8F7FFFCF7F6FFF7F6
          F6FFF7F6F8FFF8F6F7FFF8F4F3FFF8F5F3FFF3F1F1FFF5F2EFFFEEECE7FFEDEE
          E8FFEDECE6FFEEEAE4FFEDE9E4FFEBE8E1FFE9E7DEFFE9E7DDFFE7E5DAFFE2E2
          D6FFDEDED2FFE0DBCEFFDAD3C6FFDAD1C4FFD7D0BFFFCDC5ADFFC4BBA0FFBEB1
          93FFC1B495FFCCC1A4FFADA18BFFC8C2B9FFFFFFFFFFFFFFFFFFFFFFFDFFFFFF
          FFFFFFFFFFFFFFFFFDFFFDFFFCFFFFFFFDFFFDFEFCFFFFFDFDFFFFFDFFFFFFFD
          FEFFFFFEFDFFFFFEFFFFFDFDFDFFFFFEFEFFFFFEFEFFFDFDFDFFFCFFFFFFFEFD
          FDFFFFFEFDFFFFFFFBFFFFFFFDFFFEFEFDFFFFFDFFFFFEFDFEFFFEFFFEFFFFFE
          FDFFFDFDFEFFFFFFFFFFFFFFFFFFFDFEFDFFFFFEFFFFFCFBFEFFFEFEFEFFFDFD
          FDFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFDFFFF7F7F7FFF7F7F7FFFFFFF
          FFFFFDFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FEFFFFFFFFFFFFFFFCFFE3DED2FFD0C8B4FFD4CBB6FFCBC3ADFF999281FFE9E3
          DCFFFFFEFDFFFCFCFAFFF9F8F4FFFDFBFAFFFFFCFFFFFDFCFEFFFCFBFDFFFDFE
          FBFFFDFCFDFFFDFDFFFFFCFCFCFFFDFEFCFFFBFCFCFFFAF9FCFFFBFAF9FFFBF9
          F7FFF9F7F6FFF9F7F7FFF8F6F5FFF5F3F2FFF5F4F1FFF6F3EFFFF5F2EEFFF1EE
          EAFFF2ECEAFFF0EBE8FFEFECE7FFEEE9E5FFEBE6E2FFE9E7DDFFE5E3D8FFE6E4
          D9FFE6E2D8FFE5DCD0FFE0D6C9FFDBD3C3FFD8D1BEFFD0C8B1FFC9BBA2FFBFB2
          97FFC0B697FFC9BFA1FFA89E88FFCBC4BBFFFFFFFFFFFFFFFFFFFFFFFDFFFFFF
          FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFE
          FFFFFEFEFFFFFEFEFBFFE1DDD1FFD1C7B3FFD4C9B4FFD1C7B2FFA29C8CFFE5E0
          D8FFFDFDFBFFFCFDFAFFFBFAF6FFFBFBFAFFFEFDFEFFFEFDFFFFFDFDFEFFFDFE
          FCFFFCFCFCFFFDFCFDFFFDFDFDFFFDFEFCFFFAFAFAFFFBFAFDFFF8F9F9FFF9F8
          F6FFFBF8F7FFF8F6F6FFF8F6F5FFF8F6F4FFF5F4F0FFF5F4F0FFF4F1EDFFF3F0
          ECFFF2EEEAFFEEE9E6FFECEAE4FFECE7E3FFEBE7E0FFEAE8DEFFE6E4D9FFE4E2
          D7FFE4DED4FFE5DDD1FFE1D6C8FFDDD2C3FFD7CFBCFFD1C9B1FFC9BCA5FFC3B8
          9BFFBCB193FFC8BEA0FFA59A87FFD1CCC4FFFFFFFFFFFFFFFFFFFFFFFEFFFFFF
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFD
          FFFFFFFEFFFFFCFDFCFFDDDBCEFFD0C8B3FFD5C9B5FFD5CBB6FFA6A28FFFE0DD
          D3FFFFFEFCFFFDFDFDFFF9FBF8FFFBFBFCFFFEFEFEFFFFFDFFFFFEFEFDFFFFFF
          FDFFFDFDFEFFFCFCFCFFFDFCFDFFFDFEFCFFFAFAF9FFFEFEFDFFFBFCFBFFF9F8
          F7FFFAF8F7FFF8F6F5FFF8F6F5FFF9F8F6FFF6F5F1FFF6F5F1FFF5F3EFFFF3F0
          ECFFF3F0ECFFECE9E4FFECE9E1FFEFEAE5FFEDEBE2FFEBE9DEFFE7E5DAFFE5E3
          D8FFE8E2D6FFE5DECFFFE0D5C8FFDCD2C1FFD9D1BEFFD2C8B3FFC8BDA7FFC3B7
          9AFFC4B89AFFC8BCA1FF9E9581FFDCD9D0FFFFFFFFFFFFFEFFFFFFFEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFCFE
          FFFFFCFFFFFFFDFEFEFFE7E5DAFFD0CAB6FFD5C9B8FFD5CBB8FFB1AA97FFCECA
          BCFFFFFFF8FFFEFEFFFFF8F8F8FFFBFBFBFFFDFDFEFFFFFFFFFFFFFFFDFFFEFF
          FDFFFCFCFDFFFCFCFCFFFDFCFDFFFDFEFCFFFAFBFAFFFBFBFBFFFBFCFAFFFBFA
          F9FFFAF8F7FFF9F7F6FFF9F7F3FFFAF9F4FFF7F6F2FFF6F7F0FFF5F4EFFFF6F3
          EEFFF5F2EFFFEFECE8FFEFEDE6FFEEEBE3FFEBE8E1FFE9E7DCFFE8E6DCFFE5E3
          D9FFE6E1D5FFE2DDCEFFE1D9C9FFDBD3C3FFD5CEBDFFCFC5B1FFC8BFA6FFC3B8
          9CFFC3B899FFC2B59BFF8F8775FFEEEDE6FFFFFFFFFFFFFDFFFFFFFDFFFFFFFD
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFDFF
          FFFFFBFEFFFFFEFFFFFFF2F0E6FFCEC8B5FFD2C8B5FFD6CDB9FFC3BBA8FFABA6
          95FFECE9E3FFFFFFFFFFFAFAFAFFF8F8F8FFFDFDFCFFFFFFFEFFFFFFFEFFFEFF
          FDFFFEFEFEFFFDFDFDFFFCFCFDFFFBFCFBFFFAFBFAFFFAFBFAFFFCFDFBFFFAF9
          F8FFF8F6F5FFFAF8F8FFFAF8F6FFF8F7F4FFF9F8F4FFF5F5F0FFF4F3EDFFF5F2
          EDFFF4F1EEFFF1EEEAFFF1EEE8FFEFEDE6FFEFECE4FFEAE8DDFFE7E6DCFFE6E3
          D9FFE4E1D4FFE1DDCEFFDED8C7FFDCD4C6FFD6CEBEFFCEC7B2FFC8BFA4FFC3B9
          9DFFC3B99BFFBBAF91FF7E7766FFFFFFFAFFFEFFFFFFFDFEFFFFFEFEFFFFFFFD
          FFFFFDFFFFFFFEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFF
          FFFFFCFFFFFFFEFFFFFFF9F7F1FFD2CDBCFFD0C8B3FFD2CAB5FFCFC6B1FFB9B1
          A0FFD9D6CDFFFFFFFFFFFAFAFCFFF7F7F7FFFDFFFCFFFEFFFDFFFEFEFEFFFFFF
          FFFFFDFDFDFFFEFEFEFFFEFEFEFFFBFBFBFFFBFBFBFFFBFAFBFFFAFCF9FFFAF9
          F8FFF9F7F6FFFAF8F7FFF9F7F6FFF7F5F5FFF8F7F3FFF7F6F2FFF7F5F1FFF6F2
          EFFFF1EEEAFFF2EFEBFFF0EDE8FFEBE8E1FFEEEBE3FFEAE9DEFFE7E6DDFFE6E3
          D9FFE4E1D4FFE1DDCEFFE0DBC9FFD9D2C3FFE5DDCCFFCEC5AFFFC5BBA0FFC0B9
          9CFFC7BC9EFFA69A7DFF989282FFFFFFFFFFFDFFFFFFFCFFFFFFFDFFFFFFFFFE
          FFFFFCFFFFFFFDFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
          FDFFFCFDFCFFFEFFFFFFFFFFFDFFDED7CCFFCFC8B1FFD5CAB5FFD3C9B7FFC0B6
          A3FFC8C2B6FFFAF7F3FFFDFEFFFFF7F7F8FFFAF9FAFFFDFFFCFFFDFDFCFFFFFF
          FFFFFEFEFEFFFEFCFEFFFEFDFEFFFAF9FBFFFBFBFCFFFAFAFAFFF6F8F5FFFAF9
          F6FFF8F6F5FFFAF8F6FFF8F6F5FFF8F7F5FFF9F8F3FFF4F3EFFFF5F3EFFFF6F3
          EFFFF3F0ECFFF2F0ECFFEFEEE9FFEFECE5FFECE9E1FFECEAE0FFE7E4DCFFE7E4
          DAFFE5E2D6FFE1DECFFFD9D5C7FFE3DCCEFFEFE7D6FFC8BEAAFFC3BA9EFFC1B9
          9BFFC1B89AFF91886DFFD7D2C7FFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFEFFFFFF
          FFFFFFFFFFFFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFD
          FDFFFFFFFEFFFEFFFFFFFFFFFFFFE0DBD2FFD0CAB4FFD2C8B5FFD7CDBBFFBAB2
          9EFFBDB6A8FFFBF7EFFFFFFFFFFFFBFAFAFFF7F6F6FFFBFBFAFFFFFEFEFFFFFF
          FEFFFFFFFFFFFFFEFFFFFCFBFDFFFBFAFDFFFCFBFDFFF9FAF8FFF8F7F6FFF8F7
          F5FFFAF8F7FFF8F6F6FFF7F5F4FFF7F5F3FFF8F6F4FFF6F5F1FFF6F4F0FFF3F0
          ECFFF6F3EFFFF2EFEBFFEDEDE7FFEEECE5FFEDEAE2FFEAE9DEFFE8E5DDFFE5E3
          DAFFE7E0D7FFDEDBCFFFD6D2C6FFEEE7DAFFE6DFCDFFC4BBA5FFC2B89EFFC0B7
          98FFB4AC8EFFA09782FFF9F4EEFFFFFFFFFFFFFFFDFFFFFFFEFFFFFFFDFFFFFF
          FFFFFFFFFFFFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEFEFFFFFE
          FDFFFFFFFEFFFEFFFFFFFFFFFFFFEEEAE4FFD2CBB8FFD1C9B7FFD6CDBCFFCEC8
          B4FFA69E8EFFEAE5DBFFFFFFFDFFFEFDFDFFF6F3F6FFF8F6F6FFFDFDFCFFFDFD
          FCFFFFFFFFFFFFFEFFFFFBF9FCFFFDFDFDFFF9F9FAFFFAFBF9FFFAF7F6FFF8F6
          F6FFFAF8F8FFF9F7F7FFF7F5F5FFF6F4F3FFF7F5F5FFF4F3F0FFF5F4F0FFF5F2
          EEFFF4F1EDFFF2F0EBFFEEEDE7FFEFECE6FFECE9E0FFE9E7DDFFE9E5DEFFE5E1
          D7FFE6DFD4FFDEDACFFFD9D5CAFFF2EEE2FFD6D0BDFFC8BDA5FFC1B59CFFC4BB
          99FF9D947AFFB4AC9EFFFFFFFFFFFFFEFDFFFFFFFEFFFFFFFDFFFFFFFEFFFFFF
          FFFFFFFFFFFFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFFFE
          FEFFFFFDFCFFFDFFFFFFFDFEFFFFFFFFFAFFDDDACDFFD1CABAFFD0C8B7FFD8CF
          BDFFB9B19FFFC5C0B1FFF9F9EEFFFFFFFEFFFCF7F9FFF5F4F3FFF7F5F4FFFFFC
          FCFFFFFFFFFFFDFDFDFFFFFFFFFFFEFBFCFFFDFBFAFFFAF8F7FFFBF9F8FFF9F7
          F6FFFAF8F7FFF6F4F3FFF7F5F4FFF7F4F3FFF5F5F0FFF5F4EFFFF5F4F0FFF7F3
          EFFFF2EFEBFFF2F0EAFFEFEDE9FFF1EEE5FFEEEAE1FFECEAE0FFE8E7DCFFE6E3
          D8FFE5DFD3FFDBD7CCFFE3DED5FFF2EDE2FFCDC5B1FFC6BC9FFFBFB397FFBFB3
          96FF7C7662FFE0DED7FFFFFFFFFFFEFEFFFFFFFFFEFFFFFEFFFFFDFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFFFEFD
          FDFFFFFFFEFFFEFEFFFFFEFFFFFFFFFFFDFFF0EFE5FFD0CBBDFFD0C8B6FFD7CB
          B9FFD1C8B7FFA5A08EFFDEDDCEFFFFFCF9FFFDFAFCFFF7F5F5FFF3F2EEFFF7F7
          F3FFFCFDFBFFFCFCFCFFFCFBFCFFFEFBFCFFFCFBF9FFFBF9F8FFFAF8F7FFF7F5
          F4FFF7F5F4FFF7F5F4FFF6F4F3FFF4F2F1FFF6F5F0FFF6F5F1FFF6F5F0FFF2EF
          EBFFF6F2EEFFF0EDE8FFEFECE7FFEFECE4FFEEE9E1FFEBE9DFFFE8E5DBFFE6E1
          D5FFE3DDD0FFD9D5CBFFEFEAE2FFE7E1D7FFC7C0A9FFC1B799FFC3B79AFF9C90
          76FFB3AE9FFFFFFFFFFFFDFDFEFFFEFEFEFFFFFEFFFFFFFDFFFFFDFFFFFFFFFF
          FFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
          7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF}
      end
      item
        Image.Data = {
          76800000424D7680000000000000360000002800000098000000360000000100
          2000000000004080000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000101010101010101010101010101
          01010101010102020202030303034B4B4B573030303903030304020202021919
          1A1E36363741535353634C4C4C580E0E0E100101010202020202050505061919
          191D1818181A0606060600000000010101010202020202020303020202030000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000010101010303
          0303020202020202020202020203020202020000000000000000000000000000
          0000000000000000000000000000000000000000000000000000020202020101
          0102000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000001010101060606070A09090C1616161B353535403E3E3E4A3A3A3A453C3C
          3D493838394449494A576464657DBDBBBDFAB9B8B8F4919091BB7C7B7C9B9E9D
          9ECCBFBEBFFEC2C1C2FFB8B7B8F48C8C8DB5434343525757576B919091BCB5B3
          B4E9AEAEAFDE6263637C1F1F1F25393939454C4B4C5B6565667D6565677E1C1C
          1C2107070708060606080808080A05050506060606060C0C0C0E0D0D0D100505
          05060000000000000000000000000000000000000000000000001B1B1B1F6F6F
          6F8954535465474748556464647B4F4F4F601313131704040404050505060202
          0202000000000000000000000000010101010505050610101013535353673F3F
          3F4C0A0A0A0B0707070806060607000000000303030301010101050505060C0C
          0C0F10101014101010140E0E0E11141414170D0D0D1005050506151516191F1F
          2025070707080606060802020202000000000000000000000000000000000101
          0101000000000605050605050506030303030202020200000000000000000000
          0000000000000000000002020202010101010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000E0E0E105C5C5D74848384A89F9FA0CEC2C1C3FFC4C3C3FFC2C1C2FFC2C1
          C3FFC1C0C2FFD8D8D9FFD5D5D7FFC2C1C2FFC2C1C2FFCECECFFFD9D8D9FFD7D6
          D7FFD3D2D3FFC5C4C5FFC1C0C2FFCAC9CAFFC3C2C4FECBCACBFFCFCFD1FFC6C5
          C6FFC3C2C3FFC2C1C2FFBDBDBEF6C4C3C4FFC9C9C9FFCAC9CAFFCCCBCCFFA0A1
          A1CE6362637D6061617A6E6D6E8B5959596F5A595A70868686AA908F90B45352
          5366212021271515151A0C0C0C0E0D0D0D101818181F1919191C6C6B6C85D3D2
          D3FFCAC9CAFFCAC9CAFFCBCBCBFFC3C3C3FF7B7A7A9B494A4A5B5959596F3434
          343E14141418141414180909090B202020265C5C5D70949494BBBBBABBF5AFAE
          AEE354545468636363795959596F1A1A1A21434343512F2F2F3B545454699292
          92B99C9B9CC69C9B9CC6959595BDA6A6A6D3908F91B659595970979697C0B1AF
          B0E26E6F6F8A6262627A2D2D2D360909090A08080809141414172727272F2828
          2830222121295A59596D535253664040404E3232323C1E1E1E230C0C0C0E0404
          040500000000030302033232323C2B2B2B342626262E1D1D1D241B1B1B221010
          10140909090B0202020200000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000606
          06063434343CD1D1D2FFDCDCDEFFD6D6D7FFCFCFD0FFD0CFD1FFD0CFD0FFD1D1
          D3FFD8D8D9FFECECEDFFEBECECFFE1E1E1FFDBD9DAFFE2E2E2FFEEEEEEFFEEEE
          EEFFEDEDEDFFE4E4E4FFD3D3D4FFD5D5D6FFE2E2E3FFEBEBECFFEAEAEBFFDCDC
          DDFFCAC9C9FFD0CFD0FFD7D6D7FFDADADBFFDCDDDDFFCDCCCDFFC1C0C1FFC8C7
          C8FFCECDCEFFCCCCCDFFCCCBCBFFCECDCEFFD0CFD0FFCCCBCCFFC9C9C9FFC2C1
          C1FFA3A1A2D0989798C17070718F75757596A7A7A8D3ABABACBACACACBEBD3D3
          D4FFD5D5D6FFD9DADAFFC9C9C9FFC2C2C2FFC7C7C7FFC5C4C5FFCBCACBFFB9B9
          B9F3929292B9929293B76262627A9B9B9BC1DFDEDFFFE4E3E4FFCAC9CAFFC8C7
          C7FFC2C1C2FAC3C2C3FFC5C3C5FFAAA8AAD9C3C2C2FFBDBDBDF0CBCACAFFD5D4
          D4FFCFCECFFFD0CFCFFFD2D1D2FFCAC9CAFFCECCCEFFD9D9DAFFCDCCCCFFC8C6
          C7FFCFCECFFFCAC8C9FF9E9D9ECC6F6F6F8C5E5F5F77808080A3B1B0B1E4B2B2
          B2E3A8A7A8D4CBCACAFFC8C7C8FFC2C1C2FDB8B8B8F19A999AC3757576924C4C
          4C5F383738444C4C4C5EAAAAABDDB7B5B6EDB1B0B1E5ACAAACDCA9A8A8D98585
          85A66565657F3A3A3A4812121216030303030000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000010101010404040400000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000006868
          69709D9D9DAAE5E5E5FEECECEEFFEBEBECFFECECECFFECECECFFECECECFFECEC
          EDFFEDEDEEFFEBEBEBFFEBEBEAFFEDEDEDFFEDEDEDFFECECECFFEAEAEAFFEAEA
          EBFFEBEBECFFEEEEEFFFEDEDEEFFECECEDFFEEEEEFFFECECEDFFEDEDEEFFEDED
          EEFFECEBECFFECEDEDFFEEEEEFFFEEEEEFFFEFEFF0FFEAE9EAFFDCDCDCFFD8D9
          DAFFDDDCDEFFD9D9DAFFD6D5D6FFE1E1E2FFE5E6E6FFD9D8D9FFC9C9C9FFC8C7
          C8FFCAC9C9FFCAC9CAFFD3D2D3FFD0CFD0FFD8D8D9FFFAFAFBFFF3F3F3FFEDED
          EEFFEEEEEFFFEFEFF0FFE7E6E7FFD8D8D8FFD8D8D8FFD5D5D5FFC8C7C8FFCACA
          CAFFCCCBCCFFCECDCEFFDBDBDCFFE9E8E9FFEEEEEDFFEFF0F0FFE1E0E1FFD7D6
          D7FFE2E1E2FFCECDCEFFD1D0D1FFD9D8D9FFD5D3D4FFE9E7E8FFE8E8E8FFE8E8
          E8FFE6E5E6FFE7E7E7FFE8E8E8FFDEDDDDFFDFDFDFFFEEEEEEFFE4E4E4FFDCDC
          DDFFD9D8D8FFC3C3C3FFC9C8C9FFD0CFD0FFD3D2D3FFD6D5D6FFD0CFCFFFDDDC
          DCFFE0E0E0FFDBDADBFFD2D2D2FFD3D2D3FFC7C6C7FFCBCACAFFC9C8C8FFC2C1
          C2FFC1C0C2F1CFCED0F8D1D1D1FFD2D1D2FFD0CFD0FFCFCDCFFFC9C8C9FFCCCB
          CBFFCAC9CAFFB6B5B5EC828283A44C4C4C5E2A2A2A33101010111717171B2423
          242C2323232C3939384539393945000000000000000000000000000000000000
          00002D2E2E375857586D1919191D000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000ECEC
          ECFFF5F5F5FFECECECFFEBEBEAFFEBEBEBFFEBEBEBFFEBEBEBFFEBEBEBFFEAEA
          EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EBFFEBEBECFFEBEBECFFECECEDFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFECECEDFFECECEDFFEBEBECFFEBEBECFFEBEBECFFECECEDFFEEEEEFFFEEEE
          EFFFEEEEEFFFEEEEEEFFEEEEEFFFEEEEEFFFEDEEEEFFEEEDEEFFE7E7E7FFE3E3
          E3FFDEDEDEFFDCDBDCFFE5E4E5FFE3E3E4FFE6E6E7FFEBEBECFFEBEBECFFECEC
          EDFFEBEBECFFEBECEDFFEEEEEFFFF0EFEFFFF0F0F0FFEFEFEFFFE6E5E6FFE4E4
          E4FFDDDDDDFFE0DFDFFFF1F1F1FFF0EFF0FFEEEEEEFFEDEEEEFFEEEEEFFFEEEE
          EEFFF0F0F0FFEAEAEAFFECEBECFFEEEEEEFFEDEDEDFFF0F0F0FFEFEFEFFFEFEF
          EFFFF0EFEFFFEFEFEFFFEFEFEFFFF0F0F0FFF0F0F0FFEEEEEEFFF0EFEFFFF0F1
          F1FFEEEEEDFFE0E0E0FFDDDCDDFFDEDDDDFFEAE9E9FFEEEEEEFFE9E9E9FFEEEE
          EEFFF1F0F0FFF1F0F0FFEEEEEEFFEDECECFFE1E1E2FFDBDBDBFFD4D3D3FFD3D3
          D4FFE5E4E4FFF2F1F1FFEDECECFFEBEBEBFFEAE9E9FFE7E6E7FFE0DFDFFFD9D8
          D9FFCBCACCFFC7C6C7FFC4C3C4FFB8B8B8F0A2A1A1CF7878789A858485AD9B9A
          9AC79B9A9BC7B2B1B1E3AFAEAEDC39393A450000000000000000000000002324
          232A8E8D8EB4CAC9CAFF77777794080808080000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000EBEB
          EBFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EBFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFECECECFFECEC
          EDFFECECEDFFECECECFFECECEDFFECECEDFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBECFFEBEBECFFECECEDFFEDEDEDFFEDEDEDFFEDEDEDFFEEEEEEFFEEED
          EEFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEEEEEEFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEEEEEEFFEEEEEEFFEEEDEEFFF0EFEFFFF0EFEFFFF0EFEFFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEFEFFFF0EFEFFFEFEEEEFFEDECECFFECEB
          EBFFEEEDEDFFF0EFEEFFF0EFEFFFEFEFEFFFF0EFEFFFF0EFEFFFF0EFEFFFEEED
          EEFFE8E7E8FFDEDDDDFFD0CFCFFFCAC9CAFFC5C4C5FFC7C6C6FAC9C8C8FECFCE
          CEFFD6D6D6FFCFCECEFFBEBDBEFC9E9D9ECA616061782828283143444352A3A2
          A3B5D0CFD0F0C8C7C8FFB9B8B8EF605F60793D3C3C4B121213131F1F1F232B2C
          2C33302F30384241415129292930010101010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000EAEA
          EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EBFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBECFFEBEBECFFECECEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEEEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEFEEFFEFEF
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEE
          EEFFF0EFEFFFEFEEEEFFEBEBEBFFE7E6E6FFE2E1E2FFE7E6E6FFE7E6E7FFE9E8
          E8FFEDECECFFE7E6E6FFC7C6C7FFBFBEBEFEB7B6B6EF9E9D9ECBBCBCBDD9ECEB
          ECFCF2F2F2FFD7D6D7FFC1C0C0FFB5B3B3ECABAAAADA838282AA919192BF9D9D
          9ECD9F9E9FCFADACADDF9C9B9CC65E5D5E753635363F222222242D2D2D341919
          191C000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000EAEA
          EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EBFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBECEDFFECECEEFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBECFFEBEBECFFECECEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEEEDEDFFEFEEEEFFEFEEEEFFEFEEEEFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFEFEFFFEFEFEFFFEFEEEEFFEFEEEEFFF0EFEFFFF0EF
          EFFFEFEEEEFFF0EFEFFFE7E7E7FFDADADAFFCBCACBFFDEDEDEFFEFEFEFFFF0F0
          F0FFF1F1F1FFEDEDEDFFD9D9D8FFD1D0D0FFC5C3C3FFCBCACAFACBC9CBFED0D0
          D0FFD3D3D4FFCBCACBFFC0BFBFFDB4B3B3ECA9A8A9DC9D9C9DCEABAAABDE5454
          5466000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000EAEA
          EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EBFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFECED
          EFFFEDEFF5FFECECF1FFEDEEF3FFEBEBEBFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBECFFEBEBECFFECECEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEEFFEDEEEEFFEFEEEFFFEFEEEEFFEFEEEEFFEFEEEEFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEFEFFFF1F3F5FFEFEF
          EFFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEEEDEDFFEBEAEBFFEEEEEFFFF1F1F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0EFEFFFEEEEEEFFE5E5E5FFEFEFEFFFEEEDEDFFEEEE
          EEFFF0F0F0FFEBEAEAFFD9D8D8FFCCCBCAFFC8C7C7FFCFCECFFECBCACAFF9897
          98B8000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000EAEA
          EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEAEBEBFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EBFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFECECEEFFECED
          F3FFC9A26EFFBD8D45FFE2D6C9FFEDEFF3FFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBECFFEBEBECFFECECEDFFEDEDEDFFEDEDECFFEEF0F3FFF0F2F8FFF0F3
          F7FFEDEEEEFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFF0F3F6FFEFF0F4FFEEEEF1FFF0EFF4FFF2F3F9FFF1F3F6FFEFEFEFFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFF0EFF0FFEFEFF0FFE5D7CEFFEFEE
          EFFFEFF0F0FFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEFEFFFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF1F1F1FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFEEEEEEFFEEEEEEFFF0F0F0FFD0CFD0FF9696
          97B4000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000EBEB
          EBFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEBEBEBFFEBED
          EFFFE9E7E8FFEBECEDFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EBFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBEBFFEFF3FBFFD2B5
          92FFAE6E06FFAC6B01FFC29653FFF0F4FDFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFECECEEFFECEEF0FFECEEF1FFECEDEFFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBECFFEBEBECFFECECEDFFEDEDEDFFEFF1F4FFE3D8CAFFCDA97AFFD4B9
          95FFEDECEEFFEDEDEEFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEEEDEEFFEEEF
          F1FFEEF0F0FFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEEEEFFEDED
          EFFFD8C0A3FFC08F4DFFBA8235FFBF8C46FFCDAA79FFE0CEBBFFEEECEEFFF0F1
          F4FFEFEEEFFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEFF0FFEFEEF1FFC4985AFFAF6F0BFFCBA4
          6DFFF2F4FBFFEFEFEFFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEFEFFFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF1F1F1FFF1F1F1FFD1D0D0FF8F8F
          90A9000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000B9BA
          BAC8EFEFEFFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEBECEDFFE9E8E9FFCCAA
          7CFFB4791FFFCFB088FFECEDEFFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEAEAEBFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFECEEF0FFEBE9EFFFBD8C
          3DFFAE6F02FFAE6E00FFBB8931FFEDEEF5FFECECEEFFEBEBECFFEBEBECFFECED
          EFFFE8E2DFFFE0D2C5FFDECEBEFFE1D5CCFFEAEAEAFFECECEFFFEBEBECFFEBEB
          ECFFEBEBECFFEBEBECFFECECECFFEEEFF0FFEDECEEFFBF8F45FFAB6900FFAA66
          00FFD2B58FFFF1F4F9FFEDEDEDFFEDEDEDFFEDEDEDFFEEEFEFFFEBE9E7FFE2D5
          C9FFE3D9CEFFEDECECFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEFFFC9A2
          6BFFAB6700FFAC6B00FFAE6E00FFAD6C00FFAB6900FFAE6F05FFBF8C44FFDBC5
          AAFFEDEBEAFFF0EFEFFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFF3F6FCFFD3B58FFFAD6A00FFAD6E01FFBB84
          2EFFEBE6E6FFF1F2F4FFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEFEFFFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF5F5F4FFDCDBDBFF6767
          677D000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000ADAE
          AEBAF0F0F0FFEAEAEAFFEAEAEAFFEAEAEAFFEAEBEBFFECF0F5FFD3B795FFB072
          10FFAA6600FFBA8334FFE8E4E5FFEAEBECFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEEF1F4FFE5DDDAFFB77F
          27FFAE6F01FFAE6D01FFC09244FFF0F5FEFFEBEBECFFEBEBECFFECEFF2FFE0D2
          C3FFC0904AFFB0700BFFAE6C03FFB17311FFC0914BFFDDCDBBFFEBEBEDFFEBED
          EEFFEBEBECFFEBEBECFFECECECFFF1F5FAFFDFCDBCFFB57B1CFFAF7000FFAD6B
          00FFBE8F40FFEFF0F7FFEDEEEFFFEDEDEDFFEEEFEFFFEDECEDFFD1B289FFB173
          15FFB07114FFDDCCB7FFEEEDEEFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFF0F4F9FFD5BA98FFAA67
          00FFAF7000FFAF7000FFAF6F00FFAF6F00FFAF7000FFAE6F00FFAC6900FFAD6B
          00FFC19250FFE1D1C0FFEFEDEDFFEFEFF0FFEFEFEFFFEFEFEFFFEFEFEFFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFF0F0FFF1F1F6FFBC8833FFAE6E00FFAE6F01FFBC86
          33FFECE6E5FFF1F2F4FFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFF0EF
          EEFFF1EFEEFFF1EFEEFFEFEEEEFFF0EEEEFFF1EFEEFFF1EFEEFFF1F0EFFFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF5F5F5FFDEDDDDFF605F
          6174000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000AFB0
          B0BBF0F0F0FFEAEAEAFFEAEAEAFFEAEAEAFFEBEBEDFFEAEBEDFFC49A5AFFB071
          05FFAB6A00FFC1934EFFEAE8EAFFEAEBEBFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEBEAEBFFEBEBECFFEBECEDFFECEDEFFFEBECEDFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBEBFFEEF1F7FFE2D8CDFFB479
          1AFFAF6F00FFAE6E01FFC79E6BFFEFF4FCFFEBEBECFFECEEF1FFE6E0DCFFC397
          54FFAD6C00FFAE6E00FFAF6F00FFAE6D00FFAB6800FFB0720FFFCFB087FFE8E5
          E5FFECEEF1FFEBEBECFFECECECFFF1F5FDFFD5BA92FFB17513FFAF7000FFAC6B
          00FFC69D5CFFF1F5FDFFEDEDEDFFEDEDEDFFEFF1F4FFDFCDB9FFB9812DFFAD6D
          00FFAA6600FFC3975BFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEFEFFFEEEEF3FFBC8A3AFFAD6C
          00FFAF7000FFB17309FFB67D20FFB37715FFAE6F04FFAE6E00FFAF7000FFAE6F
          00FFAA6700FFB27313FFD0B083FFE8DFD6FFE3D7C6FFDCC7ADFFE6DCD0FFF0F0
          F1FFEFEEEEFFEFEEEEFFF1F2F5FFEAE2E0FFB88024FFAE6E00FFAE6F02FFBF8F
          40FFEFEDF1FFF0F1F1FFEFEEEEFFEFEEEEFFEFEEEEFFF1EFEEFFF3EFEEFFE8EB
          EFFFD3E1EFFFBBD5F0FFACD0F1FFAED1F1FFC1D9F0FFD6E3EFFFE9ECEFFFF3F1
          F0FFF2F1F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF3F3F3FFDADADBFF5C5B
          5C6F000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000B0B0
          B0BAF0F0F0FFEAEAEAFFEAEAEAFFEAEAEAFFECEDF0FFE6DFDBFFBE8E3DFFAF70
          00FFAA6700FFCBA871FFEDEFF5FFEAEAE9FFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEAEBEBFFECEDEFFFEBEBEDFFE7E2DFFFEBEAEBFFECEDEFFFEBEBECFFEBEB
          ECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBEBFFEEF2F9FFDCCAB0FFB174
          12FFAF7000FFAD6D02FFCEAC83FFEFF3FBFFEBEBECFFECEDF0FFD3B894FFB377
          17FFAE6F00FFAF7000FFAE6E00FFAF7000FFAF7100FFAE6D00FFAE6C00FFC8A2
          6DFFE9E5E5FFECEEF1FFECEDEEFFEFF1F6FFCBA66FFFB0720BFFAF7000FFAD6B
          00FFD3B593FFF1F6FCFFEDECECFFEDEEEFFFEDECEDFFCDAA77FFB07209FFAF70
          00FFAC6A00FFBA862FFFEDECECFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEFF2F4FFE6E0DBFFB37718FFAE6F
          00FFAF7104FFC1924CFFE1D3C8FFD7BF9FFFC79E60FFBA8430FFB07109FFAE6E
          00FFAF7000FFAD6D00FFAC6900FFB98333FFB57A1EFFAD6C01FFC39754FFECE7
          E4FFF0EFF0FFEFEEEDFFF2F5F9FFE5D7CDFFB47817FFAE6F00FFAE6E03FFC59C
          56FFF4F7FFFFEFEEEEFFEFEEEEFFEFEEEEFFF2EFEEFFF0EFEEFFC1D9F0FF78B6
          F2FF3595F3FF1887F4FF1585F4FF1685F4FF1D89F4FF3D99F4FF7CB8F3FFBED8
          F1FFEBEEF0FFF2F1F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF3F3F3FFD9D9DAFF5657
          5768000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000B0B0
          B0BAF0F0F0FFEAEAEAFFEAEAEAFFEAEAEAFFEDF0F3FFDFD1C5FFBA8531FFAF70
          00FFAB6700FFD0B38BFFEDF0F5FFEAEAE9FFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFECEEF1FFE8E5E1FFD4BB97FFC3995AFFCFB084FFE9E6E5FFECEDEEFFEBEB
          ECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEEF3FAFFD2B490FFB073
          0DFFAF7000FFAD6D02FFD6BB9CFFEEF2FAFFECEDEFFFE7E2DEFFC39655FFAF6F
          01FFAF7000FFAF6F01FFB17512FFAE6D00FFAE6D00FFAF7000FFAE6E00FFAF6F
          06FFCAA674FFEAE7E9FFEEEFF3FFEDEDEFFFC39753FFAF7004FFAF6F00FFAE6F
          00FFE0CEBEFFEFF2F5FFEDEDEDFFEEF0F1FFE8E1DCFFC1944EFFAE6F00FFAF70
          00FFAC6A00FFB88224FFEBE8E5FFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFF0F2F5FFE5DDD2FFB0710AFFAF70
          00FFAF7009FFCEAB82FFF4FDFFFFF1F6FCFFF0F0F4FFE4D7C9FFCDA976FFB67D
          22FFAF6F01FFAF7000FFAF6F00FFAC6B00FFAD6C00FFAC6B00FFB8812BFFE5D8
          CAFFF0F0F1FFEFEEEDFFF4F6FDFFDFCDB6FFB0720DFFAF7000FFAE6E04FFCCA8
          75FFF5FBFFFFEFEDEDFFEFEEEEFFF3F0EEFFEEEEEEFFA0C9F1FF3596F3FF0C81
          F4FF0E82F4FF1183F4FF1082F4FF1182F4FF1183F4FF0D81F4FF0B80F4FF2E92
          F4FF91C3F2FFE6ECF0FFF1F1F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF3F3F3FFD8D8D8FF5353
          5363000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000B0B0
          B0BAF0F0F0FFEAEAEAFFEAEAEAFFEAEAEAFFEDF0F6FFDBCAB7FFB78029FFAF6F
          00FFAC6900FFD4BA9CFFECEFF1FFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEBEC
          EDFFEBECF0FFD1B58BFFB57C1EFFAE6E00FFB0720DFFD0B086FFEDEFF3FFEBEB
          ECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEFF3FBFFCBA779FFB072
          0AFFAF7000FFAE6E04FFDECDB7FFEEF1F7FFECEEF1FFE1D5C6FFB9832EFFAE6E
          00FFAD6C00FFB77F25FFD1B58CFFC8A268FFB27616FFAD6C00FFAF7000FFAE6F
          00FFB37818FFD3B792FFECEBEDFFEAE7E4FFBE8E3FFFAF7001FFAE6F00FFB275
          11FFE9E3DEFFEEEFF0FFEDEDEDFFEFF0F3FFE3D8C9FFB98430FFAE6E00FFAF70
          00FFAD6B00FFB57B1BFFE6DED7FFEDEEEFFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEFF2F4FFE6DFD8FFB27514FFAE70
          00FFAE7004FFC49855FFEFF1F7FFEEF0F1FFEFEFEFFFF1F1F3FFECE8E6FFDBC5
          ABFFB9822BFFAF6F01FFAF7000FFAF7000FFAF7000FFAD6B00FFBF8E46FFEAE3
          DEFFF0EFF0FFEFEEEEFFF3F6FDFFD8BE99FFAF6F0AFFAF7000FFAF6F05FFD2B3
          8FFFF4F8FFFFEFEEEDFFF1EFEEFFF3F0EEFFA5CCF0FF3595F3FF1585F4FF1786
          F4FF0E82F4FF0F83F4FF1887F4FF1686F4FF0E81F4FF0E81F4FF1485F4FF1283
          F4FF268EF4FF92C3F2FFEDEFF0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF3F2F2FFD5D5D6FF4445
          4553000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000B0B0
          B0BAF0F0F0FFEAEAEAFFEAEAEAFFEAEAE9FFEEF2F9FFD8C5A4FFB57B1EFFAE6E
          00FFAD6C00FFD8C3ABFFECEEF0FFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEDEF
          F4FFDCCAB4FFB9832DFFAF6F01FFAF7000FFAE6E00FFB4791AFFE3D9D2FFEDF0
          F4FFEBEBEBFFEBEBECFFEBEBECFFEBEBECFFEBECEDFFEEF1F9FFC49A58FFAF70
          05FFAF6F00FFB0720EFFE3D8CFFFEDF1F5FFECEDF0FFDBC7ADFFB37716FFAE6E
          00FFAC6900FFC59B61FFE9E6E5FFE8E5E2FFD5BC9EFFB3791CFFAC6B00FFAF71
          00FFAE6E00FFB7802AFFDCCBB4FFE3D7CCFFBA8530FFAF7000FFAD6D00FFB983
          35FFEDEBEBFFEDEEEEFFEDEDEDFFEEEFF2FFDBC7ABFFB37815FFAE6F00FFAF70
          00FFAD6D00FFB1730DFFE1D3C6FFEEF0F1FFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEEF0F0FFECE9ECFFBA8530FFAD6D
          00FFAF6F00FFB57B1CFFDAC5ABFFF2F7FFFFEFEFF0FFEFEDECFFF2F5F9FFEBE5
          E6FFBB8736FFAF6F02FFAF7000FFAF7000FFAE6E00FFB77F2AFFDCC7AFFFF0F0
          F2FFEFEEEFFFEFEEEFFFF3F5FBFFCFAB7CFFAF7008FFAF7000FFB07107FFDAC2
          A9FFF3F6FCFFEFEEEDFFF6F2EEFFC4DAF0FF469DF3FF1686F4FF1786F4FF0D81
          F4FF3A98F3FF7DB8F1FF90C2F1FF8BBFF1FF70B1F2FF3C98F3FF1083F4FF1083
          F4FF1083F4FF278EF4FFB3D3F1FFF1F1F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F1F1FFF4F3F3FFD0D0D1FF3132
          323C000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000B0B0
          B0BAF0F0F0FFEAEAEAFFEAEAEAFFEAEAEAFFEEF1F8FFD5BF97FFB37918FFAE6E
          00FFAE6F00FFDDCDBCFFEBEDEEFFEAEAEAFFEAEAEAFFEAEAEAFFECEEF2FFE3DA
          D2FFC19451FFB07106FFAF7000FFAF7000FFAF7000FFAD6D00FFC8A26BFFEFF1
          F9FFEBEBEDFFEBEBECFFEBEBECFFEBEBECFFECEEF1FFE9E5E7FFBE8D3DFFAF70
          02FFAE6E00FFB57A1EFFE5DEDBFFEDEFF2FFECECEEFFD6BF9FFFB1720CFFAE6E
          00FFAC6A00FFCFB086FFEAE9E8FFECEDEEFFEBEBEDFFD8C1A5FFB17212FFAD6C
          00FFAF7000FFAD6D00FFC39652FFD3B594FFB77F28FFAF7000FFAB6900FFC598
          59FFEEEEF2FFEDEDEDFFEDEEEEFFEDECEEFFD2B58DFFAE6E01FFAF7000FFAF70
          00FFAF7000FFAD6A00FFDCC9B4FFEFF1F3FFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFF1F4F9FFCCA878FFAB68
          00FFAF7100FFAF7003FFBA8633FFDDCBB4FFF3F5FEFFF4F8FFFFF1F1F8FFCCA9
          73FFB1740EFFAF7000FFAF7000FFAF6F01FFB98328FFE0CFBCFFEFEEEFFFF0EF
          F0FFEFEEEEFFEFEFEFFFF1F3F9FFC79C64FFAF7006FFAF7000FFB07207FFE4D7
          C8FFF2F3F7FFF1EFEEFFEBEDEFFF7EB9F2FF1C89F4FF1786F4FF0B80F4FF50A2
          F3FFC5DBEFFFE8EAEEFFEAECEEFFE9ECEEFFE2E8EFFFC9DCEFFF88BEF2FF3294
          F4FF0F82F4FF077EF4FF56A5F3FFE9EDF0FFF1F1F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF1F1F1FFF3F3F2FFCDCDCDFF2A2A
          2A33000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000B1B1
          B1BCF0F0F0FFEAEAEAFFEAEAEAFFEAEBEBFFECEEF3FFD1B68AFFB27713FFAD6E
          00FFAF6F02FFDED0C1FFEBECEDFFEAEAEAFFEAEAEAFFEBECEEFFE8E5E4FFC8A2
          6AFFB1730CFFAF6F00FFAD6C00FFAD6C00FFAF7000FFAF6F00FFB37714FFE0D2
          C6FFEEF2F7FFEBEBEBFFEBEBECFFEBEBECFFEDF0F5FFE2D8D2FFBA842EFFAF6F
          01FFAE6D00FFBA842FFFE9E5E7FFEDEEF1FFEBECEEFFD6BD9DFFB0720BFFAE6E
          00FFAD6B00FFD2B48EFFEAE9E9FFEBEBECFFEBECEDFFEAEAEBFFD1B48EFFAD6B
          00FFAE6F00FFAE6E00FFB27611FFBB8437FFB37613FFAF7000FFAA6600FFD0B2
          82FFF0F2F8FFEDEDECFFEEEEEFFFEBE8E6FFC9A56CFFAB6800FFAF7000FFAF70
          00FFAF7000FFAA6600FFD3B993FFEFF0F4FFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEEF0F1FFE7DED9FFB57B
          21FFAC6B00FFAF7000FFAF7003FFB67E25FFCFAD7EFFE1D0BFFFCDA974FFB478
          15FFAF7001FFAF7000FFAF7000FFAF6F02FFC39749FFF4F7FFFFEFEEEFFFEFEE
          EEFFEFEEEEFFF0EFF0FFF1F3F8FFC08F47FFAF7003FFAF7000FFB2750FFFEAE5
          DEFFF1F1F5FFF5F1EEFFCCDEEFFF4BA0F3FF1585F4FF1083F4FF278FF4FFC1D9
          EFFFF0EFEEFFF0EEEEFFF0EEEEFFF0EEEEFFF0EFEEFFF0EFEEFFECEEEFFFBBD7
          F2FF4DA2F4FF037CF5FF489FF4FFE8EDF0FFF1F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF1F1F1FFF2F2F2FFCECDCEFF2929
          2932000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000ACAC
          ACB5F0F0F0FFEAEAEAFFEAEAEAFFEBEBEBFFECEDF2FFD1B488FFB27613FFAD6D
          00FFB17408FFE4DED5FFEAEAEBFFEAEAEAFFEAEBEBFFEBECEEFFD2B791FFAF71
          07FFAF7001FFAB6800FFC08F49FFC19452FFAE7005FFAF7000FFAF6E03FFC499
          59FFEFF1F9FFEBEBECFFEBEBECFFEBEBEBFFEFF3F9FFDDCCBBFFB67C20FFAF70
          00FFAD6B00FFC09142FFEDEFF6FFEBEDEEFFECECEEFFD5BD9CFFB0710AFFAE6E
          00FFAD6A00FFD1B38AFFEAE9E9FFEBEBECFFEBEBECFFEBECEDFFE8E5E4FFC79E
          65FFAB6700FFAF7000FFAF7001FFAF7004FFAF7002FFAF7000FFAC6900FFD8C0
          A4FFF0F3F6FFEDEDEDFFEEEEEFFFE7E0D8FFC0914AFFAC6A00FFAF7000FFAF70
          00FFAF7000FFAB6A00FFC39659FFEFF0F4FFEDEDECFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEEF0F2FFDAC4
          ABFFAF6D03FFAC6C00FFAF7100FFAF7001FFB0720AFFB27513FFB07209FFAF70
          01FFAF7000FFAF7000FFAF7000FFAF6E02FFC3984BFFF5F9FFFFEFEEEEFFEFEE
          EEFFEFEEEEFFF0F0F2FFEEEDEEFFBB882EFFAF6F01FFAE6F00FFB77F28FFECE9
          E9FFF1F1F3FFF3F0EEFFA4CCF1FF2B91F4FF1585F4FF067EF4FF6FB1F1FFF6F2
          EEFFFBF3EEFFF5F1EEFFF0EFEEFFF0EEEEFFEEEEEEFFEFEEEEFFF0EFEFFFF2F1
          F0FFD9E6F1FFB0D1F2FFCADEF1FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF1F1F1FFF0F0F0FFC2C2C1F32121
          2127000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008484
          848BF3F3F3FFEAEAEAFFEAEAEAFFEBEBECFFEAEAEEFFCCA978FFB1740DFFAD6D
          00FFB1750AFFE7E3DDFFEAEAEAFFEAEAEAFFECECEEFFDAC7B0FFB17414FFAD6D
          00FFAD6B00FFB67D22FFDFD4C3FFE4DBD4FFB57C20FFAE6F00FFAF7000FFB376
          14FFDCC9B6FFEFF4FAFFEBEBEBFFEBEBECFFEFF3FDFFD6C09BFFB27716FFAF70
          00FFAC6A00FFC79E61FFF0F5FEFFEBEBEBFFEBECEFFFDAC4A9FFB27513FFAE6E
          00FFAC6A00FFCAA573FFE9E7E6FFEBEBEDFFEBEBECFFEBEBECFFEBEDEEFFE2D8
          CCFFB8802BFFAC6A00FFAF7000FFAF7000FFAF7000FFAE6F00FFAF6F04FFDFCD
          BCFFEEF1F3FFEDEDEDFFEEEFF0FFE3D9CCFFB8802EFFAC6C00FFAF7000FFAF70
          00FFAF7000FFAD6E00FFB37817FFE9E2DEFFEEEEF0FFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEEEE
          EFFFD9C3A7FFB27617FFAB6800FFAE6F00FFAF7000FFAF7000FFAF7000FFAE6F
          00FFAD6C00FFAF7000FFAF7000FFAF6E02FFC3984BFFF4F9FFFFEFEEEEFFEFEE
          EEFFEFEEEEFFF1F3F6FFE7DED9FFB88225FFAF7000FFAE6E00FFBC883AFFEFED
          F0FFF2F1F1FFEBEDEEFF82BBF1FF1C89F4FF1686F4FF0E82F4FF5EAAF2FFA5CD
          F1FFAFD1F1FFCEE0F0FFECEDEEFFF3F0EEFFF9F3EEFFF4F0EEFFEFEFEFFFF0F0
          F0FFF1F0F0FFF4F2F0FFF2F1F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF4F3F3FFE7E7E7FF878787A90505
          0506000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008383
          838BF4F4F4FFEAEAEAFFEAEAEAFFEBECEDFFEAE9ECFFCBA774FFB1730CFFAD6D
          00FFB1750AFFE7E3DCFFEAEAEAFFEBEBECFFDFD3C4FFB67D24FFAC6B00FFAE6D
          00FFB17310FFD5BB9AFFEAEAEBFFEFF4FCFFCFAD83FFAE6D03FFAF7000FFAF6F
          04FFC39654FFEDEDF4FFEBECEFFFEBECEDFFEEF0F7FFCFAF81FFB1740FFFAF70
          00FFAC6A00FFCCAA82FFF0F4FBFFEBEBEBFFECEDF1FFDDCBB4FFB47A1AFFAE6E
          00FFAC6900FFC59B63FFE8E6E4FFEBEBEDFFEBEBECFFEBEBECFFEBECEDFFEBEB
          EDFFD2B792FFAE6C00FFAF6F00FFAF7000FFAF7000FFAE6D00FFB2750DFFE4DA
          D1FFEEEFF0FFEDEDEDFFEEEEF0FFDFD2BBFFB2750CFFAE6D00FFB07103FFAF71
          05FFAF7001FFAF6F00FFAC6900FFD5B996FFF0F4F9FFEDEDECFFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEFF0F2FFE3D8CDFFC4995BFFB17411FFAE6D00FFAE6E02FFAD6C00FFB276
          13FFC29459FFB27512FFAF7000FFAF6E02FFC3984BFFF4F9FFFFEFEEEEFFEFEE
          EEFFEFEEEEFFF2F5FAFFE1D0C2FFB67C1BFFAF7000FFAD6D00FFC2934DFFF1F0
          F7FFF2F0F0FFE8EBEEFF72B3F1FF1685F4FF1786F4FF1786F4FF1685F4FF1585
          F4FF1686F4FF1A88F4FF2C91F4FF5AA9F4FF95C4F1FFCFE0EFFFF3F1EFFFF4F2
          F0FFF1F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF4F4F4FFE5E4E4FF7C7C7C9B0303
          0304000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008383
          838BF4F4F4FFEAEAEAFFEAEAEAFFEBECEDFFEAE9ECFFCBA774FFB1730CFFAD6D
          00FFB1750AFFE7E3DCFFEAECEDFFE4DDD6FFBA8436FFAB6900FFAF6F00FFB071
          09FFCDAB7BFFE9E7E6FFEBECEDFFECEEF1FFE9E6E7FFB9822BFFAE6E00FFAF6F
          00FFB27715FFD8C2A8FFEEF2F9FFECECEEFFECEDF2FFC79F66FFB07109FFAF70
          00FFAD6C00FFD4B99DFFEEF2F7FFEBEBEBFFEDEEF2FFE1D7C7FFB8812AFFAE6E
          00FFAC6800FFBD8D42FFE8E4E0FFEBECEDFFEBEBECFFEBEBECFFEBEBECFFECED
          F0FFE4DCD3FFBC8B40FFAE6F01FFAF7000FFAF7000FFAD6B00FFB67D1DFFECEA
          E9FFEDEDEDFFEDEDEDFFEDEDEEFFD7C0A0FFAF6F02FFAE6D00FFB2740DFFB881
          34FFB2740EFFAF7000FFAE6E00FFB78028FFE9E6E4FFEFEFF1FFEDEDEDFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDED
          EDFFEDEDEDFFEFF1F2FFEFF2F6FFE6DED6FFDAC3A7FFD3B38EFFD7BB9BFFE9E1
          DBFFE7DDD8FFB37717FFAF6F00FFAF6E02FFC3984BFFF4F9FFFFEFEEEEFFEFEE
          EEFFEFEEEDFFF3F7FCFFDCC8B4FFB47918FFAF7000FFAD6A00FFC8A05EFFF2F5
          FDFFF2F0EEFFE6EAEEFF67ACF2FF1183F4FF1786F4FF1786F4FF1686F4FF1585
          F4FF1585F4FF1584F4FF1384F4FF0D80F4FF097FF4FF208BF4FF5FAAF3FFB1D2
          F2FFE8ECF1FFF1F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF4F4F4FFE3E3E3FF676767800303
          0303000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008383
          838BF4F4F4FFEAEAEAFFEAEAEAFFEBECEDFFEAE9ECFFCBA774FFB1730CFFAD6D
          00FFB1750AFFE8E4DFFFE7E3E1FFC09351FFAA6600FFAF7000FFB07006FFC7A0
          68FFE6E1DDFFECEDF0FFEBEBECFFEBEAEBFFEFF3F9FFD6BFA5FFAD6C01FFAF70
          00FFAE6F02FFC0934CFFE9E6E7FFEEF0F5FFEAE9EBFFC09448FFAF7102FFAF70
          00FFAE6D00FFDECBBAFFEDF0F4FFEBEBECFFECEEF1FFE4DCD4FFBD8B42FFAE6F
          00FFAC6B00FFB77F23FFE3D9CFFFEBECEDFFEBEBECFFEBEBECFFEBEBECFFEBEC
          EDFFEBECEFFFD2B58DFFB27511FFAE6F00FFAF7000FFAC6B00FFBC873DFFECEC
          EDFFEDEDEDFFEDEEEEFFEDECEBFFD1B188FFAC6A00FFAD6D00FFB27610FFCEA9
          7FFFB9832BFFAF7001FFAF7000FFAD6A00FFCEAC7FFFF0F4F8FFEDEEEEFFEDED
          EDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEEEEEFFFEDEE
          EFFFEDEDEDFFEDEDEDFFEDEEEEFFF0F2F4FFF2F5FBFFF3F7FDFFF3F6FBFFF5F9
          FFFFE3D6C6FFB0720CFFAF7000FFAF6E02FFC3984AFFF4F9FFFFEFEEEEFFEFEE
          EEFFEFEEEDFFF4F8FFFFD8C1A2FFB27614FFAF7000FFAC6900FFCFAF79FFF4FA
          FFFFF1EEEDFFE8EBEEFF70B1F2FF1585F4FF1686F4FF1686F4FF218BF4FF238C
          F4FF1A88F4FF1887F4FF1686F4FF1585F4FF1585F4FF1284F4FF087FF4FF1384
          F4FF65AEF3FFD2E3F1FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF5F4F4FFE2E1E1FF6565667D0303
          0303000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008383
          838BF4F4F4FFEAEAEAFFEAEAEAFFEBECEDFFEAE9ECFFCBA774FFB1730CFFAD6C
          00FFB2760CFFE6DFD8FFC79F69FFAB6800FFAE7000FFAE6E02FFC0934DFFE5DE
          D8FFECEEF1FFEBEBECFFEBEBECFFEBEBECFFECECEEFFEBE9EDFFBE8C42FFAC6B
          00FFAE6F00FFB37818FFD7C1A5FFF0F5FEFFE4DCD5FFBC8A36FFAF7000FFAF70
          00FFAF7002FFE6DFD6FFECEDF1FFEBEBECFFECEDEFFFE8E3E1FFC59C5CFFAF71
          01FFAE6D00FFB0700CFFDDCEBBFFECEBEDFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEDEFF3FFDED0BDFFBA8634FFAE6E00FFAF7000FFAB6A00FFC19050FFEDEC
          EDFFEDEDEDFFEDEEEEFFECEBEAFFCBA671FFAB6700FFAE6D00FFB47916FFE0D3
          BEFFCBA774FFB07109FFAF7000FFAE6F00FFB37713FFDDCAB5FFF0F3F8FFEDEE
          EEFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEDEDEDFFEEEFF0FFECEBE9FFECEB
          E9FFEEEFF1FFEDEDEDFFEDEDEDFFEDEDEDFFEEEEEEFFEFEEEDFFEFEDEDFFF2F5
          FCFFE1D3BBFFAE6E08FFAF7000FFAF6E03FFC49950FFF4F9FFFFEFEEEEFFEFEE
          EEFFEFEEEDFFF4F9FFFFD3B887FFB0730EFFAF7000FFAD6C00FFD4B798FFF4F8
          FDFFF0EEEDFFEEEEEEFF8BBFF1FF208BF4FF1685F4FF0F82F4FF60ABF2FFAED0
          F0FF98C5F1FF76B5F2FF56A5F3FF3896F3FF208BF4FF1686F4FF1786F4FF1283
          F4FF007BF4FF73B5F2FFE8ECF0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF4F4F3FFE0DFDFFF636262780202
          0203000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008383
          838BF4F4F4FFEAEAEAFFEAEAEAFFEBECEDFFEAE9ECFFCBA774FFB1730CFFAE6D
          00FFB3770FFFC7A065FFAD6B00FFAF7000FFAE6E00FFBB893CFFE1D6CAFFEDF1
          F7FFEAEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBEBFFEDF0F5FFDBC8B3FFAE6D
          03FFAE6E00FFAE6E00FFC1934EFFEAE8E8FFDECEBEFFB8812AFFAF7000FFAD6E
          00FFB47921FFE8E5E4FFECECEEFFEBEBECFFEBECEDFFEBEBEDFFCEAE7CFFB173
          09FFAF6F00FFAB6800FFD7C1A0FFEBEBEDFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFECEEF0FFE7E2E0FFC69D5FFFAF7003FFAF7000FFAB6800FFC79C63FFEDEE
          EEFFEDEDEDFFEDEEEEFFEBE7E3FFC49955FFAA6600FFAD6C00FFB8812EFFE4DB
          CFFFE5DCD5FFB8812CFFAE6E00FFAF7000FFAE6D00FFB8822FFFE0D1C2FFF0F2
          F6FFEEEFF0FFEDEDEDFFEDEDEDFFEDEDEDFFEEF0F3FFE4D8CDFFCCAA73FFCEAC
          77FFE5DDD5FFF0F2F6FFEDEEEEFFEDEDEDFFEFEEEEFFEFEEEEFFEFEEEDFFF2F6
          FCFFE1D3BCFFAE6F09FFAF7000FFAF6F05FFC8A16BFFF4F8FFFFEFEEEEFFEFEE
          EEFFEFEEEFFFF3F5FDFFCFAE7BFFB0720CFFAF6F00FFAF6F00FFDAC1A8FFF3F6
          FBFFEFEEEDFFF5F1EEFFBAD5F0FF3897F3FF1485F4FF0F82F4FF3997F3FFC2D9
          F0FFFFF7EEFFFFF6EDFFF5F0EEFFD6E3EFFF9FC8F1FF59A7F2FF1987F4FF1886
          F4FF077EF4FF50A3F3FFE0E9F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF4F4F3FFDFDEDDFF616060740202
          0203000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008484
          848CF3F3F3FFEAEAEAFFEAEAEAFFEBECEDFFEAE9ECFFCBA774FFB1730CFFAF70
          00FFB07102FFAE6E00FFAE6F00FFAE6D00FFB7802BFFDDCDBCFFEEF2F8FFEAEA
          EAFFEBEAEBFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBECEDFFEAEAECFFC296
          54FFAB6800FFAE6F00FFB1740FFFD8C4A5FFD7C1A2FFB47B1DFFAF6F00FFAD6B
          00FFBC883FFFE9E8EAFFEBECEDFFEBEBECFFEBEBECFFECEEF3FFD6BE9FFFB47A
          1EFFAF6F00FFAB6700FFCAA470FFEBEAEBFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBEDFFECEDF2FFD0B283FFB1740BFFAF7000FFAA6600FFCBA875FFEEEE
          F0FFEDEDEDFFEDEEEEFFE7DED7FFBC893BFFAC6A00FFAD6B00FFBE8C42FFE4DA
          CEFFF1F5FCFFD5BB9AFFB0710AFFAE6E00FFAF7000FFAD6D00FFB98434FFDCC8
          B1FFEEEEF2FFEFF1F3FFEDEEEEFFEDEEEEFFEFF0F6FFC49957FFAB6700FFAC69
          00FFC0914CFFE2D7CBFFF0F2F8FFEEF0F0FFEEEEEDFFEFEEEEFFEFEEEDFFF2F5
          FCFFDCC8ABFFAF6F08FFAF7000FFAE7006FFCBA677FFF4F8FFFFEFEEEEFFEFEE
          EEFFF0EFF0FFF1F0F7FFCAA36AFFAF7109FFAF6F00FFB07105FFDFCCBBFFF2F4
          F8FFEFEEEDFFF3F0EEFFE4E9EFFF6EB1F2FF1685F4FF1686F4FF0D81F4FF2C91
          F3FF90C2F1FFD5E2EFFFE5EAEFFFEBEDEEFFE5EAEFFF8ABFF1FF1C89F4FF1685
          F4FF067EF4FF73B4F2FFE9EDF0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF4F3F3FFDDDCDBFF656464780303
          0303000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008A8A
          8A92F3F3F3FFEAEAEAFFEAEAEAFFEBECEDFFEAE9ECFFCBA774FFB1730CFFAF70
          00FFAF7000FFAF7000FFAD6C00FFB47A1FFFD7C2A6FFECEDEFFFEAEBECFFEAEA
          EAFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFECEDEFFFDBCA
          B5FFB27413FFAD6C00FFAE6E00FFC4995AFFC9A26AFFB37614FFAF7000FFAB68
          00FFC59B5BFFECECF1FFEBEBEDFFEBEBECFFEBEBECFFEDEEF3FFDECFBDFFBA86
          35FFAE6E00FFAA6500FFC69C65FFEBEAEAFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBECFFEDF0F5FFD4BB98FFB27413FFAC6A00FFAA6500FFD5BC9AFFEEEE
          F0FFEDEDEDFFEDEEEEFFE4D9CEFFB67D27FFAD6C00FFAC6A00FFC39752FFE7DF
          D7FFEFF0F2FFECEAEAFFC9A36BFFAC6B00FFAE6E00FFAF7000FFAF6F04FFB983
          2EFFD2B389FFE6DDD6FFEFF1F5FFEFF0F2FFF0F1F8FFC09044FFAC6B00FFAF70
          00FFAF7005FFBE8E44FFDBC7ABFFEFF0F6FFF1F3F6FFEFEEEEFFEFEEEDFFF3F5
          FCFFD6BB98FFAF6E07FFAF7000FFAF7007FFCFAD83FFF3F7FEFFEFEEEEFFEFEE
          EEFFF0F0F1FFF0EEF2FFC79C5FFFAF7107FFAF6F00FFB1740AFFE4D6CDFFF1F2
          F5FFEFEEEEFFEFEEEEFFF4F0EEFFBCD6F0FF409BF3FF1183F4FF1686F4FF1384
          F4FF258DF4FF4FA1F3FF65ADF3FF67ADF2FF58A6F2FF2E92F3FF1686F4FF0C80
          F4FF268EF4FFB4D3F1FFEFF0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F1F1FFF3F3F2FFDBDADAFF5E5D5E6F0202
          0203000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000007676
          767CF4F4F4FFEAEAEAFFEAEAEAFFEBECEDFFEAE9ECFFCBA774FFB1730CFFAF70
          00FFAF7000FFAD6C00FFB17310FFD5BD9DFFEBECEFFFEAEBEBFFEAEAEAFFEAEA
          EAFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBEDFFE9E7
          E6FFCAA674FFAB6800FFAE6F00FFB37814FFB67C1FFFB07207FFAF7000FFAA66
          00FFCEAE7FFFEEF1F6FFEBEBECFFEBEBECFFEBEBECFFEDEEF1FFE7E1DDFFC194
          50FFA96400FFAE6D05FFD7BFA2FFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEB
          ECFFEBEBECFFECEEF1FFE3D8CCFFC39759FFB27516FFC59B5DFFE7E1D9FFEDEE
          EEFFEDEDEDFFEDEEEFFFE1D4C3FFB1720FFFAE6E00FFAC6A00FFC9A467FFEAE6
          E1FFEDEDEEFFEEEFF1FFE9E4E0FFC8A167FFAD6B00FFAD6B00FFAF7100FFAF6F
          00FFB37713FFC09149FFD7BE9FFFEBE9E9FFF2F7FEFFDCC8B0FFB37718FFAC6B
          00FFAF7000FFAE6F03FFB88027FFD0B084FFEAE5E2FFF2F5FAFFF0F1F2FFF3F7
          FEFFD1B088FFAE6F06FFAF7000FFAF7009FFD5B895FFF3F6FDFFEFEEEEFFEFEE
          EEFFF0F1F2FFEEECEEFFC39552FFAF7005FFAE6F00FFB3770DFFECE8E6FFF0EF
          F1FFEFEEEEFFEFEEEEFFF1EFEEFFEFEEEEFFB2D2F0FF429CF3FF0D81F4FF1083
          F4FF1585F4FF1485F4FF1886F4FF1887F4FF1686F4FF1284F4FF097FF4FF1B88
          F4FF8CC0F2FFE6EBF0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF1F1F1FFF3F3F3FFD9D8D8FF4F4F4F5F0202
          0202000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000004848
          484DF8F8F8FFEAEAEAFFEAEAEAFFEBECEDFFEAE9ECFFCBA775FFB1730CFFAF70
          00FFAE6E00FFB27510FFD5BD9DFFEAEAEAFFEBEBECFFEAEAEAFFEAEAEAFFEAEA
          EAFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEEECECFFF0EDECFFEFED
          EEFFE5D8CCFFBC8532FFAC6900FFAF7101FFAF7002FFAF7001FFAF6F00FFAC69
          00FFD6BD9FFFEEF1F5FFEBEBECFFEBEBECFFEAEBECFFEBEBEDFFEBEBEEFFD8C5
          AAFFC6A069FFD4BD9EFFE7E4E2FFE9EBECFFE9EBECFFE9EBECFFE9EBECFFE9EB
          ECFFE9EBECFFE9EBEDFFEAEBECFFE4DDD5FFDED2BFFFE6E1DAFFEBEDEDFFEBED
          EDFFEBEDEDFFEBEDEFFFDDCFB5FFA86300FFA96500FFA96700FFCDAC7CFFEBE9
          E7FFEDEDEEFFECEDEDFFEDEEF0FFE8E3E0FFD2B58FFFB17416FFAA6600FFAE6E
          00FFAF7000FFAF7004FFB37917FFC39752FFE1D5C6FFEDEEF0FFDAC5AAFFB478
          1CFFAB6900FFAF7101FFAE6F01FFB27510FFC09046FFD7BD9CFFEDEAEAFFF5FB
          FFFFC69C63FFAE6F04FFAF7000FFB0710BFFDCC7ACFFF3F5FCFFEFEEEDFFEFEE
          EEFFF0F1F3FFEDEAEBFFC0904AFFAF7004FFAE6D00FFB77D1FFFF0F0F1FFEFEE
          EFFFEFEEEEFFEFEEEEFFEFEEEEFFF1EFEEFFEFEEEEFFCBDEEFFF75B4F2FF288F
          F4FF0A80F4FF0A80F4FF0A80F4FF097FF4FF097FF4FF1284F4FF4EA2F3FFA3CB
          F2FFE2EAF0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF1F1F1FFF2F2F2FFD8D8D8FF464546540202
          0202000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003C3C
          3C40F6F6F6FFEAEAEAFFEAEAEAFFEBECEDFFEAE8EBFFCBA673FFB1730CFFAF6F
          00FFAD6B00FFD4B996FFEAEBEBFFEAEBEBFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFECEBECFFE8EAEDFFE4E9EDFFE9EB
          EDFFEBECECFFD7BC99FFB87106FFB56E00FFB67000FFB77000FFB66F00FFB66F
          00FFE6CEB8FFFBF5F1FFF9F1ECFFF8F2ECFFFCF3ECFFFFF4ECFFFFF4ECFFFEF3
          EAFFFEF1E6FFFFF3EBFFFFF5EDFFFFF5ECFFFFF5ECFFFFF5ECFFFFF5ECFFFFF5
          ECFFFFF5ECFFFFF5ECFFFFF7EDFFFFF8EEFFFFF8EEFFFFF7EEFFFFF6EEFFFFF6
          EEFFFFF6EEFFFFF7EEFFF8E5D0FFD39A4BFFCD9138FFDAAB6FFFF0DCC8FFF8F2
          EDFFF8F2EDFFF7F1EDFFF6F1EDFFF7F2EEFFF5EFEAFFE7D2BBFFC9964FFFB46F
          01FFB16A00FFB36E00FFB26F00FFB06900FFC5934BFFF0E9E4FFF3F0EFFFE5D1
          BDFFBD822AFFB06900FFB27000FFB27000FFB27003FFB57711FFC28E40FFC698
          57FFB67914FFB27000FFB27000FFB3730CFFE8DAC9FFF6F6FAFFF3EFEDFFF1EF
          EEFFF1F1F5FFEBE7E1FFBB8937FFAF7001FFAD6D00FFBA8437FFEFEFF2FFEEEE
          EFFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFF0EEEEFFF1EFEEFFE7EAEFFFCDDE
          EFFF9CC7F1FF75B6F2FF60AAF2FF62ABF2FF7DB9F2FFAED0F0FFDDE6EFFFEEEF
          F0FFF1F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF1F1F1FFF2F2F2FFCFCFD0FF373737420101
          0101000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003232
          3236EEEEEEFFECECECFFEAEAEAFFEBEBECFFEBEBEEFFCCA976FFB0730BFFAC6A
          00FFB27310FFE5DFD8FFEAEAECFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFF7F2ECFF7FBBEDFF419CECFF4DA3
          ECFF4FA5EEFF51A0E1FF657E6DFF796B11FF766E1AFF766E1AFF776D16FF7470
          24FF5EA3DAFF63ADEDFF63ADEBFF64ADEBFF68ADEBFF6BAFEBFF6AAFEBFF6BB0
          ECFF6EB1ECFF6EB1EBFF6FB2EBFF72B3EBFF72B3EBFF71B3EAFF75B3EAFF75B3
          E9FF75B3E9FF77B4E8FF79B5E7FF79B4E7FF7CB5E6FF7FB7E6FF80B7E6FF83B9
          E6FF88BBE6FF89BDE6FF8DBEE7FF92C0E7FF95C2E8FFA0CAEBFFC1D9EDFFCDE0
          EDFFCBDFEDFFCFE0EEFFD2E0EDFFD1E0EDFFD4E2EFFFD8E4EFFFD5DFE7FFC7BF
          B2FFB29260FFA67928FFA6720DFFA46B03FFAF863CFFDEDFDFFFE3E9EEFFE2E8
          EDFFD8D2CCFFB28A4AFFA66A00FFA66E00FFA56F05FFA56F04FFA66F05FFA66F
          04FFA66F04FFA66F04FFA66E03FFB07B22FFE6E1DFFFEFF1F4FFEDEDEDFFF3EF
          EEFFFFF8F5FFFBEEE0FFC48933FFB57000FFB46C00FFC88D42FFFFF8F4FFFBF3
          EFFFEEEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFF0EF
          EEFFEFEEEEFFEEEDEEFFEEEDEEFFEEEDEEFFEFEEEEFFEFEEEEFFF0EFEFFFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF2F2F1FFF0F0F0FFBBBBBCE81B1B1B210000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003232
          3236EEEEEEFFECECECFFEAEAEAFFEAEAEAFFECEFF4FFDBC9B1FFB78028FFB071
          10FFD1B48FFFEAE9EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFF7F1ECFF55A7EDFF1D8BECFF258F
          ECFF238FECFF2390F0FF2E8BD0FF517555FF5C6D25FF5B6D27FF5D6B1EFF5372
          4AFF248DE7FF228DECFF228DECFF228DECFF218DECFF218DECFF218DECFF208D
          ECFF208DECFF208DECFF208EECFF208CEBFF208EECFF208FECFF1F8DECFF1F8C
          ECFF1F8CECFF1F8CECFF1F8DECFF1E8CEBFF208DECFF208EECFF208EECFF218E
          ECFF218FECFF238FECFF238FECFF238FECFF248FECFF248FECFF258FECFF258F
          ECFF258FECFF2690ECFF2690ECFF2690ECFF2790ECFF2890ECFF2791EDFF2893
          EFFF2993F0FF2B8FE4FF2F8ACCFF3288C3FF2D8EDEFF2991EBFF2C92EBFF2C94
          EBFF2C93ECFF3091E4FF417F95FF5A6E36FF5F6A1CFF5E6C22FF5E6C25FF5F6C
          25FF606C26FF606C25FF626A1CFF528081FF41A0F6FF479FEAFF4BA1EBFF58A8
          ECFF6CB4F4FF79ADD1FF7E7A3CFF7E6E16FF7D6B0FFF818765FF90C5F4FFA7CE
          EEFFF4F0EEFFF1EFEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEFEFFFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF3F2F2FFEFEFEFFFB9B9BAE41919191E0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003232
          3236EEEEEEFFECECECFFEAEAEAFFEAEAEAFFEAEAEAFFEBEBEDFFE4DDD6FFE6E1
          DDFFEBECEEFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEBEBECFFEBEBECFFEBEBECFFEDECECFFF2EEECFF4AA2EDFF218DECFF2991
          ECFF2891ECFF2891ECFF2692F3FF3E83A2FF5A6F36FF5D6D25FF616B17FF4C7A
          70FF2991EBFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2792ECFF2182E4FF2481E4FF278CE9FF2992
          ECFF2992EDFF2992EDFF2991ECFF2991ECFF2991ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2791
          ECFF2791ECFF2791ECFF2791ECFF2791ECFF2791ECFF2790ECFF2790ECFF2790
          ECFF2790ECFF2691EDFF2591F0FF2591F1FF2690EEFF2690ECFF2590ECFF2590
          ECFF2590ECFF2590EEFF2591F3FF318CD1FF477C7EFF577243FF5C6D29FF5D6D
          25FF5D6D25FF5D6E26FF4A7A75FF2690EBFF218EEEFF228EECFF218EECFF1F8C
          ECFF1A8CF4FF2785CBFF507145FF586D28FF5B6B1DFF447773FF1488F1FF73B5
          EDFFFFF7EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEFEFFFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF3F2F2FFEEEEEEFFB8B8B9E21818181D0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003232
          3236EEEEEEFFECECECFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEBECEFFFEBEC
          EEFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEBEBECFFEBEBECFFEBEBECFFEAEBECFFF7F1ECFF99C7EDFF1F8DECFF2791
          ECFF2891ECFF2891ECFF2792F1FF2E8DDAFF4C7868FF5D6D25FF5D6E2BFF3887
          B8FF2892EEFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2890ECFF2792EDFF1C91EAFF197CE0FF1A72DAFF1E73
          DBFF227EE3FF268AE8FF278FEBFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2692F2FF2592F6FF2B8FE4FF3688BFFF3E82
          A3FF3D83A5FF338ACBFF2792F1FF2792EFFF2991ECFF2891ECFF2891ECFF2991
          ECFF2793F4FF338BCCFF557244FF5D6D26FF616B18FF467E88FF2592F4FFB7D7
          EEFFFFF6EEFFEDEDEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEFEFFFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF3F3F3FFEEEDEDFFB1B1B1D91616161A0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003232
          3236EEEEEEFFECECECFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFF7F0ECFF6BB1ECFF1D8B
          ECFF2791ECFF2891ECFF2891ECFF2692F3FF318CD2FF467D85FF3B85AEFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2992EDFF2596EFFF1F94ECFF1B88
          E6FF1979DDFF1A70DBFF1E79DFFF2487E6FF278FEBFF2891ECFF2891ECFF2891
          ECFF278FEBFF2890ECFF2892ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891EDFF2792F0FF2693F5FF2493
          F9FF2593F8FF2693F5FF2891EDFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2693F4FF338AC9FF557243FF5D6D26FF606B18FF417D8BFF379CF5FFE8EC
          EFFFF5F2EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEFEFFFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF3F3F3FFF0F0F0FF9E9D9DC00F1010130000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003232
          3236EEEEEEFFECECECFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEAEBECFFF1EDECFFE1E7EDFF4CA2
          EBFF1E8CECFF2991ECFF2891ECFF2891ECFF2692F2FF2593F8FF2593F6FF2891
          EDFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2890ECFF2991ECFF2794
          EEFF2397EEFF1F90EAFF1B83E3FF1B7CDFFF2186E5FF278FEBFF2891ECFF2891
          ECFF2080E2FF227EE2FF268BE8FF2891ECFF2892ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          EBFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2693F4FF338ACAFF557243FF5D6D26FF626B16FF387D95FF60B0F6FFFEF6
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEFEFFFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF3F3F3FFF0EFEFFF9B9A9ABE0E0E0E120000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003232
          3236EEEEEEFFECECECFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEAEBECFFF4EFECFFC2DA
          EDFF3196ECFF228FECFF2891ECFF2891ECFF2891ECFF2891EDFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2890
          ECFF2990ECFF2992EDFF2795EEFF2192ECFF1D8BE8FF2290EBFF2891ECFF2891
          ECFF1F89E5FF1A74DCFF1C72DBFF227CE1FF268AE8FF2892ECFF2892EDFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2792F1FF2C8FE1FF537450FF606B1BFF616B1BFF2C83B8FF9ACBF6FFFFF6
          EDFFEEEDEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEFEFFFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF3F3F3FFEEEEEEFF989797BA0D0D0D110000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003232
          3236EEEEEEFFECECECFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEAEBECFFF3EF
          ECFF67B0ECFF1889ECFF2991ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2890ECFF2991ECFF2593EDFF2394EDFF2791ECFF2891
          ECFF2892EDFF228FEAFF1D81E2FF1A75DCFF1C73DCFF217CE0FF2588E7FF2892
          ECFF2892ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891EDFF2791F0FF428092FF53744EFF467A76FF2F91E2FFD5E4F0FFF7F1
          EEFFEEEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEFEFFFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF3F3F3FFECECEDFF959494B60D0C0C100000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003232
          3236EEEEEEFFECECECFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEAEAFFEAEA
          EAFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFEBEBECFFF8F1ECFFDCE5
          EDFF48A0ECFF1E8CECFF2991ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2691EBFF228CE9FF1C83E3FF1A79DDFF1C75DCFF227C
          E1FF278BE9FF2893EDFF2892ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891EEFF2C8EDDFF328BCBFF258ADBFF4AA2EEFFF2F0EEFFF0EE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEFEFFFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF3F3F3FFEBEAEBFF939292B40C0C0C100000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003232
          3236EEEEEEFFEBEBEBFFEAEAEAFFE9E9E9FFE9E9E9FFE9E9E9FFEAE9E9FFEAEA
          EAFFEAEAEAFFEAEAEAFFE9E9E9FFE9E9E9FFEAE9E9FFE9E9E9FFEAEAEAFFEAEA
          EAFFEAEAEBFFEBEBEBFFEAEAEBFFEBEAEBFFEAEAECFFF5EFECFFCEDFECFF5FAB
          ECFF248FECFF2790ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2690EBFF238EE9FF1F87E5FF1B7F
          E1FF1C77DDFF237DE2FF278EEAFF2994EEFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891EEFF2691EFFF228EEDFF53A7EDFFF2F0EEFFF0EE
          EEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEE
          EEFFF0EFEFFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFEFEFEFFFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF4F4F4FFEAE9EAFF848383A20B0B0B0D0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003232
          3236EEEEEEFFECECEDFFEDEDEEFFF3F4F5FFF4F4F5FFF3F4F5FFF1F2F3FFECEC
          ECFFEBEBEBFFE9E9E9FFF4F4F5FFF3F4F4FFF4F4F5FFF6F6F6FFEAEAEAFFE9E9
          E9FFECECEDFFF3F3F4FFF5F5F6FFF3F4F5FFF6F1EBFFB0CFEBFF3C99ECFF2690
          ECFF288EECFF2891ECFF2890ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF298EECFF298EECFF2790EBFF258F
          EBFF208FE9FF1A8CE5FF1C7BDFFF2380E3FF2890ECFF2894EEFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF248FECFF3196EDFF98C6EEFFF1EFEEFFEFEE
          EEFFEFEEEEFFEEEDEDFFEFEEEEFFEFEEEEFFEFEEEEFFEFEEEEFFF2F1F1FFF5F4
          F4FFFCFBFBFFF4F3F2FFEEEDEDFFEFEEEEFFEFEEEEFFEFEEEEFFEFEFEFFFF0F0
          F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFEFEFEFFFF1F1F1FFF0F0F0FFF0F0
          F0FFF0F0F0FFF0F0F0FFEFEFEFFFF4F5F5FFF3F2F2FF7D7D7D9A0A0A0A0C0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000003434
          3538FCFCFDFFF9FAFDFFEEEEF1FFCECFD1DCCBCCCED9CFD0D2DDD8D9DBE7F2F3
          F5FFF7F8FBFFFBFAFBFFCDCECEDBD3D3D5E0C1C2C3CDB0B1B1BBF7F7F8FFFAFB
          FCFFF3F4F5FFD8D8DAE6CECFD1DBD3D4D7E1FFFFF8FF89C6F7FF158EEDFF2990
          EBFF20A2EFFF18AEF1FF2499EDFF2A8EEBFF2891ECFF2891ECFF2891ECFF2891
          ECFF2890ECFF2891ECFF2890ECFF298FECFF2A8FECFF298FECFF288FEBFF288F
          EBFF288FECFF2890ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2890ECFF298EECFF2891ECFF239CEDFF239BEEFF2791ECFF2890
          ECFF2890ECFF2793EDFF2097EEFF1A8CE6FF1D7CDFFF2685E6FF2993EDFF2892
          EDFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2890ECFF2890ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF218EECFF399AEDFFE3EAEFFFF2EFEEFFF2F1
          F1FFF8F7F7FFFDFCFCFFF9F8F8FFF1F0F0FFF2F1F1FFF8F7F7FFF3F2F2FFD6D6
          D5E261626265CAC9C9D7FAF9F9FFEEEDEDFFF1EFEFFFF4F3F3FFF0F0F0FFF0F0
          F0FFF2F2F2FFF4F4F4FFF4F4F4FFF6F6F6FFFDFDFDFFFCFCFCFFFAFAFAFFF3F3
          F3FFF2F2F2FFF2F2F2FFF3F3F3FFF1F1F1FDC7C7C7E152515262060606070000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000002020
          2021989899A141414245353535371616161715151516171717181C1D1C1D4C4C
          4D504848494C8586878E222222221919191A151515151C1C1C1E7B7C7D838182
          8388606061642C2C2C2E1616161715151616767371768EB0C3CA21B9F7FF12B1
          F8FF13B7F3FF12B9F3FF17B0F2FF229BEDFF2791ECFF2891ECFF2891ECFF2890
          ECFF2892ECFF298EECFF2794EDFF2499EDFF1EA3F0FF229DEEFF2498EDFF2597
          EDFF2498EDFF2596EDFF2891ECFF298EECFF2890ECFF298FECFF2890ECFF2890
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2990ECFF298EECFF298E
          ECFF298FECFF2792ECFF219CEEFF1AADF1FF13B8F3FF13B8F3FF17B1F2FF18B0
          F2FF19ADF1FF1EA4F0FF229BEEFF249AEFFF1F99EDFF1A87E4FF207ADFFF278C
          E9FF2795EDFF298FECFF298EECFF2890ECFF298FECFF298EECFF298EECFF298F
          ECFF2891ECFF288FECFF2890ECFF2791ECFF2792ECFF2891ECFF2891ECFF2891
          ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891ECFF2891
          ECFF2990ECFF298FECFF2990ECFF248DECFF2E93EDFFE5F2F8FFFFFCFAFFECEC
          ECFCC0BFBFCB8B8B8B92B4B4B4BFECEBEBF5F3F2F2FEA5A5A5AF404040442727
          27290202020262626266F5F4F4FFF8F7F7FFEDECECFBE0DFDFEEF5F4F4FFF8F8
          F8FFF5F4F4FFE8E8E8F6EAEAEAF6DADADAE58F8F8F964747474BA8A8A7B1EEEE
          EEFAF0F0F0FEF0F0F0FFF9F9F9FFEFEFEFFA5151515507070708000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000060401062F4D595B2BA1
          CCD218B5EDF812B9F5FF12BAF3FF15B5F2FF229BEEFF298FECFF2A8DECFF1FA1
          EEFF16B3F3FF1BAAF0FF14B5F2FF13B8F3FF12BAF4FF13B9F3FF14B8F3FF13B8
          F2FF13B8F3FF13B7F2FF17B1F1FF1FA4EFFF18AFF1FF1DA6F0FF2795EDFF2793
          ECFF2890ECFF298FECFF2990ECFF298FECFF298FECFF249BEDFF1EA6F0FF1AAB
          F1FF1AADF1FF15B3F3FF12B9F3FF12B9F4FF13B8F3FF13B8F3FF13B9F3FF13B9
          F3FF13B9F3FF12BAF4FF13B8F3FF15B5F3FF19AEF2FF1EA7F1FF169FEDFF1883
          E1FF1E8BE5FF1F9FEEFF20A1EFFF2497EDFF239DEFFF219EEFFF1FA3EFFF1EA4
          EFFF17B1F2FF1AACF0FF18B0F1FF17B2F2FF1CA6F0FF2693EDFF2890ECFF2891
          ECFF2891ECFF2890ECFF2890ECFF2891ECFF2990ECFF2990ECFF2990ECFF298F
          ECFF2892ECFF1FA3EFFF219FEEFF2293EFFF309AECFD6B777E845E5D5C603737
          373A0404040400000000090909094D4D4D514747484B0A0A0A0B000000000000
          000000000000020202023939393CA3A3A3AC8787878F161616165B5B5B5F6666
          666B454445482A2A2A2B2B2B2B2C1E1E1E1F0000000000000000040404042929
          292A3A3A3A3C3C3C3C3F4848484C6F6F6F742525252701010101000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000001923
          28292FB4E6EF0EBBF9FF13B8F3FF12B9F3FF17B1F2FF1EA3EFFF1EA4EFFF14B7
          F3FF12B9F3FF12BAF3FF13B9F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B9F3FF12B9F3FF11BBF3FF12B9F3FF12BAF3FF13B6F2FF16B4
          F2FF1AABF1FF1FA2EFFF219EEEFF1FA2EFFF1AADF1FF13B7F3FF12BBF3FF13BA
          F3FF13BAF3FF12B9F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B9F3FF12B9F3FF13B9F3FF13BCF5FF13B4
          F3FF178AE3FF1886E0FF14A7ECFF14B7F2FF12BAF3FF12BAF4FF11BAF3FF11BB
          F3FF12B9F3FF12BAF3FF12B9F3FF12BAF3FF15B6F2FF1FA3EFFF2892EBFF2790
          ECFF2792ECFF2595EDFF1BACF0FF19ADF1FF229BEEFF229DEDFF229DEEFF239B
          EEFF1DA6F0FF12B9F4FF14B7F2FF13B6F8FF25B2E7F2161A1D1D000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000080B0C0E3278
          929614C3FFFF12B7F2FF13B8F3FF13B8F3FF13BAF3FF12BBF3FF11BBF3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF12B9
          F3FF12BAF3FF12BBF3FF12BBF3FF12BBF3FF12BAF3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B9
          F3FF13B9F4FF15A0ECFF1980DFFF178FE4FF14AEEFFF13B8F4FF13B9F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13BAF3FF14B8F3FF1EA6F0FF1AAC
          F1FF17B2F2FF15B6F2FF11BBF3FF12BAF3FF13BAF3FF12BAF3FF12BAF3FF12BA
          F3FF13B9F3FF13B8F3FF12B9F3FF11C1FEFF2D9FCAD10F111111000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000090C0D0D2A5C70721FBE
          F9FF10B9F5FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B9F3FF13BCF4FF14B3F2FF178DE5FF197FDEFF169EE9FF14B6F2FF13BA
          F4FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13BAF3FF12BA
          F3FF12BAF3FF13B9F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF12B8F4FF14BBF7FF25AFE2EB2845515500000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000010121417296C858A26BEF7FF0FBB
          F7FF13B8F2FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13BBF4FF13BCF4FF16A1EBFF1982DFFF1891E4FF15AD
          EFFF13BAF4FF13B9F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF12B8F4FF15BCF9FF2898C1C824404B4D0100000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000D0B0A0D2D79969B18BFFCFF0FBAF7FF13B8
          F2FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B9F3FF13BDF4FF13B3F2FF1792E6FF188B
          E3FF15A7EDFF13BAF4FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF11BCF9FF29B0E2EA203A4447000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000002A4D5B5E1CB2EAF012B9F5FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B9F4FF13B6F2FF15A4
          EDFF179BE9FF15ACEFFF13B9F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF12C0FFFF2A8CB1B60E1B2022000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000277D9EA614B9F4FA13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF15B1F1FF15ACEFFF14B6F2FF13B9F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8F3FF13B8
          F3FF13C2FFFF207A9A9F09141718000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object TimerFirewall: TTimer
    Interval = 5000
    OnTimer = TimerFirewallTimer
    Left = 336
    Top = 160
  end
  object TimerRevisarCadProduto: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerRevisarCadProdutoTimer
    Left = 432
    Top = 128
  end
  object cxEditStyleControllerTahoma10: TcxEditStyleController
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = False
    Style.TransparentBorder = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.BorderColor = 16962
    StyleFocused.BorderStyle = ebsThick
    StyleFocused.Color = 7471103
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleFocused.TextStyle = [fsBold]
    StyleHot.LookAndFeel.NativeStyle = False
    Left = 272
    Top = 184
    PixelsPerInch = 96
  end
end
