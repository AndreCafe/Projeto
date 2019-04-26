object FrmTotal3: TFrmTotal3
  Left = 0
  Top = 0
  Caption = 'FrmTotal3'
  ClientHeight = 371
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object panTot: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 1008
    Height = 231
    AutoSize = True
    Align = alTop
    Bevel.Mode = bmCustom
    TabOrder = 0
    OnResize = panTotResize
    object panValor: TLMDSimplePanel
      Left = 0
      Top = 78
      Width = 1008
      Height = 75
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 1
      Align = alTop
      Bevel.Mode = bmCustom
      TabOrder = 0
      object lbTotal: TcxLabel
        AlignWithMargins = True
        Left = 620
        Top = 0
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 7
        Margins.Bottom = 0
        Align = alRight
        Caption = 'Total = R$ 0,00'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -48
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.TextColor = clBlack
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.TextColor = clBlack
        Properties.Alignment.Vert = taVCenter
        AnchorY = 38
      end
      object lbEditPagamento: TcxLabel
        AlignWithMargins = True
        Left = 473
        Top = 3
        Cursor = crHandPoint
        Margins.Right = 30
        Align = alRight
        Caption = 'Pagamento (F2)'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.HotTrack = True
        Style.TextColor = 11316396
        Style.IsFontAssigned = True
        StyleHot.BorderStyle = ebsNone
        StyleHot.TextColor = clBlue
        StyleHot.TextStyle = [fsUnderline]
        Properties.Alignment.Vert = taVCenter
        AnchorY = 38
      end
      object lbEditObs: TcxLabel
        AlignWithMargins = True
        Left = 177
        Top = 3
        Cursor = crHandPoint
        Margins.Right = 30
        Align = alRight
        Caption = 'Observa'#231#245'es (F4)'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.HotTrack = True
        Style.TextColor = 11316396
        Style.IsFontAssigned = True
        StyleHot.BorderStyle = ebsNone
        StyleHot.TextColor = clBlue
        StyleHot.TextStyle = [fsUnderline]
        Properties.Alignment.Vert = taVCenter
        OnClick = lbEditObsClick
        AnchorY = 38
      end
      object lbEditDesconto: TcxLabel
        AlignWithMargins = True
        Left = 337
        Top = 3
        Cursor = crHandPoint
        Margins.Right = 30
        Align = alRight
        Caption = 'Desconto (F3)'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.HotTrack = True
        Style.TextColor = 11316396
        Style.IsFontAssigned = True
        StyleHot.BorderStyle = ebsNone
        StyleHot.TextColor = clBlue
        StyleHot.TextStyle = [fsUnderline]
        Properties.Alignment.Vert = taVCenter
        OnClick = lbEditDescontoClick
        AnchorY = 38
      end
      object lbObs: TcxLabel
        AlignWithMargins = True
        Left = 7
        Top = 7
        Cursor = crHandPoint
        Margins.Left = 7
        Margins.Top = 7
        Margins.Right = 25
        Margins.Bottom = 7
        Align = alClient
        AutoSize = False
        Caption = 'lbObs'
        Constraints.MaxHeight = 75
        ParentColor = False
        ParentFont = False
        Style.BorderStyle = ebsFlat
        Style.Color = clBtnFace
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI Semibold'
        Style.Font.Style = [fsBold]
        Style.HotTrack = True
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        StyleHot.BorderColor = clBlue
        StyleHot.BorderStyle = ebsSingle
        StyleHot.TextColor = clBlue
        StyleHot.TextStyle = []
        Properties.ShowEndEllipsis = True
        Properties.WordWrap = True
        Visible = False
        OnClick = lbEditObsClick
        Height = 61
        Width = 142
      end
    end
    object panDesconto: TLMDSimplePanel
      Left = 0
      Top = 0
      Width = 1008
      Height = 78
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 1
      Align = alTop
      Bevel.Mode = bmCustom
      TabOrder = 1
      Visible = False
      object panDesc2: TLMDSimplePanel
        Left = 0
        Top = 39
        Width = 1008
        Height = 39
        Align = alClient
        Bevel.Mode = bmCustom
        TabOrder = 0
        object lbDesconto: TcxLabel
          AlignWithMargins = True
          Left = 905
          Top = 3
          Cursor = crHandPoint
          Margins.Right = 7
          Align = alRight
          Caption = 'R$ 0,00'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clRed
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = True
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.TextColor = clRed
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleFocused.LookAndFeel.Kind = lfUltraFlat
          StyleHot.BorderStyle = ebsNone
          StyleHot.LookAndFeel.Kind = lfUltraFlat
          StyleHot.TextColor = clRed
          StyleHot.TextStyle = [fsBold, fsUnderline]
          Properties.Alignment.Vert = taVCenter
          OnClick = lbEditDescontoClick
          AnchorY = 20
        end
        object lbPromptDesconto: TcxLabel
          AlignWithMargins = True
          Left = 765
          Top = 0
          Cursor = crHandPoint
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 10
          Margins.Bottom = 0
          Align = alRight
          Caption = 'Desconto ='
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clRed
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.HotTrack = True
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.TextColor = clRed
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleFocused.LookAndFeel.Kind = lfUltraFlat
          StyleHot.BorderStyle = ebsNone
          StyleHot.LookAndFeel.Kind = lfUltraFlat
          StyleHot.TextColor = clRed
          StyleHot.TextStyle = [fsUnderline]
          Properties.Alignment.Vert = taVCenter
          OnClick = lbEditDescontoClick
          AnchorY = 20
        end
      end
      object panDesc1: TLMDSimplePanel
        Left = 0
        Top = 0
        Width = 1008
        Height = 39
        Align = alTop
        Bevel.Mode = bmCustom
        TabOrder = 1
        object lbSubTotal: TcxLabel
          AlignWithMargins = True
          Left = 905
          Top = 3
          Margins.Right = 7
          Align = alRight
          Caption = 'R$ 0,00'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clRed
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.TextColor = clGray
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleFocused.LookAndFeel.Kind = lfUltraFlat
          StyleHot.LookAndFeel.Kind = lfUltraFlat
          StyleHot.TextColor = clRed
          Properties.Alignment.Vert = taVCenter
          AnchorY = 20
        end
        object cxLabel3: TcxLabel
          AlignWithMargins = True
          Left = 771
          Top = 0
          Cursor = crHandPoint
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 10
          Margins.Bottom = 0
          Align = alRight
          Caption = 'SubTotal ='
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clRed
          Style.Font.Height = -24
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.LookAndFeel.Kind = lfUltraFlat
          Style.TextColor = clGray
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.Kind = lfUltraFlat
          StyleFocused.LookAndFeel.Kind = lfUltraFlat
          StyleHot.LookAndFeel.Kind = lfUltraFlat
          StyleHot.TextColor = clRed
          Properties.Alignment.Vert = taVCenter
          OnClick = lbEditDescontoClick
          AnchorY = 20
        end
      end
    end
    object panPontos: TLMDSimplePanel
      Left = 0
      Top = 153
      Width = 1008
      Height = 78
      AutoSize = True
      Align = alTop
      Bevel.Mode = bmCustom
      TabOrder = 2
      object lbPontosDisp: TcxLabel
        AlignWithMargins = True
        Left = 0
        Top = 39
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 7
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Pontos Dispon'#237'veis = 500'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -29
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.TextColor = clBlack
        Style.TextStyle = []
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        AnchorX = 1001
        AnchorY = 59
      end
      object lbPontosNec: TcxLabel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 7
        Margins.Bottom = 0
        Align = alTop
        Caption = 'Pontos Necess'#225'rios = 100'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -29
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.TextColor = clBlack
        Style.TextStyle = []
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        AnchorX = 1001
        AnchorY = 20
      end
    end
  end
  object imgs: TcxImageList
    Height = 32
    Width = 32
    FormatVersion = 1
    DesignInfo = 20447400
    ImageInfo = <
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00250000009C000000B300000086000000600000003300000018000000020000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0020000000A9000000F3000000FF000000FA000000D400000089000000390000
          0010000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000014000000A2000000FA000000FF000000FF000000FF000000D70000
          006D0000001D0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000001E000000CE000000FF000000FF000000F4000000FE0000
          00F900000096000000230000000A0000000A0000000A0000000A0000000A0000
          000A0000000A0000000A0000000A0000000A0000000A0000000A0000000A0000
          000A000000070000000100000000000000000000000000000000000000000000
          0000000000010000001A00000091000000FF000000FF000000C2000000CD0000
          00FA000000FF000000A90000005E0000005E0000005E0000005E0000005E0000
          005E0000005E0000005E0000005E0000005E0000005E0000005E0000005E0000
          005D00000054000000360000001A000000010000000000000000000000000000
          00020000002D0000008D000000DB000000FF000000FF000000AA000000390000
          00BE000000F9000000FF000000FB000000FA000000FA000000FA000000FA0000
          00FA000000FA000000FA000000FA000000FA000000FA000000FA000000FA0000
          00FA000000F5000000D9000000900000002F0000000200000000000000000000
          002B000000BF000000FF000000FA000000E5000000D4000000A9000000030000
          002A000000BA000000DF000000DF000000DF000000DF000000DF000000DF0000
          00DF000000DF000000DF000000DF000000DF000000DF000000DF000000DF0000
          00DF000000E5000000F9000000FF000000C00000002C00000000000000080000
          00A6000000FF000000F5000000B7000000700000003F00000018000000030000
          0000000000270000005E0000005E0000005E0000005E0000005E0000005E0000
          005E0000005E0000005E0000005E0000005E0000005E0000005E0000005E0000
          005E00000071000000B7000000F5000000FF000000A800000009000000430000
          00F9000000FF0000009600000013000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000001200000094000000FF000000FA00000045000000890000
          00FF000000FB0000003B00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000039000000FB000000FF00000096000000B60000
          00FF000000F600000023000000000000000000000000000000050000001B0000
          001B0000001B0000001B0000001B0000001B0000001B0000001B0000001B0000
          001B0000001B0000001B0000001B0000001B0000001B0000001B000000050000
          0000000000000000000000000021000000F4000000FF000000D3000000BD0000
          00FF000000F5000000220000000000000000000000000000001F0000009B0000
          009B0000009B0000009B0000009B0000009B0000009B0000009B0000009B0000
          009B0000009B0000009B0000009B0000009B0000009B0000009B0000001F0000
          0000000000000000000000000020000000F3000000FF000000E0000000BC0000
          00FF000000F50000002200000000000000000000000000000033000000FE0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FE000000330000
          0000000000000000000000000020000000F3000000FF000000DE000000BC0000
          00FF000000F50000002200000000000000000000000000000024000000B30000
          00B3000000B3000000B3000000B3000000B3000000B3000000B3000000B30000
          00B3000000B3000000B3000000B3000000B3000000B3000000B3000000240000
          0000000000000000000000000020000000F3000000FF000000DE000000BC0000
          00FF000000F5000000220000000000000000000000000000000A000000330000
          0034000000340000003400000034000000340000003400000034000000340000
          00340000003400000034000000340000003400000034000000330000000A0000
          0000000000000000000000000020000000F3000000FF000000DE000000BC0000
          00FF000000F50000002200000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000020000000F3000000FF000000DE000000BC0000
          00FF000000F50000002200000000000000000000000000000002000000070000
          0007000000070000000700000007000000070000000700000007000000070000
          0007000000070000000700000007000000070000000700000007000000020000
          0000000000000000000000000020000000F3000000FF000000DE000000BC0000
          00FF000000F50000002200000000000000000000000000000017000000760000
          0077000000770000007700000077000000770000007700000077000000770000
          0077000000770000007700000077000000770000007700000076000000170000
          0000000000000000000000000020000000F3000000FF000000DE000000BC0000
          00FF000000F50000002200000000000000000000000000000031000000EF0000
          00F0000000F0000000F0000000F0000000F0000000F0000000F0000000F00000
          00F0000000F0000000F0000000F0000000F0000000F0000000EF000000310000
          0000000000000000000000000020000000F3000000FF000000DE000000BC0000
          00FF000000F50000002200000000000000000000000000000026000000BC0000
          00BD000000BD000000BD000000BD000000BD000000BD000000BD000000BD0000
          00BD000000BD000000BD000000BD000000BD000000BD000000BC000000260000
          0000000000000000000000000020000000F3000000FF000000DE000000BD0000
          00FF000000F50000002100000000000000000000000000000008000000290000
          0029000000290000002900000029000000290000002900000029000000290000
          0029000000290000002900000029000000290000002900000029000000080000
          0000000000000000000000000020000000F3000000FF000000DD000000920000
          00FF000000FA0000002F00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000002D000000F9000000FF000000A00000004F0000
          00FF000000FF0000008500000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000082000000FF000000FF00000053000000140000
          00D4000000FF000000E700000076000000290000001800000018000000180000
          0018000000180000001800000018000000180000001800000018000000180000
          0018000000180000001800000018000000180000001800000018000000180000
          00180000002800000075000000E7000000FF000000D500000015000000010000
          0058000000F0000000FF000000E7000000CB000000BF000000BF000000BF0000
          00BF000000BF000000BF000000BF000000BF000000BF000000BF000000BF0000
          00BF000000BF000000BF000000BF000000BF000000BF000000BF000000BF0000
          00BF000000CB000000E7000000FF000000F00000005800000001000000000000
          000C00000062000000D4000000FF000000FF000000FD000000FC000000FC0000
          00FC000000FC000000FC000000FC000000FC000000FC000000FC000000FC0000
          00FC000000FC000000FC000000FC000000FC000000FC000000FC000000FC0000
          00FD000000FF000000FF000000D5000000630000000D00000000000000000000
          00000000000D0000003600000073000000BA000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
          00FF000000BB00000073000000360000000D0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
end
