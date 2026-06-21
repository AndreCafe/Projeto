unit uNexusDBUtils;

interface

uses  
  Variants,
  nxsdNativeVariantConverter,
  SysUtils,
  nxsdTypes,
  nxllTypes,
  nxllUtils,
  nxllMemoryManager,
  nxsqlProxies,
  nxsdDataDictionary,
  nxsdServerEngine,
  nxsrServerEngine;
  
type
  TnxNativeField = object
  private
    nfOldData        : PnxByteArray;
    nfNewData        : PnxByteArray;
    nfOffSet         : Integer;
    nfField          : Integer;
    nfLen            : Integer;
    nfLogRecLenAlign : Integer;
    function GetNewNull: Boolean;
    function GetOldNull: Boolean;
    procedure SetNewNull(const Value: Boolean);
    procedure SetOldNull(const Value: Boolean);
  protected
    function NewData: PnxByteArray;
    function OldData: PnxByteArray;
  public  
    function FieldType: TnxFieldType; virtual;

    property OldNull: Boolean
      read GetOldNull write SetOldNull;
      
    property NewNull: Boolean
      read GetNewNull write SetNewNull;
    
    function Changed: Boolean;
  end;

  TnxBooleanField = object (TnxNativeField)
  private
    function GetNewValue: Boolean;
    procedure SetNewValue(const Value: Boolean);
  public
    function FieldType: TnxFieldType; virtual;
    function OldValue : Boolean;

    property NewValue: Boolean
      read GetNewValue write SetNewValue;
  end;
  
  TnxCharField = object (TnxNativeField)
  private
    function GetNewValue: Char;
    procedure SetNewValue(const Value: Char);
  public
    function FieldType: TnxFieldType; virtual;
    function OldValue: Char;
    property NewValue: Char
      read GetNewValue write SetNewValue;
  end;

  TnxByteField = object (TnxNativeField)
  private
    function GetNewValue: Byte;
    procedure SetNewValue(const Value: Byte);
  public
    function FieldType: TnxFieldType; virtual;
    function OldValue: Byte;
    property NewValue: Byte
      read GetNewValue write SetNewValue;
  end;
  
  TnxWord16Field = object ( TnxNativeField )
  private
    function GetNewValue: TnxWord16;
    procedure SetNewValue(const Value: TnxWord16);
  public
    function FieldType: TnxFieldType; virtual;

    function OldValue: TnxWord16;
    
    property NewValue: TnxWord16
      read GetNewValue write SetNewValue;
  end;

  TnxWord32Field = object ( TnxNativeField ) 
  private
    function GetNewValue: TnxWord32;
    procedure SetNewValue(const Value: TnxWord32);
  public
    function FieldType: TnxFieldType; virtual;

    function OldValue: TnxWord32;
    property NewValue: TnxWord32
      read GetNewValue write SetNewValue;
  end;
     
  TnxInt8Field = object ( TnxNativeField )
  private
    function GetNewValue: TnxInt8;
    procedure SetNewValue(const Value: TnxInt8);
  public
    function FieldType: TnxFieldType; virtual;

    function OldValue: TnxInt8;
    property NewValue: TnxInt8
      read GetNewValue write SetNewValue;
  end;  

  TnxInt16Field = object ( TnxNativeField )
  private
    function GetNewValue: TnxInt16;
    procedure SetNewValue(const Value: TnxInt16);
  public
    function FieldType: TnxFieldType; virtual;

    function OldValue: TnxInt16;
    property NewValue : TnxInt16 
      read GetNewValue write SetNewValue;
  end;
  
  TnxInt32Field = object ( TnxNativeField )
  private
    function GetNewValue: TnxInt32;
    procedure SetNewValue(const Value: TnxInt32);
  public
    function FieldType: TnxFieldType; virtual;

    function OldValue: TnxInt32;
    property NewValue: TnxInt32
      read GetNewValue write SetNewValue;
  end;
  
  TnxInt64Field = object ( TnxNativeField )
  private
    function GetNewValue: TnxInt64;
    procedure SetNewValue(const Value: TnxInt64);
  public
    function FieldType: TnxFieldType; virtual;
  
    function OldValue: TnxInt64;
    property NewValue: TnxInt64
      read GetNewValue write SetNewValue;
  end;
  
  TnxAutoIncField = object ( TnxWord32Field )
  public
    function FieldType: TnxFieldType; virtual;
  end;
  
  TnxSingleField = object ( TnxNativeField )
  private
    function GetNewValue: TnxSingle;
    procedure SetNewValue(const Value: TnxSingle);
  public
    function FieldType: TnxFieldType; virtual;

    function OldValue: TnxSingle;
    property NewValue: TnxSingle
      read GetNewValue write SetNewValue;
  end;
  
  TnxDoubleField = object ( TnxNativeField )
  private
    function GetNewValue: TnxDouble;
    procedure SetNewValue(const Value: TnxDouble);
  public
    function FieldType: TnxFieldType; virtual;

    function OldValue: TnxDouble;
    property NewValue: TnxDouble
      read GetNewValue write SetNewValue;
  end;
  
  TnxExtendedField = object ( TnxNativeField )
  private
    function GetNewValue: TnxExtended;
    procedure SetNewValue(const Value: TnxExtended);
  public
    function FieldType: TnxFieldType; virtual;

    function OldValue: TnxExtended;
    property NewValue: TnxExtended
      read GetNewValue write SetNewValue;
  end;
  
  TnxCurrencyField = object ( TnxNativeField )
  private
    function GetNewValue: TnxCurrency;
    procedure SetNewValue(const Value: TnxCurrency);
  public
    function FieldType: TnxFieldType; virtual;

    function OldValue : TnxCurrency;
    property NewValue : TnxCurrency
      read GetNewValue write SetNewValue;
  end;
  
  TnxDateField = object ( TnxNativeField )
  private
    function GetNewValue: TnxDate;
    procedure SetNewValue(const Value: TnxDate);
  public
    function FieldType: TnxFieldType; virtual;

    function OldValue : TnxDate;
    property NewValue : TnxDate
      read GetNewValue write SetNewValue;
  end;
  
  TnxTimeField = object ( TnxNativeField )
  private
    function GetNewValue: TnxTime;
    procedure SetNewValue(const Value: TnxTime);
  public
    function FieldType: TnxFieldType; virtual;

    function OldValue: TnxTime;
    property NewValue: TnxTime
      read GetNewValue write SetNewValue;
  end;
  
  TnxDateTimeField = object ( TnxNativeField )
  private
    function GetNewValue: TnxDateTime;
    procedure SetNewValue(const Value: TnxDateTime);
  public
    function FieldType: TnxFieldType; virtual;

    function OldValue: TnxDateTime;

    property NewValue: TnxDateTime
      read GetNewValue write SetNewValue;
  end;
  
  TnxShortStringField = object ( TnxNativeField )
  private
    function GetNewValue: ShortString;
    procedure SetNewValue(const Value: ShortString);
  public
    function FieldType: TnxFieldType; virtual;

    function OldValue : ShortString;

    property NewValue: ShortString
      read GetNewValue write SetNewValue;
  end;
  
  TnxNullStringField = object ( TnxNativeField )
  private
    function GetNewValue: String;
    procedure SetNewValue(const Value: String);
  public
    function FieldType: TnxFieldType; virtual;

    function OldData: String;
    property NewValue: String
      read GetNewValue write SetNewValue;

  end;

  TnxHelpCursor = class
  private
    FOpenMode : Boolean;
    FActive : Boolean;
    FDB : TnxServerDatabase;
    FName : String;
    procedure SetActive(const Value: Boolean);
  public
    FBuffer : PnxByteArray;
    FOldData : PnxByteArray;
    FNewData : PnxByteArray;
    FKeyData1 : PnxByteArray;
    FKeyData2 : PnxByteArray;
    FCursor : TnxServerBaseCursor;
    FDictionary : TnxDataDictionary;

    constructor Create(aOldData, aNewData, aKey1, aKey2: PnxByteArray; aCursor: TnxServerBaseCursor);
    constructor CreateOpen(aName: String; aDB: TnxServerDatabase);
    destructor Destroy; override;

    function GetValue(aFieldName: String; aData: PnxByteArray; aDefValue: Variant): Variant;
    
    function NewValue(aFieldName: String; aDefValue: Variant): Variant;
    function OldValue(aFieldName: String; aDefValue: Variant): Variant;
    procedure SetValueCustom(aFieldName: String; aValue: Variant; aData: PnxByteArray);
    procedure SetValue(aFieldName: String; aValue: Variant);
    procedure SetKey1(aFieldName: String; aValue: Variant);
    procedure SetKey2(aFieldName: String; aValue: Variant);
    function GetNext: Boolean;

    procedure ModifyNewData;
    procedure InsertNewData;
    procedure DeleteRec;
    function FindKey(aCount: Integer): Boolean;
    function SelIndex(aName: String): Boolean;
    function SetRange(aCount: Integer; aKeyExcl: Boolean=True): Boolean;

    procedure InitRecord(var aData: PnxByteArray);

    property Dict: TnxDataDictionary
      read FDictionary;

    property Active: Boolean
      read FActive write SetActive;

    property Cursor: TnxServerBaseCursor
      read FCursor;

    property NewData: PnxByteArray
      read FNewData;  
  end;

  function nxLoadFieldDef(var Field: TnxNativeField; aName: String; aDict: TnxDataDictionary; aOldData, aNewData: PnxByteArray): Boolean;
  
  
