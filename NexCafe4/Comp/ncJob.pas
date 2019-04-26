unit ncJob;

interface

uses
  SysUtils,
  DB,
  MD5,
  Dialogs,
  Classes,
  Windows,
  ClasseCS,
  ncClassesBase;

type
  TncJob = class ( TncClasse )
  private
    FPrinterIndex : Integer;   // index of printer in Printer.Printers
    FPrinterName  : String ;   // printers devicename
    FPrinterPort  : String ;   // printers port name
    FPrinterServer: String;   // server name in case of network printer
    FPrinterShare : String;    // share name in case of a network printer
    FComputer     : String;    // computer that originated the job
    FUser         : String;    // user that originated the job
    FDocument     : String;    // jobs document name
    FPages        : Integer;   // pages printed so far
    FClientPages  : Integer;   // paginas detectadas via NexGuard
    FTotalPages   : Integer;   // total pages in job
    FJobID        : Cardinal;  // the ID of the job
    FStatus       : Byte;      // the jobs status
    FCopies       : Cardinal;  // number of copies requested for job
    FPrtHandle    : THandle;
    FMaquina      : Word;
    FLiberacao    : Byte;      // 0=Pendente, 1=Imprimir, 2=Cancelar
    FPausou       : Boolean;
    FSpooling     : Boolean;
    FImpID        : Cardinal;
    FJobCliID     : Cardinal;
    FStatusPaused : Boolean;
    FImpDia       : Cardinal;
    FImpMes       : Cardinal;
    FMaxImpDia    : Cardinal;
    FMaxImpMes    : Cardinal;
    FCotasProc    : Boolean;
    FCotasLoaded  : Boolean;
    FDataHora     : TDateTime;
    
//    FBytesPrinted : Integer;
  
    function GetChave: Variant; override;
  public
    function Clone: TncJob;
    constructor Create;  
    function TipoClasse: Integer; override;

    function PaginasReg: Integer;

    function ControlarCotas: Boolean;

    function PassouCota: Integer;
    
    function AguardaConf: Boolean;

    property StatusPaused: Boolean
      read FStatusPaused write FStatusPaused;
      
  published
    property PrinterIndex: Integer
      read FPrinterIndex write FPrinterIndex;
      
    property PrinterName: String
      read FPrinterName write FPrinterName;
      
    property PrinterPort: String
      read FPrinterPort write FPrinterPort;
      
    property PrinterServer: String
      read FPrinterServer write FPrinterServer;
      
    property PrinterShare: String
      read FPrinterShare write FPrinterShare;
      
    property Computer: String
      read FComputer write FComputer;
      
    property User: String
      read FUser write FUser;
      
    property Document: String
      read FDocument write FDocument;

