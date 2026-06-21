unit cmProtecao;

interface

uses Classes, SysUtils, Windows, Menus;

type
   TCMProtegeWindows = class (TComponent)
   private
     FAtivo : Boolean;
     FOpcoes : TStrings;
     FNoStartMenu : Boolean;
     FHideDrives : String;
   protected 
     procedure _NoDesktop(No: Boolean); virtual;
     procedure _NoCtrlAltDel(No: Boolean); virtual;
     procedure _NoAltTab(No: Boolean); virtual;
     procedure _NoAltEsc(No: Boolean); virtual;
     procedure _NoWinkeys(No: Boolean); virtual;
     procedure _NoTaskbar(No: Boolean); virtual;
     procedure _NoTaskLinks(No: Boolean); virtual;
     procedure _NoTaskTray(No: Boolean); virtual;
     procedure _NoCtrlEsc(No: Boolean); virtual;
     procedure _NoCtrlPanel(No: Boolean); virtual;
     procedure _NoDownload(No: Boolean); virtual;
     procedure _NoRunCmd(No: Boolean); virtual;
     procedure SetStartMenu(const Value: TPopupMenu); virtual; abstract;
     function GetStartMenu: TPopupMenu; virtual; abstract;

     procedure SetNoStartMenu(const Value: Boolean); virtual; 

     procedure DoHideDrives(ADrives: String); virtual;
   public
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;

     procedure AtivaProtecao; virtual;
     procedure DesativaProtecao; virtual;

     function GetOpcao(const Nome: String): String;
     procedure SetOpcao(const Nome, Valor: String);
     function GetOpcaoBool(const Nome: String): Boolean;
     procedure SetOpcaoBool(const Nome: String; const Valor: Boolean);
     procedure ForceIEStartPage(S: String); virtual; abstract;
     procedure AutoStart(Ativar: Boolean); virtual; abstract;
   published
     property Ativo: Boolean
       read FAtivo;

     property StartMenu: TPopupMenu
       read GetStartMenu write SetStartMenu; 

     property Opcoes: TStrings
       read FOpcoes;  

     property NoStartMenu: Boolean
       read FNoStartMenu write SetNoStartMenu;

     property HideDrives: String
       read FHideDrives write FHideDrives;  
   end;  

const
  cmp_NoCtrlAltDel  = 'NO_CTRLALTDEL';
  cmp_NoDesktop     = 'NO_DESKTOP';
  cmp_NoAltTab      = 'NO_ALTTAB';
  cmp_NoAltEsc      = 'NO_ALTESC';
  cmp_NoWinkeys     = 'NO_WINKEYS';
  cmp_NoTaskbar     = 'NO_TASKBAR';
  cmp_NoTaskLinks   = 'NO_TASKLINKS';
  cmp_NoTaskTray    = 'NO_TASKTRAY';
  cmp_NoCtrlEsc     = 'NO_CTRLESC';
  cmp_NoCtrlPanel   = 'NO_CtrlPanel';
  cmp_NoDownload    = 'NO_DOWNLOAD';
  cmp_NoRunCmd      = 'NO_RUNCMD';

implementation

const
  BoolSt : Array[Boolean] of Char = ('N', 'S');

procedure TCMProtegeWindows._NoDesktop(No: Boolean);
begin
end;

procedure TCMProtegeWindows._NoCtrlAltDel(No: Boolean);
begin
end;

procedure TCMProtegeWindows._NoAltTab(No: Boolean);
begin
end;

procedure TCMProtegeWindows._NoAltEsc(No: Boolean);
begin
end;

procedure TCMProtegeWindows._NoWinkeys(No: Boolean);
begin
end;

procedure TCMProtegeWindows._NoTaskbar(No: Boolean);
begin
end;

procedure TCMProtegeWindows._NoTaskLinks(No: Boolean);
begin
end;

procedure TCMProtegeWindows._NoTaskTray(No: Boolean);
begin
end;

procedure TCMProtegeWindows._NoCtrlEsc(No: Boolean);
begin
end;