implementation

{ TnxBooleanField }

type
  THackFields = class(TnxFieldsDescriptor);

function nxLoadFieldDef(var Field: TnxNativeField; aName: String; aDict: TnxDataDictionary; aOldData, aNewData: PnxByteArray): Boolean;
begin
  with Field do begin
    nfField := aDict.GetFieldFromName(aName);
    Result := (nfField>=0);
    if not Result then Exit;
    with aDict.FieldsDescriptor.FieldDescriptor[nfField] do begin
      nfOffSet := fdOffset;
      nfLen := fdLength;
      nfLogRecLenAlign := THackFields(aDict.FieldsDescriptor).fsdLogRecLenAlign;
    end;
    nfOldData := aOldData;
    nfNewData := aNewData;  
  end;
  Result := True;
end;

function TnxBooleanField.FieldType: TnxFieldType;
begin
  Result := nxtBoolean;
end;


function TnxBooleanField.GetNewValue: Boolean;
begin
  Result := Boolean(NewData^[0]);
end;

function TnxBooleanField.OldValue: Boolean;
begin
  if Assigned(nfOldData) then
    Result := Boolean(OldData^[0]) else
    Result := False;
end;

procedure TnxBooleanField.SetNewValue(const Value: Boolean);
begin
  Boolean(NewData^[0]) := Value;
