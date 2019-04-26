unit ncBrowserUtils;

interface

uses Classes;

procedure ChangeHomePage(aURL: String; aTabs: Boolean);

function GetSysFolder(csidl: integer): String;
// CHROME
procedure Chrome_Install_Ext(aID, aPath, aVersion: String);
procedure Chrome_Remove_Ext(aID: String);
function Chrome_BaseExt_Folder: String;
function Chrome_Ext_Folder(aID, aVersion: String): String;
function Chrome_Pref_Folder: String;
procedure Chrome_ChangeHomePage(aURL: String);
procedure Chrome_ChangeTabHomePage(aURL: String);

function GetLocalAppData: String;
procedure Chrome_Install_NexCafe_Ext;
procedure Chrome_Remove_NexCafe_Ext; 

// FIREFOX
function FF_Profile_Folders: TStrings;
procedure FF_ChangeHomePage(aURL: String; aTabs: Boolean);

// IE
procedure IE_ChangeHomePage(aURL: String; aTabs: Boolean);
procedure IE_RemoveHomePage;

implementation

uses ncCheckWin64, Registry, Windows, SHFolder, SysUtils, ncChromeExt;

const
  nexchromeext_id  = 'jacgaboiemcjbhbkladmdaklboajmcgg';
  nexchromeext_ver = '1.4';

procedure ChangeHomePage(aUrl: String; aTabs: Boolean);
begin
  Chrome_ChangeHomePage(aUrl);
  Chrome_ChangeTabHomePage(aUrl);
  FF_ChangeHomePage(aUrl, aTabs);
  IE_ChangeHomePage(aUrl, aTabs);
  if aTabs then 
    Chrome_Install_NexCafe_Ext else
    Chrome_Remove_NexCafe_Ext;
end;  

procedure Chrome_Install_NexCafe_Ext;
begin
  ncChromeExt.ExtractChromeExt;
  Chrome_Install_Ext(nexchromeext_id, ExtractFilePath(ParamStr(0))+'chrome_ext.crx', nexchromeext_ver);
end;

procedure Chrome_Remove_NexCafe_Ext;
var s: string;
begin
  Chrome_Remove_Ext(nexchromeext_id);
  s := ExtractFilePath(ParamStr(0))+'chrome_ext.crx';
  if FileExists(s) then DeleteFile(s);
end;
  
function GetLocalAppData: String;
begin
  Result := GetSysFolder(CSIDL_LOCAL_APPDATA);
end;

function GetSysFolder(csidl: integer): String;
const
  TOKEN_DEFAULTUSER = $FFFF; // -1
var
  szBuffer: AnsiString; // <-- here
  ResultCode: Integer;
begin
  Result := ''; // avoid function might return undefined warning
  SetLength(szBuffer, 255);
  ResultCode := SHGetFolderPathA(0, CSIDL, TOKEN_DEFAULTUSER,
0, PAnsiChar(szBuffer));
  if ResultCode = 0 then
    Result := String(PAnsiChar(szBuffer));
end;

function BasePath: String;
begin
  if IsWow64 then
    Result := '\Software\Wow6432Node\Google\Chrome\Extensions' else
    Result := '\Software\Google\Chrome\Extensions';
end;

function Chrome_BaseExt_Folder: String;
begin
  Result := Chrome_Pref_Folder + '\Extensions';
end;

function Chrome_Pref_Folder: String;
begin
  Result := GetLocalAppData + '\Google\Chrome\User Data\Default';
end;

function Chrome_Ext_Folder(aID, aVersion: String): String;
begin
  Result := Chrome_BaseExt_Folder+'\'+aID+'\'+aVersion+'_0';
end;

procedure Chrome_ChangeTabHomePage(aURL: String);
var 
  sl : TStrings;
  s  : String;
begin
  s := Chrome_Ext_Folder(nexchromeext_id, nexchromeext_ver)+'\redirect.html';
  if not FileExists(s) then Exit;
  sl := TStringList.Create;
  try
    if not SameText(copy(aURL, 1, 7), 'http://') then aURL := 'http://'+aURL;
    sl.Text := 
     '<html><head><meta http-equiv="Refresh" content="0; url='+aURL+'">'+
     '<title>Nova página</title></head><body></body></html>';
    sl.SaveToFile(s); 
  finally
    sl.Free;
  end;
end;

