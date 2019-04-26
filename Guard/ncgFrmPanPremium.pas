unit ncgFrmPanPremium;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncgFrmBasePanelTop, LMDPNGImage, cxControls, cxContainer, cxEdit,
  cxLabel, LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel,
  LMDLabel, PngImage, ExtCtrls, LMDSimplePanel, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDCustomPanelFill,
  LMDPanelFill, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters;

type
  TFrmPanPremium = class(TFrmBaseTop)
    panChat: TLMDSimplePanel;
    imChat: TImage;
    Image1: TImage;
    lbChat: TLMDLabel;
    panTempo: TLMDSimplePanel;
    imTempo: TImage;
    lbTempo: TcxLabel;
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
    panDeb: TLMDSimplePanel;
    imDebitos: TImage;
    lbDeb: TcxLabel;
    lbDebPrompt: TcxLabel;
    panFecharNex: TLMDSimplePanel;
    imFecharNex: TImage;
    Image6: TImage;
    lbFecharNex: TcxLabel;
    panValor: TLMDSimplePanel;
    imValor: TImage;
    lbValor: TcxLabel;
    lbIDMaq: TcxLabel;
    panPontos: TLMDSimplePanel;
    imPontos: TImage;
    lbPontos: TcxLabel;

    procedure panTempoMouseEnter(Sender: TObject);
    procedure panTempoMouseExit(Sender: TObject);
    procedure panEncerrarClick(Sender: TObject);
    procedure panChatClick(Sender: TObject);
    procedure lbNomeClick(Sender: TObject);
    procedure panConfigClick(Sender: TObject);
    procedure panFecharNexClick(Sender: TObject);
    
  private
    { Private declarations }
  public
    function ToolbarType: Byte; override;
  
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
  end;

var
  FrmPanPremium: TFrmPanPremium;

implementation

uses ncgFrmPri, ncDebug;

{$R *.dfm}

{ TFrmBaseTop1 }

procedure TFrmPanPremium.lbNomeClick(Sender: TObject);
begin
  if Trim(FSenhaCaption)>'' then
    FrmPri.cmAlterarSenhaClick(Sender);
end;

procedure TFrmPanPremium.panChatClick(Sender: TObject);
begin
  FrmPri.panChatClick(Sender);
end;

procedure TFrmPanPremium.panConfigClick(Sender: TObject);
begin
  FrmPri.cmDesktopClick(Sender);
end;

procedure TFrmPanPremium.panEncerrarClick(Sender: TObject);
begin
  FrmPri.cmEncerrarClick(Sender);
end;

procedure TFrmPanPremium.panFecharNexClick(Sender: TObject);
begin
  FrmPri.cmFecharClick(Sender);
end;

procedure TFrmPanPremium.panTempoMouseEnter(Sender: TObject);
begin
  TLMDSimplePanel(Sender).Color := $009D7135;
end;

procedure TFrmPanPremium.panTempoMouseExit(Sender: TObject);
begin
  TLMDSimplePanel(Sender).Color := $0059401E;
end;

function TFrmPanPremium.ToolbarType: Byte;
begin
  Result := tbPremium;
end;

procedure TFrmPanPremium.visChat(aVisible: Boolean);
begin
  inherited;
  try
    panChat.Visible := aVisible;
  except
    on E: Exception do 
      DebugMsg('visChat - Exception: ' + E.Message);
  end;
end;

procedure TFrmPanPremium.visConfig(aVisible: Boolean);
begin
  inherited;
  try
    panConfig.Visible := aVisible;
  except
    on E: Exception do 
      DebugMsg('visConfig - Exception: ' + E.Message);
  end;
end;

procedure TFrmPanPremium.visDebito(aVisible: Boolean);
begin
  inherited;
  try
    panDeb.Visible := aVisible;
  except
    on E: Exception do
      DebugMsg('visDebito - Exception: ' + E.Message);
  end;
end;

