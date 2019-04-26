object FrmConfigRec_Serial: TFrmConfigRec_Serial
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  BorderWidth = 10
  Caption = 'Impressora Serial'
  ClientHeight = 245
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 21
  object LC: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 426
    Height = 213
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 40
    ExplicitWidth = 300
    ExplicitHeight = 250
    object cbCortaFolha: TcxComboBox
      Left = 273
      Top = 130
      ParentFont = False
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.Items.Strings = (
        'Sim'
        'N'#227'o')
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = True
      Style.StyleController = FrmPri.cxEditStyleController1
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFrame3D
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 3
      Width = 102
    end
    object edRecSalto: TcxSpinEdit
      Left = 273
      Top = 92
      ParentFont = False
      Properties.ImmediatePost = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = True
      Style.StyleController = FrmPri.cxEditStyleController1
      Style.ButtonStyle = btsFlat
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 2
      Width = 64
    end
    object edRecLargura: TcxSpinEdit
      Left = 273
      Top = 54
      ParentFont = False
      Properties.ImmediatePost = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = True
      Style.StyleController = FrmPri.cxEditStyleController1
      Style.ButtonStyle = btsFlat
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
      Value = 40
      Width = 64
    end
    object cbRecPorta: TcxComboBox
      Left = 273
      Top = 16
      ParentFont = False
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8')
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = False
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = True
      Style.StyleController = FrmPri.cxEditStyleController1
      Style.ButtonStyle = btsFlat
      Style.PopupBorderStyle = epbsFrame3D
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Text = '1'
      Width = 68
    end
    object LCGroup_Root: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object LCItem1: TdxLayoutItem
      CaptionOptions.Text = 'Cortar a folha?'
      Parent = LCGroup_Root
      Control = cbCortaFolha
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object LCItem2: TdxLayoutItem
      CaptionOptions.Text = 'Linhas a saltar no fim do recibo'
      Parent = LCGroup_Root
      Control = edRecSalto
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object LCItem3: TdxLayoutItem
      CaptionOptions.Text = 'Largura do papel (em caracteres)'
      Parent = LCGroup_Root
      Control = edRecLargura
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object LCItem4: TdxLayoutItem
      CaptionOptions.Text = 'Porta Serial'
      Parent = LCGroup_Root
      Control = cbRecPorta
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 213
    Width = 426
    Height = 32
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alBottom
    Bevel.Mode = bmCustom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 10
    ExplicitTop = 431
    ExplicitWidth = 733
    object btnOk: TcxButton
      Left = 0
      Top = 0
      Width = 97
      Height = 32
      Cursor = crHandPoint
      Align = alLeft
      Caption = '&Ok'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
    end
  end
end
