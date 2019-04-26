unit ncsPrintPDF;

interface

uses
  ncClassesBase,
  SysUtils,
  Windows,
  Classes;

type
  TncPrintItem = class
  private
    procedure StartPrintAdobe(aPrinterName: String);
    procedure StartPrintCLPrint(aPrinterName: String);
    procedure StartPrintGnostice(aPrinterName: String);
  public
    piArq: String;
    piNaoImp: Array of Integer;
    piPrinterDevMode: String;
    piTotPages: Integer;
    piProcessInfo : TProcessInformation;
    piRetrato : Boolean;

    constructor Create(aArq, aNaoImp, aPrinterDevMode: String; aTotPages: Integer; aRetrato: Boolean);

    procedure StartPrint(aPrinterName: String);

    function ImprimirPag(aPag: Integer): Boolean;

    function Done: Boolean;

    function Resultado: Cardinal;

    destructor Destroy; override;
  end;

  TncPrinterQueue = class ( TThread )
  private
    FQueue : TThreadList;
  protected
    procedure Execute; override;

    function GetNext: TncPrintItem;
  public 
    PrinterName: String;

    constructor Create(aPrinterName: String);

    procedure Add(aArq, aNaoImp, aPrinterDevMode: String; aTotPages: Integer; aRetrato: Boolean);
    destructor Destroy; override;
  end;

  TncPDFPrintManager = class
  private
    FQueues : TList;

    function GetQueue(aPrinterName: String): TncPrinterQueue;
  public  
    constructor Create;

    destructor Destroy; override;

    procedure Print(aArq, aNaoImp, aPrinterDevMode, aPrinterName: String; aTotPages: Integer; aRetrato: Boolean);
  end;

implementation

uses ncPrinterInfo8, ncDebug;


{ TThreadPrintPDF }

const
  OrientationStr : Array[boolean] of String = (' /orientation:landscape', ' /orientation:portrait');
  
function WinExecAndWait32(FileName: string; Visibility: Integer; var aPI: TProcessInformation): Boolean;
var { by Pat Ritchey }
  zAppName: array[0..512] of Char;
  zCurDir: array[0..255] of Char;
  WorkDir: string;
  StartupInfo: TStartupInfo;
