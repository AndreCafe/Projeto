unit uFrmDontShut;

interface

uses
  Windows,  Messages, SyncObjs, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls;

type
  TFrmDontShut = class(TForm)
    Label1: TLabel;
    Timer1: TTimer;
    Button1: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDontShut: TFrmDontShut;

implementation

uses uDMNXDontShut;

{$R *.dfm}

procedure TFrmDontShut.Button1Click(Sender: TObject);
begin
  if Button1.Caption = 'Close' then begin
    Button1.Caption := 'Closing';
    Button1.Enabled := False;
  end else begin
    Timer1.Enabled := True;
    Button1.Caption := 'Close';
  end;
end;

procedure TFrmDontShut.Timer1Timer(Sender: TObject);
var i: integer;
begin
  Timer1.Enabled := True;
  if (Button1.Caption <> 'Closing') then begin
    if GetQtd<70 then
      for I := 1 to 70 do
        TThreadDontShut.Create(False).FreeOnTerminate := True;
  end else
    if GetQtd=0 then 
      Close;
  Label1.Caption := 'Threads = '+IntToStr(GetQtd);
end;

end.
