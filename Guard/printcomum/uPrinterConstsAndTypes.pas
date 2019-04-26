unit uPrinterConstsAndTypes;

interface

uses windows, sysutils, classes;


type
  PPrinterInfo8A = ^TPrinterInfo8A;
  PPrinterInfo8W = ^TPrinterInfo8W;
  PPrinterInfo8 = PPrinterInfo8A;
  {$EXTERNALSYM _PRINTER_INFO_8A}
  _PRINTER_INFO_8A = record
    pDevMode: PDeviceModeA;
  end;
  {$EXTERNALSYM _PRINTER_INFO_8W}
  _PRINTER_INFO_8W = record
    pDevMode: PDeviceModeW;
  end;
  {$EXTERNALSYM _PRINTER_INFO_8}
  _PRINTER_INFO_8 = _PRINTER_INFO_8A;
  TPrinterInfo8A = _PRINTER_INFO_8A;
  TPrinterInfo8W = _PRINTER_INFO_8W;
  TPrinterInfo8 = TPrinterInfo8A;
  {$EXTERNALSYM PRINTER_INFO_8A}
  PRINTER_INFO_8A = _PRINTER_INFO_8A;
  {$EXTERNALSYM PRINTER_INFO_8W}
  PRINTER_INFO_8W = _PRINTER_INFO_8W;
  {$EXTERNALSYM PRINTER_INFO_8}
  PRINTER_INFO_8 = PRINTER_INFO_8A;

  TPaper = class(TObject)
  private
    FName: string;
    FShortName: string;
    FAdobeName: string;
    FSize: TPoint;
    FDMPaper: Integer;
    function GetHeight: Integer;
    function GetWidth: Integer;
    procedure SetHeight(Value: Integer);
    procedure SetWidth(Value: Integer);
  public                                  
    constructor Create(const AName, AShortName, AAdobeName: string;
      AWidth, AHeight: Integer; ADMPaper: Integer);
    property DMPaper: Integer read FDMPaper;
    property Height: Integer read GetHeight write SetHeight;
    property Name: string read FName;
    property ShortName: string read FShortName;
    property AdobeName: string read FAdobeName;
    property Size: TPoint read FSize write FSize;
    property Width: Integer read GetWidth write SetWidth;
  end;

  TPapers = class(TObject)
  private
    FPapers: TList;
    function GetCount: Integer;
    function GetPaper(Index: Integer): TPaper;
  protected
    procedure AddPapers; virtual;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    procedure Clear;
    procedure Delete(AIndex: Integer);
    function getByDMPaper(ADMPaper: Integer): TPaper;
    function FindByDMPaper(ADMPaper: Integer): Integer;
    function FindByName(const AName: string): Integer;
    function FindByShortName(const AShortName: string): Integer;
    function FindByAdobeName(const AAdobeName: string): Integer;
    function FindBySize(AWidth, AHeight: Integer): Integer;
    procedure Refresh;

    property Count: Integer read GetCount;
    property Papers[Index: Integer]: TPaper read GetPaper; default;
  end;

  function getPaperConstsAsText(aPaper : integer):string;
  function getSourceConsts(aPaper : integer):string;
  function getSourceNames(aPaper : integer):string;

var
  FPaperlist: TPapers;

