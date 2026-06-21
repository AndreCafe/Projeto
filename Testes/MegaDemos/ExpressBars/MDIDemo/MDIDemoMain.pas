unit MDIDemoMain;

interface

uses
{$I dxSkins.inc}
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, dxBar, StdCtrls, dxBarExtItems, cxControls,
  ImgList, ActnList, cxLookAndFeels, dxStatusBar, cxGraphics,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsdxStatusBarPainter,
  dxSkinsdxBarPainter, cxClasses, dxSkinsForm, dxBarSkinnedCustForm, cxPC,
  cxPCdxBarPopupMenu, dxTabbedMDI, dxSkinscxPCPainter, cxDropDownEdit,
  cxBarEditItem;

type
  TfrmMDIMain = class(TForm)
    BarManager: TdxBarManager;

    dxBarButtonNew: TdxBarLargeButton;
    dxBarButtonOpen: TdxBarLargeButton;
    dxBarButtonClose: TdxBarLargeButton;
    dxBarButtonSave: TdxBarLargeButton;
    dxBarButtonSaveAs: TdxBarLargeButton;
    dxBarButtonPrint: TdxBarLargeButton;
    dxBarButtonExit: TdxBarLargeButton;
    dxBarButtonUndo: TdxBarLargeButton;
    dxBarButtonCut: TdxBarLargeButton;
    dxBarButtonCopy: TdxBarLargeButton;
    dxBarButtonPaste: TdxBarLargeButton;
    dxBarButtonClear: TdxBarLargeButton;
    dxBarButtonSelectAll: TdxBarLargeButton;
    dxBarButtonFind: TdxBarLargeButton;
    dxBarButtonReplace: TdxBarLargeButton;
    dxBarComboFontSize: TdxBarCombo;
    dxBarButtonBold: TdxBarLargeButton;
    dxBarButtonItalic: TdxBarLargeButton;
    dxBarButtonUnderline: TdxBarLargeButton;
    dxBarButtonBullets: TdxBarLargeButton;
    dxBarButtonProtected: TdxBarLargeButton;
    dxBarButtonAlignLeft: TdxBarLargeButton;
    dxBarButtonCenter: TdxBarLargeButton;
    dxBarButtonAlignRight: TdxBarLargeButton;
    dxBarButtonFont: TdxBarLargeButton;

    dxBarButtonNewWindow: TdxBarLargeButton;
    dxBarButtonArrangeAll: TdxBarLargeButton;
    dxBarButtonNextWindow: TdxBarLargeButton;
    dxBarButtonPreviousWindow: TdxBarLargeButton;
    dxBarListWindows: TdxBarListItem;
    siFile: TdxBarSubItem;
    dxBarSubItemEdit: TdxBarSubItem;
    dxBarSubItemFormat: TdxBarSubItem;
    siWindow: TdxBarSubItem;
    siHelp: TdxBarSubItem;

    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    PrintDialog: TPrintDialog;
    FontDialog: TFontDialog;
    dxBarPopupMenu: TdxBarPopupMenu;
    dxBarMRUFiles: TdxBarMRUListItem;
    dxBarDockControl1: TdxBarDockControl;
    dxBarComboFontColor: TdxBarColorCombo;
    dxBarGroup1: TdxBarGroup;
    Images: TImageList;
    dxBarComboFontName: TdxBarFontNameCombo;
    ilHotImages: TImageList;
    ilDisabledImages: TImageList;
    ilStatusBarImages: TImageList;
    dxStatusBar: TdxStatusBar;
    FindDialog: TFindDialog;
    ReplaceDialog: TReplaceDialog;
    dxTabbedMDIManager1: TdxTabbedMDIManager;
    siOptions: TdxBarSubItem;
    btnTabbedView: TdxBarLargeButton;
    tlbTabOptions: TdxBar;
    siLookAndFeel: TdxBarSubItem;
    siStyles: TdxBarSubItem;
    btnMultiline: TdxBarButton;
    dxSkinController1: TdxSkinController;
    cbTabPosition: TcxBarEditItem;
    cbTextAngle: TcxBarEditItem;
    cbCloseButtonMode: TcxBarEditItem;

    procedure FormCreate(Sender: TObject);

    procedure dxBarButtonNewClick(Sender: TObject);
    procedure dxBarButtonOpenClick(Sender: TObject);
    procedure dxBarButtonCloseClick(Sender: TObject);
    procedure dxBarButtonSaveClick(Sender: TObject);
    procedure dxBarButtonSaveAsClick(Sender: TObject);
    procedure dxBarButtonPrintClick(Sender: TObject);
    procedure dxBarButtonExitClick(Sender: TObject);

    procedure dxBarButtonUndoClick(Sender: TObject);
    procedure dxBarButtonCutClick(Sender: TObject);
    procedure dxBarButtonCopyClick(Sender: TObject);
    procedure dxBarButtonPasteClick(Sender: TObject);
    procedure dxBarButtonClearClick(Sender: TObject);
    procedure dxBarButtonSelectAllClick(Sender: TObject);
    procedure dxBarButtonFindClick(Sender: TObject);
    procedure dxBarButtonReplaceClick(Sender: TObject);

    procedure dxBarComboFontNameChange(Sender: TObject);
    procedure dxBarComboFontSizeChange(Sender: TObject);
    procedure dxBarButtonBoldClick(Sender: TObject);
    procedure dxBarButtonItalicClick(Sender: TObject);
    procedure dxBarButtonUnderlineClick(Sender: TObject);
    procedure dxBarComboFontColorChange(Sender: TObject);
    procedure dxBarButtonBulletsClick(Sender: TObject);
    procedure dxBarButtonAlignClick(Sender: TObject);
    procedure dxBarButtonProtectedClick(Sender: TObject);
    procedure dxBarButtonFontClick(Sender: TObject);

    procedure dxBarButtonArrangeAllClick(Sender: TObject);
    procedure dxBarButtonNextWindowClick(Sender: TObject);
    procedure dxBarButtonPreviousWindowClick(Sender: TObject);
    procedure dxBarListWindowsGetData(Sender: TObject);
    procedure dxBarListWindowsClick(Sender: TObject);
    procedure dxBarMRUFilesClick(Sender: TObject);
    procedure FindOne(Sender: TObject);
    procedure ReplaceOne(Sender: TObject);
    procedure btnTabbedViewClick(Sender: TObject);
    procedure cbTextAngle1Change(Sender: TObject);
    procedure cbCloseButtonMode1Change(Sender: TObject);
    procedure btnMultilineClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FUpdating: Boolean;

    procedure CreateStylesMenu;
    function GetEditor: TRichEdit;
    function GetEditorCol: Integer;
    function GetEditorRow: Integer;
    function GetFileName: string;
    procedure SetFileName(Value: string);
    procedure StyleButtonClick(Sender: TObject);
  public
    CreatedMDICount: Integer;

    procedure EditorChange(Sender: TObject);
    procedure EditorSelectionChange(Sender: TObject);
    procedure LoadDocument(AName: string);
    function SaveFile(ASaveAs: Boolean): Boolean;
    procedure SetModified(Value: Boolean);
    procedure ShowItems(AShow: Boolean);

    property Editor: TRichEdit read GetEditor;
    property EditorCol: Integer read GetEditorCol;
    property EditorRow: Integer read GetEditorRow;
    property FileName: string read GetFileName write SetFileName;
  end;

