inherited FrmEditContatoValidar: TFrmEditContatoValidar
  ClientWidth = 588
  ExplicitWidth = 624
  PixelsPerInch = 96
  TextHeight = 19
  inherited panPri: TLMDSimplePanel
    Width = 588
    Height = 37
    Bevel.StandardStyle = lsLowered
    Color = clWhite
    ParentColor = False
    ExplicitWidth = 547
    ExplicitHeight = 37
    inherited lbNome: TcxLabel
      Left = 40
      Top = 2
      Style.Font.Height = -16
      Style.IsFontAssigned = True
      ExplicitLeft = 40
      ExplicitTop = 2
      ExplicitWidth = 210
      ExplicitHeight = 33
      AnchorY = 19
    end
    inherited Img: TMyImage
      Left = 5
      Top = 2
      Height = 33
      ExplicitTop = 1
    end
    inherited lbRemove: TcxLabel
      Left = 250
      Top = 2
      Style.IsFontAssigned = True
      AnchorY = 19
    end
    inherited panDeb: TLMDSimplePanel
      Left = 477
      Top = 7
      Height = 23
      inherited lbDebito: TcxLabel
        Style.IsFontAssigned = True
        AnchorX = 25
        AnchorY = 12
      end
      inherited lbValorDebito: TcxLabel
        Style.IsFontAssigned = True
        AnchorX = 72
        AnchorY = 12
      end
    end
    inherited panFid: TLMDSimplePanel
      Left = 391
      Top = 7
      Height = 23
      inherited lbPontos: TcxLabel
        Style.IsFontAssigned = True
        AnchorX = 26
        AnchorY = 12
      end
      inherited lbQuantPontos: TcxLabel
        Style.IsFontAssigned = True
        AnchorX = 61
        AnchorY = 12
      end
    end
    inherited panCred: TLMDSimplePanel
      Left = 277
      Top = 7
      Height = 23
      inherited lbCredito: TcxLabel
        Style.IsFontAssigned = True
        AnchorX = 28
        AnchorY = 12
      end
      inherited lbValorCredito: TcxLabel
        Style.IsFontAssigned = True
        AnchorX = 77
        AnchorY = 12
      end
    end
  end
  object lbMsg: TcxLabel [1]
    AlignWithMargins = True
    Left = 0
    Top = 52
    Margins.Left = 0
    Margins.Top = 15
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Caption = #201' necess'#225'rio selecionar um cliente'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextColor = clRed
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    Properties.WordWrap = True
    Width = 588
  end
  object LMDSimplePanel2: TLMDSimplePanel [2]
    Left = 0
    Top = 128
    Width = 588
    Height = 34
    Margins.Left = 15
    Margins.Top = 0
    Margins.Right = 15
    Margins.Bottom = 15
    Align = alBottom
    Bevel.Mode = bmCustom
    TabOrder = 2
    ExplicitLeft = 15
    ExplicitTop = 116
    ExplicitWidth = 535
    object btnSalvar: TcxButton
      Left = 0
      Top = 0
      Width = 81
      Height = 34
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Ok'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
    end
    object btnCancelar: TcxButton
      AlignWithMargins = True
      Left = 96
      Top = 0
      Width = 74
      Height = 34
      Cursor = crHandPoint
      Margins.Left = 15
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Cancel = True
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.AllowAllUp = True
      SpeedButtonOptions.Flat = True
    end
  end
  inherited imgs: TcxImageList
    FormatVersion = 1
  end
  inherited cxImageList1: TcxImageList
    FormatVersion = 1
  end
end
