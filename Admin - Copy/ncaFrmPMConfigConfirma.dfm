object FrmConfigConfirma: TFrmConfigConfirma
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Op'#231#245'es da confirma'#231#227'o de impress'#227'o'
  ClientHeight = 332
  ClientWidth = 432
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 16
  object LMDSimplePanel1: TLMDSimplePanel
    AlignWithMargins = True
    Left = 10
    Top = 294
    Width = 412
    Height = 28
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alBottom
    Bevel.Mode = bmCustom
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 0
      Top = 0
      Width = 71
      Height = 28
      Cursor = crHandPoint
      Align = alLeft
      Caption = '&Ok'
      Default = True
      ModalResult = 1
      TabOrder = 0
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
    end
    object cxButton2: TcxButton
      AlignWithMargins = True
      Left = 81
      Top = 0
      Width = 71
      Height = 28
      Cursor = crHandPoint
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Cancel = True
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
    end
  end
  object LMDSimplePanel2: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 432
    Height = 294
    Align = alClient
    Bevel.Mode = bmCustom
    TabOrder = 1
    object lbInfoImpNex: TcxLabel
      AlignWithMargins = True
      Left = 10
      Top = 10
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alTop
      Caption = 
        'Configure a tela de confirma'#231#227'o de impress'#227'o que aparece para os' +
        ' clientes da sua loja:'
      ParentColor = False
      ParentFont = False
      Style.Color = clWhite
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextColor = clNavy
      Style.TextStyle = []
      Style.IsFontAssigned = True
      Properties.WordWrap = True
      Transparent = True
      Width = 412
    end
    object edPMMostrarPaginasCli: TcxCheckBox
      AlignWithMargins = True
      Left = 10
      Top = 54
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alTop
      Caption = '1.  Mostrar quantidade de p'#225'ginas na pergunta'
      ParentFont = False
      Properties.ImmediatePost = True
      Properties.MultiLine = True
      Properties.NullStyle = nssUnchecked
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = True
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
      Width = 412
    end
    object edPMMostrarValorCli: TcxCheckBox
      AlignWithMargins = True
      Left = 10
      Top = 77
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alTop
      Caption = '2.  Mostrar valor da impress'#227'o na pergunta'
      ParentFont = False
      Properties.ImmediatePost = True
      Properties.MultiLine = True
      Properties.NullStyle = nssUnchecked
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = True
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 2
      Width = 412
    end
    object edPMCalcValorCli: TcxImageComboBox
      AlignWithMargins = True
      Left = 67
      Top = 120
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Properties.ImmediateDropDownWhenActivated = True
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.Items = <
        item
          Description = 'Valor m'#237'nimo e valor m'#225'ximo'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Valor m'#237'nimo'
          Value = 1
        end
        item
          Description = 'Valor m'#225'ximo'
          Value = 2
        end>
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 3
      Width = 269
    end
    object lbPMCalcValorCli: TcxLabel
      AlignWithMargins = True
      Left = 42
      Top = 102
      Margins.Left = 50
      Margins.Top = 5
      Caption = '2.1. Valor da impress'#227'o a ser mostrado na pergunta'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object edPMObs: TcxMemo
      AlignWithMargins = True
      Left = 30
      Top = 176
      Margins.Left = 25
      Margins.Top = 0
      Margins.Right = 50
      Margins.Bottom = 10
      ParentFont = False
      Properties.ScrollBars = ssVertical
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 5
      Height = 89
      Width = 379
    end
    object lbPMObs: TcxLabel
      AlignWithMargins = True
      Left = 28
      Top = 153
      Margins.Left = 25
      Margins.Top = 0
      Caption = '3. Observa'#231#227'o a ser mostrada no rodap'#233' da pergunta'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
  end
end
