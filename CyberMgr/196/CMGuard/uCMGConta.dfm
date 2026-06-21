object FrmConta: TFrmConta
  Left = 361
  Top = 180
  ActiveControl = btnSim
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = 'Confirma o t'#233'rmino desse Acesso?'
  ClientHeight = 256
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnSim: TBitBtn
    Left = 8
    Top = 184
    Width = 289
    Height = 25
    Caption = 'Sim - Desejo realmente terminar esse acesso'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
    OnClick = btnSimClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object btnCanc: TBitBtn
    Left = 8
    Top = 216
    Width = 289
    Height = 25
    Caption = 'Cancelar - Continuar esse acesso'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnCancClick
    Kind = bkCancel
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 305
    Height = 103
    Align = alTop
    BevelOuter = bvLowered
    Color = clWhite
    TabOrder = 2
    object lbValor: TLabel
      Left = 98
      Top = 56
      Width = 92
      Height = 23
      Caption = 'R$ 1,00 *'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbTempo: TLabel
      Left = 98
      Top = 16
      Width = 86
      Height = 23
      Caption = '00:15:00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 16
      Width = 65
      Height = 23
      Caption = 'Tempo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 24
      Top = 56
      Width = 49
      Height = 23
      Caption = 'Valor:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 124
    Top = 118
    Width = 40
    Height = 34
    BevelOuter = bvNone
    Caption = '30'
    Color = clNavy
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 232
    Top = 64
  end
end