Const
    kDM_Max_Paper = 118;

    DMPAPER_LETTER = 1;
    DMPAPER_LETTERSMALL = 2;
    DMPAPER_TABLOID = 3;
    DMPAPER_LEDGER = 4;
    DMPAPER_LEGAL = 5;
    DMPAPER_STATEMENT = 6;
    DMPAPER_EXECUTIVE = 7;
    DMPAPER_A3 = 8;
    DMPAPER_A4 = 9;
    DMPAPER_A4SMALL = 10;
    DMPAPER_A5 = 11;
    DMPAPER_B4 = 12;
    DMPAPER_B5 = 13;
    DMPAPER_FOLIO = 14;
    DMPAPER_QUARTO = 15;
    DMPAPER_10X14 = 16;
    DMPAPER_11X17 = 17;
    DMPAPER_NOTE = 18;
    DMPAPER_ENV_9 = 19;
    DMPAPER_ENV_10 = 20;
    DMPAPER_ENV_11 = 21;
    DMPAPER_ENV_12 = 22;
    DMPAPER_ENV_14 = 23;
    DMPAPER_CSHEET = 24;
    DMPAPER_DSHEET = 25;
    DMPAPER_ESHEET = 26;
    DMPAPER_ENV_DL = 27;
    DMPAPER_ENV_C5 = 28;
    DMPAPER_ENV_C3 = 29;
    DMPAPER_ENV_C4 = 30;
    DMPAPER_ENV_C6 = 31;
    DMPAPER_ENV_C65 = 32;
    DMPAPER_ENV_B4 = 33;
    DMPAPER_ENV_B5 = 34;
    DMPAPER_ENV_B6 = 35;
    DMPAPER_ENV_ITALY = 36;
    DMPAPER_ENV_MONARCH = 37;
    DMPAPER_ENV_PERSONAL = 38;
    DMPAPER_FANFOLD_US = 39;
    DMPAPER_FANFOLD_STD_GERMAN = 40;
    DMPAPER_FANFOLD_LGL_GERMAN = 41;
    DMPAPER_ISO_B4 = 42;
    DMPAPER_JAPANESE_POSTCARD = 43;
    DMPAPER_9X11 = 44;
    DMPAPER_10X11 = 45;
    DMPAPER_15X11 = 46;
    DMPAPER_ENV_INVITE = 47;
    DMPAPER_RESERVED_48 = 48;
    DMPAPER_RESERVED_49 = 49;
    DMPAPER_LETTER_EXTRA = 50;
    DMPAPER_LEGAL_EXTRA = 51;
    DMPAPER_TABLOID_EXTRA = 52;
    DMPAPER_A4_EXTRA = 53;
    DMPAPER_LETTER_TRANSVERSE = 54;
    DMPAPER_A4_TRANSVERSE = 55;
    DMPAPER_LETTER_EXTRA_TRANSVERSE = 56;
    DMPAPER_A_PLUS = 57;
    DMPAPER_B_PLUS = 58;
    DMPAPER_LETTER_PLUS = 59;
    DMPAPER_A4_PLUS = 60;
    DMPAPER_A5_TRANSVERSE = 61;
    DMPAPER_B5_TRANSVERSE = 62;
    DMPAPER_A3_EXTRA = 63;
    DMPAPER_A5_EXTRA = 64;
    DMPAPER_B5_EXTRA = 65;
    DMPAPER_A2 = 66;
    DMPAPER_A3_TRANSVERSE = 67;
    DMPAPER_A3_EXTRA_TRANSVERSE = 68;
    DMPAPER_DBL_JAPANESE_POSTCARD = 69;
    DMPAPER_A6 = 70;
    DMPAPER_JENV_KAKU2 = 71;
    DMPAPER_JENV_KAKU3 = 72;
    DMPAPER_JENV_CHOU3 = 73;
    DMPAPER_JENV_CHOU4 = 74;
    DMPAPER_LETTER_ROTATED = 75;
    DMPAPER_A3_ROTATED = 76;
    DMPAPER_A4_ROTATED = 77;
    DMPAPER_A5_ROTATED = 78;
    DMPAPER_B4_JIS_ROTATED = 79;
    DMPAPER_B5_JIS_ROTATED = 80;
    DMPAPER_JAPANESE_POSTCARD_ROTATED = 81;
    DMPAPER_DBL_JAPANESE_POSTCARD_ROTATED = 82;
    DMPAPER_A6_ROTATED = 83;
    DMPAPER_JENV_KAKU2_ROTATED = 84;
    DMPAPER_JENV_KAKU3_ROTATED = 85;
    DMPAPER_JENV_CHOU3_ROTATED = 86;
    DMPAPER_JENV_CHOU4_ROTATED = 87;
    DMPAPER_B6_JIS = 88;
    DMPAPER_B6_JIS_ROTATED = 89;
    DMPAPER_12X11 = 90;
    DMPAPER_JENV_YOU4 = 91;
    DMPAPER_JENV_YOU4_ROTATED = 92;
    DMPAPER_P16K = 93;
    DMPAPER_P32K = 94;
    DMPAPER_P32KBIG = 95;
    DMPAPER_PENV_1 = 96;
    DMPAPER_PENV_2 = 97;
    DMPAPER_PENV_3 = 98;
    DMPAPER_PENV_4 = 99;
    DMPAPER_PENV_5 = 100;
    DMPAPER_PENV_6 = 101;
    DMPAPER_PENV_7 = 102;
    DMPAPER_PENV_8 = 103;
    DMPAPER_PENV_9 = 104;
    DMPAPER_PENV_10 = 105;
    DMPAPER_P16K_ROTATED = 106;
    DMPAPER_P32K_ROTATED = 107;
    DMPAPER_P32KBIG_ROTATED = 108;
    DMPAPER_PENV_1_ROTATED = 109;
    DMPAPER_PENV_2_ROTATED = 110;
    DMPAPER_PENV_3_ROTATED = 111;
    DMPAPER_PENV_4_ROTATED = 112;
    DMPAPER_PENV_5_ROTATED = 113;
    DMPAPER_PENV_6_ROTATED = 114;
    DMPAPER_PENV_7_ROTATED = 115;
    DMPAPER_PENV_8_ROTATED = 116;
    DMPAPER_PENV_9_ROTATED = 117;
    DMPAPER_PENV_10_ROTATED = 118;

    DMBIN_AUTO = 7;
    DMBIN_CASSETTE = 14;
    DMBIN_ENVELOPE = 5;
    DMBIN_ENVMANUAL = 6;
    DMBIN_FORMSOURCE = 15;
    DMBIN_LARGECAPACITY = 11;
    DMBIN_LARGEFMT = 10;
    DMBIN_LOWER = 2;
    DMBIN_MANUAL = 4;
    DMBIN_MIDDLE = 3;
    DMBIN_ONLYONE = 1;
    DMBIN_SMALLFMT = 9;
    DMBIN_TRACTOR = 8;
    DMBIN_UPPER = 1;
    DMBIN_USER = 256;

    DMRES_DRAFT = -1;
    DMRES_HIGH = -4;
    DMRES_LOW = -2;
    DMRES_MEDIUM = -3;

    DMCOLOR_COLOR = 2;
    DMCOLOR_MONOCHROME = 1;

    DMDUP_HORIZONTAL = 3;
    DMDUP_SIMPLEX = 1;
    DMDUP_VERTICAL = 2;

    DMTT_BITMAP = 1;
    DMTT_DOWNLOAD = 2;
    DMTT_DOWNLOAD_OUTLINE = 4;
    DMTT_SUBDEV = 3;

    DMCOLLATE_FALSE = 0;
    DMCOLLATE_TRUE = 1;

    DM_GRAYSCALE  = 1;// This flag is no longer valid
    DM_INTERLACED = 2; // This flag is no longer valid

    DMICMMETHOD_DEVICE = 4;
    DMICMMETHOD_DRIVER = 3;
    DMICMMETHOD_NONE = 1;
    DMICMMETHOD_SYSTEM = 2;
    DMICMMETHOD_USER = 256;

    DMICM_ABS_COLORIMETRIC = 4;
    DMICM_COLORIMETRIC = 3;
    DMICM_CONTRAST = 2;
    DMICM_SATURATE = 1;
    DMICM_USER = 256;

    DMMEDIA_GLOSSY = 3;
    DMMEDIA_STANDARD = 1;
    DMMEDIA_TRANSPARENCY = 2;
    DMMEDIA_USER = 256;

    DMDITHER_COARSE = 2;
    DMDITHER_ERRORDIFFUSION = 5;
    DMDITHER_FINE = 3;
    DMDITHER_GRAYSCALE = 10;
    DMDITHER_LINEART = 4;
    DMDITHER_NONE = 1;
    DMDITHER_RESERVED6 = 6;
    DMDITHER_RESERVED7 = 7;
    DMDITHER_RESERVED8 = 8;
    DMDITHER_RESERVED9 = 9;
    DMDITHER_USER = 256;

var
    _SourceNames : array [1..256] of string;
    _SourceConsts : array [1..256] of string;

