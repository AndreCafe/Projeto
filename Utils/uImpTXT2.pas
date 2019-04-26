unit uImpTXT2;

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
    tCliPassaportes: TFloatField;
    tCliTitEleitor: TStringField;
    tCliFidPontos: TFloatField;
    tCliFidTotal: TFloatField;
    tCliFidResg: TFloatField;
    tCliAniversario: TStringField;
    tCliNaoGuardarCredito: TBooleanField;
    tCliPermiteLoginSemCred: TBooleanField;
    tCliHP1: TIntegerField;
    tCliHP2: TIntegerField;
    tCliHP3: TIntegerField;
    tCliHP4: TIntegerField;
    tCliHP5: TIntegerField;
    tCliHP6: TIntegerField;
    tCliHP7: TIntegerField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

uses ncClassesBase;

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

function StrToVal(S: String): Currency;
var C: Integer; V: Double;
begin
  if Pos(',', S)>0 then
   S[Pos(',', S)] := '.';
  Val(S, V, C);  
  if C<>0 then
    Result := 0 else
    Result := V;
  if Result < 0 then Result := 0;
end;

procedure TForm16.Button1Click(Sender: TObject);
var 
  SL: TStrings;
  I, Min, Cod: Integer;
  S, s2: String;
  Mon : Currency;
  DT: TDateTime;

function ProxCampo: String;
var 
  P: Integer;
  Aspas, Fim : Boolean;
begin
  S := Trim(S);
  Aspas := False; Fim := False;
  p := 1;
  Result := '';
  
  while (p<=Length(S)) do begin
    if S[p] = '"' then begin
      Aspas := not Aspas;
      if not Aspas then 
        Fim := True else
        Result := '';
    end else begin
      if (S[p]=';') and (not Aspas) then
        Break else
        Result := Result + S[p];
    end;
    Inc(p);  
  end;
  Delete(S, 1, p);
end;  

begin
  SL := TStringList.Create;
  SL.LoadFromFile('c:\meus programas\nexcafe\cliente.csv');
  PB.Max := SL.Count;
  PB.Position := 0;
  tCli.Open;
  tCli.EmptyTable;
  ShortDateFormat := 'DD-MM-yy';
  for I := 0 to SL.Count-1 do begin
    PB.Position := I + 1;
    Application.ProcessMessages;
    S := SL[I];
    ProxCampo;
    tCli.Insert;
    tCliNome.Value := ProxCampo;
    tCliTelefone.Value := ProxCampo;
    tCliCelular.Value := ProxCampo;
    tCliEmail.Value := ProxCampo;
    tCliEndereco.value := Proxcampo;
    tCliBairro.Value := ProxCampo;
    tCliCidade.Value := ProxCampo;
    tCliUF.Value := ProxCampo;
    tCliCEP.Value := PRoxCampo;
    tCliCPF.Value := ProxCampo;
    tCliRG.Value := ProxCampo;
    try
      tCliDataNasc.Value := StrToDate(ProxCampo);
    except
    end;

    try
      tCliIncluidoEm.Value := StrToDateTime(proxCampo);  
    except
    end;
    
    tCliValorCred.Value := StrToVal(ProxCampo);
    tCliIncluidoPor.Value := 'admin';
    tCliInativo.Value := False;
    tCliIsento.Value := False;
    tCli.Post;
  end;
end;

end.
