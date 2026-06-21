object RegistroServ: TRegistroServ
  OldCreateOrder = False
  AllowPause = False
  Dependencies = <
    item
      Name = 'nxDBServer'
      IsGroup = False
    end>
  DisplayName = 'Registro CyberSoft'
  OnExecute = ServiceExecute
  OnStart = ServiceStart
  OnStop = ServiceStop
  Left = 65534
  Top = 103
  Height = 150
  Width = 215
end
