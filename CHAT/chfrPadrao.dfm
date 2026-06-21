inherited chFramePadrao: TchFramePadrao
  Width = 325
  Height = 330
  inherited LMDSplitterPanel1: TLMDSplitterPanel
    Width = 325
    Height = 330
    Bars = <
      item
        OldPosition = -1
        Position = 183
        PosPercent = 58
      end>
    inherited spConversas: TLMDSplitterPane
      Visible = False
      inherited Conversas: TchpcConversas
        Width = 315
        Height = 183
        OnChange = ConversasChange
        ClientRectBottom = 183
        ClientRectRight = 315
      end
    end
    inherited spTexto: TLMDSplitterPane
      Bevel.StandardStyle = lsNone
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 315
        Height = 134
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object Panel3: TPanel
          Left = 2
          Top = 2
          Width = 311
          Height = 29
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          OnResize = Panel3Resize
          object Bevel1: TBevel
            Left = 0
            Top = 26
            Width = 311
            Height = 3
            Align = alBottom
            Shape = bsBottomLine
          end
          object btnMsgPend: TcxButton
            Left = 280
            Top = 0
            Width = 27
            Height = 26
            TabOrder = 0
            Visible = False
          end
          object cxLabel1: TcxLabel
            Left = 1
            Top = 5
            Caption = '&Contato'
            FocusControl = cbPara
          end
          object cbPara: TcxImageComboBox
            Left = 44
            Top = 3
            EditValue = ''
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.Items = <>
            Properties.OnChange = cbParaPropertiesChange
            Properties.OnEditValueChanged = cbParaPropertiesChange
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 1
            Width = 233
          end
        end
        object Panel4: TPanel
          Left = 2
          Top = 31
          Width = 311
          Height = 101
          Align = alClient
          BevelOuter = bvNone
          BorderWidth = 2
          Color = clWhite
          TabOrder = 1
          object Panel5: TPanel
            Left = 263
            Top = 2
            Width = 46
            Height = 97
            Align = alRight
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 0
            OnResize = Panel5Resize
            object btnEnviar: TcxButton
              Left = 2
              Top = 27
              Width = 43
              Height = 49
              Caption = '&Enviar'
              Default = True
              Enabled = False
              TabOrder = 0
              OnClick = btnEnviarClick
              LookAndFeel.NativeStyle = True
            end
          end
          object meEnviar: TcxMemo
            Left = 2
            Top = 2
            Align = alClient
            Properties.WantReturns = False
            Style.Edges = [bRight]
            TabOrder = 1
            Height = 97
            Width = 261
          end
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 304
    Top = 80
  end
end