Const
    _PaperConsts : array [1..kDM_Max_Paper] of string = (
      'DMPAPER_LETTER',
      'DMPAPER_LETTERSMALL',
      'DMPAPER_TABLOID',
      'DMPAPER_LEDGER',
      'DMPAPER_LEGAL',
      'DMPAPER_STATEMENT',
      'DMPAPER_EXECUTIVE',
      'DMPAPER_A3',
      'DMPAPER_A4',
      'DMPAPER_A4SMALL',
      'DMPAPER_A5',
      'DMPAPER_B4',
      'DMPAPER_B5',
      'DMPAPER_FOLIO',
      'DMPAPER_QUARTO',
      'DMPAPER_10X14',
      'DMPAPER_11X17',
      'DMPAPER_NOTE',
      'DMPAPER_ENV_9',
      'DMPAPER_ENV_10',
      'DMPAPER_ENV_11',
      'DMPAPER_ENV_12',
      'DMPAPER_ENV_14',
      'DMPAPER_CSHEET',
      'DMPAPER_DSHEET',
      'DMPAPER_ESHEET',
      'DMPAPER_ENV_DL',
      'DMPAPER_ENV_C5',
      'DMPAPER_ENV_C3',
      'DMPAPER_ENV_C4',
      'DMPAPER_ENV_C6',
      'DMPAPER_ENV_C65',
      'DMPAPER_ENV_B4',
      'DMPAPER_ENV_B5',
      'DMPAPER_ENV_B6',
      'DMPAPER_ENV_ITALY',
      'DMPAPER_ENV_MONARCH',
      'DMPAPER_ENV_PERSONAL',
      'DMPAPER_FANFOLD_US',
      'DMPAPER_FANFOLD_STD_GERMAN',
      'DMPAPER_FANFOLD_LGL_GERMAN',
      'DMPAPER_ISO_B4',
      'DMPAPER_JAPANESE_POSTCARD',
      'DMPAPER_9X11',
      'DMPAPER_10X11',
      'DMPAPER_15X11',
      'DMPAPER_ENV_INVITE',
      'DMPAPER_RESERVED_48',
      'DMPAPER_RESERVED_49',
      'DMPAPER_LETTER_EXTRA',
      'DMPAPER_LEGAL_EXTRA',
      'DMPAPER_TABLOID_EXTRA',
      'DMPAPER_A4_EXTRA',
      'DMPAPER_LETTER_TRANSVERSE',
      'DMPAPER_A4_TRANSVERSE',
      'DMPAPER_LETTER_EXTRA_TRANSVERSE',
      'DMPAPER_A_PLUS',
      'DMPAPER_B_PLUS',
      'DMPAPER_LETTER_PLUS',
      'DMPAPER_A4_PLUS',
      'DMPAPER_A5_TRANSVERSE',
      'DMPAPER_B5_TRANSVERSE',
      'DMPAPER_A3_EXTRA',
      'DMPAPER_A5_EXTRA',
      'DMPAPER_B5_EXTRA',
      'DMPAPER_A2',
      'DMPAPER_A3_TRANSVERSE',
      'DMPAPER_A3_EXTRA_TRANSVERSE',
      'DMPAPER_DBL_JAPANESE_POSTCARD',
      'DMPAPER_A6',
      'DMPAPER_JENV_KAKU2',
      'DMPAPER_JENV_KAKU3',
      'DMPAPER_JENV_CHOU3',
      'DMPAPER_JENV_CHOU4',
      'DMPAPER_LETTER_ROTATED',
      'DMPAPER_A3_ROTATED',
      'DMPAPER_A4_ROTATED',
      'DMPAPER_A5_ROTATED',
      'DMPAPER_B4_JIS_ROTATED',
      'DMPAPER_B5_JIS_ROTATED',
      'DMPAPER_JAPANESE_POSTCARD_ROTATED',
      'DMPAPER_DBL_JAPANESE_POSTCARD_ROTATED',
      'DMPAPER_A6_ROTATED',
      'DMPAPER_JENV_KAKU2_ROTATED',
      'DMPAPER_JENV_KAKU3_ROTATED',
      'DMPAPER_JENV_CHOU3_ROTATED',
      'DMPAPER_JENV_CHOU4_ROTATED',
      'DMPAPER_B6_JIS',
      'DMPAPER_B6_JIS_ROTATED',
      'DMPAPER_12X11',
      'DMPAPER_JENV_YOU4',
      'DMPAPER_JENV_YOU4_ROTATED',
      'DMPAPER_P16K',
      'DMPAPER_P32K',
      'DMPAPER_P32KBIG',
      'DMPAPER_PENV_1',
      'DMPAPER_PENV_2',
      'DMPAPER_PENV_3',
      'DMPAPER_PENV_4',
      'DMPAPER_PENV_5',
      'DMPAPER_PENV_6',
      'DMPAPER_PENV_7',
      'DMPAPER_PENV_8',
      'DMPAPER_PENV_9',
      'DMPAPER_PENV_10',
      'DMPAPER_P16K_ROTATED',
      'DMPAPER_P32K_ROTATED',
      'DMPAPER_P32KBIG_ROTATED',
      'DMPAPER_PENV_1_ROTATED',
      'DMPAPER_PENV_2_ROTATED',
      'DMPAPER_PENV_3_ROTATED',
      'DMPAPER_PENV_4_ROTATED',
      'DMPAPER_PENV_5_ROTATED',
      'DMPAPER_PENV_6_ROTATED',
      'DMPAPER_PENV_7_ROTATED',
      'DMPAPER_PENV_8_ROTATED',
      'DMPAPER_PENV_9_ROTATED',
      'DMPAPER_PENV_10_ROTATED'
    );




implementation

function getPaperConstsAsText(aPaper : integer):string;
begin
    if (aPaper>0) and (aPaper<=kDM_Max_Paper) then
        Result := _PaperConsts[aPaper]
    else
        Result := 'DMPAPER_USER';
end;

function getSourceConsts(aPaper : integer):string;
begin
    if (aPaper>0) and (aPaper<=kDM_Max_Paper) then
        Result := _SourceConsts[aPaper]
    else
        Result := '';
end;

function getSourceNames(aPaper : integer):string;
begin
    if (aPaper>0) then
        Result := _SourceNames[aPaper]
    else
        Result := '';
end;


function InchToLoMetric(Value: Extended): Integer;
begin
  Result := Round(Value * 254);
end;


{ TPaper }

constructor TPaper.Create(const AName, AShortName, AAdobeName: string; AWidth, AHeight,
  ADMPaper: Integer);
begin
  inherited Create;
  FName := AName;
  FShortName := AShortName;
  FAdobeName := AAdobeName;
  FSize.X := AWidth;
  FSize.Y := AHeight;
  FDMPaper := ADMPaper;
end;

function TPaper.GetHeight: Integer;
begin
  Result := FSize.Y;
end;

function TPaper.GetWidth: Integer;
begin
  Result := FSize.X;
end;

procedure TPaper.SetHeight(Value: Integer);
begin
  FSize.Y := Value;
end;

procedure TPaper.SetWidth(Value: Integer);
begin
  FSize.X := Value;
end;

{ TPapers }

constructor TPapers.Create;
begin
  inherited;
  FPapers := TList.Create;
  Refresh;
end;

destructor TPapers.Destroy;
begin
  Clear;
  FreeAndNil(FPapers);
  inherited;
end;

procedure TPapers.Clear;
begin
  while Count > 0 do Delete(Count - 1);
end;

procedure TPapers.Delete(AIndex: Integer);
begin
  TObject(FPapers[AIndex]).Free;
  FPapers.Delete(AIndex);
end;

function TPapers.FindByDMPaper(ADMPaper: Integer): Integer;
begin
  for Result := 0 to Count - 1 do
    if Papers[Result].DMPaper = ADMPaper then Exit;
  Result := -1;
end;

function TPapers.getByDMPaper(ADMPaper: Integer): TPaper;
var
    id : integer;
begin
    result := nil;
    id := FindByDMPaper(ADMPaper);
    if id >-1 then
      result := getPaper(id);
end;

function TPapers.FindByName(const AName: string): Integer;
begin
  for Result := 0 to Count - 1 do
    if SameText(Papers[Result].Name, AName) then
      Exit;
  Result := -1;       
end;

function TPapers.FindByShortName(const AShortName: string): Integer;
begin
  for Result := 0 to Count - 1 do
    if SameText(Papers[Result].ShortName, AShortName) then
      Exit;
  Result := -1;
end;

function TPapers.FindByAdobeName(const AAdobeName: string): Integer;
begin
  for Result := 0 to Count - 1 do
    if SameText(Papers[Result].AdobeName, AAdobeName) then
      Exit;
  Result := -1;
