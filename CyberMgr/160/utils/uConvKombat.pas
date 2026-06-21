unit uConvKombat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, nxdb, Grids, DBGrids;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    T: TnxTable;
    TCodigo: TAutoIncField;
    TNome: TStringField;
    TEndereco: TStringField;
    TBairro: TStringField;
    TCidade: TStringField;
    TUF: TStringField;
    TCEP: TStringField;
    TNasc: TDateTimeField;
    TSexo: TStringField;
    TObs: TMemoField;
    TCpf: TStringField;
    TRg: TStringField;
    TTelefone: TStringField;
    TEmail: TMemoField;
    TCreditoM: TIntegerField;
    TTempoTotal: TIntegerField;
    TTempoInicial: TIntegerField;
    TIsento: TBooleanField;
    TUsername: TStringField;
    TSenha: TStringField;
    TUltVisita: TDateTimeField;
    TDebito: TCurrencyField;
    TEscola: TStringField;
    TNickName: TStringField;
    TDataNasc: TDateTimeField;
    TCelular: TStringField;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses cmClassesBase;

{$R *.DFM}

function Digitos(S: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
  if S[I] in ['0'..'9'] then Result := Result + S[I];
end;

function Valor(S: String): Double;
var 
  I : Integer;
  Code : Integer;
  S2 : String;
begin
  S2 := '';
  Result := 0;
  for I := 1 to Length(S) do
  if S[I] in ['0'..'9', ',', '.'] then S2 := S2 + S[I];
  if Pos(',', S2) > 0 then
    S2[Pos(',', S2)] := '.';
  Val(S2, Result, Code);
end;

procedure TForm1.Button1Click(Sender: TObject);
var 
  A : TextFile;
  S : String;
  D : TDateTime;
begin
  T.Open;
  ShortTimeFormat := 'HH:MM';
  AssignFile(A, 'c:\komb.prn');
  Reset(A);
  while not Eof(A) do begin
    Readln(A, S);
    T.Insert;
    TNome.Value := Trim(Copy(S, 6, 52));
    TTelefone.Value := Trim(Copy(S, 58, 2)) + Trim(Copy(S, 62, 13));
    TCelular.Value := Trim(Copy(S, 58, 2)) + Trim(Copy(S, 75, 9));
    try
      D := StrToTime(Trim(Copy(S, 84, 5)));
    except
      D := 0;
    end;  
    TTempoInicial.Value := DateTimeToSegundos(D);
    TTempoTotal.Value := TTempoInicial.Value;

    try
      D := StrToTime(Trim(Copy(S, 94, 5)));
    except
      D := 0;
    end;  
    TCreditoM.Value := DateTimeToTicks(D);

    try
      D := StrToTime(Trim(Copy(S, 100, 5)));
    except
      D := 0;
    end;
    if D > 0 then   
      TObs.Value := 'Tempo Grátis Campeonato = ' + FormatDateTime('hh:mm:ss', D);
    
    TDebito.Value := Valor(Copy(S, 105, 8)); 
     
    try
      D := StrToDate(Copy(S, 120, 10));
      TDataNasc.Value := D;
    except
      TDataNasc.Clear;
    end;    
    TNickName.Value := Trim(Copy(S, 132, 16));
    TEmail.Value := Trim(Copy(S, 148, 32));
    TEscola.Value := Trim(Copy(S, 180, 26));
    TEndereco.Value := Trim(Copy(S, 206, 52));
    TBairro.Value := Trim(Copy(S, 258, 10));
    TCidade.Value := 'Florianópolis';
    TUF.Value := 'SC';
    T.Post;
    Application.ProcessMessages;
  end;
end;

end.
