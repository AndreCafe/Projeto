object FrmImpNX2: TFrmImpNX2
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  BorderWidth = 10
  Caption = 'Convers'#227'o de Banco de Dados'
  ClientHeight = 222
  ClientWidth = 491
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
  object PB: TcxProgressBar
    Left = 0
    Top = 26
    Style.BorderStyle = ebsFlat
    TabOrder = 0
    Width = 489
  end
  object cxLabel1: TcxLabel
    Left = 56
    Top = 3
    Caption = 
      'Aguarde alguns minutos. Convertendo formato de banco de dados ..' +
      '.'
    Style.TextStyle = [fsBold]
  end
  object clb: TCheckListBox
    Left = 0
    Top = 89
    Width = 491
    Height = 133
    Align = alBottom
    Color = clBtnFace
    Columns = 4
    ItemHeight = 13
    Items.Strings = (
      'Aviso'
      'Caixa'
      'Categoria'
      'Chat'
      'Cliente'
      'Config'
      'Debito'
      'EmailCorpo'
      'EmailCriar'
      'EmailEnvio'
      'Espera'
      'ETar'
      'FiltroWeb'
      'HCred'
      'HPass'
      'HTar'
      'Impressao'
      'ITran'
      'Layout'
      'Log'
      'Maquina'
      'MovEst'
      'Ocupacao'
      'Pacote'
      'Passaporte'
      'Processos'
      'Produto'
      'Recibo'
      'Sessao'
      'Tarifa'
      'Tempo'
      'TipoAcesso'
      'TipoImp'
      'TipoPass'
      'Tran'
      'Usuario')
    TabOrder = 2
  end
  object lbArq: TcxLabel
    Left = 0
    Top = 53
    Caption = 'Convertendo arquivo: "Aviso"'
    Style.TextStyle = []
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 256
    Top = 56
  end
  object nxSE: TnxSession
    UserName = 'admin'
    Password = 'delphi9856'
    Left = 384
    Top = 56
  end
  object nxDB: TnxDatabase
    Session = nxSE
    AliasName = 'NexCafe'
    Left = 344
    Top = 56
  end
  object Tab: TnxTable
    Database = nxDB
    Left = 304
    Top = 56
  end
end
