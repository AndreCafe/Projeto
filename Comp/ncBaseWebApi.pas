unit ncBaseWebApi;
{
    ResourceString: Dario 12/03/13
}

interface

uses Dialogs, SysUtils, Winsock, Windows, ExtActns, ActiveX, UrlMon, Automation, EmbeddedWB, SHFolder, Classes, Forms, idHttp;

type
  TncDownloadUrl = class ( TThread )
  protected
    FRes: Integer;
    FWB: TEmbeddedWB;
    FURL, 
    FFileName, 
    FJS, 
    FJSFrame: String; 
    FOpen: Boolean; 
    FOpenParams: String;
    FDownAction : TDownLoadUrl;

    procedure Progress(Sender: TDownLoadURL; Progress,
      ProgressMax: Cardinal; StatusCode: TURLDownloadStatus; StatusText: String;
      var Cancel: Boolean);
        
    procedure AfterDownload;
  protected 
    procedure Execute; override;
  public
    constructor Create(aWB: TEmbeddedWB; 
                       aURL, aFileName, aJS, aJSFrame: String; 
                       aOpen: Boolean; aOpenParams: String);
  end;
  
  TDownFileStream = class ( TFileStream )
  public
    function Write(const Buffer; Count: Longint): Longint; override;
  end;
  
  TncBaseWebApi = class ( TObjectWrapper )
  protected
    WB: TEmbeddedWB; 
    Form: TForm; 

  public
    constructor Create(aForm: TForm; aWB: TEmbeddedWB);   
  published
    function Win32Platform: OleVariant;
    function Win32MajorVersion: OleVariant;
    function Win32MinorVersion: OleVariant;
    function Win32BuildNumber: OleVariant;
    
    function DotNetInstalled(const aVer: OleVariant): OleVariant;
    function ScreenWidth: OleVariant;
    function ScreenHeight: OleVariant;
    function ExeName: OleVariant;
    function FileVersion(const aFileName: OleVariant): OleVariant;
    function GetParamStr(const aIndex: OleVariant): OleVariant;
    function AppPath: OleVariant;
    function CopyFile(const aFrom, aTo, aFailIfExists: OleVariant): OleVariant;
    function FileExists(const aFileName: OleVariant): OleVariant;
    function TextFromFile(const aFileName: OleVariant): OleVariant;
    function ForceDirectories(const aFileName: OleVariant): OleVariant;
    function LogInfo(const aString: OleVariant): OleVariant;
    
    function DeleteFile(const aFileName: OleVariant): OleVariant;
    function Conta: OleVariant;
    function ContaFree: OleVariant;
    function ContaPremium: OleVariant;
    function AppVer: OleVariant;
    function FullAppVer: OleVariant;
    function DownloadURL(const aURL, aFName, aOpen, aParams, afterDownJS, afterDownJSIFrame: OleVariant): OleVariant;
{    function MonitorURLChange(aJSIFrame: OleVariant): OleVariant;
    function MonitorEXEChange(aJSIFrame: OleVariant): OleVariant;}
    function ShellStart(const aCmd, aParams, aDir: OleVariant): OleVariant;

    function ServerIP: OleVariant; virtual;
    function UsernameFunc: OleVariant; virtual;
    function UserAdmin: OleVariant; virtual;
    function CloseApp: OleVariant; virtual;
    function CloseWindow: OleVariant; virtual;
    function PopupUrl(const aURL: OleVariant): OleVariant; virtual;
  end;

implementation

uses
  ncShellStart, ncClassesBase, ncBrowserUtils, uVersionInfo, ncDebug,
  ncWBFrameExecScript, ncFrmWebPopup;

{ TncBaseWebApi }


type
   ThreadRenameExec = class ( TThread )
   protected
     OldName, NewName, Params: String;
     Open: Boolean;
     procedure Execute; override;
   public
     constructor Create(aOldName, aNewName: String; aOpen: Boolean; aParams: String);  
   end;

function TncBaseWebApi.UserAdmin: OleVariant;
begin
  Result := 0;
end;

function TncBaseWebApi.AppPath: OleVariant;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

function TncBaseWebApi.AppVer: OleVariant;
begin
  Result := Trim(Copy(SelfVersion, 7, 20));
end;

function TncBaseWebApi.CloseApp: OleVariant;
begin
  Result := 0;
end;

function TncBaseWebApi.CloseWindow: OleVariant;
begin
  Result := 0;
end;

function TncBaseWebApi.Conta: OleVariant;
begin
  Result := gConfig.Conta;
