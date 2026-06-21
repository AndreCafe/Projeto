{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit MainUnit;

interface
{$I dc.inc}
{$I dcprod.inc}


uses
  dccommon,dcdreamlib,

  {$IFDEF D3}
  dcpload,
  {$ENDIF}

  {$IFDEF DREAMSCRIPTER}
  impreg,
  {$ENDIF}
  {$IFDEF PRODELPHI}
  {$IFDEF DREAMMEMO}
  {$IFDEF DREAMIDE}
  {$IFDEF DREAMDESIGNER}
  dctoolin,
  {$ENDIF}
  {$ENDIF}
  {$ENDIF}
  {$ENDIF}
  dcfdmemo, dcconfig,dcmenu,dcstdctl,dcpalet,dcsystem,dcapp,Windows, Messages, SysUtils,
  Classes, Graphics, Controls, Forms, Dialogs,Menus, StdCtrls, buttons,
  extctrls, dcGen, ComCtrls,dcconsts,DCPalette, regFF, DB, ffdb, dcscript, dxGrReg, dxColReg;
type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    File1: TMenuItem;
    FileOpen: TMenuItem;
    FileSave: TMenuItem;
    FileSaveAll: TMenuItem;
    FileClose: TMenuItem;
    FileCloseAll: TMenuItem;
    N1: TMenuItem;
    FileExit: TMenuItem;
    Edit2: TMenuItem;
    N6: TMenuItem;
    EditDelete: TMenuItem;
    EditPaste: TMenuItem;
    EditCopy: TMenuItem;
    EditCut: TMenuItem;
    N7: TMenuItem;
    EditUndo: TMenuItem;
    EditRedo: TMenuItem;
    EditSelectAll: TMenuItem;
    EditAligntogrid: TMenuItem;
    EditBringtoFront: TMenuItem;
    EditSendtoBack: TMenuItem;
    EditAlign: TMenuItem;
    EditSize: TMenuItem;
    EditScale: TMenuItem;
    EditTabOrder: TMenuItem;
    EditLockControls: TMenuItem;
    HelpMenu: TMenuItem;
    FileSaveas: TMenuItem;
    EditCreationOrder: TMenuItem;
    N3: TMenuItem;
    HelpAbout: TMenuItem;
    HelpContents: TMenuItem;
    N5: TMenuItem;
    HelpOnlinereg: TMenuItem;
    N4: TMenuItem;
    N9: TMenuItem;
    Panel2: TPanel;
    NewButton: TSpeedButton;
    OpenButton: TSpeedButton;
    SaveButton: TSpeedButton;
    CutButton: TSpeedButton;
    CopyButton: TSpeedButton;
    PasteButton: TSpeedButton;
    Bevel1: TBevel;
    RunButton: TSpeedButton;
    ResetButton: TSpeedButton;
    N10: TMenuItem;
    FileUseObject: TMenuItem;
    FileAddtoproject: TMenuItem;
    View1: TMenuItem;
    ViewObjectInspector: TMenuItem;
    ViewAlignmentPalette: TMenuItem;
    ViewToggleFormUnit: TMenuItem;
    HelpHomePage: TMenuItem;
    HelpWritetous: TMenuItem;
    Search1: TMenuItem;
    SearchFind: TMenuItem;
    FindinFiles1: TMenuItem;
    SearchReplace: TMenuItem;
    SearchSearchAgain: TMenuItem;
    IncrementalSearch1: TMenuItem;
    N12: TMenuItem;
    SearchGotoLine: TMenuItem;
    Run1: TMenuItem;
    RunRun: TMenuItem;
    RunParameters: TMenuItem;
    N15: TMenuItem;
    EvaluateModify1: TMenuItem;
    ViewPackages: TMenuItem;
    N17: TMenuItem;
    DCSplitter1: TDCSplitter;
    PaletteMenu: TPopupMenu;
    ViewWindowList: TMenuItem;
    IDEInspector1: TMenuItem;
    N18: TMenuItem;
    ViewNewEditWindow: TMenuItem;
    ViewClipboardHistory: TMenuItem;
    InstantReport: TInstantReport;
    N8: TMenuItem;
    FileOpenWorkspace: TMenuItem;
    FileSaveWorkspace: TMenuItem;
    FileSaveWorkSpaceAs: TMenuItem;
    ViewProjectManager: TMenuItem;
    N13: TMenuItem;
    FileRecentFiles: TMenuItem;
    FileRecentWorkSpaces: TMenuItem;
    DCMenu1: TDCMenu;
    RunProgramReset: TMenuItem;
    VerbDispatcher: TVerbDispatcher;
    PopupComponents: TMenuItem;
    RunQuickRun: TMenuItem;
    FileNewForm: TMenuItem;
    FileNewDataModule: TMenuItem;
    ToolsMenu: TMenuItem;
    ToolsOptionsItem: TMenuItem;
    N11: TMenuItem;
    Palette: TDCCompPalette;
    N2: TMenuItem;
    FilePrint: TMenuItem;
    SpeedButton1: TSpeedButton;
    SRunner: TDCScripter;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PalettePagesChanged(Sender: TObject);
    procedure HelpAboutClick(Sender: TObject);
    procedure InstantReportOpenQuery(FileNames: TStrings;
      var FilerID: String; OpenTypes: TStrings;
      var OpenClass: TOpenObjectClass; var OkToOpen: Boolean);
    procedure InstantReportSaveAsQuery(var FileName, FilerID: String;
      SaveTypes: TStrings; var SaveClass: TSaveObjectClass);
    procedure SpeedButton1Click(Sender: TObject);
  private
  protected
    procedure WMGETMINMAXINFO(Var Message:TMessage);message WM_GETMINMAXINFO;
    procedure WMSETTINGCHANGE(Var Message:TMessage);message WM_SETTINGCHANGE;
    procedure OnSettingChange;
  public
    SkipLimitSize:Boolean;
    {$IFDEF D3}
    DCPackageLoader:TDCPackageLoader;
    {$ENDIF}
  end;

var
  MainForm: TMainForm;

procedure InitInstant;

implementation

uses abounit, uFrmForms, uDM;

{$R *.DFM}
{$R ffclreg.dcr}
{$R dxgrreg.dcr}

{------------------------------------------------------------------}

procedure InitInstant;
begin
  Application.Initialize;
  ShowSplashScreen;
  Application.Title:='Touché Application Framework IDE';  //don't resource
  Application.CreateForm(TMainForm, MainForm);
  {$IFDEF D3}
  If CompiledWithPackages then
    MainForm.DCPackageLoader:=CreateDefaultPackageLoader(MainForm);
  {$ENDIF}
  HideSplashScreen;
  OpenParamFiles;
  
  DefaultNewAppItem  := TDelphiApplication;
  DefaultNewFormItem := TDelphiFormObject;
  DefaultNewDataItem := TDelphiDataModuleObject;
  
  Application.Run;
end;

{------------------------------------------------------------------}

procedure TMainForm.WMGETMINMAXINFO(Var Message:TMessage);
begin
  If SkipLimitSize then exit;
  With PMinMaxInfo(Message.lParam)^ do
  begin
    ptMaxSize.y:=Height;
    ptMinTrackSize.y:=Height;
    ptMaxTrackSize.y:=Height;
    ptMinTrackSize.x:=500;
  end;
  inherited;
  Message.Result:=0;
end;

{------------------------------------------------------------------}

procedure TMainForm.OnSettingChange;
var
  savestate : TWindowState;
begin
  savestate := windowstate;
  SkipLimitSize:=True;

  ClientHeight :=Max(Palette.Height + 3,RunButton.Height*2+5);
  SkipLimitSize:=False;
  windowstate := savestate;
end;

{------------------------------------------------------------------}

procedure TMainForm.WMSETTINGCHANGE(Var Message:TMessage);
begin
  inherited;
  OnSettingChange;
  Message.Result:=0;
end;

{------------------------------------------------------------------}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TdmTouche, dmTouche);
  
  RegFF.Register;
  dxGrReg.Register;
  dxColReg.Register;
  
  SetFlatPropToAll(Self,True);


  File1.Caption                := SFileMenu;
  FileNewForm.Caption          := SFileNewFormMenu;
  FileNewDataModule.Caption    := SFileNewDataModuleMenu;
  FileOpen.Caption             := SFileOpenMenu;
  FileOpenWorkspace.Caption    := SFileOpenWorkspaceMenu;
  FileSaveWorkspace.Caption    := SFileSaveWorkspaceMenu;
  FileSaveWorkSpaceAs.Caption  := SFileSaveWorkSpaceAsMenu;
  FileSave.Caption             := SVerbSave;
  FileSaveas.Caption           := SVerbSaveAs;
  FileSaveAll.Caption          := SFileSaveAllMenu;
  FileClose.Caption            := SVerbClose;
  FileCloseAll.Caption         := SFileCloseAllMenu;
  FileUseObject.Caption        := SFileUseObjectMenu;
  FileAddtoproject.Caption     := SFileAddtoprojectMenu;
  FileRecentFiles.Caption      := SFileRecentFilesMenu;
  FileRecentWorkSpaces.Caption := SFileRecentWorkSpacesMenu;
  FilePrint.Caption            := SFilePrintMenu;
  FileExit.Caption             := SFileExitMenu;
  Edit2.Caption                := SEditMenu;
  EditUndo.Caption             := SEditUndoMenu;
  EditRedo.Caption             := SEditRedoMenu;
  EditCut.Caption              := SEditCutMenu;
  EditCopy.Caption             := SEditCopyMenu;
  EditPaste.Caption            := SEditPasteMenu;
  EditDelete.Caption           := SDelete;
  EditSelectAll.Caption        := SSelectAll;
  EditAligntogrid.Caption      := SAligntoGrid;
  EditBringtoFront.Caption     := SBringToFront;
  EditSendtoBack.Caption       := SSendToBack;
  EditAlign.Caption            := SDesAlign;
  EditSize.Caption             := SDesSize;
  EditScale.Caption            := SDesScale;
  EditTabOrder.Caption         := SDesTabOrder;
  EditCreationOrder.Caption    := SDesCreationOrder;
  EditLockControls.Caption     := SEditLockControlsMenu;
  Search1.Caption              := SSearchMenu;
  SearchFind.Caption           := SSearchFindMenu;
  FindinFiles1.Caption         := SFindinFilesMenu;
  SearchReplace.Caption        := SSearchReplaceMenu;
  SearchSearchAgain.Caption    := SSearchSearchAgainMenu;
  IncrementalSearch1.Caption   := SIncrementalSearchMenu;
  SearchGotoLine.Caption       := SSearchGotoLineMenu;
  View1.Caption                := SViewMenu;
  ViewProjectManager.Caption   := SViewProjectManagerMenu;
  ViewObjectInspector.Caption  := SVerbObjectInspector;
  ViewAlignmentPalette.Caption := SViewAlignmentPaletteMenu;
  ViewToggleFormUnit.Caption   := SViewToggleFormUnitMenu;
  ViewWindowList.Caption       := SViewWindowListMenu;
  ViewNewEditWindow.Caption    := SViewNewEditWindowMenu;
  ViewClipboardHistory.Caption := SViewClipboardHistoryMenu;
  ViewPackages.Caption         := SViewPackagesMenu;
  Run1.Caption                 := SRunMenu;
  RunQuickRun.Caption          := SRunQuickRunMenu;
  RunParameters.Caption        := SRunParametersMenu;
  RunProgramReset.Caption      := SRunProgramResetMenu;
  EvaluateModify1.Caption      := SEvaluateModifyMenu;
  ToolsMenu.Caption            := SToolsMenuMenu;
  ToolsOptionsItem.Caption     := SToolsOptionsItemMenu;
  IDEInspector1.Caption        := SIDEInspectorMenu;
  HelpMenu.Caption             := SHelpMenu;
  HelpContents.Caption         := SHelpContentsMenu;
  HelpHomePage.Caption         := SHelpHomePageMenu;
  HelpWritetous.Caption        := SHelpWritetousMenu;
  HelpOnlinereg.Caption        := SHelpOnlineregMenu;
  HelpAbout.Caption            := SHelpAboutMenu;
  PopupComponents.Caption      := SPopupComponentsMenu;
  Menu := MainMenu;

  NewButton.Hint               := RemoveCharSet(['&','.'],SFileNewMenu);
  OpenButton.Hint              := SOpen;
  SaveButton.Hint              := RemoveCharSet(['&'],SVerbSave);
  CutButton.Hint               := RemoveCharSet(['&'],SEditCutMenu);
  CopyButton.Hint              := SCopy;
  PasteButton.Hint             := SPaste;
  RunButton.Hint               := RemoveCharSet(['&'],SRunMenu);
  ResetButton.Hint             := RemoveCharSet(['&'],SRunProgramResetMenu);


  ReadWinPosFromReg(Self, 'MainForm'); //don't resource
  OnSettingChange;
  AssignPalettePages(Palette.PredefinedPages);
  DCMenu1.Font:=Font;
