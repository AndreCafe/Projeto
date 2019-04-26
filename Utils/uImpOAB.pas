unit uImpOAB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, ncClassesBase, nxreRemoteServerEngine;

type
  TFrmPri = class(TForm)
    nxSession1: TnxSession;
    nxDB: TnxDatabase;
    tCli: TnxTable;
    nxTCP: TnxWinsockTransport;
    PB: TProgressBar;
    DataSource1: TDataSource;
    tCliID: TAutoIncField;
    tCliNome: TStringField;
    tCliEndereco: TStringField;
    tCliBairro: TStringField;
    tCliCidade: TStringField;
    tCliUF: TStringField;
    tCliCEP: TStringField;
    tCliSexo: TStringField;
    tCliObs: TnxMemoField;
    tCliCpf: TStringField;
    tCliRg: TStringField;
    tCliTelefone: TStringField;
    tCliEmail: TnxMemoField;
    tCliMinutos: TFloatField;
    tCliPassaportes: TFloatField;
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
    tCliTitEleitor: TStringField;
    tCliFidPontos: TFloatField;
    tCliFidTotal: TFloatField;
    tCliFidResg: TFloatField;
    tCliAniversario: TStringField;
    tCliCotaImpEspecial: TBooleanField;
    tCliCotaImpDia: TIntegerField;
    tCliCotaImpMes: TIntegerField;
    tCliSemFidelidade: TBooleanField;
    tCliTemCredito: TBooleanField;
    tCliNaoGuardarCredito: TBooleanField;
    tCliPermiteLoginSemCred: TBooleanField;
    tCliCHorario: TIntegerField;
    tCliOpCHorario: TWordField;
    tCliHP1: TIntegerField;
    tCliHP2: TIntegerField;
    tCliHP3: TIntegerField;
    tCliHP4: TIntegerField;
    tCliHP5: TIntegerField;
    tCliHP6: TIntegerField;
    tCliHP7: TIntegerField;
    tCliInativo: TBooleanField;
    tCliTipoAcessoPref: TIntegerField;
    tCliFornecedor: TBooleanField;
    tCliValorCred: TCurrencyField;
    Label2: TLabel;
    Button1: TButton;
    nxRSE: TnxRemoteServerEngine;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;

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


procedure TFrmPri.Button1Click(Sender: TObject);
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
  Button1.Enabled := False;
  SL := TStringList.Create;
  SL.LoadFromFile('C:\nexcafe\oab.csv');
  PB.Max := SL.Count;
  PB.Position := 0;
  tCli.Open;
  tCli.DeleteRecords;
  tCli.SetAutoIncValue(0);
  Application.ProcessMessages;
  ShortDateFormat := 'dd/mm/yyyy';
  for I := 1 to sl.Count-1 do begin
    PB.Position := I;
    Application.ProcessMessages;
    S := SL[I];
    sNome := ProxCampo;
    sUser := ProxCampo;
    tCli.Insert;
    tCliNome.Value := sNome;
    tCliUsername.Value := sUser;
    tCliSenha.Value := sUser;
    tCliIsento.Value := False;
    tCliIncluidoEm.Value := Date;
    tCliIncluidoPor.Value := 'admin';
    tCliInativo.Value := False;
    tCli.Post;
  end;
  ShowMessage(IntToStr(I)+' Usuários importados/atualizados');
  Close;
end;

procedure TFrmPri.FormShow(Sender: TObject);
begin
  tCli.Open;
end;

end.
