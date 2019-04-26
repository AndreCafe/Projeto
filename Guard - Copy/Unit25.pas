unit Unit25;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, WindowList, Madkernel;

type
  TForm25 = class(TForm)
    WL: TWinList;
    Panel1: TPanel;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form25: TForm25;
  FStartBtnH : HWND = 0;
  FTaskBarH : HWND = 0;

implementation

{$R *.dfm}

procedure ShowStartButton(bvisible: Boolean);
begin
  ShowMessage(taskbar.parentwindow.ClassName);
//  ShowMessage(IntToStr(startbutton.Handle));
  if bvisible then
    taskbar.Show(False) else
    taskbar.Hide;
end;


procedure TForm25.Button1Click(Sender: TObject);
var 
  i: integer;
  w: IWindows;
  P: IProcess;
begin           
  P := Window(FindWindow('ProgMan', nil)).OwnerProcess;
//  P := W.OwnerProcess;
  ShowMessage(P.ExeFile);
  W := P.Windows_;
  Memo1.Lines.Clear;
  w := taskbar.ownerprocess.Windows_;
  for I := 0 to W.ItemCount-1 do with W.Items[I] do 
//    if SameText(ExtractFileName(FName), 'explorer.exe') then
    Memo1.Lines.Add(ClassName + ' *** ' + Text);
end;

procedure TForm25.Button2Click(Sender: TObject);
begin
  ShowStartButton(True);
end;

end.
