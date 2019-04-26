unit ncgDMArqsPrint;

interface


uses
  SysUtils, Classes, LMDCustomComponent, LMDBaseController, LMDCustomContainer,
  LMDGenericList;

Const
  kNovaPDFOEM7arqsIndex = 0;
  kAfterPrintArqsIndex = 1;

type
  TdmArqsPrint = class(TDataModule)
    Arqs: TLMDGenericList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TSalvaArqsPrintThread = class(TThread)
  private
    procedure gravaVersion;
  protected
    procedure Execute; override;
  public
   constructor Create; reintroduce;
  end;


var
  dmArqsPrint: TdmArqsPrint;

implementation
  uses
     ncgPrintInstall, uLogs, uCommonProc, uVersionInfo, ncgFrmPri, ncPrintConsts;

{$R *.dfm}

{ TSalvaArqsPrintThread }

constructor TSalvaArqsPrintThread.Create;
begin
  inherited create(false);

end;

procedure TSalvaArqsPrintThread.Execute;
var
    aVersion : string;
    desinstalar : boolean;
begin
    try
        aVersion := slConfig.Values[kNovaPDFOEM7iniName];
       {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'versao Nova '+aVersion);{$ENDIF}

        RemovePrinters(false);
        {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'RemovePrinters');{$ENDIF}

        desinstalar := not fileexists(kNovaPDFOEM7printerSetupFileName);

        if NexPrinterInstalled then begin
            // checar versao
            desinstalar := not fileexists(kNovaPDFOEM7printerSetupFileName);
            if not desinstalar then 
              desinstalar := aVersion<>kNovaPDFOEM7printerSetupVersion;
        end;

        if not isServiceStarted('','Spooler') then begin
            {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'Start Spooler');{$ENDIF}
            ServiceStart('','Spooler');
            {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'Spooler Started');{$ENDIF}
        end;

        if desinstalar then begin
            {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'Desinstalar '+kNovaPDFOEM7printerSetupFileName);{$ENDIF}
            RemovePrinters(true);
            if isServiceStarted('','Spooler') then begin
                {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'Stop Spooler');{$ENDIF}
                ServiceStop('','Spooler');
                {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'Spooler Stop');{$ENDIF}
                {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'Start Spooler');{$ENDIF}
                ServiceStart('','Spooler');
                {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'Spooler Started');{$ENDIF}
            end;

        end;
    
        if not NexPrinterInstalled then begin
                //gravar no disco
                dmArqsPrint.Arqs.Items[kNovaPDFOEM7arqsIndex].SaveToFile(kNovaPDFOEM7printerSetupFileName);

                InstallNexPrinter(false);
                {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'InstallNexPrinter');{$ENDIF}

                Synchronize(gravaVersion);

                {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'Stop Spooler');{$ENDIF}
                ServiceStop('','Spooler');
                {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'Spooler Stop');{$ENDIF}


                {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'Start Spooler');{$ENDIF}
                ServiceStart('','Spooler');
                {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'Spooler Started');{$ENDIF}

        end;
    except
       on e:exception do begin
           {$IFNDEF NOLOG} GLog.Log(nil,[lcExcept],'Execute: '+e.message);{$ENDIF}
       end;
    end;

    dmArqsPrint.Arqs.Items[kAfterPrintArqsIndex].SaveToFile(kAfterPrintFileName);
    
end;

procedure TSalvaArqsPrintThread.gravaVersion;
begin
    slConfig.Values[kNovaPDFOEM7iniName] := kNovaPDFOEM7printerSetupVersion;
    slConfig.SaveToFile(Glog.Prefixo+'.ini');
    {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'gravaVersionNova '+kNovaPDFOEM7printerSetupVersion);{$ENDIF}
end;

end.
