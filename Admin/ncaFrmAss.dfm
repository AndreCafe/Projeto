object FrmAss: TFrmAss
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Assinatura NexCaf'#233' Premium'
  ClientHeight = 302
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Paginas: TcxPageControl
    Left = 0
    Top = 0
    Width = 408
    Height = 257
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = cxTabSheet2
    Properties.CustomButtons.Buttons = <>
    Properties.HideTabs = True
    LookAndFeel.NativeStyle = False
    ClientRectBottom = 257
    ClientRectRight = 408
    ClientRectTop = 0
    object cxTabSheet1: TcxTabSheet
      Caption = 'cxTabSheet1'
      ImageIndex = 0
      object cxLabel5: TcxLabel
        Left = 20
        Top = 10
        Caption = 'Seja um assinante NexCaf'#233' PREMIUM !'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object cxLabel6: TcxLabel
        Left = 20
        Top = 41
        AutoSize = False
        Caption = 
          'A assinatura oferece os seguintes benef'#237'cios:'#13#10#13#10'1- Acesso ao se' +
          'rvi'#231'o de plant'#227'o t'#233'cnico 24hs. Usu'#225'rios FREE tem acesso somente ' +
          'ao atendimento t'#233'cnico durante o hor'#225'rio comercial. '#13#10#13#10'2- Remo'#231 +
          #227'o da publicidade das m'#225'quinas clientes. '#13#10#13#10'A assinatura Premiu' +
          'm N'#195'O inclui um contrato de plano fidelidade. Voc'#234' pode pagar m'#234 +
          's a m'#234's pelo tempo que desejar. Caso deixe de renovar sua assina' +
          'tura o sistema vai continuar a funcionar normalmente e vai volta' +
          'r a aparecer publicidade nas m'#225'quinas clientes e voc'#234' deixar'#225' de' +
          ' ter acesso ao plant'#227'o t'#233'cnico 24hs.'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        Properties.WordWrap = True
        Height = 219
        Width = 355
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'cxTabSheet2'
      ImageIndex = 1
      object cxLabel1: TcxLabel
        Left = 15
        Top = 13
        Caption = 'Sua assinatura NexCaf'#233' Premium vence em:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object cxLabel3: TcxLabel
        Left = 15
        Top = 66
        AutoSize = False
        Caption = 
          'Voc'#234' deve emitir e pagar o boleto de renova'#231#227'o de assinatura com' +
          ' 2 dias '#250'teis de anteced'#234'ncia ao vencimento da assinatura vigent' +
          'e.'#13#10
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = [fsBold]
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        Properties.WordWrap = True
        Height = 36
        Width = 370
      end
      object cxLabel4: TcxLabel
        Left = 18
        Top = 108
        AutoSize = False
        Caption = 
          'O sistema n'#227'o renova automaticamente sua assinatura, portanto, '#233 +
          ' necess'#225'rio clicar em "Renovar Assinatura Premium", emitir o bol' +
          'eto e pagar dentro do prazo de anteced'#234'ncia caso voc'#234' deseje con' +
          'tinuar como assinante Premium. '
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.TextColor = clBlack
        Style.IsFontAssigned = True
        Properties.WordWrap = True
        Height = 62
        Width = 355
      end
      object cbNaoMostrarMsgVenc: TcxCheckBox
        Left = 18
        Top = 192
        AutoSize = False
        Caption = 
          'N'#227'o mostrar mensagem de vencimento de assinatura no topo da tela' +
          ' do NexAdmin.'
        Properties.MultiLine = True
        Style.BorderStyle = ebs3D
        TabOrder = 3
        Height = 33
        Width = 362
      end
      object lbData: TcxLabel
        Left = 15
        Top = 31
        Caption = '10/10/2010'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
    end
  end
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 257
    Width = 408
    Height = 45
    Align = alBottom
    Bevel.Mode = bmCustom
    TabOrder = 1
    object btnComprarAss: TcxButton
      Left = 18
      Top = 3
      Width = 190
      Height = 25
      Caption = 'Renovar Assinatura Premium'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnComprarAssClick
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
    end
    object btnFechar: TcxButton
      Left = 312
      Top = 3
      Width = 76
      Height = 25
      Cancel = True
      Caption = 'Fechar'
      Default = True
      ModalResult = 2
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
    end
  end
end
