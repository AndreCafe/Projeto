unit ParseFundamentalSample;

interface

uses Classes, Fundamentals, ParseFundamentalSampleIntf;

{$DEFINE LOG_DESTRUCTION} // Don't define this if you want to use it 'normally'

type
  TTextParseTextFile = class(TFundamental,ITextParseFile)
  private
    FEOF : Boolean;
    FLineNumber : Integer;
    FText : TextFile;
  protected
    // ITextParseFile
    function EOF: Boolean;
    function GetLineNumber: Integer;
    function NextLine: String;
    procedure Reset;
  public
    constructor Create(const AFileName: String);
    destructor Destroy; override;
  end;
  TTextParsePreferences = class(TFundamental,ITextParsePreferences)
  private
    FDelimiter : String;
    FDelimiterPlural : Boolean;
    FMaxColumns : Integer;
    FStripQuotes : Boolean;
  protected
    // ITextParsePreferences
    function GetDelimiter: String;
    function GetDelimiterPlural: Boolean;
    function GetMaxColumns: Integer;
    function GetStripQuotes: Boolean;
    procedure SetDelimiter(const ADelimiter: String);
    procedure SetDelimiterPlural(const APlural: Boolean);
    procedure SetMaxColumns(const AColumns: Integer);
    procedure SetStripQuotes(const AStripQuotes: Boolean);
  public
    constructor Create(const ADelimiter: String; const APlural: Boolean);
    destructor Destroy; override;
  end;
  TTextParser = class(TFundamental,ITextParser)
  private
    FCurrentItems : TStringList;
    FCurrentLine : String;
    FCurrentLineParsed : Boolean;
    FParseFile : ITextParseFile;
    FPreferences : ITextParsePreferences;
  protected
    procedure Detaching(const AFundamental: IFundamental); override;
    procedure EnsureLineParsed; virtual;
    function GetParseFile: ITextParseFile;
    function GetPreferences: ITextParsePreferences;
    procedure ParseCurrentLine; virtual;
    procedure SetParseFile(const AFile: ITextParseFile);
    procedure SetPreferences(const APreferences: ITextParsePreferences);
    property CurrentLine: String read FCurrentLine;
    property CurrentLineParsed: Boolean read FCurrentLineParsed
                                        write FCurrentLineParsed;
    property ParseFile: ITextParseFile read GetParseFile write SetParseFile;
    property Preferences: ITextParsePreferences read GetPreferences
                                                write SetPreferences;
    // ITextParser
    function EOF: Boolean;
    function GetCurrentLine: String;
    function GetItem(const AIndex: Integer): String;
    function GetItemCount: Integer;
    function GetLineNumber: Integer;
    procedure Next;
    procedure SetLineNumber(const ANumber: Integer);
    property LineNumber: Integer read GetLineNumber write SetLineNumber;
  public
    constructor Create(const AFile: ITextParseFile;
      const APreferences: ITextParsePreferences);
    destructor Destroy; override;
  end;

implementation

uses SysUtils, LoggerIntf;

