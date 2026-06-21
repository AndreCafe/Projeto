unit uGridFileExplorer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxGridFrame, cxStyles, cxControls, cxGrid, StdCtrls, ExtCtrls,
  cxCustomData, cxGraphics, cxFilter, cxData, cxEdit,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView,
  cxGridLevel, ImgList, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxDataStorage, cxImageComboBox, cxLookAndFeels, cxLookAndFeelPainters,
  cxLabel;

type
  TfrmGridFileExplorer = class(TdxGridFrame)
    Level: TcxGridLevel;
    TableView: TcxGridTableView;
    clnType: TcxGridColumn;
    clnName: TcxGridColumn;
    clnDate: TcxGridColumn;
    clnSize: TcxGridColumn;
    ImageList: TImageList;
    pnlTop: TPanel;
    Label1: TcxLabel;
    cbDrives: TcxComboBox;
    lblCurrentPath: TcxLabel;
    procedure TableViewDblClick(Sender: TObject);
    procedure TableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDrivesClick(Sender: TObject);
  private
    procedure ExecuteFile;
  protected
    function GetDescription: String; override;
    function IsFooterMenuEnabled: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  PFileSourceRecord = ^TFileSourceRecord;
  TFileSourceRecord = record
    Time: Integer;
    Size: Integer;
    Attr: Integer;
    Name: TFileName;
  end;

  TFilesDataSource = class(TcxCustomDataSource)
  private
    FTableView: TcxGridTableView;
    FPathName: string;
    FFiles: TList;
    procedure SetPathName(const Value: string);
    procedure Clear;
    procedure LoadData;
    function GetItemIndex(AItemHandle: TcxDataItemHandle): Integer;
  protected
    function GetRecordCount: Integer; override;
    function GetValue(ARecordHandle: TcxDataRecordHandle;
      AItemHandle: TcxDataItemHandle): Variant; override;
    function GetDisplayText(ARecordHandle: TcxDataRecordHandle;
      AItemHandle: TcxDataItemHandle): string; override;
  public
    constructor Create(const APathName: string; ATableView: TcxGridTableView);
    destructor Destroy; override;
    function GetValuebyId(AId, ARecordIndex: Integer): Variant;
    property PathName: string read FPathName write SetPathName;
  end;

implementation

{$R *.dfm}

uses
  ShellAPI, dxFrames, FrameIDs, uStrsConst;

{ TFilesDataSource }

constructor TFilesDataSource.Create(const APathName: string;
  ATableView: TcxGridTableView);
begin
  FTableView := ATableView;
  FFiles := TList.Create;
  PathName := APathName;
end;

destructor TFilesDataSource.Destroy;
begin
  Clear;
  FFiles.Free;
  inherited;
end;

function TFilesDataSource.GetRecordCount: Integer;
begin
  Result := FFiles.Count;
end;

function TFilesDataSource.GetValue(ARecordHandle: TcxDataRecordHandle;
  AItemHandle: TcxDataItemHandle): Variant;
begin
  Result := GetValueByID(GetItemIndex(AItemHandle), Integer(ARecordHandle));
end;

function TFilesDataSource.GetDisplayText(ARecordHandle: TcxDataRecordHandle;
  AItemHandle: TcxDataItemHandle): string;
var
  AColIndex: Integer;
  ADateTime: TDateTime;
  ARecord: PFileSourceRecord;
begin
  AColIndex := GetItemIndex(AItemHandle);
  ARecord := PFileSourceRecord(FFiles[Integer(ARecordHandle)]);
  case AColIndex of
    1: Result := ARecord^.Name;
    2:
      begin
        if ARecord^.Attr and faDirectory = faDirectory then
          Result := ''
        else
        begin
          if ARecord^.Size < 1000 then
            Result := IntToStr(ARecord^.Size) + ' Bytes'
          else Result := IntToStr(ARecord^.Size div 1000) + ' KB';
        end;  
      end;
    3:
      begin
        ADateTime := FileDateToDateTime(ARecord^.Time);
        Result := DateToStr(ADateTime);
      end;
    else Result := '';  
  end;
end;

function TFilesDataSource.GetItemIndex(AItemHandle: TcxDataItemHandle): Integer;
begin
  Result := FTableView.Columns[Integer(AItemHandle)].DataBinding.Item.ID
end;

procedure TFilesDataSource.SetPathName(const Value: string);
begin
  if (FPathName <> Value) then
  begin
    Clear;
    FPathName := Value;
    if PathName <> '' then
      LoadData;
  end;
end;

procedure TFilesDataSource.Clear;
var
  I: Integer;
begin
  for I := 0 to FFiles.Count - 1 do
     Dispose(PFileSourceRecord(FFiles[I]));
  FFiles.Clear;
end;

procedure TFilesDataSource.LoadData;
var
  ASearchRec: TSearchRec;
  ARes: Integer;

  procedure AddFile;
  var
    ARecord: PFileSourceRecord;
  begin
    ARecord := new(PFileSourceRecord);
    FFiles.Add(ARecord);
    ARecord.Name := ASearchRec.Name;
    ARecord.Attr := ASearchRec.Attr;
    ARecord.Time := ASearchRec.Time;
    ARecord.Size := ASearchRec.Size;
  end;
