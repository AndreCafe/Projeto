object FrmTipos: TFrmTipos
  Left = 290
  Top = 185
  BorderStyle = bsDialog
  BorderWidth = 10
  Caption = 'Selecione os Tipos de Transa'#231#227'o a serem mostrados'
  ClientHeight = 207
  ClientWidth = 324
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cgTipo: TCheckListBox
    Left = 0
    Top = 0
    Width = 233
    Height = 207
    Align = alLeft
    ItemHeight = 13
    TabOrder = 0
  end
  object btnTodos: TcxButton
    Left = 247
    Top = 0
    Width = 73
    Height = 23
    Caption = '&Todos'
    TabOrder = 1
    OnClick = btnTodosClick
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = True
  end
  object btnNenhum: TcxButton
    Left = 247
    Top = 32
    Width = 73
    Height = 23
    Caption = '&Nenhum'
    TabOrder = 2
    OnClick = btnNenhumClick
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = True
  end
  object btnOk: TcxButton
    Left = 247
    Top = 82
    Width = 73
    Height = 23
    Caption = '&Ok'
    Default = True
    TabOrder = 3
    OnClick = btnOkClick
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = True
  end
  object btnCancelar: TcxButton
    Left = 247
    Top = 114
    Width = 73
    Height = 23
    Cancel = True
    Caption = '&Cancelar'
    TabOrder = 4
    OnClick = btnCancelarClick
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = True
  end
end
