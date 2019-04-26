unit uDMMoz;

interface

uses
  SysUtils, Dialogs, Classes, Windows, LMDCustomComponent, LMDBaseController, LMDCustomContainer,
  LMDGenericList, OleCtrls, MOZILLACONTROLLib_TLB, ActiveX;

type
  TdmMoz = class(TDataModule)
    glRoot: TLMDGenericList;
    glComp: TLMDGenericList;
    glDefaults_Pref: TLMDGenericList;
    glGrepRefs: TLMDGenericList;
    glIPC_Modules: TLMDGenericList;
    glPlugins: TLMDGenericList;
    glRes: TLMDGenericList;
    glRes_Builtin: TLMDGenericList;
    glRes_Dtd: TLMDGenericList;
    glRes_entityTables: TLMDGenericList;
    glRes_Fonts: TLMDGenericList;
    glRes_Html: TLMDGenericList;
  private
    { Private declarations }
    procedure Extrai;
  public
    { Public declarations }
  end;

  TThreadInstallMoz = class ( TThread )
  protected
    procedure Execute; override;
  end;

  procedure InstallMoz;

  function CreateMoz(aOwner: TComponent; aParentWindow: HWND): TMozillaBrowser;

var
  dmMoz: TdmMoz;
  MozInstalled : Boolean = False;

implementation

uses ncShellStart, ncDebug;

{$R *.dfm}

{ TDataModule25 }

function CreateMoz(aOwner: TComponent; aParentWindow: HWND): TMozillaBrowser;
begin
  Result := nil;
  if MozInstalled then
  try
    Result := TMozillaBrowser.Create(aOwner);
    Result.ParentWindow := aParentWindow;
  except
    on E: Exception do begin
      DebugMsg('CreateMoz - Exception: ' + E.Message);
      Result := nil;
    end;
  end;
end;

procedure TdmMoz.Extrai;
var 

  sBase, S: String;
  T : Cardinal;

procedure ExtraiGL(GL : TLMDGenericList);
var I : Integer;
begin
  for I := 0 to GL.Count - 1 do
    with Gl.Items[I] do
      try GL.Items[I].SaveToFile(S+FileName); except end;
end;

begin
  
  T := GetTickCount;
  sBase := ExtractFilePath(ParamStr(0));
  sBase := sBase + 'moz\';

  S := sBase;

  if not DirectoryExists(S) then 
    MkDir(S);

  ExtraiGL(glRoot);

  S := sBase + 'components\';
  if not DirectoryExists(S) then
    MkDir(S);
  ExtraiGL(glComp);

  S := sBase + 'defaults\pref\';
  if not DirectoryExists(S) then
    ForceDirectories(S);
  ExtraiGL(glDefaults_Pref);

  S := sBase + 'greprefs\';
  if not DirectoryExists(S) then
    MkDir(S);
  ExtraiGL(glGrepRefs);

  S := sBase + 'ipc\modules\';
  if not DirectoryExists(S) then
    ForceDirectories(S);
  ExtraiGL(glIPC_Modules);

  S := sBase + 'plugins\';
  if not DirectoryExists(S) then
    MkDir(S);
  ExtraiGL(glPlugins);
  
  S := sBase + 'res\';
  if not DirectoryExists(S) then
    MkDir(S);
  ExtraiGL(glRes);

  S := sBase + 'res\builtin\';
  if not DirectoryExists(S) then
    ForceDirectories(S);
  ExtraiGL(glRes_Builtin);

  S := sBase + 'res\dtd\';
  if not DirectoryExists(S) then
    ForceDirectories(S);
  ExtraiGL(glRes_DTD);

  S := sBase + 'res\entityTables\';
  if not DirectoryExists(S) then
    ForceDirectories(S);
  ExtraiGL(glRes_entityTables);

  S := sBase + 'res\fonts\';
  if not DirectoryExists(S) then
    ForceDirectories(S);
  ExtraiGL(glRes_fonts);

  S := sBase + 'res\html\';
  if not DirectoryExists(S) then
    ForceDirectories(S);
  ExtraiGL(glRes_html);

  S := '/s ' + sBase + 'mozctlx.dll';

  ShellStart('regsvr32', S);
end;

{ TThreadInstallMoz }

procedure TThreadInstallMoz.Execute;
var dm : TdmMoz;
begin
  try
    dm := TdmMoz.Create(nil);
    try
      dm.Extrai;
      MozInstalled := True;
    finally
      dm.Free;
    end;
  except
  end;
  Free;
end;

procedure InstallMoz;
begin
  if not MozInstalled then
    TThreadInstallMoz.Create(False);
end;

Initialization
  OleInitialize(nil);

Finalization
  OleUninitialize;



end.
