object FrmAguarde: TFrmAguarde
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FrmAguarde'
  ClientHeight = 57
  ClientWidth = 376
  Color = clBtnFace
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
    Width = 376
    Height = 57
    Align = alClient
    Bevel.Mode = bmStandard
    Bevel.StandardStyle = lsSingle
    Color = clWhite
    TabOrder = 0
    object cxLabel1: TcxLabel
      Left = 32
      Top = 19
      Caption = 'Abrindo site do parceiro. Aguarde ....'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object btnCancelar: TcxButton
      Left = 263
      Top = 18
      Width = 75
      Height = 21
      Cursor = crHandPoint
      Cancel = True
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
    end
  end
end
