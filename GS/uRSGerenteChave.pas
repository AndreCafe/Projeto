unit uRSGerenteChave;

interface

uses SyncObjs, Windows, Classes;

type

  TGerenteChave = Class
  private
  
  
  public
    constructor Create(const aServerIP: String);
    
    function CriaChave(const aLoja, aTipo: Integer; const aVenc: TDateTime; const aCodEquip, aUsuario, aObs: String): String;
    function CriaChaveTeste(const aLoja: Integer; const aCodEquip, aUsuario, aObs: String): String;
    procedure AlteraCodEquip(const aLoja: Integer; const aNovoEquip, aUsuario: String);
    procedure InativaChave(const aChave: String; const aUsuario, aObs: String);
    procedure ProrrogaChave(const aChave: String; const aNovoVenc: TDateTime; const aUsuario, aObs: String);
    procedure BloqueiaCliente(const aLoja: Integer; const aUsuario, aObs: String);
    procedure TrocaTipoChave(const aChave: String; const aNovoTipo: Integer; const aUsuario, aObs: String);
  End;

implementation

{ TGerenteChave }

procedure TGerenteChave.AlteraCodEquip(const aLoja: Integer; const aNovoEquip,
  aUsuario: String);
begin

end;

procedure TGerenteChave.BloqueiaCliente(const aLoja: Integer; const aUsuario,
  aObs: String);
begin

end;

constructor TGerenteChave.Create(const aServerIP: String);
begin

end;

function TGerenteChave.CriaChave(const aLoja, aTipo: Integer;
  const aVenc: TDateTime; const aCodEquip, aUsuario, aObs: String): String;
begin

end;

function TGerenteChave.CriaChaveTeste(const aLoja: Integer; const aCodEquip,
  aUsuario, aObs: String): String;
begin

end;

procedure TGerenteChave.InativaChave(const aChave, aUsuario, aObs: String);
begin

end;

procedure TGerenteChave.ProrrogaChave(const aChave: String;
  const aNovoVenc: TDateTime; const aUsuario, aObs: String);
begin

end;

procedure TGerenteChave.TrocaTipoChave(const aChave: String;
  const aNovoTipo: Integer; const aUsuario, aObs: String);
begin

end;

end.
