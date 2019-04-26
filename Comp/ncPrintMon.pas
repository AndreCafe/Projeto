{== tersMonitorU ================================================}
{: This unit implements a component that can be used to monitor print
  jobs send to all installed printers.
@author Dr. Peter Below
@desc   Version 1.0 created 2003-04-20<br/>
        Last modified       2003-04-20<p/>
The component uses a set of background threads to monitor the installed
printers via FindFirstPrinterChangeNotification. It fires events when
a new job is added, when a job completed, or when a jobs status has
changed in some other manner. <p/>
The component does not use the Delphi Synchronize mechanism, it can be
used without problems in a DLL in D6 and above. The component is not
Kylix-compatible, since it depends completely in Windows API functions
for irs functionality. It has only been tested with Delphi 7 on
Win2K SP3.<p/>
NOTE: <br/>
Define the symbol DEBUG to allow the component to show error
messages when it cannot get information for a printer to monitor. <p/>
Define the symbol NO_MESSAGELOOP if the application using the compoent
has no message loop. In this case the internal thread synchronization
will use SendMessageTimeout instead of PostMessage.                    }
{======================================================================}
{$BOOLEVAL OFF}{Unit depends on shortcut boolean evaluation}
Unit ncPrintMon;

Interface

Uses
  Messages, Windows, SysUtils, Classes, Printers, COntnrs, ncJob, SyncObjs;

Type
     
  {: Prototype of an event used to pass job information to a client
     if TPBPrintersMonitor.
    @param aJobInformation holds the information about the job. This
      object remains property of the caller, the event handler must
      not free it! }
  TncJobEvent = Procedure( const aJobinformation: TncJob ) of Object;
  TncJobDeletedEvent = Procedure( const JobID: Cardinal) of Object;

  {: This class offers job monitoring functionality to clients. As it is
    now the object monitors all installed printers automatically, and there
    is no way to limit this to one particular printer. The client has
    to filter out the events of interest itself. Monitoring can be
    suspended and resumed via the Active property and is not done at
    design-time. }

  TJobList = class ( TObjectList )
  private
    function GetJob(aIndex: Integer): TncJob;
  public
    function Exists(aPrinterIndex: Integer; aID: Cardinal): Boolean;
    property Jobs[aIndex: Integer]: TncJob
      read GetJob;
  end;    
  
  TncPrintersMonitor = class(TComponent)
  private
    FInternalSyncHelper: HWND; // helper window used to sync to main thread
    FPendingNotifications: TThreadList; // queue of notifications to process
    FNotifiers: TObjectList;           // list of notifier thread objects
    FActive: Boolean;          // monitoring state
    FNewJobEvent: TncJobEvent; // atached event handlers
    FJobChangeEvent: TncJobEvent;
    FJobCompleteEvent: TncJobEvent;
    FJobDeletedEvent: TncJobDeletedEvent;

    Procedure SetActive(const Value: Boolean);
    Procedure CreateNotifiers;
  protected
    {: Window function for the helper window, executes in the printer
       monitors thread, usually the main thread. }
    Procedure WndProc( Var msg: TMessage );

    {: Event handler for the notifier threads, will execute in the
       calling threads context.
      @param aJobInformation contains the job information. The method
        makes a copy of this object for the internal use of the monitor. }
    Procedure JobNotification( const Jobinfo: TncJob );

    {: Processes all pending notifications in the context of the
      printer monitors thread.  }
    Procedure ProcessNotifications;

    {: Fires the OnNewJob event, if a handler for it has been assigned. }
    Procedure DoNewJob( const aJobinformation: TncJob ); virtual;

    {: Fires the OnJobChange event, if a handler for it has been assigned. }
    Procedure DoJobChange( const aJobinformation: TncJob ); virtual;

    {: Fires the OnJobComplete event, if a handler for it has been assigned. }
    Procedure DoJobComplete( const aJobinformation: TncJob ); virtual;

  public
    Constructor Create( aOwner: TComponent ); override;
    Destructor Destroy; override;

    function GetJobList: TJobList;
    function GetPrinterIndexByName(aPrinterName: String): Integer;

    procedure JobControl(aPrinterIndex: Integer; aJobID: Cardinal; aControl: Byte);
  published
    property Active: Boolean read FActive write SetActive;
    property OnNewJob: TncJobEvent read FNewJobEvent write FNewJobEvent;
    property OnJobChange: TncJobEvent read FJobChangeEvent write FJobChangeEvent;
    property OnJobComplete: TncJobEvent read FJobCompleteEvent write FJobCompleteEvent;
    property OnJobDeleted: TncJobDeletedEvent read FJobDeletedEvent write FJobDeletedEvent;
  end;

  TncNaoPausar = class
  private
    FItens : TStrings;
    FEsteComp : String;
    FPausarEsteComp: Boolean;
    FCS : TCriticalSection;
    procedure SetText(const aText: String);
  public
    constructor Create;
    destructor Destroy;

    procedure SetEsteComp(const AComp: String);
    procedure SetPausarEsteComp(const APausarEsteComp: Boolean);
    procedure SetNaoPausar(const aText: String);
    
    function Pausar(AComp: String): Boolean;
  end;

  {: Exception class used to report monitor errors }
  EPBPrinterMonitorError = class( Exception );

