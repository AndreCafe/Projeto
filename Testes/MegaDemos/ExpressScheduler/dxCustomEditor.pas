unit dxCustomEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxSchedulerEventEditor, Menus, cxLookAndFeelPainters,
  cxGraphics, cxCheckComboBox, cxMemo, cxDropDownEdit, cxCheckBox,
  cxSpinEdit, cxTimeEdit, cxCalendar, cxMaskEdit, cxImageComboBox,
  cxTextEdit, StdCtrls, cxControls, cxContainer, cxEdit, cxGroupBox,
  ExtCtrls, cxButtons, ActnList, ImgList, ComCtrls, ToolWin, cxRichEdit,
  cxColorComboBox, cxLookAndFeels, cxLabel, dxBevel;

type
  TcxSchedulerEventCustomEditor = class(TcxSchedulerEventEditorForm)
    cbxCaptions: TcxComboBox;
    Panel2: TPanel;
    StandardToolBar: TToolBar;
    CutButton: TToolButton;
    CopyButton: TToolButton;
    PasteButton: TToolButton;
    UndoButton: TToolButton;
    ToolButton10: TToolButton;
    FontName: TComboBox;
    ToolButton11: TToolButton;
    FontSize: TEdit;
    UpDown1: TUpDown;
    ToolButton2: TToolButton;
    BoldButton: TToolButton;
    ItalicButton: TToolButton;
    UnderlineButton: TToolButton;
    ToolButton16: TToolButton;
    LeftAlign: TToolButton;
    CenterAlign: TToolButton;
    RightAlign: TToolButton;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    PrintDialog: TPrintDialog;
    FontDialog1: TFontDialog;
    ToolbarImages: TImageList;
    ActionList2: TActionList;
    EditUndoCmd: TAction;
    EditCutCmd: TAction;
    EditCopyCmd: TAction;
    EditPasteCmd: TAction;
    EditFontCmd: TAction;
    RichEdit: TcxRichEdit;
    ToolButton1: TToolButton;
    cxColorComboBox1: TcxColorComboBox;
    procedure cbxCaptionsClick(Sender: TObject);
    procedure StyleClick(Sender: TObject);
    procedure AlignClick(Sender: TObject);
    procedure RichEditClick(Sender: TObject);
    procedure FontNameChange(Sender: TObject);
    procedure FontSizeChange(Sender: TObject);
    procedure EditUndoCmdExecute(Sender: TObject);
    procedure EditCutCmdExecute(Sender: TObject);
    procedure EditCopyCmdExecute(Sender: TObject);
    procedure EditPasteCmdExecute(Sender: TObject);
    procedure RichEditPropertiesSelectionChange(Sender: TObject);
    procedure cxColorComboBox1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  protected
    FUpdating: Boolean;
    function Attributes: TTextAttributes;
    procedure GetFontNames;
    procedure LoadEventValuesIntoControls; override;
    procedure UpdateEventValuesFromControls; override;
  public

    { Public declarations }
  end;

implementation

{$R *.dfm}

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure TcxSchedulerEventCustomEditor.LoadEventValuesIntoControls;
begin
  inherited;
  cbxCaptions.EditText := Event.Caption;
  RichEdit.EditValue := Event.Message;
  GetFontNames;
  FUpdating := True;
  try
    cxColorComboBox1.ColorValue := clWindowText;
    FontName.Text := Font.Name;
    FontSize.Text := IntToStr(Font.Size);
  finally
    FUpdating := False;
  end;
  RichEditPropertiesSelectionChange(nil);
end;

procedure TcxSchedulerEventCustomEditor.UpdateEventValuesFromControls;
begin
  inherited;
  Event.Caption := cbxCaptions.EditText;
  Event.Message := RichEdit.EditValue;
end;

procedure TcxSchedulerEventCustomEditor.cbxCaptionsClick(Sender: TObject);
begin
  FModified := True;
end;

procedure TcxSchedulerEventCustomEditor.GetFontNames;
var
  DC: HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
  ReleaseDC(0, DC);
  FontName.Sorted := True;
end;

function TcxSchedulerEventCustomEditor.Attributes: TTextAttributes;
begin
  if RichEdit.SelLength > 0 then
    Result := RichEdit.SelAttributes
  else
    Result := RichEdit.DefAttributes;
end;

procedure TcxSchedulerEventCustomEditor.StyleClick(Sender: TObject);
const
  AValues: array[0..2] of TFontStyle =
    (fsBold, fsItalic, fsUnderline);
begin
  if TToolButton(Sender).Down then
    Attributes.Style := Attributes.Style + [AValues[TToolButton(Sender).Tag]]
  else
    Attributes.Style := Attributes.Style - [AValues[TToolButton(Sender).Tag]];
end;

procedure TcxSchedulerEventCustomEditor.AlignClick(Sender: TObject);
begin
  if FUpdating then Exit;
  RichEdit.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TcxSchedulerEventCustomEditor.RichEditClick(Sender: TObject);
begin
  FModified := True;
end;

procedure TcxSchedulerEventCustomEditor.FontNameChange(Sender: TObject);
begin
  if FUpdating or not RichEdit.HandleAllocated then Exit;
  Attributes.Name := FontName.Items[FontName.ItemIndex];
end;

procedure TcxSchedulerEventCustomEditor.FontSizeChange(Sender: TObject);
begin
  if FUpdating or not RichEdit.HandleAllocated then Exit;
  Attributes.Size := StrToInt(FontSize.Text);
end;

procedure TcxSchedulerEventCustomEditor.EditUndoCmdExecute(
  Sender: TObject);
begin
  with RichEdit do
    if HandleAllocated then SendMessage(Handle, EM_UNDO, 0, 0);
end;

procedure TcxSchedulerEventCustomEditor.EditCutCmdExecute(Sender: TObject);
begin
  RichEdit.CutToClipboard;
end;

procedure TcxSchedulerEventCustomEditor.EditCopyCmdExecute(
  Sender: TObject);
begin
  RichEdit.CopyToClipboard;
end;

procedure TcxSchedulerEventCustomEditor.EditPasteCmdExecute(
  Sender: TObject);
begin
  RichEdit.PasteFromClipboard;
end;

procedure TcxSchedulerEventCustomEditor.RichEditPropertiesSelectionChange(
  Sender: TObject);
begin
  with RichEdit.Paragraph do
  try
    FUpdating := True;
    BoldButton.Down := fsBold in RichEdit.SelAttributes.Style;
    ItalicButton.Down := fsItalic in RichEdit.SelAttributes.Style;
    UnderlineButton.Down := fsUnderline in RichEdit.SelAttributes.Style;
    FontSize.Text := IntToStr(RichEdit.SelAttributes.Size);
    FontName.Text := RichEdit.SelAttributes.Name;
    cxColorComboBox1.ColorValue := RichEdit.SelAttributes.Color;
    case Ord(Alignment) of
      0: LeftAlign.Down := True;
      1: RightAlign.Down := True;
      2: CenterAlign.Down := True;
    end;
  finally
    FUpdating := False;
  end;
end;

procedure TcxSchedulerEventCustomEditor.cxColorComboBox1PropertiesChange(
  Sender: TObject);
begin
  if FUpdating then Exit;
  Attributes.Color := cxColorComboBox1.ColorValue;
end;

end.



