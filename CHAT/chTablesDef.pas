unit chTablesDef;

interface

uses
  DB,
  Classes,
  Variants,
  SysUtils,
  kbmMWBinaryStreamFormat,
  kbmMemTable;

type

  TchFieldDef = packed record
    fdName  : String[20];
    fdType  : TFieldType;
    fdSize  : Integer;
    fdPrec  : Integer;
  end;

  procedure CreateFields(ATable: TkbmMemTable; AFields: Array of TchFieldDef);

  function CreateMemTable(AOwner: TComponent): TkbmMemTable;

  function CreateMemTableAndFields(AOwner: TComponent; AFields : Array of TchFieldDef): TkbmMemTable;

const

{
    (fdName:'';   fdType: ft; fdSize:0;  fdPrec:0),
}

  chContatos : Array[0..2] of TchFieldDef = (
    (fdName:'Username';     fdType: ftString;    fdSize:30;  fdPrec:0),
    (fdName:'Nome';         fdType: ftString;    fdSize:50;  fdPrec:0),  
    (fdName:'Nodes';        fdType: ftInteger;   fdSize:0;   fdPrec:0));

  chNodes : Array[0..5] of TchFieldDef = (
    (fdName:'NodeID';       fdType: ftString;    fdSize:60;  fdPrec:0),
    (fdName:'Username';     fdType: ftString;    fdSize:30;  fdPrec:0),
    (fdName:'Nome';         fdType: ftString;    fdSize:50;  fdPrec:0),
    (fdName:'Status';       fdType: ftString;    fdSize:30;  fdPrec:0), 
    (fdName:'Tipo';         fdType: ftWord;      fdSize:0;   fdPrec:0), 
    (fdName:'IP';           fdType: ftString;    fdSize:20;  fdPrec:0));

implementation                                          

procedure CreateFields(ATable: TkbmMemTable; AFields: Array of TchFieldDef);
var I : Integer;
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
end;

function CreateMemTableAndFields(AOwner: TComponent; AFields : Array of TchFieldDef): TkbmMemTable;
begin
  Result := CreateMemTable(AOwner);
  CreateFields(Result, AFields);
end;

end.
