unit uImpCSV_LinuxBR;

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
    tCli: TnxTable;
    nxTCP: TnxWinsockTransport;
    nxSE: TnxServerEngine;
    tCliID: TAutoIncField;
    tCliNome: TStringField;
    tCliEndereco: TStringField;
    tCliBairro: TStringField;
    tCliCidade: TStringField;
    tCliUF: TStringField;
    tCliCEP: TStringField;
    tCliSexo: TStringField;
    tCliCpf: TStringField;
    tCliRg: TStringField;
    tCliTelefone: TStringField;
    tCliMinutos: TFloatField;
    tCliMinutosUsados: TFloatField;
    tCliMinutosIniciais: TFloatField;
    tCliIsento: TBooleanField;
    tCliUsername: TStringField;
    tCliPai: TStringField;
    tCliMae: TStringField;
    tCliSenha: TStringField;
    tCliUltVisita: TDateTimeField;
    tCliDebito: TCurrencyField;
    tCliEscola: TStringField;
    tCliEscolaHI: TDateTimeField;
    tCliEscolaHF: TDateTimeField;
    tCliNickName: TStringField;
    tCliDataNasc: TDateTimeField;
    tCliCelular: TStringField;
    tCliTemDebito: TBooleanField;
    tCliLimiteDebito: TCurrencyField;
    tCliFoto: TGraphicField;
    tCliIncluidoEm: TDateTimeField;
    tCliAlteradoEm: TDateTimeField;
    tCliIncluidoPor: TStringField;
    tCliAlteradoPor: TStringField;
    tCliInativo: TBooleanField;
    tCliTipoAcessoPref: TIntegerField;
    tCliValorCred: TCurrencyField;
    PB: TProgressBar;
    Button1: TButton;
    tCliObs: TMemoField;
    tCliEmail: TMemoField;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
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
  Code, I : Integer;
  Res: Real;
begin
  Result := 0;
  for I := 1 to Length(S) do 
    if S[I]=',' then S[i] := '.';

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

function CharPosR(C: Char; S:String): Integer;
begin
  Result := Length(S);
  while (Result>0) and (S[Result]<>C) do Dec(Result);
end;

procedure TForm16.Button1Click(Sender: TObject);
var 
  SL: TStrings;
  I, J, Min, Cod: Integer;
  S, s2, s3, sDoc: String;
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
  if (C='"') and (S>'') and (S[1]=',') then Delete(S, 1, 1);

  for P := Length(Result) downto 1 do 
    if Result[P]='"' then Delete(Result, P, 1);
end;

function ProxCampoRev: String;
var 
  P: Integer;
  C: Char;
begin
  if S='' then begin
    Result := '';
    Exit;
  end;
  
  if S[Length(S)]='"' then begin
    Delete(S, Length(S), 1);
    C := '"';
  end else 
    C := ',';
  
  P := CharPosR(C, S);
  if P>0 then begin
    Result := Trim(Copy(S, P+1, Length(S)));
    Delete(S, P, Length(S));
  end else begin
    Result := Trim(S);
    S := '';
  end;
  S := Trim(S);
  if (C='"') and (S>'') and (S[Length(S)]=',') then Delete(S, Length(S), 1);

  for P := Length(Result) downto 1 do 
    if Result[P]='"' then Delete(Result, P, 1);
end;


procedure proxn(n: Integer);
begin
  while n>0 do begin
    ProxCampo;
    dec(n);
  end;
end;

begin
  SL := TStringList.Create;
  SL.LoadFromFile('c:\meus programas\nexcafe\export.csv');
  PB.Max := SL.Count;
  PB.Position := 0;
  tCli.Open;
  tCli.EmptyTable;
  ShortDateFormat := 'DD-MM-yyyy';
//  for J := 1 to 2 do 
  for I := 1 to SL.Count-1 do begin
    PB.Position := I + 1;
    Application.ProcessMessages;
    S := SL[I];
    tCli.Insert;
    tCliID.AsString := ProxCampo;
    tCliUsername.Value := tCliID.AsString;
    tCliNickName.Value := ProxCampo;
    tCliNome.Value := ProxCampo;
    tCliRG.Value := ProxCampo;
    tCliCPF.Value := ProxCampo;
    try
      tCliDataNasc.Value := StrToDate(ProxCampo);
    except
    end;
    tCliEndereco.Value := ProxCampo;
    tCliCidade.Value := ProxCampo;
    tCliUF.Value := ProxCampo;
    tCliTelefone.Value := ProxCampo;
    tCliPai.Value := ProxCampo;
    tCliOBS.Value := 'RG Resp: ' + ProxCampo + sLineBreak +
                     'CPF Resp: ' + ProxCampo;
    ProxCampo;
      
    tCliValorCred.Value :=  StrToCurrency(ProxCampo); 
    Proxn(3);
    tCliEmail.Value := ProxCampo;
    tCliEscola.Value := ProxCampo;
    Proxn(2);
    tCliSenha.Value := ProxCampo;
    tCliIsento.Value := False;
    tCliIncluidoEm.Value := Date;
    tCliIncluidoPor.Value := 'admin';
    tCliInativo.Value := False;
    tCli.Post;
  end;
end;

procedure TForm16.FormShow(Sender: TObject);
begin
  tCli.Open;
end;

end.
