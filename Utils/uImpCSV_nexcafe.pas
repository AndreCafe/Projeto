unit uImpCSV_nexcafe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, ncClassesBase;

type
  TForm16 = class(TForm)
    nxSession1: TnxSession;
    nxDB: TnxDatabase;
    tCEP: TnxTable;
    nxSE: TnxServerEngine;
    PB: TProgressBar;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    tCEPCEP: TStringField;
    tCEPCidade: TStringField;
    tCEPEndereco: TStringField;
    tCEPBairro: TStringField;
    tCEPUF: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  Code, P : Integer;
  Res: Real;
begin
  P := Pos(',', S);
  if P>0 then S[P] := '.';
  Result := 0;
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

function SoDig(S: String): String;
var i: integer;
begin
  result := '';
  for i := 1 to length(S) do
    if s[i] in ['0'..'9', '-'] then
      result := result + s[i];
end;

function SoDig2(S: String): String;
var i: integer;
begin
  result := '';
  for i := 1 to length(S) do
    if s[i] in ['0'..'9'] then
      result := result + s[i];
end;

function LimpaRG(S: String): String;
var I: Integer;
begin
  Result := '';
  while (Length(S)>0) and (not (S[1] in ['0'..'9'])) do
    Delete(S, 1, 1);
  Result := Trim(S);  
end;


procedure TForm16.Button1Click(Sender: TObject);
var 
  SL: TStrings;
  I, J, Min, Cod: Integer;
  S, s2, s3, sDoc, sNome, sUser: String;
  Mon : Currency;
  DT: TDateTime;

function ProxCampo: String;
var 
  P: Integer;
  C: Char;
begin
  if S='' then begin
    Result := '';
    Exit;
  end;
  
  if S[1]='"' then begin
    Delete(S, 1, 1);
    C := '"';
  end else 
    C := ';';
  
  P := Pos(C, S);
  if P>0 then begin
    Result := Trim(Copy(S, 1, P-1));
    Delete(S, 1, P);
  end else begin
    Result := Trim(S);
    S := '';
  end;
  S := Trim(S);
  if (C='"') and (S>'') and (S[1]=';') then Delete(S, 1, 1);

  Result := Trim(Result);
end;

procedure proxn(n: Integer);
begin
  while (n>0) and (S>'') do begin
    ProxCampo;
    dec(n);
  end;
end;

begin
  SL := TStringList.Create;
  SL.LoadFromFile('C:\nexcafe\cep.csv');
  PB.Max := SL.Count;
  PB.Position := 0;
  tCep.Open;
  tCep.EmptyTable;
  Application.ProcessMessages;
  Sleep(1000);
  Application.ProcessMessages;
  ShortDateFormat := 'dd/mm/yyyy';
  for I := 1 to sl.Count-1 do begin
    Caption := IntToStr(I);
    PB.Position := I+1;
    Application.ProcessMessages;
    S := SL[I];
    tCep.Insert;
    tCepCep.Value := ProxCampo;
    tCepUf.Value := ProxCampo;
    tCepEndereco.Value := ProxCampo;
    tCepCidade.Value := ProxCampo;
    tCepBairro.Value := ProxCampo;
    tCep.Post;
  end;
  ShowMessage(IntToStr(I)+' CEP importados');
end;

procedure TForm16.FormShow(Sender: TObject);
begin
  tCli.Open;
end;

end.
