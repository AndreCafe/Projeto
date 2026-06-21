unit cxSpreadSheetMain;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, ComCtrls,
  Dialogs, StdCtrls, ExtCtrls, DB, DBTables, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxBar, dxBarExtItems,
  cxSSheet, cxSSTypes, cxSSUtils, cxExcelConst, cxControls, cxSSColorBox,
  ImgList, dxPSCore, dxPSBaseGridLnk, dxPScxSSLnk, ActnList, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPScxPageControlProducer,
  cxClasses;

type
  TcxSpreadSheetMainForm = class(TForm)
    dxBarManager1: TdxBarManager;
    dxFileBar: TdxBarSubItem;
    dxFileOpen: TdxBarButton;
    dxBarButton1: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarCells: TdxBarSubItem;
    dxBarButton5: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarEdit: TdxBarSubItem;
    dxBarAutoFit: TdxBarButton;
    dxBarAutoCalc: TdxBarButton;
    dxBarSubItem3: TdxBarSubItem;
    dxBarLockCol: TdxBarButton;
    dxBarUnlockColumn: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarHideColumn: TdxBarButton;
    dxBarRow: TdxBarSubItem;
    dxBarLockRow: TdxBarButton;
    dxBarUnlockRow: TdxBarButton;
    dxBarRecalc: TdxBarButton;
    dxBarComments: TdxBarSubItem;
    dxBarButton7: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarCombo: TdxBarCombo;
    dxBarEditCell: TdxBarEdit;
    dxBarHideRow: TdxBarButton;
    dxBarUnHideRow: TdxBarButton;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarSpinEdit1: TdxBarSpinEdit;
    dxBarSpinEdit2: TdxBarSpinEdit;
    dxBarButton13: TdxBarButton;
    dxBtnAlignRight: TdxBarButton;
    dxBtnAlignCenter: TdxBarButton;
    dxBtnAlignLeft: TdxBarButton;
    dxBtnItalicFont: TdxBarButton;
    dxBtnBold: TdxBarButton;
    dxBtnUnderLine: TdxBarButton;
    dxBtnStrikeOut: TdxBarButton;
    FontNameBar: TdxBarFontNameCombo;
    FontSizeBar: TdxBarSpinEdit;
    ColorBar: TdxBarColorCombo;
    dxBarMerge: TdxBarButton;
    dxBarUnMerge: TdxBarButton;
    cxSSBook: TcxSpreadSheetBook;
    dxBarButton14: TdxBarButton;
    dxBarButton15: TdxBarButton;
    LoadingPanel: TPanel;
    Progress: TProgressBar;
    Label1: TLabel;
    dxBarButton17: TdxBarButton;
    dxBarButton18: TdxBarButton;
    dxBarButton19: TdxBarButton;
    dxBarButton20: TdxBarButton;
    dxBarButton21: TdxBarButton;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarButton22: TdxBarButton;
    dxBarButton23: TdxBarButton;
    dxBarButton24: TdxBarButton;
    dxBarButton25: TdxBarButton;
    dxBarButton26: TdxBarButton;
    dxBarButton27: TdxBarButton;
    dxBarSubItem5: TdxBarSubItem;
    dxBarButton28: TdxBarButton;
    dxBarSubItem6: TdxBarSubItem;
    dxBarButton30: TdxBarButton;
    SheetPopupMenu: TdxBarPopupMenu;
    CaptionBarPopupMenu: TdxBarPopupMenu;
    dxBarButton31: TdxBarButton;
    dxBarButton32: TdxBarButton;
    ImageList: TImageList;
    dxBarButton33: TdxBarButton;
    dxBarButton34: TdxBarButton;
    dxBarButton35: TdxBarButton;
    dxBarButton36: TdxBarButton;
    dxBarButton37: TdxBarButton;
    dxBarButton38: TdxBarButton;
    dxBarButton41: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton39: TdxBarButton;
    dxBarButton42: TdxBarButton;
    dxComponentPrinter: TdxComponentPrinter;
    dxComponentPrinterLink1: TdxSpreadSheetBookReportLink;
    dxBarButton40: TdxBarButton;
    dxBarButton43: TdxBarButton;
    dxBarButton46: TdxBarButton;
    dxBarButton47: TdxBarButton;
    dxBarButton48: TdxBarButton;
    dxBarButton49: TdxBarButton;
    imgBordersImages: TImageList;
    ComboUndo: TdxBarCombo;
    ComboRedo: TdxBarCombo;
    ActionList1: TActionList;
    actUndo: TAction;
    actRedo: TAction;
    dxPSEngineController: TdxPSEngineController;
    miHelp: TdxBarSubItem;
    procedure mnuCellsClick(Sender: TObject);
    procedure mnuConfigClick(Sender: TObject);
    procedure ColMenuClick(Sender: TObject);
    procedure DefSizeChange(Sender: TObject);
    procedure RowMenuClick(Sender: TObject);
    procedure mnuFileClick(Sender: TObject);
    procedure mnuEditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxSSBookSetSelection(Sender: TObject;
      ASheet: TcxSSBookSheet);
    procedure FormatBarChange(Sender: TObject);
    procedure dxBarCurEditCellChange(Sender: TObject);
    procedure dxBarButton14Click(Sender: TObject);
    procedure cxSSBookProgress(Sender: TObject; APosition: Byte);
    procedure dxBarButton15Click(Sender: TObject);
    procedure Summary(Sender: TObject);
    procedure dxBarButton25Click(Sender: TObject);
    procedure dxBarButton22Click(Sender: TObject);
    procedure InsertMenuItemClick(Sender: TObject);
    procedure cxSSBookSheetPopupMenu(Sender: TObject; X, Y: Integer);
    procedure cxSSBookTitlePopupMenu(Sender: TObject; X, Y: Integer);
    procedure dxBarEditCellExit(Sender: TObject);
    procedure FontSizeBarButtonClick(Sender: TdxBarSpinEdit;
      Button: TdxBarSpinEditButton);
    procedure dxBarButton31Click(Sender: TObject);
    procedure dxBarButton32Click(Sender: TObject);
    procedure dxBarButton33Click(Sender: TObject);
    procedure dxBarButton34Click(Sender: TObject);
    procedure dxBarButton35Click(Sender: TObject);
    procedure dxBarButton36Click(Sender: TObject);
    procedure dxBarButton37Click(Sender: TObject);
    procedure dxBarButton23Click(Sender: TObject);
    procedure dxBarButton38Click(Sender: TObject);
    procedure dxBarButton41Click(Sender: TObject);
    procedure dxBarButton39Click(Sender: TObject);
    procedure dxComponentPrinterBeforePreview(Sender: TObject;
      AReportLink: TBasedxReportLink);
    procedure dxComponentPrinterStartPrint(Sender: TObject;
      AReportLink: TBasedxReportLink; APageCount: Integer);
    procedure dxComponentPrinterEndPrint(Sender: TObject;
      AReportLink: TBasedxReportLink);
    procedure dxBarButton42Click(Sender: TObject);
    procedure cxSSBookCaptionPopupMenu(Sender: TObject; X, Y: Integer);
    procedure dxBarButton40Click(Sender: TObject);
    procedure dxBarButton43Click(Sender: TObject);
    procedure dxBarButton47Click(Sender: TObject);
    procedure dxBarButton49Click(Sender: TObject);
    procedure dxBarButton48Click(Sender: TObject);
    procedure dxBarContainerItem1PaintBar(Sender: TObject; Canvas: TCanvas;
      const R: TRect);
    procedure ComboUndoDropDown(Sender: TObject);
    procedure ComboUndoChange(Sender: TObject);
    procedure ComboRedoDropDown(Sender: TObject);
    procedure ComboMeasureItem(Sender: TdxBarCustomCombo;
      AIndex: Integer; var AHeight: Integer);
    procedure ComboUndoClick(Sender: TObject);
    procedure ComboRedoClick(Sender: TObject);
    procedure ComboDrawItem(Sender: TdxBarCustomCombo;
      AIndex: Integer; ARect: TRect; AState: TOwnerDrawState);
    procedure ComboRedoChange(Sender: TObject);
    procedure actUndoUpdate(Sender: TObject);
    procedure actRedoUpdate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCopyExecute(Sender: TObject);
    procedure actPasteExecute(Sender: TObject);
    procedure actCutExecute(Sender: TObject);
    procedure AlwaysEnabled(Sender: TObject);
    procedure cxSSBookActiveSheetChanging(Sender: TcxCustomSpreadSheetBook;
      const ActiveSheet: Integer; var CanSelect: Boolean);
  private
    FIsUpdate: Boolean;
    function SelRect(const ARect: TRect): string;
    procedure DrawUndoRedoItem(Sender: TdxBarCustomCombo; AIndex: Integer;
      ARect: TRect; AState: TOwnerDrawState; AActionString: String);
    function SaveSheet: Boolean;
  end;

