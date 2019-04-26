unit ncgClassicMenu;

interface

uses
  SysUtils, 
  Windows;


(***********************************************************************
 ** Who wants to know more about the method how I discovered all this
 ** may have a look at the following URL (German) or contact me via my
 ** forum:
 **
 ** http://www.delphipraxis.net/topic62087,0,asc,0.html
 ***********************************************************************)
type
  SHELLSTATE = packed record
    Data: WORD;
  end;    
(*
    BOOL fShowAllObjects : 1;
    BOOL fShowExtensions : 1;
    BOOL fNoConfirmRecycle : 1;

    BOOL fShowSysFiles : 1;
    BOOL fShowCompColor : 1;
    BOOL fDoubleClickInWebView : 1;
    BOOL fDesktopHTML : 1;
    BOOL fWin95Classic : 1;
    BOOL fDontPrettyPath : 1;
    BOOL fShowAttribCol : 1; // No longer used, dead bit
    BOOL fMapNetDrvBtn : 1;
    BOOL fShowInfoTip : 1;
    BOOL fHideIcons : 1;
    BOOL fWebView : 1;
    BOOL fFilter : 1;
    BOOL fShowSuperHidden : 1;
    BOOL fNoNetCrawling : 1;
*)
{    dwWin95Unused: DWORD; // Win95 only - no longer supported pszHiddenFileExts
    uWin95Unused: UINT; // Win95 only - no longer supported cbHiddenFileExts

    // Note: Not a typo!  This is a persisted structure so we cannot use LPARAM
    lParamSort: Integer;
    iSortDirection: Integer;

    version: UINT;

    // new for win2k. need notUsed var to calc the right size of ie4 struct
    // FIELD_OFFSET does not work on bit fields
    uNotUsed: UINT; // feel free to rename and use
    Flags2: DWORD;
(*
    BOOL fSepProcess: 1;
    // new for Whistler.
    BOOL fStartPanelOn: 1;       //Indicates if the Whistler StartPanel mode is ON or OFF.
    BOOL fShowStartPage: 1;      //Indicates if the Whistler StartPage on desktop is ON or OFF.
    UINT fSpareFlags : 13;
*)
  end;}
  LPSHELLSTATE = ^SHELLSTATE;

const
  SSF_SHOWALLOBJECTS  = $00000001;
  SSF_SHOWEXTENSIONS  = $00000002;
  SSF_HIDDENFILEEXTS  = $00000004;
  SSF_SERVERADMINUI   = $00000004;
  SSF_SHOWCOMPCOLOR   = $00000008;
  SSF_SORTCOLUMNS     = $00000010;
  SSF_SHOWSYSFILES    = $00000020;
  SSF_DOUBLECLICKINWEBVIEW = $00000080;
  SSF_SHOWATTRIBCOL   = $00000100;
  SSF_DESKTOPHTML     = $00000200;
  SSF_WIN95CLASSIC    = $00000400;
  SSF_DONTPRETTYPATH  = $00000800;
  SSF_SHOWINFOTIP     = $00002000;
  SSF_MAPNETDRVBUTTON = $00001000;
  SSF_NOCONFIRMRECYCLE = $00008000;
  SSF_HIDEICONS       = $00004000;
  SSF_FILTER          = $00010000;
  SSF_WEBVIEW         = $00020000;
  SSF_SHOWSUPERHIDDEN = $00040000;
  SSF_SEPPROCESS      = $00080000;
  SSF_NONETCRAWLING   = $00100000;
  SSF_STARTPANELON    = $00200000;
  SSF_SHOWSTARTPAGE   = $00400000;


procedure SHGetSetSettings(lpss: LPSHELLSTATE; dwMask: DWORD; bSet: BOOL) stdcall;
  external 'shell32.dll';

procedure SwitchClassicMenu(aClassic: Boolean);

implementation

uses ncDebug;  

procedure SwitchClassicMenu(aClassic: Boolean);
var
  lpss: SHELLSTATE;
  bClassic: Boolean;
begin
  ZeroMemory(@lpss, SizeOf(lpss));
  // Retrieve current style
  SHGetSetSettings(@lpss, SSF_WIN95CLASSIC, False);
  DebugMsg('SwitchClassicMenu: ' + IntToStr(lpss.Data));
{  // Check the current style
  bClassic := ((lpss.Flags1 and SSF_WIN95CLASSIC) = SSF_WIN95CLASSIC);
  // If a change occurred
  if (bClassic <> aClassic) then
  begin
    // If the user wants XP style then set it, else reset it }
    if (aClassic) then
      lpss.Data := SSF_WIN95CLASSIC
    else
      lpss.Data := 0;
    // Set new style
    SHGetSetSettings(@lpss, SSF_WIN95CLASSIC, True);
//  end;
end;


end.
