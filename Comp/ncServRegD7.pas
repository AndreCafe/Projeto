unit ncServRegD7;

interface

uses
  Classes,
  ncServRemoto,
  ncCompCliente;

procedure Register;

implementation


procedure Register;
begin
  RegisterComponents('NexCafe', [TClienteNexCafe, TncServidorRemoto]);
end;

end.