{    property BytesPrinted: Integer
      read FBytesPrinted write FBytesPrinted;  }
      
    property Pages: Integer
      read FPages write FPages;

    property TotalPages: Integer
      read FTotalPages write FTotalPages;
      
    property ClientPages: Integer
      read FClientPages write FClientPages; 
       
    property JobID: Cardinal
      read FJobID write FJobId;

    property JobCliID: Cardinal
      read FJobCliID write FJobCliID;  
      
    property Status: Byte
      read FStatus write FStatus;
      
    property Copies: Cardinal
      read FCopies write FCopies;
      
    property PrtHandle: Cardinal
      read FPrtHandle write FPrtHandle;
      
    property Maquina: Word
      read FMaquina write FMaquina;
      
    property Liberacao: Byte
      read FLiberacao write FLiberacao;

    property ImpID: Cardinal
      read FImpID write FImpID;  

    property Pausou: Boolean
      read FPausou write FPausou;  

    property Spooling: Boolean
      read FSpooling write FSpooling;  

    property ImpDia: Cardinal
      read FImpDia write FImpDia;

    property ImpMes: Cardinal
      read FImpMes write FImpMes;

    property MaxImpDia: Cardinal
      read FMaxImpDia write FMaxImpDia;

    property MaxImpMes: Cardinal
      read FMaxImpMes write FMaxImpMes;

    property CotasProc: Boolean
      read FCotasProc Write FCotasProc;  

    property CotasLoaded: Boolean
      read FCotasLoaded write FCotasLoaded; 

    property DataHora: TDateTime
      read FDataHora write FDataHora;   
  end;

  TncJobs = class ( TListaClasseCS ) 
  private
    function GetJob(I: Integer): TncJob;
    function GetPorJobID(aPrinterIndex: Integer; aJobID: Cardinal): TncJob;
    function GetPorMaquina(aMaq: Word; aLiberacao: Integer): TncJob;
  public
    function JobPendMaq(aMaq: Word; aSoDentroCota: Boolean): TncJob;
    function PrinterIndexByComputer(aComputer: String): Integer;
    function JobMaqCliID(aMaq: Word; aJobCliID: Cardinal): TncJob;
    
    property Itens[I: Integer]: TncJob
      read GetJob; default;

    property PorJobID[aPrinterIndex: Integer; aJobID: Cardinal]: TncJob
      read GetPorJobID;

    property PorMaquina[aMaq: Word; aLiberacao: Integer]: TncJob
      read GetPorMaquina;
  end;
  

const
   jsNone       = 0;
   jsNew        = 1;
   jsProcessing = 2;
   jsPaused     = 3;
   jsResumed    = 4;
   jsAborted    = 5;
   jsCompleted  = 6;
   jsError      = 7;
   jsPrinting   = 8;
   jsDeleted    = 9;

   jlNaoPausou  = 0;
   jlPendente   = 1;
   jlImprimir   = 2;
   jlCancelar   = 3;
    
implementation

{ TncJob }

function TncJob.AguardaConf: Boolean;
begin
  Result := (not FSpooling) and (FLiberacao=jlPendente);
end;

function TncJob.Clone: TncJob;
begin
  Result := TncJob.Create;
  Result.FPrinterIndex := FPrinterIndex;
  Result.FPrinterName  := FPrinterName;
  Result.FPrinterPort  := FPrinterPort;
  Result.FPrinterServer:= FPrinterServer;
  Result.FPrinterShare := FPrinterShare;
  Result.FComputer     := FComputer;
  Result.FUser         := FUser;
  Result.FDocument     := FDocument;
  Result.FPages        := FPages;
  Result.FTotalPages   := FTotalPages;
  Result.FClientPages  := FClientPages;
  Result.FJobID        := FJobID;
  Result.FJobCliID     := FJobCliID;
  Result.FStatus       := FStatus;
  Result.FCopies       := FCopies;
  Result.FPrtHandle    := FPrtHandle;
  Result.FMaquina      := FMaquina;
  Result.FLiberacao    := FLiberacao;
  Result.FImpID        := FImpID;
  Result.FPausou       := FPausou;
  Result.FSpooling     := FSpooling;
  Result.FStatusPaused := FStatusPaused;
  Result.FMaxImpDia    := FMaxImpDia;
  Result.FmaxImpMes    := FMaxImpMes;
  Result.FImpDia       := FImpDia;
  Result.FImpMes       := FImpMes;
  Result.FCotasProc      := FCotasProc;
  Result.FCotasLoaded  := FCotasLoaded;
  Result.FDataHora     := FDataHora;
//  Result.FBytesPrinted := FBytesPrinted;
end;

function TncJob.ControlarCotas: Boolean;
begin
  Result := gConfig.PMPausaAutomatica and gConfig.PMCotas and (FMaquina>0) and FCotasLoaded and
            ((FMaxImpDia>0) or (FMaxImpMes>0));
end;

