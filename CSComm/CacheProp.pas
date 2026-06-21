unit CacheProp;

interface

uses
  sysutils,
  classes,
  DB,
  Variants,
  TypInfo;

type  
  IntPtr     = ^Longint;
  CharPtr    = ^Char;
  FloatPtr   = ^Extended;
  VariantPtr = ^Variant;
  StringPtr  = ^String;
  Int64Ptr   = ^Int64;

  PCachePropItem = ^TCachePropItem;
  TCachePropItem = record
    pcPropInfo : PPropInfo;
    pcValor    : Pointer;
  end; 

  TCPWriter = class ( TWriter )
  public
    procedure WriteVariant(Value: Variant);
  end;

  TCPReader = class ( TReader )
  public
    function ReadVariant: Variant;
  end;

  TCacheProp = class
  private
    FObj: TObject;
    FItens : TList;
    FPropertiesAlteradas: String;
    
    function NovoItem(PI: PPropInfo): PCachePropItem;
    function GetItem(PI: PPropInfo): PCachePropItem;
    procedure LePropItem(PI: PPropInfo);
    procedure ReverteItem(Item: PCachePropItem);
    procedure LePropField(PI: PPropInfo; F: TField);
    procedure SalvaPropField(PI: PPropInfo; F: TField);

    procedure GravaItemStream(W: TCPWriter; PI: PPropInfo; SoAlterados: Boolean);
    procedure LeItemStream(R: TCPReader; PI: PPropInfo);
    function AlterouItem(PI: PPropInfo): Boolean;
    procedure AssignProp(PI: PPropInfo; ObjFonte: TObject); 
  public
    constructor Create(aObj: TObject);
    destructor Destroy; override;

    procedure LeProps; // Salva valores das propriedades no cache
    procedure Reverte; // Salva valores em cache para propriedades
    
    procedure Limpa;   
    
    function AlterouPropItem(Item: PCachePropItem): Boolean;
    
    function Alterou: Boolean;

    procedure SalvaStream(S: TStream; SoAlterados: Boolean);
    procedure SalvaWriter(W: TCPWriter; SoAlterados: Boolean);

    procedure LeStream(S: TStream);
    procedure LeReader(R: TCPReader; S: TStream);

    procedure SalvaDataset(Tab: TDataset);
    procedure LeDataset(Tab: TDataset);

    procedure Assign(ObjFonte: TObject);

    property PropertiesAlteradas: String
      read FPropertiesAlteradas;
  end; 

const
  TiposValidos : TTypeKinds = 
    [tkInteger, tkEnumeration, tkChar, tkFloat, tkString, tkLString, tkWString, tkVariant, tkInt64];
  

implementation

uses ncDebug;


{ TCacheProp }

procedure DisposePropItem(Item : PCachePropItem);
begin
  with Item^ do 
  case pcPropInfo^.PropType^^.Kind of 
    tkInteger: Dispose(IntPtr(pcValor));
    tkEnumeration : Dispose(IntPtr(pcValor));
    tkChar: Dispose(CharPtr(pcValor));
    tkFloat: Dispose(FloatPtr(pcValor));
    tkString, tkLString, tkWString: Dispose(StringPtr(pcValor));
    tkVariant: Dispose(VariantPtr(pcValor));
    tkInt64: Dispose(Int64Ptr(pcValor));
  end;  
  Dispose(Item);
end;

constructor TCacheProp.Create(aObj: TObject);
begin
  FObj := aObj;
  FItens := TList.Create;
  FPropertiesAlteradas := '';
end;

destructor TCacheProp.Destroy;
begin
  Limpa;
  FItens.Free;
  inherited;
end;

function TCacheProp.GetItem(PI: PPropInfo): PCachePropItem;
var I : Integer;
begin
  for I := 0 to pred(FItens.Count) do begin
    Result := FItens[I];
    if Result^.pcPropInfo = PI then Exit;
  end;
  Result := nil;  
end;

procedure SetStringValue(var S: String; V: String);
begin
  S := V;
  V := V + V;
end;

procedure TCacheProp.LePropItem(PI: PPropInfo);
var Item : PCachePropItem;
begin
  with PI^, PropType^^ do
  if (Kind in TiposValidos) and (GetProc <> nil) then 
  begin
    Item := GetItem(PI);
    if (Item=nil) then Item := NovoItem(PI);
    if Item <> nil then with Item^ do   
    case Kind of
      tkInteger : IntPtr(pcValor)^ := GetOrdProp(FObj, PI);
      tkEnumeration : IntPtr(pcValor)^ := GetOrdProp(FObj, PI);
      tkChar: CharPtr(pcValor)^ := Chr(GetOrdProp(FObj, PI));
      tkFloat: FloatPtr(pcValor)^ := GetFloatProp(FObj, PI);
      tkString, tkLString, tkWString: 
      SetStringValue(StringPtr(pcValor)^, GetStrProp(FObj, PI));
      tkVariant: VariantPtr(pcValor)^ := GetVariantProp(FObj, PI);
      tkInt64: Int64Ptr(pcValor)^ := GetInt64Prop(FObj, PI);
    end;
  end;
