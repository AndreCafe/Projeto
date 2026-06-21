object RegistroNextar_MWServer: TRegistroNextar_MWServer
  OldCreateOrder = False
  AllowPause = False
  Dependencies = <
    item
      Name = 'RegistroNextar_DBServ'
      IsGroup = False
    end>
  DisplayName = 'Registro Nextar - MW Server'
  OnExecute = ServiceExecute
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 234
  Width = 297
end
