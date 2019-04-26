unit ncFrmImp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxLabel, LMDPNGImage, ExtCtrls, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, Menus,
  cxLookAndFeelPainters, cxButtons, cxGraphics, cxLookAndFeels;

type
  TFrmImp = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    Image1: TImage;
    LMDSimplePanel1: TLMDSimplePanel;
    panBtn: TLMDSimplePanel;
    btnNao: TcxButton;
    btnSim: TcxButton;
    lbObs: TcxLabel;
    panCusto: TLMDSimplePanel;
    panQuant: TLMDSimplePanel;
    lbConf: TcxLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    lbCusto: TcxLabel;
    Image3: TImage;
    LMDSimplePanel3: TLMDSimplePanel;
    lbQuant: TcxLabel;
    Image2: TImage;
    procedure btnSimClick(Sender: TObject);
    procedure btnNaoClick(Sender: TObject);
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
  FrmImp: TFrmImp;

implementation

uses ncgFrmPri, ncClassesBase, ncSessao, ncJob;     

{$R *.dfm}

procedure TFrmImp.AtualizaTela;
var J : TncJob;
begin
  with FrmPri.CM do J := Jobs.JobPendMaq(Maquina, True);
{  panBtn.Top := 1600;
  lbObs.Top := 1200;
  panCusto.Top := 800;
  panQuant.Top := 400;
  lbConf.Top := 0;}
  if J=nil then begin
    lbQuant.Caption := '';
    lbCusto.Caption := '';
    panCusto.Visible := False;
    panQuant.Visible := False;
  end else begin
    if J.PaginasReg=1 then
      lbQuant.Caption := '1 página' else
      lbQuant.Caption := IntToStr(J.PaginasReg) + ' páginas';
    panQuant.Visible := gConfig.PMMostrarPaginasCli;
    panCusto.Visible := gConfig.PMMostrarValorCli;
    lbObs.Caption := gConfig.PMObsValorCli;
    lbObs.Visible := (Trim(gConfig.PMObsValorCli)>'');

    if gConfig.PMMostrarValorCli then
      lbCusto.Caption := gConfig.GetPMValorCaption(J.PaginasReg) else
      lbCusto.Caption := '';

    Height := panBtn.Top + panBtn.Height + 45;  
    if Height<265 then Height := 265;
  end;
end;

procedure TFrmImp.btnNaoClick(Sender: TObject);
var J : TncJob;
begin
  with FrmPri.CM do begin
    J := Jobs.JobPendMaq(Maquina, True);
    if (J<>nil) then
      try JobControl(J.PrinterIndex, J.JobID, jc_delete); except end;
  end;
end;

procedure TFrmImp.btnSimClick(Sender: TObject);
var J : TncJob;
begin
  with FrmPri.CM do begin
    J := Jobs.JobPendMaq(Maquina, True);
    if (J<>nil) then
      try JobControl(J.PrinterIndex, J.JobID, jc_resume); except end;
  end;
end;

procedure TFrmImp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled := False;
  Timer2.Enabled := False;
  FAtivo := False;
//  FrmShade.AlphaBlendValue := 0;
//  AlphaBlend := True;
end;

procedure TFrmImp.FormCreate(Sender: TObject);
begin
  FAtivo := False;
end;

procedure TFrmImp.FormHide(Sender: TObject);
begin
  FAtivo := False;
  Timer1.Enabled := False;
end;

procedure TFrmImp.FormShow(Sender: TObject);
begin
  AtualizaTela;
  Timer1.Enabled := True;
end;

procedure TFrmImp.SetAtivo(const Value: Boolean);
begin
  if Value=FAtivo then Exit;
  Timer1.Enabled := Value;
  FAtivo := Value;
  if Value then 
    Show else
    Hide;
end;

procedure TFrmImp.Timer1Timer(Sender: TObject);
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

procedure TFrmImp.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
//  FrmShade.AlphaBlendValue := 200;
//  AlphaBlend := False;
end;

end.