end;

procedure TCacheProp.ReverteItem(Item: PCachePropItem);
begin
  with Item^ do 
  case pcPropInfo^.PropType^^.Kind of
    tkInteger: SetOrdProp(FObj, pcPropInfo, IntPtr(pcValor)^);
    tkEnumeration: SetOrdProp(FObj, pcPropInfo, IntPtr(pcValor)^);
    tkChar: SetOrdProp(FObj, pcPropInfo, Ord(CharPtr(pcValor)^));
    tkFloat: SetFloatProp(FObj, pcPropInfo, FloatPtr(pcValor)^);
    tkString, tkLString, tkWString: SetStrProp(FObj, pcPropInfo, StringPtr(pcValor)^);
    tkVariant: SetVariantProp(FObj, pcPropInfo, VariantPtr(pcValor)^);
    tkInt64: SetInt64Prop(FObj, pcPropInfo, Int64Ptr(pcValor)^);
  end;
end;

function TCacheProp.AlterouItem(PI: PPropInfo): Boolean;
var Item : PCachePropItem;
begin
  Item := GetItem(PI);
  Result := (Item=nil) or AlterouPropItem(Item);
end;

function TCacheProp.AlterouPropItem(Item: PCachePropItem): Boolean;
var I : Integer;

  function CompIntProp: Boolean;
  begin
    Result := (IntPtr(Item^.pcValor)^ <> GetOrdProp(FObj, Item^.pcPropInfo));
    Inc(I);
  end;

  function CompCharProp: Boolean;
  begin
    Result := (CharPtr(Item^.pcValor)^ <> Chr(GetOrdProp(FObj, Item^.pcPropInfo)));
    Inc(I);
  end;

  function CompFloatProp: Boolean;
  begin
    Result := (FloatPtr(Item^.pcValor)^ <> GetFloatProp(FObj, Item^.pcPropInfo));
    Inc(I);
  end;

  function CompInt64Prop: Boolean;
  begin
    Result := (Int64Ptr(Item^.pcValor)^ <> GetInt64Prop(FObj, Item^.pcPropInfo));
    Inc(I);
  end;

  function CompStrProp: Boolean;
  begin
    Result := (StringPtr(Item^.pcValor)^ <> GetStrProp(FObj, Item^.pcPropInfo));
    Inc(I);
  end;

  function CompVariantProp: Boolean;
  begin
    Result := (VariantPtr(Item^.pcValor)^ <> GetVariantProp(FObj, Item^.pcPropInfo));
    Inc(I);
  end;

begin
  Result := True;
  case Item^.pcPropInfo^.PropType^^.Kind of
    tkEnumeration,
    tkInteger: Result := CompIntProp;
    tkChar: Result := CompCharProp;
    tkFloat: Result := CompFloatProp;
    tkString, tkLString, tkWString: Result := CompStrProp;
    tkVariant: Result := CompVariantProp;
    tkInt64: Result := CompInt64Prop;
  end;
end;

procedure TCacheProp.LeProps;
var
  I, Count: Integer;
  PropInfo: PPropInfo;
  PropList: PPropList;
begin
  if FObj.ClassInfo=nil then 
    // Para conter ClassInfo classe tem que ser compilada com $M+
    Exit;
    
  Count := GetTypeData(FObj.ClassInfo)^.PropCount;
  if Count > 0 then
  begin
    GetMem(PropList, Count * SizeOf(Pointer));
    try
      GetPropInfos(FObj.ClassInfo, PropList);
      for I := 0 to Count - 1 do
      begin
        PropInfo := PropList^[I];
        if PropInfo = nil then break;
        if IsStoredProp(FObj, PropInfo) then
          LePropItem(PropInfo);
      end;
    finally
      FreeMem(PropList, Count * SizeOf(Pointer));
    end;
  end;
end;

