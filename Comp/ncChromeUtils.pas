unit ncChromeUtils;

interface

procedure Chrome_Install_Ext(aID, aPath, aVersion: String);
procedure Chrome_Remove_Ext(aID: String);
function Chrome_BaseExt_Folder: String;
function Chrome_Ext_Folder(aID, aVersion: String): String;
function Chrome_Pref_Folder: String;
procedure Chrome_Change_Open_URL(aURL: String);
function GetLocalAppData: String;


implementation

uses ncCheckWin64, Registry, Windows, SHFolder, Classes, SysUtils;

function GetLocalAppData: String;
const
  TOKEN_DEFAULTUSER = $FFFF; // -1
var
  szBuffer: AnsiString; // <-- here
  ResultCode: Integer;
begin
  Result := ''; // avoid function might return undefined warning
  SetLength(szBuffer, 255);
  ResultCode := SHGetFolderPathA(0, CSIDL_LOCAL_APPDATA, TOKEN_DEFAULTUSER,
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


procedure Chrome_Change_Open_URL(aURL: String);
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

end.
