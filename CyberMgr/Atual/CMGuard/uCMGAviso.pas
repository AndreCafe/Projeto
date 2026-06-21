unit uCMGAviso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, LMDControl, LMDBaseControl, LMDBaseGraphicControl,
  LMDBaseLabel, LMDCustomLabel, LMDLabel, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrmAviso = class(TForm)
    panMsg: TLMDSimplePanel;
    lbTempo: TLMDLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    procedure Mostrar(S: String; TempoS: Integer);
    { Public declarations }
  end;

var
  FrmAviso: TFrmAviso;

implementation

uses uCMGPri;

{$R *.dfm}

procedure TFrmAviso.Timer1Timer(Sender: TObject);
begin
  if FrmPri.Status <> stCliUsando then begin
    Close;
    Exit;
  end;
    
  if panMsg.Bevel.BorderColor = clBlack then
    panMsg.Bevel.BorderColor := clYellow
  else
    panMsg.Bevel.BorderColor := clBlack;  
  BringWindowToTop(Handle);
  ShowWindow(Handle, SW_SHOW);
end;

procedure TFrmAviso.FormCreate(Sender: TObject);
begin
  Width := panMsg.Width;
  Height := panMsg.Height;
  Left := (Screen.Width - Width) div 2;
  Top := 0;
end;

procedure TFrmAviso.Timer2Timer(Sender: TObject);
begin
  Close;
end;

procedure TFrmAviso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmAviso.Mostrar(S: String; TempoS: Integer);
begin
  Timer2.Interval := TempoS * 1000;
  lbTempo.Caption := S;
  Show;
end;

end.