procedure Chrome_Install_Ext(aID, aPath, aVersion: String);
var R: TRegistry;
begin
  R := TRegistry.Create;
  try
    R.Access := KEY_ALL_ACCESS;
    R.RootKey := HKEY_LOCAL_MACHINE;
    R.OpenKey(BasePath+'\'+aID, True);
    R.WriteString('path', aPath);
    R.WriteString('version', aVersion);
    R.CloseKey;  
  finally
    R.Free;
  end;
end;

procedure Chrome_Remove_Ext(aID: String);
var R: TRegistry;
begin
  R := TRegistry.Create;
  try
    R.Access := KEY_ALL_ACCESS;
    R.RootKey := HKEY_LOCAL_MACHINE;
    R.DeleteKey(BasePath+'\'+aID);
    R.CloseKey;  
  finally
    R.Free;
  end;
end;


procedure Chrome_ChangeHomePage(aURL: String);
const
  find_str = '"urls_to_restore_on_startup":';
var 
  sl : TStrings;
  i, p : Integer;
  s : String;
  aChanged: Boolean;
begin
  S := Chrome_Pref_Folder+'\preferences';
  if not FileExists(S) then Exit;
  aChanged := False;

  sl := TStringList.Create;
  try
    sl.LoadFromFile(s);
    for i := 0 to sl.Count -1 do begin
      P := Pos(find_str, sl[i]);
      if P>0 then begin 
        sl[i] := Copy(sl[i], 1, p+length(find_str)-1) + ' [ "'+aURL+'" ]';
        aChanged := True;
      end;
    end;
    if aChanged then
      sl.SaveToFile(s);
  finally
    sl.Free;
  end;
end;

function GetAppData: String;
const
  TOKEN_DEFAULTUSER = $FFFF; // -1
var
  szBuffer: AnsiString; // <-- here
  ResultCode: Integer;
begin
  Result := ''; // avoid function might return undefined warning
  SetLength(szBuffer, 255);
  ResultCode := SHGetFolderPathA(0, CSIDL_APPDATA, TOKEN_DEFAULTUSER, 0, PAnsiChar(szBuffer));
  if ResultCode = 0 then
    Result := String(PAnsiChar(szBuffer));
end;

function FF_Profile_Folders: TStrings;
var 
  s: String;
  sr: TSearchRec;
begin
  Result := nil;
  S := GetAppData + '\Mozilla\Firefox\Profiles';
  if not DirectoryExists(S) then Exit;
  if FindFirst(S+'\*.*', faDirectory, sr)=0 then
  try
    repeat
      if (sr.Name<>'.') and (sr.Name<>'..') then begin
        if Result=nil then Result := TStringList.Create;
        Result.Add(S+'\'+Sr.Name);
      end;
    until (FindNext(sr)<>0);
  finally
    FindClose(sr);
  end;
end;

procedure FF_ChangeHomePage(aURL: String; aTabs: Boolean);
var 
  sl : TStrings;
  sl2 : TStrings;
  i,p : Integer;
  s : String;

procedure UpdateFile(aParam: String; aDel: Boolean);
var j: integer;
begin
  p := 0;  
  for j := 0 to sl2.Count-1 do begin
    p := pos(aParam, sl2[j]);
    if p>0 then Break;
  end;
  aParam := 'user_pref('+aParam+', "'+aURL+'");';
  if p>0 then begin
    if aDel then
      sl2.Delete(j) else
      sl2[j] := aParam ;
  end else
    if not aDel then
      sl2.Add(aParam);
end;  

begin
  sl := FF_Profile_Folders;
  if sl=nil then Exit;
  sl2 := TStringList.Create;
  try
    for i := 0 to sl.count-1 do begin
      s := sl[i]+'\user.js';
      sl2.Clear;
      if FileExists(s) then 
        sl2.LoadFromFile(s);
    
      UpdateFile('"browser.startup.homepage"', False);
      UpdateFile('"browser.newtab.url"', not aTabs);

      sl2.SaveToFile(s);
    end;

  finally
    sl2.Free;
    sl.Free;
  end;
end;

procedure IE_RemoveHomePage;
var R: TRegistry;
begin
  R := TRegistry.Create;
  try
    R.Access := KEY_ALL_ACCESS;
    R.RootKey := HKEY_CURRENT_USER;
    R.OpenKey('\Software\Microsoft\Internet Explorer\Main', True);
    R.WriteString('Start Page', 'about:blank');
    R.CloseKey; 

    R.OpenKey('\Software\Microsoft\Internet Explorer\TabbedBrowsing', True);
    R.WriteInteger('NewTabPageShow', 0);
    R.CloseKey;  

    R.OpenKey('\Software\Policies\Microsoft\Internet Explorer\Main', True);
    R.DeleteValue('Start Page');
    R.CloseKey; 

    R.OpenKey('\Software\Policies\Microsoft\Internet Explorer\TabbedBrowsing', True);
    R.DeleteValue('NewTabPageShow');
    R.CloseKey;  
  finally
    R.Free;
  end;
end;

procedure IE_ChangeHomePage(aURL: String; aTabs: Boolean);
var R: TRegistry;
begin
  R := TRegistry.Create;
  try
    R.Access := KEY_ALL_ACCESS;
    R.RootKey := HKEY_CURRENT_USER;
    R.OpenKey('\Software\Microsoft\Internet Explorer\Main', True);
    R.WriteString('Start Page', aURL);
    R.CloseKey; 

    R.OpenKey('\Software\Microsoft\Internet Explorer\TabbedBrowsing', True);
    if aTabs then
      R.WriteInteger('NewTabPageShow', 1) else
      R.WriteInteger('NewTabPageShow', 0);
    R.CloseKey;  

    R.OpenKey('\Software\Policies\Microsoft\Internet Explorer\Main', True);
    R.WriteString('Start Page', aURL);
    R.CloseKey; 

    R.OpenKey('\Software\Policies\Microsoft\Internet Explorer\TabbedBrowsing', True);
    if aTabs then
      R.WriteInteger('NewTabPageShow', 1) else
      R.WriteInteger('NewTabPageShow', 0);
    R.CloseKey;  
  finally
    R.Free;
  end;
end;

end.
