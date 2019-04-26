unit uImpCSV_Extreme;

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
    Memo1: TMemo;
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

function MeuTrim(aStr: String): String;
var 
   I: Integer; 
begin
  Result := Trim(aStr);
{  for I := 1 to Length(S) do 
    if Ord(S[i])=160 then
      Result := Result + ' ' else
      Result := Result + S[i];}
end;

procedure TForm16.Button1Click(Sender: TObject);
var 
  SL: TStrings;
  I, J, Min, Cod: Integer;
  S, s2, s3, sDoc, s4, s5: String;
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

  for P := Length(Result) downto 1 do 
    if Result[P]='"' then Delete(Result, P, 1);
  Result := Trim(MeuTrim(Result));
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
  SL.LoadFromFile('c:\nexcafe\clientes.csv');
  PB.Max := SL.Count;
  PB.Position := 0;
  tCli.Open;
  tCli.EmptyTable;
  Application.ProcessMessages;
  ShortDateFormat := 'dd/mm/yyyy';
//  for J := 1 to 2 do 
  for I := 1 to SL.Count-1 do begin
    PB.Position := I + 1;
    Application.ProcessMessages;
    S := SL[I];
    try
      s4 := ProxCampo;
      tCli.Insert;
      tCliID.Value := StrToInt(SoDig2(s4));
      tCliNome.Value := ProxCampo;
      tCliEndereco.Value := ProxCampo;
      tCliRG.Value := ProxCampo;
      tCliEmail.Value := ProxCampo;
      tCliTelefone.Value := ProxCampo;
      s4 := ProxCampo;
      try
        tCliUsername.Value := s4;
      except
        s4 := 'username '+s4;
        raise;
      end;
  
      try
        tCliDataNasc.AsString := ProxCampo;
      except
      end;
  
      tCliBairro.Value := ProxCampo;
  
      ProxCampo;
      ProxCampo;
  
      tCliMinutos.Value := StrToIntDef(ProxCampo, 0) * 60;
      tCliObs.Value := ProxCampo;
      tCliMinutos.Value := tCliMinutos.Value + StrToIntDef(ProxCampo, 0);
      ProxN(3);
      tCliPai.Value := ProxCampo;
      tCliMae.Value := ProxCampo;
      tCliEscola.Value := ProxCampo;
      
      tCliSexo.Value := ProxCampo;
      tCliIsento.Value := False;
      tCliNaoGuardarCredito.Value := True;
      tCliIncluidoEm.Value := Now;
      tCliIncluidoPor.Value := 'admin';
      tCliInativo.Value := False;
      tCli.Post;
    except
      on E: Exception do begin
        tCli.Cancel;
        Memo1.Lines.Add(s4 + ': '+ E.mEssage);
      end;
    end;
  end;
  ShowMessage('Fim');
end;

procedure TForm16.FormShow(Sender: TObject);
begin
  tCli.Open;
end;

end.
