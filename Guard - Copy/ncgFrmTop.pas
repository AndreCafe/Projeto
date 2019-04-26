unit ncgFrmTop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncgAppBar, ExtCtrls, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrmTopB = class(TAppBar)
    Timer1: TTimer;
    panTop: TLMDSimplePanel;
    panCred: TLMDSimplePanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FFirst : Boolean;
    procedure RefreshRestr;
  public
    procedure OnRecreate(sender: Tobject);
    procedure TaskbarRecreated;

    { Public declarations }
  end;

  procedure ShowTop;
  procedure HideTop;

var
  FrmTopB: TFrmTopB = nil;

implementation

uses ncgFrmPri, ncgFrmYAD, ncgFrmSenha, ncDebug;

{$R *.dfm}

{ TFrmTop }

procedure TFrmTopB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmTopB.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;
end;

procedure TFrmTopB.FormCreate(Sender: TObject);
begin
  FFirst := True;
  VertDockSize := 30;
  Height := 30;
end;

procedure TFrmTopB.FormShow(Sender: TObject);
begin
  FFirst := False;
  FrmPri.panBar.Parent := panTop;
  FrmPri.panCredRestr.Parent := panCred;
  FrmPri.RefreshToolbar;

  AlwaysOnTop := True;
  RefreshRestr;
  AutoHide := False;
  Flags := [abfAllowTop];
  SlideEffect := False;
  Edge := abeTop;
end;

procedure TFrmTopB.OnRecreate(sender: Tobject);
begin
  Top := 0;
  Left := 0;
  Width := Screen.Width;
  try
    if FrmPri.FullAppOpen or Assigned(FrmAlteraSenha) or (FrmPri.Status<>sgSessao) then Exit;
    DebugMsg('TFrmTopB.OnRecreate');
    appBarMessage2(abmNew, abeTop);
    AlwaysOnTop := True;
    RefreshRestr;
    VertSizeInc := 0;
    HorzSizeInc := 0;
    AutoHide := False;
    Flags := [abfAllowTop];
    SlideEffect := False;
    Edge := abeTop;
    UpdateBar;
  finally
    if Sender<>nil then
      Sender.Free;
  end;
end;

procedure TFrmTopB.RefreshRestr;
begin
  panCred.Visible := FrmPri.panCredRestr.Visible;
  if panCred.Visible then begin
    VertDockSize := 49;
    Height := 49;
  end else begin
    VertDockSize := 30;
    Height := 30;
  end;
end;

procedure TFrmTopB.TaskbarRecreated;
begin
  with TTimer.Create(Self) do begin
    Interval := 250;
    OnTimer := OnRecreate;
    Enabled := True;
  end;
end;

procedure TFrmTopB.Timer1Timer(Sender: TObject);
begin
  TaskbarRecreated;
  if Assigned(FrmYAD) then
    FrmYAD.RecreateAppBar;
end;

procedure ShowTop;
begin
  try
    if not Assigned(FrmTopB) then begin
      FrmTopB := TFrmTopB.Create(nil);
      FrmTopB.Show;
    end;
  except
  end;
end;

procedure HideTop;
begin
  try
{    FrmTopB.Flags := [abfAllowFloat];
    FrmTopB.Edge := abeFloat;
    FrmTopB.Hide;}
    if Assigned(FrmTopB) then begin
      FrmPri.panBar.Parent := FrmPri;
      FrmPri.panCredRestr.Parent := FrmPri;
      FreeAndNil(FrmTopB);
    end;
  except
  end;
end;


end.
