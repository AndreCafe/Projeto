object FrameShellFilter: TFrameShellFilter
  Left = 0
  Top = 0
  Width = 605
  Height = 454
  TabOrder = 0
  object panPri: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 605
    Height = 454
    Align = alClient
    Bevel.Mode = bmCustom
    TabOrder = 0
    ExplicitWidth = 421
    ExplicitHeight = 340
    object Paginas: TcxPageControl
      AlignWithMargins = True
      Left = 0
      Top = 5
      Width = 605
      Height = 449
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 0
      ActivePage = cxTabSheet1
      Align = alClient
      Color = clBtnFace
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = True
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      ExplicitWidth = 575
      ExplicitHeight = 433
      ClientRectBottom = 447
      ClientRectLeft = 2
      ClientRectRight = 603
      ClientRectTop = 22
      object cxTabSheet1: TcxTabSheet
        Caption = '&'#193'rea de Trabalho'
        ImageIndex = 0
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object LMDSplitterPanel1: TLMDSplitterPanel
          AlignWithMargins = True
          Left = 3
          Top = 28
          Width = 595
          Height = 394
          Bevel.Mode = bmCustom
          Bars = <
            item
              OldPosition = -1
              Position = 296
            end>
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 565
          ExplicitHeight = 378
          object LMDSplitterPane1: TLMDSplitterPane
            AlignWithMargins = True
            Color = clBtnFace
            ParentColor = False
          end
          object LMDSplitterPane2: TLMDSplitterPane
          end
        end
        object cxLabel2: TcxLabel
          Left = 0
          Top = 0
          Align = alTop
          AutoSize = False
          Caption = 
            'Marques, nas duas janelas abaixo,  os itens que devem ficar v'#237'si' +
            'veis ao usu'#225'rio.'
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
          ExplicitWidth = 571
          Height = 25
          Width = 601
          AnchorX = 301
          AnchorY = 13
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = 'Menu Iniciar'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object LMDSplitterPanel2: TLMDSplitterPanel
          AlignWithMargins = True
          Left = 3
          Top = 28
          Width = 595
          Height = 394
          Bevel.Mode = bmCustom
          Bars = <
            item
              OldPosition = -1
              Position = 296
            end>
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 565
          ExplicitHeight = 378
          object LMDSplitterPane3: TLMDSplitterPane
          end
          object LMDSplitterPane4: TLMDSplitterPane
          end
        end
        object cxLabel1: TcxLabel
          Left = 0
          Top = 0
          Align = alTop
          AutoSize = False
          Caption = 
            'Marques, nas duas janelas abaixo,  os itens que devem ficar v'#237'si' +
            'veis ao usu'#225'rio.'
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
          ExplicitWidth = 571
          Height = 25
          Width = 601
          AnchorX = 301
          AnchorY = 13
        end
      end
    end
  end
end
