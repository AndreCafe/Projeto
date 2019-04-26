unit ncgFrmShellFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, 
  ShellLink, ComCtrls,
  TntComCtrls, ShellControls, cxPC, cxControls, JamSelectionList, Shellbrowser, StdCtrls, ExtCtrls,
  LMDCustomScrollBox, LMDScrollBox, LMDSplt, LMDControl, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, cxContainer, cxEdit, cxLabel,
  LMDSimplePanel, cxLookAndFeelPainters, cxGroupBox, cxCheckBox, cxGraphics,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCheckComboBox, cxCheckListBox;


type
  TFrmShellFilter = class(TForm)
    slStartMenu: TJamShellLink;
    slDesktop: TJamShellLink;
    slDesktopCommon: TJamShellLink;
    slStartMenuCommon: TJamShellLink;
    panPri: TLMDSimplePanel;
    Paginas: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    spDesktop: TLMDSplitterPanel;
    spCommon: TLMDSplitterPane;
    jtvDesktopCommon: TJamShellTree;
    LMDSplitterPane2: TLMDSplitterPane;
    jtvDesktop: TJamShellTree;
    cxLabel2: TcxLabel;
    tsMenuIniciar: TcxTabSheet;
    LMDSplitterPanel2: TLMDSplitterPanel;
    LMDSplitterPane3: TLMDSplitterPane;
    jtvStartMenuCommon: TJamShellTree;
    LMDSplitterPane4: TLMDSplitterPane;
    jtvStartMenu: TJamShellTree;
    cxLabel1: TcxLabel;
    lbWin6: TcxLabel;
    procedure btnLoadClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    sNonEnum : String;
    function TAStr: String;
  public
    procedure Load;
    procedure Save;
    { Public declarations }
  end;


function NexFoldersFileName: String;
  
var
  FrmShellFilter: TFrmShellFilter;

implementation

uses IniFiles, ncgFrmPri, ncgShell;

{$R *.dfm}

function NexFoldersFileName: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'nex_folders.ini';
end;

procedure TFrmShellFilter.btnLoadClick(Sender: TObject);
begin
  Load;
end;

procedure TFrmShellFilter.btnSaveClick(Sender: TObject);
begin
  Save;
end;

procedure TFrmShellFilter.FormCreate(Sender: TObject);
var J: TJamSelectionList;
begin
  spCommon.Visible := (Win32MajorVersion<6);
  tsMenuIniciar.TabVisible := (Win32MajorVersion<6);
  jtvDesktopCommon.RootedAtFileSystemFolder := GetShellDir(sdDesktop, False, False);
  jtvDesktopCommon.RootedAt := SF_FILESYSTEMFOLDER;
  Paginas.ActivePageIndex := 0;
  slDesktop.SelectionList
end;

procedure TFrmShellFilter.FormShow(Sender: TObject);
begin
{  lbWin6.Visible := (Win32MajorVersion>5);
  if lbWin6.Visible then
    jtvDesktopCommon.FullExpand;
  jtvDesktopCommon.Enabled := lbWin6.Visible;  }
end;

procedure TFrmShellFilter.Load;
var 
  S: String;
  Ini : TMemIniFile;
  I : Integer;
begin
  S := NexFoldersFileName;
  if FileExists(S) then begin
    slDesktop.SelectionList.LoadFromIniFile(S, TAStr+'Desktop');
    slDesktopCommon.SelectionList.LoadFromIniFile(S, TAStr+'DesktopCommon');
    slStartMenu.SelectionList.LoadFromIniFile(S, TAStr+'StartMenu');
    slStartMenuCommon.SelectionList.LoadFromIniFile(S, TAStr+'StartMenuCommon');
  end;
end;

procedure TFrmShellFilter.Save;
var 
  S: String;
  Ini : TIniFile;
  I : Integer;
begin
  S := NexFoldersFileName;
  Ini := TIniFile.Create(S);
  try
    Ini.WriteBool('Config', TAStr+'OK', True);
    Ini.EraseSection(TAStr+'Desktop');
    Ini.EraseSection(TAStr+'DesktopCommon');
    Ini.EraseSection(TAStr+'StartMenu');
    Ini.EraseSection(TAStr+'StartMenuCommon');
    Ini.UpdateFile;  
  finally
    Ini.Free;
  end;
  slDesktop.SelectionList.SaveToIniFile(S, TAStr+'Desktop');
  slDesktopCommon.SelectionList.SaveToIniFile(S, TAStr+'DesktopCommon');
  slStartMenu.SelectionList.SaveToIniFile(S, TAStr+'StartMenu');
  slStartMenuCommon.SelectionList.SaveToIniFile(S, TAStr+'StartMenuCommon');
end;

function TFrmShellFilter.TAStr: String;
begin
  Result := 'TA'+IntToStr(Tag)+'_';
end;

end.
