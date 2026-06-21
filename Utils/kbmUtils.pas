unit kbmUtils;

{ Essa unit define a estrutura e formato binario das MemTables usadas para
  armazenar informações do dicionário }

interface

uses
  DB,
  Classes,
  Variants,
  SysUtils,
  kbmMWStreamFormat,
  kbmMWBinaryStreamFormat,
  kbmMemTable;

type

  TkbmuFieldDef = packed record
    fdName  : String[20];
    fdType  : TFieldType;
    fdSize  : Integer;
    fdPrec  : Integer;
  end;

  procedure CreateFields(ATable: TkbmMemTable; AFields: Array of TkbmuFieldDef);

  function CreateMemTable(AOwner: TComponent): TkbmMemTable;

  function CreateMemTableAndFields(AOwner: TComponent; AFields : Array of TkbmuFieldDef): TkbmMemTable;

{  lthModules_Fields : Array[0..3] of TkbmuFieldDef = (
    (fdName:'ID';           fdType: ftInteger;   fdSize:0;    fdPrec:0),
    (fdName:'Parent';       fdType: ftInteger;   fdSize:0;    fdPrec:0),
    (fdName:'Name';         fdType: ftString;    fdSize:100;  fdPrec:0),
    (fdName:'Description';  fdType: ftString;    fdSize:255;  fdPrec:0));}
    
implementation

procedure CreateFields(ATable: TkbmMemTable; AFields: Array of TkbmuFieldDef);
var
  I : Integer;
begin
  ATable.Active := False;
  for I := 0 to High(AFields) do
  with ATable.FieldDefs.AddFieldDef do begin
    Name      := AFields[I].fdName;
    DataType  := AFields[I].fdType;
    Size      := AFields[I].fdSize;
    Precision := AFields[I].fdPrec;
  end;
  ATable.Active := True;
end;

function CreateMemTable(AOwner: TComponent): TkbmMemTable;
begin
  Result := TkbmMemTable.Create(AOwner);
  Result.AllDataFormat := TkbmMWBinaryStreamFormat.Create(Result);
  TkbmMWBinaryStreamFormat(Result.AllDataFormat).sfLargeFields := [sfSaveLargeFields];
end;

function CreateMemTableAndFields(AOwner: TComponent; AFields : Array of TkbmuFieldDef): TkbmMemTable;
begin
  Result := CreateMemTable(AOwner);
  CreateFields(Result, AFields);
end;

end.
