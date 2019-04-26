unit ncMsgCli;

interface

uses
  SysUtils,
  Classes,
  Windows,
  ncClassesBase;


type
  TncMsgCli = class
  private
    FID : Cardinal;
    FCliente : Cardinal;
    FTitulo : String;
    FTexto : String;
    function GetString: String;
    procedure SetString(Value: String);
  public
    constructor Create;

    property ID: Cardinal
      read FID write FID;

    property Cliente: Cardinal
      read FCliente write FCliente;

    property Titulo: String
      read FTitulo write FTitulo;

    property Texto: String
      read FTexto write FTexto;    
    
    property AsString: String
      read GetString write SetString;
  end;

  TncMsgCliList = class
  private
    FList : TList;

    function GetString: String;
    procedure SetString(Value: String);
    function GetItem(I: Integer): TncMsgCli;
  public
    constructor Create;
    destructor Destroy; override;

    function Add: TncMsgCli;
    function Remove(M: TncMsgCli): Integer;

    procedure Clear;
    function Count: Integer;

    property Itens[I: Integer]: TncMsgCli 
      read GetItem; default;

    property AsString: String
      read GetString write SetString;  
    
    
  end;

implementation

{ TncMsgCli }

constructor TncMsgCli.Create;
begin
  FID := 0;
  FCliente := 0;
  FTitulo := '';
  FTexto := '';
end;

function TncMsgCli.GetString: String;
begin
  Result :=
    IntToStr(FID) + sFldDelim +
    IntToStr(FCliente) + sFldDelim +
    FTitulo + sFldDelim +
    FTexto + sFldDelim;
end;

procedure TncMsgCli.SetString(Value: String);

function _NextField: String;
begin
  Result := GetNextStrDelim(Value);
end;

begin
  FID := StrToIntDef(_NextField, 0);
  FCliente := StrToIntDef(_NextField, 0);
  FTitulo := _NextField;
  FTexto := _NextField;
end;

{ TncMsgCliList }

function TncMsgCliList.Add: TncMsgCli;
begin
  Result := TncMsgCli.Create;
  FList.Add(Result);
end;

procedure TncMsgCliList.Clear;
begin
  while Count>0 do begin
    TObject(FList[0]).Free;
    FList.Delete(0);
  end;
end;

function TncMsgCliList.Count: Integer;
begin
  Result := FList.Count;
end;

constructor TncMsgCliList.Create;
begin
  FList := TList.Create;
end;

destructor TncMsgCliList.Destroy;
begin
  Clear;
  FList.Free;
  inherited;
end;

function TncMsgCliList.GetItem(I: Integer): TncMsgCli;
begin
  Result := TncMsgCli(FList[I]);
end;

function TncMsgCliList.GetString: String;
var I  : Integer;
begin
  Result := '';
  for I := 0 to Count-1 do begin
    if I>0 then Result := Result + SLineBreak;
    Result := Result + Itens[I].AsString;
  end;
end;

function TncMsgCliList.Remove(M: TncMsgCli): Integer;
begin
  Result := FList.Remove(M);
end;

procedure TncMsgCliList.SetString(Value: String);
var
  SL : TStrings;
  I  : Integer;
begin
  Clear;
  SL := TStringList.Create;
  try
    SL.Text := Value;
    for I := 0 to SL.Count-1 do
      Add.AsString := SL[I];
  finally
    SL.Free;
  end;
end;

end.
