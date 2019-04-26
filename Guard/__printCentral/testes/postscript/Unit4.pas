unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSpool, Printers, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMemo, StdCtrls, cxButtons, registry, LMDCustomComponent,
  LMDBaseController, LMDCustomContainer, LMDGenericList, uHttpDownloader,
  ComCtrls, ExtCtrls, IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze,
  md5, uPrintException, uPrinterInfo8, strutils;

Const
  kInstallDir = 'c:\gs\';
  kDriverPath = kInstallDir + 'drivers\';
  kredmonDir = 'redmon17';
  kredmon32  = 'redmon17.zip';
  kredmon64  = 'redmon17x64.zip';
  kgs904Version  = '9.04';
  kgs904Dir  = 'gs'+kgs904Version;
  kgs90432  = 'gs904w32.exe';
  kgs90464  = 'gs904w64.exe';
  kTempoRestante1 = 'Tempo restante:';
  kDownloadServer = 'www.nexcafe.com.br';
  kDownloadPath   = '/dnld/1/';
  kDescarregado = 'descarregado.';
  kNexCafe5PrintCommand = 'nexCafe5PrintCommand.exe';

  kPrinterDriver1 = 'AdobePSGenericPostScriptPrinter';
  kPrinterDriver2 = 'MS Publisher color Printer';
  kLmPrinterName = 'Nexcafé PS printer';
  kLmPrinterCommand = 'C:\gs\'+kNexCafe5PrintCommand;

  kRedirectedPortShowWindowNormal = 0;
  kRedirectedPortShowWindowMinimized = 1;
  kRedirectedPortShowWindowHidden = 2;