Procedure Register;

var
  gNaoPausar : TncNaoPausar;

Implementation

Uses 
  ncClassesBase,
  WinSpool, 
  Forms, ncDebug;

Procedure Register;
  Begin
    RegisterComponents('PBGoodies', [TncPrintersMonitor]);
  End;

Procedure RaiseLastWin32Error;
  Begin
    RaiseLastOSError;
  End;
                                 
Type
  {: This thread class will monitor the job queue of a single printer.
    On changes to a job or the queue an event is fired. The events
    handler has to make sure the processing it does is thread-safe. }
  TncPrintMonitor = class( TThread )
  private
    FJobInformation: TncJob;
       // contains info on monitored printer and last job change
    FPrinterHandle : THandle;      // the printers API handle
    FWakeupEvent   : TSimpleEvent; // used to wake thread when it is destroyed
    FRunning       : Boolean;      // flag set when thread reaches Execute
    FJobChangeEvent: TncJobEvent;
    procedure HandleNotification(findhandle: THandle);  // attached event handler
  protected
    Procedure Execute; override;
    Constructor InternalCreate;
    Procedure DoJobChange; virtual;
    Procedure Wakeup;
    function GetPrinterIndex: Integer;
  public
    {: Do not use this constructor!
     @raises EPBPrinterMonitorError when called }
    Constructor Create( CreateSuspended: Boolean );

    {: This class function is used to create an instance of the
      class to monitor a specific printer.
     @param index is the index of the printer to monitor in Printer.Printers
     @param onChangeJob is the callback to receive job notifications.
     @precondition 0 <= index < Printer.Printers.count
     @returns the created object, or Nil, if the printer information could
       not be obtained from the API.  }
    class Function CreateMonitor( index: Integer; onChangeJob: TncJobEvent ): TncPrintMonitor;

    procedure GetJobs(aJL: TJobList);

    {: Wakes the thread from the wait state, closes the printer handle. }
    Destructor Destroy; override;

    function SamePrinterName(aName: String): Boolean;

    property PrtIndex: Integer
      read GetPrinterIndex;

    property PrtHandle: THandle
      read FPrinterHandle;

    property JInfo: TncJob
      read FJobInformation;  

    property OnJobChange: TncJobEvent read FJobChangeEvent write FJobChangeEvent;
  End;

{ TncPrintMonitor —————————————————————————————————————————————————————}

Constructor TncPrintMonitor.Create(CreateSuspended: Boolean);
  Begin
    raise EPBPrinterMonitorError.Create(
           'Do not use this constructor to create instances of '+
           'TncPrintMonitor, use the CreateMonitor method instead!' );
  End;

{-- GetCurrentPrinterHandle -------------------------------------------}
{: Retrieves the handle of the current printer
@Returns an API printer handle for the current printer
@Desc Uses WinSpool.OpenPrinter to get a printer handle. The caller
  takes ownership of the handle and <b>must</b> call ClosePrinter on it
  once the handle is no longer needed. Failing to do that creates a
  serious resource leak! <P>
  Requires Printers and WinSpool in the Uses clause.
@Raises EWin32Error if the OpenPrinter call fails.
}{ Created 30.9.2000 by P. Below
-----------------------------------------------------------------------}
Function GetCurrentPrinterHandle: THandle;
  var
    Defaults: TPrinterDefaults;
  Var
    Device, Driver, Port : array[0..255] of char;
    hDeviceMode: THandle;
  Begin { GetCurrentPrinterHandle }
    Printer.GetPrinter(Device, Driver, Port, hDeviceMode);
    Defaults.pDatatype := nil;
    Defaults.pDevMode := nil;
    
    if Copy(Device,1,2) = '\\' then 
      Defaults.DesiredAccess := SERVER_ALL_ACCESS else
      Defaults.DesiredAccess := PRINTER_ACCESS_USE or PRINTER_ACCESS_ADMINISTER;
      
      
    If not OpenPrinter(@Device, Result, @Defaults) Then
      Result := 0;
