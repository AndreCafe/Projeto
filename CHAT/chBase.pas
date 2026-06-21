unit chBase;

interface

uses
  Windows,
  SysUtils,
  chTablesDef,
  DB,
  kbmMemTable,
  Classes;

const
  stOffline = 'Off-Line';
  stOnLine  = 'On-Line';  

type  
  TEventoMsg = procedure (Sender: TObject; ANodeID: String; AMsg: String) of object;
  TEventoNode = procedure (Sender: TObject; ANodeID: String) of object; 

  TchLinkEventos = record
    leOwner              : TComponent;
    leOnMsg              : TEventoMsg;
    leOnNodeLogin        : TEventoNode;
    leOnNodeLogout       : TEventoNode;
    leOnNodeMudouStatus  : TEventoNode;
    leOnNodeMudouNome    : TEventoNode;
    leOnLogin            : TNotifyEvent;
    leOnLogout           : TNotifyEvent;
  end;
  PchLinkEventos = ^TchLinkEventos;

  TchNodeInfo = record
    niNome    : String;
    niUsername: String;
    niStatus  : String;
    niTipo    : Integer;
    niIP      : String;
  end;  
          
  TClienteChat = class ( TComponent )
  private
    FContatos           : TkbmMemTable;
    FNodes              : TkbmMemTable;
    FOnMsg              : TEventoMsg;
    FOnNodeLogin        : TEventoNode;
    FOnNodeLogout       : TEventoNode;
    FOnNodeMudouStatus  : TEventoNode;
    FOnNodeMudouNome    : TEventoNode;
    FOnLogin            : TNotifyEvent;
    FOnLogout           : TNotifyEvent;
    FConectado          : Boolean;
    FStatus             : String;
    FNome               : String;
    FUsername           : String;
    FPassword           : String;
    FSerialHD           : String;
    FLinkEventos        : TList;
    procedure SetNodeID(const Value: String);
  protected  
    procedure RecebeuMsg(ANodeID: String; AMsg: String);
    procedure NodeMudouStatus(const ANodeID, AStatus: String);
    procedure NodeMudouNome(const ANodeID, ANome: String);
    procedure NodeLogin(const ANodeID, AUsername, ANome, AStatus, AIP: String; ATipo: Byte);
    procedure NodeLogout(const ANodeID: String);
    function GetNodeID: String; virtual; 
    procedure SetConectado(const Value: Boolean); virtual;
    procedure SetStatus(const Value: String); virtual;
    procedure SetNome(const Value: String); virtual;
    procedure SetPassword(const Value: String); virtual;
    procedure SetUsername(const Value: String); virtual;
    procedure ObtemNodes(MT: TkbmMemTable); virtual; abstract;
    function ObtemContatos: String; virtual; abstract;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function GetNodeInfo(ANodeID: String; var ANodeInfo: TchNodeInfo): Boolean;

    function AddLinkEventos(AOwner: TComponent): PchLinkEventos;
    procedure RemoveLinkEventos(AOwner: TComponent);
    
    function ObtemHistorico(AUsername: String): String; virtual; abstract;
    procedure RefreshContatos; 
    procedure RefreshNodes;
    procedure EnviaMsg(ANodeID: String; AMsg: String); virtual; abstract;

    property Contatos: TkbmMemTable
      read FContatos;

    property Nodes: TkbmMemTable
      read FNodes; 
  published
    property Conectado: Boolean
      read FConectado write SetConectado;
      
    property Username: String read FUsername write SetUsername;
    property Password: String read FPassword write SetPassword;
    property Nome: String read FNome write SetNome;

    property NodeID: String
      read GetNodeID write SetNodeID;
    
    property Status: String
      read FStatus write SetStatus;

    property OnMsg: TEventoMsg
      read FOnMsg write FOnMsg;

    property OnNodeLogin: TEventoNode
      read FOnNodeLogin write FOnNodeLogin;

    property OnNodeLogout: TEventoNode
      read FOnNodeLogout write FOnNodeLogout; 

    property OnNodeMudouStatus: TEventoNode
      read FOnNodeMudouStatus write FOnNodeMudouStatus;

    property OnNodeMudouNome: TEventoNode
      read FOnNodeMudouNome write FOnNodeMudouNome;

    property OnLogin: TNotifyEvent
      read FOnLogin write FOnLogin;  

    property OnLogout: TNotifyEvent
      read FOnLogout write FOnLogout;
  end;

  procedure LimpaNodeInfo(var NI: TchNodeInfo);
  

implementation

uses uScsi, IdeSN;

procedure LimpaNodeInfo(var NI: TchNodeInfo);
begin
  NI.niNome := '';
  NI.niStatus := '';
  NI.niTipo := 0;
  NI.niIP := '';
end;

function VolumeSerial(DriveChar: Char): string;
var
  OldErrorMode: Integer;
  Serial, NotUsed, VolFlags: DWORD;
  Buf: array [0..MAX_PATH] of Char;