begin
  DebugMsg('ncsPrintPDf.WinExecAndWait32 - FileName: ' + FileName);
  StrPCopy(zAppName, FileName);
  GetDir(0, WorkDir);
  StrPCopy(zCurDir, WorkDir);
  FillChar(StartupInfo, SizeOf(StartupInfo), #0);
  StartupInfo.cb          := SizeOf(StartupInfo);
  StartupInfo.dwFlags     := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;
  Result := CreateProcess(nil,
    zAppName, // pointer to command line string
    nil, // pointer to process security attributes
    nil, // pointer to thread security attributes
    False, // handle inheritance flag
    CREATE_NEW_CONSOLE or // creation flags
    NORMAL_PRIORITY_CLASS,
    nil, //pointer to new environment block
    nil, // pointer to current directory name
    StartupInfo, // pointer to STARTUPINFO
    aPI); // pointer to PROCESS_INF
end; 

{ TncPrintItem }

function SoDig(S: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(S) do 
    if S[I] in ['0'..'9']  then
  
end;

constructor TncPrintItem.Create(aArq, aNaoImp, aPrinterDevMode: String;
  aTotPages: Integer; aRetrato: Boolean);
var 
  S, sNex: String;  
  T, P: Integer;

function GetNextPage: Boolean;
var I: Integer;
begin
  P := 0;
  while (P=0) and (S>'') do begin
    I := Pos(',', S);
    if I=0 then begin
      P := StrToIntDef(Trim(S), 0);
      S := '';
    end else begin
      sNex := copy(S, 1, I-1);
      P := StrToIntDef(Trim(sNex), 0);
      Delete(S, 1, I);
    end;
  end;
  Result := (P>0);
end;    

begin
  inherited Create;
  DebugMsg('TncPrintItem.Create 1');
  piArq := aArq;
  T := 0;
  SetLength(piNaoImp, 0);
  S := aNaoImp;
  DebugMsg('TncPrintItem.Create 2');
  while GetNextPage do begin
    Inc(T);
    SetLength(piNaoImp, T);
    piNaoImp[T-1] := P;
    DebugMsg('TncPrintItem.Create - Nao Imprimir: ' + IntToStr(P));
  end;
  piPrinterDevMode := aPrinterDevMode;
  piTotPages := aTotPages;
  piProcessInfo.hProcess := 0;
  piProcessInfo.hThread := 0;
  piRetrato := aRetrato;

  DebugMsg('TncPrintItem.Create - aArq:' + aArq + ' - NaoImp:'+aNaoImp+' - PrinterDevMode:'+aPrinterDevMode+' - aTotPages:'+IntToStr(aTotPages)+' - aRetrato: '+IntToStr(Integer(aRetrato)));
end;

destructor TncPrintItem.Destroy;
begin
  if piProcessInfo.hProcess>0 then begin
    CloseHandle(piProcessInfo.hProcess);
    CloseHandle(piProcessInfo.hThread);  
  end;
  TThreadDeleteFile.Create(piArq, 60000);
  inherited;
end;

function TncPrintItem.Done: Boolean;
begin
  Result := (piProcessInfo.hProcess=0) or (WaitForSingleObject(piProcessInfo.hProcess, 0)=0);
end;

function TncPrintItem.ImprimirPag(aPag: Integer): Boolean;
var I : Integer;
begin
  for I := 0 to High(piNaoImp) do
    if piNaoImp[I] = aPag then begin
      Result := False;
      Exit;
    end;
  Result := True;  
end;

function TncPrintItem.Resultado: Cardinal;
begin
  GetExitCodeProcess(piProcessInfo.hProcess, Result);
end;

procedure TncPrintItem.StartPrint(aPrinterName: String);
begin
  DebugMsg('TncPrintItem.StartPrint - aPrinterName: ' + aPrinterName + ' - aArq: ' + piArq);
  case gConfig.PMPDFPrintEng of
    printeng_adobe : StartPrintAdobe(aPrinterName);
    printeng_clprint : StartPrintCLPrint(aPrinterName);
    printeng_gnostice : StartPrintGnostice(aPrinterName);
  end;
end;

procedure TncPrintItem.StartPrintAdobe(aPrinterName: String);
var 
  SS : TStringStream;
  S, Range: String;
  I, L, UI : Integer;
  
procedure SaveRange;
begin
  if L=0 then Exit;
  
  Range := IntToStr(L);
  if UI>=L then
    Range := Range+'-'+IntToStr(UI);
    
  L := 0;  

  if WinExecAndWait32(ExtractFilePath(ParamStr(0))+
                     'clprint.exe /print /adobe /printer:"'+aPrinterName+'" /pdffile:"'+piArq+'" /range:'+Range+OrientationStr[piRetrato], sw_Hide, piProcessInfo)
  then begin
    WaitForSingleObject(piProcessInfo.hProcess, INFINITE);
    CloseHandle(piProcessInfo.hProcess);
    CloseHandle(piProcessInfo.hThread);  
    piProcessInfo.hProcess := 0;
  end;
                   
end;  

begin
  DebugMsg('TncPrintItem.StartPrintAdobe - aPrinterName: ' + aPrinterName + ' - aArq: ' + piArq);
  SS := TStringStream.Create(piPrinterDevMode);
  try
    RestorePrinterInfo8(PAnsiChar(aPrinterName), SS);
  finally
    SS.Free;
  end;

  L := 0;

  Range := '';
  if Length(piNaoImp)>0 then begin
    for I := 1 to piTotPages do begin
      if ImprimirPag(I) then begin
        UI := I;
        if L=0 then 
          L := I;
      end else 
        SaveRange;   
    end;
    SaveRange;
  end else begin
    DebugMsg('TncPrintItem.StartPrintAdobe - Sem Range');
    WinExecAndWait32(ExtractFilePath(ParamStr(0))+
                     'clprint.exe /print /scale:none /adobe /printer:"'+aPrinterName+'" /pdffile:"'+piArq+'"'+OrientationStr[piRetrato], sw_Hide, piProcessInfo);
  
  end;
end;

procedure TncPrintItem.StartPrintCLPrint(aPrinterName: String);
var 
  SS : TStringStream;
  S, Range: String;
  I, L, UI : Integer;
  
procedure SaveRange;
begin
  if L=0 then Exit;
  
  if Range>'' then Range := Range + ',';
  Range := Range + IntToStr(L);
  if UI>L then
    Range := Range+'-'+IntToStr(UI);

  L := 0;  
end;  

begin
  DebugMsg('TncPrintItem.StartPrintCLPrint - aPrinterName: ' + aPrinterName + ' - aArq: ' + piArq);
  SS := TStringStream.Create(piPrinterDevMode);
  try
    RestorePrinterInfo8(PAnsiChar(aPrinterName), SS);
  finally
    SS.Free;
  end;

  L := 0;

  Range := '';
  if Length(piNaoImp)>0 then begin
    for I := 1 to piTotPages do begin
      if ImprimirPag(I) then begin
        UI := I;
        if L=0 then 
          L := I;
      end else 
        SaveRange;   
    end;
    SaveRange;
    Range := ' /range:'+Range;
  end else begin
    DebugMsg('TncPrintItem.StartPrintCLPrint - Sem Range');
    Range := '';
  end;

  WinExecAndWait32(ExtractFilePath(ParamStr(0))+'clprint.exe /print /printer:"'+aPrinterName+'" /pdffile:"'+piArq+'"'+Range{+OrientationStr[piRetrato]}, sw_Hide, piProcessInfo);
end;

procedure TncPrintItem.StartPrintGnostice(aPrinterName: String);
begin

end;

{ TncPrinterQueue }

procedure TncPrinterQueue.Add(aArq, aNaoImp, aPrinterDevMode: String;
  aTotPages: Integer; aRetrato: Boolean);
var I : TncPrintItem;
begin
  DebugMsg('TncPrinterQueue.Add 1');
  I := TncPrintItem.Create(aArq, aNaoImp, aPrinterDevMode, aTotPages, aRetrato);
  DebugMsg('TncPrinterQueue.Add 2');
  with FQueue.LockList do
  try
    DebugMsg('TncPrinterQueue.Add 3');
    Add(I);
  finally
    FQueue.UnlockList;
  end;
end;

constructor TncPrinterQueue.Create(aPrinterName: String);
begin
  DebugMsg('TncPrinterQueue.Create - aPrinterName: ' + aPrinterName);
  inherited Create(True);
  FQueue := TThreadList.Create;
  PrinterName := aPrinterName;
  FreeOnTerminate := True;
  Resume;
end;

destructor TncPrinterQueue.Destroy;
begin
  with FQueue.LockList do
  try
    while Count > 0 do begin
      TObject(Items[0]).Free;
      Delete(0);
    end;
  finally
    FQueue.UnlockList;
  end;
  FQueue.Free;
  inherited;
end;

procedure TncPrinterQueue.Execute;
var PI : TncPrintItem;
begin
  PI := nil;
  DebugMsg('TncPrinterQueue.Execute - '+PrinterName);
  while not Terminated do begin
    try
      if PI=nil then 
        PI := GetNext
      else
      if PI.Done then
        with FQueue.LockList do 
        try
          Remove(PI);
          PI.Free;
          PI := nil;
        finally
          FQueue.UnLockList;
        end;
      Sleep(200);
    except
      on E: Exception do
        DebugMsg('TncPrinterQueue.Execute - Exception: ' + E.Message);
    end;
  end;
  DebugMsg('TncPrinterQueue.Execute - Terminated: '+PrinterName);
end;

function TncPrinterQueue.GetNext: TncPrintItem;
begin
  with FQueue.LockList do 
  try
    if Count>0 then begin
      DebugMsg('TncPrinterQueue.GetNext > 0');
      Result := TncPrintItem(Items[0]);
    end else
      Result := nil;
  finally
    FQueue.UnlockList;
  end;
  if Result<>nil then 
    Result.StartPrint(PrinterName);
end;

{ TncPDFPrintManager }

constructor TncPDFPrintManager.Create;
begin
  inherited;
  FQueues := TList.Create;
end;

destructor TncPDFPrintManager.Destroy;
var I : Integer;
begin
  for I := 0 to FQueues.Count-1 do 
    TThread(FQueues[I]).Terminate;

  FQueues.Free;  
    
  inherited;
end;

function TncPDFPrintManager.GetQueue(
  aPrinterName: String): TncPrinterQueue;
var I : Integer;  
begin
  DebugMsg('TncPDFPrintManager.GetQueue - aPrinterName: ' + aPrinterName);
  for I := 0 to FQueues.Count-1 do 
    if SameText(TncPrinterQueue(FQueues[I]).PrinterName, aPrinterName) then begin
      Result := TncPrinterQueue(FQueues[I]);
      Exit;
    end;
  Result := TncPrinterQueue.Create(aPrinterName);
  FQueues.Add(Result);
end;

procedure TncPDFPrintManager.Print(aArq, aNaoImp, aPrinterDevMode,
  aPrinterName: String; aTotPages: Integer; aRetrato: Boolean);
begin
  DebugMsg('TncPDFPrintManager.Print 1 - aPrinterName: ' + aPrinterName + ' - aArq: ' + aArq);
  try
    GetQueue(aPrinterName).Add(aArq, aNaoImp, aPrinterDevMode, aTotPages, aRetrato);
    DebugMsg('TncPDFPrintManager.Print OK');
  except
    on E: Exception do 
      DebugMsg('TncPDFPrintManager.Print - Exception: ' + E.Message);
  end;
end;

end.


