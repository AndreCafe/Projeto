unit ncgFrmPausa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, LMDGraphicControl, LMDFill,
  LMDControl, LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, dxBar, dxBarExtItems, LMDCustomSimpleLabel,
  LMDSimpleLabel, cxLookAndFeelPainters, cxButtons, cxTextEdit, cxLabel,
  cxControls, cxContainer, cxEdit, cxGroupBox, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, Menus, cxGraphics,
  ComCtrls, cxSpinEdit, cxMaskEdit, cxDropDownEdit, cxProgressBar,
  dxGDIPlusClasses, LMDCustomParentPanel, LMDCustomPanelFill, LMDPanelFill, cxPC,
  cxRadioGroup, ncSessao, pngimage, ncgFormBase, LMDPNGImage, cxLookAndFeels;

type
  TFrmPausa = class(TFormBaseGuard)
    Timer4: TTimer;
    TimerTempoRes: TTimer;
    Timer1: TTimer;
    Paginas: TcxPageControl;
    tsReconectar: TcxTabSheet;
    LMDSimplePanel6: TLMDSimplePanel;
    panCentro3: TLMDPanelFill;
    panDiv3: TLMDPanelFill;
    panA3: TLMDSimplePanel;
    Imagem1: TImage;
    lbMensagem1: TcxLabel;
    panB3: TLMDSimplePanel;
    LMDSimplePanel8: TLMDSimplePanel;
    ScrollBox1: TScrollBox;
    LMDPanelFill4: TLMDPanelFill;
    tsFechar: TcxTabSheet;
    LMDSimplePanel7: TLMDSimplePanel;
    panCentro2: TLMDPanelFill;
    panDiv2: TLMDPanelFill;
    panA2: TLMDSimplePanel;
    Image2: TImage;
    cxLabel4: TcxLabel;
    panB2: TLMDSimplePanel;
    panErro: TLMDSimplePanel;
    Image3: TImage;
    lbErro: TcxLabel;
    LMDSimplePanel13: TLMDSimplePanel;
    cxLabel8: TcxLabel;
    LMDPanelFill5: TLMDPanelFill;
    LMDSimplePanel5: TLMDSimplePanel;
    lbVersao: TcxLabel;
    lbMaquina: TcxLabel;
    LMDPanelFill1: TLMDPanelFill;
    cxTabSheet2: TcxTabSheet;
    LMDSimplePanel1: TLMDSimplePanel;
    panCentro1: TLMDPanelFill;
    panDiv1: TLMDPanelFill;
    panA1: TLMDSimplePanel;
    Image1: TImage;
    cxLabel1: TcxLabel;
    panB1: TLMDSimplePanel;
    LMDSimplePanel9: TLMDSimplePanel;
    ScrollBox2: TScrollBox;
    LMDPanelFill6: TLMDPanelFill;
    LMDSimplePanel11: TLMDSimplePanel;
    Image6: TImage;
    cxLabel3: TcxLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    Image4: TImage;
    cxLabel2: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    rbContinuar: TcxRadioButton;
    cxLabel7: TcxLabel;
    btnOk: TcxButton;
    edSenha: TcxTextEdit;
    rbEncerrar: TcxRadioButton;
    btnEncerrar: TcxButton;
    PB: TcxProgressBar;
    lbMsgFimCred: TcxLabel;
    cxTabSheet1: TcxTabSheet;
    panCentro4: TLMDPanelFill;
    panDiv4: TLMDPanelFill;
    panA4: TLMDSimplePanel;
    Image5: TImage;
    cxLabel5: TcxLabel;
    panB4: TLMDSimplePanel;
    LMDSimplePanel10: TLMDSimplePanel;
    cxLabel6: TcxLabel;
    cxLabel10: TcxLabel;
    lbValor: TcxLabel;
    lbTempo: TcxLabel;
    btnNao: TButton;
    btnSim: TButton;
    LMDPanelFill3: TLMDPanelFill;
    LMDSimplePanel3: TLMDSimplePanel;
    Timer2: TTimer;
    pbEncerrar: TcxProgressBar;
    lbPromptTempoRes: TcxLabel;
    lbTempoRes: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TimerTempoResTimer(Sender: TObject);
    procedure btnEncerrarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edSenhaPropertiesChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure rbEncerrarClick(Sender: TObject);
    procedure rbContinuarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
    procedure btnNaoClick(Sender: TObject);
  private
    { Private declarations }
    FPodeFechar: Boolean;
    FInicio : Cardinal;
    FFim    : Cardinal;
    FPrimeiro : Boolean;
    procedure EncerrarAuto;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    procedure Congela;
    procedure Fechar;
    procedure AjustaOpcao;
    procedure AtualizaTela;
    procedure AjustaTamanho;
    { Public declarations }
  end;