function TCacheProp.NovoItem(PI: PPropInfo): PCachePropItem;
begin
  New(Result);
  Result^.pcPropInfo := PI;
  FItens.Add(Result);
  with Result^ do 
  case pcPropInfo^.PropType^^.Kind of 
    tkEnumeration,
    tkInteger: New(IntPtr(pcValor));
    tkChar: New(CharPtr(pcValor));
    tkFloat: New(FloatPtr(pcValor));
    tkString, tkLString, tkWString: New(StringPtr(pcValor));
    tkVariant: New(VariantPtr(pcValor));
    tkInt64: New(Int64Ptr(pcValor));
  end;  
end;

function TCacheProp.Alterou: Boolean;
var I : Integer;
begin
  Result := True;
  for I := 0 to pred(FItens.Count) do 
    if AlterouPropItem(PCachePropItem(FItens[I])) then 
      Exit;
  Result := False;
end;

procedure TCacheProp.Reverte;
var I : Integer;
begin
  for I := 0 to pred(FItens.Count) do 
    ReverteItem(PCachePropItem(FItens[I]));
  FPropertiesAlteradas := '';
end;

procedure TCacheProp.Limpa;
begin
  while FItens.Count > 0 do begin
    DisposePropItem(PCachePropItem(FItens[0])); 
    FItens.Delete(0);
  end;  
  FPropertiesAlteradas := '';
end;

procedure TCacheProp.SalvaStream(S: TStream; SoAlterados: Boolean);
var W: TCPWriter;
begin
  try
    W := TCPWriter.Create(S, 4096);
    try
      SalvaWriter(W, SoAlterados);
    finally
      W.Free;
    end;
  except
    on E: Exception do 
      raise Exception.Create('TCacheProp.SalvaStream - Exception: ' + E.Message);
  end;
end;

procedure TCacheProp.SalvaWriter(W: TCPWriter; SoAlterados: Boolean);
var      
  I, Count: Integer;
  PropInfo: PPropInfo;
  PropList: PPropList;
  S : String;
begin
  if FObj.ClassInfo=nil then 
    // Para conter ClassInfo classe tem que ser compilada com $M+
    Raise Exception.Create('TCacheProp.SalvaWriter - Exception: FObj.ClassInfo=nil');
  S := '';   
  try  
    S := '1';
    Count := GetTypeData(FObj.ClassInfo)^.PropCount;
    S := '2';
    if Count > 0 then
    begin
      S := '3';
      W.WriteListBegin;
      S := '4';
      GetMem(PropList, Count * SizeOf(Pointer));
      S := '5';
      try
        S := '6';
        GetPropInfos(FObj.ClassInfo, PropList);
        S := '7';
        for I := 0 to Count - 1 do
        begin
          S := '8';
          PropInfo := PropList^[I];
          S := '9';
          if PropInfo = nil then break;
          S := '10';
          if IsStoredProp(FObj, PropInfo) then
            GravaItemStream(W, PropInfo, SoAlterados);
          S := '11';  
        end;
      finally
        FreeMem(PropList, Count * SizeOf(Pointer));
      end;
      W.WriteListEnd;
    end;
  except
    on E: Exception do 
      raise Exception.Create('TCacheProp.SalvaWriter - Exception ' + S + ': ' + E.Message);
  end;
end;

procedure TCacheProp.GravaItemStream(W: TCPWriter; PI: PPropInfo; SoAlterados: Boolean);
var S: String;
begin
  try
    S := PI^.Name;
  except
    S := 'PI^.Name ##ERRO';
  end;
  
  try
    if (PI^.PropType^^.Kind in TiposValidos) and 
       ((not SoAlterados) or 
        AlterouItem(PI)) then
    with W do begin
      S := PI^.Name;
//      DebugMsg('TCacheProp.GravaItemStream - PI^.Name: '+S);
      WriteString(PI^.Name);
      case PI^.PropType^^.Kind of 
        tkEnumeration,
        tkInteger: WriteInteger(GetOrdProp(FObj, PI));
        tkChar: WriteChar(Chr(GetOrdProp(FObj, PI)));
        tkFloat: WriteFloat(GetFloatProp(FObj, PI));
        tkString, tkLString, tkWString: begin
          S := GetStrProp(FObj, PI);
          WriteString(S);
//          DebugMsg('TCacheProp.GravaItemStream - StringValue: '+S);
        end;
        tkVariant: WriteVariant(GetVariantProp(FObj, PI));
        tkInt64: WriteInteger(GetInt64Prop(FObj, PI));
      end;  
    end;
  except
    on E: Exception do Raise 
      Exception.Create('Exception on GravaItemStream.'+S+' - Exception: ' + E.Message);
  end;
end;

procedure TCacheProp.LeItemStream(R: TCPReader; PI: PPropInfo);
var 
  S, S2    : String;
  I : Integer;
