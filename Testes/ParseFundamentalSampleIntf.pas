unit ParseFundamentalSampleIntf;

interface

type
  ITextParseFile = interface
    ['{7FF12115-7D78-11D6-923B-0004AC5359AE}']
    function EOF: Boolean;
    function GetLineNumber: Integer;
    function NextLine: String;
    procedure Reset;
    property LineNumber: Integer read GetLineNumber;
  end;
  ITextParsePreferences = interface
    ['{7FF12116-7D78-11D6-923B-0004AC5359AE}']
    function GetDelimiter: String;
    function GetDelimiterPlural: Boolean;
    function GetMaxColumns: Integer;
    function GetStripQuotes: Boolean;
    procedure SetDelimiter(const ADelimiter: String);
    procedure SetDelimiterPlural(const APlural: Boolean);
    procedure SetMaxColumns(const AColumns: Integer);
    procedure SetStripQuotes(const AStripQuotes: Boolean);
    property Delimiter: String read GetDelimiter write SetDelimiter;
    property DelimiterPlural: Boolean read GetDelimiterPlural
                                      write SetDelimiterPlural;
    property MaxColumns: Integer read GetMaxColumns write SetMaxColumns;
    property StripQuotes: Boolean read GetStripQuotes write SetStripQuotes;
  end;
  ITextParser = interface
    ['{7FF12114-7D78-11D6-923B-0004AC5359AE}']
    function EOF: Boolean;
    function GetCurrentLine: String;
    function GetItem(const AIndex: Integer): String;
    function GetItemCount: Integer;
    function GetLineNumber: Integer;
    procedure Next;
    procedure SetLineNumber(const ANumber: Integer);
    property CurrentLine: String read GetCurrentLine;
    property Items[const AIndex: Integer]: String read GetItem;
    property ItemCount: Integer read GetItemCount;
    property LineNumber: Integer read GetLineNumber write SetLineNumber;
  end;

implementation

end.
