unit uArrayStr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TTeste = record
    prTel : String[15];
    prCod : Integer;
  end;
    
  TPreco = record
    prCodigo : Integer;
    prValor  : Double;
    prCor    : Integer;
    prNome   : String[30];
    prTestes : Array of TTeste;
  end;  

var
  Form1: TForm1;
  A : Array of TPreco;
  S : String;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var I : Integer;
begin
  SetLength(A, 10);
  for I := 0 to 9 do begin
    A[I].prNome := 'Nome '+IntToStr(I);
    SetLength(A[I].prTestes, 2);
    A[I].prTestes[0].prTel := '0000';
    A[I].prTestes[1].prTel := '1111';
  end;  
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  SetLength(S, SizeOf(TPreco)*(High(A)+1));
  Move(A[0], S[1], Length(S));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ShowMessage(IntToStr(Length(S)));
  ShowMessage(IntToStr(SizeOf(TPreco) * (High(A)+1)));
end;

procedure TForm1.Button3Click(Sender: TObject);
var T : Array of TPreco;
begin
  SetLength(T, Length(S) div SizeOf(TPreco));
//  SetLength(A, 0);
  Move(S[1], T[0], Length(S));
  ShowMessage(T[9].prNome+' tel '+T[9].prTestes[0].prTel);
end;

end.