var
  FrmPausa: TFrmPausa = nil;
  TempoFechar : Word = 60;
  FecharAuto : Boolean = False;

implementation

uses ncgFrmPri, ncClassesBase, ncgFrmLogin, ncErros, ncDebug;

{$R *.DFM}

{ TFrmConta }

procedure TFrmPausa.Congela;
begin
  ShowModal;
end;

procedure TFrmPausa.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.X := 0;
  Params.Y := 0;
  Params.Width := Screen.Width;
  Params.Height := Screen.Height;
end;

procedure TFrmPausa.Fechar;
begin
  FPodeFechar := True;
  Close;
end;

procedure TFrmPausa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FrmPausa := nil;
end;

procedure TFrmPausa.FormDestroy(Sender: TObject);
begin
  FrmPausa := nil;
end;

procedure TFrmPausa.FormCreate(Sender: TObject);
begin
  Paginas.HideTabs := True;
  Paginas.ActivePageIndex := 0;
  FPodeFechar := False;
  Left := 0;
  Top := 0;
  Width := Screen.Width;
  Height := Screen.Height; 
end;

procedure TFrmPausa.Timer4Timer(Sender: TObject);
var H : HWND;
begin
  Left := 0;
  Top := 0;
  Width := Screen.Width;
  Height := Screen.Height;
  if FrmPri.StayOnTopOff then Exit;
  ForceForegroundWindow(Handle);
  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, (SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE));
  H := GetForeGroundWindow;
  ShowWindow(Handle, SW_SHOW);
  if FPrimeiro or ((H <> Handle) and (H <> FindWindow('Shell_TrayWnd', nil)) and ((GetTickCount-TicksVisible)<6000)) then begin
    keybd_event(VK_LWIN, Mapvirtualkey(VK_LWIN, 0), 0, 0);
    keybd_event(VK_LWIN, Mapvirtualkey(VK_LWIN, 0), KEYEVENTF_KEYUP, 0);
    keybd_event(VK_CONTROL, Mapvirtualkey(VK_CONTROL, 0), 0, 0);
    keybd_event(VK_ESCAPE, Mapvirtualkey(VK_ESCAPE, 0), 0, 0);
    keybd_event(VK_ESCAPE, Mapvirtualkey(VK_ESCAPE, 0), KEYEVENTF_KEYUP, 0);
    keybd_event(VK_CONTROL, Mapvirtualkey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0);
    SetForegroundWindow(Handle);
  end;  
  FPrimeiro := False;
end;

procedure TFrmPausa.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := FPodeFechar;
end;

procedure TFrmPausa.TimerTempoResTimer(Sender: TObject);
var T: Integer;
begin
  if not FecharAuto then begin
    TimerTempoRes.Enabled := False;
    Exit;
  end;

  T := GetTickCount - FInicio;
  PB.Position := T;
  if T >= (TempoFechar*1000) then begin
    DebugMsg('TFrmPausa.TimerTempoResTimer');
    btnEncerrarClick(nil);
    TimerTempoRes.Enabled := False;
  end;  
end;

procedure TFrmPausa.AjustaOpcao;
begin
  edSenha.Enabled := rbContinuar.Checked;
  btnOk.Enabled := rbContinuar.Checked;
  btnEncerrar.Enabled := not btnOk.Enabled;
end;

