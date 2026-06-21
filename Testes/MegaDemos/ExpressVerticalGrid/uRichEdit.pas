unit uRichEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxFrame, StdCtrls, ExtCtrls, ComCtrls, dxPSCore, dxPSRELnk,
  dxOperationTypes;

type
  TfrmRichEdit = class(TdxFrame)
    RichEdit: TRichEdit;
    procedure RichEditChange(Sender: TObject);
    procedure RichEditSelectionChange(Sender: TObject);
  private
    FUpdateCount: Integer;
    FFileName: string;

    procedure ClearAttributes;
    procedure BeginUpdate;
    procedure EndUpdate;
    function GetCurrentAttr: TTextAttributes;
    procedure DoBarFontChanged(Sender: TObject);
  protected
    procedure AddBars; override;
    procedure AddOperations; override;
    procedure UpdateOperations; override;
    function GetPrintableComponent: TComponent; override;

    procedure DoFileNew(AOperationType: TdxgdOperationType);
    procedure DoFileOpen(AOperationType: TdxgdOperationType);
    procedure DoFileSave(AOperationType: TdxgdOperationType);
    procedure DoUndo(AOperationType: TdxgdOperationType);
    procedure DoCut(AOperationType: TdxgdOperationType);
    procedure DoCopy(AOperationType: TdxgdOperationType);
    procedure DoPast(AOperationType: TdxgdOperationType);
    procedure DoFontChanged(AOperationType: TdxgdOperationType);

    property CurrentAttr: TTextAttributes read GetCurrentAttr;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ChangeVisibility(AShow: Boolean); override;
  end;

implementation

uses
  maindata, dxFrames, FrameIDs, uStrsConst, dxBar, dxBarExtItems;

{$R *.dfm}

{ TfrmRichEdit }
constructor TfrmRichEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFileName := ExtractFileDir(Application.ExeName) + '\PS3.RTF';
  FUpdateCount := 0;
  try
    RichEdit.Lines.LoadFromFile(FFileName);
  except
  end;  
end;

procedure TfrmRichEdit.ChangeVisibility(AShow: Boolean);
begin
  if AShow then
  begin
    TdxBarFontNameCombo(Operations[otFontName].BarItem).OnCurChange := DoBarFontChanged;
    TdxBarSpinEdit(Operations[otFontSize].BarItem).OnCurChange := DoBarFontChanged;
    TdxBarColorCombo(Operations[otFontColor].BarItem).OnCurChange := DoBarFontChanged;
  end else
  begin
    TdxBarFontNameCombo(Operations[otFontName].BarItem).OnCurChange := nil;
    TdxBarSpinEdit(Operations[otFontSize].BarItem).OnCurChange := nil;
    TdxBarColorCombo(Operations[otFontColor].BarItem).OnCurChange := nil;
  end;
  inherited ChangeVisibility(AShow);
end;


procedure TfrmRichEdit.AddBars;
begin
  inherited;
  BarList.AddBar(btStandard);
  BarList.AddBar(btFontFormat);
end;

procedure TfrmRichEdit.AddOperations;

  procedure AddFileOperations;
  begin
    with Operations do
    begin
      AddOperation(otPrintStyles, nil);
      AddOperation(otDefinePrintStyles, nil);
      AddOperation(otPrintPreview, nil);
      AddOperation(otPrint, nil);
      AddOperation(otStyles, nil);

      AddOperation(otFileNew, DoFileNew);
//      AddOperation(otFileOpen, DoFileOpen);
      AddOperation(otFileSave, DoFileSave);
      AddOperation(otUndo, DoUndo);
    end;
  end;

  procedure AddEditOperations;
  begin
    with Operations do
    begin
      AddOperation(otEditOperations, nil);
      AddOperation(otCut, DoCut);
      AddOperation(otCopy, DoCopy);
      AddOperation(otPast, DoPast);
    end;
  end;

  procedure AddFontOperations;
  begin
    with Operations do
    begin
      AddOperation(otFontName, nil);
      AddOperation(otFontColor, nil);
      AddOperation(otFontSize, nil);
      AddOperation(otFontItalic, DoFontChanged);
      AddOperation(otFontBold, DoFontChanged);
      AddOperation(otFontUnderLine, DoFontChanged);
      AddOperation(otFontStrikeOut, DoFontChanged);
      AddOperation(otAlignLeft, DoFontChanged);
      AddOperation(otAlignRight, DoFontChanged);
      AddOperation(otAlignCenter, DoFontChanged);
    end;
  end;


begin
  inherited;

  AddFileOperations;
  AddEditOperations;
  AddFontOperations;
  
end;

procedure TfrmRichEdit.UpdateOperations;
begin
  inherited UpdateOperations;
  if FUpdateCount > 0 then exit;
  BeginUpdate;
  try
    Operations[otCopy].Enabled := RichEdit.SelLength > 0;
    Operations[otCut].Enabled := not RichEdit.ReadOnly and (RichEdit.SelLength > 0);
    Operations[otPast].Enabled := not RichEdit.ReadOnly;
