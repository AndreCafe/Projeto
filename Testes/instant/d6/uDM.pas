unit uDM;

interface

uses
  SysUtils, Classes, kbmMWCustomConnectionPool, kbmMemTable,
  kbmMWStreamFormat, kbmMWBinaryStreamFormat, kbmMWCustomTransport,
  kbmMWClient, kbmMWTCPIPIndyTransport, kbmMWClientDataset, DB,
  kbmMWCustomDataset, dcSystem;

type
  TdmTouche = class(TDataModule)
    mwCCP: TkbmMWClientConnectionPool;
    mwCT: TkbmMWTCPIPIndyClientTransport;
    mwBinSF: TkbmMWBinaryStreamFormat;
    PS: TkbmMWPooledSession;
    qForms: TkbmMWClientQuery;
    qFormsDFM: TMemoField;
    qFormsPAS: TMemoField;
    qFormsNome: TStringField;
    qFormsDescricao: TMemoField;
    qFormsModulo: TStringField;
    qFormsCriadoEm: TDateTimeField;
    dsForms: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TmwBLOBFileSystem = class(TFileSystem)
  public
    function Tab: TkbmMWClientQuery;
    destructor Destroy; override;
    
    function GetFileSystemLevel:TFileSystemLevel; override;

    function DeleteFile(const FileName: TFileName): Boolean; override;
    
    function FileExists(const FileName: TFileName): Boolean; override;
    function GetFileStream(const FileName: TFileName; Mode: Integer): TStream; override;
  end;

  function GetMWBlobFilerID : TFilerID;
  function SemExt(S: String): String;
  function ForcaExt(S, Ext: String): String;
             
  

var
  dmTouche: TdmTouche;

implementation

{$R *.dfm}


function SemExt(S: String): String;
begin
  if Pos('.', S)>0 then
    Result := Copy(S, 1, pred(Pos('.', S)))
  else
    Result := S;  
end;

function ForcaExt(S, Ext: String): String;
begin
  if Pos('.', S)>0 then
    Result := Copy(S, 1, pred(Pos('.', S)))
  else
    Result := S;  
  if Ext[1]<>'.' then Result := Result + '.';  
  Result := Result + Ext;  
end;

procedure TdmTouche.DataModuleCreate(Sender: TObject);
begin
  RegisterClass(TmwBlobFileSystem);
end;

function GetMWBlobFilerID : TFilerID;
var fs : TmwBlobFileSystem;
begin
  fs := TmwBlobFileSystem.Create(dmTouche.qForms);
  try
    result := GetFilerID(fs);
  finally
    fs.Free;
  end;
end;

function TmwBlobFileSystem.DeleteFile(const FileName: TFileName): Boolean;
begin
  if FileExists(FileName) then begin
    Tab.Delete;
    Result := True;
  end else
    Result := False;  
end;

destructor TmwBlobFileSystem.Destroy;
begin
  if Tab.State in [dsEdit, dsInsert] then 
    Tab.Post;
  inherited;
end;

function TmwBlobFileSystem.FileExists(const FileName: TFileName): Boolean;
begin
  if not Tab.Active then Tab.Open;
  Result := Tab.FindKey([ForcaExt(ExtractFileName(FileName), '.pas')]);
end;

function TmwBlobFileSystem.GetFileStream(const FileName: TFileName; Mode: Integer): TStream;
var 
  FN: String;
begin
  with Tab do begin
    FN := ForcaExt(ExtractFileName(FileName), '.pas');
    if not Active then Open;
    if FindKey([FN]) then 
      Edit
    else begin
      Insert;
      FieldByName('Nome').AsString := FN;  
    end;  

    if UpperCase(ExtractFileExt(FileName))='.DFM' then
      result := CreateBlobStream(FieldByName('DFM'), bmReadWrite)
    else  
      result := CreateBlobStream(FieldByName('PAS'), bmReadWrite);
  end;     
end;

function TmwBlobFileSystem.GetFileSystemLevel:TFileSystemLevel; 
begin
  Result := flOnlyGetStream;
end;

function TmwBlobFileSystem.Tab: TkbmMWClientQuery;
begin
  Result := dmTouche.qForms;
end;


end.