procedure TCMProtegeWindows._NoCtrlPanel(No: Boolean);
begin
end;

procedure TCMProtegeWindows._NoDownload(No: Boolean);
begin
end;

procedure TCMProtegeWindows._NoRunCmd(No: Boolean);
begin
end;

constructor TCMProtegeWindows.Create(AOwner: TComponent);
begin
  inherited;
  FAtivo := False;
  FHideDrives := '';
  FOpcoes := TStringList.Create;
  FNoStartMenu := False;
  SetOpcaoBool(cmp_NoCtrlAltDel, False);
  SetOpcaoBool(cmp_NoDesktop, False);
  SetOpcaoBool(cmp_NoAltTab, False);
  SetOpcaoBool(cmp_NoAltEsc, False);
  SetOpcaoBool(cmp_NoWinkeys, False);
  SetOpcaoBool(cmp_NoTaskbar, False);
  SetOpcaoBool(cmp_NoTaskLinks, False);
  SetOpcaoBool(cmp_NoTaskTray, False);
  SetOpcaoBool(cmp_NoCtrlEsc, False);
  SetOpcaoBool(cmp_NoCtrlPanel, False);
  SetOpcaoBool(cmp_NoDownload, False);
  SetOpcaoBool(cmp_NoRunCmd, False);
end;

destructor TCMProtegeWindows.Destroy;
begin
  DesativaProtecao;
  FOpcoes.Free;
  inherited;
end;

procedure TCMProtegeWindows.AtivaProtecao;
begin
  FAtivo := True;

  _NoDesktop(GetOpcaoBool(cmp_NoDesktop));
  _NoCtrlAltDel(GetOpcaoBool(cmp_NoCtrlAltDel));
  _NoAltTab(GetOpcaoBool(cmp_NoAltTab));
  _NoAltEsc(GetOpcaoBool(cmp_NoAltEsc));
  _NoWinkeys(GetOpcaoBool(cmp_NoWinkeys));
  _NoTaskbar(GetOpcaoBool(cmp_NoTaskbar));
  _NoTaskLinks(GetOpcaoBool(cmp_NoTaskLinks));
  _NoTaskTray(GetOpcaoBool(cmp_NoTaskTray));
  _NoCtrlEsc(GetOpcaoBool(cmp_NoCtrlEsc));
  _NoCtrlPanel(GetOpcaoBool(cmp_NoCtrlPanel));
  _NoDownload(GetOpcaoBool(cmp_NoDownload));
  _NoRunCmd(GetOpcaoBool(cmp_NoRunCmd));
  DoHideDrives(FHideDrives);
end;

procedure TCMProtegeWindows.DesativaProtecao; 
begin
  FAtivo := False;

  _NoDesktop(False);
  _NoCtrlAltDel(False);
  _NoAltTab(False);
  _NoAltEsc(False);
  _NoWinkeys(False);
  _NoTaskbar(False);
  _NoTaskLinks(False);
  _NoTaskTray(False);
  _NoCtrlEsc(False);
  _NoCtrlPanel(False);
  _NoDownload(False);
  _NoRunCmd(False);
  FHideDrives := '';
  DoHideDrives('');
end;

function TCMProtegeWindows.GetOpcaoBool(const Nome: String): Boolean;
begin
  Result := (GetOpcao(Nome)=BoolSt[True]);
end;

function TCMProtegeWindows.GetOpcao(const Nome: String): String;
begin
  Result := UpperCase(FOpcoes.Values[UpperCase(Nome)]);
end;

procedure TCMProtegeWindows.SetOpcao(const Nome, Valor: String);
begin
  FOpcoes.Values[UpperCase(Nome)] := UpperCase(Valor);
end;

procedure TCMProtegeWindows.SetOpcaoBool(const Nome: String; const Valor: Boolean);
begin
  SetOpcao(Nome, BoolSt[Valor]);
end;

procedure TCMProtegeWindows.SetNoStartMenu(const Value: Boolean);
begin
  FNoStartMenu := Value;
end;


procedure TCMProtegeWindows.DoHideDrives(ADrives: String);
begin
  //----
end;

end.
 