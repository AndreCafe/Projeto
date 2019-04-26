unit ncgFrmPanFree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncgFrmBasePanelTop, LMDPNGImage, cxControls, cxContainer, cxEdit,
  cxLabel, PngImage, ExtCtrls, LMDSimplePanel, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDCustomPanelFill,
  LMDPanelFill, OleCtrls, SHDocVw_EWB, EwbCore, EmbeddedWB, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, ncgFrmExpTBY;

type
  TFrmPanFree = class(TFrmBaseTop)
    panChat: TLMDSimplePanel;
    imChat: TImage;
    Image1: TImage;
    panTempo: TLMDSimplePanel;
    imTempo: TImage;
    lbCron: TcxLabel;
    panEncerrar: TLMDSimplePanel;
    imEncerrar: TImage;
    Image5: TImage;
    lbEncerrar: TcxLabel;
    panNome: TLMDSimplePanel;
    imNome: TImage;
    Image9: TImage;
    lbNome: TcxLabel;
    panConfig: TLMDSimplePanel;
    imConfig: TImage;
    Image4: TImage;
    lbConfig: TcxLabel;
    panFecharNex: TLMDSimplePanel;
    imFecharNex: TImage;
    Image6: TImage;
    lbFecharNex: TcxLabel;
    lbChat: TcxLabel;
    Timer1: TTimer;
    panPontos: TLMDSimplePanel;
    imPontos: TImage;
    lbPontos: TcxLabel;
    procedure panFecharNexClick(Sender: TObject);
    procedure panConfigClick(Sender: TObject);
    procedure panChatClick(Sender: TObject);
    procedure panEncerrarClick(Sender: TObject);
    procedure panFecharNexMouseEnter(Sender: TObject);
    procedure panFecharNexMouseExit(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure imNomeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FErroNav : Boolean;
    procedure AtualizaCron;
  protected
    procedure SetIDSessao(const Value: Integer); override;
  public
    function ToolbarType: Byte; override;
    function Nav: TFrmExpTBY;

    procedure RefreshToolbar; override;
    procedure visNoNet(aVisible: Boolean); override;
    procedure visValor(aVisible: Boolean); override;
    procedure visDebito(aVisible: Boolean); override;
    procedure visDebitoCaption(aDeb, aTot: String); override;
    procedure visValorCaption(aCaption: String); override;
    procedure visTempoCaption(aCaption: String); override;
    procedure visTempo(aVisible: Boolean); override;
    procedure visPontos(aVisible: Boolean); override;
    procedure visPontosCaption(aCaption: String); override;
    procedure visNumMaq(aCaption: String); override;
    procedure visConfig(aVisible: Boolean); override;
    procedure visEncerrar(aVisible: Boolean); override;
    procedure visFecharNex(aVisible: Boolean); override;
    procedure visNome(aVisible: Boolean); override;
    procedure visNomeCaption(aCaption: String); override;
    procedure visChat(aVisible: Boolean); override;
    { Public declarations }
  end;

var
  FrmPanFree: TFrmPanFree;

implementation

uses ncgFrmPri, ncDebug, ncClassesBase, ncgPrevLogoff, ncgFrmTop;

{$R *.dfm}

const BoolStr : Array[Boolean] of String = ('FALSE', 'TRUE');
{ TFrmPanFree }

procedure TFrmPanFree.AtualizaCron;
var S: String;
begin
  if FvisTempo then
    S := FvisTempoCaption else
    S := '';

  if FvisValor then
    if FvisTempo then
      S := S + sLineBreak + FvisValorCaption else
      S := FvisValorCaption;

  lbCron.Caption := S;
end;

procedure TFrmPanFree.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caNone;
end;

procedure TFrmPanFree.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  CanClose := False;
  PrevLogoff;
end;

procedure TFrmPanFree.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(FrmExpTBY) then FrmExpTBY.Free;
end;

procedure TFrmPanFree.FormHide(Sender: TObject);
begin
  inherited;
  DebugMsg('TFrmPanFree.FormHide');
end;

procedure TFrmPanFree.FormShow(Sender: TObject);
begin
  inherited;
  DebugMsg('TFrmPanFree.FormShow');
end;

procedure TFrmPanFree.imNomeClick(Sender: TObject);
begin
  inherited;
  if not gConfig.ClienteNaoAlteraSenha then
    FrmPri.cmAlterarSenhaClick(Sender);
end;

function TFrmPanFree.Nav: TFrmExpTBY;
begin
  Result := FrmExpTBY;
end;

procedure TFrmPanFree.panChatClick(Sender: TObject);
begin
  inherited;
  FrmPri.panChatClick(Sender);
end;

procedure TFrmPanFree.panConfigClick(Sender: TObject);
begin
  FrmPri.cmDesktopClick(Sender);
end;

procedure TFrmPanFree.panEncerrarClick(Sender: TObject);
begin
  inherited;
  FrmPri.cmEncerrarClick(Sender);
end;

procedure TFrmPanFree.panFecharNexClick(Sender: TObject);
begin
  FrmPri.cmFecharClick(Sender);
end;

procedure TFrmPanFree.panFecharNexMouseEnter(Sender: TObject);
begin
  inherited;
  TLMDSimplePanel(Sender).Color := $009D7135;
end;

procedure TFrmPanFree.panFecharNexMouseExit(Sender: TObject);
begin
  inherited;
  TLMDSimplePanel(Sender).Color := $0059401E;
end;

procedure TFrmPanFree.RefreshToolbar;
begin
  inherited;
  pan.Visible := True;
end;

procedure TFrmPanFree.SetIDSessao(const Value: Integer);
begin
  if Value = FIDSessao then Exit;
  inherited;
  CheckFrmExpTBY;
  if Assigned(FrmExpTBY) then 
    FrmExpTBY.IDSessao := Value;
  DebugMsg('TFrmPanFree.SetIDSessao');
end;

procedure TFrmPanFree.Timer1Timer(Sender: TObject);
begin
  inherited;
  if FrmPri.doShowAD then
    RefreshToolbar;
end;

function TFrmPanFree.ToolbarType: Byte;
begin
  Result := tbFree;
end;

procedure TFrmPanFree.visChat(aVisible: Boolean);
begin
  inherited;
  panChat.Visible := aVisible;
  panEncerrar.Left := panChat.Left+panChat.Width+10;
  panTempo.Left := 2000;
end;

procedure TFrmPanFree.visConfig(aVisible: Boolean);
begin
  inherited;
  panConfig.Visible := aVisible;
end;

procedure TFrmPanFree.visDebito(aVisible: Boolean);
begin
  inherited;
end;

procedure TFrmPanFree.visDebitoCaption(aDeb, aTot: String);
begin
  inherited;
end;

procedure TFrmPanFree.visEncerrar(aVisible: Boolean);
begin
  inherited;
  panEncerrar.Visible := aVisible;
end;

procedure TFrmPanFree.visFecharNex(aVisible: Boolean);
begin
  inherited;
  panFecharNex.Visible := aVisible;
end;

procedure TFrmPanFree.visNome(aVisible: Boolean);
begin
  inherited;
  panNome.Visible := aVisible;
end;

procedure TFrmPanFree.visNomeCaption(aCaption: String);
begin
  inherited;
  FNome := aCaption;
  if FAlterarSenha then 
    aCaption := FNome + sLineBreak + FSenhaCaption;
  lbNome.Caption := aCaption;
  lbNome.Hint := FNome;
  lbNome.Refresh;
  panNome.Refresh;
  panNome.Realign;
  panNome.Repaint;
end;

procedure TFrmPanFree.visNoNet(aVisible: Boolean);
begin
  inherited;
end;

procedure TFrmPanFree.visNumMaq(aCaption: String);
begin
  inherited;
end;

procedure TFrmPanFree.visPontos(aVisible: Boolean);
begin
  inherited;
  DebugMsg('TFrmPanFree.visPontos(aVisible: '+BoolStr[aVisible]);
  panPontos.Visible := aVisible;
  panPontos.Realign;
  panPontos.Repaint;
  panNome.Realign;
  panNome.Repaint;
end;

procedure TFrmPanFree.visPontosCaption(aCaption: String);
begin
  inherited;
  lbPontos.Caption := aCaption;
  visPontos((aCaption>''));
end;

procedure TFrmPanFree.visTempo(aVisible: Boolean);
begin
  inherited;
  AtualizaCron;
end;

procedure TFrmPanFree.visTempoCaption(aCaption: String);
begin
  inherited;
  AtualizaCron;
end;

procedure TFrmPanFree.visValor(aVisible: Boolean);
begin
  inherited;
  AtualizaCron;
end;

procedure TFrmPanFree.visValorCaption(aCaption: String);
begin
  inherited;
  AtualizaCron;
end;

end.
