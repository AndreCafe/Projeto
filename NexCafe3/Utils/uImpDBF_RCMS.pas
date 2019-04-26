unit uImpDBF_RCMS;

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
    TFICLIID: TFloatField;
    TFICODIGO: TFloatField;
    TFIGCID: TFloatField;
    TFSNOME: TStringField;
    TFSNICK: TStringField;
    TFSSENHA: TStringField;
    TFSRG: TStringField;
    TFSCPF: TStringField;
    TFMCREDITO: TFloatField;
    TFDCREDITO: TDateField;
    TFDCADASTRO: TDateField;
    TFIUSUID: TFloatField;
    TFSEMAIL: TStringField;
    TFDNASCIMENT: TDateField;
    TFSENDERECO: TStringField;
    TFSFONE: TStringField;
    TFSOBS: TMemoField;
    TFBATIVO: TBooleanField;
    TFDINATIVACA: TDateField;
    TFBAVISO: TBooleanField;
    TFBCUSTO: TBooleanField;
    TFBAUTORIZAC: TBooleanField;
    TFBLOGAR: TBooleanField;
    TFSPAI: TStringField;
    TFSMAE: TStringField;
    TFSCEP: TStringField;
    TFSNUMERO: TStringField;
    TFSCOMPLEMEN: TStringField;
    TFSBAIRRO: TStringField;
    TFSCIDADE: TStringField;
    TFSESTADO: TStringField;
    TFITURNOID: TFloatField;
    TFSESCOLA: TStringField;
    TFDINICIOAUL: TDateField;
    TFDFINALAULA: TDateField;
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
  tCli.EmptyTable;
//  ShortDateFormat := 'DD-MM-yyyy';
  TF.First;
  while not TF.eof do begin
    PB.Position := I + 1;
    Application.ProcessMessages;
    tCli.Insert;
    tCliUsername.Value := TFSNick.Value;
    tCliSenha.Value := TFSSenha.Value;
    tCliIncluidoEm.Value := TFDCadastro.Value;
    tCliAlteradoEm.Value := Now;
    tCliNome.Value := TFSNome.Value;
    tCliRG.Value := TFSRG.Value;
    tCliCPF.Value := TFSCPF.Value;
    tCliSexo.Value := 'M';
    tCliEndereco.Value := TFSEndereco.Value;
    tCliMinutos.Value := tFDCredito.Value * 24 * 60;
    if TFSNumero.Value>'' then
      tCliEndereco.Value := tCliEndereco.Value + ' ' + TFSNumero.Value;
      
    if tFSComplemen.Value>'' then
      tCliEndereco.Value := tCliEndereco.Value + ' ' + tFSComplemen.Value;
     
    
    tCliBairro.Value := TFSBairro.Value;
    tCliCidade.Value := TFSCidade.Value;
    tCliCEP.Value := TFSCep.Value;
    
    try
      tCliDataNasc.Value := TFDNasciment.Value;
    except
      tCliDataNasc.Clear;
    end;  
    if tCliDataNasc.Value <= 1 then
      tCliDataNasc.Clear;
      
    tCliEmail.value := TFSEmail.Value;
    tCliTelefone.Value := TFSFone.AsString;
      
    tCliIncluidoPor.value := 'admin';
    tCliInativo.Value := False;
    tCliObs.Value := TFSObs.Value;
    tCliEmail.Value := TFSEmail.Value;
    tCliEscola.Value := TFSEscola.Value;
    tCliPai.Value := TFSPai.Value;
    tCliMae.Value := TFSMae.Value;
    tCli.Post;
    TF.Next;
  end;
end;

end.

// Senha OptiCyber MS Access = k4hvd$$