end;

function TPapers.FindBySize(AWidth, AHeight: Integer): Integer;
begin
  for Result := 0 to Count - 1 do
    if (Abs(Papers[Result].Width - AWidth) < 2) and (Abs(Papers[Result].Height - AHeight) < 2) then 
      Exit;
  Result := -1;
end;

procedure TPapers.Refresh;
begin
  Clear;
  AddPapers;
end;

procedure TPapers.AddPapers;

  procedure Add(const AName, AShortName: string; AWidth, AHeight: Integer; DMPaper: Integer);
  begin
    FPapers.Add(TPaper.Create(AName, AShortName, '', AWidth, AHeight, DMPaper));
  end;

  procedure AddAdobe(const AName: string; AWidth, AHeight: double;const DMPaper: Integer=-1);
  var
    aPaper : TPaper;
  begin
    if DMPaper>-1 then begin
        aPaper := getByDMPaper(DMPaper);
        if aPaper<>nil then
            aPaper.FAdobeName := AName;
    end else
        aPaper := TPaper.Create(AName, AName, AName, trunc(AWidth), trunc(AHeight), DMPaper)
  end;

begin  
  Add('Letter 8 1/2 x 11 in', 'Letter', InchToLoMetric(8.5), InchToLoMetric(11), DMPAPER_LETTER);
  Add('Letter Small 8 1/2 x 11 in ', 'Letter Small', InchToLoMetric(8.5), InchToLoMetric(11), DMPAPER_LETTERSMALL);
  Add('Tabloid 11 x 17 in', 'Tabloid', InchToLoMetric(11), InchToLoMetric(17), DMPAPER_TABLOID);
  Add('Ledger 17 x 11 in', 'Ledger', InchToLoMetric(17), InchToLoMetric(11), DMPAPER_LEDGER);
  Add('Legal 8 1/2 x 14 in', 'Legal', InchToLoMetric(8.5), InchToLoMetric(14), DMPAPER_LEGAL);
  Add('Statement 5 1/2 x 8 1/2 in', 'Statement', InchToLoMetric(5.5), InchToLoMetric(8.5), DMPAPER_STATEMENT);
  Add('Executive 7 1/4 x 10 1/2 in', 'Executive', InchToLoMetric(7.25), InchToLoMetric(10.5), DMPAPER_EXECUTIVE);
  Add('A3 297 x 420 mm', 'A3', 2970, 4200, DMPAPER_A3);
  Add('A4 210 x 297 mm', 'A4', 2100, 2970, DMPAPER_A4);
  Add('A4 Small 210 x 297 mm', 'A4 Small', 2100, 2970, DMPAPER_A4SMALL);
  Add('A5 148 x 210 mm', 'A5', 1480, 2100, DMPAPER_A5);
  Add('B4 (JIS) 250 x 354', 'B4 (JIS)', 2500, 3540, DMPAPER_B4);
  Add('B5 (JIS) 182 x 257 mm', 'B5 (JIS)', 1820, 2570, DMPAPER_B5);
  Add('Folio 8 1/2 x 13 in', 'Folio', InchToLoMetric(8.5), InchToLoMetric(13), DMPAPER_FOLIO);
  Add('Quarto 215 x 275 mm', 'Quarto', 2150, 2750, DMPAPER_QUARTO);
  Add('10x14 in', '10x14 in', InchToLoMetric(10), InchToLoMetric(14), DMPAPER_10X14);
  Add('11x17 in', '11x17 in', InchToLoMetric(11), InchToLoMetric(17), DMPAPER_11X17);
  Add('Note 8 1/2 x 11 in', 'Note', InchToLoMetric(8.5), InchToLoMetric(11), DMPAPER_NOTE);
  Add('Envelope #9 3 7/8 x 8 7/8', 'Envelope #9', InchToLoMetric(3 + 7 / 8), InchToLoMetric(8 + 7 / 8), DMPAPER_ENV_9);
  Add('Envelope #10 4 1/8 x 9 1/2', 'Envelope #10', InchToLoMetric(4 + 1 / 8), InchToLoMetric(9.5), DMPAPER_ENV_10);
  Add('Envelope #11 4 1/2 x 10 3/8', 'Envelope #11', InchToLoMetric(4.5), InchToLoMetric(10 + 3 / 8), DMPAPER_ENV_11);
  Add('Envelope #12 4 3/4 x 11', 'Envelope #12', InchToLoMetric(4 + 3 / 4), InchToLoMetric(11), DMPAPER_ENV_12);
  Add('Envelope #14 5 x 11 1/2', 'Envelope #14', InchToLoMetric(5), InchToLoMetric(11.5), DMPAPER_ENV_14);
  Add('C sheet 17 x 22 in', 'C sheet', InchToLoMetric(17), InchToLoMetric(22), DMPAPER_CSHEET);
  Add('D sheet 22 x 34 in', 'D sheet', InchToLoMetric(22), InchToLoMetric(34), DMPAPER_DSHEET);
  Add('E sheet 34 x 44 in', 'E sheet', InchToLoMetric(34), InchToLoMetric(44), DMPAPER_ESHEET);
  Add('Envelope DL 110 x 220mm', 'Envelope DL', 1100, 2200, DMPAPER_ENV_DL);
  Add('Envelope C5 162 x 229 mm', 'Envelope C5', 1620, 2290, DMPAPER_ENV_C5);
  Add('Envelope C3 324 x 458 mm', 'Envelope C3', 3240, 4580, DMPAPER_ENV_C3);
  Add('Envelope C4 229 x 324 mm', 'Envelope C4', 2290, 3240, DMPAPER_ENV_C4);
  Add('Envelope C6 114 x 162 mm', 'Envelope C6', 1140, 1620, DMPAPER_ENV_C6);
  Add('Envelope C65 114 x 229 mm', 'Envelope 65', 1140, 2290, DMPAPER_ENV_C65);
  Add('Envelope B4 250 x 353 mm', 'Envelope B4', 2500, 3530, DMPAPER_ENV_B4);
  Add('Envelope B5 176 x 250 mm', 'Envelope B5', 1760, 2500, DMPAPER_ENV_B5);
  Add('Envelope B6 176 x 125 mm', 'Envelope B6', 1760, 1250, DMPAPER_ENV_B6);
  Add('Envelope 110 x 230 mm', 'Envelope 110', 1100, 2300, DMPAPER_ENV_ITALY);
  Add('Envelope Monarch 3 7/8 x 7 1/2 in', 'Envelope Monarch', InchToLoMetric(3 + 7 / 8), InchToLoMetric(7.5), DMPAPER_ENV_MONARCH);
  Add('6 3/4 Envelope 3 5/8 x 6 1/2 in', '6 3/4 Envelope', InchToLoMetric(3 + 5 / 8), InchToLoMetric(6.5), DMPAPER_ENV_PERSONAL);
  Add('US Std Fanfold 14 7/8 x 11 in', 'US Std Fanfold', InchToLoMetric(14 + 7 / 8), InchToLoMetric(11), DMPAPER_FANFOLD_US);
  Add('German Std Fanfold 8 1/2 x 12 in', 'German Std Fanfold', InchToLoMetric(8.5), InchToLoMetric(12), DMPAPER_FANFOLD_STD_GERMAN);
  Add('German Legal Fanfold 8 1/2 x 13 in', 'German Legal Fanfold', InchToLoMetric(8.5), InchToLoMetric(13), DMPAPER_FANFOLD_LGL_GERMAN);
  Add('B4 (ISO) 250 x 353 mm', 'B4 (ISO)', 2500, 3530, DMPAPER_ISO_B4);
  Add('Japanese Postcard 100 x 148 mm', 'Japanese Postcard', 1000, 1480, DMPAPER_JAPANESE_POSTCARD);
  Add('9 x 11 in', '9 x 11 in', InchToLoMetric(90), InchToLoMetric(110), DMPAPER_9X11);
  Add('10 x 11 in', '10 x 11 in', InchToLoMetric(10), InchToLoMetric(11), DMPAPER_10X11);
  Add('15 x 11 in', '15 x 11 in', InchToLoMetric(15), InchToLoMetric(11), DMPAPER_15X11);
  Add('Envelope Invite 220 x 220 mm', 'Envelope Invite', 2200, 2200, DMPAPER_ENV_INVITE);
