unit chfrBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxControls, cxPC, chpcConversas, chBase, LMDCustomScrollBox,
  LMDScrollBox, lmdsplt, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel;

type
  TchFrameBase = class(TFrame)
    LMDSplitterPanel1: TLMDSplitterPanel;
    spConversas: TLMDSplitterPane;
    spTexto: TLMDSplitterPane;
    Conversas: TchpcConversas;
    procedure ConversasPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
  private
    FChat : TClienteChat;
    procedure SetClienteChat(const Value: TClienteChat);
    { Private declarations }
  protected 
     procedure Notification(AComponent:TComponent; AOperation:TOperation); override;
  
     procedure fOnMsg(Sender: TObject; ANodeID: String; AMsg: String); virtual;
     procedure fOnNodeLogin(Sender: TObject; ANodeID: String); virtual;
     procedure fOnNodeLogout(Sender: TObject; ANodeID: String); virtual;
     procedure fOnNodeMudouStatus(Sender: TObject; ANodeID: String); virtual;
     procedure fOnNodeMudouNome(Sender: TObject; ANodeID: String); virtual;
     procedure fOnLogin(Sender: TObject); virtual;
     procedure fOnLogout(Sender: TObject); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure EnviaMsg(ANodeID: String; AMsg: String); virtual;
    { Public declarations }
  published
    property ClienteChat: TClienteChat
      read FChat write SetClienteChat;
  end;                                               

implementation

{$R *.dfm}

{ TchFrameBase }

constructor TchFrameBase.Create(AOwner: TComponent);
begin
  inherited;
  FChat := nil;
end;

destructor TchFrameBase.Destroy;
begin
  if FChat<>nil then
    FChat.RemoveLinkEventos(Self);
  inherited;
end;

procedure TchFrameBase.EnviaMsg(ANodeID, AMsg: String);
begin
  FChat.EnviaMsg(ANodeID, AMsg);
  Conversas.AddMsg(False, ANodeID, AMsg, True);
end;

procedure TchFrameBase.fOnLogin(Sender: TObject);
begin

end;

procedure TchFrameBase.fOnLogout(Sender: TObject);
begin

end;

procedure TchFrameBase.fOnMsg(Sender: TObject; ANodeID, AMsg: String);
begin
  Conversas.AddMsg(True, ANodeID, AMsg, (Conversas.PageCount=0));
end;

procedure TchFrameBase.fOnNodeLogin(Sender: TObject; ANodeID: String);
begin

end;

procedure TchFrameBase.fOnNodeLogout(Sender: TObject; ANodeID: String);
begin

end;

procedure TchFrameBase.fOnNodeMudouNome(Sender: TObject; ANodeID: String);
begin
  Conversas.AtualizaNodeInfo(ANodeID);
end;

procedure TchFrameBase.fOnNodeMudouStatus(Sender: TObject;
  ANodeID: String);
begin
  Conversas.AtualizaNodeInfo(ANodeID);
end;

procedure TchFrameBase.Notification(AComponent: TComponent;
  AOperation: TOperation);
begin
  if (AOperation = opRemove) and (AComponent = FChat) then 
    ClienteChat := nil;
  inherited;
end;

procedure TchFrameBase.SetClienteChat(const Value: TClienteChat);
begin
  if Value = FChat then Exit;
  if Value = nil then 
    FChat.RemoveLinkEventos(Self)
  else 
    with Value.AddLinkEventos(Self)^ do begin
      leOnMsg := fOnMsg;
      leOnNodeLogin := fOnNodeLogin;
      leOnNodeLogout := fOnNodeLogout;
      leOnNodeMudouStatus := fOnNodeMudouStatus;
      leOnNodeMudouNome := fOnNodeMudouNome;
      leOnLogin := fOnLogin;
      leOnLogout := fOnLogout;
    end;
  FChat := Value;
  Conversas.Chat := FChat;
  if FChat.Conectado then
    fOnLogin(FChat);
end;

procedure TchFrameBase.ConversasPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  with Conversas do 
  if (ConversaAtiva <> Nil) and (ConversaAtiva.Vazia) then
    ConversaAtiva.Fechar;
  AllowChange := True;  
end;

end.
