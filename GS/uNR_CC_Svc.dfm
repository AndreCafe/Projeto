object RegistroNextar_SalvaChecaConta: TRegistroNextar_SalvaChecaConta
  OldCreateOrder = False
  AllowPause = False
  Dependencies = <
    item
      Name = 'RegistroNextar_DBServ'
      IsGroup = False
    end>
  DisplayName = 'Registro Nextar - Salva Checa Conta'
  OnExecute = ServiceExecute
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 234
  Width = 297
end