//  DMPAPER_RESERVED_48        = 48;  { RESERVED--DO NOT USE                }
//  DMPAPER_RESERVED_49        = 49;  { RESERVED--DO NOT USE                }
  Add('Letter Extra 9 \275 x 12 in', 'Legal Extra', InchToLoMetric(9 + 1 / 275), InchToLoMetric(12), DMPAPER_LETTER_EXTRA);
  Add('Legal Extra 9 \275 x 15 in', 'Legal Extra', InchToLoMetric(9 + 1 / 275), InchToLoMetric(15), DMPAPER_LEGAL_EXTRA);
  Add('Tabloid Extra 11.69 x 18 in', 'Tabloid Extra', InchToLoMetric(11.69), InchToLoMetric(18), DMPAPER_TABLOID_EXTRA);
  Add('A4 Extra 9.27 x 12.69 in', 'A4 Extra', InchToLoMetric(9.27), InchToLoMetric(12.69), DMPAPER_A4_EXTRA);
  Add('Letter Transverse 8 \275 x 11 in', 'Letter Transverse', InchToLoMetric(8 + 1 / 275), InchToLoMetric(11), DMPAPER_LETTER_TRANSVERSE);
  Add('A4 Transverse 210 x 297 mm', 'A4 Transverse', 2100, 2970, DMPAPER_LETTER_EXTRA_TRANSVERSE);
  Add('Letter Extra Transverse 9\275 x 12 in', 'Letter Extra Transverse', InchToLoMetric(9 + 1 / 275), InchToLoMetric(12), DMPAPER_LETTER_EXTRA_TRANSVERSE);
  Add('SuperASuperAA4 227 x 356 mm', 'SuperASuperAA4', 2270, 3560, DMPAPER_A_PLUS);
  Add('SuperBSuperBA3 305 x 487 mm', 'SuperBSuperBA3', 3050, 4870, DMPAPER_B_PLUS);
  Add('Letter Plus 8.5 x 12.69 in', 'Letter Plus', InchToLoMetric(8.5), InchToLoMetric(12.69), DMPAPER_LETTER_PLUS);
  Add('A4 Plus 210 x 330 mm', 'A4 Plus', 2100, 3300, DMPAPER_A4_PLUS);
  Add('A5 Transverse 148 x 210 mm', 'A5 Transverse', 1480, 2100, DMPAPER_A5_TRANSVERSE);
  Add('B5 (JIS) Transverse 182 x 257 mm', 'B5 (JIS) Transverse', 1820, 2570, DMPAPER_B5_TRANSVERSE);
  Add('A3 Extra 322 x 445 mm', 'A3 Extra', 3220, 4450, DMPAPER_A3_EXTRA);
  Add('A5 Extra 174 x 235 mm', 'A5 Extra', 1740, 2350, DMPAPER_A5_EXTRA);
  Add('B5 (ISO) Extra 201 x 276 mm', 'B5 (ISO) Extra', 2010, 2760, DMPAPER_B5_EXTRA);
  Add('A2 420 x 594 mm', 'A2', 4200, 5940, DMPAPER_A2);
  Add('A3 Transverse 297 x 420 mm', 'A3 Transverse', 2970, 4200, DMPAPER_A3_TRANSVERSE);
  Add('A3 Extra Transverse 322 x 445 mm', 'A3 Extra Transverse', 3220, 4450, DMPAPER_A3_EXTRA_TRANSVERSE);

  if Win32MajorVersion >= 5 then
  begin
    Add('Japanese Double Postcard 200 x 148 mm', 'Japanese Double Postcard', 2000, 148, DMPAPER_DBL_JAPANESE_POSTCARD);
    Add('A6 105 x 148 mm', 'A6', 1050, 1480, DMPAPER_A6);
  //  Add('Japanese Envelope Kaku #2', 'Japanese Envelope Kaku #2', 0, 0, DMPAPER_JENV_KAKU2);
  //  Add('Japanese Envelope Kaku #3', 'Japanese Envelope Kaku #3', 0, 0, DMPAPER_JENV_KAKU3);
  //  Add('Japanese Envelope Chou #3', 'Japanese Envelope Kaku #3', 0, 0, DMPAPER_JENV_CHOU3);
  //  Add('Japanese Envelope Chou #4', 'Japanese Envelope Kaku #4', 0, 0, DMPAPER_JENV_CHOU4);
    Add('Letter Rotated 11 x 8 1/2 11 in', 'Letter Rotated', InchToLoMetric(11), InchToLoMetric(8.5), DMPAPER_LETTER_ROTATED);
    Add('A3 Rotated 420 x 297 mm', 'A3 Rotated', 4200, 2970, DMPAPER_A3_ROTATED);
    Add('A4 Rotated 297 x 210 mm', 'A4 Rotated', 2970, 2100, DMPAPER_A4_ROTATED);
    Add('A5 Rotated 210 x 148 mm', 'A5 Rotated', 2100, 1480, DMPAPER_A5_ROTATED);
    Add('B4 (JIS) Rotated 364 x 257 mm', 'B4 (JIS) Rotated', 3640, 2570, DMPAPER_B4_JIS_ROTATED);
    Add('B5 (JIS) Rotated 257 x 182 mm', 'B5 (JIS) Rotated', 2570, 1820, DMPAPER_B5_JIS_ROTATED);
    Add('Japanese Postcard Rotated 148 x 100 mm', 'Japanese Postcard Rotated', 1480, 1000, DMPAPER_JAPANESE_POSTCARD_ROTATED);
    Add('A6 Rotated 148 x 105 mm', 'A6 Rotated', 1480, 1050, DMPAPER_A6_ROTATED);
  //  Add('Japanese Envelope Kaku #2 Rotated', 'Japanese Envelope Kaku #2 Rotated', 0, 0, DMPAPER_JENV_KAKU2_ROTATED);
  //  Add('Japanese Envelope Kaku #3 Rotated', 'Japanese Envelope Kaku #4 Rotated', 0, 0, DMPAPER_JENV_KAKU3_ROTATED);
  //  Add('Japanese Envelope Chou #3 Rotated', 'Japanese Envelope Chou #3 Rotated', 0, 0, DMPAPER_JENV_CHOU3_ROTATED);
  //  Add('Japanese Envelope Chow #4 Rotated', 'Japanese Envelope Chou #4 Rotated', 0, 0, DMPAPER_JENV_CHOU4_ROTATED);
    Add('B6 (JIS) 128 x 182 mm', 'B6 (JIS)', 1280, 1820, DMPAPER_B6_JIS);
    Add('B6 (JIS) Rotated 182 x 128 mm', 'B6 (JIS) Rotated', 1820, 1280, DMPAPER_B6_JIS_ROTATED);
    Add('12X11 12 x 11 in', '12X11', InchToLoMetric(12), InchToLoMetric(11), DMPAPER_12X11);
  //  Add('Japanese Envelope You #4', 'Japanese Envelope You #4', 0, 0, DMPAPER_JENV_YOU4);
  //  Add('Japanese Envelope You #4 Rotated', 'Japanese Envelope You #4 Rotated', 0, 0, DMPAPER_JENV_YOU4_ROTATED);
    Add('PRC 16K 146 x 215 mm', 'PRC 16K', 1460, 2150, DMPAPER_P16K);
    Add('PRC 32K 97 x 151 mm', 'PRC 32K', 970, 1510, DMPAPER_P32K);
    Add('PRC 32K(Big) 97 x 151 mm', 'PRC 32K(Big)', 970, 1510, DMPAPER_P32KBIG);
    Add('PRC Envelope #1 102 x 165 mm', 'PRC Envelope #1', 1020, 1650, DMPAPER_PENV_1);
    Add('PRC Envelope #2 102 x 176 mm', 'PRC Envelope #2', 1020, 1760, DMPAPER_PENV_2);
    Add('PRC Envelope #3 125 x 176 mm', 'PRC Envelope #3', 1250, 1760, DMPAPER_PENV_3);
    Add('PRC Envelope #4 110 x 208 mm', 'PRC Envelope #4', 1100, 2080, DMPAPER_PENV_4);
    Add('PRC Envelope #5 110 x 220 mm', 'PRC Envelope #5', 2190, 2200, DMPAPER_PENV_5);
    Add('PRC Envelope #6 120 x 230 mm', 'PRC Envelope #6', 1200, 2300, DMPAPER_PENV_6);
    Add('PRC Envelope #7 160 x 230 mm', 'PRC Envelope #7', 1600, 2300, DMPAPER_PENV_7);
    Add('PRC Envelope #8 120 x 309 mm', 'PRC Envelope #8', 1200, 3090, DMPAPER_PENV_8);
    Add('PRC Envelope #9 229 x 324 mm', 'PRC Envelope #9', 2290, 3240, DMPAPER_PENV_9);
    Add('PRC Envelope #10 324 x 458 mm', 'PRC Envelope #10', 3240, 4580, DMPAPER_PENV_10);
    Add('PRC 16K Rotated 146 x 215 mm', 'PRC 16K Rotated', 1460, 2150, DMPAPER_P16K_ROTATED);
    Add('PRC 32K Rotated 97 x 151 mm', 'PRC 32K Rotated', 970, 1510, DMPAPER_P32K_ROTATED);
    Add('PRC 32K(Big) Rotated 97 x 151 mm', 'PRC 32K(Big) Rotated', 970, 1510, DMPAPER_P32KBIG_ROTATED);
    Add('PRC Envelope #1 Rotated 165 x 102 mm', 'PRC Envelope #1 Rotated', 1650, 1020, DMPAPER_PENV_1_ROTATED);
    Add('PRC Envelope #2 Rotated 176 x 102 mm', 'PRC Envelope #2 Rotated', 1760, 1020, DMPAPER_PENV_2_ROTATED);
    Add('PRC Envelope #3 Rotated 176 x 125 mm', 'PRC Envelope #3 Rotated', 1760, 1250, DMPAPER_PENV_3_ROTATED);
    Add('PRC Envelope #4 Rotated 208 x 110 mm', 'PRC Envelope #4 Rotated', 2080, 1100, DMPAPER_PENV_4_ROTATED);
    Add('PRC Envelope #5 Rotated 220 x 110 mm', 'PRC Envelope #5 Rotated', 2200, 2190, DMPAPER_PENV_5_ROTATED);
    Add('PRC Envelope #6 Rotated 230 x 120 mm', 'PRC Envelope #6 Rotated', 2300, 1200, DMPAPER_PENV_6_ROTATED);
    Add('PRC Envelope #7 Rotated 230 x 160 mm', 'PRC Envelope #7 Rotated', 2300, 1600, DMPAPER_PENV_7_ROTATED);
    Add('PRC Envelope #8 Rotated 309 x 120 mm', 'PRC Envelope #8 Rotated', 3090, 1200, DMPAPER_PENV_8_ROTATED);
    Add('PRC Envelope #9 Rotated 324 x 229 mm', 'PRC Envelope #9 Rotated', 3240, 2290, DMPAPER_PENV_9_ROTATED);
    Add('PRC Envelope #10 Rotated 458 x 324 mm', 'PRC Envelope #10 Rotated', 4580, 3240, DMPAPER_PENV_10_ROTATED);
  end;
  Add('Custom', 'Custom', 0, 0, DMPAPER_USER);


  AddAdobe('10x11',254,279.4,DMPAPER_10X11);
  AddAdobe('10x13',254,330.2);
  AddAdobe('10x14',254,355.6,DMPAPER_10X14);
  AddAdobe('12x11',304.8,279.4,DMPAPER_12X11);
  AddAdobe('15x11',381,279.4,DMPAPER_15X11);
  AddAdobe('7x9',177.8,228.6);
  AddAdobe('8x10',203.2,254);
  AddAdobe('9x11',228.6,279.4,DMPAPER_9X11);
  AddAdobe('9x12',228.6,304.8);
  AddAdobe('A0',841,1189);
  AddAdobe('A1',594,841);
  AddAdobe('A2',420,594,DMPAPER_A2);
  AddAdobe('A3',297,420,DMPAPER_A3);
  AddAdobe('A3.Transverse',297,420,DMPAPER_A3_TRANSVERSE);
  AddAdobe('A3Extra',322,445,DMPAPER_A3_EXTRA);
  AddAdobe('A3Extra.Transverse',322,445,DMPAPER_A3_EXTRA_TRANSVERSE);
  AddAdobe('A3Rotated',420,297,DMPAPER_A3_ROTATED);
  AddAdobe('A4',210,297,DMPAPER_A4);
  AddAdobe('A4.Transverse',210,297,DMPAPER_A4_TRANSVERSE);
  AddAdobe('A4Extra',235.5,322.3,DMPAPER_A4_EXTRA);
  AddAdobe('A4Plus',210,330,DMPAPER_A4_PLUS);
  AddAdobe('A4Rotated',297,210,DMPAPER_A4_ROTATED);
  AddAdobe('A4Small',210,297,DMPAPER_A4SMALL);
  AddAdobe('A5',148,210,DMPAPER_A5);
  AddAdobe('A5.Transverse',148,210,DMPAPER_A5_TRANSVERSE);
  AddAdobe('A5Extra',174,235,DMPAPER_A5_EXTRA);
  AddAdobe('A5Rotated',210,148,DMPAPER_A5_ROTATED);
  AddAdobe('A6',105,148,DMPAPER_A6);
  AddAdobe('A6Rotated',148,105,DMPAPER_A6_ROTATED);
  AddAdobe('A7',74,105);
  AddAdobe('A8',52,74);
  AddAdobe('A9',37,52);
  AddAdobe('A10',26,37);
  AddAdobe('AnsiC',431.8,558.8);
  AddAdobe('AnsiD',558.8,863.6);
  AddAdobe('AnsiE',863.6,1118);
  AddAdobe('ARCHA',228.6,304.8);
  AddAdobe('ARCHB',304.8,457.2);
  AddAdobe('ARCHC',457.2,609.6,DMPAPER_CSHEET);
  AddAdobe('ARCHD',609.6,914.4,DMPAPER_DSHEET);
  AddAdobe('ARCHE',914.4,1219,DMPAPER_ESHEET);
  AddAdobe('B0',1030,1456);
  AddAdobe('B1',728,1030);
  AddAdobe('B2',515,728);
  AddAdobe('B3',364,515);
  AddAdobe('B4',257,364,DMPAPER_B4);
  AddAdobe('B4Rotated',364,257,DMPAPER_B4_JIS_ROTATED);
  AddAdobe('B5',182,257,DMPAPER_B5);
  AddAdobe('B5.Transverse',182,257,DMPAPER_B5_TRANSVERSE);
  AddAdobe('B5Rotated',257,182,DMPAPER_B5_JIS_ROTATED);
  AddAdobe('B6',128,182,DMPAPER_B6_JIS);
  AddAdobe('B6Rotated',182,128,DMPAPER_B6_JIS_ROTATED);
  AddAdobe('B7',91,128);
  AddAdobe('B8',64,91);
  AddAdobe('B9',45,64);
  AddAdobe('B10',32,45);
  AddAdobe('DoublePostcard',200,148,DMPAPER_DBL_JAPANESE_POSTCARD);
  AddAdobe('DoublePostcardRotated',148,200,DMPAPER_DBL_JAPANESE_POSTCARD_ROTATED);
  AddAdobe('Env9',98.4,225.4,DMPAPER_ENV_9);
  AddAdobe('Env10',104.8,241.3,DMPAPER_ENV_10);
  AddAdobe('Env11',114.3,263.5,DMPAPER_ENV_11);
  AddAdobe('Env12',120.7,279.4,DMPAPER_ENV_12);
  AddAdobe('Env14',127,292.1,DMPAPER_ENV_14);
  AddAdobe('EnvC0',917,1297);
  AddAdobe('EnvC1',648,917);
  AddAdobe('EnvC2',458,648);
  AddAdobe('EnvC3',324,458,DMPAPER_ENV_C3);
  AddAdobe('EnvC4',229,324,DMPAPER_ENV_C4);
  AddAdobe('EnvC5',162,229,DMPAPER_ENV_C5);
  AddAdobe('EnvC6',114,162,DMPAPER_ENV_C6);
  AddAdobe('EnvC65',114,229,DMPAPER_ENV_C65);
  AddAdobe('EnvC7',81,114);
  AddAdobe('EnvChou3',120,235,DMPAPER_JENV_CHOU3);
  AddAdobe('EnvChou3Rotated',235,120,DMPAPER_JENV_CHOU3_ROTATED);
  AddAdobe('EnvChou4',90,205,DMPAPER_JENV_CHOU4);
  AddAdobe('EnvChou4Rotated',205,90,DMPAPER_JENV_CHOU4_ROTATED);
  AddAdobe('EnvDL',110,220,DMPAPER_ENV_DL);
  AddAdobe('EnvInvite',220,220,DMPAPER_ENV_INVITE);
  AddAdobe('EnvISOB4',250,353,DMPAPER_ENV_B4);
  AddAdobe('EnvISOB5',176,250,DMPAPER_ENV_B5);
  AddAdobe('EnvISOB6',176,125,DMPAPER_ENV_B6);
  AddAdobe('EnvItalian',110,230,DMPAPER_ENV_ITALY);
  AddAdobe('EnvKaku2',240,332,DMPAPER_JENV_KAKU2);
  AddAdobe('EnvKaku2Rotated',332,240,DMPAPER_JENV_KAKU2_ROTATED);
  AddAdobe('EnvKaku3',216,277,DMPAPER_JENV_KAKU3);
  AddAdobe('EnvKaku3Rotated',277,216,DMPAPER_JENV_KAKU3_ROTATED);
  AddAdobe('EnvMonarch',98.43,190.5,DMPAPER_ENV_MONARCH);
  AddAdobe('EnvPersonal',92.08,165.1,DMPAPER_ENV_PERSONAL);
  AddAdobe('EnvPRC1',102,165,DMPAPER_PENV_1);
  AddAdobe('EnvPRC1Rotated',165,102,DMPAPER_PENV_1_ROTATED);
  AddAdobe('EnvPRC2',102,176,DMPAPER_PENV_2);
  AddAdobe('EnvPRC2Rotated',176,102,DMPAPER_PENV_2_ROTATED);
  AddAdobe('EnvPRC3',125,176,DMPAPER_PENV_3);
  AddAdobe('EnvPRC3Rotated',176,125,DMPAPER_PENV_3_ROTATED);
  AddAdobe('EnvPRC4',110,208,DMPAPER_PENV_4);
  AddAdobe('EnvPRC4Rotated',208,110,DMPAPER_PENV_4_ROTATED);
  AddAdobe('EnvPRC5',110,220,DMPAPER_PENV_5);
  AddAdobe('EnvPRC5Rotated',220,110,DMPAPER_PENV_5_ROTATED);
  AddAdobe('EnvPRC6',120,230,DMPAPER_PENV_6);
  AddAdobe('EnvPRC6Rotated',230,120,DMPAPER_PENV_6_ROTATED);
  AddAdobe('EnvPRC7',160,230,DMPAPER_PENV_7);
  AddAdobe('EnvPRC7Rotated',230,160,DMPAPER_PENV_7_ROTATED);
  AddAdobe('EnvPRC8',120,309,DMPAPER_PENV_8);
  AddAdobe('EnvPRC8Rotated',309,120,DMPAPER_PENV_8_ROTATED);
  AddAdobe('EnvPRC9',229,324,DMPAPER_PENV_9);
  AddAdobe('EnvPRC9Rotated',324,229,DMPAPER_PENV_9_ROTATED);
  AddAdobe('EnvPRC10',324,458,DMPAPER_PENV_10);
  AddAdobe('EnvPRC10Rotated',458,324,DMPAPER_PENV_10_ROTATED);
  AddAdobe('EnvYou4',105,235,DMPAPER_JENV_YOU4);
  AddAdobe('EnvYou4Rotated',235,105,DMPAPER_JENV_YOU4_ROTATED);
  AddAdobe('Executive',184.2,266.7,DMPAPER_EXECUTIVE);
  AddAdobe('FanFoldUS',377.8,279.4,DMPAPER_FANFOLD_US);
  AddAdobe('FanFoldGerman',215.9,304.8,DMPAPER_FANFOLD_STD_GERMAN);
  AddAdobe('FanFoldGermanLegal',215.9,330,DMPAPER_FANFOLD_LGL_GERMAN);
  AddAdobe('Folio',210,330,DMPAPER_FOLIO);
  AddAdobe('ISOB0',1000,1414);
  AddAdobe('ISOB1',707,1000);
  AddAdobe('ISOB2',500,707);
  AddAdobe('ISOB3',353,500);
  AddAdobe('ISOB4',250,353,DMPAPER_ISO_B4);
  AddAdobe('ISOB5',176,250);
  AddAdobe('ISOB5Extra',201,276,DMPAPER_B5_EXTRA);
  AddAdobe('ISOB6',125,176);
  AddAdobe('ISOB7',88,125);
  AddAdobe('ISOB8',62,88);
  AddAdobe('ISOB9',44,62);
  AddAdobe('ISOB10',31,44);
  AddAdobe('Ledger',431.8,279.4,DMPAPER_LEDGER);
  AddAdobe('Legal',215.9,355.6,DMPAPER_LEGAL);
  AddAdobe('LegalExtra',241.3,381,DMPAPER_LEGAL_EXTRA);
  AddAdobe('Letter',215.9,279.4,DMPAPER_LETTER);
  AddAdobe('Letter.Transverse',215.9,279.4,DMPAPER_LETTER_TRANSVERSE);
  AddAdobe('LetterExtra',241.3,304.8,DMPAPER_LETTER_EXTRA);
  AddAdobe('LetterExtra.Transverse',241.3,304.8,DMPAPER_LETTER_EXTRA_TRANSVERSE);
  AddAdobe('LetterPlus',215.9,322.3,DMPAPER_LETTER_PLUS);
  AddAdobe('LetterRotated',279.4,215.9,DMPAPER_LETTER_ROTATED);
  AddAdobe('LetterSmall',215.9,279.4,DMPAPER_LETTERSMALL);
  AddAdobe('Note',215.9,279.4,DMPAPER_NOTE);
  AddAdobe('Postcard',100,148,DMPAPER_JAPANESE_POSTCARD);
  AddAdobe('PostcardRotated',148,100,DMPAPER_JAPANESE_POSTCARD_ROTATED);
  AddAdobe('PRC16K',146,215,DMPAPER_P16K);
  AddAdobe('PRC16KRotated',215,146,DMPAPER_P16K_ROTATED);
  AddAdobe('PRC32K',97,151,DMPAPER_P32K);
  AddAdobe('PRC32KBig',97,151,DMPAPER_P32KBIG);
  AddAdobe('PRC32KBigRotated',151,97,DMPAPER_P32KBIG_ROTATED);
  AddAdobe('PRC32KRotated',151,97,DMPAPER_P32K_ROTATED);
  AddAdobe('Quarto',215.9,275.1,DMPAPER_QUARTO);
  AddAdobe('Statement',139.7,215.9,DMPAPER_STATEMENT);
  AddAdobe('SuperA',227,356,DMPAPER_A_PLUS);
  AddAdobe('SuperB',305,487,DMPAPER_B_PLUS);
  AddAdobe('Tabloid',279.4,431.8,DMPAPER_TABLOID);
  AddAdobe('TabloidExtra',304.8,457.2,DMPAPER_TABLOID_EXTRA);


