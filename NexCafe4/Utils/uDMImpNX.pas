unit uDMImpNX;

interface

uses
  SysUtils, Classes, nxseAutoComponent, nxllComponent, nxsdServerEngine,
  nxsrServerEngine, nxdb, DB, nx1xAutoComponent;

type
  TAndamento = procedure ( Total, Atual: Integer ) of object;

  
  TdmImpNX = class(TDataModule)
    nxSEng: TnxServerEngine;
    nx1xAllEngines1: Tnx1xAllEngines;
    nxSE: TnxSession;
    Tab: TnxTable;
    nxDB: TnxDatabase;
    nxSession1: TnxSession;
  private
    { Private declarations }
    FAndamento: TAndamento;
  public
    procedure Inicializa(PathDB: String);
    procedure Importa(aNomeTab: String; aDestino: TDataset; aAndamento: TAndamento);
    { Public declarations }
  end;

var
  dmImpNX: TdmImpNX;

implementation

{$R *.dfm}

{ TdmImpNX }

procedure TransfDados(TF, TD: TDataset);
var 
  I : Integer;
  F : TField;
begin
  with TD do
  for I := 0 to pred(Fields.Count) do with Fields[I] do 
  if (FieldKind=fkData) then begin
    F := TF.FindField(FieldName);
    if (F <> nil) and (F.FieldKind=fkData) then 
      Value := F.Value;
  end;
end;

procedure TdmImpNX.Importa(aNomeTab: String; aDestino: TDataset; aAndamento: TAndamento);
var T, I: Integer;
begin
  FAndamento := aAndamento;
  Tab.Active := False;
  Tab.TableName := aNomeTab;
  Tab.Active := True;
  try
    T := Tab.RecordCount;
    aDestino.Active := True;
    I := 0;
    while not Tab.Eof do begin
      aDestino.Insert;
      TransfDados(Tab, aDestino);                                
      aDestino.Post;
      Tab.Next;
      Inc(I);
      if Assigned(FAndamento) then
        FAndamento(T, I);
    end;
  finally
    Tab.Active := False;
  end;
  
end;

procedure TdmImpNX.Inicializa(PathDB: String);
begin
  nxDB.AliasPath := PathDB;
  nxDB.Active := True;
end;

end.
