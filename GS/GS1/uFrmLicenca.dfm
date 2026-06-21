object FrmLicenca: TFrmLicenca
  Left = 174
  Top = 206
  BorderStyle = bsDialog
  Caption = 'Licen'#231'a de Uso'
  ClientHeight = 293
  ClientWidth = 508
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 508
    Height = 252
    ActivePage = cxTabSheet1
    Align = alClient
    HideTabs = True
    LookAndFeel.NativeStyle = True
    TabOrder = 0
    ClientRectBottom = 252
    ClientRectRight = 508
    ClientRectTop = 0
    object cxTabSheet1: TcxTabSheet
      BorderWidth = 10
      Caption = 'cxTabSheet1'
      ImageIndex = 0
      object vgLic1: TcxVerticalGrid
        Left = 0
        Top = 80
        Width = 488
        Height = 96
        Styles.Background = cxStyle19
        Styles.Content = cxStyle2
        Styles.Selection = cxStyle10
        Align = alTop
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = True
        OptionsView.CellAutoHeight = True
        OptionsView.PaintStyle = psDelphi
        OptionsView.RowHeaderWidth = 130
        OptionsView.ShowEmptyRowImage = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.GoToNextCellOnTab = True
        OptionsData.CancelOnExit = False
        ParentFont = False
        TabOrder = 0
        object vgLic1Codigo: TcxEditorRow
          Height = 30
          Properties.Caption = '1. C'#243'digo da Loja'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditProperties.Alignment.Horz = taLeftJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.AutoSelect = False
          Properties.EditProperties.CharCase = ecUpperCase
          Properties.EditProperties.HideSelection = False
          Properties.EditProperties.EditMask = 'aaaa\-9999'
          Properties.EditProperties.ReadOnly = False
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = 'af5e-0001'
          Styles.Header = cxStyle11
        end
        object vgLic1HD: TcxEditorRow
          Height = 30
          Properties.Caption = '2. N'#250'mero de S'#233'rie'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditProperties.Alignment.Horz = taLeftJustify
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.AutoSelect = False
          Properties.EditProperties.ReadOnly = True
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = 'cmaskhdf12983929sdkjh89287'
        end
        object vgLic1Numero: TcxEditorRow
          Height = 30
          Properties.Caption = '3. N'#250'mero da Licen'#231'a'
          Properties.HeaderAlignmentVert = vaCenter
          Properties.EditPropertiesClassName = 'TcxMaskEditProperties'
          Properties.EditProperties.Alignment.Vert = taVCenter
          Properties.EditProperties.EditMask = '9999\-9999\-9999\-9999'
          Properties.EditProperties.ReadOnly = True
          Properties.DataBinding.ValueType = 'String'
          Properties.Value = ''
        end
      end
      object lbInstrucao: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        AutoSize = False
        Caption = 
          'Digite o C'#243'digo da Loja e clique em avan'#231'ar. Caso voc'#234' ainda n'#227'o' +
          ' o possua ou o tenha perdido, entre em contato com a Cybermgr.co' +
          'm para obt'#234'-lo.'#13#10
        ParentFont = False
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
        Height = 40
        Width = 488
      end
      object lbContato: TcxLabel
        Left = 0
        Top = 40
        Align = alTop
        AutoSize = False
        Caption = 
          'Telefone: (48) 338-1171'#13#10'Messenger: suporte@cybermgr.com ou fran' +
          'cinybartolo@hotmail.com'
        ParentFont = False
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
        Height = 40
        Width = 488
      end
    end
    object cxTabSheet2: TcxTabSheet
      BorderWidth = 10
      Caption = 'cxTabSheet2'
      ImageIndex = 1
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxLabel3: TcxLabel
        Left = 0
        Top = 113
        Align = alTop
        AutoSize = False
        Caption = 
          'Para concluir a transfer'#234'ncia digite a senha da loja e clique em' +
          ' avan'#231'ar:'
        ParentFont = False
        Properties.Alignment.Vert = taVCenter
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
        Height = 32
        Width = 488
      end
      object rgRegistro: TcxRadioGroup
        Left = 0
        Top = 30
        Align = alTop
        Caption = ' O que voc'#234' deseja fazer ? '
        ItemIndex = 0
        Properties.ImmediatePost = True
        Properties.Items = <
          item
            Caption = '&1. Usar o Cyber Manager em Modo Demonstra'#231#227'o nessa m'#225'quina'
            Value = True
          end
          item
            Caption = '&2. Transferir minha licen'#231'a de uso para essa m'#225'quina'
          end>
        Properties.WordWrap = True
        Style.BorderStyle = ebs3D
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.LookAndFeel.NativeStyle = True
        Style.Shadow = False
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 1
        ExplicitWidth = 482
        Height = 83
        Width = 488
      end
      object cxLabel2: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        AutoSize = False
        Caption = 'Sua licen'#231'a de uso est'#225' habilitada para outro computador'
        ParentFont = False
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
        ExplicitWidth = 482
        Height = 30
        Width = 488
      end
      object cxLabel4: TcxLabel
        Left = 0
        Top = 146
        Caption = 'Senha da Loja: '
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Transparent = True
      end
      object edSenha: TcxTextEdit
        Left = 0
        Top = 164
        ParentFont = False
        Properties.EchoMode = eemPassword
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 4
        Text = 'edSenha'
        Width = 177
      end
    end
    object cxTabSheet3: TcxTabSheet
      BorderWidth = 10
      Caption = 'cxTabSheet3'
      ImageIndex = 2
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxLabel5: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        AutoSize = False
        Caption = 'Licen'#231'a de Uso Obtida com Sucesso !'
        ParentFont = False
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clGreen
        Style.Font.Height = -19
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
        Height = 30
        Width = 488
      end
      object cxLabel6: TcxLabel
        Left = 0
        Top = 30
        Align = alTop
        AutoSize = False
        Caption = 
          'A licen'#231'a de uso foi obtida com sucesso. Clique no bot'#227'o "Fechar' +
          '" para que sejam exibidas todas informa'#231#245'es sobre o registro do ' +
          'Cyber-Manager. '
        ParentFont = False
        Properties.Alignment.Vert = taVCenter
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlack
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = True
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
        ExplicitWidth = 482
        Height = 40
        Width = 488
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 252
    Width = 508
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object cxButton1: TcxButton
      Left = 8
      Top = 8
      Width = 137
      Height = 25
      Caption = '&Avan'#231'ar >>'
      Default = True
      TabOrder = 0
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
    end
    object cxButton2: TcxButton
      Left = 424
      Top = 8
      Width = 73
      Height = 25
      Caption = '&Fechar'
      TabOrder = 1
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
    end
    object cxButton3: TcxButton
      Left = 168
      Top = 8
      Width = 89
      Height = 25
      Caption = '<< &Voltar'
      TabOrder = 2
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 426
    Top = 172
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15451300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clDefault
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clOlive
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12713983
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6579300
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8559005
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 12937777
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clDefault
    end
  end
end