constructor TncJob.Create;
begin
  inherited;
  FDataHora     := Now;
  FPrinterIndex := -1;
  FPrinterName  := '';
  FPrinterPort  := '';
  FPrinterServer:= '';
  FSpooling     := True;
  FPrinterShare := '';
  FComputer     := '';
  FUser         := '';
  FDocument     := '';
  FClientPages  := 0;
  FTotalPages   := 0;
  FJobID        := 0;
  FJobCliID     := 0;
  FStatus       := jsNone;
  FStatusPaused := False;
  FCopies       := 0;
  FPrtHandle    := 0;
  FMaquina      := 0;
  FLiberacao    := 0;
  FImpID        := 0;
  FMaxImpDia    := 0;
  FMaxImpMes    := 0;
  FImpDia       := 0;
  FImpMes       := 0;
  
//  FBytesPrinted := 0;
  FPausou       := False;
  FCotasProc      := False;
  FCotasLoaded  := False;
end;

function TncJob.GetChave: Variant;
begin
  Result := IntToStr(FPrinterIndex)+'#'+IntToStr(FJobID);
end;

function TncJob.PaginasReg: Integer;
begin
  if FClientPages>0 then
    Result := FClientPages
  else
  if FPages>0 then begin
    if FCopies>0 then
      Result := FCopies * FPages else
      Result := FPages;
  end else begin
    if FCopies>0 then
      Result := FCopies * FTotalPages else
      Result := FTotalPages;
  end;
end;

function TncJob.PassouCota: Integer;
var r2: integer;
begin
  Result := 0;
  if FMaxImpDia>0 then
    Result := (FImpDia+PaginasReg)-FMaxImpDia;

  r2 := 0;
  if FMaxImpMes>0 then
    r2 := (FImpMes+PaginasReg)-FMaxImpMes;

  if r2>result then
    Result := r2; 
end;

function TncJob.TipoClasse: Integer;
begin
  Result := tcJob;
end;

{ TncJobs }

function TncJobs.GetJob(I: Integer): TncJob;
begin
  Result := TncJob(GetItem(I));
end;

function TncJobs.GetPorJobID(aPrinterIndex: Integer; aJobID: Cardinal): TncJob;
var I : Integer;
begin
  for I := 0 to Count - 1 do with Itens[i] do 
    if (PrinterIndex=aPrinterIndex) and (JobID=aJobID) then begin
      Result := Itens[I];
      Exit;
    end;
  Result := nil;  
end;

function TncJobs.GetPorMaquina(aMaq: Word; aLiberacao: Integer): TncJob;
var I : Integer;
begin
  for I := 0 to Count - 1 do with Itens[i] do 
    if (Maquina=aMaq) and ((aLiberacao=-1) or (Liberacao=aLiberacao)) then begin
      Result := Itens[I];
      Exit;
    end;
  Result := nil;  
end;

function TncJobs.JobMaqCliID(aMaq: Word; aJobCliID: Cardinal): TncJob;
var I : Integer;
begin
  for I := 0 to Count-1 do with Itens[I] do 
    if (FMaquina=aMaq) and (JobCliID=aJobCliID) and (FLiberacao=jlPendente) then begin
      Result := Itens[I];
      Exit;
    end;
  Result := nil;  
end;

function TncJobs.JobPendMaq(aMaq: Word; aSoDentroCota: Boolean): TncJob;
var I : Integer;
begin
  for I := 0 to Count-1 do with Itens[I] do 
    if (FMaquina=aMaq) and (FImpID=0) and (FLiberacao=jlPendente) and (not Spooling) and ((not aSoDentroCota) or (PassouCota<1)) then begin
      Result := Itens[I];
      Exit;
    end;
  Result := nil;  
end;

function TncJobs.PrinterIndexByComputer(aComputer: String): Integer;
var I: integer;
begin
  Result := -1;
  for I := 0 to Count-1 do with Itens[I] do 
    if MesmoComputerName(aComputer, FComputer) then begin
      Result := PrinterIndex;
      Exit;
    end;
end;

end.
