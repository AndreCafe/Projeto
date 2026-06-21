unit dxFrame;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, StdCtrls,
  ExtCtrls, ImgList, dxPSCore, dxPgsDlg, cxLookAndFeels, cxLookAndFeelPainters, dxOffice11,
  dxfrmInspector, dxOperations, dxOperationTypes, dxTopPanel;

type
  TdxFrameClass = class of TdxFrame;

  TSupportedExportType = (exHTML, exXML, exExcel, exText);

  TdxFrame = class(TFrame, IdxgdEventSubscriber, IcxLookAndFeelNotificationListener)
    plTop: TPanel;
    pnlSeparator: TPanel;
    pnlDescription: TPanel;
    lblLeft1: TLabel;
    lblRight1: TLabel;
    lblTop1: TLabel;
    lblBottom1: TLabel;
    pnlHintInternal: TPanel;
    lblLeft2: TLabel;
    lblRight2: TLabel;
    lblTop2: TLabel;
    lblBottom2: TLabel;
    lblDescription: TLabel;
    procedure FrameResize(Sender: TObject);
  private
    FBarList: TdxBarList;
    FOperations: TdxOperations;
    FShowInspector: Boolean;
    FChangingVisibility: Boolean;
    FInspector: TfrmInspector;
    FFrameTopPanel: TdxFrameTopPanel;
    FReportLink: TBasedxReportLink;

    function GetActive: Boolean;
    function GetBarList: TdxBarList;
    function GetCaption: TCaption;
    function GetComponentPrinter: TdxComponentPrinter;
    function GetHasHint: Boolean;
    function GetImages: TCustomImageList;
    function GetImageIndex: Integer;
    function GetOperation: TdxOperations;
    function GetPrintStyleManager: TdxPrintStyleManager;
    procedure SetImageIndex(const Value: Integer);
    procedure SetImages(const Value: TCustomImageList);
    procedure SetShowInspector(Value: Boolean);

    procedure UpdateDescriptionHeight;
  protected
    // IdxgdEventSubscriber
    procedure ProcessEvent(AOperationType: TdxgdOperationType); virtual;
    // IcxLookAndFeelNotificationListener
    function GetObject: TObject;
    procedure MasterLookAndFeelChanged(Sender: TcxLookAndFeel; AChangedValues: TcxLookAndFeelValues);
    procedure MasterLookAndFeelDestroying(Sender: TcxLookAndFeel);

    procedure AddBars; virtual;
    procedure AddOperations; virtual;
    procedure AddOperationsToPopupMenu; virtual;
    function GetDescription: string; dynamic;
    function GetHint: string; dynamic;
    function GetInspectedObject: TPersistent; virtual;
    function GetInitialShowInspector: Boolean; virtual;
    function GetPrintableComponent: TComponent; virtual;
    function NeedInspector: Boolean; virtual;
    procedure LookAndFeelChanged; virtual;
    procedure UpdateOperations; virtual;
    procedure UpdateInspectedObject;

    procedure DoShowInspector(AOperationType: TdxgdOperationType); virtual;

    procedure FocusFirstControl;

    procedure CheckDescription;
    procedure CheckHint;
    procedure SetCaption(Value: TCaption); virtual;

    procedure DoInspectorObjectChanged(Sender: TObject);
    procedure DoInspectorClose(Sender: TObject; var Action: TCloseAction);

    function CreateReportLink: TBasedxReportLink;
    function GetReportLink: TBasedxReportLink; virtual;
    function GetReportLinkClass: TdxReportLinkClass;
    procedure PrepareLink(AReportLink: TBasedxReportLink); virtual;
    
    property HasHint: Boolean read GetHasHint;
    property Operations: TdxOperations read GetOperation;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function CanDeactivate: Boolean; virtual;
    procedure ChangeVisibility(AShow: Boolean); virtual;
    function GetReportLinkName: string; virtual;

    procedure DoExport(AExportType: TSupportedExportType; const AFileName: string); virtual;
    function ExportFileName: string; virtual;
    function IsSupportExport(AExportType: TSupportedExportType): Boolean; virtual;

    property Active: Boolean read GetActive;
    property BarList: TdxBarList read GetBarList;
    property Caption: TCaption read GetCaption write SetCaption;
    property ComponentPrinter: TdxComponentPrinter read GetComponentPrinter;
    property ImageIndex: Integer read GetImageIndex write SetImageIndex;
    property Images: TCustomImageList read GetImages write SetImages;
    property PrintableComponent: TComponent read GetPrintableComponent;
    property PrintStyleManager: TdxPrintStyleManager read GetPrintStyleManager;
    property ReportLink: TBasedxReportLink read GetReportLink;
    property ShowInspector: Boolean read FShowInspector write SetShowInspector;
  end;

implementation

{$R *.DFM}

uses
  dxBarExtItems, Types, uStrsConst;

{ TdxFrame }

