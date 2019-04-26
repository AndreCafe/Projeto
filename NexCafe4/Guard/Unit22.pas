unit Unit22;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm22 = class(TForm)
    Button1: TButton;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form22: TForm22;

implementation

uses ncFrmShade;

{$R *.dfm}

procedure TForm22.Button1Click(Sender: TObject);
begin
  Timer1.Enabled := True;
  FrmShade.Ativo := True;
end;

procedure TForm22.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  FrmShade.Ativo := False;
end;

end.
