object RegistroNextar_WebServer: TRegistroNextar_WebServer
  OldCreateOrder = False
  AllowPause = False
  Dependencies = <
    item
      Name = 'RegistroNextar_DBServ'
      IsGroup = False
    end>
  DisplayName = 'Registro Nextar - Web Server'
  OnExecute = ServiceExecute
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 234
  Width = 297
end
