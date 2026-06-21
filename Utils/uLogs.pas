unit uLogs;
{
    ResourceString: Dario 13/03/13
}

interface

uses
    SysUtils, Classes, SyncObjs, Windows, dialogs, strUtils, messages;

Const
    LogSeparator = ' ';
    kMaxLogCategoryStr = 19;
    WM_NEWDEBUGMSG = WM_USER + 1;

var
    LogCategoryDisplayStr : array [1..kMaxLogCategoryStr] of string = (
                     'None', 'All', 'Except', 'Info', 'Trace', 'Messages', 'Debug',
                     'DBReplication', 'DBIntegrity', 'Segurança', 'Nivel1', 'Nivel2', 'Nivel3',
                     'Frm2Xlate', 'XlateDetail', 'XNoSuppor', 'XNoTrnslt', 'lcXlate', 'HTTP_req' );

    LogCategoryStr : array [1..kMaxLogCategoryStr] of string = (
                     'lcNone', 'lcAll', 'lcExcept', 'lcInfo', 'lcTrace', 'lcMsgs', 'lcDebug',
                     'lcDBReplication', 'lcDBIntegrity', 'lcSeguranca', 'lcNivel1', 'lcNivel2', 'lcNivel3',
                     'lcFrm2Xlate', 'lcXlateDetail', 'lcXNoSuppor', 'lcXNoTrnslt', 'lcXlate', 'lcHTTP_req');

    DebugClients : TThreadList;

type
    TLogCategory  = ( lcNone, lcAll, lcExcept, lcInfo, lcTrace, lcMsgs, lcDebug,
                      lcDBReplication, lcDBIntegrity, lcSeguranca, lcNivel1, lcNivel2, lcNivel3,
                      lcFrm2Xlate, lcXlateDetail, lcXNoSuppor, lcXNoTrnslt, lcXlate, lcHTTP_req );


    TSetOfTLogCategory = set of TLogCategory;

    TLogMsg = class(TObject)
       Cats : TSetOfTLogCategory;
       msg  : String;
    end;

    TDebugMsg = class
       dmMsg : String;
       dmTime : TDateTime;
       function GetClassName: String;
       constructor Create(aMsg: String; aTime: TDateTime);
    end;
    TDebugNewMsg = procedure(aMsg: TDebugMsg) of object;

    TLogMsgList = class(TList)
      protected
       function  Get(Index: Integer): TLogMsg;
       procedure Put(Index: Integer; Item: TLogMsg);
      public
       procedure Clear; override;
       procedure CopyFrom(aSource:TLogMsgList);
       function add (aCats:TSetOfTLogCategory; aMsg: String): Integer;
       property Items[Index: Integer]: TLogMsg read Get write Put; default;
       destructor Destroy; override;
    end;

    TLog = class ( TComponent )
      private
        FLogFileOpen : boolean;
        FLogFileName     : string;
        FLogFile : Textfile;
        FLinesBeforeOpen : TLogMsgList;
        FCloneMe : boolean;
        FPrefixo     : String;
        FForcing         : boolean;
        FActive          : boolean;
        //FLogTCPConnection : TIdTCPConnection;
        //FLogToTCP        : boolean;
        FNothingToForce  : boolean;
        FLogToFile       : boolean;
        //FLogRedirectionHead  : TRedirectionHead;
        FLogDirPath      : string;
        FLogCategoriesIncluidas : TSetOfTLogCategory;
        FLogCategoriesExcluidas : TSetOfTLogCategory;
        FLogCategoriesStr  : string;
        FCustomCategories : TStringList;
        FCustomCategoriesIncluidas : TStringList;
        FCustomCategoriesExcluidas : TStringList;
        procedure ClasificarLogCategories(lc : TSetOfTLogCategory; operacao:char);overload;
        procedure ClasificarLogCategories(lc : string; operacao:char);overload;
        procedure str2LogCategories(lcs : string);
        function  LogCategories2Str(lc : TSetOfTLogCategory): string;
        procedure SetLogDirPath(value:string);
        procedure SetLogCategories(aLogCategoriesStr:string);
        function  GetThreadID(Sender:TObject):string;
        function  encolumnar(s:string; cols:integer):string;
        procedure SetActive(value:boolean);
        procedure _LogBeforeOpen(Sender: TObject; aLogCategories: TSetOfTLogCategory; s: string);
        procedure _Log(Sender: TObject; aLogCategories: TSetOfTLogCategory; sCustomLogCategory: string;  s: string );
      public
        procedure LoadConfig;
        property  LogFileName : string read FLogFileName;
        function  defLogCategoriesStr:string;
        procedure OpenLogFile;
        procedure ReiniciarLogFile;
        procedure CloseLogFile;
        procedure ForceLogWrite;
        function  AddCategory(alcName:string):integer;
        procedure LogCriticalException (Sender: TObject; aCodigo:integer; e:exception;const s: string=''); overload;
        procedure Log (Sender: TObject; aLogCategories: TSetOfTLogCategory; s: string); overload;
        procedure Log (Sender: TObject; sCustomLogCategory: string; s: string); overload;
        procedure ForceLog (Sender: TObject; aLogCategories: TSetOfTLogCategory; s: string);
        constructor  Create(AOwner: TComponent); override;
        destructor  Destroy; override;

        procedure LoadParamsFromIni(aFilename: String = '');
      published
        property  LogCategoriesStr  : string read FLogCategoriesStr write SetLogCategories;
        property  LogDirPath  : string  read FLogDirPath write SetLogDirPath;
        property  Prefixo   : string  read FPrefixo write FPrefixo;
        property  LogToFile : boolean read FLogToFile write FLogToFile;
        property  Active : boolean read FActive write SetActive;
      end;

      procedure Register;
      function ExtrairAspasFilePath (fp:string):string;
      function NormalizarFilePath (fp:string):string;
      function Var2Str(V: Variant): String;
