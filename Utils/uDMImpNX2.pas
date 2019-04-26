unit uDMImpNX2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDMBaseImpNX2, nxdb, DB, nxseAutoComponent, nxllComponent,
  nxsdServerEngine, nxsrServerEngine;

type
  TdmImpNX2 = class(TdmBaseImpNX2)
    nxSEng: TnxServerEngine;
    nx1xAllEngines1: Tnx1xAllEngines;
    nxSE: TnxSession;
    Tab: TnxTable;
    nxDB: TnxDatabase;
  private
    { Private declarations }
    FAndamento : TAndamento;
  public
    procedure Inicializa(PathDB: String); override;
    procedure Importa(aNomeTab: String; aDestino: TDataset; aAndamento: TAndamento); override;
    { Public declarations }
  end;

var
  dmImpNX2: TdmImpNX2;

implementation

{$R *.dfm}

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

procedure TdmImpNX2.Importa(aNomeTab: String; aDestino: TDataset; aAndamento: TAndamento);
var T, I: Integer;
begin
  FAndamento := aAndamento;
  Tab.Active := False;
  Tab.TableName := aNomeTab;
  
  if SameText(aNomeTab, 'plusP') or
     SameText(aNomeTab, 'plusT') then
    Tab.Password := 'CEWk4jhsad3f' else
    Tab.Password := '';
     
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

procedure TdmImpNX2.Inicializa(PathDB: String);
begin
  nxDB.AliasPath := PathDB;
  nxDB.Active := True;
end;


end.
