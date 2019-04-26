unit ncgFrmAviso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, LMDControl, LMDBaseControl, LMDBaseGraphicControl,
  LMDBaseLabel, LMDCustomLabel, LMDLabel, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, ncgAppBar;

type
  TFrmAviso = class(TForm)
    panMsg: TLMDSimplePanel;
    lbTempo: TLMDLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    lbTam: TLMDLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FPiscar: Boolean;
  public
    procedure Esconde;
    procedure Mostrar(S: String; TempoS: Integer; aPiscar: Boolean);
    procedure CreateParams(var Params: TCreateParams); override;    
    { Public declarations }
  end;

var
  FrmAviso: TFrmAviso;

implementation

uses ncgFrmPri, ncDebug;

{$R *.dfm}

procedure TFrmAviso.Timer1Timer(Sender: TObject);
begin
  if not Visible then Exit;

  if FrmPri.Status <> sgSessao then begin
    Hide;
    Exit;
  end;
    
  if FPiscar then
  if panMsg.Bevel.BorderColor = clBlack then
    panMsg.Bevel.BorderColor := clYellow
  else
    panMsg.Bevel.BorderColor := clBlack;  
  FormStyle := fsNormal;
  FormStyle := fsStayOnTop;   
  BringWindowToTop(Handle);
  BringWindowToTop(Handle);
  BringWindowToTop(Handle);
//  ShowWindow(Handle, SW_SHOW);
  Top := 31;
end;

procedure TFrmAviso.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := Fechar;
end;

procedure TFrmAviso.FormCreate(Sender: TObject);
begin
  Width := panMsg.Width;
  Height := panMsg.Height;
  Left := (Screen.Width - Width) div 2;
  Top := 31;
end;

procedure TFrmAviso.Timer2Timer(Sender: TObject);
begin
  Esconde;
end;

procedure TFrmAviso.Mostrar(S: String; TempoS: Integer; aPiscar: Boolean);
begin
  Timer2.Interval := TempoS * 1000;
  Timer1.Enabled := True;
  Timer2.Enabled := False;
  Timer2.Enabled := True;
  lbTam.Caption := '  '+S+'  ';
  if lbTam.Width > 600 then
    Width := 500 
  else
  if lbTam.Width < 300 then
    Width := 300
  else
    Width := lbTam.Width;  
    
  Height := panMsg.Height;
  Left := (Screen.Width - Width) div 2;
  lbTempo.Caption := S;
  FPiscar := aPiscar;
  Show;
end;

procedure TFrmAviso.CreateParams(var Params: TCreateParams);
begin
  inherited;
   Params.Style := WS_POPUP; // ??? (seems to work)
   Params.ExStyle := WS_EX_TRANSPARENT or WS_EX_TOOLWINDOW or WS_EX_TOPMOST;
end;

procedure TFrmAviso.Esconde;
begin
  Timer1.Enabled := False;
  Timer2.Enabled := False;
  Hide;
end;

end.