function StripQuotes(const ASource: String): String;
begin
  if (Length(ASource)>=2) and
     (ASource[1]=ASource[Length(ASource)]) and (ASource[1] in ['"','''']) then
    Result := Copy(ASource,2,Length(ASource)-2)
  else
    Result := ASource;
end;

{ TTextParseTextFile }

constructor TTextParseTextFile.Create(const AFileName: String);
begin
  inherited Create;
  System.AssignFile(FText,AFileName);
  System.Reset(FText);
  FLineNumber := -1;
end;

destructor TTextParseTextFile.Destroy;
begin
  {$IFDEF LOG_DESTRUCTION}
  Logger.LogMessage('Text file destroying');
  {$ENDIF}
  inherited;
end;

function TTextParseTextFile.EOF: Boolean;
begin
  Result := FEOF;
end;

function TTextParseTextFile.GetLineNumber: Integer;
begin
  Result := FLineNumber;
end;

function TTextParseTextFile.NextLine: String;
begin
  FEOF := System.EOF(FText); // Allows you to read last line
  ReadLn(FText,Result);
  Inc(FLineNumber);
end;

procedure TTextParseTextFile.Reset;
begin
  System.Close(FText);
  System.Reset(FText);
  FLineNumber := -1;
end;

{ TTextParsePreferences }

constructor TTextParsePreferences.Create(const ADelimiter: String;
  const APlural: Boolean);
begin
  inherited Create;
  FDelimiter := ADelimiter;
  FDelimiterPlural := APlural;
  FMaxColumns := -1;
  FStripQuotes := True;
end;

destructor TTextParsePreferences.Destroy;
begin
  {$IFDEF LOG_DESTRUCTION}
  Logger.LogMessage('Text preferences destroying');
  {$ENDIF}
  inherited;
end;

function TTextParsePreferences.GetDelimiter: String;
begin
  Result := FDelimiter;
end;

function TTextParsePreferences.GetDelimiterPlural: Boolean;
begin
  Result := FDelimiterPlural;
end;

function TTextParsePreferences.GetMaxColumns: Integer;
begin
  Result := FMaxColumns;
end;

function TTextParsePreferences.GetStripQuotes: Boolean;
begin
  Result := FStripQuotes;
end;

procedure TTextParsePreferences.SetDelimiter(const ADelimiter: String);
begin
  FDelimiter := ADelimiter;
end;

procedure TTextParsePreferences.SetDelimiterPlural(const APlural: Boolean);
begin
  FDelimiterPlural := APlural;
end;

procedure TTextParsePreferences.SetMaxColumns(const AColumns: Integer);
begin
  FMaxColumns := AColumns;
end;

procedure TTextParsePreferences.SetStripQuotes(
  const AStripQuotes: Boolean);
begin
  FStripQuotes := AStripQuotes;
end;

{ TTextParser }

constructor TTextParser.Create(const AFile: ITextParseFile;
  const APreferences: ITextParsePreferences);
begin
  inherited Create;
  FCurrentItems := TStringList.Create;
  ParseFile := AFile;
  Preferences := APreferences;
  Next;
end;

destructor TTextParser.Destroy;
begin
  FCurrentItems.Free;
  FCurrentItems := nil;
  {$IFDEF LOG_DESTRUCTION}
  Logger.LogMessage('Text parser destroying');
  {$ENDIF}
  inherited;
end;

procedure TTextParser.Detaching(const AFundamental: IFundamental);
begin
  if EqualsFI(AFundamental,FParseFile) then
    FParseFile := nil;
  inherited;
end;

procedure TTextParser.EnsureLineParsed;
begin
  if not CurrentLineParsed then
    ParseCurrentLine;
end;

function TTextParser.EOF: Boolean;
begin
  if FParseFile=nil then
    Result := True
  else
    Result := FParseFile.EOF;
end;

function TTextParser.GetCurrentLine: String;
begin
  if FParseFile=nil then
    Result := ''
  else
    Result := FCurrentLine;
end;

function TTextParser.GetItem(const AIndex: Integer): String;
begin
  EnsureLineParsed;
  Result := FCurrentItems[AIndex];
end;

function TTextParser.GetItemCount: Integer;
begin
  EnsureLineParsed;
  Result := FCurrentItems.Count;
end;

function TTextParser.GetLineNumber: Integer;
begin
  if FParseFile<>nil then
    Result := FParseFile.LineNumber
  else
    Result := 0;
end;

function TTextParser.GetParseFile: ITextParseFile;
begin
  Result := FParseFile;
end;

function TTextParser.GetPreferences: ITextParsePreferences;
begin
  Result := FPreferences;
end;

procedure TTextParser.Next;
begin
  if FParseFile<>nil then
  begin
    FCurrentLine := FParseFile.NextLine;
    FCurrentLineParsed := False;
  end;
end;

resourcestring
  SNoPreferences =
    'TextParser::ParseCurrentLine - Cannot parse without preferences';
procedure TTextParser.ParseCurrentLine;
var
  LineToUse : String;
  Index : Integer;
  BuildingItem : ShortString;
  QuoteStarted : Boolean;
begin
  Assert(FPreferences<>nil,SNoPreferences);
  LineToUse := Trim(CurrentLine);
  FCurrentItems.Clear;
  Index := 1;
  BuildingItem := '';
  QuoteStarted := False;
  while Index<=Length(LineToUse) do
  begin
    if Preferences.StripQuotes and (LineToUse[Index]='"') then
    begin
      if BuildingItem='' then
      begin
        QuoteStarted := True;
        Inc(Index);
      end
      else
      begin
        QuoteStarted := False;
        Inc(Index);
      end;
    end
    else if not QuoteStarted then
    begin
      if Copy(LineToUse,Index,Length(Preferences.Delimiter))=
              Preferences.Delimiter then
      begin
        FCurrentItems.Add(BuildingItem);
        BuildingItem := '';
        Inc(Index,Length(Preferences.Delimiter));
        if Preferences.DelimiterPlural then
        begin
          while Copy(LineToUse,Index,Length(Preferences.Delimiter))=
            Preferences.Delimiter do
            Inc(Index,Length(Preferences.Delimiter));
        end;
      end
      else
      begin
        BuildingItem := BuildingItem+LineToUse[Index];
        Inc(Index);
      end;
    end
    else
    begin
      BuildingItem := BuildingItem+LineToUse[Index];
      Inc(Index);
    end;
  end;
  if BuildingItem>'' then
    FCurrentItems.Add(BuildingItem);
  // The hard stuff goes in here :)
  CurrentLineParsed := True;
end;

procedure TTextParser.SetLineNumber(const ANumber: Integer);
begin
  if FParseFile<>nil then
  begin
    if LineNumber>ANumber then
      FParseFile.Reset;
    while not EOF and (LineNumber<ANumber) do
      Next;
  end;
end;

procedure TTextParser.SetParseFile(const AFile: ITextParseFile);
begin
  SetMemberAs(FParseFile,AFile,ITextParseFile);
end;

procedure TTextParser.SetPreferences(
  const APreferences: ITextParsePreferences);
begin
  SetMemberAs(FPreferences,APreferences,ITextParsePreferences);
end;

end.
