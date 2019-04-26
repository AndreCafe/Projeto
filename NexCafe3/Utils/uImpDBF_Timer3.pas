unit uImpDBF_Timer3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nx1xAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, DBTables, IBDatabase, Dbf;

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
    TF: TDbf;
    DataSource1: TDataSource;
    TFCODIGO: TFloatField;
    TFNOME: TStringField;
    TFDATA_NASC: TStringField;
    TFRUA: TStringField;
    TFNUMERO: TStringField;
    TFCOMPLEMENT: TStringField;
    TFBAIRRO: TStringField;
    TFCIDADE: TStringField;
    TFUF: TStringField;
    TFTEL_RESIDE: TStringField;
    TFTEL_COMERC: TStringField;
    TFTEL_CELULA: TStringField;
    TFE_MAIL: TStringField;
    TFOBS: TMemoField;
    TFCEP: TStringField;
    TFGRUPO: TStringField;
    TFNICK: TStringField;
    TFFILIACAO: TStringField;
    TFDOCUMENTO: TStringField;
    TFAUTORIZADO: TBooleanField;
    TFIDADE: TFloatField;
    TFCAMINHOFOT: TStringField;
    TFMSGOBS: TBooleanField;
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
  Code : Integer;
  Res: Real;
begin
  Result := 0;
  S := Trim(S);
  for code := 1 to Length(S) do
    if S[code] = ',' then S[code] := '.';
    
  if S>'' then begin
    Val(S, Res, Code);
    if Code=0 then
      Result := Res;
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
  SL: TStrings;
  I, Min, Cod: Integer;
  S: String;
  Mon : Currency;

function ProxCampo: String;
var P: Integer;
begin
  P := Pos(';', S);
  if P>0 then begin
    Result := Trim(Copy(S, 1, P-1));
    Delete(S, 1, P);
  end else begin
    Result := Trim(S);
    S := '';
  end;  
  if Copy(Result, 1, 1)='"' then
    Delete(Result, 1, 1);
  if Copy(Result, Length(Result), 1)='"' then
    Delete(Result, Length(Result), 1);
end;  

begin
  PB.Max := TF.RecordCount;
  PB.Position := 0;
  tCli.Open;
//  tCli.EmptyTable;
//  ShortDateFormat := 'DD-MM-yyyy';
  TF.First;
  while not TF.eof do begin
    PB.Position := I + 1;
    Application.ProcessMessages;
    tCli.Insert;
    tCliNome.Value := TFNome.Value;
    tCliEndereco.Value := Trim(TFRua.Value+' '+tFNumero.Value);
    if Trim(tFComplement.Value)<>'------' then
      tCliEndereco.Value := Trim(tCliEndereco.Value+' '+tFComplement.Value);
    tCliEndereco.Value := FiltraEnd(tCliEndereco.Value);
    tCliUsername.Value := TFNick.Value;
    tCliSenha.Value := '';
    tCliIncluidoEm.Value := Now;
    tCliAlteradoEm.Value := Now;
//    tCliRG.Value := TFDoc.Value;
    tCliSexo.Value := 'M';
    tCliBairro.Value := TFBairro.Value;
    tCliCidade.Value := TFCidade.Value;
    tCliCEP.Value := TFCep.Value;
    tCliUF.Value := TFUF.Value;
    tCliTelefone.Value := TFTel_Reside.Value;
    tCliCelular.Value := TFTel_Celula.Value;
    tCliCEP.Value := FiltroCEP(TFCEP.Value);
    try
      tCliDataNasc.AsVariant := TFData_Nasc.Value;
    except
      tCliDataNasc.Clear;
    end;  
    if tCliDataNasc.Value <= 1 then
      tCliDataNasc.Clear;
    tCliIncluidoPor.value := 'admin';
    tCliInativo.Value := False;
    tCli.Post;
    TF.Next;
  end;
end;

end.

// Senha OptiCyber MS Access = k4hvd$$
// Senha TimerCafe = fad0001