var
  cxSpreadSheetMainForm: TcxSpreadSheetMainForm;

implementation
{$R *.dfm}

uses ShellAPI, cxSpreadSheetModify, dxDemoUtils;

resourcestring
  sdxInvalidPrintArea = 'You''ve selected a single cell for print area.' + #13#10#13#10 +
    'If this is correct, click OK.' + #13#10 +
    'If you selected single cell by mistake, click Cancel, select the cell you want to include, and then click Set Print Area again.';

type
  TcxSSBookAccess = class(TcxCustomSpreadSheetBook);
  TcxSSBookSheetAccess = class(TcxSSBookSheet);
  TcxSheetAccess = class(TcxSSBookSheet);

function TcxSpreadSheetMainForm.SelRect(const ARect: TRect): string;
var
  RC: Boolean;
begin
  RC := dxBarButton15.Down;
  with  TcxSSUtils do
  begin
    Result := ColumnNameByIndex(ARect.Left, RC) + RowNameByIndex(ARect.Top, RC);
    if (ARect.Left <> ARect.Right) or (ARect.Top <> ARect.Bottom) then
      Result := Result + ':' + ColumnNameByIndex(ARect.Right, RC) +
        RowNameByIndex(ARect.Bottom, RC);
  end;
end;

procedure TcxSpreadSheetMainForm.mnuCellsClick(Sender: TObject);
begin
  case (Sender as TdxBarButton).Tag of
    101:
      cxSSBook.ActiveSheet.SetMergedState(cxSSBook.ActiveSheet.SelectionRect, True);
    102:
      cxSSBook.ActiveSheet.SetMergedState(cxSSBook.ActiveSheet.SelectionRect, False);
    103: ;
    104: ;
    105: ;
    106:
      cxSSBook.ActiveSheet.FormatCells(cxSSBook.ActiveSheet.SelectionRect);
  end;
