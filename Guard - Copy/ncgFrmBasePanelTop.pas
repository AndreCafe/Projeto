unit ncgFrmBasePanelTop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDCustomParentPanel, LMDCustomPanelFill, LMDPanelFill;

type
  TFrmBaseTop = class(TForm)
    pan: TLMDPanelFill;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FLastWidth: Integer;
  protected
    FSenhaCaption : String;
    FNome : String;
    FAlterarSenha: Boolean;
    FvisNoNet: Boolean;
    FvisValor: Boolean;
    FvisDebito: Boolean;
    FvisDebitoCaptionDeb: String;
    FvisDebitoCaptionTot: String;
    FvisValorCaption: String;
    FvisTempoCaption: String;
    FvisTempo: Boolean;
    FvisPontos: Boolean;
    FvisPontosCaption: String;
    FvisNumMaq: String;
    FvisConfig: Boolean;
    FvisEncerrar: Boolean;
    FvisFecharNex: Boolean;
    FvisNome: Boolean;
    FvisNomeCaption: String;
    FvisAlterarSenha: Boolean;
    FvisSenhaCaption: String;
    FvisChat: Boolean;
    FIDSessao : Integer;

    procedure SetIDSessao(const Value: Integer); virtual;
    
  public
    function GetCaptionValor: String; virtual; 

    function ToolbarType: Byte; virtual; abstract;

    procedure AssignVisFrom(B: TFrmBaseTop);

    procedure RefreshToolbar; virtual;

    procedure visNoNet(aVisible: Boolean); virtual; 
    procedure visValor(aVisible: Boolean); virtual; 
    procedure visDebito(aVisible: Boolean); virtual; 
    procedure visDebitoCaption(aDeb, aTot: String); virtual; 
    procedure visValorCaption(aCaption: String); virtual; 
    procedure visTempoCaption(aCaption: String); virtual; 
    procedure visTempo(aVisible: Boolean); virtual; 
    procedure visPontos(aVisible: Boolean); virtual; 
    procedure visPontosCaption(aCaption: String); virtual; 
    procedure visNumMaq(aCaption: String); virtual; 
    procedure visConfig(aVisible: Boolean); virtual; 
    procedure visEncerrar(aVisible: Boolean); virtual; 
    procedure visFecharNex(aVisible: Boolean); virtual; 
    procedure visNome(aVisible: Boolean); virtual; 
    procedure visNomeCaption(aCaption: String); virtual; 
    procedure visAlterarSenha(aVisible: Boolean); virtual; 
    procedure visSenhaCaption(aCaption: String); virtual; 
    procedure visChat(aVisible: Boolean); virtual; 

    property IDSessao: Integer 
      read FIDSessao write SetIDSessao;

    property LastWidth: Integer
      read FLastWidth;
  end;

var
  FrmBaseTop: TFrmBaseTop;

implementation

uses ncDebug;

{$R *.dfm}

procedure TFrmBaseTop.AssignVisFrom(B: TFrmBaseTop);
begin
  try
    visNoNet(B.FvisNoNet);
    visValor(B.FvisValor);
    visDebito(B.FvisDebito);
    visDebitoCaption(B.FvisDebitoCaptionDeb, B.FvisDebitoCaptionTot);
    visValorCaption(B.FvisValorCaption);
    visTempoCaption(B.FvisTempoCaption);
    visTempo(B.FvisTempo);
    visPontos(B.FvisPontos);
    visPontosCaption(B.FvisPontosCaption);
    visNumMaq(B.FvisNumMaq);
    visConfig(B.FvisConfig);
    visEncerrar(B.FvisEncerrar);
    visFecharNex(B.FvisFecharNex);
    visNome(B.FvisNome);
    visNomeCaption(B.FvisNomeCaption);
    visAlterarSenha(B.FvisAlterarSenha);
    visSenhaCaption(B.FvisSenhaCaption);
    visChat(B.FvisChat);
    IDSessao := B.IDSessao;
  except
    on E: Exception do 
      DebugMsg('TFrmBaseTop.AssignVisFrom - Exception : ' + E.MEssage);
  end;
end;

procedure TFrmBaseTop.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caNone;
end;

procedure TFrmBaseTop.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;
end;

procedure TFrmBaseTop.FormCreate(Sender: TObject);
begin
  FIDSessao := 0;
  FSenhaCaption := 'Alterar Senha';
  FNome := '';
  FAlterarSenha := True;

  FvisNoNet := False; 
  FvisValor := True;
  FvisDebito:= False;
  FvisDebitoCaptionDeb := 'R$ 0,00'; 
  FvisDebitoCaptionTot := 'R$ 0,00';
  FvisValorCaption := 'R$ 0,00';
  FvisTempoCaption := '00:00:00'; 
  FvisTempo := True;
  FvisPontos := False; 
  FvisPontosCaption:= ''; 
  FvisNumMaq := ''; 
  FvisConfig := False; 
  FvisEncerrar := False; 
  FvisFecharNex := False; 
  FvisNome := False; 
  FvisNomeCaption:= ''; 
  FvisAlterarSenha:= True; 
  FvisSenhaCaption:= 'Alterar Senha'; 
  FvisChat:= False; 
  DebugMsg('FrmBaseTop - FormCreate');
end;

function TFrmBaseTop.GetCaptionValor: String;
begin
  try
    Result := FvisValorCaption;
  except
    on E: Exception do 
      DebugMsg('TFrmBaseTop - GetCaptionValor - Exception: ' + E.Message);
  end;
