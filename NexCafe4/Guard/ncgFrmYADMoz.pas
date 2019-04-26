unit ncgFrmYADMoz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, OleCtrls, 
  EwbCore, ImgList, cxGraphics, dxBar, cxClasses, Buttons, PngSpeedButton,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDCustomPanelFill, LMDPanelFill, cxControls,
  cxContainer, cxEdit, cxLabel, LMDSimplePanel, ncgAppBar, MOZILLACONTROLLib_TLB;

type
  TFrmYAD = class(TAppBar)
    Timer1: TTimer;
    dxBarManager1: TdxBarManager;
    cxImageList1: TcxImageList;
    panBanner: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    Timer2: TTimer;
    panSky: TLMDSimplePanel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure WBNavigateError(ASender: TObject; const pDisp: IDispatch; var URL,
      Frame, StatusCode: OleVariant; var Cancel: WordBool);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
    Moz1, Moz2 : TMozillaBrowser;
  protected
    procedure OnRecreate(Sender: TObject);
    procedure OnTimerHide(Sender: TObject);
    procedure OnTimerShow(Sender: TObject);
    procedure Center;

    procedure Navigate;

    procedure CriaMoz;

     procedure NewWindow2(ASender: TObject; var ppDisp: IDispatch;
      var Cancel: WordBool);
      
    procedure BeforeNavigate2(ASender: TObject; const pDisp: IDispatch;
      var URL, Flags, TargetFrameName, PostData, Headers: OleVariant;
      var Cancel: WordBool);
    
  public
    function GetDefDockSize: Integer; override;
  
    procedure RecreateAppBar;
    { Public declarations }
  end;

  procedure ShowYAD;

  procedure HideYAD;

var
  FrmYAD: TFrmYAD;

const
  sHTML : String = 
  '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">' +
'<html xmlns="http://www.w3.org/1999/xhtml">' +
'<head>' +
'<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />' +
'<title>Untitled Document</title>' +
'<style type="text/css">' +
'<!--' +
'.style2 {color: #333333}' +
'.style3 {color: #666666}' +
'-->' +
'</style>' +
'</head>' +
'<body style="margin: 0px 0px 0px 0px;">' +
'<!-- BEGIN STANDARD TAG - 120 x 600 - Nextar: Run-of-site - DO NOT MODIFY -->' +
'<IFRAME FRAMEBORDER=0 MARGINWIDTH=0 MARGINHEIGHT=0 SCROLLING=NO WIDTH=120 HEIGHT=600 SRC="http://ad.yieldmanager.com/st?ad_type=iframe&ad_size=120x600&section=716452"></IFRAME>' +
'<!-- END TAG -->' +
'</body>' +
'</html>';

implementation

uses ncgFrmPri, ncgFrmSenha, ncDebug, uDMMoz, ncShellStart;

{$R *.dfm}


function HTMLfilename: String;
begin
  Result := ExtractFilePAth(ParamStr(0))+'yad_sky.html';
end;

function HTMLSite: String;
begin
//  Result := 'http://ad.nextar.com.br';
  Result := 'http://ad.yieldmanager.com/st?ad_type=iframe&ad_size=120x600&section=716452';
end;

procedure TFrmYAD.BeforeNavigate2(ASender: TObject; const pDisp: IDispatch;
  var URL, Flags, TargetFrameName, PostData, Headers: OleVariant;
  var Cancel: WordBool);
begin
  ShellStart(URL);
  Cancel := True;
end;

procedure TFrmYAD.Center;
begin
  panBanner.Top := (Height - panBanner.Height) div 2;
end;

procedure TFrmYAD.FormCreate(Sender: TObject);
var sl : TStrings;
begin
  Moz1 := nil;
  Moz2 := nil;
  DiscardFull := True;
  
  sl := TStringList.Create;
  try
    sl.Text := sHTML;
    sl.SaveToFile(HTMLfilename);
  finally
    sl.Free;
  end;
end;

procedure TFrmYAD.FormResize(Sender: TObject);
begin
  Center;
end;

procedure TFrmYAD.FormShow(Sender: TObject);
var S: String;
begin
  DiscardFull := False;
  AlwaysOntop := True;
  HorzDockSize := 123;
  Width := 123;
  HorzSizeInc := 0;
  Height := Screen.Height - 60;
  AutoHide := False;
  Flags := [abfAllowRight];
  SlideEffect := False;
  Edge := abeRight;
  Center;
  Navigate;
end;

