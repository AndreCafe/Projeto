unit ncServReg;

interface

uses
  Classes,
  ncCompCliente;

procedure Register;

implementation


procedure Register;
begin
  RegisterComponents('NexCafe', [TClienteNexCafe]);
end;

end.
