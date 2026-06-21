unit chpcConversas;

interface

uses
  SysUtils,
  Classes,
  Controls,
  chBase,
  chfrConversa,
  cxPC;

type  
  TchpcConversas = class ( TcxPageControl )
  private
    FClasseFrameConversa : TchClasseFrameConversa;
    FChat                : TClienteChat;
    function GetConversa(Index: Integer): TchFrameConversa;
    function NovaConversa: TchFrameConversa;
    function GetActiveNodeID: String;
    procedure SetActiveNodeID(const Value: String);
    function GetConversaAtiva: TchFrameConversa;
  public
    constructor Create(AOwner: TComponent); override;

    function CriaConversa(ANodeID: String; AMostrar: Boolean): TchFrameConversa;
    procedure MostraNodeID(ANodeID: String; ACriar: Boolean);
    procedure AddMsg(ARecebeu: Boolean; ANodeID: String; AMsg: String; AMostrar: Boolean); 
    procedure AtualizaNodeInfo(ANodeID: String);

    function ConversaPorNodeID(const ANodeID: String): TchFrameConversa;

    property Conversas[Index: Integer]: TchFrameConversa
      read GetConversa;
  published 
    property ClasseFrameConversa: TchClasseFrameConversa
      read FClasseFrameConversa write FClasseFrameConversa;

    property ActiveNodeID: String
      read GetActiveNodeID write SetActiveNodeID; 

    property ConversaAtiva: TchFrameConversa
      read GetConversaAtiva;

    property Chat: TClienteChat
      read FChat write FChat;  
  end;

  procedure Register;
  
  var
    ClasseFrameConversaPadrao : TchClasseFrameConversa = nil;

implementation

{ TchpcConversas }

procedure TchpcConversas.AddMsg(ARecebeu: Boolean; ANodeID, AMsg: String; AMostrar: Boolean);
begin
  CriaConversa(ANodeID, AMostrar).AddMsg(ARecebeu, Now, AMsg);
end;

procedure TchpcConversas.AtualizaNodeInfo(ANodeID: String);
var C : TchFrameConversa;
begin
  C := ConversaPorNodeID(ANodeID);
  if C <> nil then
    C.AtualizaNodeInfo;
end;

function TchpcConversas.ConversaPorNodeID(
  const ANodeID: String): TchFrameConversa;
var I : Integer;  
begin
  for I := 0 to PageCount-1  do
    if Conversas[I].NodeID = ANodeID then 
    begin
      Result := Conversas[I];
      Exit;
    end;
  Result := nil;  
end;

constructor TchpcConversas.Create(AOwner: TComponent);
begin
  inherited;
  FClasseFrameConversa := ClasseFrameConversaPadrao;
  FChat                := nil;
end;

function TchpcConversas.CriaConversa(ANodeID: String;
  AMostrar: Boolean): TchFrameConversa;
begin
  Result := ConversaPorNodeID(ANodeID);
  if Result=nil then begin
    Result := NovaConversa;
    Result.NodeID := ANodeID;
    if AMostrar then ActivePage := Result.TabSheet;
  end;  
end;

function TchpcConversas.GetActiveNodeID: String;
begin
  if ActivePage = nil then
    Result := ''
  else  
    Result := TchFrameConversa(ActivePage.Tag).NodeID;
end;

function TchpcConversas.GetConversa(Index: Integer): TchFrameConversa;
begin
  Result := TchFrameConversa(Pages[Index].Tag);
end;

function TchpcConversas.GetConversaAtiva: TchFrameConversa;
begin
  if (ActivePage<>nil) and (ActivePage.Tag<>0) then
    Result := TchFrameConversa(ActivePage.Tag)
  else
    Result := nil;  
end;

procedure TchpcConversas.MostraNodeID(ANodeID: String;
  ACriar: Boolean);
var
  C : TchFrameConversa;  
begin
  if ACriar then 
    C := CriaConversa(ANodeID, ACriar)
  else 
    C := ConversaPorNodeID(ANodeID);  
  if C<>nil then 
    ActivePage := C.TabSheet;
end;

function TchpcConversas.NovaConversa: TchFrameConversa;
var T: TcxTabSheet;
begin
  T := TcxTabSheet.Create(Owner);
  Result := FClasseFrameConversa.Create(T);
  T.Tag := Integer(Result);
  T.PageControl := Self;
  T.Color := $00E1FFFF;
  Result.TabSheet := T;
  Result.Parent := T;
end;

procedure TchpcConversas.SetActiveNodeID(const Value: String);
var 
  NI : TchNodeInfo;
begin
  if not Chat.GetNodeInfo(Value, NI) then
    Raise Exception.Create('NodeID inválido');
  Self.MostraNodeID(Value, True);  
end;

procedure Register;
begin
  RegisterComponents('Standard', [TchpcConversas]);
end;

end.