end;

{ TnxCharField }

function TnxCharField.FieldType: TnxFieldType;
begin
  Result := nxtChar;
end;

{ TnxNullString }

function TnxNullStringField.FieldType: TnxFieldType;
begin
  Result := nxtNullString;
end;

{ TnxShortString }

function TnxShortStringField.FieldType: TnxFieldType;
begin
  Result := nxtShortString;
end;

{ TnxDateTime }

function TnxDateTimeField.FieldType: TnxFieldType;
begin
  Result := nxtDateTime;
end;

{ TnxDate }

function TnxDateField.FieldType: TnxFieldType;
begin
  Result := nxtDate;
end;

{ TnxCurrency }

function TnxCurrencyField.FieldType: TnxFieldType;
begin
  Result := nxtCurrency;
end;

{ TnxDouble }

function TnxDoubleField.FieldType: TnxFieldType;
begin
  Result := nxtDouble;
end;

{ TnxSingle }

function TnxSingleField.FieldType: TnxFieldType;
begin
  Result := nxtSingle;
end;

{ TnxAutoInc }

function TnxAutoIncField.FieldType: TnxFieldType;
begin
  Result := nxtAutoInc;
end;

{ TnxInt64 }

function TnxInt64Field.FieldType: TnxFieldType;
begin
  Result := nxtInt64;
end;

{ TnxInt32 }

function TnxInt32Field.FieldType: TnxFieldType;
begin
  Result := nxtInt32;
end;

{ TnxInt16 }

