unit cmProtecaoNT;

interface

uses SysUtils, Classes, Windows, Menus, cmProtecao, dWinlock;

type

   TCMProtegeNT = class (TCMProtegeWindows)
   private
     FWinLock : TdWinLock;
   protected 
     procedure _NoDesktop(No: Boolean); override;
     procedure _NoCtrlAltDel(No: Boolean); override;
     procedure _NoAltTab(No: Boolean); override;
     procedure _NoAltEsc(No: Boolean); override;
     procedure _NoWinkeys(No: Boolean); override;
     procedure _NoTaskbar(No: Boolean); override;
     procedure _NoTaskLinks(No: Boolean); override;
     procedure _NoTaskTray(No: Boolean); override;
     procedure _NoCtrlEsc(No: Boolean); override;
     procedure _NoRButton(No: Boolean); override;
   
     procedure SetStartMenu(const Value: TPopupMenu); override;
     function GetStartMenu: TPopupMenu; override;

     procedure SetNoStartMenu(const Value: Boolean); override;

     procedure AplicaProtStartMenu;
   public
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;

     procedure AtivaProtecao; override;
     procedure DesativaProtecao; override;
   end;
   
implementation   

procedure TCMProtegeNT._NoDesktop(No: Boolean);
begin
  FWinlock.noDesktop := No;
end;

procedure TCMProtegeNT._NoCtrlAltDel(No: Boolean);
begin
  FWinlock.noCtrlAltDel := No;
end;

procedure TCMProtegeNT._NoAltTab(No: Boolean);
begin
  FWinlock.noAltTab := No;
end;

procedure TCMProtegeNT._NoAltEsc(No: Boolean);
begin
  FWinlock.noAltEsc := No;
end;

procedure TCMProtegeNT._NoWinkeys(No: Boolean);
begin
  FWinlock.noWinKeys := No;
end;

procedure TCMProtegeNT._NoTaskbar(No: Boolean);
begin
  FWinlock.noTaskbar := No;
end;

procedure TCMProtegeNT._NoTaskLinks(No: Boolean);
begin
  FWinlock.noTaskLinks := No;
end;

procedure TCMProtegeNT._NoTaskTray(No: Boolean);
begin
  FWinlock.noTaskTray := No;
end;

procedure TCMProtegeNT._NoCtrlEsc(No: Boolean);
begin
//  FWinlock.noCtrlEsc := No or NoStartMenu;
end;

procedure TCMProtegeNT._NoRButton(No: Boolean);
begin
  FWinlock.noRButton := No;
end;

procedure TCMProtegeNT.SetStartMenu(const Value: TPopupMenu);
begin
  if Value=FWinlock.StartMenu then Exit;
  if Value<>nil then begin
    FWinLock.StartMenu := Value;
    AplicaProtStartMenu;
  end  
end;

function TCMProtegeNT.GetStartMenu: TPopupMenu;
begin
  Result := FWinlock.StartMenu;
end;

procedure TCMProtegeNT.SetNoStartMenu(const Value: Boolean);
begin
  inherited;
  AplicaProtStartMenu;
end;

constructor TCMProtegeNT.Create(AOwner: TComponent);
begin
  inherited;
  FWinlock := TdWinlock.Create(nil);
end;

destructor TCMProtegeNT.Destroy;
begin
  inherited;
  FreeAndNil(FWinlock);
end;

procedure TCMProtegeNT.AtivaProtecao;
begin
  inherited;
  AplicaProtStartMenu;
end;  

procedure TCMProtegeNT.DesativaProtecao;
begin
  inherited;
  AplicaProtStartMenu;
end;

procedure TCMProtegeNT.AplicaProtStartMenu;
begin
  Exit;
  if Ativo and (StartMenu<>nil) and (not NoStartMenu) then begin
    FWinLock.NoStartbutton := False;
    FWinLock.ReplaceStartmenu := True;
//    FWinLock.noCtrlEsc := True;
  end else begin  
    FWinLock.ReplaceStartmenu := False;
    FWinLock.noStartbutton :=  (Ativo and NoStartMenu);
//    FWinlock.noCtrlEsc := Ativo and GetOpcaoBool(cmp_NoCtrlEsc);
  end;  
end;



end.