begin

  ARes := FindFirst(PathName + '\*.*', faAnyFile and not faHidden, ASearchRec);
  while ARes = 0 do
  begin
    AddFile;
    ARes := FindNext(ASearchRec);
  end;
  FindClose(ASearchRec);
  if FFiles.Count = 0 then
  begin
    ASearchRec.Name := '..';
    ASearchRec.Attr := faDirectory;
    ASearchRec.Time := 0;
    ASearchRec.Size := 0;
  end;
end;


function TFilesDataSource.GetValuebyId(AId, ARecordIndex: Integer): Variant;
var
  ARecord: PFileSourceRecord;
begin
  ARecord := PFileSourceRecord(FFiles[Integer(ARecordIndex)]);
  case AID of
    0: Result := ARecord.Attr and faDirectory;
    1: Result := ARecord.Name;
    2: Result := ARecord.Size;
    3: Result := ARecord.Time;
  end;

end;

{ TfrmGridFileExplorer }

constructor TfrmGridFileExplorer.Create(AOwner: TComponent);
var
  ADrive: DWORD;
  AMask: DWORD;
  I: Integer;
begin
  inherited Create(AOwner);
  clnType.DataBinding.ValueTypeClass := TcxIntegerValueType;
  clnName.DataBinding.ValueTypeClass := TcxStringValueType;
  clnDate.DataBinding.ValueTypeClass := TcxIntegerValueType;
  clnSize.DataBinding.ValueTypeClass := TcxIntegerValueType;

  AMask := 1;
  ADrive := GetLogicalDrives;
  TableView.DataController.CustomDataSource := TFilesDataSource.Create('', TableView);
  for I := 0 to SizeOf(DWord) * 8 - 1 do
  begin
     if ADrive and AMask = AMask then
       cbDrives.Properties.Items.Add(Char(Integer('A') + I) + ':');
     AMask := AMask * 2;
     if (AMask > ADrive) then break;
  end;
  if cbDrives.Properties.Items.IndexOf('C:') > -1 then
    cbDrives.ItemIndex := cbDrives.Properties.Items.IndexOf('C:');
  cbDrivesClick(nil);
end;

destructor TfrmGridFileExplorer.Destroy;
begin
  if TableView.DataController.CustomDataSource <> nil then
  begin
    TableView.DataController.CustomDataSource.Free;
    TableView.DataController.CustomDataSource := nil;
  end;
  inherited Destroy;
end;

function TfrmGridFileExplorer.GetDescription: String;
begin
  Result := sdxFrameFileExplorerDescription;
end;

procedure TfrmGridFileExplorer.ExecuteFile;
var
  AFileName: string;
begin
  if TableView.Controller.FocusedRow <> nil then
    with TFilesDataSource(TableView.DataController.CustomDataSource) do
    begin
      if TableView.Controller.FocusedRow.Values[clnName.Index] = '.' then
      begin
        cbDrivesClick(nil);
      end
      else
      begin
        if TableView.Controller.FocusedRow.Values[clnName.Index] = '..' then
        begin
          AFileName := PathName;
          while (Length(AFileName) > 0) and (AFileName[Length(AFileName)] <> '\') do
            AFileName := Copy(AFileName, 1, Length(AFileName) - 1);
          if Length(AFileName) > 0 then
            AFileName := Copy(AFileName, 1, Length(AFileName) - 1);
        end else AFileName := PathName + '\' + TableView.Controller.FocusedRow.Values[clnName.Index];
        if TableView.Controller.FocusedRow.Values[clnType.Index] and
          faDirectory = faDirectory then
        begin
          PathName :=  AFileName;
          DataChanged;
          if TableView.DataController.RecordCount > 1 then
             TableView.Controller.FocusedRowIndex := 1;
          lblCurrentPath.Caption := PathName + '\*.*';
        end else
        begin
          ShellExecute(Handle, PChar('OPEN'), PChar(AFileName), nil, nil, SW_SHOWNORMAL);
        end;
      end;  
    end;
end;


procedure TfrmGridFileExplorer.TableViewDblClick(Sender: TObject);
var
  pt: TPoint;
  AHitTest: TcxCustomGridHitTest;
begin
  GetCursorPos(pt);
  pt := Grid.ScreenToClient(pt);
  AHitTest := TableView.ViewInfo.GetHitTest(pt.X, pt.Y);
  if AHitTest is TcxGridRecordCellHitTest then
    ExecuteFile;
end;

procedure TfrmGridFileExplorer.TableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    ExecuteFile;
end;

procedure TfrmGridFileExplorer.cbDrivesClick(Sender: TObject);
begin
  with TFilesDataSource(TableView.DataController.CustomDataSource) do
  begin
    PathName := cbDrives.Text;
    DataChanged;
    lblCurrentPath.Caption := PathName + '\*.*';
  end;
end;

function TfrmGridFileExplorer.IsFooterMenuEnabled: Boolean;
begin
  Result := False;
end;

initialization
  dxFrameManager.RegisterFrame(GridFolderFileFrameID, TfrmGridFileExplorer,
    GridPoviderModeFrameName, GridFileFolderImageIndex, DataBindingGroupIndex,
    HighlightedFeaturesGroupIndex, -1);

end.