constructor TdxFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Visible := False;
  FOperations := TdxOperations.Create;
  FBarList := TdxBarList.Create;
  AddOperations;
  AddOperationsToPopupMenu;
  AddBars;
  dxOperationManager.RegisterSubscriber(Self);
  RootLookAndFeel.AddChangeListener(self);
  FInspector := TfrmInspector.Create(nil);
  FFrameTopPanel := TdxFrameTopPanel.Create(self);
  FFrameTopPanel.Parent := plTop;
  FFrameTopPanel.Align := alClient;
  FFrameTopPanel.Font.Size := 10;
  FFrameTopPanel.Font.Style := [fsBold];
  FFrameTopPanel.Font.Color := clWindow;

  if Application.MainForm.WindowState = wsMaximized then
  begin
    with Application.MainForm.BoundsRect do
    begin
      FInspector.Left := Right - FInspector.Width;
      FInspector.Top := Bottom - FInspector.Height;
    end;
  end else
  begin
    FInspector.Left := Screen.Width - FInspector.Width;
    FInspector.Top := Screen.Height - FInspector.Height;
  end;
  FInspector.onInspectedObjectChanged := DoInspectorObjectChanged;
  FInspector.OnClose := DoInspectorClose;
  ShowInspector := GetInitialShowInspector;
  LookAndFeelChanged;
end;

destructor TdxFrame.Destroy;
begin
  FInspector.Free;
  RootLookAndFeel.RemoveChangeListener(self);
  dxOperationManager.UnregisterSubscriber(Self);
  FBarList.Free;
  FOperations.Free;
  inherited;
end;

procedure TdxFrame.SetShowInspector(Value: Boolean);
begin
  if (ShowInspector <> Value) then
  begin
    FShowInspector := Value;
    if Value then
      FInspector.InspectedObject := GetInspectedObject
    else FInspector.InspectedObject := nil;
    FInspector.Visible := Value;
  end;
end;

function TdxFrame.GetActive: Boolean;
begin
  Result := Visible;
end;

function TdxFrame.GetBarList: TdxBarList;
begin
  Result := FBarList;
end;

function TdxFrame.GetCaption: TCaption;
begin
  Result := FFrameTopPanel.Caption;
end;

function TdxFrame.GetComponentPrinter: TdxComponentPrinter;
var
  I: Integer;
  Component: TComponent;
begin
  with Application.MainForm do 
    for I := 0 to ComponentCount - 1 do
    begin
      Component := Components[I];
      if Component is TdxComponentPrinter then 
      begin
        Result := TdxComponentPrinter(Component);
        Exit;
      end;
    end;
  Result := nil;
end;

function TdxFrame.GetHasHint: Boolean;
begin
  Result := GetHint <> '';
end;

function TdxFrame.GetOperation: TdxOperations;
begin
  Result := FOperations;
end;

function TdxFrame.GetPrintStyleManager: TdxPrintStyleManager;
var
  I: Integer;
  Component: TComponent;
begin
  with Application.MainForm do 
    for I := 0 to ComponentCount - 1 do
    begin
      Component := Components[I];
      if Component is TdxPrintStyleManager then 
      begin
        Result := TdxPrintStyleManager(Component);
        Exit;
      end;
    end;
  Result := nil;
end;

procedure TdxFrame.SetCaption(Value: TCaption);
begin
  FFrameTopPanel.Caption := ' ' + Value;
end;

procedure TdxFrame.DoInspectorObjectChanged(Sender: TObject);
begin
  UpdateOperations;
end;

procedure TdxFrame.DoInspectorClose(Sender: TObject; var Action: TCloseAction);
begin
  if not FChangingVisibility then
    Operations[otShowInspector].Down := False;
end;

function TdxFrame.GetReportLink: TBasedxReportLink;
begin
  if FReportLink = nil then
    FReportLink := CreateReportLink;
  Result := FReportLink;  

  if Result <> nil then
    with Result do
    begin
      ReportTitle.Text := Caption;
      RestoreFromOriginal;
      Component := PrintableComponent;
    end;
end;

procedure TdxFrame.UpdateDescriptionHeight;
var
  ARect: TRect;
begin
  if not pnlDescription.Visible or (lblDescription.Caption = '') then exit;
  ARect := lblDescription.BoundsRect;
  InflateRect(ARect, -3, 0);
  lblDescription.Canvas.Font.Assign(lblDescription.Font);
  DrawText(lblDescription.Canvas.Handle, PChar(lblDescription.Caption),
    Length(lblDescription.Caption), ARect, DT_CALCRECT or DT_WORDBREAK);
  InflateRect(ARect, 0, 2);
  pnlDescription.Height := ARect.Bottom - ARect.Top + pnlDescription.Height - lblDescription.Height;
end;

procedure TdxFrame.CheckDescription;
begin
  if GetDescription <> '' then
  begin
    lblDescription.Caption := GetDescription;
    pnlDescription.Visible := True;
    UpdateDescriptionHeight;
  end;
end;

procedure TdxFrame.CheckHint;
begin
  if HasHint then
    Operations[otHint].Text := GetHint
  else
    if Operations[otHint] <> nil then
      Operations[otHint].Text := '';
end;