end;

procedure TFrmBaseTop.RefreshToolbar;
begin

end;

procedure TFrmBaseTop.SetIDSessao(const Value: Integer);
begin
  try
    FIDSessao := Value;
  except
    on E: Exception do 
      DebugMsg('TFrmBaseTop - SetIDSessao - Exception: ' + E.Message);
  end;
end;

procedure TFrmBaseTop.visAlterarSenha(aVisible: Boolean);
begin
  try
    FvisAlterarSenha := aVisible;
    FAlterarSenha := aVisible;
    visNomeCaption(FNome);
  except
    on E: Exception do 
      DebugMsg('TFrmBaseTop - visAlterarSenha - Exception: ' + E.Message);
  end;
end;

procedure TFrmBaseTop.visChat(aVisible: Boolean);
begin
  try
    FvisChat := aVisible;
  except
    on E: Exception do 
      DebugMsg('TFrmBaseTop - visChat - Exception: ' + E.Message);
  end;
end;

procedure TFrmBaseTop.visConfig(aVisible: Boolean);
begin
  try
    FvisConfig := aVisible;
  except 
    on E: Exception do 
      DebugMsg('TFrmBaseTop - visConfig - Exception: ' + E.Message);
  end;
end;

procedure TFrmBaseTop.visDebito(aVisible: Boolean);
begin
  try
    FvisDebito := aVisible;
  except
    on E: Exception do 
      DebugMsg('TFrmBaseTop - visDebito - Exception: ' + E.Message);
  end;
end;

procedure TFrmBaseTop.visDebitoCaption(aDeb, aTot: String);
begin
  try
    FvisDebitoCaptionDeb := aDeb;
    FvisDebitoCaptionTot := aTot;
  except
    on E: Exception do
      DebugMsg('TFrmBaseTop - visDebitoCaption - '+ E.Message);
  end;
end;

procedure TFrmBaseTop.visEncerrar(aVisible: Boolean);
begin
  try
    FvisEncerrar := aVisible;
  except
    on E: Exception do
      DebugMsg('TFrmBaseTop - visEncerrar - ' + E.Message);
  end;
end;

procedure TFrmBaseTop.visFecharNex(aVisible: Boolean);
begin
  try
    FvisFecharNex := aVisible;
  except
    on E: Exception do
      debugMsg('TFrmBaseTop - visFecharNex - ' + E.Message);
  end;
end;

procedure TFrmBaseTop.visNome(aVisible: Boolean);
begin
  try
    FvisNome := aVisible;
  except
    on E: Exception do 
      debugmsg('TFrmBaseTop - visNome - Exception '+ E.Message);
  end;
end;

procedure TFrmBaseTop.visNomeCaption(aCaption: String);
begin
  try
    FvisNomeCaption := aCaption;
  except
    on E: Exception do
      debugMsg('TFrmBaseTop - visNomeCaption - Exception: ' + E.Message);

  end;
end;

procedure TFrmBaseTop.visNoNet(aVisible: Boolean);
begin
  try
    FvisNoNet := aVisible;
  except
    on E: Exception do 
      debugmsg('TFrmBaseTop - visNoNet - Exception: ' + E.Message);

  end;
end;

procedure TFrmBaseTop.visNumMaq(aCaption: String);
begin
  try
    FvisNumMaq := aCaption;
  except
    on E: Exception do
      debugmsg('TFrmBaseTop - visNumMaq - Exception: ' + E.Message);
  end;
end;

procedure TFrmBaseTop.visPontos(aVisible: Boolean);
begin
  try
    FvisPontos := aVisible;
  except
    on e: exception do 
      debugmsg('TFrmBaseTop - visNumMaq - Exception: ' + E.Message);

  end;
end;

procedure TFrmBaseTop.visPontosCaption(aCaption: String);
begin
  try
    FvisPontosCaption := aCaption;
  except
    on e: exception do 
      debugmsg('TFrmBaseTop - visPontosCaption - Exception: ' + E.message);
  end;
end;

procedure TFrmBaseTop.visSenhaCaption(aCaption: String);
begin
  try
    FvisSenhaCaption := aCaption;
    FSenhaCaption := aCaption;
    visNomeCaption(FNome);
  except
    on e: exception do 
      debugmsg('TFrmBaseTop - visSenhaCaption - Exception: ' + E.Message);
  end;
end;

procedure TFrmBaseTop.visTempo(aVisible: Boolean);
begin
  try
    FvisTempo := aVisible;
  except
    on E: exception do 
      debugmsg('TFrmBaseTop - visTempo - exception:  ' + E.Message);
  end;
end;

procedure TFrmBaseTop.visTempoCaption(aCaption: String);
begin
  try
    FvisTempoCaption := aCaption;
  except
    on E: exception do
      debugmsg('TFrmBaseTop - visTempoCaption - exception: ' + E.Message);
  end;
end;

procedure TFrmBaseTop.visValor(aVisible: Boolean);
begin
  try
    FvisValor := aVisible;
  except
    on E: Exception do 
      debugmsg('TFrmBaseTop - visValor - exception: ' + E.Message);
  end;
end;

procedure TFrmBaseTop.visValorCaption(aCaption: String);
begin
  try
    FvisValorCaption := aCaption;
  except
    on E: Exception do 
      debugMsg('TFrmBaseTop - visValorCaption - exception: ' + E.Message);

  end;
end;

end.