function TnxInt16Field.FieldType: TnxFieldType;
begin
  Result := nxtInt16;
end;

function TnxCharField.GetNewValue: Char;
begin
  Result := Char(nfNewData^[nfOffSet]);
end;

function TnxCharField.OldValue: Char;
begin
  if nfOldData=nil then
    Result := #0 else
    Result := Char(nfOldData^[nfOffSet]);
end;

procedure TnxCharField.SetNewValue(const Value: Char);
begin
  Char(nfNewData^[nfOffSet]) := Value;
end;

{ TnxInt8Field }

function TnxInt8Field.FieldType: TnxFieldType;
begin
  Result := nxtInt8;
end;

function TnxInt8Field.GetNewValue: TnxInt8;
begin
  Result := TnxInt8(nfNewData^[nfOffSet]);
end;

function TnxInt8Field.OldValue: TnxInt8;
begin
  if nfOldData=nil then
    Result := 0 else
    Result := TnxInt8(nfOldData^[nfOffSet]);
end;

procedure TnxInt8Field.SetNewValue(const Value: TnxInt8);
begin
  TnxInt8(nfNewData^[nfOffSet]) := Value;
end;

{ TnxWord16Field }

function TnxWord16Field.FieldType: TnxFieldType;
begin
  Result := nxtWord16;
end;

function TnxWord16Field.GetNewValue: TnxWord16;
begin
  Result := PWord(NewData)^;
end;

function TnxWord16Field.OldValue: TnxWord16;
begin
  if nfOldData=nil then
    Result := 0 else
    Result := PWord(OldData)^;
end;

procedure TnxWord16Field.SetNewValue(const Value: TnxWord16);
begin
  PWord(NewData)^:= Value;
end;

{ TnxByteField }

function TnxByteField.FieldType: TnxFieldType;
begin
  Result := nxtByte;
end;

function TnxByteField.GetNewValue: Byte;
begin
  Result := nfNewData^[nfOffSet];
end;

function TnxByteField.OldValue: Byte;
begin
  if nfOldData=nil then
    Result := 0 else
    Result := nfOldData^[nfOffSet];
end;

procedure TnxByteField.SetNewValue(const Value: Byte);
begin
  nfNewData^[nfOffSet] := Value;
end;

{ TnxNativeField }



function TnxNativeField.Changed: Boolean;

function ValueDif: Boolean;
var I : Integer;
begin
  for I := 0 to nfLen-1 do
  if nfOldData^[nfOffSet+I]<>nfNewData^[nfOffSet+I] then begin
    Result := True;
    Exit;
  end;
  Result := False;
end;

begin
  if NewNull and OldNull then
    Result := False else
    Result := (NewNull or OldNull) or ValueDif;
end;

function TnxNativeField.FieldType: TnxFieldType;
begin
  Result := nxtBoolean;
end;

function TnxNativeField.GetNewNull: Boolean;
begin
  Result := (nfNewData = nil) or
             nxIsBitSet(PnxByteArray(@nfNewData^[nfLogRecLenAlign]), nfField);
end;

function TnxNativeField.GetOldNull: Boolean;
begin
  Result := (nfOldData = nil) or
             nxIsBitSet(PnxByteArray(@nfOldData^[nfLogRecLenAlign]), nfField);
end;

function TnxNativeField.NewData: PnxByteArray;
begin
  Result := @nfNewData^[nfOffSet];
end;

function TnxNativeField.OldData: PnxByteArray;
begin
  REsult := @nfOldData^[nfOffSet];
end;

procedure TnxNativeField.SetNewNull(const Value: Boolean);
begin
  nxSetBit(PnxByteArray(@nfNewData^[nfLogRecLenAlign]), nfField);
  FillChar(nfNewData^[nfOffset], nfLen, 0);
end;

procedure TnxNativeField.SetOldNull(const Value: Boolean);
begin
  nxSetBit(PnxByteArray(@nfOldData^[nfLogRecLenAlign]), nfField);
  FillChar(nfOldData^[nfOffset], nfLen, 0);
end;

{ TnxWord32Field }

function TnxWord32Field.FieldType: TnxFieldType;
begin
  Result := nxtWord32;
end;

{ TnxExtended }