var
  frmMDIMain: TfrmMDIMain;

implementation

{$R *.DFM}

uses
  RichEdit, cxPCPaintersFactory, MDIDemoChild, dxDemoUtils;

const
  sRichEditFoundResultCaption = 'Information';
  sRichEditTextNotFound = 'The search text is not found.';
  sRichEditReplaceAllResult = 'Replaced %d occurances.';

type
  TFormAccess = class(TForm);

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure TfrmMDIMain.CreateStylesMenu;

  procedure AddButton(ACaption: string; AIndex: Integer);
  var
    AButton: TdxBarButton;
  begin
    AButton := TdxBarButton(siStyles.ItemLinks.AddButton.Item);
    AButton.Caption := ACaption;
    AButton.ButtonStyle := bsChecked;
    AButton.Tag := AIndex;
    AButton.GroupIndex := 10;
    AButton.OnClick := StyleButtonClick;
    AButton.Down := AIndex = 0;
  end;

var
  I: Integer;
  AStyleID: TcxPCStyleID;
begin
  AddButton('Default(Look and Feel dependent)', 0);
  for I := 0 to PaintersFactory.PainterClassCount - 1 do
  begin
    AStyleID := PaintersFactory.PainterStyleIDs[I];
    AddButton(GetPCStyleName(AStyleID), AStyleID);
  end;
