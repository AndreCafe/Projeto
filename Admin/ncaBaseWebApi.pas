unit ncaBaseWebApi;
{
    ResourceString: Dario 10/03/13 Achou nada
}

interface

uses SysUtils, Windows, ExtActns, Automation, EmbeddedWB, SHFolder, Classes, Forms, ncBaseWebApi;

type

  TncAdminBaseWebApi = class ( TncBaseWebApi )
    function ServerIP: OleVariant; override;
    function UsernameFunc: OleVariant; override;
    function UserAdmin: OleVariant; override;
    function CloseApp: OleVariant; override;
  end;

implementation

uses ncaDM, ncaFrmPri;

{ TncAdminBaseWebApi }

function TncAdminBaseWebApi.UserAdmin: OleVariant;
begin
  Result := Dados.CM.UA.Admin;
end;

function TncAdminBaseWebApi.CloseApp: OleVariant;
begin
  Result := 1;
  FrmPri.Close;
end;

function TncAdminBaseWebApi.ServerIP: OleVariant;
begin
  Result := Dados.nxTCPIP.ServerName;
end;

function TncAdminBaseWebApi.UsernameFunc: OleVariant;
begin
  Result := Dados.CM.UA.Username;
end;

end.