end;

procedure TcxSpreadSheetMainForm.mnuConfigClick(Sender: TObject);
var
  AKey: Boolean;
const
  AStyles: array[Boolean] of TcxSSPainterType = (ptOffice97Style, ptOfficeXPStyle);

begin
  AKey := (Sender as TdxBarButton).Down;
  case (Sender as TdxBarButton).Tag of
    201:
      cxSSBook.PainterType := AStyles[AKey];
    202:
      cxSSBook.ShowCaptionBar := AKey;
    203:
      cxSSBook.ShowGrid := AKey;
    204:
      cxSSBook.ShowHeaders := AKey;
    205:
      cxSSBook.ShowFormulas := AKey;
    206:
      begin
        cxSSBook.AutoRecalc := AKey;
        cxSSBook.UpdateControl;
      end;
    207:
      if not cxSSBook.AutoRecalc then
      begin
        cxSSBook.AutoRecalc := True;
        cxSSBook.Recalc;
        cxSSBook.AutoRecalc := False;
        cxSSBook.UpdateControl;
      end;
    208:;
  end;
end;

procedure TcxSpreadSheetMainForm.ColMenuClick(Sender: TObject);
var
  AKey: Integer;
begin
  AKey := (Sender as TdxBarButton).Tag;
  case AKey of
   201, 202:
     cxSSBook.ActiveSheet.SetVisibleState(cxSSBook.ActiveSheet.SelectionRect, True, False, AKey = 202);
  end;
end;

procedure TcxSpreadSheetMainForm.DefSizeChange(Sender: TObject);
var
  ASpin: TdxBarSpinEdit;
begin
  ASpin := Sender as TdxBarSpinEdit;
  case ASpin.Tag of
    0:
      cxSSBook.DefaultColWidth := ASpin.IntCurValue;
    1:
      cxSSBook.DefaultRowHeight := ASpin.IntCurValue;
  end;
end;

procedure TcxSpreadSheetMainForm.RowMenuClick(Sender: TObject);
var
  AKey: Integer;
begin
  AKey := (Sender as TdxBarButton).Tag;
  case AKey of
    301, 302:
      cxSSBook.ActiveSheet.SetVisibleState(cxSSBook.ActiveSheet.SelectionRect, False, True, AKey = 302);
  end;
end;

procedure TcxSpreadSheetMainForm.mnuFileClick(Sender: TObject);
begin
  case (Sender as TdxBarButton).Tag of
    1:
      if OpenDialog.Execute then
      begin
        try
          try
           cxSSBook.LoadFromFile(OpenDialog.FileName);
          except
            try
              cxSSBook.PageCount := 1;
            finally
              cxSSBook.UpdateControl;
            end;
          end
        finally
          dxBarButton10.Down := cxSSBook.ShowGrid;
        end;
      end;
    2: SaveSheet;
    3: Application.Terminate;
  end;
  cxSSBook.SetFocus;
end;

procedure TcxSpreadSheetMainForm.mnuEditClick(Sender: TObject);
var
  AForm: TcxSpreadSheetModifyForm;
  APoint: TPoint;
begin
  AForm := TcxSpreadSheetModifyForm.Create(nil);
  GetCursorPos(APoint);
  AForm.Top := APoint.Y  - AForm.Height shr 1;
  AForm.Left := APoint.X  - AForm.Width shr 1;
  try
    case (Sender as TdxBarButton).Tag of
      103:
        if AForm.Execute(mtDelete) then
          cxSSBook.ActiveSheet.DeleteCells(cxSSBook.SelectionRect, AForm.Modify);
      104:
        if AForm.Execute(mtInsert) then
         cxSSBook.ActiveSheet.InsertCells(cxSSBook.SelectionRect, AForm.Modify);
    end;
  finally
    AForm.Free;
  end;
end;

