object FrmExp: TFrmExp
  Left = 0
  Top = 0
  Caption = 'Exportar arquivos de consolida'#231#227'o'
  ClientHeight = 340
  ClientWidth = 458
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
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 92
    Height = 13
    Caption = 'Gerar arquivos em:'
  end
  object edPath: TLMDBrowseEdit
    Left = 24
    Top = 35
    Width = 409
    Height = 21
    Cursor = crIBeam
    BackFX.AlphaBlend.Strength = 0.600000023841857900
    Bevel.Mode = bmWindows
    Caret.BlinkRate = 530
    Caret.ImageIndex = 0
    Caret.ListIndex = 0
    TabOrder = 0
    Options = [doReturnFileSysDirs, doAllowEdit, doShowPath, doEnableOK]
    StartFolder = bfoDesktop
  end
  object cbCli: TCheckBox
    Left = 24
    Top = 72
    Width = 409
    Height = 17
    Caption = 
      'Exportar consolida'#231#227'o de clientes para CONSCLI_<N'#250'mero Consolida' +
      #231#227'o>.DBF'
    TabOrder = 1
    OnClick = cbTecClick
  end
  object cbTec: TCheckBox
    Left = 24
    Top = 103
    Width = 409
    Height = 17
    Caption = 
      'Exportar consolida'#231#227'o de t'#233'cnicos para CONSTEC_<N'#250'mero Consolida' +
      #231#227'o>.DBF'
    TabOrder = 2
    OnClick = cbTecClick
  end
  object Memo1: TMemo
    Left = 24
    Top = 144
    Width = 409
    Height = 97
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'A mesma estrutura '#233' usada para Cliente ou T'#233'cnico, '
      'mudando apenas o nome do arquivo:'
      ''
      'CODIGO CHAR 6    (Codigo do t'#233'cnico ou cliente)'
      'IDCONS CHAR 5    (ID da consolida'#231#227'o)'
      'VALOR  CURRENCY  (Total a ser pago ou cobrado)'
      '')
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object btnExp: TBitBtn
    Left = 24
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Exportar'
    TabOrder = 4
    OnClick = btnExpClick
    Kind = bkOK
  end
  object btnCancelar: TBitBtn
    Left = 120
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
    Kind = bkCancel
  end
  object PB: TProgressBar
    Left = 24
    Top = 248
    Width = 409
    Height = 16
    TabOrder = 6
    Visible = False
  end
end