function TnxExtendedField.FieldType: TnxFieldType;
begin
  Result := nxtExtended;
end;

{ TnxTime }

function TnxTimeField.FieldType: TnxFieldType;
begin
  Result := nxtTime;
end;

function TnxWord32Field.GetNewValue: TnxWord32;
begin
  Result := TnxWord32(nfNewData^[nfOffSet]);
end;

function TnxWord32Field.OldValue: TnxWord32;
begin
  if nfOldData=nil then
    Result := 0 else
    Result := TnxWord32(nfOldData^[nfOffSet]);
end;

procedure TnxWord32Field.SetNewValue(const Value: TnxWord32);
begin
  PnxWord32(NewData)^:= Value;
end;

function TnxInt16Field.GetNewValue: TnxInt16;
begin
  Result := TnxInt16(nfNewData^[nfOffSet]);
end;

function TnxInt16Field.OldValue: TnxInt16;
begin
  if nfOldData=nil then
    Result := 0 else
    Result := TnxInt16(nfOldData^[nfOffSet]);
end;

procedure TnxInt16Field.SetNewValue(const Value: TnxInt16);
begin
  PnxInt16(NewData)^ := Value;
end;

function TnxInt32Field.GetNewValue: TnxInt32;
begin
  Result := TnxInt32(nfNewData^[nfOffSet]);
end;

function TnxInt32Field.OldValue: TnxInt32;
begin
  if nfOldData=nil then
    Result := 0 else
    Result := TnxInt32(nfOldData^[nfOffSet]);
end;

procedure TnxInt32Field.SetNewValue(const Value: TnxInt32);
begin
  PnxInt32(NewData)^ := Value;
end;

function TnxInt64Field.GetNewValue: TnxInt64;
begin
  Result := TnxInt64(nfNewData^[nfOffSet]);
end;

function TnxInt64Field.OldValue: TnxInt64;
begin
  if nfOldData=nil then
    Result := 0 else
    Result := TnxInt64(nfNewData^[nfOffSet]);
end;

procedure TnxInt64Field.SetNewValue(const Value: TnxInt64);
begin
  PnxInt64(NewData)^ := Value;
end;

function TnxSingleField.GetNewValue: TnxSingle;
begin
  Result := PnxSingle(NewData)^;
end;

function TnxSingleField.OldValue: TnxSingle;
begin
  if nfOldData=nil then
    Result := 0 else
    Result := PnxSingle(OldData)^;
end;

procedure TnxSingleField.SetNewValue(const Value: TnxSingle);
begin
  PnxSingle(NewData)^ := Value;
end;

function TnxDoubleField.GetNewValue: TnxDouble;
begin
  Result := PnxDouble(NewData)^;
end;

function TnxDoubleField.OldValue: TnxDouble;
begin
  if nfOldData=nil then
    Result := 0 else
    Result := PnxDouble(OldData)^;
end;

procedure TnxDoubleField.SetNewValue(const Value: TnxDouble);
begin
  PnxDouble(NewData)^ := Value;
end;

function TnxExtendedField.GetNewValue: TnxExtended;
begin
  Result := PnxExtended(NewData)^;
end;

function TnxExtendedField.OldValue: TnxExtended;
begin
  if nfOldData=nil then
    Result := 0 else
    Result := PnxExtended(OldData)^;
end;

procedure TnxExtendedField.SetNewValue(const Value: TnxExtended);
begin
  PnxExtended(NewData)^ := Value;
end;

function TnxCurrencyField.GetNewValue: TnxCurrency;
begin
  Result := PnxCurrency(NewData)^;
end;

function TnxCurrencyField.OldValue: TnxCurrency;
begin
  if nfOldData=nil then
    Result := 0 else
    Result := PnxCurrency(OldData)^;
end;

procedure TnxCurrencyField.SetNewValue(const Value: TnxCurrency);
begin
  PnxCurrency(NewData)^ := Value;
end;

function TnxDateField.GetNewValue: TnxDate;
begin
  Result := PnxDate(NewData)^;
end;

function TnxDateField.OldValue: TnxDate;
begin
  if nfOldData=nil then
    Result := 0 else
    Result := PnxDate(OldData)^;
