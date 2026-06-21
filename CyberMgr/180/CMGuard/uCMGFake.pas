unit uCMGFake;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, dxBar;

type
  TFrmFake = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFake: TFrmFake;

implementation

{$R *.dfm}

procedure TFrmFake.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Close;
end;

procedure TFrmFake.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmFake.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

end.
