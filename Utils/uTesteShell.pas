unit uTesteShell;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Registry, LMDCustomComponent, LMDSysInfo, JamSelectionList,
  ExtCtrls, ShellLink, JAMDialogs;

type
  TForm19 = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Button2: TButton;
    Button4: TButton;
    Button1: TButton;
    Button3: TButton;
    Button5: TButton;
    JamFileOperation1: TJamFileOperation;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form19: TForm19;

implementation

uses ncgShell;

{$R *.dfm}

const
  path_explorer = '\Software\Microsoft\Windows\CurrentVersion\Explorer';

function GetStartupKey(const aKey: HKEY = HKEY_CURRENT_USER; const aUser: Boolean = True) : String;
var 
  R : TRegistry;
  S : String;
begin
  R := TRegistry.Create;
  try
    R.RootKey := aKey;
    if aUser then
      S := '\User Shell Folders' else
      S := '\Shell Folders';
      
    if not R.OpenKeyReadOnly(path_explorer+S) then begin
      Result := '';
      Exit;
    end;

    if aKey = HKEY_CURRENT_USER then
      Result := R.ReadString('Startup') else
      Result := R.ReadString('Common Startup');
  finally
    R.Free;
  end;
end;

procedure TForm19.Button1Click(Sender: TObject);
begin
  ShowMessage(GetShellData(esfUserShellFolders, sdStartMenu, False, False));
  
end;

procedure TForm19.Button2Click(Sender: TObject);
begin
  ChangeShellData(False);
end;

procedure TForm19.Button3Click(Sender: TObject);
begin
  ChangeShellData(True);
end;

procedure TForm19.Button4Click(Sender: TObject);
var 
  J: TJamSelectionList;
  S : String;

function Next: Boolean;
begin
  S := J.FindNext;
  Result := (S>'');
end;  

begin
  J := TJamSelectionList.Create(Self);
  try
    J.LoadFromIniFile('c:\meus programas\nexcafe\jamteste2.ini', 'Teste');
    J.ResetFindNext;
    while Next do Memo1.Lines.Add(S);
  finally
    J.Free;
  end;
end;

procedure TForm19.Button5Click(Sender: TObject);
var J : TJamSelectionList;

  S : String;

function Next: Boolean;
begin
  S := J.FindNext;
  Result := (S>'');
end;  

begin
  J := TJamSelectionList.Create(nil);
  try
    J.AddPathToSelection('c:\meus programas\nexcafe');
//    while Next do Memo1.Lines.Add(S);

    case J.IsPathSelected('c:\meus programas\nexcafe\Clientes.rar') of
      ssChecked : ShowMessage('checked');
      ssUnchecked : ShowMessage('unchecked');
      ssUnused : ShowMessage('unused');
      ssNone : ShowMessage('none');
      ssGrayed : ShowMessage('grayed');
    end;
  finally
    J.Free;
  end;

end;

procedure TForm19.Button6Click(Sender: TObject);
begin
  DelTree('c:\meus programas\nexcafe\dados_clientes\keyti', False);
end;

procedure TForm19.FormCreate(Sender: TObject);
begin
  ForceDirectories(GetShellDir(sdPrograms, False, True));
  ForceDirectories(GetShellDir(sdPrograms, True, True));
end;

end.
