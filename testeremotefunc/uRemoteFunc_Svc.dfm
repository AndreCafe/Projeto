object RemoteFunc: TRemoteFunc
  OldCreateOrder = False
  OnDestroy = ServiceDestroy
  AllowPause = False
  DisplayName = 'RemoteFunc'
  AfterInstall = ServiceAfterInstall
  OnExecute = ServiceExecute
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 234
  Width = 297
end
