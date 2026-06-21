unit cmCompClienteBD;

interface

uses
  Classes,
  SysUtils,
  WinProcs,
  Messages,
  Windows,
  cmErros,
  cmMsgCom,
  ClasseCS,
  cmCompCliente,
  cmServBD,
  Db, 
  nxsdServerEngine,
  nxtwWinsockTransport,
  nxdb, 
  nxllConst, 
  nxllTypes;

type  

  TClienteCyberMgrBD = class ( TClienteCyberMgr )
  private
    FServerEng : TnxBaseServerEngine;
    FTransp    : TnxWinsockTransport;
  protected
    procedure Ativou; override;
    procedure Desativou; override;  
  public
    constructor Create(AOwner: TComponent); override;
    property ServidorBD: TnxBaseServerEngine
      read FServerEng;
  end;

  procedure Register;
  
implementation

uses cmServBase, cmServRemoto, nxreRemoteServerEngine;

{ TClienteCyberMgrFF }

procedure TClienteCyberMgrBD.Ativou;
begin
  if Servidor is TCMServidor then
    FServerEng := dmServidorBD.ServerEngine
  else begin
    FTransp := TnxWinsockTransport.Create(Self);
    FTransp.ServerName := TCMServidorRemoto(Servidor).Host;
    FTransp.Enabled := True;
    FServerEng := TnxRemoteServerEngine.Create(Self);
    TnxRemoteServerEngine(FServerEng).Transport := FTransp;
  end;  
  inherited;
end;

constructor TClienteCyberMgrBD.Create(AOwner: TComponent);
begin
  inherited;
  FServerEng := nil;
  FTransp := nil;
end;

procedure TClienteCyberMgrBD.Desativou;
begin
  inherited;
  if FTransp=nil then 
    FServerEng := nil
  else begin
    FreeAndNil(FServerEng);
    FreeAndNil(FTransp);
  end;    
end;

procedure Register;
begin
  RegisterComponents('CyberMgr', [TClienteCyberMgrBD]);
end;


end.