//      RaiseLastWin32Error;
  End; { GetCurrentPrinterHandle }

{: Selects the printer by the passed index and tries to obtains its
  API handle and a number of information items on it. If this succeeds
  the thread is created, fed the obtained data, and its reference is
  returned. The thread is suspended. <br/>
  We trap any exceptions on the way and do not allow them to escape
  the function, instead Nil is returned as result. If the symbol DEBUG
  is defined a message box with the exception message will be shown,
  but program flow will still continue after that. <p/>
  WARNING! This function has a side effect! It will change the selected
  printer! The routine calling CreateMonitor is responsible for saving
  and restoring the previously selected printer, if that is required.
  This is an optimization, since in typical use CreateMonitor will
  be called for every printer in the list. }
class Function TncPrintMonitor.CreateMonitor(index: Integer;
    onChangeJob: TncJobEvent): TncPrintMonitor;
  Var
    printerhandle: THandle;
    pInfo: PPrinterInfo2;
    bytesNeeded: DWORD;
    S: String;
  Begin
    If (index < 0) or (index >= Printer.Printers.Count) Then
      raise EPBPrinterMonitorError.CreateFmt(
             'TncPrintMonitor.CreateMonitor: index %d is out of range. '+
             'Valid indices are %d..%d.',
             [index, 0, Printer.Printers.Count] );

    Result := nil;
    printerhandle := 0;
    Try
      Printer.PrinterIndex := index;
      printerhandle := GetCurrentPrinterhandle;
      if printerhandle=0 then Exit;
      
      Winspool.GetPrinter( printerhandle, 2, Nil, 0, @bytesNeeded );
      If GetLastError <> ERROR_INSUFFICIENT_BUFFER Then
        RaiseLastWin32Error;
      pInfo := AllocMem( bytesNeeded );
      Try
        If not Winspool.GetPrinter( printerhandle, 2, pInfo, bytesNeeded, @bytesNeeded )
        Then
          RaiseLastWin32Error;
        Result := TncPrintMonitor.InternalCreate;
        Try
          Result.FPrinterHandle := printerhandle;
          Result.FJobInformation := TncJob.Create;
          with Result.FJobInformation do begin
            PrtHandle := printerhandle;
            PrinterIndex := index;
            PrinterName := pInfo^.pPrinterName;
            PrinterPort := pInfo^.pPortName;
            PrinterServer := pInfo^.pServerName;
            PrinterShare := pInfo^.pShareName;
          end;
          Result.FJobChangeEvent := OnChangeJob;
        Except
          Result.FPrinterHandle := 0;  // prevents ClosePrinter to be called twice
          FreeAndNil( Result );
          raise;
        End; { Except }
      Finally
        FreeMem( pInfo );
      End;
    Except
      On E: Exception Do Begin
        If printerhandle <> 0 Then
          ClosePrinter( printerhandle );
          
        If not (E Is EAbort) Then Begin
          S:= Format(
                'TncPrintMonitor.CreateMonitor raised an exception.'#13#10+
                'Exception class %s'#13#10'%s',
                [E.classname, E.Message] );
          Windows.MessageBox( 0, Pchar(S), 'Error', MB_OK or MB_ICONSTOP );
        End; { If }
      End; { On }
    End; { Except }
  End;

Destructor TncPrintMonitor.Destroy;
  Begin
    If not Terminated Then Terminate;
    Wakeup;
    If FRunning and Suspended Then Resume;
    inherited;  // will wait until the thread has died
    ClosePrinter( FPrinterHandle );
    FJobInformation.Free;
    FWakeupEvent.Free;
  End;

Procedure TncPrintMonitor.DoJobChange;
  Begin
    If Assigned( FJobChangeEvent ) Then
      FJobChangeEvent( FJobInformation );
  End;