procedure TcxSpreadSheetMainForm.FormCreate(Sender: TObject);
begin
  FIsUpdate := False;
  FontNameBar.Text := 'Tahoma';
  FontNameBar.Items.Assign(Screen.Fonts);
  FontSizeBar.IntCurValue := 10;
  PixelsPerInch := 96;
  CreateHelpMenuItems(dxBarManager1, miHelp);
end;

procedure TcxSpreadSheetMainForm.cxSSBookSetSelection(Sender: TObject; ASheet: TcxSSBookSheet);
var
  AText: String;
begin
  dxBtnAlignCenter.Down := False;
  dxBtnAlignLeft.Down := False;
  dxBtnAlignRight.Down := False;
  FIsUpdate := True;
  try
    with TcxSSBookSheetAccess(ASheet).GetCellObject(ASheet.SelectionRect.Left,
      ASheet.SelectionRect.Top) do
    begin
      FontNameBar.Text := Style.Font.Name;
      FontSizeBar.IntCurValue := Style.Font.Size;
      if Style.Font.FontColor > 55 then
        ColorBar.Color := clBlack
      else
        ColorBar.Color := cxSSBook.Palette^[Style.Font.FontColor];
      dxBtnBold.Down := fsBold in Style.Font.Style;
      dxBtnItalicFont.Down := fsItalic in Style.Font.Style;
      dxBtnStrikeOut.Down := fsStrikeOut in Style.Font.Style;
      dxBtnUnderline.Down := fsUnderLine in Style.Font.Style;
      if DisplayTextAlignment = dtaCenter then
        dxBtnAlignCenter.Down := True
      else
        if DisplayTextAlignment = dtaLeft then
          dxBtnAlignLeft.Down := True
        else
        if DisplayTextAlignment = dtaRight then
          dxBtnAlignRight.Down := True;
      dxBarEditCell.Text := Text;
      Free;
    end;
    with ASheet, TcxSSUtils do
    begin
      AText := ColumnNameByIndex(SelectionRect.Left, False) + RowNameByIndex(SelectionRect.Top, False);
      if (SelectionRect.Left <> SelectionRect.Right) or (SelectionRect.Top <> SelectionRect.Bottom) then
        AText := AText + ' x ' + ColumnNameByIndex(SelectionRect.Right, False) +
          RowNameByIndex(SelectionRect.Bottom, False);
    end;
    case Length(AText) of
      2, 3: AText := '            ' + AText;
      7, 8, 9: AText := '      ' + AText;
    end;
    dxBarCombo.Text := AText;
  finally
    FIsUpdate := False;
  end;
end;

procedure TcxSpreadSheetMainForm.FormatBarChange(Sender: TObject);
var
  I, J: Integer;
  AKey: Integer;
const
  AAlign: array [4..6] of TcxHorzTextAlign = (haLEFT, haCENTER, haRIGHT);
begin
  if FIsUpdate then Exit;
  if Sender is TdxBarWindowItem then
    AKey := (Sender as TdxBarWindowItem).Tag
  else
    AKey := (Sender as TdxBarButton).Tag;
  for I := cxSSBook.SelectionRect.Left to cxSSBook.SelectionRect.Right do
    for J := cxSSBook.SelectionREct.Top to cxSSBook.SelectionRect.Bottom do
    with cxSSBook.ActiveSheet.GetCellObject(I, J) do
    begin
      case Akey of
        1:
          Style.Font.Name := FontNameBar.Text;
        2:
          Style.Font.FontColor := xlsSetColor(ColorBar.Color, cxSSBook.Palette, 1);
        3:
          Style.Font.Size := FontSizeBar.IntCurValue;
        4..6:
        begin
          dxBtnAlignCenter.Down := False;
          dxBtnAlignLeft.Down := False;
          dxBtnAlignRight.Down := False;
          (Sender as TdxBarButton).Down := True;
          if (Sender as TdxBarButton).Down then
            Style.HorzTextAlign := AAlign[AKey];
        end;
       7:
        if (Sender as TdxBarButton).Down then
           Style.Font.Style := Style.Font.Style + [fsItalic]
         else
           Style.Font.Style := Style.Font.Style - [fsItalic];
        8:
         if (Sender as TdxBarButton).Down then
           Style.Font.Style := Style.Font.Style + [fsBold]
         else
           Style.Font.Style := Style.Font.Style - [fsBold];
        9:
         if (Sender as TdxBarButton).Down then
           Style.Font.Style := Style.Font.Style + [fsUnderLine]
         else
           Style.Font.Style := Style.Font.Style - [fsUnderLine];
        10:
         if (Sender as TdxBarButton).Down then
           Style.Font.Style := Style.Font.Style + [fsStrikeOut]
         else
           Style.Font.Style := Style.Font.Style - [fsStrikeOut];
      end;
      Free;
    end;
    case AKey of
      11, 12:
      cxSSBook.ActiveSheet.SetMergedState(cxSSBook.SelectionRect, AKey = 11);
    end;
    TcxSSBookSheetAccess(cxSSBook.ActiveSheet).ViewInfo.UpdateViewInfo;