begin
  OldErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);
  try
    Buf[0] := #$00;
    if GetVolumeInformation(PChar(DriveChar + ':\'), nil, 0, @Serial,
      NotUsed, VolFlags, nil, 0) then
      Result := IntToHex(Integer(Serial), 0)
    else Result := '';
  finally
    SetErrorMode(OldErrorMode);
  end;
end;

{ TClienteChat }

procedure TClienteChat.NodeMudouStatus(const ANodeID, AStatus: String);
var I : Integer;
begin
  if not Nodes.Locate('NodeID', ANodeID, []) then Exit;
  Nodes.Edit;
  Nodes.FieldByName('Status').AsString := AStatus;
  Nodes.Post;
  Contatos.Locate('Username', Nodes.FieldByName('Username').AsString, []);
  
  for I := 0 to FLinkEventos.Count-1 do 
    with PchLinkEventos(FLinkEventos[I])^ do 
      if Assigned(leOnNodeMudouStatus) then
         leOnNodeMudouStatus(Self, ANodeID);
  
  if Assigned(FOnNodeMudouStatus) then 
    FOnNodeMudouStatus(Self, ANodeID);    
end;

procedure TClienteChat.NodeMudouNome(const ANodeID, ANome: String);
var I : Integer;
begin
  if not Nodes.Locate('NodeID', ANodeID, []) then Exit;
  Nodes.Edit;
  Nodes.FieldByName('Nome').AsString := ANome;
  Nodes.Post;
  Contatos.Locate('Username', Nodes.FieldByName('Username').AsString, []);
  
  for I := 0 to FLinkEventos.Count-1 do 
    with PchLinkEventos(FLinkEventos[I])^ do 
      if Assigned(leOnNodeMudouNome) then
         leOnNodeMudouNome(Self, ANodeID);
         
  if Assigned(FOnNodeMudouNome) then 
    FOnNodeMudouNome(Self, ANodeID);    
end;

procedure TClienteChat.NodeLogin(const ANodeID, AUsername, ANome, AStatus, AIP: String; ATipo: Byte);
var I : Integer;
begin
  if ANodeID = NodeID then begin
    Status := AStatus;
    Nome := ANome;
    Exit;
  end;  
    
  if Nodes.Locate('NodeID', ANodeID, []) then
    Nodes.Edit
  else
    Nodes.Insert;
  with Nodes do begin
    FieldByName('NodeID').AsString   := ANodeID;
    FieldByName('Username').AsString := AUsername;
    FieldByName('Nome').AsString := ANome;
    FieldByName('Status').AsString := AStatus;
    FieldByName('IP').AsString := AIP;
    FieldByName('Tipo').AsInteger := ATipo;
    Post;
  end;    
  if not Contatos.Locate('Username', AUsername, []) then begin
    Contatos.Insert;
    Contatos.FieldByName('Username').AsString := AUsername;
    Contatos.Post;
  end;
  Contatos.Edit;
  Contatos.FieldByName('Nodes').AsInteger := Contatos.FieldByName('Nodes').AsInteger + 1;
  Contatos.Post;  
    
  for I := 0 to FLinkEventos.Count-1 do 
    with PchLinkEventos(FLinkEventos[I])^ do 
      if Assigned(leOnNodeLogin) then
         leOnNodeLogin(Self, ANodeID);
         
  if Assigned(FOnNodeLogin) then
    FOnNodeLogin(Self, ANodeID);
end;

constructor TClienteChat.Create(AOwner: TComponent);
begin
  inherited;
  FLinkEventos        := TList.Create;
  FContatos           := CreateMemTableAndFields(Self, chContatos);
  FNodes              := CreateMemTableAndFields(Self, chNodes);
  FOnMsg              := nil;
  FOnNodeLogin        := nil;
  FOnNodeLogout       := nil;
  FOnNodeMudouStatus  := nil;
  FOnNodeMudouNome    := nil;
  FOnLogin            := nil;
  FOnLogout           := nil;
  FConectado     := False;
  FStatus        := stOffLine;
  FNome          := '';
  FUsername      := '';
  FPassword      := '';
  
  FSerialHD      := GetIdeSN;
  if FSerialHD = '' then
    FSerialHD := GetSCSISerial(ParamStr(0)[1]);
  if FSerialHD = '' then
    FSerialHD := VolumeSerial(ParamStr(0)[1]);
end;

procedure TClienteChat.NodeLogout(const ANodeID: String);
var I : Integer;
begin
  if Nodes.Locate('NodeID', ANodeID, []) then begin
    Nodes.Edit;
    Nodes.FieldByName('Status').AsString := stOffLine;
    Nodes.Post;
    if Contatos.Locate('Username', Nodes.FieldByName('Username').AsString, []) then
    begin
      Contatos.Edit;
      Contatos.FieldByName('Nodes').AsInteger := Contatos.FieldByName('Nodes').AsInteger - 1;
      Contatos.Post;
    end;
    try
      for I := 0 to FLinkEventos.Count-1 do 
        with PchLinkEventos(FLinkEventos[I])^ do 
          if Assigned(leOnNodeLogout) then
             leOnNodeLogout(Self, ANodeID);
    
      if Assigned(FOnNodeLogout) then
        FOnNodeLogout(Self, ANodeID);
    finally
      if (Nodes.FieldByName('NodeID').AsString = ANodeID) or  
         Nodes.Locate('NodeID', ANodeID, []) 
      then
        Nodes.Delete;
    end;
  end;
end;

destructor TClienteChat.Destroy;
begin
  Conectado := False;
  while FLinkEventos.Count > 0 do begin
    Dispose(PchLinkEventos(FLinkEventos[0]));
    FLinkEventos.Delete(0);
  end;  
  FLinkEventos.Free;
  FNodes.Free;
  FContatos.Free;
  inherited;
end;

function TClienteChat.GetNodeID: String;
begin
  Result := FSerialHD;
end;

procedure TClienteChat.RecebeuMsg(ANodeID, AMsg: String);
var I : Integer;
begin
  with Nodes do 
  if Locate('NodeID', ANodeID, []) then begin
    Contatos.Locate('Username', FieldByName('Username').AsString, []);

    for I := 0 to FLinkEventos.Count-1 do 
      with PchLinkEventos(FLinkEventos[I])^ do 
        if Assigned(leOnMsg) then
           leOnMsg(Self, ANodeID, AMsg);
    
    if Assigned(FOnMsg) then
      FOnMsg(Self, ANodeID, AMsg);
  end;    
end;

procedure TClienteChat.RefreshContatos;
var 
  SL: TStrings;
  I : Integer;
begin
  Contatos.EmptyTable;
  SL := TStringList.Create;
  try
    SL.Text := ObtemContatos;
    with Contatos do 
    for I := 0 to SL.Count-1 do begin
      Insert;
      FieldByName('Username').AsString := SL.Names[I];
      FieldByName('Nome').AsString := SL.ValueFromIndex[I];
      Post;
    end;

    Nodes.First;
    with Contatos do 
    while not Nodes.Eof do begin
      if Locate('Username', Nodes.FieldByName('Username').AsString, []) then begin
        Edit;
        with FieldByName('Nodes') do 
          AsInteger := AsInteger + 1;
        Post;
      end;
      Nodes.Next;
    end;
  finally
    SL.Free;
  end;
end;

procedure TClienteChat.RefreshNodes;
begin
  FNodes.EmptyTable;
  ObtemNodes(FNodes);
end;

procedure TClienteChat.SetConectado(const Value: Boolean);
var I : Integer;
begin
  if FConectado = Value then Exit;
  FConectado := Value;
  if FConectado then begin

    for I := 0 to FLinkEventos.Count-1 do 
      with PchLinkEventos(FLinkEventos[I])^ do 
        if Assigned(leOnLogin) then
           leOnLogin(Self);
  
    if Assigned(FOnLogin) then 
      FOnLogin(Self);
  end else begin

    for I := 0 to FLinkEventos.Count-1 do 
      with PchLinkEventos(FLinkEventos[I])^ do 
        if Assigned(leOnLogout) then
           leOnLogout(Self);
  
    if Assigned(FOnLogout) then 
      FOnLogout(Self);
  end;
end;

procedure TClienteChat.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TClienteChat.SetPassword(const Value: String);
begin
  FPassword := Value;
end;

procedure TClienteChat.SetStatus(const Value: String);
begin
  FStatus := Value;
end;

procedure TClienteChat.SetUsername(const Value: String);
begin
  FUsername := Value;
end;

procedure TClienteChat.SetNodeID(const Value: String);
begin
  //-----------
end;

function TClienteChat.AddLinkEventos(AOwner: TComponent): PchLinkEventos;
begin
  New(Result);
  FLinkEventos.Add(Result);
  Result^.leOwner := AOwner;
  Result^.leOnMsg := nil;
  Result^.leOnNodeLogin := nil;
  Result^.leOnNodeLogout := nil;
  Result^.leOnNodeMudouStatus := nil;
  Result^.leOnNodeMudouNome := nil;
  Result^.leOnLogin := nil;
  Result^.leOnLogout := nil;
end;

procedure TClienteChat.RemoveLinkEventos(AOwner: TComponent);
var I : Integer;
begin
  for I := FLinkEventos.Count-1 downto 0 do 
    if PchLinkEventos(FLinkEventos[I])^.leOwner = AOwner then begin
      Dispose(PchLinkEventos(FLinkEventos[I]));
      FLinkEventos.Delete(I);
    end;
end;

function TClienteChat.GetNodeInfo(ANodeID: String;
  var ANodeInfo: TchNodeInfo): Boolean;
begin
  if Nodes.Locate('NodeID', ANodeID, []) then begin
    Result := True;
    ANodeInfo.niNome := Nodes.FieldByName('Nome').AsString;
    ANodeInfo.niStatus := Nodes.FieldByName('Status').AsString;
    ANodeInfo.niTipo := Nodes.FieldByName('Tipo').AsInteger;
    ANodeInfo.niIP := Nodes.FieldByName('IP').AsString;
    ANodeInfo.niUsername := Nodes.FieldByName('Username').AsString;
  end else
    Result := False;  
end;

end.