Procedure TncPrintMonitor.HandleNotification( findhandle: THandle );
  Var
    pni: PPrinterNotifyInfo;
    ChangeReason: Cardinal;

  Function ReasonWas( flag: Cardinal ): Boolean;
    Begin
      Result := (flag and ChangeReason) <> 0;
    End; { ReasonWas }

  Function FindJobStatus: Byte;
    Var
      i: Integer;
      status: Cardinal;

    Function StatusIs(flag: Cardinal): Boolean;
      Begin
        Result := (flag and status) <> 0;
      End; { StatusIs }

    Begin { FindJobStatus }
      Result := jsNone;
      If Assigned( pni ) Then
      For i:=0 To pni^.Count-1 Do
        If pni^.aData[i].Field = JOB_NOTIFY_FIELD_STATUS Then Begin
          status := pni^.aData[i].NotifyData.adwData[0];
          FJobInformation.Spooling := StatusIs( JOB_STATUS_SPOOLING);
          FJobInformation.StatusPaused := StatusIs( JOB_STATUS_PAUSED);
            
          If StatusIs( JOB_STATUS_PRINTED ) Then
            Result := jsCompleted
          Else If StatusIs( JOB_STATUS_DELETING ) Then begin
            Result := jsNone;
            FJobInformation.Spooling := False;
            // we skip this case because we will get another notification for that
          end Else If StatusIs( JOB_STATUS_SPOOLING )
          Then
            Result := jsProcessing
          Else If StatusIs( JOB_STATUS_PRINTING )
          Then
            Result := jsPrinting  
          Else If StatusIs( JOB_STATUS_ERROR or JOB_STATUS_OFFLINE or
                            JOB_STATUS_PAPEROUT )
          Then
            Result := jsError
          Else If StatusIs( JOB_STATUS_PAUSED ) Then
            Result := jsPaused;
          Break;
        End; { If }
    End; { FindJobStatus }

  Procedure GetJobInformation;
    Function DataString( index: Integer ): String;
      Begin
        Result := Pchar( pni^.aData[index].NotifyData.Data.pBuf )
      End;
    Function DataValue( index: Integer ): Cardinal;
      Begin
        Result := pni^.aData[index].NotifyData.adwData[0];
      End;
    Function GetPrinterNumCopies(index: Integer):Cardinal;
      Begin
        result:=PDeviceMode( pni^.aData[index].NotifyData.Data.pBuf)^.dmCopies;
      End;
    Function GetPrinterOrientation(index: Integer):TPrinterOrientation;
      var Orientation: smallint;
      Begin
        Orientation:=
          PDeviceMode(pni^.aData[index].NotifyData.Data.pBuf)^.dmOrientation;
       Case orientation Of
         DMORIENT_PORTRAIT : result:=poPortrait;
         DMORIENT_LANDSCAPE: result:=poLandscape;
       Else
         result := poPortrait;
         Assert( false, 'Unknown value in dmOrientation');
       End;
      End;

    Var
      i: Integer;
      status: cardinal;
    Begin { GetJobInformation }
      If not Assigned( pni) or (pni^.Count = 0) Then Exit;
      
      FJobInformation.JobID := pni^.aData[0].Id;
      For i:=0 To pni^.Count-1 Do
        Case pni^.aData[i].Field Of
          JOB_NOTIFY_FIELD_STATUS: begin
            status := pni^.aData[i].NotifyData.adwData[0];
            FJobInformation.StatusPaused := ((JOB_STATUS_PAUSED and Status) <> 0);
          end; 
          JOB_NOTIFY_FIELD_MACHINE_NAME:
            FJobInformation.Computer := Datastring(i);
          JOB_NOTIFY_FIELD_USER_NAME:
            FJobInformation.User := Datastring(i);
          JOB_NOTIFY_FIELD_DOCUMENT: begin
            DebugMsg('TncPrintMonitor.DoJobChange - JOB_NOTIFY_FIELD_DOCUMENT - ' + Datastring(i));
            FJobInformation.Document := Datastring(i);
          end;
          JOB_NOTIFY_FIELD_TOTAL_PAGES:
            FJobInformation.TotalPages := Datavalue(i);
{          JOB_NOTIFY_FIELD_TOTAL_BYTES:
            FJobInformation.Totalbytes := Datavalue(i);}
{          JOB_NOTIFY_FIELD_BYTES_PRINTED:
            FJobInformation.BytesPrinted := Datavalue(i);}
          JOB_NOTIFY_FIELD_PAGES_PRINTED:
            FJobInformation.Pages := Datavalue(i);
          JOB_NOTIFY_FIELD_DEVMODE: Begin
              FJobInformation.Copies:= GetPrinterNumCopies(i);
//              FJobInformation.FOrientiation := GetPrinterOrientation(i);
            End;
        End; { Case }
    End; { GetJobInformation }

  Begin { HandleNotification }
    FJobInformation.Spooling := False;
  
    If FindNextPrinterChangeNotification(
         findhandle, ChangeReason, nil, Pointer(pni) )
    Then Try
      If ReasonWas( PRINTER_CHANGE_ADD_JOB ) Then  begin
        FJobInformation.Status := jsNew;
        FJobInformation.Spooling := True;
      end
      Else If ReasonWas( PRINTER_CHANGE_DELETE_JOB ) Then
      begin
        FJobInformation.Status := jsCompleted;
        FJobInformation.Spooling := False;
      end
      Else If ReasonWas( PRINTER_CHANGE_SET_JOB ) Then
        FJobInformation.Status := FindJobStatus
      Else If ReasonWas( PRINTER_CHANGE_WRITE_JOB ) Then
      begin
        FJobInformation.Status := jsProcessing;
        FJobInformation.Spooling := True;
      end
      Else
        FJobInformation.Status := jsNone;

      If FJobInformation.Status <> jsNone Then Begin
        GetJobInformation;
        DoJobChange;
      End; { If }
    Finally
      FreePrinterNotifyInfo( pni );
    End; { Finally }
  End; { TncPrintMonitor.HandleNotification }