end;

procedure TcxSpreadSheetMainForm.dxBarCurEditCellChange(Sender: TObject);
var
  ASheet: TcxSheetAccess;
  ACellRec: TcxSSCellRec;
begin
  if FIsUpdate then Exit;
  ASheet := TcxSheetAccess(cxSSBook.ActiveSheet);
  ACellRec := ASheet.DataStorage[ASheet.SelectionRect.Left, ASheet.SelectionRect.Top];
  ACellRec.Text := dxBarEditCell.CurText;
  ASheet.DataStorage[ASheet.SelectionRect.Left, ASheet.SelectionRect.Top] := ACellRec;
  TcxSSBookSheetAccess(cxSSBook.ActiveSheet).ViewInfo.UpdateViewInfo;
  cxSSBook.ActiveSheet.Invalidate;
end;

procedure TcxSpreadSheetMainForm.dxBarButton14Click(Sender: TObject);
begin
  cxSSBook.BufferedPaint := (Sender as TdxBarButton).Down;
end;

procedure TcxSpreadSheetMainForm.cxSSBookProgress(Sender: TObject; APosition: Byte);
begin
  Progress.Position := APosition;
  if APosition = 0 then
  begin
    Label1.Visible := True;
    Progress.Visible := True;
  end
  else
    if APosition = 100 then
    begin
      Label1.Visible := False;
      Progress.Visible := False;
    end;
  LoadingPanel.Update;
end;

procedure TcxSpreadSheetMainForm.dxBarButton15Click(Sender: TObject);
begin
  cxSSBook.R1C1ReferenceStyle := (Sender as TdxBarButton).Down;
end;

procedure TcxSpreadSheetMainForm.Summary(Sender: TObject);
var
  S: string;
  ARect: TRect;
  ACell: TcxssCellObject;
const
  AFunc: array[0..4] of string = ('SUM', 'AVERAGE', 'COUNT', 'MAX', 'MIN');

begin
  with cxSSBook do
  begin
    ARect := SelectionRect;
    S := SelRect(ARect);
    ACell := ActiveSheet.GetCellObject(ARect.Right, ARect.Bottom + 1);
    try
      ACell.Text := '=' + AFunc[(Sender as TdxBarButton).Tag] + '(' + S + ')';
    finally
      ACell.Free;
    end;
    cxSSBook.UpdateControl;
  end;
end;

procedure TcxSpreadSheetMainForm.dxBarButton25Click(Sender: TObject);
begin
  cxSSBook.BeginUpdate;
  cxSSBook.ClearAll;
  cxSSBook.PageCount := 1;
  cxSSBook.ActiveSheet.Caption := 'Sheet 1';
  cxSSBook.EndUpdate;
end;

procedure TcxSpreadSheetMainForm.dxBarButton22Click(Sender: TObject);
begin
  Summary(Sender);
end;

procedure TcxSpreadSheetMainForm.InsertMenuItemClick(Sender: TObject);
var
  AForm: TcxSpreadSheetModifyForm;
begin
  cxSSBook.BeginUpdate;
  try
    case (Sender as TdxBarButton).Tag of
      1: begin
       AForm := TcxSpreadSheetModifyForm.Create(Self);
       with AForm do
       try
         AForm.Top := (Top + Height) shr 1;
         AForm.Left := (Left + Width) shr 1;
         if AForm.Execute(mtInsert) then
           cxSSBook.ActiveSheet.InsertCells(cxSSBook.SelectionRect, Modify);
       finally
         AForm.Free;
       end;
       end;
      2:
        cxSSBook.ActiveSheet.InsertCells(cxSSBook.SelectionRect, msAllRow);
      3:
        cxSSBook.ActiveSheet.InsertCells(cxSSBook.SelectionRect, msAllCol);
      4:
        cxSSBook.PageCount := cxSSBook.PageCount + 1;
    end;
  finally
    cxSSBook.EndUpdate;
  end;
end;

procedure TcxSpreadSheetMainForm.cxSSBookSheetPopupMenu(Sender: TObject; X, Y: Integer);
begin
  SheetPopupMenu.PopupFromCursorPos;
end;

procedure TcxSpreadSheetMainForm.cxSSBookTitlePopupMenu(Sender: TObject; X, Y: Integer);
begin
  CaptionBarPopupMenu.PopupFromCursorPos;
end;

procedure TcxSpreadSheetMainForm.dxBarEditCellExit(Sender: TObject);
begin
  with cxSSBook.ActiveSheet.GetCellObject(cxSSbook.SelectionRect.Left, cxSSbook.ActiveSheet.SelectionRect.Top) do
  begin
    Text := Text;
    Free;
  end;
  TcxSSBookSheetAccess(cxSSBook.ActiveSheet).ViewInfo.UpdateViewInfo;
  cxSSBook.ActiveSheet.Invalidate;
end;

