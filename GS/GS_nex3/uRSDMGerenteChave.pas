unit uRSDMGerenteChave;

interface

uses
  SysUtils, Classes, SyncObjs, nxsdServerEngine, nxreRemoteServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, DB, nxdb,
  nxllComponent;

type
  TdmGerente = class(TDataModule)
    nxSession: TnxSession;
    nxDB: TnxDatabase;
    tChave: TnxTable;
    tChaveID: TAutoIncField;
    tChaveLoja: TIntegerField;
    tChaveChave: TStringField;
    tChaveVencimento: TDateField;
    tChaveCodigoEquip: TStringField;
    tChaveMaquinas: TWordField;
    tChaveTipo: TWordField;
    tChaveCriadaEm: TDateTimeField;
    tChaveCriadaPor: TStringField;
    tChaveStatus: TWordField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TdmPoolGerente = class
  private
    FCS    : TCriticalSection;
    FInUse : TList;
    FFree  : TList;
    FTCP   : TnxWinsockTransport;
    FRSE   : TnxRemoteServerEngine;
  public
    constructor Create; 
    destructor Destroy; override;
  
    function AcquireDM: TdmGerente;
    procedure ReleaseDM(const aDM: TdmGerente);
  end;

var
  dmGerente: TdmGerente;
  dmServerIP: String;

implementation

uses uRSServBD;

{$R *.dfm}

{ TdmPoolGerente }

function TdmPoolGerente.AcquireDM: TdmGerente;
begin
  FCS.Enter;
  try
    Result := nil;
    if FFree.Count>0 then begin
      Result := TdmGerente(FFree[0]);
      FFree.Delete(0);
    end else begin
      Result := TdmGerente.Create(nil);
      Result.nxSession.ServerEngine := FRSE;
      Result.tChave.Open;
    end;
      
    FInUse.Add(Result);
  finally
    FCS.Leave;
  end;
end;

constructor TdmPoolGerente.Create;
begin
  FInUse := TList.Create;
  FFree  := TList.Create;
  FCS    := TCriticalSection.Create;
  FTCP   := TnxWinsockTransport.Create(nil);
  FRSE   := TnxRemoteServerEngine.Create(nil);
  FTCP.ServerName := dmServerIP;
  FTCP.Active := True;
  FRSE.Transport := FTCP;
  FRSE.Active := True;
end;

destructor TdmPoolGerente.Destroy;
var I : Integer;
begin
  FCS.Enter;
  try
    while FFree.Count>0 do begin
      try
        TObject(FFree[0]).Free;
      except
      end;
      FFree.Delete(0);
    end;
      
  finally
    FCS.Leave;
  end;
  FreeAndNil(FCS);
  FreeAndNil(FFree);
  FreeAndNil(FInUse);
  inherited;
end;

procedure TdmPoolGerente.ReleaseDM(const aDM: TdmGerente);
begin
  try
    FCS.Enter;
    try
      FFree.Add(aDM);
      FInUse.Remove(aDM);
    finally
      FCS.Leave;
    end;
  except
    aDM.Free;
  end;
end;

end.
