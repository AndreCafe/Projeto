object FrmShellFilter: TFrmShellFilter
  Left = 0
  Top = 0
  Caption = 'FrmShellFilter'
  ClientHeight = 576
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panPri: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 796
    Height = 576
    Align = alClient
    Bevel.Mode = bmCustom
    TabOrder = 0
    object Paginas: TcxPageControl
      AlignWithMargins = True
      Left = 0
      Top = 5
      Width = 796
      Height = 571
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      Properties.ActivePage = cxTabSheet1
      Properties.CustomButtons.Buttons = <>
      Properties.ShowFrame = True
      Properties.Style = 9
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = True
      ClientRectBottom = 570
      ClientRectLeft = 1
      ClientRectRight = 795
      ClientRectTop = 20
      object cxTabSheet1: TcxTabSheet
        Caption = '&'#193'rea de Trabalho'
        ImageIndex = 0
        object spDesktop: TLMDSplitterPanel
          AlignWithMargins = True
          Left = 3
          Top = 28
          Width = 788
          Height = 519
          Bevel.Mode = bmCustom
          Bars = <
            item
              OldPosition = -1
              Position = 392
            end>
          Align = alClient
          TabOrder = 0
          object spCommon: TLMDSplitterPane
            AlignWithMargins = True
            Color = clWhite
            ParentColor = False
            object jtvDesktopCommon: TJamShellTree
              Left = 0
              Top = 118
              Width = 388
              Height = 397
              ShellLink = slDesktopCommon
              RootedAt = SF_COMMON_DESKTOPDIRECTORY
              SpecialFolder = SF_COMMON_DESKTOPDIRECTORY
              ShellContextMenu = False
              ShowNethood = False
              ShowRecycleBin = False
              ShowFiles = True
              NoFillOnStartup = True
              FileSystemOnly = True
              Filter = '*'
              Checkboxes = True
              ShowOverlayIcons = False
              BorderStyle = bsNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ShowRoot = True
              ReadOnly = True
              DragMode = dmManual
              Align = alClient
              Color = clWhite
              TabOrder = 0
              ToolTips = False
            end
            object lbWin6: TcxLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Margins.Bottom = 20
              Align = alTop
              Caption = 
                'Nessa vers'#227'o de Windows s'#243' '#233' poss'#237'vel fitrar os '#237'cones que est'#227'o' +
                ' na janela da direita. '#13#10#13#10'Os '#237'cones dessa janela (listados abai' +
                'xo) n'#227'o podem ser filtrados pelo NexCaf'#233' mas, se for necess'#225'rio,' +
                ' voc'#234' pode remov'#234'-los da '#225'rea de trabalho do Windows pela forma ' +
                'tradicional (deletando o '#237'cone).'
              ParentColor = False
              ParentFont = False
              Style.Color = clWhite
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clRed
              Style.Font.Height = -11
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.TextStyle = [fsBold]
              Style.IsFontAssigned = True
              Properties.WordWrap = True
              Visible = False
              Width = 382
            end
          end
          object LMDSplitterPane2: TLMDSplitterPane
            object jtvDesktop: TJamShellTree
              Left = 0
              Top = 0
              Width = 389
              Height = 515
              ShellLink = slDesktop
              RootedAt = SF_DESKTOPDIRECTORY
              SpecialFolder = SF_DESKTOPDIRECTORY
              ShellContextMenu = False
              ShowNethood = False
              ShowRecycleBin = False
              ShowFiles = True
              NoFillOnStartup = True
              FileSystemOnly = True
              Filter = '*'
              Checkboxes = True
              ShowOverlayIcons = False
              BorderStyle = bsNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ShowRoot = True
              ReadOnly = True
              DragMode = dmManual
              Align = alClient
              Color = clWhite
              TabOrder = 0
              ToolTips = False
            end
          end
        end
        object cxLabel2: TcxLabel
          Left = 0
          Top = 0
          Align = alTop
          AutoSize = False
          Caption = 
            'Marque os itens que devem ficar dispon'#237'veis para o cliente da lo' +
            'ja'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Transparent = True
          Height = 25
          Width = 794
          AnchorX = 397
          AnchorY = 13
        end
      end
      object tsMenuIniciar: TcxTabSheet
        Caption = 'Menu Iniciar'
        ImageIndex = 1
        object LMDSplitterPanel2: TLMDSplitterPanel
          AlignWithMargins = True
          Left = 3
          Top = 28
          Width = 788
          Height = 519
          Bevel.Mode = bmCustom
          Bars = <
            item
              OldPosition = -1
              Position = 392
            end>
          Align = alClient
          TabOrder = 0
          object LMDSplitterPane3: TLMDSplitterPane
            object jtvStartMenuCommon: TJamShellTree
              Left = 0
              Top = 0
              Width = 388
              Height = 515
              ShellLink = slStartMenuCommon
              RootedAt = SF_COMMON_STARTMENU
              SpecialFolder = SF_COMMON_STARTMENU
              ShellContextMenu = False
              ShowNethood = False
              ShowRecycleBin = False
              ShowFiles = True
              NoFillOnStartup = True
              FileSystemOnly = True
              ExpandOnSelected = True
              Filter = '*'
              Checkboxes = True
              BorderStyle = bsNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ShowRoot = True
              Align = alClient
              Color = clWhite
              TabOrder = 0
              ToolTips = False
            end
          end
          object LMDSplitterPane4: TLMDSplitterPane
            object jtvStartMenu: TJamShellTree
              Left = 0
              Top = 0
              Width = 389
              Height = 515
              ShellLink = slStartMenu
              RootedAt = SF_STARTMENU
              SpecialFolder = SF_STARTMENU
              ShellContextMenu = False
              ShowNethood = False
              ShowRecycleBin = False
              ShowFiles = True
              NoFillOnStartup = True
              FileSystemOnly = True
              ExpandOnSelected = True
              Filter = '*'
              Checkboxes = True
              BorderStyle = bsNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ShowRoot = True
              Align = alClient
              Color = clWhite
              TabOrder = 0
              ToolTips = False
            end
          end
        end
        object cxLabel1: TcxLabel
          Left = 0
          Top = 0
          Align = alTop
          AutoSize = False
          Caption = 
            'Marque os itens que devem ficar dispon'#237'veis para o cliente da lo' +
            'ja'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Transparent = True
          Height = 25
          Width = 794
          AnchorX = 397
          AnchorY = 13
        end
      end
    end
  end
  object slStartMenu: TJamShellLink
    Left = 192
    Top = 304
  end
  object slDesktop: TJamShellLink
    Left = 128
    Top = 304
  end
  object slDesktopCommon: TJamShellLink
    Left = 96
    Top = 304
  end
  object slStartMenuCommon: TJamShellLink
    Left = 160
    Top = 304
  end
end