procedure TcxSpreadSheetMainForm.FontSizeBarButtonClick(Sender: TdxBarSpinEdit;
  Button: TdxBarSpinEditButton);
begin
  FormatBarChange(Sender);
end;

procedure TcxSpreadSheetMainForm.dxBarButton31Click(Sender: TObject);
begin
  cxSSBook.ActiveSheet.FormatCells(cxSSBook.ActiveSheet.SelectionRect);
end;

procedure ShowWarningMessage;
begin
  ShowMessage('Note: Printing functionality for the ExpressSpreadSheet is only available if you own a copy of the ExpressPrinting System, which is sold separately');
end;

procedure TcxSpreadSheetMainForm.dxBarButton33Click(Sender: TObject);
begin
  cxSSBook.History.Undo(1);
end;

procedure TcxSpreadSheetMainForm.dxBarButton34Click(Sender: TObject);
begin
  cxSSBook.History.Redo(1);
end;

procedure TcxSpreadSheetMainForm.dxBarButton35Click(Sender: TObject);
begin
  with cxSSBook.ActiveSheet do
    Copy(SelectionRect, True);
end;

procedure TcxSpreadSheetMainForm.dxBarButton36Click(Sender: TObject);
begin
  with cxSSBook.ActiveSheet do
    Copy(SelectionRect, False);
end;

procedure TcxSpreadSheetMainForm.dxBarButton37Click(Sender: TObject);
begin
  with cxSSBook.ActiveSheet do
    Paste(SelectionRect.TopLeft);
end;

procedure TcxSpreadSheetMainForm.dxBarButton23Click(Sender: TObject);
const
  ASortType: array[0..1] of TcxSortType = (stAscending, stDescending);
begin
  with cxSSBook.ActiveSheet do
    Sort(SelectionRect, [ASortType[TdxBarButton(Sender).Tag]]);
end;

procedure TcxSpreadSheetMainForm.dxBarButton32Click(Sender: TObject);
begin
  dxComponentPrinter.ReportLink[0].Preview;
end;

procedure TcxSpreadSheetMainForm.dxBarButton38Click(Sender: TObject);
begin
  dxComponentPrinter.ReportLink[0].PageSetup;
end;

procedure TcxSpreadSheetMainForm.dxBarButton41Click(Sender: TObject);
begin
  dxComponentPrinter.ReportLink[0].Print(True, nil);
end;

procedure TcxSpreadSheetMainForm.dxBarButton39Click(Sender: TObject);
var
  R: TRect;
begin
  R := cxSSBook.ActiveSheet.SelectionRect;
  if (R.Right <> R.Left) or (R.Bottom <> R.Top) or (MessageDlg(sdxInvalidPrintArea, mtWarning, [mbOK, mbCancel], 0) = mrOK) then
    TCustomdxSpreadSheetReportLink(dxComponentPrinter.ReportLink[0]).PrintArea := R;
end;

procedure TcxSpreadSheetMainForm.dxComponentPrinterBeforePreview(Sender: TObject;
  AReportLink: TBasedxReportLink);
begin
  ShowWarningMessage;
end;

procedure TcxSpreadSheetMainForm.dxComponentPrinterStartPrint(Sender: TObject;
  AReportLink: TBasedxReportLink; APageCount: Integer);
begin
  ShowWarningMessage;
end;

procedure TcxSpreadSheetMainForm.dxComponentPrinterEndPrint(Sender: TObject;
  AReportLink: TBasedxReportLink);
begin
  ShowWarningMessage;
end;

procedure TcxSpreadSheetMainForm.dxBarButton42Click(Sender: TObject);
begin
  TCustomdxSpreadSheetReportLink(dxComponentPrinter.ReportLink[0]).ClearPrintArea;
end;

procedure TcxSpreadSheetMainForm.cxSSBookCaptionPopupMenu(Sender: TObject; X, Y: Integer);
begin
  CaptionBarPopupMenu.PopupFromCursorPos;
end;

procedure TcxSpreadSheetMainForm.dxBarButton40Click(Sender: TObject);
begin
  with cxSSBook do
    DeleteSheet(ActivePage);
end;

procedure TcxSpreadSheetMainForm.dxBarButton43Click(Sender: TObject);
begin
  cxSSBook.EditActiveSheetCaption;
end;

procedure TcxSpreadSheetMainForm.dxBarButton47Click(Sender: TObject);
begin
  with cxSSBook do
    AddSheetPage;
end;

procedure TcxSpreadSheetMainForm.dxBarButton49Click(Sender: TObject);
begin
  if FIsUpdate then Exit;
  with cxSSBook.ActiveSheet do
    SetVisibleState(SelectionRect, True, True, False);
end;

procedure TcxSpreadSheetMainForm.dxBarButton48Click(Sender: TObject);
begin
  if FIsUpdate then Exit;
  with cxSSBook.ActiveSheet do
    SetVisibleState(SelectionRect, True, True, True);
end;

