unit uImpTXT_RCMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nx1xAllEngines, nxsdServerEngine, nxsrServerEngine,
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
    tCliNasc: TDateTimeField;
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
  Code : Integer;
  Res: Real;
begin
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
  S, s2, s3: String;
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
  SL.LoadFromFile('c:\meus programas\nexcafe\TCliente.txt');
  PB.Max := SL.Count;
  PB.Position := 0;
  tCli.Open;
  tCli.EmptyTable;
  ShortDateFormat := 'DD-MM-yyyy';
//  for J := 1 to 2 do 
  for I := 0 to SL.Count-1 do begin
    PB.Position := I + 1;
    Application.ProcessMessages;
    S := SL[I];
    proxn(3);
    tCli.Insert;
    tCliNome.Value := ProxCampo;
    tCliUsername.Value := ProxCampo;
{    if J=2 then begin
      tCliNome.Value := tCliNome.Value + ' 2';
      tCliUsername.Value := tCliUsername.Value + '_2';
    end;  }
    tCliSexo.Value := 'M';
    tCliSenha.Value := ProxCampo;
    tCliRG.Value := ProxCampo;
    tCliCPF.Value := ProxCampo;
    ProxCampo;
    tCliMinutos.Value := StrToDateTimeDef(ProxCampo, 0) * 24 * 60;
    tCliIncluidoEm.Value := StrToDateTimeDef(ProxCampo, Now);
    ProxCampo;
    tCliEmail.Value := ProxCampo;
    tCliDataNasc.Value := StrToDateTimeDef(ProxCampo, 0);
    if tCliDataNasc.Value=0 then tCliDataNasc.Clear;
    tCliEndereco.Value := ProxCampo;
    tCliTelefone.Value := ProxCampo;
    tCliObs.Value := ProxCampo;
    Proxn(6);
    tCliPai.Value := ProxCampo;
    tCliMae.Value := ProxCampo;
    tCliCEP.Value := ProxCampo;
    s2 := ProxCampo;
    if s2>'' then
      tCliEndereco.Value := tCliEndereco.Value + ', ' + s2;
    s2 := ProxCampo;
    if s2>'' then
      tCliEndereco.Value := tCliEndereco.Value + ' ' + s2;
    tCliBairro.Value := ProxCampo;
    tCliCidade.Value := ProxCampo;
    S2 := ProxCampo;
    if SameText(S2, 'São Paulo') or
       SameText(S2, 'Sao Paulo') then
      tCliUF.Value := 'SP';
    Proxn(1);
    tCliEscola.Value := ProxCampo; 
    tCliIsento.Value := False;
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