end;

function TfrmMDIMain.GetEditor: TRichEdit;
begin
  if ActiveMDIChild = nil then Result := nil
  else Result := TfrmMDIChild(ActiveMDIChild).Editor;
end;

function TfrmMDIMain.GetEditorCol: Integer;
begin
  with Editor do
    Result := SelStart - SendMessage(Handle, EM_LINEINDEX, EditorRow, 0);
end;

function TfrmMDIMain.GetEditorRow: Integer;
begin
  with Editor do
    Result := SendMessage(Handle, EM_LINEFROMCHAR, SelStart, 0);
end;

function TfrmMDIMain.GetFileName: string;
begin
  if ActiveMDIChild = nil then Result := ''
  else Result := TfrmMDIChild(ActiveMDIChild).FileName;
end;

procedure TfrmMDIMain.SetFileName(Value: string);
begin
  if ActiveMDIChild <> nil then
    TfrmMDIChild(ActiveMDIChild).FileName := Value;
end;

procedure TfrmMDIMain.StyleButtonClick(Sender: TObject);
begin
  dxTabbedMDIManager1.TabProperties.Style := TcxPCStyleID(TComponent(Sender).Tag);
end;

procedure TfrmMDIMain.FindOne(Sender: TObject);
var
  StartPos, FindLength, FoundAt: Integer;
  Flags: TSearchTypes;
  P: TPoint;
  CaretR, R, IntersectR: TRect;
begin
  with Editor, TFindDialog(Sender) do
  begin
    if frDown in Options then
    begin
      if SelLength = 0 then StartPos := SelStart
      else StartPos := SelStart + SelLength;
      FindLength := Length(Text) - StartPos;
    end
    else
    begin
      StartPos := SelStart;
      FindLength := -StartPos;
    end;
    Flags := [];
    if frMatchCase in Options then Include(Flags, stMatchCase);
    if frWholeWord in Options then Include(Flags, stWholeWord);
    Screen.Cursor := crHourglass;
    FoundAt := Editor.FindText(FindText, StartPos, FindLength, Flags);
    if not (frReplaceAll in Options) then Screen.Cursor := crDefault;
    if FoundAt > -1 then
      if frReplaceAll in Options then
      begin
        SelStart := FoundAt;
        SelLength := Length(FindText);
      end
      else
      begin
        SetFocus;
        SelStart := FoundAt;
        SelLength := Length(FindText);

        GetCaretPos(P);
        P := ClientToScreen(P);
        CaretR := Rect(P.X, P.Y, P.X + 2, P.Y + 20);
        GetWindowRect(Handle, R);
        if IntersectRect(IntersectR, CaretR, R) then
          if P.Y < Screen.Height div 2 then
            Top := P.Y + 40
          else
            Top := P.Y - (R.Bottom - R.Top + 20);
      end
    else
      if not (frReplaceAll in Options) then
        Application.MessageBox(sRichEditTextNotFound,
          sRichEditFoundResultCaption, MB_ICONINFORMATION);
  end;
end;

