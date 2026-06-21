unit uTesteHook;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

const
  CM_HOOKCBT = WM_USER + $1000;
    
type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure HookMsg(var Msg: TMessage);
      message CM_HookCBT;
  public
    { Public declarations }
  end;

  procedure HookOn; stdcall external 'cmguardh.dll';
  procedure HookOff; stdcall external 'cmguardh.dll'; 



var
  Form1: TForm1;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm1.HookMsg(var Msg: TMessage);
begin
  Memo1.lines.add('teste');
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  HookOff;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Caption := IntToStr(Multiplica);
end;

procedure TForm1.FormShow(Sender: TObject);
var 
  HArq: THandle;
  PWindow : ^Integer;
begin
   HArq := CreateFileMapping($FFFFFFFF, nil, PAGE_READWRITE, 0, SizeOf(Cardinal), 'cmguardmf');
   if HArq<>0 then begin
     PWindow:=MapViewOfFile(HArq, FILE_MAP_WRITE,0,0,0);
     PWindow^:= Self.Handle;
{     UnmapViewOfFile(PWindow);
     CloseHandle(HArq);}
   end; 
   HookOn;
end;

end.
