unit cmServReg;

interface

uses
  Classes,
  cmServRemoto,
  cmServBase,
  cmCompCliente,
  cmProtecao98,
  cmServCom;

procedure Register;

implementation


procedure Register;
begin
  RegisterComponents('CyberMgr', [TCMServidor, TCMProtege98, TClienteCyberMgr, TCMServidorRemoto, TCMServComunicacao]);
end;

end.
