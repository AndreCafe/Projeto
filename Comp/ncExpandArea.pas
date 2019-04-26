unit ncExpandArea;

interface

uses
  Windows, Messages, Controls, SysUtils, Variants, Classes, Graphics, Forms,
  Dialogs, ExtCtrls;

type   

  TncFrmExpandArea = class;

  TncExpandArea = class
  protected
    FRetractJS : String;
    FInvRects  : Array of TRect;
    FTriggerR  : TRect;
    FExpandR   : TRect;
    FTotalR    : TRect;
    FForm      : TncFrmExpandArea;
    FMouseOver : Boolean;
  public
    constructor Create(aForm: TncFrmExpandArea; 
                       aTriggerR    : TRect;
                       aExpandR     : TRect;
                       aRetractJS   : String;
                       aMouseOver   : Boolean);

    destructor Destroy; override;                   
    
    procedure Expand; virtual;
    procedure Retract; virtual;

    property RetractJS: String 
      read FRetractJS;

    property MouseOver: Boolean
      read FMouseOver;

    function Expanded: Boolean;

    function Hit(X, Y: Integer): Boolean; virtual;
  end;

  TncSkyExpandArea = class ( TncExpandArea )
  public
    function Hit(X, Y: Integer): Boolean; override;
  end;
  

  TncFrmExpandArea = class(TForm)
  private
    { Private declarations }
    FExpandedArea : TncExpandArea;
    FInvPanels : TList;
    FParentHWND : HWND;
    procedure CreateParams(var Params: TCreateParams); override;
    
    procedure SetExpandedArea(const Value: TncExpandArea);

    procedure ClearInvPanels;

  protected
    procedure ExecJS(aJS: String); virtual;
    procedure DoCreate; override;
    procedure DoDestroy; override;
    procedure _Retract; virtual;
    procedure _Expand; virtual;
  public
    RetractR: TRect;
    procedure CreateInvPanel(R: TRect; const aTemporary: Boolean = True);

    property ExpandedArea: TncExpandArea
      read FExpandedArea write SetExpandedArea;  
    
    function Expanded: Boolean;
    { Public declarations }
  end;

  TncExpandAreaList = class
  private
    FExpanded : TncExpandArea;
    FAreas : TList;
    procedure SetExpanded(const Value: TncExpandArea);

  public
    constructor Create; 
    destructor Destroy; override;

    procedure AddArea(A: TncExpandArea);
    procedure RemoveArea(A: TncExpandArea);
    procedure FreeAreaFromForm(F: TncFrmExpandArea);
   

    property Expanded: TncExpandArea
      read FExpanded write SetExpanded;

    procedure HandleMouseMove(X, Y: Integer);
    procedure HandleMouseClick(X, Y: Integer);
  end;

  function RectW(R: TRect): Integer;
  function RectH(R: TRect): Integer;
  function MaxExpPixels: Integer;

var
  ncFrmExpandArea: TncFrmExpandArea;
  gExpandAreaList: TncExpandAreaList;
  gDesktopRect : TRect;

implementation

uses ncDebug;

{$R *.dfm}


function MaxExpPixels: Integer;
begin
  Result := Trunc(RectW(gDesktopRect) * RectH(gDesktopRect) * 0.4);
end;

function RectW(R: TRect): Integer;
begin
  Result := R.Right - R.Left + 1;
end;

function RectH(R: TRect): Integer;
begin
  Result := R.Bottom - R.Top + 1;
end;

{ TncExpandAreaList }

procedure TncExpandAreaList.AddArea(A: TncExpandArea);
begin
  FAreas.Add(A);
end;

constructor TncExpandAreaList.Create;
begin
  FAreas := TList.Create;
  FExpanded := nil;
end;

destructor TncExpandAreaList.Destroy;
begin
  while FAreas.Count>0 do 
    TObject(FAreas[0]).Free;
    
  FAreas.Free;

  inherited;
end;