Procedure TncPrintMonitor.Execute;
  Const
    jobfields : Array [1..9] of Word =
      (
        JOB_NOTIFY_FIELD_MACHINE_NAME,
        JOB_NOTIFY_FIELD_USER_NAME,
        JOB_NOTIFY_FIELD_DOCUMENT,
        JOB_NOTIFY_FIELD_TOTAL_PAGES,
        JOB_NOTIFY_FIELD_TOTAL_BYTES,
        JOB_NOTIFY_FIELD_BYTES_PRINTED,
        JOB_NOTIFY_FIELD_PAGES_PRINTED,
        JOB_NOTIFY_FIELD_STATUS,
        JOB_NOTIFY_FIELD_DEVMODE );
  Var
    handles: packed Record
        findhandle, wakehandle: THandle;
      end;
    notifyOptions: PRINTER_NOTIFY_OPTIONS;
    notifyType: PRINTER_NOTIFY_OPTIONS_TYPE;
    retval: DWORD;
    S: String;
  Begin
    FRunning := True;
    If Terminated Then Exit;
    notifyOptions.Version := 2;
    notifyOptions.Count   := 1;
    notifyOptions.Flags   := PRINTER_NOTIFY_OPTIONS_REFRESH;
    notifyOptions.pTypes  := @notifyType;
    FillChar( notifyType, sizeof( notifyType ), 0 );
    notifyType.wType      := JOB_NOTIFY_TYPE;
    notifyType.pFields    := @jobfields;
    notifyType.Count      := High( jobfields )- Low( jobfields ) + 1;
    handles.wakehandle := FWakeupEvent.Handle;
    handles.findhandle :=
      FindFirstPrinterChangeNotification(
        Fprinterhandle,
        PRINTER_CHANGE_JOB, // we are only interested in job-related changes
        0, @notifyoptions );
    If handles.findhandle <> INVALID_HANDLE_VALUE Then Begin
      While not Terminated Do Begin
        retval := WaitForMultipleObjects( 2, @handles, false, INFINITE );
        If not Terminated Then
          If retval = WAIT_OBJECT_0 Then
            try
              HandleNotification( handles.findhandle )
            except
              // HandleNotifiaction will only ever raise assertions,
              // which the IDE debugger will trap for us
            end
          Else
            Break;
      End; { While }
      FindClosePrinterChangeNotification( handles.findhandle );
    End { If }
    Else Begin
      S:= 'FindFirstPrinterChangeNotification failed for printer '+
          FJobInformation.PrinterName+', the system error is'#13#10+
          SysErrorMessage( GetLastError );
      Windows.MessageBox( 0, Pchar(S), 'Error', MB_OK or MB_ICONSTOP );
    End; { Else }
  End;

procedure TncPrintMonitor.GetJobs(aJL: TJobList);
type
  TJobs = Array [0..1000] of JOB_INFO_1;
  PJobs = ^TJobs;
var
  hPrinter : THandle;
  bytesNeeded, numJobs, i: Cardinal;
  pJ: PJobs;
  J : TncJob;
  Status: Cardinal;

function StatusIs( flag: Cardinal ): Boolean;
Begin
  Result := (flag and status) <> 0;
End; { StatusIs }

function GetStatus: Byte;
begin
  Result := jsNone;
  J.Spooling := StatusIs( JOB_STATUS_SPOOLING );

  if StatusIs(JOB_STATUS_DELETED) then
    J.Deleted := True;
  
  If StatusIs( JOB_STATUS_PRINTED ) Then
    Result := jsCompleted
  Else If StatusIs( JOB_STATUS_DELETING ) Then
    Result := jsNone
    // we skip this case because we will get another notification for that
  Else If StatusIs( JOB_STATUS_SPOOLING )
  Then
    Result := jsProcessing
  Else If StatusIs( JOB_STATUS_PRINTING )
  Then
    Result := jsPrinting  
  Else If StatusIs( JOB_STATUS_ERROR or JOB_STATUS_OFFLINE or
                    JOB_STATUS_PAPEROUT )
  Then
    Result := jsError
  Else If StatusIs( JOB_STATUS_PAUSED ) Then
    Result := jsPaused;