end;

procedure TnxDateField.SetNewValue(const Value: TnxDate);
begin
  PnxDate(NewData)^ := Value;
end;

function TnxTimeField.GetNewValue: TnxTime;
begin
  Result := PnxTime(NewData)^;
end;

function TnxTimeField.OldValue: TnxTime;
begin
 if nfOldData=nil then
   Result := 0 else
   Result := PnxTime(OldData)^;
end;

procedure TnxTimeField.SetNewValue(const Value: TnxTime);
begin
  PnxTime(NewData)^ := Value;
end;

function TnxDateTimeField.GetNewValue: TnxDateTime;
begin
  Result := PnxDateTime(NewData)^;
end;

function TnxDateTimeField.OldValue: TnxDateTime;
begin
  if nfOldData=nil then
    Result := 0 else
    Result := PnxDateTime(OldData)^;
end;

procedure TnxDateTimeField.SetNewValue(const Value: TnxDateTime);
begin
  PnxDateTime(NewData)^ := Value;
end;

function TnxShortStringField.GetNewValue: ShortString;
begin
  Result := PShortString(NewData)^;
end;

function TnxShortStringField.OldValue: ShortString;
begin
  if nfOldData=nil then
    Result := '' else
    Result := PShortString(OldData)^;
end;

procedure TnxShortStringField.SetNewValue(const Value: ShortString);
var S: ShortString;
begin
  S := Value;
  if Length(S)>nfLen-1 then
    S := Copy(S, 1, nfLen-1);
  FillChar(NewData^, nfLen, 0);
  NewData^[0] := Length(S);
  if S <> '' then
    Move(S[1], NewData[1], Length(S));
end;

function TnxNullStringField.GetNewValue: String;
begin
  Result := StrPas(PAnsiChar(NewData))
end;

function TnxNullStringField.OldData: String;
begin
  if nfOldData=nil then
    Result := '' else
    Result := StrPas(PAnsiChar(OldData));
end;

procedure TnxNullStringField.SetNewValue(const Value: String);
var
  S: string;
  L: Integer;
begin
  S := Value;
  L := Length(S);
  if L>nfLen-1 then S := Copy(S, 1, nfLen-1);
  FillChar(NewData^, nfLen, 0);
  if S <> '' then
    Move(S[1], NewData^[0], Length(S));
end;

{ TnxHelpCursor }
type
  THackCursor = class ( TnxServerBaseCursor );

constructor TnxHelpCursor.Create(aOldData, aNewData, aKey1, aKey2: PnxByteArray;
  aCursor: TnxServerBaseCursor);
begin
  nxGetMem(FBuffer, 1024);
  Fillchar(FBuffer^, 1024, 0);
  FCursor := aCursor;
  FDictionary := THackCursor(aCursor).ac_GetDictionary;
  FOldData := aOldData;
  FNewData := aNewData;
  FKeyData1 := aKey1;
  FKeyData2 := aKey2;
  FOpenMode := False;
end;

constructor TnxHelpCursor.CreateOpen(aName: String; aDB: TnxServerDatabase);
begin
  nxGetMem(FBuffer, 1024);
  Fillchar(FBuffer^, 1024, 0);
  FCursor := nil;
  FDictionary := nil;
  FOldData := nil;
  FNewData := nil;
  FKeyData1 := nil;
  FKeyData2 := nil;
  FOpenMode := True;
  FName := aName;
  FDB := aDB;
  FActive := False;
end;

procedure TnxHelpCursor.DeleteRec;
begin
  FCursor.RecordDelete(FNewData);
end;

destructor TnxHelpCursor.Destroy;
begin
  nxFreeMem(FBuffer);
  SetActive(False);
  inherited;
end;

function TnxHelpCursor.FindKey(aCount: Integer): Boolean;
var I: Integer;
begin
  I := FCursor.RecordGetForKey(aCount, 0, False, FKeyData1, FNewData, False, True);
  Result := (I=0);
end;

function TnxHelpCursor.GetNext: Boolean;
begin
  Result := (FCursor.RecordGetNext(nxltNoLock, FNewData)=0);
end;

