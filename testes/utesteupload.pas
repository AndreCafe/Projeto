unit utesteupload;

interface

uses
  Windows, idHttp, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm7 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses ncKiteApi;

{$R *.dfm}

procedure TForm7.Button1Click(Sender: TObject);
var sl: TStrings;
begin
  sl := TStringList.Create;
  try
    ShowMessage('resultado = ' + posturl(sl, 'http://nex.api.nextar.com/upload.php', 'c:\meus programas\nex\upload1.png', 'file', 'image/png'));
  finally
    sl.Free;
  end;
end;



procedure TForm7.Button2Click(Sender: TObject);
var h: TidHttp;
begin
    H := TidHttp.Create(nil);
    try
      ShowMessage(H.Get(kapi_setup));
    finally
      H.Free;
    end;
end;

end.
