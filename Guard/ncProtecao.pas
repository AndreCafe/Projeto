unit ncProtecao;

interface

uses 
  Classes,
  Menus,
  SysUtils, 
  Windows;

type
   TncProtegeWindows = class (TComponent)
   private
     FAtivo : Boolean;
     FOpcoes : TStrings;
     FslNonEnum : TStrings;
     FNoStartMenu : Boolean;
     FClassicMenu : Boolean;
     FHideDrives : String;
     FBloqueiaCtrlAltDel : Boolean;
    procedure SetBloqueiaCtrlAltDel(const Value: Boolean);
   protected 
     procedure _NoDesktop(No: Boolean); virtual;
     procedure _NoAltTab(No: Boolean); virtual;
     procedure _NoAltEsc(No: Boolean); virtual;
     procedure _NoWinkeys(No: Boolean); virtual;
     procedure _NoTaskbar(No: Boolean); virtual;
     procedure _NoTaskLinks(No: Boolean); virtual;
     procedure _NoTaskTray(No: Boolean); virtual;
     procedure _NoCtrlEsc(No: Boolean); virtual;
     procedure _NoCtrlPanel(No: Boolean); virtual;
     procedure _NoDownload(No: Boolean); virtual;
     procedure _NoExeDownload(No: Boolean); virtual;
     procedure _NoDocs(No: Boolean); virtual;
     procedure _NoRunCmd(No: Boolean); virtual;
     procedure _NoNetwork(No: Boolean); virtual;
     procedure _NoRightClick(No: Boolean); virtual;
     procedure _NoToolbars(No: Boolean); virtual;
     procedure SetStartMenu(const Value: TPopupMenu); virtual; abstract;
     function GetStartMenu: TPopupMenu; virtual; abstract;

     procedure SetNoStartMenu(const Value: Boolean); virtual; 

     procedure ApplyClassicMenu(aClassic: Boolean); virtual;
     procedure DoHideDrives(ADrives: String); virtual;
   public
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;

     procedure AtivaProtecao; virtual;
     procedure DesativaProtecao; virtual;

     procedure _NoCtrlAltDel(No: Boolean); virtual;

     procedure AplicaNonEnum(aBloquear: Boolean); virtual; abstract;
     
     function GetOpcao(const Nome: String): String;
     procedure SetOpcao(const Nome, Valor: String);
     function GetOpcaoBool(const Nome: String): Boolean;
     procedure SetOpcaoBool(const Nome: String; const Valor: Boolean);
     procedure ForceIEStartPage(S: String); virtual; abstract;
     procedure AutoStart(Ativar: Boolean); virtual; abstract;
     procedure ProtegeTudo;
     procedure DesprotegeTudo;
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

     property ClassicMenu: Boolean
       read FClassicMenu write FClassicMenu;  

     property BloqueiaCtrlAltDel: Boolean
       read FBloqueiaCtrlAltDel write SetBloqueiaCtrlAltDel;  

     property slNonEnum: TStrings
       read FslNonEnum;  
   end;  

const
  ncp_NoCtrlAltDel  = 'NO_CTRLALTDEL';
  ncp_NoDesktop     = 'NO_DESKTOP';
  ncp_NoAltTab      = 'NO_ALTTAB';
  ncp_NoAltEsc      = 'NO_ALTESC';
  ncp_NoWinkeys     = 'NO_WINKEYS';
  ncp_NoTaskbar     = 'NO_TASKBAR';
  ncp_NoTaskLinks   = 'NO_TASKLINKS';
  ncp_NoTaskTray    = 'NO_TASKTRAY';
  ncp_NoCtrlEsc     = 'NO_CTRLESC';
  ncp_NoCtrlPanel   = 'NO_CtrlPanel';
  ncp_NoDownload    = 'NO_DOWNLOAD';
  ncp_NoRunCmd      = 'NO_RUNCMD';
  ncp_NoNetwork     = 'NO_NETWORK';
  ncp_NoRightClick  = 'NO_RIGHTCLICK';
  ncp_NoExeDownload = 'NO_ExeDownload';
  ncp_NoDocs        = 'NO_Documents';
  ncp_NoToolbars    = 'NO_NoToolbars';