function TFrmYAD.GetDefDockSize: Integer;
begin
  REsult := 123;
end;

procedure TFrmYAD.Navigate;
begin
  try
    CriaMoz;
    if Assigned(Moz1) then
      Moz1.Navigate(HTMLSite); 
  except
    Timer1.Enabled := True;
  end;
end;

procedure TFrmYAD.NewWindow2(ASender: TObject; var ppDisp: IDispatch;
  var Cancel: WordBool);
begin
  if Assigned(Moz2) then begin
    ppDisp := Moz2.ControlInterface;
    Moz2.OnBeforeNavigate2 := BeforeNavigate2;
  end;
end;

procedure TFrmYAD.OnRecreate(Sender: TObject);
begin
  if FrmPri.FullAppOpen or Assigned(FrmAlteraSenha) or (FrmPri.Status <> sgSessao) then Exit;
  
  try
    DebugMsg('TFrmYAD.OnRecreate');
    appBarMessage1(abmNew);
    HorzDockSize := 123;
    Width := 123;
    HorzSizeInc := 0;
    AutoHide := False;
    SlideEffect := False;
    if FrmPri.doShowAD then begin
      AlwaysOnTop := False;
      Flags := [abfAllowRight];
      Edge := abeRight;
      with TTimer.Create(Self) do begin
        Interval := 50;
        Enabled := True;
        OnTimer := OnTimerHide;
      end;
    end else begin
      AlwaysOnTop := False;
      Flags := [abfAllowFloat, abfAllowRight];
      Edge := abeFloat;
    end;
//    UpdateBar;
  finally
    Sender.Free;
  end;
end;

procedure TFrmYAD.OnTimerHide(Sender: TObject);
begin
  try
    AlwaysOnTop := True;
    UpdateBar;
{    HideYAD;
    if FrmPri.doShowAD then
      with TTimer.Create(Self) do begin
        Interval := 2000;
        OnTimer := OnTimerShow;
        Enabled := True;
      end;}
  finally
    Sender.Free;
  end;
end;

procedure TFrmYAD.OnTimerShow(Sender: TObject);
begin
  try
    ShowYAD;
  finally
    Sender.Free;
  end;
end;

procedure TFrmYAD.RecreateAppBar;
begin
  with TTimer.Create(Self) do begin
    Interval := 250;
    Enabled := True;
    OnTimer := OnRecreate;
  end;
end;

procedure TFrmYAD.CriaMoz;
begin
  if Moz1<>nil then FreeAndNil(Moz1);
  if Moz2=nil then begin
    Moz2 := CreateMoz(Self, panSky.Handle);
    Moz2.Left := 30;
    Moz2.Top := 30;
    Moz2.Height := 30;
    Moz2.Width := 30;
    Moz2.Silent := True;
    Moz2.OnBeforeNavigate2 := BeforeNavigate2;
  end;
  if Moz2<>nil then
  if Moz1=nil then begin
    Moz1 := CreateMoz(Self, panSky.Handle);
    Moz1.Left := -8;
    Moz1.Top := -8;
    Moz1.Width := 130;
    Moz1.Height := 610;
    Moz1.Silent := True;
    Moz1.OnNewWindow2 := NewWindow2;
    Moz1.BringToFront;
  end;
end;

procedure TFrmYAD.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer2.Enabled := False;
  Timer2.Enabled := True;
  Navigate;
end;

procedure TFrmYAD.Timer2Timer(Sender: TObject);
begin
  Navigate;
end;

procedure TFrmYAD.WBNavigateError(ASender: TObject; const pDisp: IDispatch;
  var URL, Frame, StatusCode: OleVariant; var Cancel: WordBool);
begin
  Timer1.Enabled := True;
  Cancel := False;
end;

procedure ShowYAD;
begin
  try
    if not Assigned(FrmYAD) then
      FrmYAD := TFrmYAD.Create(nil);

    FrmYAD.Show;
    FrmYAD.HorzDockSize := 123;
    FrmYAD.Width := 123;
    FrmYAD.AlwaysOnTop := True;
    with TTimer.Create(nil) do begin
      Interval := 100;
      Enabled := True;
      OnTimer := FrmYAD.OnTimerHide;
    end;
  except
  end;
end;

procedure HideYAD;
begin
  try
    FrmYAD.Flags := [abfAllowFloat];
    FrmYAD.Edge := abeFloat;
    FrmYAD.Hide;
    if Assigned(FrmYAD) then FreeAndNil(FrmYAD);
  except
  end;
end;

end.