//    Operations[otEditSelectAll].Enabled := RichEdit.Text <> '';
    Operations[otUndo].Enabled := RichEdit.CanUndo;

    Operations[otFontBold].Enabled := not RichEdit.ReadOnly;
    Operations[otFontItalic].Enabled := not RichEdit.ReadOnly;
    Operations[otFontUnderline].Enabled := not RichEdit.ReadOnly;
    Operations[otFontStrikeOut].Enabled := not RichEdit.ReadOnly;
    Operations[otFontName].Enabled := not RichEdit.ReadOnly;
    Operations[otFontColor].Enabled := not RichEdit.ReadOnly;
    Operations[otFontSize].Enabled := not RichEdit.ReadOnly;

    Operations[otAlignLeft].Enabled := not RichEdit.ReadOnly;
    Operations[otAlignCenter].Enabled := not RichEdit.ReadOnly;
    Operations[otAlignRight].Enabled := not RichEdit.ReadOnly;

    with RichEdit.SelAttributes do
    begin
      Operations[otFontBold].Down := fsBold in Style;
      Operations[otFontItalic].Down := fsItalic in Style;
      Operations[otFontUnderline].Down := fsUnderline in Style;
      Operations[otFontStrikeout].Down := fsStrikeOut in Style;

      TdxBarFontNameCombo(Operations[otFontName].BarItem).Text := RichEdit.SelAttributes.Name;
      TdxBarSpinEdit(Operations[otFontSize].BarItem).IntValue := Size;
      TdxBarColorCombo(Operations[otFontColor].BarItem).Color := Color;
    end;

    with RichEdit.Paragraph do
    begin
      Operations[otAlignLeft].Down := Alignment = taLeftJustify;
      Operations[otAlignCenter].Down := Alignment = taCenter;
      Operations[otAlignRight].Down := Alignment = taRightJustify;
    end;

  finally
    EndUpdate;
  end;
end;

function TfrmRichEdit.GetPrintableComponent: TComponent;
begin
  Result := RichEdit;
end;

procedure TfrmRichEdit.DoFileNew(AOperationType: TdxgdOperationType);
begin
  RichEdit.Lines.Clear;
  ClearAttributes;
end;

procedure TfrmRichEdit.DoFileOpen(AOperationType: TdxgdOperationType);
begin
end;

procedure TfrmRichEdit.DoFileSave(AOperationType: TdxgdOperationType);
begin
  RichEdit.Lines.SaveToFile(FFileName);
end;

procedure TfrmRichEdit.DoUndo(AOperationType: TdxgdOperationType);
begin
  RichEdit.Undo;
end;

procedure TfrmRichEdit.DoCut(AOperationType: TdxgdOperationType);
begin
  RichEdit.CutToClipboard;
end;

procedure TfrmRichEdit.DoCopy(AOperationType: TdxgdOperationType);
begin
  RichEdit.CopyToClipboard;
end;

procedure TfrmRichEdit.DoPast(AOperationType: TdxgdOperationType);
begin
  RichEdit.PasteFromClipboard;
end;

procedure TfrmRichEdit.DoFontChanged(AOperationType: TdxgdOperationType);
var
  AFontStyles: TFontStyles;
begin
  if FUpdateCount <> 0 then Exit;
  try
    BeginUpdate;
    CurrentAttr.Name := TdxBarFontNameCombo(Operations[otFontName].BarItem).CurText;
    CurrentAttr.Size := TdxBarSpinEdit(Operations[otFontSize].BarItem).IntCurValue;
    CurrentAttr.Color := TdxBarColorCombo(Operations[otFontColor].BarItem).CurColor;
    AFontStyles := [];
    if Operations[otFontItalic].Down then
      AFontStyles := AFontStyles + [fsItalic];
    if Operations[otFontBold].Down then
      AFontStyles := AFontStyles + [fsBold];
    if Operations[otFontUnderLine].Down then
      AFontStyles := AFontStyles + [fsUnderLine];
    if Operations[otFontStrikeOut].Down then
      AFontStyles := AFontStyles + [fsStrikeOut];
    CurrentAttr.Style := AFontStyles;

    if Operations[otAlignLeft].Down then
      RichEdit.Paragraph.Alignment := taLeftJustify;
    if Operations[otAlignCenter].Down then
      RichEdit.Paragraph.Alignment := taCenter;
    if Operations[otAlignRight].Down then
      RichEdit.Paragraph.Alignment := taRightJustify;
  finally
    EndUpdate;
  end;
end;

procedure TfrmRichEdit.ClearAttributes;
begin
  if FUpdateCount <> 0 then Exit;
  BeginUpdate;
  try
    with CurrentAttr do
    begin
      Color := clWindowText;
      Name := 'Times New Roman';      
      protected := False;
      Size := 12;
      Style := [];
    end;
  finally
    EndUpdate;
  end;  
end;

procedure TfrmRichEdit.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TfrmRichEdit.EndUpdate;
begin
  if FUpdateCount <> 0 then Dec(FUpdateCount);
end;

function TfrmRichEdit.GetCurrentAttr: TTextAttributes;
begin
  if RichEdit.SelLength > 0 then
    Result := RichEdit.SelAttributes
  else
    Result := RichEdit.DefAttributes;
end;

procedure TfrmRichEdit.DoBarFontChanged(Sender: TObject);
begin
  DoFontChanged(otNone);
end;



procedure TfrmRichEdit.RichEditChange(Sender: TObject);
begin
  UpdateOperations;
end;

procedure TfrmRichEdit.RichEditSelectionChange(Sender: TObject);
begin
  UpdateOperations;
end;

initialization
  dxFrameManager.RegisterFrame(StandardControlRichEditIndex, TfrmRichEdit,
    StandardControlsRichEditName, StandardControlsRichEditImageIndex, StandardControlsRichEditImageIndex, StandardControlsGroupIndex);

end.