procedure TcxSpreadSheetMainForm.dxBarContainerItem1PaintBar(
  Sender: TObject; Canvas: TCanvas; const R: TRect);
begin
  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := clRed;
  Canvas.FillRect(R);
end;

procedure TcxSpreadSheetMainForm.ComboUndoDropDown(Sender: TObject);
var
  i: Integer;
begin
  TdxBarCombo(Sender).Items.Clear;
  with cxSSBook.History do
    for i:=0 to UndoActions.Count - 1 do
      TdxBarCombo(Sender).Items.Add(UndoActions[i].Description + '                ');
  if TdxBarCombo(Sender).Items.Count > 0 then
    TdxBarCombo(Sender).Items.Add('1');
end;

procedure TcxSpreadSheetMainForm.ComboRedoDropDown(Sender: TObject);
var
  i: Integer;
begin
  TdxBarCombo(Sender).Items.Clear;
  with cxSSBook.History do
    for i:=0 to RedoActions.Count - 1 do
      TdxBarCombo(Sender).Items.Add(RedoActions[i].Description + '                ');
  if TdxBarCombo(Sender).Items.Count > 0 then
    TdxBarCombo(Sender).Items.Add('1');
end;

procedure TcxSpreadSheetMainForm.ComboUndoChange(Sender: TObject);
begin
  if (TdxBarCombo(Sender).ItemIndex >= 0) and (TdxBarCombo(Sender).ItemIndex <> (TdxBarCombo(Sender).Items.Count - 1)) then
    cxSSBook.History.Undo(TdxBarCombo(Sender).ItemIndex + 1);
  TdxBarCombo(Sender).Text := '';
end;

procedure TcxSpreadSheetMainForm.ComboRedoChange(Sender: TObject);
begin
  if (TdxBarCombo(Sender).ItemIndex >= 0) and (TdxBarCombo(Sender).ItemIndex <> (TdxBarCombo(Sender).Items.Count - 1)) then
    cxSSBook.History.Redo(TdxBarCombo(Sender).ItemIndex + 1);
  TdxBarCombo(Sender).Text := '';
end;

procedure TcxSpreadSheetMainForm.ComboMeasureItem(
  Sender: TdxBarCustomCombo; AIndex: Integer; var AHeight: Integer);
begin
  if AIndex = Sender.Items.Count - 1 then
    AHeight := Sender.ItemsHeight[0] + 10;
end;

procedure TcxSpreadSheetMainForm.ComboUndoClick(Sender: TObject);
begin
  cxSSBook.History.Undo(1);
end;

procedure TcxSpreadSheetMainForm.ComboRedoClick(Sender: TObject);
begin
  cxSSBook.History.Redo(1);
end;

procedure TcxSpreadSheetMainForm.DrawUndoRedoItem(Sender: TdxBarCustomCombo; AIndex: Integer; ARect: TRect;
  AState: TOwnerDrawState; AActionString: String);
  procedure UpdateNextItems(AItemIndex: Integer);
  var
    i: Integer;
    Rec: TRect;
  begin
    Rec := ARect;
    for i:=AItemIndex + 1 to Sender.Items.Count - 2 do
    begin
      Rec := Rect(Rec.Left, Rec.Top + Sender.ItemsHeight[AItemIndex], Rec.Right, Rec.Bottom
       + Sender.ItemsHeight[AItemIndex]);
      Sender.Canvas.Brush.Color := clMenu;
      Sender.Canvas.Brush.Style := bsSolid;
      Sender.Canvas.FillRect(Rec);
      Sender.Canvas.TextRect(Rec, Rec.Left, Rec.Top, Sender.Items[i]);
    end;
  end;
  procedure UpdatePreviousItems(AItemIndex: Integer);
  var
    i: Integer;
    Rec: TRect;
  begin
    Rec := ARect;
    for i:= AItemIndex - 1 downto 0 do
    begin
      Rec := Rect(Rec.Left, Sender.ItemsHeight[0] * i, Rec.Right, Sender.ItemsHeight[0] * (i + 1));
      Sender.Canvas.Brush.Color := clHighLight;
      Sender.Canvas.Brush.Style := bsSolid;
      Sender.Canvas.FillRect(Rec);
      Sender.Canvas.TextRect(Rec, Rec.Left, Rec.Top, Sender.Items[i]);
    end;
  end;
  procedure DrawItems(AItemIndex: Integer);
  begin
    UpdatePreviousItems(AIndex);
    UpdateNextItems(AIndex);
  end;
  procedure DrawActionsCount;
  var
    Rec: TRect;
    Lft, Tp: Integer;
  begin
    Rec.Top := Sender.ItemsHeight[0] * (Sender.Items.Count - 1);
    Rec.Left := ARect.Left;
    Rec.Right := ARect.Right;
    Rec.Bottom := Sender.ItemsHeight[0] * (Sender.Items.Count - 1) + Sender.ItemsHeight[Sender.Items.Count - 1];

    Sender.Canvas.Brush.Color := clMenu;
    Sender.Canvas.Brush.Style := bsSolid;
    Sender.Canvas.FillRect(Rec);


    Frame3D(Sender.Canvas, Rec, clBtnShadow, clBtnHighlight, 1);

    Lft := (Rec.Left + Rec.Right) div 2 - (Sender.Canvas.TextWidth(AActionString) div 2);
    Tp := (Rec.Top + Rec.Bottom) div 2 - (Sender.Canvas.TextHeight(AActionString) div 2);

    Sender.Canvas.TextRect(Rec, Lft, Tp, AActionString);
  end;
