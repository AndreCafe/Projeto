unit uVarRecArray;

interface

type

  TVarRecArray = Array of TVarRec;

  procedure CreateVRA(var VRA: TVarRecArray; const Args: Array of Const);
  procedure DisposeVRA(var VRA: TVarRecArray);

implementation

procedure CreateVRA(var VRA: TVarRecArray; const Args: Array of Const);
var 
  I, C : Integer;
begin
  DisposeVRA(VRA);
  C := Length(VRA);
  SetLength(VRA, C+Length(Args));
  for I := 0 to High(Args) do with Args[I] do begin
    VRA[C].VType := VType;
    case VType of 
      vtInteger:    VRA[C].VInteger := VInteger;
      vtBoolean:    VRA[C].VBoolean := VBoolean;		vtChar:       VRA[C].VChar := VChar;		vtExtended:   begin        New(VRA[C].VExtended);        VRA[C].VExtended^ := VExtended^;      end;      		vtString:     begin        New(VRA[C].VString);        VRA[C].VString^ := VString^;      end;        		vtPointer:    VRA[C].VPointer := VPointer;		vtPChar:      begin        New(VRA[C].VPChar);        VRA[C].VPChar^ := VPChar^;      end;        		vtObject:     VRA[C].VObject := VObject;		vtClass:      VRA[C].VClass := VClass;		vtWideChar:   VRA[C].VWideChar := VWideChar;		vtPWideChar:  begin        New(VRA[C].VPWideChar);        VRA[C].VPWideChar^ := VPWideChar^;      end;        		vtAnsiString: VRA[C].VAnsiString := VAnsiString;      		vtCurrency:   begin        New(VRA[C].VCurrency);        VRA[C].VCurrency^ := VCurrency^;      end;        		vtVariant:    begin        New(VRA[C].VVariant);        VRA[C].VVariant^ := VVariant^;      end;        		vtInterface:  VRA[C].VInterface := VInterface;		vtWideString: VRA[C].VWideString := VWideString;		vtInt64:      begin        New(VRA[C].VInt64);        VRA[C].VInt64^:= VInt64^;      end;      end;      Inc(C);  end;end;    
procedure DisposeVRA(var VRA: TVarRecArray);
var I : Integer;
begin
  for I := 0 to High(VRA) do with VRA[I] do
  case VType of
	 vtExtended:   Dispose(VExtended);
	 vtString:     Dispose(VString);	 vtPChar:      Dispose(VPChar);	 vtPWideChar:  Dispose(VPWideChar);	 vtCurrency:   Dispose(VCurrency);	 vtVariant:    Dispose(VVariant);	 vtInt64:      Dispose(VInt64);  end;    SetLength(VRA, 0);
end;



end.
