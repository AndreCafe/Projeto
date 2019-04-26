unit uGeraTermosGoogle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm5 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}


procedure TForm5.Button1Click(Sender: TObject);
const
  palavras1 : array[1..4] of String = (
  'Lan House', 'Lan-House', 'Cyber Café', 'Cyber Cafe');

  palavras2 : array[1..2] of String = (
  'de', 'para');
  
var  i, k, j : integer;
  s: string;

procedure AddWord(word: string);
begin
  if s>'' then s := s + ', ';
  s := s + word;
end;

begin
  memo2.lines.clear;
  s:='';
  for I := 0 to memo1.lines.Count - 1 do begin 
    for k := low(palavras1) to high(palavras1) do begin
      addword(memo1.lines[i] + ' ' + palavras1[k]);
      for j := low(palavras2) to high(palavras2) do 
         addword(memo1.lines[i] + ' ' + palavras2[j] + ' ' + palavras1[k]);
    end;
  end;
  memo2.lines.add(s);
end;


end.