begin
  S := PI^.Name;
  S2 := S;
  with R do 
  case PI^.PropType^^.Kind of 
    tkEnumeration,
    tkInteger: SetOrdProp(FObj, PI, ReadInteger);
    tkChar: SetOrdProp(FObj, PI, Ord(ReadChar));
    tkFloat: SetFloatProp(FObj, PI, ReadFloat);
    tkString, tkLString, tkWString: begin
      S := ReadString;
      SetStrProp(FObj, PI, S);
    end;
    tkVariant: SetVariantProp(FObj, PI, ReadVariant);
    tkInt64: SetInt64Prop(FObj, PI, ReadInt64);
  else
    I := Integer(PI^.PropType^^.Kind);
    if I = -11 then
      S := '-11';
  end;  
{  Item := GetItem(PI);
  if Item <> nil then
    LePropItem(PI);}
end;

procedure TCacheProp.LeReader(R: TCPReader; S: TStream);
var 
  N : String;
  PI : PPropInfo;
begin
  R.ReadListBegin;
  FPropertiesAlteradas := '';
  while (not R.EndOfList) and (R.Position<(S.Size-1)) do begin
    N := R.ReadString;
    if FPropertiesAlteradas>'' then
      FPropertiesAlteradas := FPropertiesAlteradas + ';';
    FPropertiesAlteradas := FPropertiesAlteradas +  N;
    PI := GetPropInfo(FObj, N);
    if PI <> nil then
      LeItemStream(R, PI);
  end;
  R.ReadListEnd;
end;

procedure TCacheProp.LeStream(S: TStream);
var R : TCPReader;
begin
  R := TCPReader.Create(S, 4096);
  try
    LeReader(R, S);
  finally
    R.Free;
  end;
end;

procedure TCacheProp.LeDataset(Tab: TDataset);
var 
  P : PPropInfo;
  I : Integer;
begin
  with Tab do 
  for I := 0 to pred(FieldCount) do begin
    P := GetPropInfo(FObj, Fields[I].FieldName);
    if P <> nil then
      LePropField(P, Fields[I]);
  end;    
end;

procedure TCacheProp.SalvaDataset(Tab: TDataset);
var 
  P : PPropInfo;
  I : Integer;
begin
  with Tab do 
  for I := 0 to pred(FieldCount) do begin
    P := GetPropInfo(FObj, Fields[I].FieldName);
    if P <> nil then
      SalvaPropField(P, Fields[I]);
  end;    
end;

function StringToChar(S: String): Char;
begin
  if S > '' then
    Result := S[1]
  else
    Result := #0;  
end; 

procedure TCacheProp.LePropField(PI: PPropInfo; F: TField);
begin
  case PI^.PropType^^.Kind of 
    tkEnumeration: 
    if F.DataType = ftBoolean then
      SetOrdProp(FObj, PI, Integer(F.AsBoolean));
    tkInteger: SetOrdProp(FObj, PI, F.AsInteger);
    tkChar: SetOrdProp(FObj, PI, Ord(StringToChar(F.AsString)));
    tkFloat: SetFloatProp(FObj, PI, F.AsFloat);
    tkString, tkLString, tkWString: SetStrProp(FObj, PI, F.AsString);
    tkVariant: SetVariantProp(FObj, PI, F.Value);
    tkInt64: SetInt64Prop(FObj, PI, F.AsInteger);
  end;  
{  Item := GetItem(PI);
  if Item <> nil then
    LePropItem(PI);  }
end;

procedure TCacheProp.SalvaPropField(PI: PPropInfo; F: TField);
var S: Variant;
begin
  if (F=nil) or (PI=nil) then Exit;
  case PI^.PropType^^.Kind of 
    tkEnumeration : 
    if F.DataType = ftBoolean then
      F.AsBoolean := Boolean(GetOrdProp(FObj, PI));
                             
    tkInteger: F.AsInteger := GetOrdProp(FObj, PI);
    tkChar: F.AsString := Chr(GetOrdProp(FObj, PI));
    tkFloat: F.AsFloat := GetFloatProp(FObj, PI);
    tkString, tkLString, tkWString: F.AsString := GetStrProp(FObj, PI);
    tkVariant: F.Value := GetVariantProp(FObj, PI);
    tkInt64: F.AsInteger := GetInt64Prop(FObj, PI);
  end;  
  S := F.FieldName;
  if S<>'dfkljhasdkfjh' then
    S := F.Value;
  if (S=Null) and (F.FieldName = '234098234') then
    F.Value := 'teste';
end;

procedure TCacheProp.Assign(ObjFonte: TObject);
var      
  I, Count: Integer;
  PropInfo: PPropInfo;
  PropList: PPropList;