function TnxHelpCursor.GetValue(aFieldName: String; aData: PnxByteArray;
  aDefValue: Variant): Variant;
var
  aField: Integer;
  aNull: Boolean;
begin
  if (aData=nil) then begin
    Result := null;
    Exit;
  end;
  with FCursor, FDictionary.FieldsDescriptor do begin
    Result := FDictionary.FieldsDescriptor.FieldByNameAsVariant[aData, aFieldName];
    if Result=null then
      Result := aDefValue ;
  end;  
end;

procedure TnxHelpCursor.InitRecord(var aData: PnxByteArray);
begin
  if aData=nil then
    nxGetMem(aData, Dict.FieldsDescriptor.RecordLength);
  Dict.FieldsDescriptor.InitRecord(aData);  
end;

procedure TnxHelpCursor.InsertNewData;
var Erro: Integer;
begin
  Erro := FCursor.RecordInsert(nxltNoLock, FNewData);
  if Erro<>0 then
    raise Exception.Create('Error '+IntToStr(Erro)+' on InsertNewData on table "'+FName+'"');
end;

function TnxHelpCursor.NewValue(aFieldName: String; aDefValue: Variant): Variant;
begin
  Result := GetValue(aFieldName, FNewData, aDefValue);
end;

function TnxHelpCursor.OldValue(aFieldName: String;
  aDefValue: Variant): Variant;
begin
  Result := GetValue(aFieldName, FOlddata, aDefValue);
end;

procedure TnxHelpCursor.ModifyNewData;
begin
  FCursor.RecordModify(FNewData, True);
end;

function TnxHelpCursor.SelIndex(aName: String): Boolean;
begin
  Result := (FCursor.SwitchToIndex(aName, -1, False)=0);
end;

procedure TnxHelpCursor.SetActive(const Value: Boolean);
var aCursor: TnxAbstractCursor;
begin
  if not FOpenMode then Exit;

  if FActive=Value then Exit;
  if not Value then begin
    nxFreeMem(FNewData);
    FNewData := nil;

    if Assigned(FOldData) then begin
      nxFreeMem(FOldData);
      FOldData := nil;
    end;

    if Assigned(FKeyData1) then begin
      nxFreeMem(FKeyData1);
      FKeyData1 := nil;
    end;

    if Assigned(FKeyData2) then begin
      nxFreeMem(FKeyData2);
      FKeyData2 := nil;
    end;

    FreeAndNil(FCursor);
  end else begin
    FCursor := nil;
    FDictionary := nil;
    if FDB.CursorOpen(aCursor, FName, '', omReadWrite, smShared, 10000)<>0 then Exit;
    FCursor := TnxServerBaseCursor(aCursor);
    try
      FDictionary := THackCursor(FCursor).ac_GetDictionary;
      nxGetMem(FNewData, FDictionary.FieldsDescriptor.RecordLength);
      InitRecord(FNewData);
    except
      FreeAndNil(FCursor);
    end;
  end;
  FActive := Value;
end;

procedure TnxHelpCursor.SetKey1(aFieldName: String; aValue: Variant);
begin
  if FKeyData1=nil then 
    InitRecord(FKeyData1);
    
  SetValueCustom(aFieldName, aValue, FKeyData1);
end;

procedure TnxHelpCursor.SetKey2(aFieldName: String; aValue: Variant);
begin
  if FKeyData2=nil then 
    InitRecord(FKeyData2);

  SetValueCustom(aFieldName, aValue, FKeyData2);
end;

function TnxHelpCursor.SetRange(aCount: Integer; aKeyExcl: Boolean = True): Boolean;
begin
  Result := (FCursor.RangeSet(aCount, 0, False, FKeyData1, True, aCount, 0, False, FKeyData2, True)=0)
end;

procedure TnxHelpCursor.SetValue(aFieldName: String; aValue: Variant);
begin
  SetValueCustom(aFieldName, aValue, FNewData);
end;

procedure TnxHelpCursor.SetValueCustom(aFieldName: String; aValue: Variant;
  aData: PnxByteArray);
begin
  FDictionary.FieldsDescriptor.FieldByNameAsVariant[aData, aFieldName] := aValue;
end;

end.
