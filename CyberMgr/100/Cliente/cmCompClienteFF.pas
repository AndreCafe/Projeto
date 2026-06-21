unit cmCompClienteFF;

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
  ffdb, 
  ffllprot,
  ffllbase, 
  fflleng, 
  ffllcomp, 
  ffllcomm,
  ffsrintm, 
  ffclreng, 
  fflllgcy;

type  

  TClienteCyberMgrFF = class ( TClienteCyberMgr )
  private
    FServerEng : TffBaseServerEngine;
    FTransp    : TffLegacyTransport;
  protected
    procedure Ativou; override;
    procedure Desativou; override;  
  public
    constructor Create(AOwner: TComponent); override;
    property ServidorFF: TffBaseServerEngine
      read FServerEng;
  end;

  procedure Register;
  
implementation

uses cmServBase, cmServRemoto;

{ TClienteCyberMgrFF }

procedure TClienteCyberMgrFF.Ativou;
begin
  if Servidor is TCMServidor then
    FServerEng := FFServerEng 
  else begin
    FTransp := TffLegacyTransport.Create(Self);
    FTransp.Protocol  := ptTCPIP;
    FTransp.ServerName := TCMServidorRemoto(Servidor).Host;
    FTransp.Enabled := True;
    FServerEng := TffRemoteServerEngine.Create(Self);
    TffRemoteServerEngine(FServerEng).Transport := FTransp;
  end;  
  inherited;
end;

constructor TClienteCyberMgrFF.Create(AOwner: TComponent);
begin
  inherited;
  FServerEng := nil;
  FTransp := nil;
end;

procedure TClienteCyberMgrFF.Desativou;
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
  RegisterComponents('CyberMgr', [TClienteCyberMgrFF]);
end;


end.