procedure TfrmMDIMain.ReplaceOne(Sender: TObject);
var
  ReplacedCount, OldSelStart, PrevSelStart: Integer;
  S: string;
begin
  with Editor, TReplaceDialog(Sender) do
  begin
    ReplacedCount := 0;
    OldSelStart := SelStart;
    if frReplaceAll in Options then
      Screen.Cursor := crHourglass;
    repeat
      if (SelLength > 0) and ((SelText = FindText) or
        (not (frMatchCase in Options) and
         (AnsiUpperCase(SelText) = AnsiUpperCase(FindText)))) then
      begin
        SelText := ReplaceText;
        Inc(ReplacedCount);
      end;
      PrevSelStart := SelStart;
      FindOne(Sender);
    until not (frReplaceAll in Options) or (SelStart = PrevSelStart);
    if frReplaceAll in Options then
    begin
      Screen.Cursor := crDefault;
      if ReplacedCount = 0 then S := sRichEditTextNotFound
      else
      begin
        SelStart := OldSelStart;
        S := Format(sRichEditReplaceAllResult, [ReplacedCount]);
      end;
      Application.MessageBox(PChar(S), sRichEditFoundResultCaption,
        MB_ICONINFORMATION);
    end;
  end;
end;

procedure TfrmMDIMain.EditorChange(Sender: TObject);
begin
  if Editor = nil then Exit;

  Editor.OnSelectionChange(Editor);
  SetModified(Editor.Modified);
  dxStatusBar.Panels[1].Text := FileName;
  TdxStatusBarTextPanelStyle(dxStatusBar.Panels[1].PanelStyle).ImageIndex := 0;
  TdxStatusBarTextPanelStyle(dxStatusBar.Panels[0].PanelStyle).ImageIndex := 2;
  dxBarButtonUndo.Enabled := SendMessage(Editor.Handle, EM_CANUNDO, 0, 0) <> 0;
end;

procedure TfrmMDIMain.EditorSelectionChange(Sender: TObject);
begin
  with Editor, SelAttributes do
  begin
    FUpdating := True;
    dxBarComboFontSize.OnChange := nil;
    dxBarComboFontName.OnChange := nil;
    dxBarComboFontColor.OnChange := nil;
    try
       dxStatusBar.Panels[0].Text := Format('Line: %3d   Col: %3d', [1 + EditorRow, 1 + EditorCol]);

       dxBarButtonCopy.Enabled := SelLength > 0;
       dxBarButtonCut.Enabled := dxBarButtonCopy.Enabled;
       dxBarButtonPaste.Enabled := SendMessage(Editor.Handle, EM_CANPASTE, 0, 0) <> 0;
       dxBarButtonClear.Enabled := dxBarButtonCopy.Enabled;

       dxBarComboFontSize.Text := IntToStr(Size);
       dxBarComboFontName.Text := Name;
       dxBarComboFontColor.Color := Color;

       dxBarButtonBold.Down := fsBold in Style;
       dxBarButtonItalic.Down := fsItalic in Style;
       dxBarButtonUnderline.Down := fsUnderline in Style;

       dxBarButtonBullets.Down := Boolean(Paragraph.Numbering);
       case Ord(Paragraph.Alignment) of
         0: dxBarButtonAlignLeft.Down := True;
         1: dxBarButtonAlignRight.Down := True;
         2: dxBarButtonCenter.Down := True;
       end;
       dxBarButtonProtected.Down := Protected;
    finally
      FUpdating := False;
      dxBarComboFontSize.OnChange := dxBarComboFontSizeChange;
      dxBarComboFontName.OnChange := dxBarComboFontNameChange;
      dxBarComboFontColor.OnChange := dxBarComboFontColorChange;
    end;
  end;
end;

procedure TfrmMDIMain.LoadDocument(AName: string);
begin
  with TfrmMDIChild.Create(Application) do
  begin
    FileName := AName;
    Editor.Lines.LoadFromFile(FileName);
    SetModified(False);
  end;
  dxBarMRUFiles.RemoveItem(AName, nil);
