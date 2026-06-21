unit main;

interface

{$I cxVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ShellAPI, ImgList, cxClasses, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBar, dxflchrt, dxSkinscxPCPainter,
  cxPC, dxSkinsForm, dxSkinsdxBarPainter, cxPCdxBarPopupMenu, DBClient, DB;

type
  TMainForm = class(TForm)
    btnActualSize: TdxBarButton;
    btnDelete: TdxBarButton;
    btnEdit: TdxBarButton;
    btnExit: TdxBarButton;
    btnFit: TdxBarButton;
    btnLookAndFeel: TdxBarSubItem;
    btnNew: TdxBarButton;
    btnOpen: TdxBarButton;
    btnSave: TdxBarButton;
    btnZoomIn: TdxBarButton;
    btnZoomOut: TdxBarButton;
    DataSource: TDataSource;
    dxBarManager: TdxBarManager;
    dxFlowChart: TdxFlowChart;
    dxSkinController: TdxSkinController;
    ImageList1: TImageList;
    miHelp: TdxBarSubItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    sbEdit: TdxBarSubItem;
    sbFile: TdxBarSubItem;
    sbView: TdxBarSubItem;
    tcCharts: TcxTabControl;
    bvlSpaceLeft: TBevel;
    bvlSpaceRight: TBevel;
    bvlSpaceBottom: TBevel;
    bvlSpaceTop: TBevel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    btnZoom: TdxBarSubItem;
    btnAntialiasing: TdxBarButton;
    ilMenu: TcxImageList;
    Table: TClientDataSet;
    TableID: TAutoIncField;
    TableChartName: TStringField;
    TableBkColor: TIntegerField;
    TableChart: TBlobField;
    procedure btnActualSizeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnFitClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnZoomInClick(Sender: TObject);
    procedure btnZoomOutClick(Sender: TObject);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure dxFlowChartDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure tcChartsChange(Sender: TObject);
    procedure btnAntialiasingClick(Sender: TObject);
  private
    FUpdating: Boolean;
    procedure DoAddChart(const AName: string);
    procedure PopulateCharts;
    procedure PostFlowChartChanges;
    procedure UpdateButtonsState;
  end;

var
  MainForm: TMainForm;

implementation

uses
{$I dxSkins.inc}
  ChartName, dxDemoUtils, dxFcEdit, Math;

{$R *.DFM}

{ TMainForm }

procedure TMainForm.dxFlowChartDblClick(Sender: TObject);
begin
  if Table.RecordCount <> 0 then
  begin
    if ShowFlowChartEditor(dxFlowChart, 'ExpressFlowChart Editor') then
      PostFlowChartChanges
  end;
end;

procedure TMainForm.Table1AfterScroll(DataSet: TDataSet);
var
  AStream: TMemoryStream;
begin
  if not FUpdating then
  begin
    dxFlowChart.BeginUpdate;
    try
      dxFlowChart.Clear;
      if not TBlobField(Table.FieldByName('Chart')).IsNull then
      begin
        AStream := TMemoryStream.Create;
        try
          TBlobField(Table.FieldByName('Chart')).SaveToStream(AStream);
          AStream.Position := 0;
          dxFlowChart.LoadFromStream(AStream);
        finally
          AStream.Free;
        end;
      end;
      dxFlowChart.Color := Table.FieldByName('BkColor').AsInteger;
    finally
      dxFlowChart.EndUpdate;
    end;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  CreateHelpMenuItems(dxBarManager, miHelp);
  CreateSkinsMenuItems(dxBarManager, btnLookAndFeel, dxSkinController);
  PopulateCharts;
end;

procedure TMainForm.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.btnSaveClick(Sender: TObject);
begin
  if SaveDialog.Execute then
    dxFlowChart.SaveToFile(SaveDialog.FileName);
end;

procedure TMainForm.DataSourceDataChange(Sender: TObject; Field: TField);
var
  AHasRecords: Boolean;
begin
  AHasRecords := Table.RecordCount > 0;
  btnOpen.Enabled := AHasRecords;
  btnSave.Enabled := AHasRecords;
end;

procedure TMainForm.btnOpenClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    dxFlowChart.LoadFromFile(OpenDialog.FileName);
    if Table.RecordCount <> 0 then
      PostFlowChartChanges;
  end;
end;

procedure TMainForm.btnFitClick(Sender: TObject);
begin
  dxFlowChart.Zoom := 100 * Ord(not btnFit.Down);
  UpdateButtonsState;
end;

procedure TMainForm.btnZoomInClick(Sender: TObject);
begin
  dxFlowChart.Zoom := Min(dxFlowChart.Zoom + 10, 500);
  UpdateButtonsState;
end;

procedure TMainForm.btnZoomOutClick(Sender: TObject);
begin
  dxFlowChart.Zoom := Max(dxFlowChart.Zoom - 10, 10);
  UpdateButtonsState;
end;

procedure TMainForm.btnActualSizeClick(Sender: TObject);
begin
  dxFlowChart.Zoom := 100;
  UpdateButtonsState;
end;

procedure TMainForm.Table1AfterInsert(DataSet: TDataSet);
begin
  FUpdating := True;
  try
    Table.Edit;
    Table.FieldByName('BkColor').AsInteger := clDefault;
    Table.Post;
  finally
    FUpdating := False;
  end;
end;

procedure TMainForm.tcChartsChange(Sender: TObject);
var
  ATab: TcxTab;
begin
  if tcCharts.TabIndex >= 0 then
  begin
    ATab := tcCharts.Tabs[tcCharts.TabIndex];
    if not Table.Locate('ChartName', ATab.Caption, []) then
      DoAddChart(ATab.Caption);
  end;
end;

procedure TMainForm.btnNewClick(Sender: TObject);
var
  AName: string;
begin
  if ChartNameDialogExecute(AName) then
  begin
    FUpdating := True;
    try
      DoAddChart(AName);
    finally
      FUpdating := False;
      tcCharts.TabIndex := tcCharts.Tabs.Add(AName);
    end;
  end;
end;

procedure TMainForm.btnAntialiasingClick(Sender: TObject);
begin
  dxFlowChart.Antialiasing := btnAntialiasing.Down;
end;

procedure TMainForm.btnDeleteClick(Sender: TObject);
begin
  if (Table.RecordCount > 0) and (tcCharts.TabIndex >= 0) then
  begin
    if MessageDlg('Delete Current Chart ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Table.Delete;
      tcCharts.Tabs.Delete(tcCharts.TabIndex);
    end;
  end;
end;

procedure TMainForm.DoAddChart(const AName: string);
begin
  Table.Append;
  Table.Edit;
  Table.FieldByName('ChartName').AsString := AName;
  Table.FieldByName('BkColor').AsInteger := clDefault;
  Table.Post;
end;

procedure TMainForm.PopulateCharts;
begin
  FUpdating := True;
  try
    tcCharts.Tabs.BeginUpdate;
    try
      Table.Open;
      Table.First;
      tcCharts.Tabs.Clear;
      while not Table.Eof do
      begin
        tcCharts.Tabs.Add(Table.FieldByName('ChartName').AsString);
        Table.Next;
      end;
    finally
      tcCharts.Tabs.EndUpdate;
    end;
    Table.First;
  finally
    FUpdating := False;
    tcCharts.TabIndex := 0;
    tcChartsChange(nil);
  end;
end;

procedure TMainForm.PostFlowChartChanges;
var
  AStream: TMemoryStream;
begin
  FUpdating := True;
  try
    AStream := TMemoryStream.Create;
    try
      Table.Edit;
      dxFlowChart.SaveToStream(AStream);
      AStream.Position := 0;
      TBlobField(Table.FieldByName('Chart')).LoadFromStream(AStream);
      Table.FieldByName('BkColor').AsInteger := dxFlowChart.Color;
      Table.Post;
    finally
      AStream.Free;
    end;
  finally
    FUpdating := False;
  end;
end;

procedure TMainForm.UpdateButtonsState;
begin
  btnZoomIn.Enabled := not btnFit.Down and (dxFlowChart.Zoom < 490);
  btnZoomOut.Enabled := not btnFit.Down and (dxFlowChart.Zoom > 10);
  btnActualSize.Enabled := (dxFlowChart.Zoom <> 100) and (not btnFit.Down);
end;

initialization
  dxMegaDemoProductIndex := dxFlowChartIndex;

end.