procedure TFrmPausa.AjustaTamanho;
const Gap = 22;
begin
  LockWindowUpdate(Handle);
  try
    panDiv1.Left := (panCentro1.Width - panDiv1.Width) div 2;
    panDiv2.Left := panDiv1.Left;
    panDiv3.Left := panDiv1.Left;
    panDiv4.Left := panDiv1.Left;
    
    panDiv1.Height := panCentro1.Height;
    panDiv2.Height := panCentro1.Height;
    panDiv3.Height := panCentro1.Height;
    panDiv4.Height := panCentro1.Height;
    
    panA1.Left := panDiv1.Left - Gap - panA1.Width;
    panA1.Top  := ((panCentro1.Height-panA1.Height) div 2) - 20;
    panB1.Left := panDiv1.Left + panDiv1.Width + Gap;
    panB1.Top  := panA1.Top;
  
    panA2.Left := panDiv2.Left - Gap - panA2.Width;
    panA2.Top  := ((panCentro2.Height-panA2.Height) div 2) - 20;
    panB2.Left := panDiv2.Left + panDiv2.Width + Gap;
    panB2.Top  := panA2.Top;
  
    panA3.Left := panDiv3.Left - Gap - panA3.Width;
    panA3.Top  := ((panCentro3.Height-panA3.Height) div 2) - 20;
    panB3.Left := panDiv3.Left + panDiv3.Width + Gap;
    panB3.Top  := panA3.Top;
  
    panA4.Left := panDiv4.Left - Gap - panA4.Width;
    panA4.Top  := ((panCentro4.Height-panA4.Height) div 2) - 20;
    panB4.Left := panDiv4.Left + panDiv4.Width + Gap;
    panB4.Top  := panA4.Top;
  finally
    LockWindowUpdate(0);
  end;
end;

procedure TFrmPausa.AtualizaTela;
var 
  S : TncSessao;
  cTempo : Cardinal;
begin
  FPrimeiro := True;
  S := FrmPri.CM.SessaoMaq;
  Paginas.ActivePageIndex := FrmPri.MotivoPausa-1;
  
  FInicio := GetTickCount;
  TimerTempoRes.Enabled := (FrmPri.MotivoPausa=mpPausaFimTempo);
  Timer2.Enabled := (FrmPri.MotivoPausa = mpPausaEncerrar);
  if Timer2.Enabled then
    FFim := GetTickCount + 30000 else
    FFim := 0;

  if S<>nil then begin
    cTempo := S.TempoUsado.Ticks;
    lbTempo.Caption := TicksToHMSSt(cTempo);
    if (S.TempoMaximoTot.Ticks>0) and (cTempo<=S.TempoMaximoTot.Ticks) then begin
      cTempo := S.TempoMaximoTot.Ticks - cTempo;
      lbTempoRes.Caption := TicksToHMSSt(cTempo);
      lbTempoRes.Visible := True;
      lbPromptTempoRes.Visible := True;
    end else begin
      lbTempoRes.Visible := False;
      lbPromptTempoRes.Visible := False;
    end;
  end else begin
    lbTempo.Caption := '';
    lbPromptTempoRes.Visible := False;
    lbTempoRes.Visible := False;
  end;
    
  if FrmPri.FrmTop<>nil then
    lbValor.Caption := FrmPri.FrmTop.GetCaptionValor;
  
  AjustaTamanho;
  lbMsgFimCred.Caption := gConfig.MsgFimCred;

  lbMsgFimCred.Visible := (S<>nil) and (S.Tarifador.CreditoTotal.Ticks<>S.Tarifador.CredTotalG);
end;

procedure TFrmPausa.btnEncerrarClick(Sender: TObject);
begin
  if not Visible then Exit;
  
  try
    DebugMsgEsp('TFrmPausa.btnEncerrarClick', False, False);
    FrmPri.CM.LogoutMaq(FrmPri.CM.Maquina);
  except
    On E: Exception do begin
      Beep;
      panErro.Visible := True;
      lbErro.Caption  := E.Message;
    end;  
  end;    
end;

procedure TFrmPausa.btnNaoClick(Sender: TObject);
begin
  with FrmPri.CM do begin
    if Ativo then CancLogoutMaq(Maquina);
    FFim := 0;
  end;
end;

procedure TFrmPausa.btnOkClick(Sender: TObject);
begin
  with FrmPri.CM do
  try
    if trim(edSenha.text)='' then
      raise ENexCafe.Create('Informe o número do cartão de tempo ou solicite mais tempo ao atendente');
    
    AdicionaPassaporte(Maquina, UpperCase(edSenha.Text));
    edSenha.Clear;
  except
    On E: Exception do begin
      Beep;
      panErro.Visible := True;
      lbErro.Caption  := E.Message;
      edSenha.SetFocus;
    end;  
  end;