type
  TForm4 = class(TForm)
    cxButtonInsatalar: TcxButton;
    cxMemo1: TcxMemo;
    cxButtonDesinstalar: TcxButton;
    Panel2: TPanel;
    Bevel2: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    ProgressBar1: TProgressBar;
    IdAntiFreeze1: TIdAntiFreeze;
    cxButtonRemoverFiles: TcxButton;
    cxButtonGerarMd5: TcxButton;
    Label1: TLabel;
    procedure cxButtonInsatalarClick(Sender: TObject);
    procedure cxButtonDesinstalarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonRemoverFilesClick(Sender: TObject);
    procedure cxButtonGerarMd5Click(Sender: TObject);
  private
    HttpDownloader : THttpDownloader;
    fgsInstallName  :string;
    fredmonInstallName :string;
    fPrinterEnvironment :string;
    fdriverEnvDir :string;
    fPrinterDriver :string;
    fLmPrinterArguments :string;
    procedure SetInstallVars;
    procedure ShowMessage(aMsg:string);
    function findFreePort:string;
    procedure downloadDriverFiles;
    function dnldFile(aFilename, aDownloadPath, aDownloadFolder:string; aMD5:string=''):boolean;
    function dnldFileOK(aFilename, aMD5:string):boolean;
    procedure HttpDownloaderOnProgress(Sender: TObject; aPosition, aSize: int64; aPercent, aVel: double; aTimeLeft: TDateTime; aMayUpdate:boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses
   uDirUtils, uZipUtils, uCommonProc, uDisplayUtils, uVersionInfo;

{$R *.dfm}

procedure TForm4.SetInstallVars;
begin
  //versionInfo.WindowsInfo.IsServer
  //Windows 4.0
  //Windows IA64
  //Windows NT Alpha_AXP  raríssimo RISC

  if versionInfo.WindowsInfo.Enum = osWinNt4 then
      fPrinterEnvironment :='Windows 4.0'
  else
  if versionInfo.WindowsInfo.ProcessorArchitecture = PROCESSOR_ARCHITECTURE_IA64 then
      fPrinterEnvironment :='Windows IA64'
  else
  if (versionInfo.WindowsInfo.ProcessorArchitecture = PROCESSOR_ARCHITECTURE_AMD64) or
     (is64bit)
  then
     fPrinterEnvironment :='Windows x64'
  else
     fPrinterEnvironment :='Windows NT x86';

  if versionInfo.WindowsInfo.win9x then
      fdriverEnvDir := 'Windows'
  else
  if versionInfo.WindowsInfo.major = 4 then
      fdriverEnvDir := 'WinNT'
  else
  if versionInfo.WindowsInfo.major = 5 then begin
     if versionInfo.WindowsInfo.minor = 0 then
         fdriverEnvDir := 'Win2000'
     else
         fdriverEnvDir := 'WinXP'
  end;
  
  if (versionInfo.WindowsInfo.ProcessorArchitecture = PROCESSOR_ARCHITECTURE_AMD64) or
     (is64bit)
  then
      fdriverEnvDir := 'Amd64'
  else
  if fdriverEnvDir='' then
      fdriverEnvDir := 'WinXP';


  if is64bit then begin
     fgsInstallName     := kgs90464;
     fredmonInstallName := kredmon64;
     fPrinterDriver := kPrinterDriver2;
     fLmPrinterArguments := '/p="'+fPrinterDriver+'"';
  end else begin
     fgsInstallName := kgs90432;
     fredmonInstallName := kredmon32;
     fPrinterDriver := kPrinterDriver1;
     fLmPrinterArguments := '/p="'+fPrinterDriver+'"';
  end;

end;

procedure TForm4.ShowMessage(aMsg: string);
begin
     cxMemo1.lines.add(aMsg);
     application.ProcessMessages;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   HttpDownloader.Cancel;
end;

procedure TForm4.FormCreate(Sender: TObject);
var
    slPrinters : TStringList;
    i : integer;
begin
    HttpDownloader := THttpDownloader.create(Self);
    forcedirectories(kInstallDir);
    showMessage(versionInfo.WindowsInfo.fulldescription);

    slPrinters := TStringList(EnumPrinters);
    try
       for i:=0 to slPrinters.count-1 do
            if PrinterSupportsPostscript(slPrinters[i]) then
                ShowMessage(slPrinters[i]+ ' suporta Postscript')
            else
                ShowMessage(slPrinters[i]+ ' NAO suporta Postscript');

    finally
       slPrinters.free;
    end;

    caption := caption + ' - v'+ versionInfo.ProgramDisplayLongVersion;
end;

procedure TForm4.FormDestroy(Sender: TObject);
begin
    HttpDownloader.free;
end;

function ifRedMonInstalled:boolean;
var
  r : TRegistry;
begin
  // checar se redmon esta instalado
  result :=  false;
  r := TRegistry.create;
  try
      r.RootKey := HKEY_LOCAL_MACHINE;
      if r.OpenKey('\SYSTEM\CurrentControlSet\Control\Print\Monitors\Redirected Port', false) then begin
          result :=  sametext(r.ReadString('Driver'),'redmonnt.dll');
          r.CloseKey;
      end;
      result := result and fileexists(kInstallDir+kredmonDir+'\setup.exe');
  finally
      r.free;
  end;
end;

function ifGhostScriptInstalled:boolean;
var
  r : TRegistry;
  s : string;
  gsVersions : TStringlist;
begin
  result :=  false;
  s := GetEnvironmentVariable('GS_DLL');
  if s>'' then begin
     result :=  true;
     exit;
  end;

  gsVersions :=  TStringlist.create;
  r := TRegistry.create;
  try
      r.RootKey := HKEY_CURRENT_USER;
      if r.OpenKey('\SOFTWARE\GPL Ghostscript', false) then begin
          r.GetKeyNames(gsVersions);
          result :=  gsVersions.Count>0;
          r.CloseKey;
      end;
      if not result then begin
          r.RootKey := HKEY_LOCAL_MACHINE;
          if r.OpenKey('\SOFTWARE\GPL Ghostscript', false) then begin
              r.GetKeyNames(gsVersions);
              result :=  gsVersions.Count>0;
              r.CloseKey;
          end;
      end;
  finally
      r.free;
      gsVersions.free;
  end;
end;

function getGhostScript904dllPath:string;
var
  r : TRegistry;
  gsVersions : TStringlist;

  function getPath(ar: TRegistry; agsVersions: TStringlist):string;
  var
     i : integer;
  begin
     result := '';
     for i:=0 to agsVersions.Count-1 do
       if agsVersions[i]=kgs904Version then begin
          ar.CloseKey;
          if ar.OpenKey('\SOFTWARE\GPL Ghostscript\'+kgs904Version,false) then begin
              result := extractfilepath(ar.ReadString('GS_DLL'));
              ar.CloseKey;
          end;
       end;
  end;
begin
  result := GetEnvironmentVariable('GS_DLL');
  if result>'' then
     exit;
  gsVersions :=  TStringlist.create;
  r := TRegistry.create;
  try
      r.RootKey := HKEY_CURRENT_USER;
      if r.OpenKey('\SOFTWARE\GPL Ghostscript', false) then begin
          r.GetKeyNames(gsVersions);
          result := getPath(r,gsVersions);
          r.CloseKey;
      end;
      if result='' then begin
          r.RootKey := HKEY_LOCAL_MACHINE;
          if r.OpenKey('\SOFTWARE\GPL Ghostscript', false) then begin
              r.GetKeyNames(gsVersions);
              result := getPath(r,gsVersions);
              r.CloseKey;
          end;
      end;
  finally
      r.free;
      gsVersions.free;
  end;
end;

{
function printerDriverExists:boolean;
const
  kKey = '\SYSTEM\CurrentControlSet\Control\Print\Environments\Windows NT x86\Drivers';
var
  r : TRegistry;
  gsVersions : TStringlist;

  function check(ar: TRegistry; agsVersions: TStringlist):boolean;
  var
     i : integer;
     drvNames : TStringlist;
  begin
     result := false;
     drvNames :=  TStringlist.create;
     try
         for i:=0 to agsVersions.Count-1 do begin
            ar.CloseKey;
            if ar.OpenKey(kKey+'\'+agsVersions[i],false) then begin
                ar.GetKeyNames(drvNames);
                ar.CloseKey;
                result := drvNames.indexof(kPrinterDriver)>-1;
                if result then exit;
            end;
         end;
     finally
         drvNames.free;
     end;
  end;

begin
  result := false;
  gsVersions :=  TStringlist.create;
  r := TRegistry.create;
  try
      r.RootKey := HKEY_LOCAL_MACHINE;
      if r.OpenKey(kKey, false) then begin
          r.GetKeyNames(gsVersions);
          result := check(r,gsVersions);
          r.CloseKey;
      end;
  finally
      r.free;
      gsVersions.free;
  end;
end; }

procedure TForm4.HttpDownloaderOnProgress(Sender: TObject; aPosition, aSize: int64; aPercent, aVel: double; aTimeLeft: TDateTime; aMayUpdate:boolean);
begin
    if aMayUpdate then begin
        label2.Caption :=  showBytes(aPosition) + ' de ' +
              showBytes(asize) + ' ' +
              THttpDownloader(Sender).FileName + ' (' +
              formatfloat('##0.00', aPercent ) + '%)';
        label3.Caption :=  showVel ( avel );
        if avel>1 then
            label1.Caption :=  kTempoRestante1 + ' '+ShowTime(aTimeLeft)
        else
            label1.Caption :=  '';
    end;

    ProgressBar1.Position := trunc( aPercent );
    forms.application.ProcessMessages;
end;


function TForm4.dnldFile(aFilename, aDownloadPath, aDownloadFolder:string; aMD5:string=''):boolean;
var
    fs  : TFileStream;
    retry : integer;
    oldFilename : string;
    procedure restaurar;
    begin
        if (oldFilename<>'') and (fileexists(oldFilename)) then begin
            deletefile(aDownloadFolder+aFilename);
            copyfile(pchar(oldFilename), pchar(aDownloadFolder+aFilename), true);
            deletefile(oldFilename);
        end;
    end;
begin
    result := false;
    retry := 1;
    if fileexists(aDownloadFolder+aFilename) then begin
        oldFilename := aDownloadFolder+'_'+aFilename;
        copyfile(pchar(aDownloadFolder+aFilename), pchar(oldFilename), true);
    end;
    repeat
        ShowMessage('Descarrengando '+aFilename);
        HttpDownloader.Host := kDownloadServer;
        HttpDownloader.URLpath := aDownloadPath;
        HttpDownloader.filename := aFilename;
        HttpDownloader.dnFolder := aDownloadFolder;
        HttpDownloader.OnProgress := HttpDownloaderOnProgress;
        HttpDownloader.Delay := 5;
        try
            result := HttpDownloader.Download;
            ShowMessage(aFilename + ' ' + kDescarregado );
            if aMD5 <> '' then begin
                fs  := TFileStream.create(aDownloadFolder + aFilename, fmOpenRead  );
                try
                    if aMD5 = md5.MStreamMD5Digest(fs) then
                        ShowMessage(aFilename + ' MD5 ok')
                    else begin
                        result := false;
                        raise eNexDownloadMd5Error.create(kDownloadServer+aDownloadPath+aFilename);
                    end;
                finally
                    fs.free;
                end;
            end;
        except
            on e:eNexDownloadMd5Error do begin
                 inc(retry);
                 HttpDownloader.Cancel;
                 if retry = 4 then begin
                     restaurar;
                     eNexDownloadMd5Error.create(kDownloadServer+aDownloadPath+aFilename)
                 end else
                     ShowMessage(e.Message + ' reintentar('+inttostr(retry)+')');
            end;
            on e:exception do begin
                 inc(retry);
                 HttpDownloader.Cancel;
                 if retry = 4 then begin
                     restaurar;
                     raise eNexDownloadError.create(kDownloadServer+aDownloadPath+aFilename, e.message)
                 end else
                     ShowMessage(e.Message + ' reintentar('+inttostr(retry)+')');
            end;
        end;
        ProgressBar1.Position := 0;
        label1.Caption := '';
    until result or (retry=4);
    restaurar;

end;

function TForm4.findFreePort:string;
const
    kKey1 = '\SYSTEM\CurrentControlSet\Control\Print\Monitors';
    kKey2 = '\SYSTEM\CurrentControlSet\Control\Print\Printers';
    kKey3 = '\SYSTEM\CurrentControlSet\Control\Print\Monitors\Redirected Port\Ports\';
    kKey4 = '\Software\Microsoft\Windows NT\CurrentVersion\Ports\';
var
    r : TRegistry;
    slPorts : TStringlist;
    activePorts : TStringlist;
    i, n, mn: Integer;
    s : string;

    function  EnumAssignedPorts: TStrings;
    var
      r : TRegistry;
      slPrinters : TStringlist;
      i: Integer;
    begin
      Result := TStringList.Create;
      slPrinters :=  TStringlist.create;
      r := TRegistry.create;
      try
          r.RootKey := HKEY_LOCAL_MACHINE;
          if r.OpenKey(kKey2, false) then begin
              r.GetKeyNames(slPrinters);
              for i:=0 to slPrinters.count-1 do begin
                  r.CloseKey;
                  if r.OpenKey(kKey2+'\'+slPrinters[i], false) then begin
                       result.Add(r.ReadString('Port'));
                  end;
              end;
              r.CloseKey;
          end;

      finally
          r.free;
          slPrinters.free;
      end;
    end;

begin
    mn := 0;
    slPorts :=  TStringlist.create;
    activePorts :=  TStringlist(EnumAssignedPorts);
    r := TRegistry.create;
    try
        r.RootKey := HKEY_LOCAL_MACHINE;
        if r.KeyExists(kKey1+'\Redirected Port') then
            r.CreateKey(kKey1+'\Redirected Port');

        if r.KeyExists(kKey1+'\Redirected Port') then begin
            if r.KeyExists(kKey1+'\Redirected Port\Ports') then begin
                if r.OpenKey(kKey1+'\Redirected Port\Ports', false) then begin
                    r.GetKeyNames(slPorts);
                    for i:=0 to slPorts.count-1 do begin
                       if sametext(copy(slPorts[i],1,3),'RPT') then begin
                           s := copy(slPorts[i],4, maxint) ;
                           if s[length(s)]=':' then
                             setlength(s,length(s)-1);
                           if tryStrToInt(s,n) then begin
                               if n>mn then begin
                                   if activePorts.IndexOf('RPT'+inttostr(n)+':')>-1 then
                                      mn := n;
                               end;
                           end;
                       end;
                    end;
                    r.CloseKey;
                end;
            end else
                r.CreateKey(kKey1+'\Redirected Port\Ports');
            inc(mn);
            result := 'RPT'+inttostr(mn)+':';
            if not r.KeyExists(kKey1+'\Redirected Port\Ports\'+result) then
                r.CreateKey(kKey1+'\Redirected Port\Ports\'+result);
        end else
            raise exception.Create('erro de instalaçao: "Redirected Port" not found');

        r.RootKey := HKEY_LOCAL_MACHINE;
        if r.openKey(kKey3+result, true) then begin
            r.WriteString('Description','Redirected Port');
            r.WriteString('Command',kLmPrinterCommand);
            r.WriteString('Arguments',fLmPrinterArguments);
            r.WriteString('Printer',fPrinterDriver);
            r.WriteInteger('Output',0);
            r.WriteInteger('ShowWindow',kRedirectedPortShowWindowNormal); 
            r.WriteInteger('RunUser',1);
            r.WriteInteger('Delay',300);
            r.WriteInteger('LogFileUse',0);
            r.WriteString('LogFileName','');
            r.WriteInteger('LogFileDebug',0);
            r.WriteInteger('PrintError',0);
            r.CloseKey;
        end;

        if versionInfo.WindowsInfo.major<=5 then
          if r.openKey(kKey4, false) then begin
              r.WriteString(result, '');
              r.CloseKey;
          end;
    finally
        r.free;
        slPorts.free;
        activePorts.free;
    end;
end;


procedure DeletePortKeys;
const
       kKey4 = '\Software\Microsoft\Windows NT\CurrentVersion\Ports\';
var
  r  : TRegistry;
  slPorts : TStringList;
  i  : integer;
begin
  r := TRegistry.create;
  slPorts := TStringList.create;
  try
      r.RootKey := HKEY_LOCAL_MACHINE;
        if r.OpenKey(kKey4, false) then begin
            r.GetValueNames(slPorts);
            for i:=0 to slPorts.count-1 do
            if sametext(copy(slPorts[i],1,3),'RPT') then
                r.DeleteValue(slPorts[i]);
        end;
  finally
      r.free;
      slPorts.free;
  end;
end; 


function  RemoveAssignedPorts: boolean;
const
    kKey1 = '\SYSTEM\CurrentControlSet\Control\Print\Monitors\Redirected Port';
    kKey4 = '\Software\Microsoft\Windows NT\CurrentVersion\Ports';
var
    r : TRegistry;
    slPorts : TStringlist;
    i: Integer;
begin
    result := true;
    slPorts :=  TStringlist.create;
    r := TRegistry.create;
    try
        r.RootKey := HKEY_LOCAL_MACHINE;
        if r.OpenKey(kKey1+'\Ports', false) then begin
            r.GetKeyNames(slPorts);
            r.CloseKey;
            for i:=0 to slPorts.count-1 do begin
                result := result and r.DeleteKey(kKey1+'\'+slPorts[i]);
                if r.OpenKey(kKey4, false) then begin
                     result := result and r.DeleteValue(slPorts[i]);
                     r.CloseKey;
                end;
            end;
        end;
        r.DeleteKey(kKey1+'\Ports');
        if r.OpenKey(kKey1, false) then begin
            r.deleteValue('Driver');
            r.CloseKey;
        end;
        r.DeleteKey(kKey1);
    finally
        r.free;
        slPorts.free;
    end;
end;

procedure ConfiguraPrinter(aLmPrinterName:string);
const
    kKey1 = '\SYSTEM\CurrentControlSet\Control\Print\Printers\';
var
    r : TRegistry;
begin
    r := TRegistry.create;
    try
        r.RootKey := HKEY_LOCAL_MACHINE;
        if r.OpenKey(kKey1+aLmPrinterName+'\DsSpooler', false) then begin
            r.WriteString('printSpooling','PrintDirect');
        end else
            raise exception.Create('ConfiguraPrinter, impossível abrir: '+kKey1+aLmPrinterName+'\DsSpooler');
    finally
        r.free;
    end;
end;

function TForm4.dnldFileOK(aFilename, aMD5:string): boolean;
var
    fs   : TFileStream;
    sMD5 : string;
begin
    result := false;
    if fileexists(aFilename) then begin
        fs  := TFileStream.create(aFilename, fmOpenRead or fmShareDenyNone  );
        try
            sMD5 := md5.MStreamMD5Digest(fs);
            result := sMD5 = aMD5;
        finally
            fs.free;
        end;
    end;
end;

procedure TForm4.downloadDriverFiles;
var
    driversTxt, sl : TStringList;
    i : integer;
begin
    forcedirectories(kDriverPath);
    if not fileexists(kDriverPath + 'drivers.txt') then
        dnldFile('drivers.txt', kDownloadPath+'drivers/', kDriverPath);



    driversTxt := TStringList.create;
    sl := TStringList.create;
    try
        driversTxt.loadFromfile(kDriverPath + 'drivers.txt');
        for i:=0 to driversTxt.count-1 do begin
            sl.Text := strutils.ReplaceText(driversTxt[i], '\', #13#10);
            if (sl.Count>2) and
               (sametext(sl[0],fPrinterDriver)) and
               (sametext(sl[1],fdriverEnvDir)) then begin

                    if not directoryexists(kDriverPath+sl[0]) then
                        forcedirectories(kDriverPath+sl[0]);
                    if not fileexists(kDriverPath+sl[0]+'.ini') then
                        dnldFile(sl[0]+'.ini', kDownloadPath+'drivers/', kDriverPath+'\');
                    if not fileexists(kDriverPath+driversTxt[i]) then begin
                        if not directoryexists(kDriverPath+sl[0]+'\'+sl[1]) then
                            forcedirectories(kDriverPath+sl[0]+'\'+sl[1]);
                        dnldFile(sl[2], kDownloadPath+'drivers/'+sl[0]+'/'+sl[1]+'/', kDriverPath+sl[0]+'\'+sl[1]+'\');
                    end;

               end;
        end;
    finally
        driversTxt.free;
        sl.free;
    end;

end;


procedure TForm4.cxButtonInsatalarClick(Sender: TObject);
const
    kKey1 = '\SYSTEM\CurrentControlSet\Control\Print\Monitors\Redirected Port\Ports';
var
    s, sport, sOut : string;
    sl : TStringList;
    i : integer;
begin
    cxMemo1.clear;
    application.processmessages;
    screen.Cursor  := crHourGlass;
    cxButtonInsatalar.Enabled := false;
    cxButtonDesinstalar.Enabled := false;
    cxButtonRemoverFiles.Enabled := false;
    sl := TStringList.create;
    try
        try
            dnldFile('md5.txt', kDownloadPath, kInstallDir);
        except
            on e:exception do
               ShowMessage('Erro: '+e.Message);
        end;

        if fileexists(kInstallDir + 'md5.txt') then begin
            sl.LoadFromFile(kInstallDir+'md5.txt');

            SetInstallVars;
            s := GetSystem32;
            if not dnldFileOK(s + '7z.dll', sl.Values['7z.dll']) then begin
                ShowMessage('descarregar 7z.dll');
                dnldFile('7z.dll', kDownloadPath, s, sl.Values['7z.dll']);
            end;

            if not isServiceStarted('','Spooler') then begin
                ShowMessage('Start Spooler');
                ServiceStart('','Spooler');
                ShowMessage('Spooler Started');
            end;

            if fileexists(s + '7z.dll') then begin

                if not ifRedMonInstalled then begin
                    ShowMessage(kredmonDir+' não instalado');
                    if not directoryexists(kInstallDir+kredmonDir) then
                        forcedirectories(kInstallDir+kredmonDir);
                    if not dnldFileOK(kInstallDir+fredmonInstallName, sl.Values[fredmonInstallName]) then begin
                        ShowMessage('descarregar '+fredmonInstallName);
                        dnldFile(fredmonInstallName, kDownloadPath, kInstallDir, sl.Values[fredmonInstallName] );
                    end;
                    if not fileexists(kInstallDir+kredmonDir+'\setup.exe') then begin
                        ExtractZip(kInstallDir+fredmonInstallName, kInstallDir+kredmonDir);
                        ShowMessage(fredmonInstallName+' descompactado');
                    end;
                    s := kInstallDir+kredmonDir+'\setup.exe /s';
                    ShowMessage('instalar '+ kredmonDir);
                    //WinExec( PChar(s), SW_HIDE);
                    ExecBatFile(s, kInstallDir, sOut);
                    ShowMessage(kredmonDir+' instalado');
                end else
                    ShowMessage(kredmonDir+' já instalado');


                if ifGhostScriptInstalled then begin
                    ShowMessage('GhostScript '+kgs904Version+' já instalado');
                end else begin
                    ShowMessage('GhostScript '+kgs904Version+' não instalado');
                    if not dnldFileOK(kInstallDir+fgsInstallName, sl.Values[fgsInstallName]) then begin
                        ShowMessage('descarregar '+fgsInstallName);
                        dnldFile(fgsInstallName, kDownloadPath, kInstallDir, sl.Values[fgsInstallName] );
                    end;
                    if dnldFileOK(kInstallDir+fgsInstallName, sl.Values[fgsInstallName]) then begin
                        s := kInstallDir+fgsInstallName+' /S /D='+kInstallDir+kgs904Dir;
                        ShowMessage('instalar GhostScript '+kgs904Version);
                        //WinExec( PChar(s), SW_HIDE);
                        ExecBatFile(s, kInstallDir, sOut);
                        ShowMessage('GhostScript '+kgs904Version+' instalado');
                    end;
                end;
            end;
        end;

        downloadDriverFiles;

        //instala printer driver
        if not printerDriverExists(fPrinterDriver) then
        try
            addPrinterDriver(fPrinterDriver, fPrinterEnvironment, kDriverPath, fdriverEnvDir);
            // Windows 95  or 98 | Windows NT 3.1 | Windows NT 3.5 or 3.51 | Windows NT 3.51 | Windows NT 4.0 | Windows nt 4.0 or 2000 | Windows 2000
            // Windows XP | Windows 7
            // Alha | Intek | Mps | PowerPC
            //s := 'rundll32 printui.dll,PrintUIEntry /ia /m "'+kPrinterDriver+'" /h "Intel"';
            //WinExec( PChar(s), SW_HIDE);
            //ExecBatFile(s, kInstallDir, sOut);
            ShowMessage('driver  '+fPrinterDriver+' instalado');
            i:=0;
            repeat
               sleep(1000);
               forms.application.processmessages;
               inc(i);
            until printerDriverExists(fPrinterDriver) or (i=100);
        except
            on e:exception do
               ShowMessage('Erro: '+e.Message);
        end;


        //instala printer
        if not printerExists(kLmPrinterName) then
        try

            ShowMessage('Stop Spooler');
            ServiceStop('','Spooler');
            ShowMessage('Spooler Stop');

            sport := findFreePort;

            ShowMessage('Start Spooler');
            ServiceStart('','Spooler');
            ShowMessage('Spooler Started');
            
            addPrinter(kLmPrinterName, sport, fPrinterDriver, 'WinPrint');
            ShowMessage('printer  '+kLmPrinterName+' instalada');

            ConfiguraPrinter(kLmPrinterName);
        except
            on e:exception do
               ShowMessage('Erro: '+e.Message);
        end;

        if not dnldFileOK(kInstallDir+kNexCafe5PrintCommand, sl.Values[kNexCafe5PrintCommand]) then begin
            ShowMessage('descarregar '+kNexCafe5PrintCommand);
            dnldFile(kNexCafe5PrintCommand, kDownloadPath, kInstallDir, sl.Values[kNexCafe5PrintCommand]);
        end;

        //if PrinterSupportsPostscript(kLmPrinterName) then
        //    ShowMessage(kLmPrinterName+ ' suporta Postscript')
        //else
        //    ShowMessage(kLmPrinterName+ ' NAO suporta Postscript');


    except
        on e:exception do begin
           ShowMessage('Erro: '+e.Message);
           ProgressBar1.Position := 0;
           label1.Caption := '';
        end;
    end;
    screen.Cursor  := crDefault;
    sl.free;
    cxButtonInsatalar.Enabled := true;
    cxButtonDesinstalar.Enabled := true;
    cxButtonRemoverFiles.Enabled := true;
    ShowMessage('ok');

end;


procedure TForm4.cxButtonDesinstalarClick(Sender: TObject);
var
    s, sOut, sEnv : string;
    i : integer;
begin
    cxMemo1.clear;
    application.processmessages;
    screen.Cursor  := crHourGlass;
    cxButtonInsatalar.Enabled := false;
    cxButtonDesinstalar.Enabled := false;
    cxButtonRemoverFiles.Enabled := false;
    try
        SetInstallVars;

        if not isServiceStarted('','Spooler') then begin
            ShowMessage('Start Spooler');
            ServiceStart('','Spooler');
            ShowMessage('Spooler Started');
        end;

        if ifRedMonInstalled then begin
            ShowMessage('redmon instalado');
            RemoveAssignedPorts;
            s := kInstallDir+kredmonDir+'\unredmon.exe /s';
            ShowMessage('desinstalar redmon');
            //WinExec( PChar(s), SW_HIDE);
            ExecBatFile(s, kInstallDir, sOut);
            CleanUpAndDeleteDirectory(kInstallDir+kredmonDir+'\', nil, nil);
            ShowMessage('redmon desinstalado');
        end else
            ShowMessage('redmon não instalado');

        if ifGhostScriptInstalled then begin
            ShowMessage('GhostScript '+kgs904Version+'2 instalado');
            s := getGhostScript904dllPath;
            ShowMessage('GhostScript '+kgs904Version+' em '+s);
            ShowMessage('desinstalar GhostScript '+kgs904Version);
            s := copy(s, 1, length(s)-5)+'\uninstgs.exe /S';
            //WinExec( PChar(s), SW_HIDE);
            ExecBatFile(s, kInstallDir, sOut);
            ShowMessage('GhostScript '+kgs904Version+' desinstalado');
        end else begin
            ShowMessage('GhostScript '+kgs904Version+' não instalado');
        end;


        //desinstala printer
        if printerExists(kLmPrinterName) then
        try
               DeletePrinter(kLmPrinterName);
               ShowMessage(kLmPrinterName + ' desinstalada');
        except
            on e:exception do
               ShowMessage('Erro: '+e.Message);
        end;

        i:=0;
        repeat
           sleep(1000);
           forms.application.processmessages;
           inc(i);
        until (not printerExists(kLmPrinterName)) or (i=100);

        //desinstala printer driver
        sEnv := getDriverEnvironment(fPrinterDriver);
        if sEnv<>'' then
        try

            if isServiceStarted('','Spooler') then begin
                ShowMessage('Stop Spooler');
                ServiceStop('','Spooler');
                ShowMessage('Spooler Stop');
            end;
            if not isServiceStarted('','Spooler') then begin
                ShowMessage('Start Spooler');
                ServiceStart('','Spooler');
                ShowMessage('Spooler Started');
            end;

            DeletePrinterDriver(fPrinterDriver, sEnv);
            DeletePortKeys;
            ShowMessage(fPrinterDriver + ' desinstalado');
        except
            on e:exception do
               ShowMessage('Erro: '+e.Message);
        end;


    except
        on e:exception do
           ShowMessage('Erro: '+e.Message);
    end;
    screen.Cursor  := crDefault;
    ShowMessage('ok');
    cxButtonInsatalar.Enabled := true;
    cxButtonDesinstalar.Enabled := true;
    cxButtonRemoverFiles.Enabled := true;

end;

procedure TForm4.cxButtonRemoverFilesClick(Sender: TObject);
begin
  cxMemo1.clear;
  screen.Cursor  := crHourGlass;
  try
      SetInstallVars;
      deletefile(kInstallDir+fredmonInstallName);
      deletefile(kInstallDir+fgsInstallName);
      deleteFile(GetSystem32 + '7z.dll');
      deleteFile(kInstallDir+'md5.txt');
      deleteFile(kInstallDir+kNexCafe5PrintCommand);
  finally
      screen.Cursor  := crDefault;
  end;
    ShowMessage('ok');

end;
     
procedure TForm4.cxButtonGerarMd5Click(Sender: TObject);
var
    sl : TStringList;
    fs : TFileStream;
begin
    sl := TStringList.create;
    try
        if fileexists('C:\gs\install\7z.dll') then begin
            fs  := TFileStream.create('C:\gs\install\7z.dll', fmOpenRead  );
            sl.add('7z.dll='+md5.MStreamMD5Digest(fs));
            fs.free;
        end;
        if fileexists('C:\gs\install\'+kredmon32) then begin
            fs  := TFileStream.create('C:\gs\install\'+kredmon32, fmOpenRead  );
            sl.add(kredmon32+'='+md5.MStreamMD5Digest(fs));
            fs.free;
        end;
        if fileexists('C:\gs\install\'+kredmon64) then begin
            fs  := TFileStream.create('C:\gs\install\'+kredmon64, fmOpenRead  );
            sl.add(kredmon64+'='+md5.MStreamMD5Digest(fs));
            fs.free;
        end;
        if fileexists('C:\gs\install\'+kgs90432) then begin
            fs  := TFileStream.create('C:\gs\install\'+kgs90432, fmOpenRead  );
            sl.add(kgs90432+'='+md5.MStreamMD5Digest(fs));
            fs.free;
        end;
        if fileexists('C:\gs\install\'+kgs90464) then begin
            fs  := TFileStream.create('C:\gs\install\'+kgs90464, fmOpenRead  );
            sl.add(kgs90464+'='+md5.MStreamMD5Digest(fs));
            fs.free;
        end;
        if fileexists('C:\gs\install\'+kNexCafe5PrintCommand) then begin
            fs  := TFileStream.create('C:\gs\install\'+kNexCafe5PrintCommand, fmOpenRead  );
            sl.add(kNexCafe5PrintCommand+'='+md5.MStreamMD5Digest(fs));
            fs.free;
        end;

        sl.SaveToFile(kInstallDir+'md5.txt');
        cxMemo1.lines.addStrings(sl);

    finally
        sl.free;
    end;
    ShowMessage('ok');
end;

end.
