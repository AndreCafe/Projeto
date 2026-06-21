object RegistroNextar_Email: TRegistroNextar_Email
  OldCreateOrder = False
  AllowPause = False
  Dependencies = <
    item
      Name = 'RegistroNextar_DBServ'
      IsGroup = False
    end>
  DisplayName = 'Registro Nextar - Email'
  OnExecute = ServiceExecute
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 234
  Width = 297
end
