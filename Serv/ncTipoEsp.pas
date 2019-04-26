unit ncTipoEsp;

interface

uses
  SysUtils,
  DB,
  MD5,
  Dialogs,
  Classes,
  Windows,
  ClasseCS,
  ncClassesBase;

const
  tipoesp_dinheiro     = 0;
  tipoesp_cheque       = 1;
  tipoesp_cartao       = 2;
  tipoesp_outros       = 3;

type  

  TncTipoEsp = class ( TncClasse )
    FID   : Integer;
    FTipo : Byte;
    FNome : String;
    FImg  : Integer;
    FTrocoPermitido : Boolean;
  protected 
    function GetChave: Variant; override;
  public
    constructor Create; override;
    function TipoClasse: Integer; override;
  published
    property ID: Integer
      read FID write FID;

    property Tipo: Byte
      read FTipo write FTipo;

    property Nome: String
      read FNome write FNome;
          
    property Img: Integer
      read FImg write FImg;

    property TrocoPermitido: Boolean
      read FTrocoPermitido write FTrocoPermitido;  
  end;

  TncTiposEsp = class ( TListaClasseCS )
  private
    function GetTipoEsp(I: Integer): TncTipoEsp;
    function GetPorID(aID: Integer): TncTipoEsp;
  public
    property Itens[I: Integer]: TncTipoEsp
      read GetTipoEsp;

    property PorID[aID: Integer]: TncTipoEsp
      read GetPorID;   
  end;   

var
  gTiposEsp : TncTiposEsp;
  

    

implementation

{ TncTipoEsp }

constructor TncTipoEsp.Create;
begin
  inherited;
  FID   := 0;
  FTipo := 0;
  FNome := '';
  FImg  := 0;
  FTrocoPermitido := False;
end;

function TncTipoEsp.GetChave: Variant;
begin
  Result := FID;
end;

function TncTipoEsp.TipoClasse: Integer;
begin
  tcTipoEsp;
end;

initialization
  gTiposEsp := TncTiposEsp.Create;

finalization
  gTiposEsp.Free;  

end.