end;

procedure TFrmPausa.btnSimClick(Sender: TObject);
begin
  DebugMsgEsp('TFrmPausa.btnSimClick', False, False);

  with FrmPri.CM do
  if Ativo then LogoutMaq(Maquina)
end;

procedure TFrmPausa.FormShow(Sender: TObject);
begin
  lbMaquina.Caption := 'Máquina ' + IntToStr(FrmPri.CM.Maquina);
  lbVersao.Caption := FrmLogin.lbVersao.Caption;
  edSenha.Clear;
  Timer4.Enabled := True;
  Timer4Timer(nil);
  AtualizaTela;
  if FrmPri.MotivoPausa=mpPausaFimTempo then 
    rbContinuar.Checked := True;
  EncerrarAuto;
  AjustaOpcao;
  if FrmPri.MotivoPausa=mpPausaFimTempo then 
    edSenha.SetFocus;
end;

procedure TFrmPausa.rbContinuarClick(Sender: TObject);
begin
  AjustaOpcao;
  edSenha.SetFocus;
end;

procedure TFrmPausa.rbEncerrarClick(Sender: TObject);
begin
  AjustaOpcao;
end;

procedure TFrmPausa.edSenhaPropertiesChange(Sender: TObject);
begin
  panErro.Visible := False;
  TimerTempoRes.Enabled := False;
  PB.Visible := False;
  Timer1.Enabled := False;
  Timer1.Enabled := FecharAuto;
end;

procedure TFrmPausa.Timer1Timer(Sender: TObject);
begin
  FInicio := GetTickCount;
  PB.Position := 0;
  PB.Visible := (TempoFechar>1) and FecharAuto;
  TimerTempoRes.Enabled := True;
  Timer1.Enabled := False;
end;

procedure TFrmPausa.Timer2Timer(Sender: TObject);
var T: Cardinal;
begin
  if not Visible then begin
    Timer2.Enabled := False;
    Exit;
  end;
  
  T := GetTickCount;
  if FrmPri.MotivoPausa<>mpPausaEncerrar then begin
    Timer2.Enabled := False;
    FFim := 0;
    Exit;
  end;
  if (FFim>0) and (T>=FFim) then begin
    FFim := 0;
    DebugMsgEsp('TFrmPausa.Timer2Timer - FFim: '+IntToStr(FFim), False, False);
    Timer2.Enabled := False;
    btnSimClick(nil);
  end else
    pbEncerrar.Position := 30000 - (FFim - T);
end;

procedure TFrmPausa.FormHide(Sender: TObject);
begin
  FFim := 0;
  edSenha.Clear;
  FecharAuto := False;
  Timer2.Enabled := False;
  Timer4.Enabled := False;
  TimerTempoRes.Enabled := False;
  Timer1.Enabled := False;
end;

procedure TFrmPausa.FormResize(Sender: TObject);
begin
  AjustaTamanho;
end;

procedure TFrmPausa.EncerrarAuto;
var S : TncSessao;
begin
  TimerTempoRes.Enabled := False;
  FecharAuto := False;
  if FrmPri.MotivoPausa<>mpPausaFimTempo then 
    Timer1.Enabled := False
  else begin
    FInicio := GetTickCount;
    Timer1.Enabled := False;
    S := FrmPri.CM.SessaoMaq;
    if (S<>nil) and S.CartaoTempo then begin
      TempoFechar := FrmPri.CM.Config.TempoECartao;
      PB.Properties.Max := TempoFechar*1000;
      FecharAuto := (FrmPri.CM.Config.EncerramentoCartao=eppEncerrarAcesso);
    end else begin
      TempoFechar := FrmPri.CM.Config.TempoEPrePago;
      PB.Properties.Max := TempoFechar*1000;
      FecharAuto := (FrmPri.CM.Config.EncerramentoPrePago=eppEncerrarAcesso);
    end;
    PB.Visible := (TempoFechar>1) and FecharAuto;
    if FecharAuto then Timer1Timer(nil);
  end;  
end;

initialization
  FrmPausa := nil;

end.
