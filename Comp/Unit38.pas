unit Unit38;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DCPcrypt2, DCPsha256;

type
  TForm38 = class(TForm)
    S: TDCP_sha256;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form38: TForm38;

implementation

uses ncHash;

{$R *.dfm}

procedure TForm38.Button1Click(Sender: TObject);
var 
  Digest: Array[0..63] of Byte;
  Str: String;
  I : integer;
begin
  Label1.Caption := nexHashKey('The quick brown fox jumps over the lazy dog');
  exit;
    
  S.Init;
  S.UpdateStr('The quick brown fox jumps over the lazy dog');
  S.Final(Digest);
  Str := '';

  for I := 0 to 31 do
    Str := Str + IntToHex(Digest[I], 2);
  Label1.Caption := lowercase(Str);
end;

procedure TForm38.Edit1Change(Sender: TObject);
begin
  Label1.Caption := nexHashKey(Edit1.Text);
end;

end.
