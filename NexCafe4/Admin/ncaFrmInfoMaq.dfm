object FrmInfoMaq: TFrmInfoMaq
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  BorderWidth = 20
  Caption = 'M'#225'quina desligada ou desconectada'
  ClientHeight = 223
  ClientWidth = 454
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel
    Left = 0
    Top = 0
    Align = alTop
    Caption = 'N'#227'o h'#225' conex'#227'o do NexCaf'#233' com essa m'#225'quina cliente'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object cxLabel2: TcxLabel
    AlignWithMargins = True
    Left = 0
    Top = 27
    Margins.Left = 0
    Margins.Top = 10
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Caption = 
      'Isso pode ocorrer nas seguintes situa'#231#245'es:'#13#10#13#10'1- A m'#225'quina est'#225' ' +
      'desligada;'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object cxLabel3: TcxLabel
    AlignWithMargins = True
    Left = 0
    Top = 75
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Caption = '2- O programa NexGuard ainda n'#227'o foi instalado nessa m'#225'quina.'
  end
  object cxLabel4: TcxLabel
    AlignWithMargins = True
    Left = 0
    Top = 97
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Caption = 
      '3- O programa NexGuard foi fechado. Nesse caso a m'#225'quina encontr' +
      'a-se desbloqueada e qualquer pessoa poderar us'#225'-la sem restri'#231#245'e' +
      's. '
    Properties.WordWrap = True
    Width = 454
  end
  object cxLabel5: TcxLabel
    AlignWithMargins = True
    Left = 0
    Top = 132
    Margins.Left = 0
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Caption = 
      '4- O programa NexGuard n'#227'o est'#225' conseguindo se conectar ao servi' +
      'dor NexCaf'#233' pela rede.'
    Properties.WordWrap = True
    Width = 454
  end
  object cxButton1: TcxButton
    Left = 0
    Top = 190
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Ok'
    Default = True
    ModalResult = 1
    TabOrder = 5
    LookAndFeel.Kind = lfFlat
  end
end
