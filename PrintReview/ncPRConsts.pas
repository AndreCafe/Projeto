unit ncPRConsts;
{
    ResourceString: Dario 13/03/13
}
interface

uses
    messages;
    

function PRFolder(status: char): String;
  
Const
    prfolder_preview = #0;
    prfolder_backup  = #1;
   
    WM_PR_NEWDOC              = WM_APP + 1;
    WM_PR_EXTRACTIMG_START    = WM_APP + 2;
    WM_PR_EXTRACTIMG_PROGRESS = WM_APP + 3;
    WM_PR_EXTRACTIMG_ERROR    = WM_APP + 4;
    WM_PR_CREATINGDOC         = WM_APP + 5;

    kReviewCli = 'nexREVIEWCLI';
    //kTargetExeName_C = 'nexCafe5PrintMan.exe';
    kTargetExeName_C = 'nexguard.exe';
    //kTargetExeName_S = 'printGuard.exe';
    kConsoleTitle    = 'nexAP';
    kThumbWidth      = 200;

    kMMFPrefix       = 'nexprintreviewmmf';

    kNovaPDFOEM7printerSetupFileName = 'nexprinter.exe';
    kNovaPDFOEM7printerSetupVersion = '1';
    kNovaPDFOEM7iniName = 'NovaVersion';
    kAfterPrintFileName = 'nexAP.exe';

    kNexPrinterName = 'Impressora NexCafé';

    
   
implementation

uses
  sysutils;

function PRFolder(status: char): String;
begin
  case status of
    prfolder_preview : Result := ExtractFilePath(ParamStr(0))+'print\review\'; // do not localize
    prfolder_backup  : Result := ExtractFilePath(ParamStr(0))+'print\backup\'; // do not localize
  else
    Result := ExtractFilePath(ParamStr(0))+'print\pend\'+status+'\'; // do not localize
  end;
end;


end.

