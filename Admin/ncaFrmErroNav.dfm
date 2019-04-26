object FrmErroNav: TFrmErroNav
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrmErroNav'
  ClientHeight = 150
  ClientWidth = 285
  Color = clRed
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 285
    Height = 150
    Align = alClient
    Bevel.BorderColor = 21845
    Bevel.BorderInnerWidth = 1
    Bevel.Mode = bmCustom
    Bevel.StandardStyle = lsSingle
    Color = clWindow
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 23
      Top = 19
      Caption = 'Erro:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.TextColor = clRed
      Style.IsFontAssigned = True
    end
    object btnCancelar: TcxButton
      Left = 23
      Top = 103
      Width = 75
      Height = 21
      Cursor = crHandPoint
      Cancel = True
      Caption = '&Ok'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      Colors.DefaultText = clBlack
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      LookAndFeel.SkinName = ''
    end
    object cxLabel2: TcxLabel
      Left = 23
      Top = 41
      AutoSize = False
      Caption = 
        'N'#227'o foi poss'#237'vel acessar o site do parceiro. Verifique sua conex' +
        #227'o de internet ou o site do parceiro pode estar fora do ar.'
      Properties.WordWrap = True
      Height = 50
      Width = 247
    end
  end
end
