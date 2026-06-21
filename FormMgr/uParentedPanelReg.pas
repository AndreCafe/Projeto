unit uParentedPanelReg;

interface

uses Classes;

procedure Register;

implementation

uses
  uParentedPanel;

procedure Register;
begin
  RegisterComponents('Parented Panel', [TParentedPanel]);
end;

end.
