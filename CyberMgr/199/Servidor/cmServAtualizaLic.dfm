object dmAtualizaLic: TdmAtualizaLic
  OldCreateOrder = False
  Left = 385
  Top = 352
  Height = 169
  Width = 297
  object mwCli: TkbmMWSimpleClient
    Transport = mwTransp
    Left = 40
    Top = 16
  end
  object mwTransp: TkbmMWTCPIPIndyClientTransport
    Active = False
    Port = 3000
    Host = '127.0.0.1'
    StreamFormat = 'STANDARD'
    VerifyTransfer = False
    MaxRetries = 0
    MaxRetriesAlternative = 0
    RequestTimeout = 30
    MinClientPort = 0
    MaxClientPort = 0
    ConnectTimeout = 60
    Left = 88
    Top = 16
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 136
    Top = 16
  end
end
