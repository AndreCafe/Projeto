unit ncgFrmPanFree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncgFrmBasePanelTop, LMDPNGImage, cxControls, cxContainer, cxEdit,
  cxLabel, PngImage, ExtCtrls, LMDSimplePanel, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDCustomPanelFill,
  LMDPanelFill, OleCtrls, SHDocVw_EWB, EwbCore, EmbeddedWB;

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
    WB: TEmbeddedWB;
    TimerNav: TTimer;
    Timer1: TTimer;
    panPontos: TLMDSimplePanel;
    imPontos: TImage;
    lbPontos: TcxLabel;
    procedure panFecharNexClick(Sender: TObject);
    procedure panConfigClick(Sender: TObject);
    procedure panChatClick(Sender: TObject);
    procedure lbNomeClick(Sender: TObject);
    procedure panEncerrarClick(Sender: TObject);
    procedure panFecharNexMouseEnter(Sender: TObject);
    procedure panFecharNexMouseExit(Sender: TObject);
    procedure WBNavigateError(ASender: TObject; const pDisp: IDispatch; var URL,
      Frame, StatusCode: OleVariant; var Cancel: WordBool);
    procedure WBDocumentComplete(ASender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
    procedure TimerNavTimer(Sender: TObject);
    procedure WBNavigateComplete2(ASender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    function WBShowMessage(Sender: TObject; HWND: Cardinal; lpstrText,
      lpstrCaption: PWideChar; dwType: Integer; lpstrHelpFile: PWideChar;
      dwHelpContext: Integer; var plResult: Integer): HRESULT;
    procedure WBShowDialog(Sender: TObject; h: Cardinal; StyleEx: Integer;
      OldCaption: string; var NewCaption: WideString; var Cancel: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FErroNav : Boolean;
    procedure AtualizaCron;
    procedure Navigate;
    procedure OnTimerCreate(Sender: TObject);
  protected
    procedure SetIDSessao(const Value: Integer); override;
    procedure OnRetryNav(Sender: TObject);
    procedure RetryNav;
    procedure RefreshSize;
  public
    function ToolbarType: Byte; override;

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

uses ncgFrmPri, ncDebug;

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
end;

procedure TFrmPanFree.FormCreate(Sender: TObject);
begin
  inherited;
  DebugMsg('TFrmPanFree.FormCreate');
  WB.Visible := False;
  with TTimer.Create(Self) do begin
    Interval := 100;
    OnTimer := OnTimerCreate;
    Enabled := True;
  end;
end;

procedure TFrmPanFree.lbNomeClick(Sender: TObject);
begin
  inherited;
  FrmPri.cmAlterarSenhaClick(Sender);
end;

procedure TFrmPanFree.OnRetryNav(Sender: TObject);
begin
  try
    Navigate;
  finally
    Sender.Free;
  end;
end;

procedure TFrmPanFree.OnTimerCreate(Sender: TObject);
begin
  try
    DebugMsg('TFrmPanFree.OnTimerCreate');
    WB.Visible := False;
  finally
    Sender.Free;
  end;
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

procedure TFrmPanFree.RefreshSize;
begin
  case Screen.Width of 
    1280..9999 : begin
        WB.Width := 740;
      end;
    1024..1279 : begin
      WB.Width := 542;
    end;  
  else 
    WB.Width := 427;
  end;
end;

procedure TFrmPanFree.RefreshToolbar;
begin
  inherited;
//  WB.Align := alRight;
//  WB.Align := alLeft;
  RefreshSize;
  WB.Visible := True;
  pan.Visible := True;
end;

procedure TFrmPanFree.RetryNav;
begin
  if IDSessao=0 then Exit;
  TimerNav.Enabled := True;
end;

procedure TFrmPanFree.SetIDSessao(const Value: Integer);
begin
  if Value = FIDSessao then Exit;
  inherited;
  DebugMsg('TFrmPanFree.SetIDSessao');
  WB.Visible := False;
  if FIDSessao>0 then 
    RetryNav;
end;

procedure TFrmPanFree.Timer1Timer(Sender: TObject);
begin
  inherited;
  if FrmPri.doShowAD then
    RefreshToolbar;
end;

procedure TFrmPanFree.TimerNavTimer(Sender: TObject);
begin
  TimerNav.Enabled := False;
  Navigate;
end;

function TFrmPanFree.ToolbarType: Byte;
begin
  Result := tbFree;
end;

procedure TFrmPanFree.Navigate;
begin
  try
    FErroNav := False;
    WB.Visible := False;
    case Screen.Width of
      1280..9999 : begin
          WB.Width := 620;
          WB.Navigate('http://ad.nextar.com.br/toolbar3.html');
        end;
      1024..1279 : begin
        WB.Width := 530;
        WB.Navigate('http://ad.nextar.com.br/toolbar2.html');
      end;  
    else 
      WB.Width := 427;
      WB.Navigate('http://ad.nextar.com.br/toolbar3.html');
    end;
  except
    on E: Exception do begin
      RetryNav;
      DebugMsg('TFrmPanFree.Navigate - E.Message: ' + E.Message);
    end;
  end;
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

procedure TFrmPanFree.WBDocumentComplete(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  inherited;
  if not FErroNav then 
    WB.Visible := True;
end;

procedure TFrmPanFree.WBNavigateComplete2(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  if not FErroNav then
    WB.Visible := True;
end;

procedure TFrmPanFree.WBNavigateError(ASender: TObject; const pDisp: IDispatch;
  var URL, Frame, StatusCode: OleVariant; var Cancel: WordBool);
begin
  FErroNav := True;
  WB.Visible := False;
  RetryNav;
end;

procedure TFrmPanFree.WBShowDialog(Sender: TObject; h: Cardinal;
  StyleEx: Integer; OldCaption: string; var NewCaption: WideString;
  var Cancel: Boolean);
begin
  inherited;
  ShowMessage('OldCaption: ' + OldCaption + ' NexCaption:  ' + NewCaption);
end;

function TFrmPanFree.WBShowMessage(Sender: TObject; HWND: Cardinal; lpstrText,
  lpstrCaption: PWideChar; dwType: Integer; lpstrHelpFile: PWideChar;
  dwHelpContext: Integer; var plResult: Integer): HRESULT;
begin
  inherited;
  ShowMessage('OnShowMessage - Caption: ' + lpstrCaption + ' - Text: ' + lpstrText);
end;

end.