end;

function TfrmMDIMain.SaveFile(ASaveAs: Boolean): Boolean;
begin
  if ASaveAs or (FileName = '') then
  begin
    SaveDialog.FileName := FileName;
    Result := SaveDialog.Execute;
    if not Result then Exit;
    FileName := SaveDialog.FileName;
  end;
  Editor.Lines.SaveToFile(FileName);
  dxStatusBar.Panels[1].Text := ActiveMDIChild.Caption;
  SetModified(False);
  Result := True;
end;

procedure TfrmMDIMain.SetModified(Value: Boolean);
begin
  Editor.Modified := Value;
  if Value then
  begin
    dxStatusBar.Panels[2].Text := 'Modified';
    TdxStatusBarTextPanelStyle(dxStatusBar.Panels[2].PanelStyle).ImageIndex := 1;
  end
  else
  begin
    dxStatusBar.Panels[2].Text := '';
    TdxStatusBarTextPanelStyle(dxStatusBar.Panels[2].PanelStyle).ImageIndex := 4;
  end;
  dxBarButtonSave.Enabled := Value;
end;

procedure TfrmMDIMain.ShowItems(AShow: Boolean);
var
  AVisible: TdxBarItemVisible;
begin
  BarManager.LockUpdate := True;
  try
    if not AShow then
    begin
      dxStatusBar.Panels[0].Text := '';
      dxStatusBar.Panels[1].Text := '';
      dxStatusBar.Panels[2].Text := '';
    end;
    BarManager.Groups[0].Enabled := AShow;

    if AShow then AVisible := ivAlways
    else AVisible := ivInCustomizing;

    dxBarSubItemEdit.Visible := AVisible;
    dxBarSubItemFormat.Visible := AVisible;
  finally
    BarManager.LockUpdate := False;
  end;

  TdxStatusBarTextPanelStyle(dxStatusBar.Panels[0].PanelStyle).ImageIndex := 5;
  TdxStatusBarTextPanelStyle(dxStatusBar.Panels[1].PanelStyle).ImageIndex := 3;
  TdxStatusBarTextPanelStyle(dxStatusBar.Panels[2].PanelStyle).ImageIndex := 4;
end;

procedure TfrmMDIMain.FormCreate(Sender: TObject);
const
  Filter = 'Rich Text Files (*.RTF)|*.RTF';
begin
  OpenDialog.Filter := Filter;
  SaveDialog.Filter := Filter;
  OpenDialog.InitialDir := ExtractFilePath(ParamStr(0));
  SaveDialog.InitialDir := OpenDialog.InitialDir;
  ShowItems(False);
  dxTabbedMDIManager1.TabProperties.HotTrack := True;
  CreateStylesMenu;
  BarManager.Style := bmsUseLookAndFeel;
  dxStatusBar.PaintStyle := stpsUseLookAndFeel;
  CreateSkinsMenuItems(BarManager, siLookAndFeel, dxSkinController1);
  CreateHelpMenuItems(BarManager, siHelp);
end;

procedure TfrmMDIMain.FormShow(Sender: TObject);
begin
  LoadDocument('lipsum.rtf');
end;

procedure TfrmMDIMain.dxBarButtonNewClick(Sender: TObject);
begin
  TfrmMDIChild.Create(Application);
end;

procedure TfrmMDIMain.dxBarButtonOpenClick(Sender: TObject);
begin
  OpenDialog.FileName := '';
  if OpenDialog.Execute then
    LoadDocument(OpenDialog.FileName);
end;

procedure TfrmMDIMain.dxBarButtonCloseClick(Sender: TObject);
begin
  ActiveMDIChild.Close;
end;

procedure TfrmMDIMain.dxBarButtonSaveClick(Sender: TObject);
begin
  SaveFile(False);
end;

procedure TfrmMDIMain.dxBarButtonSaveAsClick(Sender: TObject);
begin
  SaveFile(True);
end;

