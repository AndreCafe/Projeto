unit ncPrinters;

interface

uses
    classes,SysUtils;

type
  TncPrinter = class(TObject)
    id : integer;
    nome : string;
    impressora : string;
    precopp : double;
    Orientation : string;
    PaperSizeName : string;
    PaperSizeShortName : string;
    DefaultSourceDesc : string;
    PrintQuality : string;
    Color : string;
    Duplex : string; 
  end;

  TncPhysicalPrinter = class(TObject)
    PrinterIndex : integer;
    nome : string;
    Orientation : string;
    PaperSizeDesc : string;
    DefaultSourceDesc : string;
    PrintQuality : string;
    Color : string;
    Duplex : string;
    PHYSICALWIDTH : integer;
    PHYSICALHEIGHT : integer;
    PHYSICALOFFSETX : integer;
    PHYSICALOFFSETY : integer;
    HORZRES : integer;
    VERTRES : integer;
    LOGPIXELSX : integer;
    LOGPIXELSY : integer;
  end;

  TncPrinterList = class(TList)
  protected
    function Get(Index: Integer): TncPrinter;
    procedure Put(Index: Integer; Item: TncPrinter);
  public
    function exists(aName:string): boolean;
    function add(aName:string): TncPrinter; overload;
    function add(aPrinter:TncPrinter): TncPrinter; overload;
    function byId(aIdPrinter:Integer): TncPrinter;
    procedure Clear; override;
    property Items[Index: Integer]: TncPrinter read Get write Put; default;
    destructor Destroy; override;
  end;

  TncPhysicalPrinterList = class(TList)
  protected
    function Get(Index: Integer): TncPhysicalPrinter;
    procedure Put(Index: Integer; Item: TncPhysicalPrinter);
  public
    function exists(aName:string): boolean;
    function add(aName:string): TncPhysicalPrinter; overload;
    function add(aPrinter:TncPhysicalPrinter): TncPhysicalPrinter; overload;
    procedure Clear; override;
    property Items[Index: Integer]: TncPhysicalPrinter read Get write Put; default;
    destructor Destroy; override;
  end;

implementation

{ TncPrinterList }

function TncPrinterList.add(aName: string): TncPrinter;
begin
  result := nil;
  if exists(aName) then exit;
  result := TncPrinter.Create;
  result.nome := aName;
  inherited add(result);
end;

function TncPrinterList.add(aPrinter: TncPrinter): TncPrinter;
begin
  result := nil;
  if exists(aPrinter.nome) then exit;
  inherited add(aPrinter);
  result := aPrinter;
end;

function TncPrinterList.byId(aIdPrinter: Integer): TncPrinter;
var
   i : integer;
begin
  result := nil;
  for i:=0 to count-1 do
     if aIdPrinter=items[i].id then begin
       result := items[i];
       break;
     end;
end;


procedure TncPrinterList.Clear;
var
   i : integer;
begin
  for i:=count-1 downto 0 do
     TncPrinter(items[i]).free;

  inherited;

end;

destructor TncPrinterList.Destroy;
begin
  Clear;
  inherited;
end;

function TncPrinterList.exists(aName: string): boolean;
var
   i : integer;
begin
  result := false;
  for i:=0 to count-1 do
     if sametext(aName, items[i].nome ) then begin
       result := true;
       break;
     end;

end;


function TncPrinterList.Get(Index: Integer): TncPrinter;
begin
     result := TncPrinter(inherited Get(Index));
end;

procedure TncPrinterList.Put(Index: Integer; Item: TncPrinter);
begin
     inherited Put(Index, Item);
end;

{ TncPhysicalPrinterList }

function TncPhysicalPrinterList.add(aName: string): TncPhysicalPrinter;
begin
  result := nil;
  if exists(aName) then exit;
  result := TncPhysicalPrinter.Create;
  result.nome := aName;
  inherited add(result);
end;

function TncPhysicalPrinterList.add(aPrinter: TncPhysicalPrinter): TncPhysicalPrinter;
begin
  result := nil;
  if exists(aPrinter.nome) then exit;
  inherited add(aPrinter);
  result := aPrinter;
end;

procedure TncPhysicalPrinterList.Clear;
var
   i : integer;
begin
  for i:=count-1 downto 0 do
     TncPhysicalPrinter(items[i]).free;

  inherited;

end;

destructor TncPhysicalPrinterList.Destroy;
begin
  Clear;
  inherited;
end;

function TncPhysicalPrinterList.exists(aName: string): boolean;
var
   i : integer;
begin
  result := false;
  for i:=0 to count-1 do
     if sametext(aName, items[i].nome ) then begin
       result := true;
       break;
     end;

end;


function TncPhysicalPrinterList.Get(Index: Integer): TncPhysicalPrinter;
begin
     result := TncPhysicalPrinter(inherited Get(Index));
end;

procedure TncPhysicalPrinterList.Put(Index: Integer; Item: TncPhysicalPrinter);
begin
     inherited Put(Index, Item);
end;

end.