implementation

uses ncDebug;

const
  BoolSt : Array[Boolean] of Char = ('N', 'S');

procedure TncProtegeWindows._NoDesktop(No: Boolean);
begin
end;

procedure TncProtegeWindows._NoCtrlAltDel(No: Boolean);
begin
end;

procedure TncProtegeWindows._NoAltTab(No: Boolean);
begin
end;

procedure TncProtegeWindows._NoAltEsc(No: Boolean);
begin
end;

procedure TncProtegeWindows._NoWinkeys(No: Boolean);
begin
end;

procedure TncProtegeWindows._NoTaskbar(No: Boolean);
begin
end;

procedure TncProtegeWindows._NoTaskLinks(No: Boolean);
begin
end;

procedure TncProtegeWindows._NoTaskTray(No: Boolean);
begin
end;

procedure TncProtegeWindows._NoToolbars(No: Boolean);
begin
end;

procedure TncProtegeWindows._NoCtrlEsc(No: Boolean);
begin
end;

procedure TncProtegeWindows._NoCtrlPanel(No: Boolean);
begin
end;

procedure TncProtegeWindows._NoDocs(No: Boolean);
begin
end;

procedure TncProtegeWindows._NoDownload(No: Boolean);
begin
end;

procedure TncProtegeWindows._NoExeDownload(No: Boolean);
begin
end;

procedure TncProtegeWindows._NoRunCmd(No: Boolean);
begin
end;

constructor TncProtegeWindows.Create(AOwner: TComponent);
begin
  inherited;
  FBloqueiaCtrlAltDel := True;
  FAtivo := False;
  FHideDrives := '';
  FOpcoes := TStringList.Create;
  FslNonEnum := TStringList.Create;
  FNoStartMenu := False;
  FClassicMenu := False;
  DesprotegeTudo;
end;

destructor TncProtegeWindows.Destroy;
begin
  DesativaProtecao;
  FOpcoes.Free;
  FslNonEnum.Free;
  
  inherited;
end;

procedure TncProtegeWindows.ApplyClassicMenu(aClassic: Boolean);
begin

end;

procedure TncProtegeWindows.AtivaProtecao;
begin
  FAtivo := True;
  _NoDesktop(GetOpcaoBool(ncp_NoDesktop));
  _NoCtrlAltDel(GetOpcaoBool(ncp_NoCtrlAltDel));
  _NoAltTab(GetOpcaoBool(ncp_NoAltTab));
  _NoAltEsc(GetOpcaoBool(ncp_NoAltEsc));
  _NoWinkeys(GetOpcaoBool(ncp_NoWinkeys));
  _NoTaskbar(GetOpcaoBool(ncp_NoTaskbar));
  _NoTaskLinks(GetOpcaoBool(ncp_NoTaskLinks));
  _NoTaskTray(GetOpcaoBool(ncp_NoTaskTray));
  _NoCtrlEsc(GetOpcaoBool(ncp_NoCtrlEsc));
  _NoCtrlPanel(GetOpcaoBool(ncp_NoCtrlPanel));
  _NoDownload(GetOpcaoBool(ncp_NoDownload));
  _NoExeDownload(GetOpcaoBool(ncp_NoExeDownload));
  _NoDocs(GetOpcaoBool(ncp_NoDocs));
  _NoRunCmd(GetOpcaoBool(ncp_NoRunCmd));
  _NoNetwork(GetOpcaoBool(ncp_NoNetwork));
  _NoRightClick(GetOpcaoBool(ncp_NoRightClick));
  _NoToolbars(GetOpcaoBool(ncp_NoToolbars));
  AplicaNonEnum(True);
  ApplyClassicMenu(FClassicMenu);
  DoHideDrives(FHideDrives);
end;