end;

begin
  EnumJobs( FPrinterHandle, 0, 1000, 1, Nil, 0, bytesNeeded, numJobs );
  if bytesNeeded=0 then Exit;
  GetMem( pJ, bytesNeeded );
  try
    if not EnumJobs( FPrinterHandle, 0, 1000, 1, pJ, bytesNeeded, bytesNeeded, numJobs ) then Exit;
    for I := 0 to numJobs - 1 do begin
      J := TncJob.Create; 
      with J do begin
        PrtHandle := FPrinterHandle;
        PrinterIndex := FJobInformation.PrinterIndex;
        PrinterName := FJobInformation.PrinterName;
        PrinterPort := FJobInformation.PrinterPort;
        PrinterServer := FJobInformation.PrinterServer;
        PrinterShare := FJobInformation.PrinterShare;
      end;
      J.Computer := pJ^[i].pMachineName;
      J.User := pJ^[i].pUserName;
      J.Document := pJ^[i].pDocument;
      DebugMsg('TncPrintMonitor.DoJobChange - GetJobs - ' + J.Document);
      
      J.Pages := pJ^[i].PagesPrinted;
      J.TotalPages := pJ^[i].TotalPages;
      J.JobID := pJ^[i].JobId;
      Status := pJ^[i].Status;
      aJL.Add(J);                              
      J.Status := GetStatus;
      J.StatusPaused := StatusIs(Job_Status_Paused);
    end;
  finally
    FreeMem(pJ);
  end;
end;

function TncPrintMonitor.GetPrinterIndex: Integer;
begin
  Result := FJobInformation.PrinterIndex;
end;

{: Create the thread suspended, create the wakeup event. }
Constructor TncPrintMonitor.InternalCreate;
  Begin
    inherited Create( true );
    FWakeupEvent := TSimpleEvent.Create;
  End;

