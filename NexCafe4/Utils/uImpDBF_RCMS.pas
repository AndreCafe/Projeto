unit uImpDBF_RCMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, DBTables, IBDatabase, Dbf, DBF_lang, dbf_dbffile, ADODB;

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
    tF: TADOTable;
    ADOConnection1: TADOConnection;
    Q: TADOQuery;
    QsLogin: TWideStringField;
    QsSenha: TWideStringField;
    QdData: TDateTimeField;
    QobjMaquina: TIntegerField;
    QiStatus: TIntegerField;
    QsTempo: TWideStringField;
    Button2: TButton;
    tFiCliID: TAutoIncField;
    tFiCodigo: TIntegerField;
    tFiGCID: TIntegerField;
    tFsNome: TWideStringField;
    tFsNick: TWideStringField;
    tFsSenha: TWideStringField;
    tFsRG: TWideStringField;
    tFsCPF: TWideStringField;
    tFmCredito: TBCDField;
    tFdCredito: TDateTimeField;
    tFdCadastro: TDateTimeField;
    tFiUsuID: TIntegerField;
    tFsEmail: TWideStringField;
    tFdNascimento: TDateTimeField;
    tFsEndereco: TWideStringField;
    tFsFone: TWideStringField;
    tFsObs: TWideMemoField;
    tFbAtivo: TBooleanField;
    tFdInativacao: TDateTimeField;
    tFbAviso: TBooleanField;
    tFbCusto: TBooleanField;
    tFbAutorizacao: TBooleanField;
    tFbLogar: TBooleanField;
    tFsPai: TWideStringField;
    tFsMae: TWideStringField;
    tFsCEP: TWideStringField;
    tFsNumero: TWideStringField;
    tFsComplemento: TWideStringField;
    tFsBairro: TWideStringField;
    tFsCidade: TWideStringField;
    tFsEstado: TWideStringField;
    tFiTurnoID: TIntegerField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
//  DbfGlobals.DefaultOpenCodePage := 850;
//  TF.LanguageID := DbfLangId_PTB_850;
  tCli.Open;
  tCli.EmptyTable;
//  ShortDateFormat := 'DD-MM-yyyy';
  TF.Open; 
  PB.Max := TF.RecordCount;
  PB.Position := 0;
  TF.First;
  while not TF.eof do begin
    PB.Position := I + 1;
    Application.ProcessMessages;
    tCli.Insert;
    tCliID.Value := Trunc(TFICodigo.Value);
    tCliUsername.Value := tCliID.AsString;
    tCliNickname.Value := TFSNick.Value;
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
      
    if tFSComplemento.Value>'' then
      tCliEndereco.Value := tCliEndereco.Value + ' ' + tFSComplemento.Value;
     
    
    tCliBairro.Value := TFSBairro.Value;
    tCliCidade.Value := TFSCidade.Value;
    tCliCEP.Value := TFSCep.Value;
    
    try
      tCliDataNasc.Value := TFDNascimento.Value;
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
    tCliPai.Value := TFSPai.Value;
    tCliMae.Value := TFSMae.Value;
    tCliIsento.Value := False;
    tCli.Post;
    TF.Next;
  end;
  ShowMessage(IntToStr(tCli.RecordCount)+' importados');
  tCli.IndexName := 'IID';
  tCli.Last;
  tCli.SetAutoIncValue(tCliID.Value);
end;

function strtomin(s: string): Double;
begin
  Result := 0;
  if Trim(s) = '' then Exit;
  Result := StrToIntDef(Copy(s, 1, Pos(':', S)-1), 0) * 60;
  Delete(S, 1, Pos(':', S));
  Result := Result + StrToIntDef(Copy(s, 1, Pos(':', S)-1), 0);
  Delete(S, 1, Pos(':', S));
  Result := Result + (StrToIntDef(Trim(S), 0) / 60);
end;

procedure TForm16.Button2Click(Sender: TObject);
var M: Double;
begin
  Q.First;
  M := 0;
  while not q.eof do begin
    M := M + StrTomin(qSTempo.Value);
    Q.next;
  end;
  ShowMessage(FloatToStr(M));
end;

end.

// Senha OptiCyber MS Access = k4hvd$$