end;

function TncBaseWebApi.ContaFree: OleVariant;
begin
  Result := gConfig.FreePremium and (gConfig.AssinaturaVenceEm<Date);
end;

function TncBaseWebApi.ContaPremium: OleVariant;
begin
  Result := gConfig.FreePremium and (gConfig.AssinaturaVenceEm>=Date);
end;

function TncBaseWebApi.CopyFile(const aFrom, aTo, aFailIfExists: OleVariant): OleVariant;
var
  sFrom, sTo : String;
  bFail : Boolean;
begin
  sFrom := aFrom;
  sTo := aTo;
  bFail := (aFailIfExists=1);
  DebugMsg('TncBaseWebApi.CopyFile - From: '+sFrom+' - To: '+sTo+' - FailIfExists: ' + BoolStr[bFail]); // do not localize
  Result := Windows.CopyFile(pChar(sFrom), pChar(sTo), bFail);
end;

constructor TncBaseWebApi.Create(aForm: TForm; aWB: TEmbeddedWB);
begin
  inherited Connect(aForm);
  Form := aForm;
  WB := aWB;
end;

function TncBaseWebApi.DeleteFile(const aFileName: OleVariant): OleVariant;
var s: String;
begin
  s := aFileName;
  Result := Windows.DeleteFile(PChar(s));
end;

function TncBaseWebApi.DotNetInstalled(const aVer: OleVariant): OleVariant;
var 
  s: String;
  sr : TSearchRec;
begin
  Result := 0;
  s := GetSysFolder(CSIDL_WINDOWS) + '\Microsoft.NET\Framework'; // do not localize
  if not DirectoryExists(s) then Exit;
  if FindFirst(s+'\*.*', faDirectory, sr)=0 then
  try
    repeat
      s := aVer;
      if Pos(s, sr.Name)=1 then begin
        Result := 1;
        Exit;
      end;
    until (FindNext(sr)<>0);
  finally
    SysUtils.FindClose(sr);
  end;
end;

function TncBaseWebApi.DownloadURL(const aURL, aFName, aOpen, aParams, afterDownJS,
  afterDownJSIFrame: OleVariant): OleVariant;
var s1, s2: String;  
begin
  Result := 1;
  s1 := aURL;
  s2 := aFName;
  CoInitialize(nil);
  TncDownloadUrl.Create(WB, aUrl, aFName, afterDownJS, afterDownJSIFrame, (aOpen=1), aParams);
end;

function TncBaseWebApi.ExeName: OleVariant;
begin
  Result := ExtractFileName(ParamStr(0));
end;

function TncBaseWebApi.FileExists(const aFileName: OleVariant): OleVariant;
begin
  Result := SysUtils.FileExists(aFileName);
end;

function TncBaseWebApi.FileVersion(const aFileName: OleVariant): OleVariant;
begin
  uVersionInfo.GetVersionInfo(aFileName);
end;

function TncBaseWebApi.ForceDirectories(const aFileName: OleVariant): OleVariant;
begin
  SysUtils.ForceDirectories(aFileName);
end;

function TncBaseWebApi.FullAppVer: OleVariant;
begin
  Result := SelfVersion;
end;

function TncBaseWebApi.GetParamStr(const aIndex: OleVariant): OleVariant;
begin
  Result := ParamStr(aIndex);
end;

function TncBaseWebApi.LogInfo(const aString: OleVariant): OleVariant;
begin
  DebugMsg('TncBaseWebApi.LogInfo: ' + aString); // do not localize
end;

function TncBaseWebApi.PopupUrl(const aURL: OleVariant): OleVariant;
var F: TFrmWebPopup;
begin
  if FrmWebPopupClass<>nil then begin
    F := FrmWebPopupClass.Create(nil);
    F.URL := aURL;
    F.Show;
    Result := 1;
  end else
    Result := 0;
end;

function TncBaseWebApi.ScreenHeight: OleVariant;
begin
  Result := Screen.Height;
end;

function TncBaseWebApi.ScreenWidth: OleVariant;
begin
  Result := Screen.Width;
end;

function TncBaseWebApi.ServerIP: OleVariant;
begin
  Result := '127.0.0.1'; // do not localize
end;

function TncBaseWebApi.ShellStart(const aCmd, aParams,
  aDir: OleVariant): OleVariant;
var 
  sCmd, sParams, sDir: String;  
