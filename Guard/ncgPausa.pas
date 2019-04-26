unit ncgPausa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, LMDGraphicControl, LMDFill,
  LMDControl, LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, dxBar, dxBarExtItems, LMDCustomSimpleLabel,
  LMDSimpleLabel, cxLookAndFeelPainters, cxButtons, cxTextEdit, cxLabel,
  cxControls, cxContainer, cxEdit, cxGroupBox, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, Menus;

type
  TFrmPausa = class(TForm)
    Timer4: TTimer;
    BarMgr: TdxBarManager;
    lbMotivo: TLMDLabel;
    LMDFill1: TLMDFill;
    cmConfigurar: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    panMaisTempo: TLMDSimplePanel;
    lbTempoRes: TcxLabel;
    LMDSimplePanel1: TLMDSimplePanel;
    btnOk: TcxButton;
    btnEncerrar: TcxButton;
    edSenha: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    edUsername: TcxTextEdit;
    cxLabel1: TcxLabel;
    TimerTempoRes: TTimer;
    cbErro: TcxGroupBox;
    lbErro: TcxLabel;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmConfigurarClick(Sender: TObject);
    procedure TimerTempoResTimer(Sender: TObject);
    procedure btnEncerrarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edSenhaPropertiesChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    FPodeFechar: Boolean;
    FBar : TdxBar;
    FInicio : Cardinal;
  public
    procedure Congela;
    procedure Fechar;
    { Public declarations }
  end;

var
  FrmPausa: TFrmPausa;

implementation

uses uCMGPri, cmClassesBase;

{$R *.DFM}

{ TFrmConta }

procedure TFrmPausa.Congela;
begin
  ShowModal;
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
  FPodeFechar := False;
  Left := 0;
  Top := 0;
  Width := Screen.Width;
  Height := Screen.Height;
  lbMotivo.Caption := FrmPri.MotivoPausaStr;
  FBar := BarMgr.BarByName('BarNoNet');
  panMaisTempo.Visible := (FrmPri.MotivoPausa = mpFimCred);
  lbTempoRes.Visible := (FrmPri.CM.Config.EncerramentoPrePago=eppEncerrarAcesso);
  FInicio := GetTickCount;
  TimerTempoRes.Enabled := lbTempoRes.Visible;
end;

procedure TFrmPausa.Timer4Timer(Sender: TObject);
var H : HWND;
begin
  if FrmPri.StayOnTopOff then Exit;
  
  FBar.Visible := not FrmPri.CM.Ativo;
  Left := 0;
  Top := 0;
  Width := Screen.Width;
  Height := Screen.Height;
  H := GetForeGroundWindow;
  if (H <> Handle) and (H <> FindWindow('Shell_TrayWnd', nil)) then begin
    keybd_event(VK_LWIN, Mapvirtualkey(VK_LWIN, 0), 0, 0);
    keybd_event(VK_LWIN, Mapvirtualkey(VK_LWIN, 0), KEYEVENTF_KEYUP, 0);
    keybd_event(VK_CONTROL, Mapvirtualkey(VK_CONTROL, 0), 0, 0);
    keybd_event(VK_ESCAPE, Mapvirtualkey(VK_ESCAPE, 0), 0, 0);
    keybd_event(VK_ESCAPE, Mapvirtualkey(VK_ESCAPE, 0), KEYEVENTF_KEYUP, 0);
    keybd_event(VK_CONTROL, Mapvirtualkey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0);
    SetForegroundWindow(Handle);
  end;  
  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, (SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE));
end;

procedure TFrmPausa.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := FPodeFechar;
end;

procedure TFrmPausa.cmConfigurarClick(Sender: TObject);
begin
  FrmPri.cmEncerrarClick(nil);
end;

procedure TFrmPausa.TimerTempoResTimer(Sender: TObject);
var T: Integer;
begin
  T := 60 - ((GetTickCount - FInicio) div 1000);
  if T<0 then T := 0;
  lbTempoRes.Caption := IntToStr(T);
  if T<1 then begin
    btnEncerrarClick(nil);
    TimerTempoRes.Enabled := False;
  end;  
end;

procedure TFrmPausa.btnEncerrarClick(Sender: TObject);
begin
  try
    FrmPri.CM.LogoutMaq(FrmPri.CM.Maquina);
  except
    On E: Exception do begin
      Beep;
      cbErro.Visible := True;
      lbErro.Caption  := E.Message;
    end;  
  end;    
end;

procedure TFrmPausa.btnOkClick(Sender: TObject);
begin
  with FrmPri.CM do
  try
    AdicionaPassaporte(Maquina, UpperCase(edSenha.Text));
  except
    On E: Exception do begin
      Beep;
      cbErro.Visible := True;
      lbErro.Caption  := E.Message;
    end;  
  end;    
end;

procedure TFrmPausa.FormShow(Sender: TObject);
begin
  if panMaisTempo.Visible then edSenha.SetFocus;
end;

procedure TFrmPausa.edSenhaPropertiesChange(Sender: TObject);
begin
  cbErro.Visible := False;
  TimerTempoRes.Enabled := False;
  lbTempoRes.Visible := False;
  Timer1.Enabled := False;
  Timer1.Enabled := True;
end;

procedure TFrmPausa.Timer1Timer(Sender: TObject);
begin
  FInicio := GetTickCount;
  lbTempoRes.Caption := '60';
  lbTempoRes.Visible := True;
  TimerTempoRes.Enabled := True;
end;

initialization
  FrmPausa := nil;

end.
