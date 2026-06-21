unit ParseFundamentalSelfDestructSample;

interface

uses Fundamentals, ParseFundamentalSampleIntf;

type
  TTextParseSelfDestructiveTextFile = class(TFundamental,ITextParseFile)
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

implementation

uses LoggerIntf;

{ TTextParseSelfDestructiveTextFile }

constructor TTextParseSelfDestructiveTextFile.Create(const AFileName: String);
begin
  inherited Create;
  System.AssignFile(FText,AFileName);
  System.Reset(FText);
  FLineNumber := -1;
end;

destructor TTextParseSelfDestructiveTextFile.Destroy;
begin
  Logger.LogMessage('Text file destroying');
  inherited;
end;

function TTextParseSelfDestructiveTextFile.EOF: Boolean;
begin
  Result := FEOF;
end;

function TTextParseSelfDestructiveTextFile.GetLineNumber: Integer;
begin
  Result := FLineNumber;
end;

function TTextParseSelfDestructiveTextFile.NextLine: String;
begin
  FEOF := System.EOF(FText); // Allows you to read last line
  ReadLn(FText,Result);
  if FLineNumber=1 then // Self-destructive
  begin
    Logger.LogMessage(
      '2 lines? This is too hard - I don''t want to live any more!');
    Drop;
  end
  else
    Inc(FLineNumber);
end;

procedure TTextParseSelfDestructiveTextFile.Reset;
begin
  System.Close(FText);
  System.Reset(FText);
  FLineNumber := -1;
end;

end.
