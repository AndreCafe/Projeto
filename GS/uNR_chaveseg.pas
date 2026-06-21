unit uNR_chaveseg;
{
    ResourceString: Dario 13/03/13
}

interface

uses sysutils, classes, md5, SyncObjs, Windows;

type

   Tchaves = class
   private  
     FItens : TStrings;
     FCS    : TCriticalSection;
     procedure DeletaChavesAntigas;
   public
     constructor Create;
     destructor Destroy;

     function NovaChave: String;
     function ValidaChave(aChave, aSenha: String): Boolean;
   end;

function gerasenhaseg(achave: string): string;

procedure InicializaGChaves;

var
  gChaves : TChaves;

implementation


function gerasenhaseg(achave: string): string;
begin
  Result := getmd5str('>LKHASDIUywefd7kdsf_)(*!@Tkjhasfdkxzxxx7777!38213zxc%nbv'+aChave); // do not localize
end;

procedure InicializaGChaves;
begin
  if gChaves=nil then gChaves := TChaves.Create;
end;

{ Tchaves }

constructor Tchaves.Create;
begin
  FCS := TCriticalSection.Create;
  FItens := TStringList.Create;
end;

procedure Tchaves.DeletaChavesAntigas;
var Corte : Cardinal;
begin
  Corte := GetTickCount - 120000;
  while (FItens.Count>0) and (Cardinal(FItens.Objects[0])<Corte) do FItens.Delete(0);
end;

destructor Tchaves.Destroy;
begin
  FItens.Free;
  FCS.Free;
  inherited;
end;

function Tchaves.NovaChave: String;
begin
  Result := IntToStr(Random(High(Integer))) + IntToStr(Random(High(Integer)));
  FCS.Enter;
  try
    DeletaChavesAntigas;
    FItens.AddObject(Result, TObject(GetTickCount));
  finally
    FCS.Leave;
  end;
end;

function Tchaves.ValidaChave(aChave, aSenha: String): Boolean;
var I : Integer;
begin
  Result := False;
  FCS.Enter;
  try
    DeletaChavesAntigas;
    I := FItens.IndexOf(aChave);
    if I>=0 then FItens.Delete(I);
    Result := (I>=0) and (aSenha=GeraSenhaSeg(aChave));
  finally
    FCS.Leave;
  end;
end;

initialization 
  Randomize;
  gChaves := nil;

finalization
  if Assigned(gChaves) then 
    FreeAndNil(gChaves);

end.