procedure TdxFrame.ProcessEvent(AOperationType: TdxgdOperationType);
begin
  if (FOperations[AOperationType] <> nil) and
    (Active or not FOperations[AOperationType].CallOnlyWhenActive) then
    FOperations[AOperationType].DoHandler;
end;

function TdxFrame.GetObject: TObject;
begin
  Result := self;
end;

procedure TdxFrame.MasterLookAndFeelChanged(Sender: TcxLookAndFeel; AChangedValues: TcxLookAndFeelValues);
begin
  LookAndFeelChanged;
end;

procedure TdxFrame.MasterLookAndFeelDestroying(Sender: TcxLookAndFeel);
begin
  //do nothing
end;

procedure TdxFrame.AddBars;
begin
  if HasHint then BarList.AddBar(btDBNavigator);
end;

procedure TdxFrame.AddOperations;
begin
//  if HasHint then
  Operations.AddOperation(otHint, nil);
  if NeedInspector then
    Operations.AddOperation(otShowInspector, DoShowInspector);
end;

procedure TdxFrame.AddOperationsToPopupMenu;
begin
end;

function TdxFrame.GetDescription: string;
begin
end;

function TdxFrame.GetHint: string;
begin
  Result := {$IFDEF PS3}sdxFramePSHint{$ELSE}''{$ENDIF};
end;

function TdxFrame.GetInspectedObject: TPersistent;
begin
  Result := nil;
end;

function TdxFrame.GetInitialShowInspector: Boolean;
begin
  Result := False;
end;

function TdxFrame.GetPrintableComponent: TComponent;
begin
  Result := nil;
end;

function TdxFrame.NeedInspector: Boolean;
begin
  Result := GetInspectedObject <> nil;
end;

procedure TdxFrame.DoShowInspector(AOperationType: TdxgdOperationType);
begin
  ShowInspector := Operations[otShowInspector].Down;
end;

procedure TdxFrame.LookAndFeelChanged;
begin
  Color := Application.MainForm.Color;
  if(RootLookAndFeel.ActiveStyle in [lfsNative, lfsOffice11]) then
  begin
    pnlHintInternal.Color := dxOffice11DockColor1;
  end else
  begin
    pnlHintInternal.Color := clInfoBk;
  end;
end;


procedure TdxFrame.UpdateOperations;
begin
  if Operations[otShowInspector] <> nil then
  begin
    Operations[otShowInspector].Enabled := NeedInspector;
    Operations[otShowInspector].Down := ShowInspector;
  end;
end;

procedure TdxFrame.UpdateInspectedObject;
begin
  if ShowInspector then
    FInspector.InspectedObject := GetInspectedObject;
end;

procedure TdxFrame.FocusFirstControl;
var
  AControl: TWinControl;
begin
  AControl := FindNextControl(nil, True, True, False);
  if AControl <> nil then AControl.SetFocus;
end;

function TdxFrame.CanDeactivate: Boolean;
begin
  Result := True;
end;

procedure TdxFrame.ChangeVisibility(AShow: Boolean);
begin
  try
    FChangingVisibility := True;
    if ShowInspector then
      FInspector.Visible := AShow;
    Visible := AShow;
    Operations.UpdateItems(AShow);
    BarList.UpdateItems(AShow);
    if AShow then
    begin
      UpdateOperations;
      CheckDescription;
      CheckHint;
      FocusFirstControl;
    end;
  finally
    FChangingVisibility := False;
  end;
end;

function TdxFrame.GetReportLinkName: string;
begin
  Result := '';
end;

function TdxFrame.CreateReportLink: TBasedxReportLink;
begin
  Result := ComponentPrinter.AddEmptyLink(GetReportLinkClass);
  if Result <> nil then
    PrepareLink(Result);
end;

function TdxFrame.GetReportLinkClass: TdxReportLinkClass;
begin
  if PrintableComponent <> nil then
    Result := dxPSCore.dxPSLinkClassByCompClass(TComponentClass(PrintableComponent.ClassType))
  else
    Result := nil;  
end;

procedure TdxFrame.PrepareLink(AReportLink: TBasedxReportLink);
begin
  AReportLink.StyleManager := Self.PrintStyleManager;
  AReportLink.Active := False;
end;

function TdxFrame.IsSupportExport(AExportType: TSupportedExportType): Boolean;
begin
  Result := False;
end;

procedure TdxFrame.DoExport(AExportType: TSupportedExportType; const AFileName: string);
begin
end;

function TdxFrame.ExportFileName: string;
begin
  Result := 'dxExport';
end;

procedure TdxFrame.FrameResize(Sender: TObject);
begin
  UpdateDescriptionHeight;
end;

function TdxFrame.GetImageIndex: Integer;
begin
  Result := FFrameTopPanel.ImageIndex;
end;

function TdxFrame.GetImages: TCustomImageList;
begin
  Result := FFrameTopPanel.Images;
end;

procedure TdxFrame.SetImageIndex(const Value: Integer);
begin
  FFrameTopPanel.ImageIndex := Value;
end;

procedure TdxFrame.SetImages(const Value: TCustomImageList);
begin
  FFrameTopPanel.Images := Value;
end;

end.