procedure TFrmPanPremium.visDebitoCaption(aDeb, aTot: String);
begin
  inherited;
  try
    lbDeb.Caption := aDeb + sLineBreak + aTot;
    lbDeb.Refresh;
    panDeb.Refresh;
    panDeb.Realign;
    panDeb.Repaint;
  except
    on E: Exception do
      DebugMsg('visDebitoCaption - Exception: ' + E.Message);
  end;
end;

procedure TFrmPanPremium.visEncerrar(aVisible: Boolean);
begin
  inherited;
  try
    panEncerrar.Visible := aVisible;
  except
    on E: Exception do
      DebugMsg('visEncerrar - Exception : ' + E.Message);
  end;
end;

procedure TFrmPanPremium.visFecharNex(aVisible: Boolean);
begin
  inherited;
  try
    panFecharNex.Visible := aVisible;
  except
    on E: Exception do 
      DebugMsg('visFecharNex - Exception: ' + E.Message);
  end;
end;

procedure TFrmPanPremium.visNome(aVisible: Boolean);
begin
  inherited;
  try
    panNome.Visible := aVisible;
  except
    on E: Exception do
      DebugMsg('visNome - Exception: ' + E.Message);
  end;
end;

procedure TFrmPanPremium.visNomeCaption(aCaption: String);
begin
  inherited;
  try
    FNome := aCaption;
    if FAlterarSenha then 
      aCaption := FNome + sLineBreak + FSenhaCaption;
    lbNome.Caption := aCaption;
    lbNome.refresh;
    panNome.Refresh;
    panNome.Realign;
    panNome.Repaint;
  except
    on E: Exception do
      DebugMsg('visNomeCaption - Exception: ' + E.Message);
  end;
end;

procedure TFrmPanPremium.visNoNet(aVisible: Boolean);
begin
  inherited;
  try
    if aVisible then
      lbIDMaq.Style.TextColor := clRed else
      lbIDMaq.Style.TextColor := $00CEA66F;
  except
    on E: Exception do
      DebugMsg('visNoNet - Exception: ' + E.Message);
  end;
end;

procedure TFrmPanPremium.visNumMaq(aCaption: String);
begin
  inherited;
  try
    lbIDMaq.Caption := aCaption;
  except
    on E: Exception do 
      DebugMsg('visNumMAq - Exception: ' + E.message);
  end;
end;

procedure TFrmPanPremium.visPontos(aVisible: Boolean);
begin
  inherited;
  try
    panPontos.Visible := aVisible;
  except
    on E: Exception do
      DebugMsg('visPontos - Exception: ' + E.Message);
  end;
end;

procedure TFrmPanPremium.visPontosCaption(aCaption: String);
begin
  inherited;
  try
    lbPontos.Caption := aCaption;
    visPontos((aCaption>''));
    lbPontos.Refresh;
    panPontos.Refresh;
    panPontos.Realign;
    panPontos.Repaint;
    panNome.Refresh;
    panNome.Realign;
    panNome.Repaint;
  except
    on E: Exception do 
      DebugMsg('visPontoscaption - Exception: ' + E.Message);
  end;
end;

procedure TFrmPanPremium.visTempo(aVisible: Boolean);
begin
  inherited;
  try
    panTempo.Visible := aVisible;
  except
    on E: Exception do
      DebugMsg('visTempo - Exception: ' + E.Message);
  end;
end;

procedure TFrmPanPremium.visTempoCaption(aCaption: String);
begin
  inherited;
  try
    lbTempo.Caption := aCaption;
  except
    on E: Exception do 
      DebugMsg('visTempoCaption - Exception: ' + E.Message);
  end;
end;

procedure TFrmPanPremium.visValor(aVisible: Boolean);
begin
  inherited;
  try
    panValor.Visible := aVisible;
  except
    on E: Exception do 
      DebugMsg('visValor - Exception: ' + E.Message);
  end;
end;

procedure TFrmPanPremium.visValorCaption(aCaption: String);
begin
  inherited;
  try
    lbValor.Caption := aCaption;
  except
   on E: Exception do 
     DebugMsg('visValorCaption - Exception: ' + E.Message);
  end;
end;


end.
