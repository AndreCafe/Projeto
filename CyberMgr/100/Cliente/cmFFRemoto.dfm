object dmFFRemoto: TdmFFRemoto
  OldCreateOrder = False
  Left = 215
  Top = 132
  Height = 211
  Width = 400
  object ffRSE: TFFRemoteServerEngine
    Transport = ffLT
    Left = 16
    Top = 16
  end
  object ffLT: TffLegacyTransport
    Enabled = True
    Protocol = ptTCPIP
    Left = 64
    Top = 16
  end
end
