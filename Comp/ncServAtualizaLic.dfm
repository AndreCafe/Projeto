object dmAtualizaLic: TdmAtualizaLic
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 187
  Width = 570
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 136
    Top = 16
  end
  object HC: TRtcHttpClient
    ServerAddr = 'contas.nextar.com.br'
    ServerPort = '80'
    OnConnect = HCConnect
    ReconnectOn.ConnectLost = True
    OnConnectFail = HCConnectFail
    OnConnectError = HCConnectError
    AutoConnect = True
    UseProxy = True
    Left = 48
    Top = 120
  end
  object rcmApp: TRtcClientModule
    AutoSyncEvents = True
    Client = HC
    AutoRepost = 2
    ModuleFileName = '/app'
    Left = 104
    Top = 120
  end
  object resChecaConta: TRtcResult
    OnReturn = resChecaContaReturn
    RequestAborted = resChecaContaRequestAborted
    Left = 168
    Top = 120
  end
  object resAtivar: TRtcResult
    OnReturn = resChecaContaReturn
    RequestAborted = resChecaContaRequestAborted
    Left = 248
    Top = 120
  end
  object res: TRtcResult
    OnReturn = resChecaContaReturn
    RequestAborted = resChecaContaRequestAborted
    Left = 328
    Top = 120
  end
end
