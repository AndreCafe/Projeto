unit ncFrmMsgCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxLabel, LMDPNGImage, ExtCtrls, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, Menus,
  cxLookAndFeelPainters, cxButtons, cxGraphics, cxLookAndFeels;

type
  TFrmMsgCli = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    Image1: TImage;
    LMDSimplePanel1: TLMDSimplePanel;
    panBtn: TLMDSimplePanel;
    btnOk: TcxButton;
    lbTexto: TcxLabel;
    lbTit: TcxLabel;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer2Timer(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FAtivo : Boolean;
    procedure SetAtivo(const Value: Boolean);
    { Private declarations }
  public
    procedure AtualizaTela;

    property Ativo: Boolean
      read FAtivo write SetAtivo;
    { Public declarations }
  end;

var
  FrmMsgCli: TFrmMsgCli;

implementation

uses ncgFrmPri, ncClassesBase, ncSessao, ncMsgCli;

{$R *.dfm}

procedure TFrmMsgCli.AtualizaTela;
var 
  S : TncSessao;
  M : TncMsgCli;
begin
  S := FrmPri.CM.SessaoMaq;
  if (S<>nil) and (S.MsgCliList.Count>0) then
    M := S.MsgCliList[0] else
    M := nil;
    
  if (M=nil) then begin
    Caption := '';
    lbTit.Caption := '';
    lbTexto.Caption := '';
  end else begin
    Caption := M.Titulo;
    lbTit.Caption := M.Titulo;
    lbTexto.Caption := gConfig.FidMsgTexto;
  end;
end;

procedure TFrmMsgCli.btnOkClick(Sender: TObject);
var 
  S : TncSessao;
begin
  with FrmPri.CM do begin
    S := SessaoMaq;
    if (S<>nil) and (S.MsgCliList.Count>0) then
      try ApagaMsgCli(S.MsgCliList[0].ID); except end;
  end;
end;

procedure TFrmMsgCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled := False;
  Timer2.Enabled := False;
  FAtivo := False;
//  FrmShade.AlphaBlendValue := 0;
//  AlphaBlend := True;
end;

procedure TFrmMsgCli.FormCreate(Sender: TObject);
begin
  FAtivo := False;
end;

procedure TFrmMsgCli.FormHide(Sender: TObject);
begin
  FAtivo := False;
  Timer1.Enabled := False;
end;

procedure TFrmMsgCli.FormShow(Sender: TObject);
begin
  AtualizaTela;
  Timer1.Enabled := True;
end;

procedure TFrmMsgCli.SetAtivo(const Value: Boolean);
begin
  if Value=FAtivo then Exit;
  Timer1.Enabled := Value;
  FAtivo := Value;
  if Value then 
    Show else
    Hide;
end;

procedure TFrmMsgCli.Timer1Timer(Sender: TObject);
var H : HWND;
begin
  if not FrmPri.CM.Ativo then Hide;
  if not Visible then Exit;
  
  Height := panBtn.Top + panBtn.Height + 45;  
  if Height<265 then Height := 265;

  ForceForegroundWindow(Handle);
  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, (SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE));
  if AlphaBlend then 
    Timer2.Enabled := True;
{  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, (SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE));
  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, (SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE));
  BringWindowToTop(Handle); // IE 5.5 related hack}

//  ForceForegroundWindow(Handle);

//  ForceForegroundWindow(Handle);
end;

procedure TFrmMsgCli.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
//  FrmShade.AlphaBlendValue := 200;
//  AlphaBlend := False;
end;

end.
