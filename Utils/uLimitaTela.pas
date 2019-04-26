unit uLimitaTela;

interface

uses
  Windows, madKernel, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm34 = class(TForm)
    Timer1: TTimer;
    Button1: TButton;
    Button2: TButton;
    LB: TListBox;
    Button3: TButton;
    Button4: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    W: IWindows;
  public
    { Public declarations }
  end;

var
  Form34: TForm34;
  maxT : Cardinal = 0;

implementation

uses ncgLimiteTela;

{$R *.dfm}

procedure TForm34.Button1Click(Sender: TObject);
var 
  i: integer;
  R: TRect;
  T: cardinal;
begin
  T := GetTickCount;
  W := TaskbarWindows;
  for i := 0 to W.ItemCount-1 do
    LB.Items.Add(W[i].Text);
end;

procedure TForm34.Button2Click(Sender: TObject);
var i: integer;
  R: TRect;

begin
  i := LB.ItemIndex;
    R := W[i].Rect;
      R.Top := 0;
      R.Left := 0;
      R.Right := 1800;
//      W[i].SetRectEx(R, True, True, False);
      W[i].NormalPos := R;
      PostMessage(W[i].Handle, WM_SYSCOMMAND, SC_Restore, 0);
//      W[i].Restore(False);
end;

procedure TForm34.Button3Click(Sender: TObject);
begin
  StartLimiteTela(1500, 126);
end;

procedure TForm34.Button4Click(Sender: TObject);
begin
  StopLimiteTela;
end;

procedure TForm34.Timer1Timer(Sender: TObject);
var 
  i: integer;
  R: TRect;
  T: cardinal;
begin
  T := GetTickCount;
  W := TaskbarWindows;
  
  for i := 0 to W.ItemCount-1 do
  if (W[i].Maximized) then begin
    R := W[i].Rect;
    if R.Right > 1800 then begin
      R.Top := 0;
      R.Left := 0;
      R.Right := 1800;
      R.Bottom := Screen.WorkAreaHeight;
//      W[i].SetRectEx(R, True, True, False);
      W[i].NormalPos := R;
      PostMessage(W[i].Handle, WM_SYSCOMMAND, SC_Restore, 0);
      
      LB.Items.Add(W[i].Text);
    end;
  end;
  T := GetTickCount - T;
  if T>MaxT then begin
    Caption := IntToStr(T);
    MaxT := T;
  end;
end;

end.
