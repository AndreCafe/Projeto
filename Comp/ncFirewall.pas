unit ncFirewall;
{
    ResourceString: Dario 12/03/13
}

interface

uses
  ActiveX, ComObj, ncDebug, SysUtils;

procedure addPortToFirewall(EntryName:string;PortNumber:Cardinal); 
procedure allowexceptionsOnFirewall;
procedure addApplicationToFirewall(EntryName:string;ApplicationPathAndExe:string); 

implementation

Const
  NET_FW_PROFILE_DOMAIN = 0; 
  NET_FW_PROFILE_STANDARD = 1; 
  NET_FW_IP_VERSION_ANY = 2; 
  NET_FW_IP_PROTOCOL_UDP = 17; 
  NET_FW_IP_PROTOCOL_TCP = 6; 
  NET_FW_SCOPE_ALL = 0; 
  NET_FW_SCOPE_LOCAL_SUBNET = 1; 

procedure allowexceptionsOnFirewall;
var 
  fwMgr, fwPolicies:OleVariant; 
begin 
  try
    fwMgr := CreateOLEObject('HNetCfg.FwMgr');  // do not localize
    fwPolicies := fwMgr.LocalPolicy.CurrentProfile;
    fwPolicies.ExceptionsNotAllowed := False;
  except
    on E: Exception do 
      DebugMsg('allowexceptionsOnFirewall - Exception: '+E.Message); // do not localize
  end;
end;

procedure addPortToFirewall(EntryName:string;PortNumber:Cardinal); 
var 
  fwMgr,port:OleVariant; 
  profile:OleVariant; 
begin 
  try
    fwMgr := CreateOLEObject('HNetCfg.FwMgr');  // do not localize
    profile := fwMgr.LocalPolicy.CurrentProfile; 
    port := CreateOLEObject('HNetCfg.FWOpenPort');  // do not localize
    port.Name := EntryName; 
    port.Protocol := NET_FW_IP_PROTOCOL_TCP; 
    port.Port := PortNumber; 
    port.Scope := NET_FW_SCOPE_ALL; 
    port.Enabled := true; 
    profile.GloballyOpenPorts.Add(port);
  except
    on E: Exception do 
      DebugMsg('addPortToFirewall - Exception: ' + E.Message); // do not localize

  end;
end; 

procedure addApplicationToFirewall(EntryName:string;ApplicationPathAndExe:string); 
var 
  fwMgr,app,port:OleVariant; 
  profile:OleVariant; 
begin 
  try
    fwMgr := CreateOLEObject('HNetCfg.FwMgr');  // do not localize
    profile := fwMgr.LocalPolicy.CurrentProfile; 
    app := CreateOLEObject('HNetCfg.FwAuthorizedApplication');  // do not localize
    app.ProcessImageFileName := ApplicationPathAndExe; 
    app.Name := EntryName; 
    app.Scope := NET_FW_SCOPE_ALL; 
    app.IpVersion := NET_FW_IP_VERSION_ANY; 
    app.Enabled :=true; 
    profile.AuthorizedApplications.Add(app);
  except
    on E: Exception do 
      DebugMsg('addApplicationToFirewall - Exception: '+E.Message); // do not localize
  end;
end;


end.