end;

{------------------------------------------------------------------}

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  WriteWinPosToReg(Self, 'MainForm'); //don't resource
end;

{---------------------------------------------------}

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=InstantReport.CloseAll;
end;

{---------------------------------------------------}

procedure TMainForm.PalettePagesChanged(Sender: TObject);
begin
  OnSettingChange;
end;

{---------------------------------------------------}

procedure TMainForm.HelpAboutClick(Sender: TObject);
begin
  ShowAboutForm;
end;

procedure TMainForm.InstantReportOpenQuery(FileNames: TStrings;
  var FilerID: String; OpenTypes: TStrings;
  var OpenClass: TOpenObjectClass; var OkToOpen: Boolean);
var
  S : String;  
begin
  S := TfrmGridForms.Create(Self).ObtemNome(False, '');
  OkToOpen := (S>'');
  if OkToOpen then begin
    FileNames.Add(S);
    OpenClass := TOpenObjectClass(TOpenFormMemoObject);
    FilerID := GetMWBlobFilerID;
    OkToOpen := True;
  end;  
end;

procedure TMainForm.InstantReportSaveAsQuery(var FileName, FilerID: String;
  SaveTypes: TStrings; var SaveClass: TSaveObjectClass);
begin
  FileName := TfrmGridForms.Create(Self).ObtemNome(True, FileName);
  FileName := ForcaExt(FileName, '.pas');
  FilerID := GetMWBlobFilerID;
  SaveClass := TSaveObjectClass(TFormMemoSaveObject);
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
  RunRunner(SRunner);
end;

initialization

finalization
  {$IFDEF DEBUG}
  FreePropEditors;
  {$ENDIF}

end.

