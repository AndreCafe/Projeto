unit Unit19;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm19 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form19: TForm19;

implementation

uses ncToken;

{$R *.dfm}

procedure TForm19.Button1Click(Sender: TObject);
var T: String;
begin
  T := CreateToken;
  Label1.Caption := Format2Dig(T);
  Label2.Caption := Format2Dig(GetTokenPass(T));
end;

end.
