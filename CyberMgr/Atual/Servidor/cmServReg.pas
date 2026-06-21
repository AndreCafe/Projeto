unit cmServReg;

interface

uses
  Classes,
  nxcCliente,
  cmServRemoto,
  cmServBase,
  cmCompCliente,
  cmProtecao98,
  cmServCom;

procedure Register;

implementation


procedure Register;
begin
  RegisterComponents('CyberMgr', [TCMServidor, TCMProtege98, TClienteCyberMgr, TCMServidorRemoto, TCMServComunicacao, TnxcCliente]);
end;

end.