begin
  if AIndex < 0 then
  begin
    Sender.Canvas.Brush.Color := clMenu;
    Sender.Canvas.Brush.Style := bsSolid;
    Sender.Canvas.FillRect(ARect);
    ImageList.Draw(Sender.Canvas, ARect.Left, ARect.Top, Sender.ImageIndex);
  end else
  begin
    if AIndex = (Sender.Items.Count - 1) then
    begin
      Sender.Canvas.Brush.Color := clMenu;
      Sender.Canvas.Brush.Style := bsSolid;
      Sender.Canvas.FillRect(ARect);
      if (odSelected	in AState) then
      begin
        UpdatePreviousItems(AIndex);
        AActionString := Format('Undo %d Actions', [AIndex]);
      end
    end else
    begin
      if odSelected	in AState then
      begin
        Sender.Canvas.Brush.Color := clHighLight;
        Sender.Canvas.Brush.Style := bsSolid;
        Sender.Canvas.FillRect(Rect(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom));
        UpdatePreviousItems(AIndex);
        AActionString := Format('Undo %d Actions', [AIndex + 1]);
      end else
      begin
        Sender.Canvas.Brush.Color := clMenu;
        Sender.Canvas.Brush.Style := bsSolid;
        Sender.Canvas.FillRect(ARect);
        UpdateNextItems(AIndex);
        AActionString := 'Cancel';
      end;
      Sender.Canvas.TextRect(ARect, ARect.Left, ARect.Top, Sender.Items[AIndex]);
    end;
    DrawActionsCount;
  end;
end;

procedure TcxSpreadSheetMainForm.ComboDrawItem(
  Sender: TdxBarCustomCombo; AIndex: Integer; ARect: TRect;
  AState: TOwnerDrawState);
var
  Str: String;
begin
  if TComponent(Sender).Owner.Name = 'ComboUndo' then
    Str := 'Undo %d Actions'
  else
    Str := 'Redo %d Actions';
  DrawUndoRedoItem(Sender, AIndex, ARect, AState, Str);
end;

procedure TcxSpreadSheetMainForm.actUndoUpdate(Sender: TObject);
begin
  TCustomAction(Sender).Enabled := cxSSBook.History.UndoActions.Count > 0;
end;

procedure TcxSpreadSheetMainForm.actRedoUpdate(Sender: TObject);
begin
  TCustomAction(Sender).Enabled := cxSSBook.History.RedoActions.Count > 0;
end;

function TcxSpreadSheetMainForm.SaveSheet: Boolean;
begin
  Result := SaveDialog.Execute;
  if Result then
  begin
    cxSSBook.SaveToFile(SaveDialog.FileName);
    cxSSBook.History.Clear;
  end;
end;

procedure TcxSpreadSheetMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  Res: Word;
begin
  Action := caFree;
  if cxSSBook.History.UndoActions.Count > 0 then
  begin
    Res := MessageDlg('Sheet has been changed. Do you want to save it?', mtWarning, mbYesNoCancel, 0);
    case Res of
      mrYes: if SaveSheet then Action := caFree else
        Action := caNone;
      mrNo: Action := caFree;
      mrCancel: Action := caNone;
    end;
  end
end;

procedure TcxSpreadSheetMainForm.actCopyExecute(Sender: TObject);
begin
  with cxSSBook.ActiveSheet do
    Copy(SelectionRect, False);
end;

procedure TcxSpreadSheetMainForm.actPasteExecute(Sender: TObject);
begin
  with cxSSBook.ActiveSheet do
    Paste(SelectionRect.TopLeft);
end;

procedure TcxSpreadSheetMainForm.actCutExecute(Sender: TObject);
begin
  with cxSSBook.ActiveSheet do
    Copy(SelectionRect, True);
end;

procedure TcxSpreadSheetMainForm.AlwaysEnabled(Sender: TObject);
begin
  TCustomAction(Sender).Enabled := True;
end;

procedure TcxSpreadSheetMainForm.cxSSBookActiveSheetChanging(
  Sender: TcxCustomSpreadSheetBook; const ActiveSheet: Integer;
  var CanSelect: Boolean);
begin
  if CanSelect then TCustomdxSpreadSheetReportLink(dxComponentPrinter.ReportLink[0]).ClearPrintArea;
end;

initialization
  dxMegaDemoProductIndex := dxSpreadSheetIndex;

end.
