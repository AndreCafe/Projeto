unit uCMGPausa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, jpeg, LMDGraphicControl, LMDFill,
  LMDControl, LMDBaseControl, LMDBaseGraphicControl, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, dxBar, dxBarExtItems, LMDCustomSimpleLabel,
  LMDSimpleLabel;

type
  TFrmPausa = class(TForm)
    Timer4: TTimer;
    BarMgr: TdxBarManager;
    lbMotivo: TLMDLabel;
    LMDFill1: TLMDFill;
    cmConfigurar: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmConfigurarClick(Sender: TObject);
  private
    { Private declarations }
    FPodeFechar: Boolean;
    FBar : TdxBar;
  public
    procedure Congela;
    procedure Fechar;
    { Public declarations }
  end;

var
  FrmPausa: TFrmPausa;

implementation

uses uCMGPri;

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
  lbMotivo.Caption := FrmPri.FMotivoPausa;
  FBar := BarMgr.BarByName('BarNoNet');
end;

procedure TFrmPausa.Timer4Timer(Sender: TObject);
var H : HWND;
begin
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

initialization
  FrmPausa := nil;
  
end.
