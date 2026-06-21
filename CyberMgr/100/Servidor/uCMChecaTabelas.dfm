object FrmChecaBD: TFrmChecaBD
  Left = 216
  Top = 154
  BorderStyle = bsDialog
  Caption = 'Aguarde'
  ClientHeight = 96
  ClientWidth = 363
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LMDSimplePanel1: TLMDSimplePanel
    Left = 0
    Top = 0
    Width = 363
    Height = 52
    UseDockManager = False
    Align = alTop
    Bevel.BorderColor = clWhite
    Bevel.BorderSides = [fsBottom]
    Bevel.BorderInnerWidth = 3
    Bevel.Mode = bmEdge
    Color = clWhite
    TabOrder = 0
    object Image1: TImage
      Left = 8
      Top = 8
      Width = 32
      Height = 32
      AutoSize = True
      Picture.Data = {
        055449636F6E0000010001002020100000000000E80200001600000028000000
        2000000040000000010004000000000080020000000000000000000000000000
        0000000000000000000080000080000000808000800000008000800080800000
        80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF00000000000000000000000000000000000007F8888888888888870000
        000000000007F8888888888888877000000000000007F88A8888777778877000
        000000000007FFFFFFFFFFFFFFF7700000000000000077777777777777787000
        0000000000000700000000000077800000000000000007F88888888887077000
        00000000000007F6666666668770000000000000000007F666E6E66687708888
        88877000000007F6686E6E668770888888877700000007F66886E66687708888
        88877770000007F668886E668770888888877770000007F66666666687708888
        88877770000007F6666666668770888888877770000007FFFFFFFFFFF7708888
        8887777077777778888888888F7088888887777078FFFFF78888888888F0FFFF
        FFF8777078F7777F77777777777777777770877078FFFFFFFFFFF70007888888
        8887087078F7777F7777F700078888888887708078FFFFFFFFFFF70007888888
        8887770078F7777F7777F70007FFFFFFFFF8777078FFFFFFFFFFF70007777777
        7770877078777777777777000788888888870870787776CCCCCF670007888888
        8887708078888888888887000788888888877700777777777777777007FFFFFF
        FFF7777000000000000000000078888888887770000000000000000000078888
        8888877000000000000000000000788888888870000000000000000000000777
        7777777FF0000FFFE00007FFE00003FFE00003FFE00003FFF00003FFF80003FF
        F80007FFF8000007F8000003F8000001F8000000F8000000F8000000F8000000
        0000000000000000000000000000000000018000000180000001800000018000
        0001800000018000000180000001800000018000FFFFC000FFFFE000FFFFF000
        FFFFF800}
    end
    object Label4: TLabel
      Left = 48
      Top = 8
      Width = 179
      Height = 13
      Caption = 'Checando tabelas do Cyber-Manager'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbProgresso: TLabel
      Left = 48
      Top = 27
      Width = 12
      Height = 13
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbOk: TLabel
      Left = 336
      Top = 5
      Width = 22
      Height = 42
      Align = alRight
      Caption = 'Ok'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
  end
  object panProgresso: TPanel
    Left = 0
    Top = 52
    Width = 363
    Height = 45
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    object Progresso: TProgressBar
      Left = 8
      Top = 14
      Width = 345
      Height = 16
      Min = 0
      Max = 100
      Smooth = True
      Step = 1
      TabOrder = 0
    end
  end
  object FFTblMgr: TAsgFFTableManager
    ItemMapping = optMapByName
    BeAggressive = True
    DoRestructureTable = True
    DoCreateTable = True
    BackupMode = optNoBackup
    OnWantedDictionary = FFTblMgrWantedDictionary
    OnPause = FFTblMgrPause
    OnStartProgressDisplay = FFTblMgrStartProgressDisplay
    OnUpdateProgressDisplay = FFTblMgrUpdateProgressDisplay
    Left = 128
    Top = 24
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 184
    Top = 24
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer2Timer
    Left = 240
    Top = 24
  end
  object ffCli: TffClient
    AutoClientName = True
    ClientName = 'FFClient_864773680'
    Left = 288
    Top = 24
  end
  object ffSession: TffSession
    AutoSessionName = True
    ClientName = 'FFClient_864773680'
    SessionName = 'FFSession_90147318'
    Left = 64
    Top = 24
  end
  object ffDB: TffDatabase
    SessionName = 'FFSession_90147318'
    Left = 16
    Top = 24
  end
end
