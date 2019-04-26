unit ncgFrmFST;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncgFormBase, cxPCdxBarPopupMenu, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxPC, ExtCtrls;

type
  TFrmFST = class(TFormBaseGuard)
    Paginas: TcxPageControl;
    TimerOnTop: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure TimerOnTopTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PaginasChange(Sender: TObject);
    procedure PaginasPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure FormResize(Sender: TObject);
  private
    TicksVisible : Cardinal;
    
    function GetForm: TFormBaseGuard;
    procedure SetForm(const Value: TFormBaseGuard);
    function GetFormIndex(aForm: TFormBaseGuard): Integer;
    { Private declarations }
  protected 
    procedure ForceTop(F: TFormBaseGuard); virtual;
      
  public
    function AddForm(aForm: TFormBaseGuard; aWinControl: TWinControl): Integer;
    { Public declarations }
    property ActiveForm: TFormBaseGuard
      read GetForm write SetForm;
  end;

var
  FrmFST: TFrmFST;

implementation

uses ncgFrmPri, ncgPrevLogoff;

{$R *.dfm}

{ TFrmFST }

function TFrmFST.AddForm(aForm: TFormBaseGuard; aWinControl: TWinControl): Integer;
var 
  I: Integer;
  T: TcxTabSheet;
begin
  Result := GetFormIndex(aForm);
  if Result>=0 then Exit;
  T := TcxTabSheet.Create(Self);
  T.PageControl := Paginas;
  T.Tag := Integer(aForm);
  aWinControl.Parent := T;
end;

procedure TFrmFST.ForceTop(F: TFormBaseGuard);
var H : HWND;
begin
  if FrmPri.StayOnTopOFF or ((F<>nil) and F.DontForceForeground and Application.Active) then Exit;
  
  ForceForegroundWindow(Handle, 'TFrmFST.ForceTop: '+Name);
  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, (SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE));
  H := GetForeGroundWindow;
  ShowWindow(Handle, SW_SHOW);
    
  if (H <> Handle) and (H <> FindWindow('Shell_TrayWnd', nil)) and ((GetTickCount-TicksVisible)<6000) then begin
    keybd_event(VK_LWIN, Mapvirtualkey(VK_LWIN, 0), 0, 0);
    keybd_event(VK_LWIN, Mapvirtualkey(VK_LWIN, 0), KEYEVENTF_KEYUP, 0);
    keybd_event(VK_CONTROL, Mapvirtualkey(VK_CONTROL, 0), 0, 0);
    keybd_event(VK_ESCAPE, Mapvirtualkey(VK_ESCAPE, 0), 0, 0);
    keybd_event(VK_ESCAPE, Mapvirtualkey(VK_ESCAPE, 0), KEYEVENTF_KEYUP, 0);
    keybd_event(VK_CONTROL, Mapvirtualkey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0);
    SetForegroundWindow(Handle);
  end;
end;

procedure TFrmFST.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  CanClose := False;
  PrevLogoff;
end;

procedure TFrmFST.FormCreate(Sender: TObject);
begin
  inherited;
  BorderStyle := bsNone;
  TicksVisible := 0;
  Left := 0;
  Top := 0;
  Width := Screen.Width;
  Height := Screen.Height;  
end;

procedure TFrmFST.FormHide(Sender: TObject);
begin
  inherited;
  TimerOnTop.Enabled := False;

  if (ActiveForm<>nil) and Assigned(ActiveForm.OnHide) then
    ActiveForm.OnHide(nil);
end;

procedure TFrmFST.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (ActiveForm<>nil) and Assigned(ActiveForm.OnKeyDown) then
    ActiveForm.OnKeyDown(nil, Key, Shift);
end;

procedure TFrmFST.FormResize(Sender: TObject);
begin
  inherited;
  if Visible and (ActiveForm<>nil) and Assigned(ActiveForm.OnResize) then
    ActiveForm.OnResize(nil);
end;

procedure TFrmFST.FormShow(Sender: TObject);
begin
  inherited;
  TimerOnTop.Enabled := True;
  TicksVisible := GetTickCount;
  
  if (ActiveForm<>nil) and Assigned(ActiveForm.OnShow) then
    ActiveForm.OnShow(nil);
end;

function TFrmFST.GetForm: TFormBaseGuard;
begin
  Result := TFormBaseGuard(Paginas.ActivePage.Tag);
end;

function TFrmFST.GetFormIndex(aForm: TFormBaseGuard): Integer;
begin
  for Result := 0 to Paginas.PageCount-1 do
    if TFormBaseGuard(Paginas.Pages[Result].Tag)=aForm then Exit;
  Result := -1;
end;

procedure TFrmFST.PaginasChange(Sender: TObject);
begin
  inherited;
  if Visible and (ActiveForm<>nil) and Assigned(ActiveForm.OnShow) then
    ActiveForm.OnShow(nil);
end;

procedure TFrmFST.PaginasPageChanging(Sender: TObject; NewPage: TcxTabSheet;
  var AllowChange: Boolean);
begin
  inherited;
  AllowChange := True;
  if Visible and (ActiveForm<>nil) and Assigned(ActiveForm.OnHide) then
    ActiveForm.OnHide(nil);
end;

procedure TFrmFST.SetForm(const Value: TFormBaseGuard);
var I : Integer;
begin
  I := GetFormIndex(Value);
  Paginas.ActivePageIndex := I;
end;

procedure TFrmFST.TimerOnTopTimer(Sender: TObject);
var 
  H: HWND;
  F: TFormBaseGuard;
begin
  inherited;
  if not Visible then Exit;

  Left := 0;
  Top := 0;
  Width := Screen.Width;
  Height := Screen.Height;  

  F := ActiveForm;
  
  try
    if F<>nil then F.OnTimerTop;
  except
  end;

  if Visible and (F=ActiveForm) then
    ForceTop(F);
end;

end.
