unit chfrConversa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, OleCtrls, cxPC, chBase, ExtCtrls;

type
  TchFrameConversa = class(TFrame)
    Panel1: TPanel;
  private
    { Private declarations }
    FNodeID : String;
    FTabSheet : TcxTabSheet;
    FNodeInfo : TchNodeInfo;
    FVazia    : Boolean;
    procedure SetNodeID(const Value: String);
  public
    constructor Create(AOwner: TComponent); override;

    destructor Destroy; override;

    procedure AjustaCaption;

    procedure Fechar;

    function Chat: TClienteChat;

    procedure AtualizaNodeInfo; virtual;

    procedure AddMsg(ARecebeu: Boolean; AHora: TDateTime; ATexto: String); virtual; 

    property Vazia: Boolean
      read FVazia;
      
  published  
    property NodeID: String
      read FNodeID write SetNodeID;

    property TabSheet: TcxTabSheet
      read FTabSheet write FTabSheet;

    property NodeInfo: TchNodeInfo
      read FNodeInfo write FNodeInfo;  

    { Public declarations }
  end;

  TchClasseFrameConversa = class of TchFrameConversa;

implementation

uses chpcConversas;

{$R *.dfm}

{ TFrameConversa }

procedure TchFrameConversa.AddMsg(ARecebeu: Boolean; AHora: TDateTime;
  ATexto: String);
begin
  FVazia := False;
end;

procedure TchFrameConversa.AjustaCaption;
var S: String;
begin
  with FNodeInfo do begin
    S := niNome;
    if S = '' then S := 'Desconhecido';
    if niStatus <> '' then
      S := S + ' (' + niStatus + ')';
  end;    
  TabSheet.Caption := S;
end;

procedure TchFrameConversa.AtualizaNodeInfo;
begin
  LimpaNodeInfo(FNodeInfo);
  if Chat <> nil then
    Chat.GetNodeInfo(FNodeID, FNodeInfo);
  AjustaCaption;  
end;

function TchFrameConversa.Chat: TClienteChat;
begin
  if (FTabSheet<>nil) and (FTabSheet.PageControl<>nil) then
    Result := TchpcConversas(FTabSheet.PageControl).Chat
  else
    Result := nil;  
end;

constructor TchFrameConversa.Create(AOwner: TComponent);
begin
  inherited;
  FVazia := True;
  FNodeID := '';
  FTabSheet := nil;
  LimpaNodeInfo(FNodeInfo);
end;

destructor TchFrameConversa.Destroy;
begin
  if FTabSheet<>nil then
    FTabSheet.Free;
  inherited;
end;

procedure TchFrameConversa.Fechar;
var T: TcxTabSheet;
begin
  if FTabSheet=nil then Exit;
  T := FTabSheet;
  FTabSheet := nil;
  T.PageControl := nil;
  T.Free;
end;

procedure TchFrameConversa.SetNodeID(const Value: String);
begin
  if Value = FNodeID then Exit;
  FNodeID := Value;
  AtualizaNodeInfo;
end;

end.