procedure TncExpandAreaList.FreeAreaFromForm(F: TncFrmExpandArea);
var I : Integer;
begin
  for I := FAreas.Count-1 downto 0 do 
    if TncExpandArea(FAreas[I]).FForm=F then 
      TObject(FAreas[I]).Free;
end;

procedure TncExpandAreaList.HandleMouseClick(X, Y: Integer);
var I : Integer;
begin
  if Assigned(Expanded) then 
  if Expanded.Hit(X, Y) then
    Exit else
    Expanded := nil;

  for I := 0 to FAreas.Count-1 do 
    if TncExpandArea(FAreas[I]).Hit(X, Y) then begin
      Expanded := TncExpandArea(FAreas[I]);
      Exit;
    end;      
end;

procedure TncExpandAreaList.HandleMouseMove(X, Y: Integer);
var I : Integer;
begin
  if Assigned(Expanded) then begin
    if FExpanded.Hit(X, Y) then
      Exit 
    else
    if FExpanded.MouseOver then 
      Expanded := nil;
  end else
    DebugMsg('TncExpandAreaList.HandleMouseMouse: Expanded=nil)');

  for I := 0 to FAreas.Count-1 do 
  with TncExpandArea(FAreas[I]) do 
    if MouseOver and Hit(X, Y) then begin
      Self.Expanded := TncExpandArea(FAreas[I]);
      Exit;
    end;
end;

procedure TncExpandAreaList.RemoveArea(A: TncExpandArea);
begin
  if FExpanded=A then
    FExpanded := nil;
  FAreas.Remove(A);
end;

procedure TncExpandAreaList.SetExpanded(const Value: TncExpandArea);
begin
  if FExpanded=Value then Exit;

  if FExpanded<>nil then FExpanded.Retract;

  FExpanded := Value;

  if Value<>nil then Value.Expand;
end;

{ TncExpandArea }

constructor TncExpandArea.Create(aForm: TncFrmExpandArea; 
                                 aTriggerR: TRect; 
                                 aExpandR : TRect;
                                 aRetractJS: String;
                                 aMouseOver: Boolean);
var T: Integer;  
begin
  gExpandAreaList.AddArea(Self);
  FForm := aForm;
  FTriggerR := aTriggerR;
  FExpandR  := aExpandR;
  FRetractJS := aRetractJS;
  FMouseOver := aMouseOver;
  SetLength(FInvRects, 0);
  T := 0;
  if FExpandR.Top>gDesktopRect.Top then begin
    SetLength(FInvRects, T+1);
    FInvRects[T].Left := gDesktopRect.Left;
    FInvRects[T].Top  := gDesktopRect.Top;
    FInvRects[T].Right := gDesktopRect.Right;
    FInvRects[T].Bottom := FExpandR.Top-1;
    Inc(T);
  end;
  if FExpandR.Right<gDesktopRect.Right then begin
    SetLength(FInvRects, T+1);
    FInvRects[T].Left := FExpandR.Right+1;
    FInvRects[T].Top  := FExpandR.Top;
    FInvRects[T].Right := gDesktopRect.Right;
    FInvRects[T].Bottom := FExpandR.Bottom;
    Inc(T);
  end;
  if FExpandR.Bottom<gDesktopRect.Bottom then begin
    SetLength(FInvRects, T+1);
    FInvRects[T].Left := gDesktopRect.Left;
    FInvRects[T].Top  := FExpandR.Bottom+1;
    FInvRects[T].Right := gDesktopRect.Right;
    FInvRects[T].Bottom := gDesktopRect.Bottom;
    Inc(T);
  end;
  if FExpandR.Left>gDesktopRect.Left then begin
    SetLength(FInvRects, T+1);
    FInvRects[T].Left := gDesktopRect.Left;
    FInvRects[T].Top  := FExpandR.Top;
    FInvRects[T].Right := FExpandR.Left-1;
    FInvRects[T].Bottom := FExpandR.Bottom;
    Inc(T);
  end;
  if FExpandR.Left < FForm.RetractR.Left then
    FTotalR.Left := FExpandR.Left else
    FTotalR.Left := FForm.RetractR.Left;

  if FExpandR.Top < FForm.RetractR.Top then
    FTotalR.Top := FExpandR.Top else
    FTotalR.Top := FForm.RetractR.Top;

  if FExpandR.Right > FForm.RetractR.Right then
    FTotalR.Right := FExpandR.Right else
    FTotalR.Right := FForm.RetractR.Right;

  if FExpandR.Bottom > FForm.RetractR.Bottom then
    FTotalR.Bottom := FExpandR.Bottom else
    FTotalR.Bottom := FForm.RetractR.Bottom;
