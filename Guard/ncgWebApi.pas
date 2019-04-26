unit ncgWebApi;

interface

uses SysUtils, Windows, ExtActns, Automation, EmbeddedWB, SHFolder, Classes, Forms, ncBaseWebApi;

type

  TncgWebApi = class ( TncBaseWebApi )
  published
    function ServerIP: OleVariant; override;
    function UsernameFunc: OleVariant; override;
    function UserAdmin: OleVariant; override;
  end;
  
implementation

uses ncgFrmPri, ncSessao, ncClassesBase;

{ TncgWebApi }

function TncgWebApi.UserAdmin: OleVariant;
var 
  S: TncSessao;
  U: TncUsuario;
begin
  Result := 0;
  try
    S := FrmPri.CM.SessaoMaq;
    if  (S<>nil) and (S.TipoCli=tcManutencao) then begin
      U := FrmPri.CM.Usuarios.PorUsername[S.FuncI];
      if (U<>nil) and U.Admin then
        Result := 1;
    end;
  except
  end;
end;

function TncgWebApi.ServerIP: OleVariant;
begin
  try
    Result := FrmPri.nxTCPIP.ServerName;
  except
    Result := '';
  end;
end;

function TncgWebApi.UsernameFunc: OleVariant;
var 
  S: TncSessao;
  U: TncUsuario;
begin
  Result := '';
  try
    S := FrmPri.CM.SessaoMaq;
    if (S<>nil) then
      Result := S.FuncI;
  except
  end;
end;

end.