end;

function TPapers.GetCount: Integer;
begin
  Result := FPapers.Count;
end;

function TPapers.GetPaper(Index: Integer): TPaper;
begin
  Result := TPaper(FPapers[Index]);
end;

initialization
    FPaperlist := TPapers.create;

    _SourceNames[DMBIN_AUTO]          := 'Auto';
    _SourceNames[DMBIN_CASSETTE]      := 'Cassette';
    _SourceNames[DMBIN_ENVELOPE]      := 'Envelope';
    _SourceNames[DMBIN_ENVMANUAL]     := 'EnvManual';
    _SourceNames[DMBIN_FORMSOURCE]    := 'FormSource';
    _SourceNames[DMBIN_LARGECAPACITY] := 'LargeCapacity';
    _SourceNames[DMBIN_LARGEFMT]      := 'Largefmt';
    _SourceNames[DMBIN_LOWER]         := 'Lower';
    _SourceNames[DMBIN_MANUAL]        := 'Manual';
    _SourceNames[DMBIN_MIDDLE]        := 'Middle';
    _SourceNames[DMBIN_ONLYONE]       := 'Onlyone';
    _SourceNames[DMBIN_SMALLFMT]      := 'SmallFmt';
    _SourceNames[DMBIN_TRACTOR]       := 'Tractor';
    _SourceNames[DMBIN_UPPER]         := 'Upper';
    _SourceNames[DMBIN_USER]          := 'User';

    _SourceConsts[DMBIN_AUTO]          := 'DMBIN_AUTO';
    _SourceConsts[DMBIN_CASSETTE]      := 'DMBIN_CASSETTE';
    _SourceConsts[DMBIN_ENVELOPE]      := 'DMBIN_ENVELOPE';
    _SourceConsts[DMBIN_ENVMANUAL]     := 'DMBIN_ENVMANUAL';
    _SourceConsts[DMBIN_FORMSOURCE]    := 'DMBIN_FORMSOURCE';
    _SourceConsts[DMBIN_LARGECAPACITY] := 'DMBIN_LARGECAPACITY';
    _SourceConsts[DMBIN_LARGEFMT]      := 'DMBIN_LARGEFMT';
    _SourceConsts[DMBIN_LOWER]         := 'DMBIN_LOWER';
    _SourceConsts[DMBIN_MANUAL]        := 'DMBIN_MANUAL';
    _SourceConsts[DMBIN_MIDDLE]        := 'DMBIN_MIDDLE';
    _SourceConsts[DMBIN_ONLYONE]       := 'DMBIN_ONLYONE';
    _SourceConsts[DMBIN_SMALLFMT]      := 'DMBIN_SMALLFMT';
    _SourceConsts[DMBIN_TRACTOR]       := 'DMBIN_TRACTOR';
    _SourceConsts[DMBIN_UPPER]         := 'DMBIN_UPPER';
    _SourceConsts[DMBIN_USER]          := 'DMBIN_USER';

finalization
  FreeAndNil(FPaperlist);

end.
