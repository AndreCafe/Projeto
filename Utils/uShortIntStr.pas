unit uShortIntStr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

const 
  charShInt = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  base = 62;

type  

  
  TForm26 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form26: TForm26;


implementation

{$R *.dfm}

function IntToshInt(I: Integer): String;
var i2: Integer;
begin
  Result := '';
  while I>0 do begin
    i2 := (I mod base)+1;
    Result := Copy(charshInt, i2, 1) + result;
    I := I div base;
  end;
end;  

function elev(a, b: Integer): Integer;
begin
  if b=0 then
    Result := 1 else
    Result := a;
  while b>1 do begin
    result := result * a;
    dec(b);
  end;
end;

function shIntToInt(s: String): Integer;
begin
  Result := 0;
  while s>'' do begin
    result := result + ((Pos(s[1], charshInt)-1) * elev(base, Length(s)-1));
    Delete(S, 1, 1);
  end;
end;

procedure TForm26.Button1Click(Sender: TObject);
var s: string;
begin
{  s := IntToshInt(477078);
  showMessage(s);    }
  showMessage(IntToStr(shIntToInt('AAz'))); 
end;

end.
