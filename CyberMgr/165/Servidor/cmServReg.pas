unit cmServReg;

interface

uses
  Classes,
  cmServRemoto,
  cmServBase,
  cmCompCliente,
  cmServCom;

procedure Register;

implementation


procedure Register;
begin
  RegisterComponents('CyberMgr', [TCMServidor, TClienteCyberMgr, TCMServidorRemoto, TCMServComunicacao]);
end;

end.
