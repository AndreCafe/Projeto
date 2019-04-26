unit ncgFrmHide;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TFrmHide = class(TForm)
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHide: TFrmHide;
  HideHandle: HWND;

implementation

{$R *.dfm}

procedure TFrmHide.Timer1Timer(Sender: TObject);
begin
  HideHandle := Handle;
  Timer1.Enabled := False;
end;

initialization
  HideHandle := 0;

end.