procedure TfrmMDIMain.dxBarButtonPrintClick(Sender: TObject);
begin
  if PrintDialog.Execute then Editor.Print(FileName);
end;

procedure TfrmMDIMain.dxBarButtonExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMDIMain.dxBarButtonUndoClick(Sender: TObject);
begin
  SendMessage(Editor.Handle, EM_UNDO, 0, 0);
end;

procedure TfrmMDIMain.dxBarButtonCutClick(Sender: TObject);
begin
  Editor.CutToClipboard;
end;

procedure TfrmMDIMain.dxBarButtonCopyClick(Sender: TObject);
begin
  Editor.CopyToClipboard;
end;

procedure TfrmMDIMain.dxBarButtonPasteClick(Sender: TObject);
begin
  Editor.PasteFromClipboard;
end;

procedure TfrmMDIMain.dxBarButtonClearClick(Sender: TObject);
begin
  Editor.ClearSelection;
end;

procedure TfrmMDIMain.dxBarButtonSelectAllClick(Sender: TObject);
begin
  Editor.SelectAll;
end;

procedure TfrmMDIMain.dxBarButtonFindClick(Sender: TObject);
begin
  Editor.SelLength := 0;
  FindDialog.Execute;
end;

procedure TfrmMDIMain.dxBarButtonReplaceClick(Sender: TObject);
begin
  Editor.SelLength := 0;
  ReplaceDialog.Execute;
end;

procedure TfrmMDIMain.dxBarComboFontNameChange(Sender: TObject);
begin
  if not FUpdating then
    Editor.SelAttributes.Name := dxBarComboFontName.Text;
end;

procedure TfrmMDIMain.dxBarComboFontSizeChange(Sender: TObject);
begin
  if not FUpdating then
    Editor.SelAttributes.Size := StrToInt(dxBarComboFontSize.Text);
end;

procedure TfrmMDIMain.dxBarButtonBoldClick(Sender: TObject);
begin
  with Editor.SelAttributes do
    if dxBarButtonBold.Down then
      Style := Style + [fsBold]
    else
      Style := Style - [fsBold];
end;

procedure TfrmMDIMain.dxBarButtonItalicClick(Sender: TObject);
begin
  with Editor.SelAttributes do
    if dxBarButtonItalic.Down then
      Style := Style + [fsItalic]
    else
      Style := Style - [fsItalic];
end;

procedure TfrmMDIMain.dxBarButtonUnderlineClick(Sender: TObject);
begin
  with Editor.SelAttributes do
    if dxBarButtonUnderline.Down then
      Style := Style + [fsUnderline]
    else
      Style := Style - [fsUnderline];
end;

procedure TfrmMDIMain.dxBarComboFontColorChange(Sender: TObject);
begin
  Editor.SelAttributes.Color := dxBarComboFontColor.Color;
end;

procedure TfrmMDIMain.dxBarButtonBulletsClick(Sender: TObject);
begin
  Editor.Paragraph.Numbering := TNumberingStyle(dxBarButtonBullets.Down);
end;

procedure TfrmMDIMain.dxBarButtonAlignClick(Sender: TObject);
begin
  if TdxBarLargeButton(Sender).Down then
    Editor.Paragraph.Alignment := TAlignment(TdxBarLargeButton(Sender).Tag)
  else
    Editor.Paragraph.Alignment := taLeftJustify;
end;

procedure TfrmMDIMain.dxBarButtonProtectedClick(Sender: TObject);
begin
  with Editor.SelAttributes do Protected := not Protected;
end;

procedure TfrmMDIMain.dxBarButtonFontClick(Sender: TObject);
begin
  FontDialog.Font.Assign(Editor.SelAttributes);
  if FontDialog.Execute then
    Editor.SelAttributes.Assign(FontDialog.Font);
end;

procedure TfrmMDIMain.dxBarButtonArrangeAllClick(Sender: TObject);
begin
  Tile;
end;

