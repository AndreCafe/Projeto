unit ncgRemoveRestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TFrmRemoveRestr = class(TForm)
    PB: TProgressBar;
    Timer1: TTimer;
    Label1: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    FInicio: Cardinal;
    function Passou: Cardinal;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRemoveRestr: TFrmRemoveRestr;

implementation

uses ncProtecao98, ncgFrmPri;

{$R *.dfm}

procedure TFrmRemoveRestr.Timer1Timer(Sender: TObject);
begin
  PB.Position := Trunc((Passou / 2000) * 100);
  if PB.Position >= 100 then Close;
end;

procedure TFrmRemoveRestr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Passou < 2000 then
    Action := caNone else
    Action := caFree;
end;

procedure TFrmRemoveRestr.FormShow(Sender: TObject);
begin
  FInicio := GetTickCount;
  PB.Max := 100;
  TThreadAlterouPolicies.Create(False);
end;

function TFrmRemoveRestr.Passou: Cardinal;
begin
  Result := GetTickCount - FInicio;
end;

end.