begin
  sCmd := aCmd;
  sParams := aParams;
  sDir := aDir;
  DebugMsg('TncBaseWebApi.ShellStart - aCmd: ' + aCmd + ' - aParams: ' + aParams + ' - aDir: ' + aDir); // do not localize
  ncShellStart.ShellStart(sCmd, sParams, sDir);
  Result := 1;
end;

function TncBaseWebApi.TextFromFile(const aFileName: OleVariant): OleVariant;
var 
  sl : TStrings;
  s  : String;
begin
  s := aFileName;
  if SysUtils.FileExists(s) then begin
    sl := TStringList.Create;
    try
      sl.LoadFromFile(s);
      Result := sl.Text;
    finally
      sl.Free;
    end;
  end else
    Result := '';
end;

function TncBaseWebApi.UsernameFunc: OleVariant;
begin
  Result := ncClassesBase.UsernameAtual;
end;

function TncBaseWebApi.Win32BuildNumber: OleVariant;
begin
  Result := SysUtils.Win32BuildNumber;
end;

function TncBaseWebApi.Win32MajorVersion: OleVariant;
begin
  Result := SysUtils.Win32MajorVersion;
end;

function TncBaseWebApi.Win32MinorVersion: OleVariant;
begin
  Result := SysUtils.Win32MinorVersion;
end;

function TncBaseWebApi.Win32Platform: OleVariant;
begin
  Result := SysUtils.Win32Platform;
end;

{ ThreadRenameExec }

constructor ThreadRenameExec.Create(aOldName, aNewName: String; aOpen: Boolean;
  aParams: String);
begin
  inherited Create(True);
  FreeOnTerminate := True;
  OldName := aOldName;
  NewName := aNewName;
  Open := aOpen;
  Params := aParams;
  Resume;
end;

procedure ThreadRenameExec.Execute;
var C: Integer;
begin
  inherited;
  try
    C := GetTickCount;
    while ((GetTickCount-C)<20000) and (not Application.Terminated) do 
      if RenameFile(OldName, NewName) then begin
        if Open then ShellStart(NewName, Params);
        Break;
      end;
  except
    on E: Exception do
      DebugMsg('ncBaseWebApi.ThreadRenameExec.Execute - Exception: ' + E.Message); // do not localize
  end;
end;

{ TDownFileStream }

function TDownFileStream.Write(const Buffer; Count: Integer): Longint;
begin
  if Application.Terminated then
    raise Exception.Create('application.terminated'); // do not localize
  inherited Write(Buffer, Count);
end;

{ TncDownloadUrl }

procedure TncDownloadUrl.AfterDownload;
begin
  try
    if FJS>'' then 
    if FJSFrame='' then
      FWB.ExecScript(FJS, 'JavaScript') else // do not localize
      FrameExecScript(FWB, FJS, FJSFrame);
  except
    on E: Exception do
      DebugMsg('TncDownloadUrl.AfterDownload - Exception: ' + E.Message); // do not localize
  end;

  ThreadRenameExec.Create(FDownAction.Filename, FFileName, FOpen, FOpenParams);
end;

constructor TncDownloadUrl.Create(aWB: TEmbeddedWB; aURL, aFileName, aJS,
  aJSFrame: String; aOpen: Boolean; aOpenParams: String);
begin
  inherited Create(True);
  FreeOnTerminate := True;
  FWB := aWB;
  FURL := aURL;
  FJS := aJS;
  FJSFrame := aJSFrame;
  FOpen := aOpen;
  FOpenParams := aOpenParams;
  FRes := 0;
  FFilename := aFileName;
  
  Resume;
end;

procedure TncDownloadUrl.Execute;
var D: TDownLoadURL;
 s: String;
 w: wsadata;
begin
  CoInitialize(nil);
  try
    WSAStartup(MakeWord(1, 1), w);
    try
      FDownAction := TDownLoadUrl.Create(nil);
      try
        FDownAction.URL := FURL;
        FDownAction.FileName := ExtractFilePath(FFileName)+IntToStr(GetTickCount)+'_'+ExtractFileName(FFileName);
        FDownAction.OnDownloadProgress := progress;
        FDownAction.ExecuteTarget(nil);
      finally
        FDownAction.Free;
      end;
    finally
      WSACleanup;
    end;
  except
  end;
end;

procedure ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

procedure TncDownloadUrl.Progress(Sender: TDownLoadURL; Progress,
  ProgressMax: Cardinal; StatusCode: TURLDownloadStatus; StatusText: String;
  var Cancel: Boolean);
begin
  if ProgressMax > 0 then
  if Progress >= ProgressMax then 
    AfterDownload;
  ProcessMessages;  
end;

end.