procedure TfrmMDIMain.dxBarButtonNextWindowClick(Sender: TObject);
begin
  Next;
end;

procedure TfrmMDIMain.dxBarButtonPreviousWindowClick(Sender: TObject);
begin
  Previous;
end;

procedure TfrmMDIMain.dxBarListWindowsGetData(Sender: TObject);
begin
  with dxBarListWindows do
    ItemIndex := Items.IndexOfObject(ActiveMDIChild);
end;

procedure TfrmMDIMain.dxBarListWindowsClick(Sender: TObject);
begin
  with dxBarListWindows do
    TCustomForm(Items.Objects[ItemIndex]).Show;
end;

procedure TfrmMDIMain.dxBarMRUFilesClick(Sender: TObject);
var
  AFileName: String;
begin
  AFileName := dxBarMRUFiles.Items[dxBarMRUFiles.ItemIndex];
  if FileExists(AFileName) then
    with TfrmMDIChild.Create(Application) do
    begin
      FileName := AFileName;
      Editor.Lines.LoadFromFile(FileName);
      SetModified(False);
    end
  else
    Application.MessageBox(PChar(AFileName+#10#13+'File not found.'),'Open',MB_OK or MB_ICONERROR)
end;

procedure TfrmMDIMain.btnTabbedViewClick(Sender: TObject);
begin
  dxTabbedMDIManager1.Active := btnTabbedView.Down;
end;

procedure TfrmMDIMain.cbTextAngle1Change(Sender: TObject);
var
  ATabAngle: TcxRotationAngle;
  ATabPosition: TcxTabPosition;
begin
  dxTabbedMDIManager1.TabProperties.TabPosition :=
    TcxTabPosition(TcxComboBoxProperties(cbTabPosition.Properties).Items.IndexOf(cbTabPosition.EditValue));
  ATabPosition := dxTabbedMDIManager1.TabProperties.TabPosition;
  ATabAngle := TcxRotationAngle(TcxComboBoxProperties(cbTextAngle.Properties).Items.IndexOf(cbTextAngle.EditValue));
  dxTabbedMDIManager1.TabProperties.Rotate := (ATabAngle = ra0) xor (ATabPosition in [tpTop, tpBottom]);
  if ATabAngle = raPlus90 then
    dxTabbedMDIManager1.TabProperties.Options := dxTabbedMDIManager1.TabProperties.Options - [pcoTopToBottomText]
  else
    dxTabbedMDIManager1.TabProperties.Options := dxTabbedMDIManager1.TabProperties.Options + [pcoTopToBottomText];
end;

procedure TfrmMDIMain.cbCloseButtonMode1Change(Sender: TObject);
var
  AIndex: Integer;
  ATabCloseButtonMode: TcxPCButtonMode;
  AIsNavigatorCloseButtonExists: Boolean;
begin
  AIndex := TcxComboBoxProperties(cbCloseButtonMode.Properties).Items.IndexOf(cbCloseButtonMode.EditValue);
  AIsNavigatorCloseButtonExists := AIndex in [3, 4, 5];
  case AIndex of
    0, 3: ATabCloseButtonMode := cbmNone;
    1, 4: ATabCloseButtonMode := cbmActiveTab;
  else
    ATabCloseButtonMode := cbmEveryTab;
  end;
  if AIsNavigatorCloseButtonExists then
    dxTabbedMDIManager1.TabProperties.Options := dxTabbedMDIManager1.TabProperties.Options + [pcoCloseButton]
  else
    dxTabbedMDIManager1.TabProperties.Options := dxTabbedMDIManager1.TabProperties.Options - [pcoCloseButton];
  dxTabbedMDIManager1.TabProperties.CloseButtonMode := ATabCloseButtonMode;
end;

procedure TfrmMDIMain.btnMultilineClick(Sender: TObject);
begin
  dxTabbedMDIManager1.TabProperties.MultiLine := btnMultiline.Down;
end;

initialization
  dxMegaDemoProductIndex :=  dxBarsIndex;

end.