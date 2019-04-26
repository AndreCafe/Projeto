unit uTimeStampError;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, DBTables, IBDatabase, Dbf;

type
  TForm16 = class(TForm)
    nxSession1: TnxSession;
    nxDB: TnxDatabase;
    tDeb: TnxTable;
    nxTCP: TnxWinsockTransport;
    nxSE: TnxServerEngine;
    PB: TProgressBar;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
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
var D: TDateTime;
begin
  tDeb.Active := True;
  tDeb.First;
  while not tDeb.Eof do begin
    try
      D := tDeb.FieldByName('Data').AsDateTime;
      tDeb.Next;
    except
      tDeb.Edit;
      tDeb.FieldByName('Data').Clear;
      tDeb.Post;
      tDeb.Next;
    end;
  end;
  ShowMessage('Fim de checagem');
end;

end.

// Senha OptiCyber MS Access = k4hvd$$
// Senha TimerCafe = fad0001
