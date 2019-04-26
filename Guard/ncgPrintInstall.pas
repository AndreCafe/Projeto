unit ncgPrintInstall;

interface

uses
  SysUtils, Classes;

procedure RemovePrinters(aNex: Boolean);
procedure InstallNexPrinter(aForce: Boolean);
function  NexPrinterInstalled: Boolean;
function  GetPrinterList(const aExcludeNexcafe: Boolean=false): TStrings;

implementation


uses 
  ncShellStart,
  Windows, 
  Winspool,
  {$IFNDEF NOLOG}
  uLogs,
  {$ENDIF}
  strutils,
  ncPRConsts;


function GetPrinterList(const aExcludeNexcafe: Boolean=false): TStrings;
var
  Buffer, PrinterInfo: PChar;
  Flags, Count, NumInfo: DWORD;
  i: Integer;
  Level: Byte;
begin
  Result := TStringList.Create;
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    Flags := PRINTER_ENUM_LOCAL;
    Level := 4;
  end else
  begin
    Flags := PRINTER_ENUM_LOCAL;
    Level := 5;
  end;
  Count := 0;
  EnumPrinters(Flags, nil, Level, nil, 0, Count, NumInfo);
  if Count > 0 then
  begin
    GetMem(Buffer, Count);
    try
      if not EnumPrinters(Flags, nil, Level, PByte(Buffer), Count, Count, NumInfo) then Exit;

      PrinterInfo := Buffer;

      for i := 0 to NumInfo - 1 do
      begin
        if Level = 4 then begin
          if not(aExcludeNexcafe) or (Pos(kNexPrinterName, PPrinterInfo4(PrinterInfo)^.pPrinterName)=0) then
              Result.Add(PPrinterInfo4(PrinterInfo)^.pPrinterName);
          Inc(PrinterInfo, SizeOf(TPrinterInfo4));
        end else begin
          if not(aExcludeNexcafe) or (Pos(kNexPrinterName, PPrinterInfo5(PrinterInfo)^.pPrinterName)=0) then
              Result.Add(PPrinterInfo5(PrinterInfo)^.pPrinterName);
          Inc(PrinterInfo, SizeOf(TPrinterInfo5));
        end;
      end;
      
    finally
      FreeMem(Buffer, Count);
    end;
  end;
end;

function NexPrinterInstalled : Boolean;
var 
  Printers: TStrings;
  I : Integer;
begin
  Result := True;
  
  Printers := GetPrinterList;
  try
    for I := 0 to Printers.Count-1 do 
      if Pos(kNexPrinterName, Printers[i])>0 then
        Exit;
    Result := False;
  finally
   {$IFNDEF NOLOG}
    GLog.Log(nil,[lcTrace],'NexPrinterInstalled: '+boolTostr(result,true));
   {$ENDIF}
    Printers.Free;
  end;
end;


procedure RemovePrinters(aNex: Boolean);
var 
  Printers: TStrings;
  I : Integer;
  Remover : Boolean;
  //uninsDir : string;
  //uninsXXX : string;
  //sr: TSearchRec;

begin
   {$IFNDEF NOLOG}
    GLog.Log(nil,[lcTrace],'RemovePrinters');
   {$ENDIF}

    Printers := GetPrinterList;
    try                     ;
      for I := 0 to Printers.Count-1 do 
      if (Pos(kNexPrinterName, Printers[i])>0)=aNex then begin
        {$IFNDEF NOLOG}
        GLog.Log(nil,[lcTrace],'RemovePrinters - OK: '+Printers[i]);
        {$ENDIF}
        ShellStart('rundll32', 'printui.dll, PrintUIEntry /dl /q /n"'+Printers[i]+'"');
      end;
    finally
      Printers.Free;
    end;

end;

{
/HidePrinterPages="01100000000010"

"0" - show page
"1" - hide page

Page positions in above parameter string:

1 Pages
2 Graphics
3 Fonts
4 Document
5 Security
6 Links
7 Bookmarks
8 Watermarks
9 Save
10 Overlay
11 Emails
12 Profiles
13 Language
14 Signature
}

procedure InstallNexPrinter(aForce: Boolean);
var
  sPath: String;
begin
  if (not aForce) and NexPrinterInstalled then Exit;

  sPath := ExtractFilePath(ParamStr(0));
  GLog.Log(nil,[lcTrace],'InstallNexPrinter: NexPrinter');
  GLog.Log(nil,[lcTrace],'InstallNexPrinter driver: '+sPath+'novapv.exe');
  if not fileexists(sPath+'novapv.exe') then
     GLog.Log(nil,[lcExcept],'InstallNexPrinter driver: '+sPath+'novapv.exe NOT FOUND');
  //OEMSaveFile="[YMD][HIS]_[C]_[P]"
  {
    [YMD] - Date in the format YYYYMMDD (year, month, day)
    [HIS] - time in the format hhmmss (hour, minute, second)
    [P] - Name of the profile currently loaded
    [C] - Counter in the format cc (it begins with 01 and increases at each printed document, if a file with the same name exists in the save folder)
  }
  ShellStartCustom(sPath+'novapv.exe',
    '/VERYSILENT '+
    '/SUPPRESSMSGBOXES '+
    '/NORESTART '+
    '/NOCANCEL '+
    '/DIR="'+sPath+'\print\drv" '+
    '/OEMCompany="Nextar Software" '+
    '/OEMSaveFolder="'+sPath+'Print\pend\0" '+
    '/OEMSaveFile="[N]" '+
    '/OEMSaveConflict=1 '+
    '/OEMApplication="NexCafé" '+
    '/OEMActionApp="'+sPath+kAfterPrintFileName+'" '+
    '/OEMActionAppArg="#1" '+
    '/PrinterName="Impressora NexCafé" '+   
    '/RegisterName="Nextar Software" '+
    '/OEMDllName="'+sPath+'nxnex.dll" ' + 
    '/OEMFunctionName="OEMFunction" ' +    
    '/RegisterKey="Y1BT-850T-XNPM-Z6GK-TMRJ-VTTP-L26B-W514" '+
    '/Default '+
//    '/NoInstallIfExists '+
    '/HidePrinterPages="01111111111111" '+
    '/ImportProfiles="'+sPath+'nexcafe.nve'+'" '+
    '/Group="NexCafé" ',
    sPath, 0, SW_HIDE, 'open', False
    );

    //ShellStartCustom(aCmd, aParams, aDir: String; FormHWND: HWND; nShow: Integer = SW_SHOWNORMAL; aVerb: String = 'open'; aWait:boolean=false);

end;


end.