end;

destructor TncExpandArea.Destroy;
begin
  gExpandAreaList.RemoveArea(Self);
  inherited;
end;

procedure TncExpandArea.Expand;
begin
  FForm.ExpandedArea := Self;
end;

function TncExpandArea.Expanded: Boolean;
begin
  try 
    Result := (gExpandAreaList.FExpanded = Self); 
  except 
    Result := False;
  end;
end;

function HitRect(R: TRect; X, Y: Integer): Boolean;
begin
  Result := (X>=R.Left) and (X<=R.Right) and (Y>=R.Top) and (Y<=R.Bottom);
end;

function TncExpandArea.Hit(X, Y: Integer): Boolean;
var aExp: Boolean;
begin
  aExp := Expanded;
  DebugMsg('TncExpandArea.Hit - X: '+IntToStr(X)+' Y: '+IntToStr(Y)+
    ' Expanded: ' + IntToStr(Integer(aExp)) +
    ' FTriggerR.Top: ' + IntToStr(FTriggerR.Top) +
    ' FTriggerR.Left: ' + IntToStr(FTriggerR.Left) + 
    ' FTriggerR.Bottom: ' + IntToStr(FTriggerR.Bottom) + 
    ' FTriggerR.Right: ' + IntToStr(FTriggerR.Right) +
    ' FExpandR.Top: ' + IntToStr(FExpandR.Top) +
    ' FExpandR.Left: ' + IntToStr(FExpandR.Left) + 
    ' FExpandR.Bottom: ' + IntToStr(FExpandR.Bottom) + 
    ' FExpandR.Right: ' + IntToStr(FExpandR.Right));
  
  Result := HitRect(FTriggerR, X, Y) or (aExp and HitRect(FExpandR, X, Y));
end;

procedure TncExpandArea.Retract;
begin
  try if Expanded then FForm.ExpandedArea := nil; except end;
end;

{ TncFrmExpandArea }

procedure TncFrmExpandArea.ClearInvPanels;
begin
  while FInvPanels.Count>0 do begin
    try
      TObject(FInvPanels[0]).Free;
    except
    end;
    FInvPanels.Delete(0);
  end;
end;

procedure TncFrmExpandArea.CreateInvPanel(R: TRect; const aTemporary: Boolean = True);
var P : TPanel;
begin
  if aTemporary then
    P := TPanel.Create(nil) else
    P := TPanel.Create(Self);
  P.Color := clFuchsia;
  P.ParentColor := False;
  P.BevelOuter := bvNone;
  P.Caption := '';
  P.Parent := Self;
  P.Top := R.Top;
  P.Left := R.Left;                              
  P.Height := RectH(R);
  P.Width := RectW(R);
  P.BringToFront;
  if aTemporary then
    FInvPanels.Add(P);
end;

procedure TncFrmExpandArea.CreateParams(var Params: TCreateParams);
begin
  inherited;
  params.ExStyle := params.ExStyle or WS_EX_TOOLWINDOW;
  if Owner = nil then
    DebugMsg('TncFrmExpandArea.CreateParams - OWNER is NIL') 
  else
  if Owner is TForm then begin
    params.WndParent := TForm(Owner).Handle;
    DebugMsg('TncFrmExpandArea.CreateParams - Handle '+IntToStr(params.WndParent)+' = '+Owner.Name);
  end 
  else
    DebugMsg('TncFrmExpandArea.CreateParams - Owner: ' + Owner.Name + '-' + Owner.ClassName);
