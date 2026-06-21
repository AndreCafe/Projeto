unit uVCLListView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxFrame, ComCtrls, ShellCtrls, StdCtrls, ExtCtrls, dxPSCore,
  ShlObj, cxShellCommon, cxDropDownEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxShellComboBox, cxShellListView;

type
  TfrmVCLListView = class(TdxFrame)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cbxAddress: TcxShellComboBox;
    cbxView: TcxComboBox;
    lvItems: TcxShellListView;
    procedure cbxViewChange(Sender: TObject);
    procedure cbxViewClick(Sender: TObject);
  protected
    procedure AddBars; override;
    procedure AddOperations; override;
    function GetPrintableComponent: TComponent; override;
    procedure PrepareLink(AReportLink: TBasedxReportLink); override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses
  maindata, dxFrames, FrameIDs, dxOperationTypes, uStrsConst, dxPSLVLnk, 
  dxPScxExtComCtrlsLnk;

constructor TfrmVCLListView.Create(AOwner: TComponent);
begin
  inherited;
  cbxView.ItemIndex := 0;
end;
  
procedure TfrmVCLListView.AddBars;
begin
  inherited;
  BarList.AddBar(btStandard);
end;

procedure TfrmVCLListView.AddOperations;
begin
  inherited;
  with Operations do
  begin
    AddOperation(otPrintStyles, nil);
    AddOperation(otDefinePrintStyles, nil);
    AddOperation(otPrintPreview, nil);
    AddOperation(otPrint, nil);
    AddOperation(otStyles, nil);
  end;
end;

function TfrmVCLListView.GetPrintableComponent: TComponent; 
begin
  Result := lvItems;
end;

procedure TfrmVCLListView.PrepareLink(AReportLink: TBasedxReportLink); 
begin
  inherited;
  TCustomdxNativeListViewReportLink(AReportLink).AutoWidth := True;
end;

procedure TfrmVCLListView.cbxViewChange(Sender: TObject);
begin
  inherited;
  lvItems.ViewStyle := TViewStyle(TComboBox(Sender).ItemIndex);
end;

procedure TfrmVCLListView.cbxViewClick(Sender: TObject);
begin
  inherited;
  lvItems.ViewStyle := TViewStyle(TcxComboBox(Sender).ItemIndex);
end;

initialization
  dxFrameManager.RegisterFrame(StandardControlListViewIndex, TfrmVCLListView,
    StandardControlsListViewName, StandardControlsListViewImageIndex, StandardControlsListViewImageIndex, 
    StandardControlsGroupIndex);
    
end.
