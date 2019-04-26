unit ncgFrmYAD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, OleCtrls, SHDocVw_EWB, EmbeddedWB,
  EwbCore, ImgList, cxGraphics, dxBar, cxClasses, Buttons, 
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDCustomPanelFill, LMDPanelFill, cxControls,
  cxContainer, cxEdit, cxLabel, LMDSimplePanel, ncgAppBar, cxLookAndFeels,
  cxLookAndFeelPainters, ncgFormBase, madKernel;

type
  TFrmYAD = class(TForm)
    dxBarManager1: TdxBarManager;
    cxImageList1: TcxImageList;
    panBanner: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    Timer3: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure Center;

    procedure OnChangeADSize(Sender: TObject);
  public
    { Public declarations }
  end;

  procedure ShowYAD;

  procedure HideYAD;

var
  FrmYAD: TFrmYAD = nil;
  posYAD : Integer = 0;

implementation

uses ncgFrmPri, ncgFrmSenha, ncDebug, ncClassesBase, ncShellStart, DateUtils,
  ncSessao, ncgLimiteTela, ncgPrevLogoff, ncFrmPrintReview, ncgFrmExpYAD,
  nexUrls;

{$R *.dfm}

procedure TFrmYAD.Center;
begin
  panBanner.Top := (Height - panBanner.Height) div 2;
  posYAD := panBanner.Top + Top + 32;
end;

procedure TFrmYAD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caNone;
end;

procedure TFrmYAD.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;
  PrevLogoff;
end;

procedure TFrmYAD.FormCreate(Sender: TObject);
var sl : TStrings;
begin
  DebugMsg('YAD - FormCreate');
  gRemWidth := gUrls.SkyWidth(Screen.Width)+3;
  DebugMsg('TFrmYAD.FormCreate - gRemWidth: ' + IntToStr(gRemWidth));
  StartLimiteTela(1500);
  panBanner.Top := (Screen.WorkAreaHeight-panBanner.Top) div 2;
end;

procedure TFrmYAD.FormDestroy(Sender: TObject);
begin
  DestroiExpYAD;
  StopLimiteTela;
end;

procedure TFrmYAD.FormHide(Sender: TObject);
begin
  StopLimiteTela;
end;

procedure TFrmYAD.FormResize(Sender: TObject);
begin
  Center;
end;

procedure TFrmYAD.FormShow(Sender: TObject);
var 
  S: String;
  W: Integer;
begin
  CriaExpYAD;
  FrmExpYAD.OnChangeADSize := Self.OnChangeADSize;
  Timer3.Enabled := True;

  if Assigned(FrmExpYAD) then 
    W := FrmExpYAD.adWidth else
    W := gUrls.SkyWidth(Screen.Width);

  Width := W + 3;
  panBanner.Width := W;
    
  Height := Screen.WorkAreaHeight;
  Left := Screen.WorkAreaWidth-Width;
end;

procedure TFrmYAD.OnChangeADSize(Sender: TObject);
var W: Integer;
begin
  if Assigned(FrmExpYAD) then begin
    W := FrmExpYAD.adWidth;
    Width := W + 3;
    panBanner.Width := W;
    Left := Screen.WorkAreaWidth-Width;
  end;
end;

function FullWindow: Boolean;
var I, scw, sch : Integer;
  W : IWindow;
  R : TRect;
begin
  Result := False;
  W := ForegroundWindow;
  if W=nil then Exit;
  Result := True;
  scw := Screen.Width;
  sch := Screen.Height;
  with W do 
  if (not SameText(ClassName, 'ProgMan')) and (not SameText(ClassName, 'TFRMCONN')) then begin
    R := GetRect;
    if ((R.Right-R.Left)>=scw) and
       ((R.Bottom-R.Top)>=sch) then Exit;
  end;
  Result := False;
end;  

procedure TFrmYAD.Timer3Timer(Sender: TObject);
var W: Integer;
begin
  timer3.enabled := False;
  try
    if FullWindow or (not Visible) then Exit;

    if Assigned(FrmExpYAD) then 
      W := FrmExpYAD.adWidth else
      W := gUrls.SkyWidth(Screen.Width);

    Width := W+3;
    panBanner.Width := W;
    
    Height := Screen.WorkAreaHeight;
    Left := Screen.WorkAreaWidth-Width;
    Top := Screen.WorkAreaTop;
    Center;
  finally
    timer3.interval := 10000;
    timer3.Enabled := True;
  end;
end;

procedure ShowYAD;
begin
  try
    debugMsg('ShowYAD');
    if not Assigned(FrmYAD) then begin
      DebugMsg('YAD not assigned');
      FrmYAD := TFrmYAD.Create(nil);
    end;

    FrmYAD.Show;
  except
    on E: Exception do 
      DebugMsg('YAD exception: ' + E.Message);
  end;
end;

procedure HideYAD;
begin
  try
    debugMsg('HideYAD');
  
    FrmYAD.Hide;
    if Assigned(FrmYAD) then FreeAndNil(FrmYAD);
  except
  end;
end;

end.