begin
  if FObj.ClassInfo=nil then 
    // Para conter ClassInfo classe tem que ser compilada com $M+
    Exit;
    
  Count := GetTypeData(FObj.ClassInfo)^.PropCount;
  if Count > 0 then
  begin
    GetMem(PropList, Count * SizeOf(Pointer));
    try
      GetPropInfos(FObj.ClassInfo, PropList);
      for I := 0 to Count - 1 do
      begin
        PropInfo := PropList^[I];
        if PropInfo = nil then break;
        if IsStoredProp(FObj, PropInfo) then
          AssignProp(PropInfo, ObjFonte);
      end;
    finally
      FreeMem(PropList, Count * SizeOf(Pointer));
    end;
  end;
end;

procedure TCacheProp.AssignProp(PI: PPropInfo; ObjFonte: TObject);
begin
  if PI=nil then Exit;
  case PI^.PropType^^.Kind of 
    tkInteger, 
    tkEnumeration,
    tkChar     : SetOrdProp(FObj, PI, GetOrdProp(ObjFonte, PI));
    tkFloat    : SetFloatProp(FObj, PI, GetFloatProp(ObjFonte, PI));
    tkString, 
    tkLString, 
    tkWString  : SetStrProp(FObj, PI, GetStrProp(ObjFonte, PI));
    tkVariant  : SetVariantProp(FObj, PI, GetVariantProp(ObjFonte, PI));
    tkInt64    : SetInt64Prop(FObj, PI, GetInt64Prop(ObjFonte, PI));
  end;  
end;

{ TCPReader }

function TCPReader.ReadVariant: Variant;
const
  ValTtoVarT: array[TValueType] of Integer = (varNull, varError, varByte,
    varSmallInt, varInteger, varDouble, varString, varError, varBoolean,
    varBoolean, varError, varError, varString, varEmpty, varError, varSingle,
    varCurrency, varDate, varOleStr,

    {$ifdef VER130}
    varError);
    {$endif}

    {$ifdef VER140}
    varInt64,
    varError);
    {$endif}

    {$ifdef VER150}
    varInt64,
    varError);
    {$endif}

    {$ifdef VER180}
    varInt64,
    varError,
    varDouble);
    {$endif}
    

var
  ValType: TValueType;
begin
  ValType := NextValue;
  case ValType of
    vaNil, vaNull:
    begin
      if ReadValue = vaNil then
        VarClear(Result) 
      else
        Result := NULL;
    end;
    vaInt8: TVarData(Result).VByte := Byte(ReadInteger);
    vaInt16: TVarData(Result).VSmallint := Smallint(ReadInteger);
    vaInt32: TVarData(Result).VInteger := ReadInteger;
    {$ifdef Ver150}
    vaInt64: TVarData(Result).VInt64 := ReadInt64;
    {$endif}
    {$ifdef Ver140}
    vaInt64: TVarData(Result).VInt64 := ReadInt64;
    {$endif}
    vaExtended: TVarData(Result).VDouble := ReadFloat;
    {$ifdef Ver180}
    vaDouble: TVarData(Result).VDouble := ReadFloat;
    {$endif}
    vaSingle: TVarData(Result).VSingle := ReadSingle;
    vaCurrency: TVarData(Result).VCurrency := ReadCurrency;
    vaDate: TVarData(Result).VDate := ReadDate;
    vaString, vaLString: Result := ReadString;
    vaWString: Result := ReadWideString;
    vaFalse, vaTrue: TVarData(Result).VBoolean := (ReadValue = vaTrue);
  end;
  TVarData(Result).VType := ValTtoVarT[ValType];
end;

{ TCPWriter }

procedure TCPWriter.WriteVariant(Value: Variant);
var VType: Integer;
begin
  if VarIsArray(Value) then Value := null;
  VType := VarType(Value);
  case (VType and varTypeMask) of
    varEmpty: WriteValue(vaNil);
    varNull: WriteValue(vaNull);
    varOleStr: WriteWideString(Value);
    varString: WriteString(Value);
    varByte, varSmallInt, varInteger: WriteInteger(Value);
    {$ifdef Ver150}
    varInt64 : WriteInteger(TVarData(Value).VInt64);
    {$endif}
    varSingle: WriteSingle(Value);
    varDouble: WriteFloat(Value);
    varCurrency: WriteCurrency(Value);
    varDate: WriteDate(Value);
    varBoolean:
      if Value then
        WriteValue(vaTrue) 
      else
        WriteValue(vaFalse);
  else
    WriteValue(vaNull);
  end;
end;

end.
