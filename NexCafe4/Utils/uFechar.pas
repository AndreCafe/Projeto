unit uFechar;

interface

uses
  madKernel, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin, WindowList, ComCtrls;

type
  TForm17 = class(TForm)
    Panel1: TPanel;
    edProg: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    WL: TWinList;
    meWin: TMemo;
    TabSheet3: TTabSheet;
    wl2: TWinList;
    meDif: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    P : IProcesses;
    { Public declarations }
  end;

var
  Form17: TForm17;

implementation

{$R *.dfm}

procedure TForm17.Button1Click(Sender: TObject);
var 
  P : IProcesses;
  I : Integer;
begin
  P := Processes(edProg.Text);
  for I := 0 to P.ItemCount-1 do P.Close;
end;

procedure TForm17.Button2Click(Sender: TObject);
var 
  P : IProcesses;
  I, N : Integer;
begin
  P := Processes(edProg.Text);
  for I := 0 to P.ItemCount-1 do
    P.Quit;
end;

procedure TForm17.Button3Click(Sender: TObject);
var 
  P : IProcesses;
  I : Integer;
begin
  P := Processes(edProg.Text);
  for I := 0 to P.ItemCount-1 do P.Exit_;
end;

procedure TForm17.Button4Click(Sender: TObject);
var 
  P : IProcesses;
  I : Integer;
begin
  P := Processes(edProg.Text);
  for I := 0 to P.ItemCount-1 do P.Terminate;
end;

procedure TForm17.Button5Click(Sender: TObject);
const BoolStr : Array[Boolean] of String = ('FALSE', 'TRUE');
var 
  I : Integer;
  C : Cardinal;
  H : HWND;
begin
  C := GetTickCount;
  P.RefreshItems;
  Caption := IntToStr(GetTickCount - C);
  Memo1.Lines.Clear;
  for I := 0 to P.ItemCount-1 do begin
    Memo1.Lines.Add(P[I].ExeFile);
  end;

  meWin.Clear;
  meDif.Clear;

  wl2.Refresh(True);
  
  repeat
    H := FindWindow(PChar('CabinetWClass'), nil);
    if H<>0 then PostMessage(H, WM_CLOSE, 0, 0);
  until H=0;

  repeat
    H := FindWindow(PChar('EXPLOREWCLASS'), nil);
    if H<>0 then PostMessage(H, WM_CLOSE, 0, 0);
  until H=0;

  for I := 0 to Wl2.Count - 1 do with wl2.Windows[i]^ do 
    if WL.WindowByHWND(WinHandle)=nil then begin
      meDif.Lines.Add(FName + ' - ' + WinCaption + ' - ' + WndClassName + ' - IsVisible: ' + BoolStr[IsVisible]);
    end;

  WL.Refresh(True);
  for I := 0 to WL.Count - 1 do
    with WL.Windows[I]^ do {if SameText(ExtractFileName(FName), 'EXPLORER.EXE') then} begin
      meWin.Lines.Add(FName + ' - ' + WinCaption + ' - ' + WndClassName + ' - IsVisible: ' + BoolStr[IsVisible]);
    end;
end;

procedure TForm17.FormCreate(Sender: TObject);
begin
  P := Processes;
end;

end.