procedure TncProtegeWindows.DesativaProtecao; 
begin
  FAtivo := False;
  DesprotegeTudo;
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
  _NoExeDownload(False);
  _NoDocs(False);
  _NoRunCmd(False);
  _NoNetwork(False);
  _NoRightClick(False);
  _NoToolbars(False);
  AplicaNonEnum(False);
  ApplyClassicMenu(FClassicMenu);
  DoHideDrives('');
end;

function TncProtegeWindows.GetOpcaoBool(const Nome: String): Boolean;
begin
  Result := (GetOpcao(Nome)=BoolSt[True]);
end;

function TncProtegeWindows.GetOpcao(const Nome: String): String;
begin
  Result := UpperCase(FOpcoes.Values[UpperCase(Nome)]);
end;

procedure TncProtegeWindows.SetOpcao(const Nome, Valor: String);
begin
  FOpcoes.Values[UpperCase(Nome)] := UpperCase(Valor);
end;

procedure TncProtegeWindows.SetOpcaoBool(const Nome: String; const Valor: Boolean);
begin
  SetOpcao(Nome, BoolSt[Valor]);
end;

procedure TncProtegeWindows.SetBloqueiaCtrlAltDel(const Value: Boolean);
const
  BoolSt : Array[Boolean] of String = ('False', 'True');
begin
  FBloqueiaCtrlAltDel := Value;
  DebugMsg('BloqueiaCtrlAltDel = ' + BoolSt[Value]);
end;

procedure TncProtegeWindows.SetNoStartMenu(const Value: Boolean);
begin
  FNoStartMenu := Value;
end;


procedure TncProtegeWindows.DoHideDrives(ADrives: String);
begin
  //----
end;

procedure TncProtegeWindows._NoNetwork(No: Boolean);
begin
end;

procedure TncProtegeWindows.DesprotegeTudo;
begin
  SetOpcaoBool(ncp_NoDesktop, False);
  SetOpcaoBool(ncp_NoCtrlAltDel, False);
  SetOpcaoBool(ncp_NoAltTab, False);
  SetOpcaoBool(ncp_NoAltEsc, False);
  SetOpcaoBool(ncp_NoWinkeys, False);
  SetOpcaoBool(ncp_NoTaskbar, False);
  SetOpcaoBool(ncp_NoTaskLinks, False);
  SetOpcaoBool(ncp_NoTaskTray, False);
  SetOpcaoBool(ncp_NoCtrlEsc, False);
  SetOpcaoBool(ncp_NoCtrlPanel, False);
  SetOpcaoBool(ncp_NoDownload, False);
  SetOpcaoBool(ncp_NoExeDownload, False);
  SetOpcaoBool(ncp_NoDocs, False);
  SetOpcaoBool(ncp_NoRunCmd, False);
  SetOpcaoBool(ncp_NoNetwork, False);
  SetOpcaoBool(ncp_NoRightClick, False);
  SetOpcaoBool(ncp_NoToolbars, False);
  FHideDrives := '';
end;

procedure TncProtegeWindows.ProtegeTudo;
begin
  SetOpcaoBool(ncp_NoDesktop, True);
  SetOpcaoBool(ncp_NoCtrlAltDel, True);
  SetOpcaoBool(ncp_NoAltTab, True);
  SetOpcaoBool(ncp_NoAltEsc, True);
  SetOpcaoBool(ncp_NoWinkeys, True);
  SetOpcaoBool(ncp_NoTaskbar, True);
  SetOpcaoBool(ncp_NoTaskLinks, True);
  SetOpcaoBool(ncp_NoExeDownload, True);
  SetOpcaoBool(ncp_NoDocs, True);
  SetOpcaoBool(ncp_NoTaskTray, True);
  SetOpcaoBool(ncp_NoCtrlEsc, True);
  SetOpcaoBool(ncp_NoCtrlPanel, True);
  SetOpcaoBool(ncp_NoDownload, True);
  SetOpcaoBool(ncp_NoRunCmd, True);
  SetOpcaoBool(ncp_NoNetwork, True);
  SetOpcaoBool(ncp_NoRightClick, True);
end;

procedure TncProtegeWindows._NoRightClick(No: Boolean);
begin

end;

end.
 