end;

procedure TncFrmExpandArea.DoCreate;
begin
  RetractR.Left   := Left;
  RetractR.Top    := Top;
  RetractR.Right  := Left + Width - 1;
  RetractR.Bottom := Top + Height - 1;
  FExpandedArea := nil;
  FInvPanels := TList.Create;

  inherited;
end;

procedure TncFrmExpandArea.DoDestroy;
begin
  inherited;
  try ExpandedArea := nil; except end;
  try FInvPanels.Free; except end;
  try gExpandAreaList.FreeAreaFromForm(Self); except end;
end;

procedure TncFrmExpandArea.ExecJS(aJS: String);
begin

end;

function TncFrmExpandArea.Expanded: Boolean;
begin
  Result := (FExpandedArea<>nil);
end;

procedure TncFrmExpandArea.SetExpandedArea(const Value: TncExpandArea);
begin
  if FExpandedArea=Value then Exit;

  if Value=nil then
    DebugMsg('TncFrmExpandArea.SetExpandedArea = NIL') else
    DebugMsg('TncFrmExpandArea.SetExpandedArea <> NIL');
  

  if FExpandedArea<>nil then _Retract;

  FExpandedArea := Value;

  if Value<>nil then _Expand;
end;

procedure TncFrmExpandArea._Expand;
var I : Integer;
begin
  DebugMsg('TncFrmExpandArea._Expand');
  Left := FExpandedArea.FTotalR.Left;
  Top := FExpandedArea.FTotalR.Top;
  Height := (FExpandedArea.FTotalR.Bottom - Top) + 1;
  Width := (FExpandedArea.FTotalR.Right - Left) + 1;
  for I := 0 to High(FExpandedArea.FInvRects) do 
    CreateInvPanel(FExpandedArea.FInvRects[I]);
end;

procedure TncFrmExpandArea._Retract;
begin
  DebugMsg('TncFrmExpandArea._Retract');

  ClearInvPanels;
  Left := RetractR.Left;
  Top := RetractR.Top;
  Width := RetractR.Right - RetractR.Left + 1;
  Height := RetractR.Bottom - RetractR.Top + 1;
  try
    if FExpandedArea.FRetractJS>'' then
      ExecJS(FExpandedArea.FRetractJS);
  except
  end;
end;

{ TncSkyExpandArea }

function TncSkyExpandArea.Hit(X, Y: Integer): Boolean;
var aExp: Boolean;
begin
  aExp := Expanded;
  DebugMsg('TncSkyExpandArea.Hit - X: '+IntToStr(X)+' Y: '+IntToStr(Y)+
    ' Expanded: ' + IntToStr(Integer(aExp)) +
    ' FTriggerR.Top: ' + IntToStr(FTriggerR.Top) +
    ' FTriggerR.Left: ' + IntToStr(FTriggerR.Left) + 
    ' FTriggerR.Bottom: ' + IntToStr(FTriggerR.Bottom) + 
    ' FTriggerR.Right: ' + IntToStr(FTriggerR.Right) +
    ' FTotalR.Top: ' + IntToStr(FTotalR.Top) +
    ' FTotalR.Left: ' + IntToStr(FTotalR.Left) + 
    ' FTotalR.Bottom: ' + IntToStr(FTotalR.Bottom) + 
    ' FTotalR.Right: ' + IntToStr(FTotalR.Right));
  
  Result := HitRect(FTriggerR, X, Y) or (aExp and HitRect(FTotalR, X, Y));
end;

initialization
  gDesktopRect.Top := 31;
  gDesktopRect.Bottom := Screen.Height;
  gDesktopRect.Right := Screen.Width-123;
  gDesktopRect.Left := 0;
  gExpandAreaList := TncExpandAreaList.Create;

finalization
  gExpandAreaList.Free;  

end.
