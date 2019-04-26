unit uUFEst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, Dbf, Dbf_lang, Dbf_dbffile, nxsrSqlEngineBase, nxsqlEngine,
  nxreRemoteServerEngine;

type
  TForm16 = class(TForm)
    nxSession1: TnxSession;
    nxDB: TnxDatabase;
    nxTCP: TnxWinsockTransport;
    nxSE: TnxServerEngine;
    PB: TProgressBar;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Q: TnxQuery;
    nxSqlEngine1: TnxSqlEngine;
    Quf: TStringField;
    Qqtd: TLargeintField;
    nxRemoteServerEngine1: TnxRemoteServerEngine;
    Q2: TnxQuery;
    Q2UF: TStringField;
    Q2Qtd: TLargeintField;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

{$R *.dfm}

function StrToCurrency(S: String): Currency;
var 
  Code, I : Integer;
  Res: Double;
  S2 : String;
begin
  Result := 0;
  S2 := '';
  for I := 1 to Length(S) do
    if S[I] in ['0'..'9', ',', '.'] then
    if S[I]=',' then
      S2 := S2 + '.' else
      S2 := S2 + S[I];
      
  S := S2;
    
  if (Trim(S)>'') then begin
    Val(S, Res, Code);
    if Code=0 then
      REsult := Res;
  end;
end;

function CodStr(I: Integer): String;
begin
  Result := IntToStr(I);
  while length(result)<3 do
    result := '0'+result;
end;

function FiltroCEP(S: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if S[I]  in ['0'..'9', '-'] then
      Result := Result + S[I];
end;

function FiltraEnd(S: String): String;
var i: integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if not (S[I] in [' ', '-']) then
      Result := Result + S[I];
  if Result<>'' then
    Result := Trim(S);   
end;

procedure TForm16.Button1Click(Sender: TObject);
var 
  SL : Tstrings;
  T, T2 : Int64;
  P : Extended;
begin
  Q.Params[0].Value := EncodeDate(2010, 10, 1);
  Q.Open;

  T := 0;  T2 := 0;

  SL := TStringList.Create;
  try
    Q.First;
    while not q.eof do begin
      T := T + QQtd.Value;
      q.Next;
    end;

    Q.First;
    while not q.eof do begin
      P := QQtd.Value / T;
      T2 := T2 + Trunc(1126*P);
      SL.Add(quf.Value + ' = ' + IntToStr(Trunc(1126*P)) + ' - ' + FloatToStr(Trunc((QQtd.Value / T) *10000)/100)+'%');
      q.Next;
    end;
    SL.Add('Total = ' + IntToStr(T2));
    SL.SaveToFile('c:\meus programas\nexcafe\est_uf.txt');
    ShowMessage(SL.Text);
  finally
    SL.Free;
  end;
end;

procedure TForm16.Button2Click(Sender: TObject);
var 
  SL : Tstrings;
  T, T2 : Int64;
  P : Extended;
begin
  Q2.Params[0].Value := EncodeDate(2010, 10, 1);
  Q2.Open;

  T := 0;  T2 := 0;

  SL := TStringList.Create;
  try
    Q2.First;
    while not q2.eof do begin
      T := T + Q2Qtd.Value;
      q2.Next;
    end;

    Q2.First;
    while not q2.eof do begin
      SL.Add(q2uf.Value + ' = ' + Q2Qtd.AsString);
      q2.Next;
    end;
    SL.Add('Total = ' + IntToStr(T));
    SL.SaveToFile('c:\meus programas\nexcafe\est_geral.txt');
    ShowMessage('Total = ' + IntToStr(T));
  finally
    SL.Free;
  end;
end;

end.

// Senha OptiCyber MS Access = k4hvd$$
// Senha TimerCafe = fad0001
