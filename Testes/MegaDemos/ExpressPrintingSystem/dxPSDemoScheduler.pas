unit dxPSDemoScheduler;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, DB, DBTables, cxTLData, cxDBTL, cxInplaceContainer,
  cxMaskEdit, cxMemo, cxBlobEdit, dxPSDemoCommon, cxVariants, cxImage, Menus,
  cxScheduler, cxSchedulerStorage, cxSchedulerCustomControls, dxPScxSchedulerLnk,
  cxSchedulerCustomResourceView, cxSchedulerDayView,  cxSchedulerDateNavigator,
  cxSchedulerHolidays, cxSchedulerTimeGridView, cxSchedulerUtils, cxGroupBox,
  cxSchedulerWeekView, cxSchedulerYearView, cxSchedulerGanttView, cxContainer,
  cxRadioGroup, ExtCtrls, cxEdit, ImgList;

type

  { TfrSchedulerFrame }

  TfrSchedulerFrame = class(TdxPrintingSystemDemoFrame)
    Scheduler: TcxScheduler;
    ControlBox: TcxGroupBox;
    rgGroupBy: TcxRadioGroup;
    rgViews: TcxRadioGroup;
    cxSchedulerHolidays1: TcxSchedulerHolidays;
    SchedulerStorage: TcxSchedulerStorage;
    imgResources: TcxImageList;
    procedure rgViewsClick(Sender: TObject);
    procedure rgGroupByClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  protected
    function GetReportLinkComponent: TComponent; override;
  end;

implementation

uses
  dxPSDemoData;

{$R *.dfm}

type

  { TdxPSSchedulerFrameInfo }

  TdxPSSchedulerFrameInfo = class(TdxPrintingSystemDemoFrameInfo)
  protected
    function GetFrameClass: TdxPrintingSystemDemoFrameClass; override;
    function GetImageIndex: Integer; override;
  public
    constructor Create;
  end;

var
  SportEvents: array[0..12] of string = (
    'Basketball Qualifying - Men',
    'Lamon Brewster (32-2) vs. Luan Krasniqi (28-1-1) (WBO heavyweight belt)',
    'Vince Philips (47-9-1) vs. Reynaldo Pelonia (35-21-3)',
    'Kili Madrid (6-0-1) vs. Donny Fosmire (10-7)',
    'Nelson Zepeda (1-0-1) vs. Kaleo Padilla (0-0)',
    'Justin Mercado (1-1) vs. Waldo Rojas (0-0)',
    'Australian Open',
    'Weightlifting 48 Kg - Women  - Final',
    'Sabre - Men - 1st Round',
    'Epee - Women - 1st Round',
    'Soccer 1st Round - *Women''s Preliminaries - Women',
    'Greco-Roman 96kg - Men - Qualifying',
    'Men''s Bronze Medal Match - RUS - USA'
  );
  MaxRandomPeriod: Integer = 60;

function GetRandomDate(AScheduler: TcxScheduler): TDateTime;
begin
  Result := Date + Random(MaxRandomPeriod) * (Random(2) * 2 - 1) +
    AScheduler.OptionsView.WorkStart;
  if Trunc(Result) = Date then
    Result := Result + Random(10) * HourToTime
  else
    Result := Result + Random(24) * HourToTime;
end;

function GetRandomResourceID(AScheduler: TcxScheduler): Variant;
begin
  Result := Null;
  if (AScheduler.Storage = nil) or (AScheduler.Storage.ResourceCount = 0) then
    Exit
  else
    if AScheduler.Storage.ResourceCount = 1 then
      Result := AScheduler.Storage.ResourceIDs[0]
    else
      Result := AScheduler.Storage.ResourceIDs[Random(AScheduler.Storage.ResourceCount)];
end;

function GetRandomState: Integer;
begin
  Result := Random(4);
end;

procedure CreateEventObject(AScheduler: TcxScheduler;
  AAllDayEvent: Boolean; AEventDuration: TDateTime);
var
  ADate: TDateTime;
  AEvent: TcxSchedulerEvent;
begin
  AEvent := AScheduler.Storage.CreateEvent;
  ADate := GetRandomDate(AScheduler);
  AEvent.Start := ADate;
  AEvent.AllDayEvent := AAllDayEvent;
  AEvent.Finish := ADate + AEventDuration;
  AEvent.State := GetRandomState;
  AEvent.LabelColor := EventLabelColors[Random(11)];
  AEvent.Caption := SportEvents[Random(High(SportEvents) + 1)];
  AEvent.ResourceID := GetRandomResourceID(AScheduler);
end;

procedure GenerateRandomEvents(AScheduler: TcxScheduler; ACount: Integer);
var
  I: Integer;
begin
  if AScheduler.Storage = nil then Exit;
  AScheduler.Storage.BeginUpdate;
  try
    Randomize;
    for I := 0 to ACount div 5 * 3 - 1 do
      CreateEventObject(AScheduler, False, (Random(180) + 30) * MinuteToTime);
    for I := 0 to ACount div 5 - 1 do
      CreateEventObject(AScheduler, True, 1);
    for I := 0 to ACount div 5 - 1 do
      CreateEventObject(AScheduler, False, 1 + (Random(180) + 30) * MinuteToTime);
  finally
    AScheduler.Storage.EndUpdate;
  end;
end;

{ TdxPSSchedulerFrameInfo }

constructor TdxPSSchedulerFrameInfo.Create;
begin
  inherited Create;
  Caption := 'Scheduler';
end;

function TdxPSSchedulerFrameInfo.GetFrameClass: TdxPrintingSystemDemoFrameClass;
begin
  Result := TfrSchedulerFrame;
end;

function TdxPSSchedulerFrameInfo.GetImageIndex: Integer;
begin
  Result := 15;
end;

{ TfrSchedulerFrame }

procedure TfrSchedulerFrame.FormCreate(Sender: TObject);
begin
  GenerateRandomEvents(Scheduler, 50);
end;

function TfrSchedulerFrame.GetReportLinkComponent: TComponent;
begin
  Result := Scheduler;
end;

procedure TfrSchedulerFrame.rgGroupByClick(Sender: TObject);
begin
  case rgGroupBy.ItemIndex of
    0: Scheduler.OptionsView.GroupingKind := gkNone;
    1: Scheduler.OptionsView.GroupingKind := gkByResource;
    2: Scheduler.OptionsView.GroupingKind := gkByDate;
  end;
end;

procedure TfrSchedulerFrame.rgViewsClick(Sender: TObject);
begin
  case rgViews.ItemIndex of
    0: Scheduler.ViewDay.Active := True;
    1: Scheduler.ViewWeek.Active := True;
    2: Scheduler.ViewWeeks.Active := True;
    3: Scheduler.ViewTimeGrid.Active := True;
    4: Scheduler.ViewYear.Active := True;
  end;
end;

initialization
  PrintingSystemDemoFrames.Register(TdxPSSchedulerFrameInfo.Create);

end.