function TncPrintMonitor.SamePrinterName(aName: String): Boolean;
begin
  with FJobInformation do begin
    while Pos('\', aName)>0 do 
      Delete(aName, 1, Pos('\', aName));
    Result := SameText(PrinterName, aName) or
              SameText(PrinterShare, aName);
  end;
end;

Procedure TncPrintMonitor.Wakeup;
  Begin
    FWakeupEvent.SetEvent;
  End;

{ TncPrintersMonitor ———————————————————————————————————————————————————}

Const
  UM_JOBNOTIFICATION = WM_APP;

Constructor TncPrintersMonitor.Create(aOwner: TComponent);
  Begin
    inherited;
    FJobDeletedEvent := nil;
    If not (csDesigning In ComponentState) Then Begin
      FInternalSyncHelper := Classes.AllocateHWnd( WndProc );
      FPendingNotifications :=  TThreadList.Create;
      FNotifiers := TObjectList.Create( true ); // Owns the objects
      CreateNotifiers;
    End; { If }
  End;

Procedure TncPrintersMonitor.CreateNotifiers;
  Var
    aNotifier: TncPrintMonitor;
    i: Integer;
    oldIndex: Integer;
  Begin
    If Printer.Printers.Count > 0 Then
    Try
      oldindex := Printer.PrinterIndex;
      Try
        For i:= 0 To Printer.Printers.Count-1 Do Begin
          aNotifier := TncPrintMonitor.CreateMonitor( i, JobNotification );
          If Assigned( aNotifier ) Then
            FNotifiers.Add( aNotifier );
        End; { For }
      Finally
        Printer.PrinterIndex := oldIndex;
      End; { Finally }
    Except
      // this is a crutch. If no default printer is defined accessing
      // PrinterIndex can cause an exception
    End; { Except }
  End;

Destructor TncPrintersMonitor.Destroy;
  Begin
    FNotifiers.Free;
    FPendingNotifications.Free;
    Classes.DeallocateHWnd( FInternalSyncHelper );
    inherited;
  End;

Procedure TncPrintersMonitor.DoJobChange(
    const aJobinformation: TncJob);
  Begin
    If Assigned( FJobChangeEvent ) Then
      FJobChangeEvent( aJobinformation );
  End;

Procedure TncPrintersMonitor.DoJobComplete(
    const aJobinformation: TncJob);
  Begin
    If Assigned( FJobCompleteEvent ) Then
      FJobCompleteEvent( aJobinformation );
  End;

Procedure TncPrintersMonitor.DoNewJob(
    const aJobinformation: TncJob);
  Begin
    If Assigned( FNewJobEvent ) Then
      FNewJobEvent( aJobinformation );
  End;

function TncPrintersMonitor.GetJobList: TJobList;
var I : Integer;
begin
  Result := TJobList.Create;
  for I := 0 to FNotifiers.Count-1 do
    TncPrintMonitor(FNotifiers[I]).GetJobs(Result);
end;

function TncPrintersMonitor.GetPrinterIndexByName(
  aPrinterName: String): Integer;
var 
  I: Integer;  
begin
  for I := 0 to FNotifiers.Count - 1 do with TncPrintMonitor(FNotifiers[I]) do
    if SamePrinterName(aPrinterName) then begin
      Result := PrtIndex;
      Exit;
    end;
  Result := -1;   
end;

procedure TncPrintersMonitor.JobControl(aPrinterIndex: Integer;
  aJobID: Cardinal; aControl: Byte);
var I: Integer;  
begin
  for I := 0 to FNotifiers.Count - 1 do with TncPrintMonitor(FNotifiers[I]) do 
     if PrtIndex=aPrinterIndex then begin
       SetJob(PrtHandle, aJobID, 0, nil, aControl);
       DebugMsg('TncPrintersMonitor.JobControl - aPrinterIndex: ' + 
           IntToStr(aPrinterIndex) + 
           ' - aJobID: ' + IntToStr(aJobId) + 
           ' - aControl: ' + IntToStr(aControl) + 
           ' - Error: ' + IntToStr(GetLastError));
       
       Exit;
     end;
     
  DebugMsg('TncPrintersMonitor.JobControl - aPrinterIndex: ' + 
           IntToStr(aPrinterIndex) + 
           ' - aJobID: ' + IntToStr(aJobId) + 
           ' - aControl: ' + IntToStr(aControl) + ' - aPrinterIndex não encontrado');
end;

Procedure TncPrintersMonitor.JobNotification(
    const Jobinfo: TncJob);
var Erro: Integer;    

function GetDocName: String;
var
  jobInfo2:PjobInfo2;
  bytesNeeded:DWORD;
  Erro: Cardinal;
begin
  Result := jobinfo.Document;
  JobInfo2:=nil;
  try
      
      GetJob(jobinfo.PrtHandle,jobinfo.JobID,2,nil,0,@bytesNeeded);
      Erro := GetLastError;
      If Erro<>ERROR_INSUFFICIENT_BUFFER then begin
        DebugMsg('GetDocName - A-Erro: ' + IntToStr(Erro)+' - PrtHandle: ' + IntToStr(jobinfo.PrtHandle) + ' - JobID: ' + IntToStr(Jobinfo.JobID));
        Exit;
      end;
      jobInfo2:=AllocMem(bytesNeeded);
      try
         If not GetJob(jobinfo.PrtHandle, jobinfo.JobID, 2, JobInfo2,bytesNeeded, @bytesNeeded) then begin
           DebugMsg('GetDocName - B-Erro: ' + IntToStr(GetLastError)+' - PrtHandle: ' + IntToStr(jobinfo.PrtHandle) + ' - JobID: ' + IntToStr(Jobinfo.JobID));
           Exit;
         end;
         Result := jobinfo2.pDocument;
         DebugMsg('GetDocName OK - ' + Result);
      except
        exit;
      end;
  finally
    freeMem(JobInfo2);
  end;
end;

  Begin
    DebugMsg('TncPrintersMonitor.JobNotification - Status: '+IntToStr(JobInfo.Status) +
      ' - PMPDF: ' + BoolStr[gConfig.PMPDF] + 
      ' - PMPausaAutomatica: ' + BoolStr[gConfig.PMPausaAutomatica] + 
      ' - gNaoPausar.PausarEsteComp: ' + BoolStr[gNaoPausar.FPausarEsteComp] +
      ' - gNaoPausar.EsteComp: ' + gNaoPausar.FEsteComp +
      ' - JobInfo.Computer: ' + JobInfo.Computer);
      
    JobInfo.Document := GetDocName;

    if gConfig.PausarJobs then 
    if (JobInfo.Status=jsNew) and gNaoPausar.Pausar(JobInfo.Computer) and (not JobInfo.Doc_NexCafe) then begin
      JobInfo.Pausou := True;
      if SetJob(JobInfo.PrtHandle, JobInfo.JobID, 0, nil, JOB_CONTROL_PAUSE) then 
      begin
        JobInfo.Pausou := True;
        DebugMsg('TncPrintersMonitor.JobNotification - SetJob - JobID: ' + IntToStr(JobInfo.JobId) + ' - JOB_CONTROL_PAUSE OK - Computer: '+JobInfo.Computer);
      end else 
        DebugMsg('TncPrintersMonitor.JobNotification - SetJob - JobID: ' + IntToStr(JobInfo.JobId) + ' - JOB_CONTROL_PAUSE ERROR: ' + IntToStr(GetlastError));
    end else begin
      JobInfo.Pausou := False;
      if JobInfo.Status=jsNew then
        DebugMsg('TncPrintersMonitor.JobNotification - Pausa desativada');
    end;

    FPendingNotifications.Add( JobInfo.Clone );
    PostMessage( FInternalSyncHelper, UM_JOBNOTIFICATION, 0, 0 );
  End;

Procedure TncPrintersMonitor.ProcessNotifications;
  Var
    items: TObjectList;
    list: TList;
    i: Integer;
    jobinfo: TncJob;
  Begin
    items := nil;
    list:= FPendingNotifications.LockList;
    Try
      If list.count > 0 Then Begin
        items:= TOBjectlist.Create;  // owns its objects
        For i:=0 To list.Count-1 Do
          items.add( TObject( list[i] ));
        list.Clear;
      End; { If }
    Finally
      FPendingNotifications.UnlockList;
    End; { Finally }
    If Assigned( items ) Then
    Try
      For i:= 0 To items.count-1 Do Begin
        jobinfo:= TncJob( items[i] );
        Case jobinfo.Status Of
          jsNew       : DoNewJob( jobinfo );
          jsCompleted : DoJobComplete( jobinfo );
        Else
          DoJobChange( jobinfo );
        End; { Case }
      End; { For }
    Finally
      items.Free
    End; { Finally }
  End;

Procedure TncPrintersMonitor.SetActive(const Value: Boolean);
  Var
    i: Integer;
  Begin
    If FActive <> Value Then Begin
      FActive := Value;
      If not (csDesigning In ComponentState) Then
        For i:= 0 to FNotifiers.Count-1 Do
          If Value Then
            TncPrintMonitor( FNotifiers[i] ).Resume
          Else
            TncPrintMonitor( FNotifiers[i] ).Suspend;
    End; { If }
  End;

Procedure TncPrintersMonitor.WndProc(var msg: TMessage);
  Begin
    If msg.Msg = UM_JOBNOTIFICATION Then
      ProcessNotifications
    Else
      msg.Result := DefWindowProc( FInternalSyncHelper,
                                   msg.Msg,
                                   msg.WParam,
                                   msg.LParam );
  End;


{ TJobList }

function TJobList.Exists(aPrinterIndex: Integer; aID: Cardinal): Boolean;
var i: Integer;
begin
  for I := 0 to Count-1 do with Jobs[I] do 
    if (PrinterIndex=aPrinterIndex) and (JobID=aID) then begin
      Result := True;
      Exit;
    end;
    
  Result := False;
end;

function TJobList.GetJob(aIndex: Integer): TncJob;
begin
  Result := TncJob(Items[aIndex]);
end;


{ TncNaoPausar }

constructor TncNaoPausar.Create;
begin
  FItens := TStringList.Create;
  FCS := TCriticalSection.Create;
  FPausarEsteComp := False;
  FEsteComp := '';
end;

destructor TncNaoPausar.Destroy;
begin
  FCS.Free;
  FItens.Free;
  inherited;
end;

function TncNaoPausar.Pausar(AComp: String): Boolean;
begin
  while Copy(AComp, 1, 1)='\' do Delete(AComp, 1, 1);
  
  FCS.Enter;
  try
    if SameText(AComp, FEsteComp) then 
      Result := FPausarEsteComp else
      Result := (FItens.IndexOf(AComp)=-1);
  finally
    FCS.Leave
  end;
end;

procedure TncNaoPausar.SetEsteComp(const AComp: String);
begin
  FCS.Enter;
  try
    FEsteComp := AComp;
  finally
    FCS.Leave;
  end;
end;

procedure TncNaoPausar.SetNaoPausar(const aText: String);
begin
  FCS.Enter;
  try
    FItens.Text := aText;
  finally
    FCS.Leave;
  end;
end;

procedure TncNaoPausar.SetPausarEsteComp(const APausarEsteComp: Boolean);
begin
  FCS.Enter;
  try
    FPausarEsteComp := APausarEsteComp;
  finally
    FCS.Leave;
  end;
end;

procedure TncNaoPausar.SetText(const aText: String);
begin
  FCS.Enter;
  try
    FItens.Text := aText;
  finally
    FCS.Leave;
  end;
end;

initialization
  gNaoPausar := TncNaoPausar.Create;

finalization
  gNaoPausar.Free;  

end.