var
      csLog   : TCriticalSection;
      GLog : TLog;
      counter : Longword;
      GComputerName : String;
      GProgTitle    : String;
      GProgramName : String;
      GApplicationPath    : String;
      GLogDirPath         : String;
      
implementation

{// $ R *.RES}
uses variants, uVersionInfo, dateutils, ncErros;

procedure Register;
begin
  RegisterComponents('Utils', [TLog]); // do not localize
end;

function NormalizarFilePath (fp:string):string;
begin
     if (length(fp)>0) and ( fp[length(fp)]<>'\' ) then
       fp := fp + '\';
     while pos('\\',fp)>0 do
           fp := copy(fp, 1, pos('\\',fp)) + copy(fp, pos('\\',fp)+2, maxint);
     result := fp;
end;

function ExtrairAspasFilePath (fp:string):string;
begin
     if (length(fp)>1) then begin
       if  fp[1]='"' then fp := copy(fp, 2, maxint);
       if  fp[length(fp)]='"' then SetLength(fp, length(fp)-1);
     end;
     result := fp;
end;

function Var2Str(V: Variant): String;
begin
  try
    if V=null then
      Result := '[null]' else // do not localize
      Result := V;
  except
    on E: Exception do 
      Result := '[cadDebug.Var2Str Exception: ' + E.Message + ']'; // do not localize
  end;
end;

procedure TLog.SetLogDirPath(value:string);
begin
     if value<>FLogDirPath then begin
         if DirectoryExists(value) then
             FLogDirPath := value
         else
         if not forcedirectories(value) then
             FLogDirPath := ExtractFilePath(ParamStr(0))
         else
             FLogDirPath := value;
     end;
end;

function  TLog.defLogCategoriesStr:string;
begin
    result := 'lcExcept, lcInfo, lcLicencas'; // do not localize
end;

procedure TLog.SetLogCategories(aLogCategoriesStr:string);
var
      logStr, CategoriesStr : String;
begin
      csLog.Acquire;
      try
         str2LogCategories(aLogCategoriesStr);
         CategoriesStr := LogCategories2Str(FLogCategoriesIncluidas);
         if FLogCategoriesExcluidas<>[] then
               CategoriesStr := CategoriesStr + ' - (' + LogCategories2Str(FLogCategoriesExcluidas) + ')';
         if FLogToFile and not( csDesigning in ComponentState) then begin
            logStr := formatfloat('0000000', counter) + char(LogSeparator) + // do not localize
                      formatdatetime('hh:nn:ss.zzz',now) + char(LogSeparator) + // do not localize
                      formatfloat('000000', MainThreadID and $FFFFF) + // do not localize
                      ' Info......' + char(LogSeparator) + // do not localize
                       copy ( dupeString('.',25), 1, 25) + char(LogSeparator) +
                      'Categorias de Log: '+ CategoriesStr  ; // do not localize
            if FLogFileOpen then
               writeln( FLogFile , logStr );
         end;
     finally
        csLog.Release;
     end;
end;

function  TLog.encolumnar(s:string; cols:integer):string;
var
     sl : TStringList;
     i : integer;
     tab : string;
begin
     if pos(#13#10, s)>0 then begin
         tab := StringOfChar (#32, cols);
         sl := TStringList.create;
         try
           sl.Text := s;
           for i:=1 to sl.count-1 do
              sl[i] := tab+sl[i];
           result := trim(sl.Text);
         finally
           sl.Free;
         end;
     end else
         result := s;
end;

procedure TLog.SetActive(value:boolean);
begin
     if FActive<>value then begin
        FActive := value;
        if (FActive) and (not( csDesigning in ComponentState)) then

           if not FLogFileOpen then
              OpenLogFile;
     end;
end;

procedure TLog.LoadConfig;
var
    mLogToFile : boolean;
    mLogCategories : string;
    slAddCategories : TStringList;
    Inifile : TStringList;
    myini : string;
    i : integer;
begin
    mLogToFile := false;
    //iniok := false;
    myini := VersionInfo.ExePath + VersionInfo.ExeName;
    FPrefixo := VersionInfo.ExeName;
    FPrefixo := copy(FPrefixo, 1, pos('.exe', FPrefixo)-1); // do not localize
    FLogDirPath := VersionInfo.ExePath +  '\Logs'; // do not localize
    if pos('.',myini)>0 then begin
        myini := copy(myini, 1, pos('.',myini)) + 'ini'; // do not localize
        if (fileExists(myini)) then begin
            Inifile := TStringList.Create;
            slAddCategories := TStringList.Create;
            Inifile.LoadFromFile(myini);
            try
                if Inifile.IndexOfName('Prefixo')>-1 then // do not localize
                     FPrefixo       := Inifile.Values['Prefixo']; // do not localize
                if Trim(Inifile.Values['LogDirPath'])>'' then // do not localize
                     FLogDirPath    := Inifile.Values['LogDirPath']; // do not localize
                slAddCategories.commatext := Trim(Inifile.Values['AddCategories']); // do not localize
                mLogCategories := Trim(Inifile.Values['LogCategories']); // do not localize
                mLogToFile     := (Inifile.Values['LogToFile']='1') or SameText(IniFile.Values['Debug'], 'S'); // do not localize
                if SameText(IniFile.Values['Debug'], 'S') and (mLogCategories='') then // do not localize
                  mLogCategories := '+lcAll'; // do not localize

                for i:=0 to slAddCategories.count-1 do
                if trim(slAddCategories[i])>'' then
                   AddCategory(slAddCategories[i]);
            finally
               Inifile.Free;
               slAddCategories.free;
            end;
        end;
    end;
    SetLogDirPath(FLogDirPath);

    if FLogDirPath<>'' then
      forcedirectories(FLogDirPath);

    SetLogCategories (mLogCategories);
    FLogToFile := mLogToFile;

    // ----------------------------------


     VersionInfo.LoadVersionInfo;
     if trim(VersionInfo.AsString) <> '' then
        Log(self,[lcInfo], VersionInfo.AsString);
     if trim(VersionInfo.WindowsInfo.AsString) <> '' then
        Log(self,[lcInfo], 'Computador: ' + uVersionInfo.ComputerName + #13#10 + // do not localize
                          'Sistema Operacional: ' + VersionInfo.WindowsInfo.AsString); // do not localize
     Log(self, [lcInfo], VersionInfo.ProcessorInfo.AsString);
     Log(self, [lcInfo], VersionInfo.NetWorkInfo.AsString);
     // sera corrigido comparadando contra mac da licenca
     //GNetAdapter1HWAddress := VersionInfo.NetWorkInfo.NetAdapter1MAC;
     GComputerName := uVersionInfo.ComputerName;

     GProgTitle := GProgramName +' '+ VersionInfo.ProgramDisplayShortVersion;
     //GApplicationPath    := NormalizarFilePath(ExtractFilePath(ApplicationExeName));
     //GApplicationExeName := copy(ApplicationExeName, length(GApplicationPath)+1, maxint);
     Log(self,[lcInfo], 'ApplicationPath: '+GApplicationPath); // do not localize
     Log(self,[lcInfo], 'Process ID: '+ inttostr(GetCurrentProcessId)); // do not localize

     ForceLogWrite;
end;

procedure TLog.OpenLogFile;
var
     i : integer;
     novo : boolean;
begin
     novo := false;
     csLog.Acquire;
     try
         FLogFileName := NormalizarFilePath(FLogDirPath) + FPrefixo + '_';
         if FForcing then
             FLogFileName := FLogFileName + formatdatetime ('yyyymmdd', now) + '.log' // do not localize
         else
             FLogFileName := FLogFileName + formatdatetime ('yyyymmdd"_"hhnnss', now) + '.log'; // do not localize

         if not FLogFileOpen then
            if FLogToFile then begin
                assignfile( FLogFile, FLogFileName );
                if fileexists(FLogFileName) then begin
                    append(FLogFile);
                    novo := false;
                end else begin
                    rewrite(FLogFile);
                    novo := true;
                end;
                FLogFileOpen := true;

                if not FForcing then
                   SetLogCategories (FLogCategoriesStr);
                ForceLogWrite;
            end;
            
         FActive := true;
            

          if novo then begin
              Log(nil, [lcInfo], 'Iniciado em '+formatDateTime('dddd" "dd" de "mmmm" de "yyyy" às "hh:mm',now)); // do not localize
              //Log(nil, [lcInfo], 'UTC '+ GUTC.TimeZoneInformation.BiasAsString + ' ' + formatDateTime('hh:nn:ss.z',GUTC.GMTdateTime));
              //Log(nil, [lcInfo], GUTC.IsDayLightAsString);
              //Log(nil, [lcInfo], GUTC.TimeZoneInformation.StandardName + ' ' +
              //                   GUTC.TimeZoneInformation.StandardDateBiasAsString + ' ' +
              //                   formatDateTime('dd/mm hh:nn:ss.z',GUTC.TimeZoneInformation.StandardDate));
              //Log(nil, [lcInfo], GUTC.TimeZoneInformation.DayLightName + ' ' +
              //                   GUTC.TimeZoneInformation.DayLightDateBiasAsString + ' ' +
              //                   formatDateTime('dd/mm hh:nn:ss.z',GUTC.TimeZoneInformation.DayLightDate));


              if GLog = nil then
                 GLog := Self;

              //counter := FLinesBeforeOpen.Count;
              if FLinesBeforeOpen.Count>0 then
                  for I := 0 to FLinesBeforeOpen.Count - 1 do
                      _LogBeforeOpen(nil, FLinesBeforeOpen[i].Cats, FLinesBeforeOpen[i].Msg);
          end;
     except
     end;
     csLog.Release;

end;

procedure TLog.CloseLogFile;
var
     logStr : string;
begin
     if csLog=nil then exit;
     csLog.Acquire;
     try
        try
            inc(counter);
            if counter=10000000 then counter:=0;
            if (FLogToFile) and (FLogFileOpen) then begin
               logStr := formatfloat('0000000', counter) + char(LogSeparator) + // do not localize
                         formatdatetime('hh:nn:ss.zzz',now) + char(LogSeparator) + // do not localize
                         '000000 Info......' + char(LogSeparator) + // do not localize
                          copy ( dupeString('.',25), 1, 25) + char(LogSeparator) +
                         'LogFile Closed ---- ' ; // do not localize
               if not FForcing then
                  writeln( FLogFile , logStr );
               closefile( FLogFile);
               FLogFileOpen :=false;
               FActive := false;
            end;
        except
            on e: exception do
                showmessage('CloseLogFile: '+e.Message); // do not localize
        end;
    finally
       csLog.Release;
    end;

end;

procedure TLog.ReiniciarLogFile;
begin
     Log(nil, [lcInfo], 'Fechando Log para Reiniciar programaticamente.'); // do not localize
     CloseLogFile;
     FLogFileName := '';
     OpenLogFile;
     Log(nil, [lcInfo], 'Log Reiniciado programaticamente.'); // do not localize
end;

constructor  TLog.Create(AOwner: TComponent);
begin
     inherited;
     FCustomCategories := TStringList.create;
     FCustomCategoriesIncluidas := TStringList.create;
     FCustomCategoriesIncluidas.Duplicates := dupIgnore;
     FCustomCategoriesExcluidas := TStringList.create;
     FCustomCategoriesExcluidas.Duplicates := dupIgnore;
     FLinesBeforeOpen :=TLogMsgList.create;
     SetLogCategories(defLogCategoriesStr);
     SetLogDirPath(ExtractFilePath(ParamStr(0)));
     counter := 1;
     
     csLog.Acquire;
     try
         if (GLog<>nil) then begin
             if (GLog.FCloneMe) then begin
                 FLinesBeforeOpen.CopyFrom(GLog.FLinesBeforeOpen);
                 GLog.Free;
                 GLog := Self;
                 GLog.FCloneMe := false;
             end
         end else begin
             FLogCategoriesIncluidas := [lcAll];
             FCloneMe := true;
         end;
     finally
        csLog.Release;
     end;
end;

destructor  TLog.destroy;
begin
     if GLog=Self then begin
         csLog.Acquire;
         try
            GLog := nil;
         finally
            csLog.Release;
         end;
         exit;
     end;
     CloseLogFile;
     FLinesBeforeOpen.Free;
     FCustomCategories.Free;
     FCustomCategoriesIncluidas.Free;
     FCustomCategoriesExcluidas.Free;
     inherited Destroy;
end;

function TLog.LogCategories2Str(lc : TSetOfTLogCategory): string;
var
      i:integer;
begin
     result := '';
     for i:=1 to kMaxLogCategoryStr do
         if TLogCategory(i-1) in lc then
             result := result  + LogCategoryStr[i] + ', ';
     if length(result)>0 then
        Setlength(result, length(result)-2);
end;


function  TLog.AddCategory(alcName:string):integer;
begin
    result := FCustomCategories.add(alcName);
    log(self,[lcInfo],'Categoria adicionada: '+alcName); // do not localize
end;

procedure TLog.ClasificarLogCategories(lc : TSetOfTLogCategory; operacao:char);
begin
    if operacao='+' then
       FLogCategoriesIncluidas := FLogCategoriesIncluidas + lc;
    if operacao='-' then
       FLogCategoriesExcluidas := FLogCategoriesExcluidas + lc;
end;

procedure TLog.ClasificarLogCategories(lc : string; operacao:char);
begin
    if operacao='+' then
       FCustomCategoriesIncluidas.Add(lc);
    if operacao='-' then
       FCustomCategoriesExcluidas.Add(lc);
end;

procedure TLog.str2LogCategories(lcs : string);
var
     lcsl : TStringList;
     i,j : integer;
     operacao:char;
begin
      csLog.Acquire;
      try
         FLogCategoriesIncluidas := [];
         FLogCategoriesExcluidas := [];
         if (lcs = '[]') or (lcs='') then
            lcs := 'lcExcept'; // do not localize
         if length(lcs)>1 then begin
            if lcs[1]='[' then
               lcs := copy (lcs,2,maxint);
            if lcs[length(lcs)]=']' then
               lcs := copy (lcs,1,length(lcs)-1);
         end;

         lcsl := TStringList.create;
         try
            lcsl.commatext := lcs;
            for i:=0 to lcsl.count-1 do begin
                lcsl[i] := trim(lcsl[i]);
                if length(lcsl[i])=0 then continue;
                operacao := '+';
                if lcsl[i][1]='-' then operacao := '-'
                else if lcsl[i][1]<>'+' then
                     lcsl[i] := '+' + lcsl[i];

                if comparetext(lcsl[i], operacao + 'lcAll')=0 then // do not localize
                   ClasificarLogCategories( [lcAll], '+' );
                if comparetext(lcsl[i], operacao + 'lcExcept')=0 then // do not localize
                   ClasificarLogCategories( [lcExcept], operacao );
                if comparetext(lcsl[i], operacao + 'lcInfo')=0 then // do not localize
                   ClasificarLogCategories( [lcInfo], operacao );
                if comparetext(lcsl[i], operacao + 'lcTrace')=0 then // do not localize
                   ClasificarLogCategories( [lcTrace], operacao );
                if comparetext(lcsl[i], operacao + 'lcMsgs')=0 then // do not localize
                   ClasificarLogCategories( [lcMsgs], operacao );
                if comparetext(lcsl[i], operacao + 'lcDebug')=0 then // do not localize
                   ClasificarLogCategories( [lcDebug], operacao );
                if comparetext(lcsl[i], operacao + 'lcDBReplication')=0 then // do not localize
                   ClasificarLogCategories( [lcDBReplication], operacao );
                if comparetext(lcsl[i], operacao + 'lcDBIntegrity')=0 then // do not localize
                   ClasificarLogCategories( [lcDBIntegrity], operacao );
                if comparetext(lcsl[i], operacao + 'lcSeguranca')=0 then // do not localize
                   ClasificarLogCategories( [lcSeguranca], operacao );
                if comparetext(lcsl[i], operacao + 'lcNivel1')=0 then // do not localize
                   ClasificarLogCategories( [lcNivel1], operacao );
                if comparetext(lcsl[i], operacao + 'lcNivel2')=0 then // do not localize
                   ClasificarLogCategories( [lcNivel2], operacao );
                if comparetext(lcsl[i], operacao + 'lcNivel3')=0 then // do not localize
                   ClasificarLogCategories( [lcNivel3], operacao );
                if comparetext(lcsl[i], operacao + 'lcFrm2Xlate')=0 then // do not localize
                   ClasificarLogCategories( [lcFrm2Xlate], operacao );
                if comparetext(lcsl[i], operacao + 'lcXlateDetail')=0 then // do not localize
                   ClasificarLogCategories( [lcXlateDetail], operacao );
                if comparetext(lcsl[i], operacao + 'lcXNoSuppor')=0 then // do not localize
                   ClasificarLogCategories( [lcXNoSuppor], operacao );
                if comparetext(lcsl[i], operacao + 'lcXNoTrnslt')=0 then // do not localize
                   ClasificarLogCategories( [lcXNoTrnslt], operacao );
                if comparetext(lcsl[i], operacao + 'lcXlate')=0 then // do not localize
                   ClasificarLogCategories( [lcXlate], operacao );
                if comparetext(lcsl[i], operacao + 'lcHTTP_req')=0 then // do not localize
                   ClasificarLogCategories( [lcHTTP_req], operacao );

                for j:=0 to FCustomCategories.Count-1 do
                    if comparetext(lcsl[i], operacao + FCustomCategories[j])=0 then
                        ClasificarLogCategories( FCustomCategories[j], operacao );
           end;

            if not(lcAll in FLogCategoriesIncluidas) then begin
                 ClasificarLogCategories( [lcExcept], '+' );
                 ClasificarLogCategories( [lcInfo], '+' );
            end;

            FLogCategoriesStr := lcsl.CommaText;

         finally
            lcsl.free;
         end;

     finally
        csLog.Release;
     end;

end;

procedure TLog._LogBeforeOpen(Sender: TObject; aLogCategories: TSetOfTLogCategory; s: string);
var
      CategoriasValidas : TSetOfTLogCategory;
begin
      if csLog=nil then exit;
      csLog.Acquire;
      try
          CategoriasValidas := (FLogCategoriesIncluidas - FLogCategoriesExcluidas);
          if  ((aLogCategories * CategoriasValidas) <> [] ) or
               (lcAll in FLogCategoriesIncluidas)
          then begin
              if counter=10000000 then counter:=0;
              inc(counter);

              if FLogFileOpen then begin
                  writeln( FLogFile , formatfloat('0000000', counter) + char(LogSeparator) + s ); // do not localize
                  FNothingToForce := false;

                  // Forcar write pra estas categorias
                  if (aLogCategories * [lcExcept])<>[]
                      {(LogCategory=lcExcept)or(LogCategory=lcLicencas)} then begin
                      FNothingToForce := true;
                      closefile( FLogFile);
                      assignfile( FLogFile, FLogFileName );
                      append(FLogFile);
                  end;
              end;
          end;
      finally
         csLog.Release;
      end;
end;

procedure TLog.LoadParamsFromIni(aFilename: String);
begin

end;

procedure TLog.ForceLog(Sender: TObject; aLogCategories: TSetOfTLogCategory;  s: string );
var
    abriu : boolean;
    aLogToFile : boolean;
begin
    if csLog=nil then exit;
    csLog.Acquire;
    try
        abriu := false;
        FForcing := true;
        aLogToFile := FLogToFile;
        try
            if not FLogFileOpen then begin
                abriu := true;
                FLogToFile := true;
                FLogCategoriesIncluidas :=  FLogCategoriesIncluidas + aLogCategories;
                OpenLogFile;
            end;
            Log(Sender, aLogCategories,  s );
        finally
             if abriu then
               CloseLogFile;
             FForcing := false;
        end;
        FLogToFile := aLogToFile;
    finally
        csLog.Release;
    end;
end;

procedure TLog.Log(Sender: TObject; sCustomLogCategory: string;  s: string );
begin
    _Log(Sender,[],sCustomLogCategory, s);
end;

procedure TLog.Log(Sender: TObject; aLogCategories: TSetOfTLogCategory;  s: string );
begin
    _Log(Sender,aLogCategories,'', s);
end;

procedure TLog.LogCriticalException(Sender: TObject; aCodigo:integer; e: exception;
  const s: string);
var
  ss : string;
begin
    if aCodigo>0 then
       ss := ss+' '+StringErro(aCodigo)+' ';

    ss := ss+' -> '+e.Message+' ';
    if s>'' then ss := ss+' ('+s+')';

    if not FLogFileOpen then
        OpenLogFile;
    _Log(Sender,[lcExcept],'', trim(ss));
end;


procedure TLog._Log(Sender: TObject; aLogCategories: TSetOfTLogCategory; sCustomLogCategory: string;  s: string );
var
      I, J : Integer;
      D : TDateTime;
      logStr, linea : string;
      CategoriasValidas : TSetOfTLogCategory;
      firstCat, lc : TLogCategory;
      classN, CatN: string;
      imprimir : boolean;
      slCustomLogCategory :TStringList;
begin
      if csLog=nil then exit;
      csLog.Acquire;
      firstCat := lcNone;
      slCustomLogCategory := TStringList.Create;
      slCustomLogCategory.CommaText := sCustomLogCategory;
      try
          // -------------------------------------------------------------------

          D := Now;
          if S>'' then begin
            with DebugClients.LockList do
            try
              for I := 0 to Count - 1 do
                PostMessage(HWND(Items[I]), WM_NEWDEBUGMSG, Integer(TDebugMsg.Create(S, D)), 0);
            finally
              DebugClients.UnlockList;
            end;

            //S := FormatDateTime('dd/mm/yyyy hh:mm:ss - ', D)+S;
          end;

          // -------------------------------------------------------------------

          linea := s;
          CategoriasValidas := (FLogCategoriesIncluidas - FLogCategoriesExcluidas);
          imprimir := false;
          if sCustomLogCategory='' then
              imprimir :=
                   ((aLogCategories * CategoriasValidas) <> [] ) or
                   ((lcAll in FLogCategoriesIncluidas) and ((aLogCategories * FLogCategoriesExcluidas) = []))
          else
          for j:=0 to slCustomLogCategory.Count-1 do begin
              if FCustomCategories.IndexOf(slCustomLogCategory[j])>-1 then
                  if (lcAll in FLogCategoriesIncluidas) then
                      imprimir := (FCustomCategoriesExcluidas.IndexOf(slCustomLogCategory[j])=-1)
                  else
                      imprimir := imprimir or (
                        (FCustomCategoriesIncluidas.IndexOf(slCustomLogCategory[j])>-1) and
                        (FCustomCategoriesExcluidas.IndexOf(slCustomLogCategory[j])=-1)
                      );
          end;

          if imprimir then begin
              if Sender<>nil then
                 classN := Sender.ClassName
              else
                 classN := '';
              for lc in aLogCategories do begin
                  firstCat := lc;
                  break;
              end;

              if FLogFileOpen then begin
                  inc(counter);
                  if counter=10000000 then counter:=0;
              end;
              
              if (length(linea)>2) and ( copy(linea, length(linea)-1, 2 ) = #13#10 ) then
                    Setlength(linea, length(linea) -1 );
              if aLogCategories = [lcExcept] then
                 linea := '(EXCEPTION) '+ linea; // do not localize

              if sCustomLogCategory='' then
                  CatN := LogCategoryDisplayStr[integer(firstCat)+1]
              else
              if slCustomLogCategory.count>0 then begin
                  CatN := slCustomLogCategory[0];
                  if sametext(copy(CatN, 1, 2),'lc') then // do not localize
                     CatN := trim(copy(CatN,3,maxint));
              end;

              logStr := formatdatetime('hh:nn:ss.zzz',now) + char(LogSeparator) + // do not localize
                        GetThreadId(Sender) + char(LogSeparator) +
                        copy ( CatN + dupeString('.',10), 1, 10) + char(LogSeparator) +
                        copy ( classN + dupeString('.',25), 1, 25) + char(LogSeparator);

              if FLogFileOpen then begin
                  writeln( FLogFile , formatfloat('0000000', counter) + char(LogSeparator) + // do not localize
                                      logStr +
                                      encolumnar(linea, 65) );

                  FNothingToForce := false;

                  // Forcar write pra estas categorias
                  if (aLogCategories * [lcExcept])<>[]
                      {(LogCategory=lcExcept)or(LogCategory=lcLicencas)} then begin
                      FNothingToForce := true;
                      closefile( FLogFile);
                      assignfile( FLogFile, FLogFileName );
                      append(FLogFile);
                  end;

                  flush( FLogFile );
              end else
                  FLinesBeforeOpen.add(aLogCategories, logStr + encolumnar(linea, 65));
          end;
      finally
         csLog.Release;
         slCustomLogCategory.free;
      end;
end;

function  TLog.GetThreadID(Sender:TObject):string;
begin
      //result := '00000';
      if GetCurrentThreadID <> MainThreadID then
          result := formatfloat('000000', GetCurrentThreadID and $FFFFF) // do not localize
      else
          result := 'main.t'; //'.' + formatfloat('00000', GetCurrentThreadID and $FFFF) // do not localize
end;


procedure TLog.ForceLogWrite;
begin
      if csLog=nil then exit;
      csLog.Acquire;
      try
          if not FActive then exit;
          if FNothingToForce then exit;
          if FLogToFile and FLogFileOpen then
              try
                 Flush(FLogFile);
                 //closefile( FLogFile);
                 FNothingToForce := true;
                 //assignfile( FLogFile, FLogFileName );
                 //append(FLogFile);
              except
                  on e: exception do
                      showmessage('ForceLogWrite: '+e.Message); // do not localize
              end;
      finally
         csLog.Release;
      end;

end;

// -----------------------------------------------------------------------------

destructor TLogMsgList.Destroy;
begin
    Clear;
    inherited;
end;

function  TLogMsgList.Get(Index: Integer): TLogMsg;
begin
    result := TLogMsg( inherited Get(Index));
end;

procedure TLogMsgList.Put(Index: Integer; Item: TLogMsg);
begin
    inherited Put(Index, Item);
end;

procedure TLogMsgList.Clear;
var
    i : integer;
begin
    for i:=count-1 downto 0 do begin
        TLogMsg(items[i]).Free;
        delete(i);
    end;
end;

function TLogMsgList.add(aCats:TSetOfTLogCategory; aMsg  : String): Integer;
var
     mLogMsg : TLogMsg;
begin
     mLogMsg := TLogMsg.create;
     mLogMsg.Cats := aCats;
     mLogMsg.Msg  := aMsg;
     result := inherited add (mLogMsg);
end;

procedure  TLogMsgList.CopyFrom(aSource:TLogMsgList);
var
    i : integer;
begin
    Clear;
    for i:=0 to aSource.count-1 do
        add( aSource[i].Cats, aSource[i].msg );
end;

// -----------------------------------------------------------------------------

constructor TDebugMsg.Create(aMsg: String; aTime: TDateTime);
begin
  dmMsg := aMsg;
  dmTime := aTime;
end;

function TDebugMsg.GetClassName: String;
begin
  Result := Copy(dmMsg, 1, Pos('.', dmMsg)-1);
end;


initialization
     DebugClients := TThreadList.Create;
     csLog   := TCriticalSection.Create;
     GLog := TLog.create(nil);
     GLogDirPath := '.\logs\'; // do not localize
     GLog.LoadConfig;
     GLog.OpenLogFile;

finalization
     GLog.free;
     FreeAndNil(csLog);
     DebugClients.Free;


end.


