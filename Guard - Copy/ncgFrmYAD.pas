unit ncgFrmYAD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, OleCtrls, SHDocVw_EWB, EmbeddedWB,
  EwbCore, ImgList, cxGraphics, dxBar, cxClasses, Buttons, PngSpeedButton,
  LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDCustomParentPanel, LMDCustomPanelFill, LMDPanelFill, cxControls,
  cxContainer, cxEdit, cxLabel, LMDSimplePanel, ncgAppBar, cxLookAndFeels,
  cxLookAndFeelPainters;

type
  TFrmYAD = class(TAppBar)
    Timer1: TTimer;
    dxBarManager1: TdxBarManager;
    cxImageList1: TcxImageList;
    panBanner: TLMDSimplePanel;
    WB: TEmbeddedWB;
    cxLabel1: TcxLabel;
    Timer2: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure WBNavigateError(ASender: TObject; const pDisp: IDispatch; var URL,
      Frame, StatusCode: OleVariant; var Cancel: WordBool);
    procedure Timer2Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure WBDocumentComplete(ASender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
  private
    { Private declarations }
  protected
    procedure OnRecreate(Sender: TObject);
    procedure OnTimerHide(Sender: TObject);
    procedure OnTimerShow(Sender: TObject);
    procedure Center;

    procedure Navigate;
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

uses ncgFrmPri, ncgFrmSenha, ncDebug, ncClassesBase, ncShellStart, DateUtils,
  ncSessao;

{$R *.dfm}


function HTMLfilename: String;
begin
  Result := ExtractFilePAth(ParamStr(0))+'yad_sky.html';
end;

function HTMLSite(Sexo: String; DataNasc: TDateTime): String;
begin
                                                                         
//  Result := 'http://ad.nextar.com.br';
  Result := 'http://adserv.nextar.com.br/st?ad_type=iframe&ad_size=120x600&section=716452';
  if Sexo<>'' then
    Result := Result + '&gen='+lowercase(Sexo);
  if DataNasc>0 then
    Result := Result + '&yob='+IntToStr(YearOf(DataNasc));
    
  DebugMsg('HTMLSite - Sexo: ' + lowercase(Sexo) + ' - DataNasc: ' + FormatDateTime('dd/mm/yyyy', DataNasc) + ' - Result: ' + Result);
end;

procedure TFrmYAD.Center;
begin
  panBanner.Top := (Height - panBanner.Height) div 2;
end;

procedure TFrmYAD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caNone;
end;

procedure TFrmYAD.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;
end;

procedure TFrmYAD.FormCreate(Sender: TObject);
var sl : TStrings;
begin
  DiscardFull := True;
  Timer2.Enabled := False;
  Timer2.Interval := gConfig.NormBRT * 1000;
  Timer2.Enabled := True;
  
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
var S: TncSessao;
begin
  try
    S := FrmPri.CM.SessaoMaq;
    if S<>nil then
      WB.Navigate(HTMLSite(S.Sexo, S.DataNasc)); 
  except
    Timer1.Enabled := True;
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

procedure TFrmYAD.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer2.Enabled := False;
  Timer2.Interval := gConfig.NormBRT * 1000;
  Timer2.Enabled := True;
  Navigate;
end;

procedure TFrmYAD.Timer2Timer(Sender: TObject);
begin
  if (gConfig.NormBRT*1000)<>Timer2.Interval then begin
    Timer2.Enabled := False;
    Timer2.Interval := gConfig.NormBRT * 1000;
    Timer2.Enabled := True;
  end;
  
  Navigate;
end;

procedure TFrmYAD.WBDocumentComplete(ASender: TObject; const pDisp: IDispatch;
  var URL: OleVariant);
begin
  try
    WB.OleObject.Document.Body.Style.Margin := '0';
  except
  end;
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
