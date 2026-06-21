object RegistroNextar: TRegistroNextar
  OldCreateOrder = False
  AllowPause = False
  Dependencies = <
    item
      Name = 'nxDBServer'
      IsGroup = False
    end>
  DisplayName = 'Registro Nextar'
  OnExecute = ServiceExecute
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 150
  Width = 215
end
