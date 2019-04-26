unit uImpCSV_Clientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids;

type
  TForm16 = class(TForm)
    nxSession1: TnxSession;
    nxDB: TnxDatabase;
    tCli: TnxTable;
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
    tCliNaoGuardarCredito: TBooleanField;
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

uses uProxCampo;

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

function MeuTrim(S: String): String;
var 
   I: Integer; 
begin
  Result := '';
  for I := 1 to Length(S) do 
    if Ord(S[i])=160 then
      Result := Result + ' ' else
      Result := Result + S[i];
end;

function zero4(S: String): String;
begin
  Result := S;
  while Length(Result) < 4 do Result := '0' + Result;
end;

procedure TForm16.Button1Click(Sender: TObject);
var 
  SL: TStrings;
  I, J, Min, Cod: Integer;
  S, s2, s3, sDoc, s4, s5: String;
  Mon : Currency;
  DT: TDateTime;
  aCNPJ, aIE, aEndereco, aNum, aComplemento, aTaxaEntrega, aTipoMoradia : String;

function ProxCampo: String;
begin
  Result := ObtemProxCampo(S, ',');
end;

procedure proxn(n: Integer);
begin
  while n>0 do begin
    ProxCampo;
    dec(n);
  end;
end;

function DDDTel(aTel, aDDD: String): String;
begin
  if (aTel>'') and (aDDD>'') then
    Result := '('+aDDD+') '+aTel else
    Result := aTel;
end;

function Endereco: String;
begin
  Result := aEndereco;
  if (Result>'') and (aNum>'') then
    Result := Result + ' ' + aNum;

  if (Result>'') and (aComplemento>'') then
    Result := Result + ' ' + aComplemento;
end;

procedure AddObs(aCampo, aValor: String);
begin
  if Trim(aValor)>'' then begin
    if tCliObs.Value>'' then tCliObs.Value := tCliObs.Value + sLineBreak;
    tCliObs.Value := tCliObs.Value + aCampo + ' = ' + aValor;
  end;
end;

procedure AddSobrenome(aSobrenome: String);
begin
  if trim(asobrenome)='' then Exit;
  tCliNome.Value := tCliNome.Value + ' ' + aSobrenome;
end;

procedure AddTel(aTel: String);
begin
  if aTel='' then Exit;
  if tCliTelefone.Value='' then
    tCliTelefone.Value := aTel else
    tCliTelefone.Value := tCliTelefone.Value + ' ' + aTel;
end;


begin
  SL := TStringList.Create;
  SL.LoadFromFile('c:\nexcafe\clientes.csv');
  PB.Max := SL.Count;
  PB.Position := 0;
  tCli.Open;
  tCli.EmptyTable;
  tCli.IndexName := 'IID';
  Application.ProcessMessages;
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
//  for J := 1 to 2 do 
  for I := 1 to SL.Count-1 do begin
    PB.Position := I + 1;
    Application.ProcessMessages;
    S := SL[I];
    proxcampo;
    tCli.Insert;
    tCliNome.Value := ProxCampo;
    proxn(6);
    tCliEndereco.Value := ProxCampo;
    tCliTelefone.Value := ProxCampo;
    tCliIsento.Value := False;
    tCliIncluidoEm.Value := Now;
    tCliIncluidoPor.Value := 'importacao';
    tCli.Post;
  end;
  ShowMessage('Fim');
end;

procedure TForm16.FormShow(Sender: TObject);
begin
  tCli.Open;
end;

end.
