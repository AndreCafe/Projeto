unit uImpMDB_PostNet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, DBTables, IBDatabase, ADODB;
  

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
    ADOConnection1: TADOConnection;
    tF: TADOTable;
    TFCod: TIntegerField;
    TFNome: TWideStringField;
    TFRG: TWideStringField;
    TFEnd: TWideStringField;
    tFBairro: TWideStringField;
    tFCidade: TWideStringField;
    tFEstado: TWideStringField;
    tFCEP: TWideStringField;
    tFTelefone: TWideStringField;
    tFCelular: TWideStringField;
    tFDataNasc: TDateTimeField;
    tFDataCadastro: TDateTimeField;
    tFObs: TWideMemoField;
    tFEmail: TWideStringField;
    TFEscola: TWideStringField;
    tFTurno: TWideStringField;
    TFNumero: TAutoIncField;
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
  sTempo : String;
  sUsername : String;

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

function LoginStr(Palavra: Integer): String;
var P: Integer;
begin
  for P := 2 to Length(S) do begin
    if (Copy(S, P, 1)=' ') and (Copy(S, P-1, 1)<>' ') then begin
      Dec(Palavra);
      if Palavra=0 then begin
        Result := Trim(Copy(S, 1, P));
        Exit;
      end;
    end;
  end;
  Result := S;
end;

begin
//  DbfGlobals.DefaultOpenCodePage := 850;
//  TF.LanguageID := DbfLangId_PTB_850;

  TF.Active := True;
  PB.Max := TF.RecordCount;
  PB.Position := 0;
  I := 0; Cod := 0;
  tCli.Open;
  tCli.EmptyTable;
//  ShortDateFormat := 'DD-MM-yyyy';
  TF.First;
  while not TF.eof do begin
    Inc(I);
    PB.Position := I + 1;
    Application.ProcessMessages;

    TcLI.iNSERT;

//    tCliID.Value := TFCod.Value;

    if tFNumero.AsInteger > Cod then Cod := TFNumero.Value;

    tCliNome.Value := TFNome.Value;
    tCliRG.Value := TFRG.Value;
    tCliEndereco.Value := TFEnd.Value;
    tCliBairro.Value := tFBairro.Value;
    tCliCidade.Value := tFCidade.Value;
    tCliUF.Value := tFEstado.Value;
    tCliCEP.Value := tFCEP.Value;
    tCliTelefone.Value := tFTelefone.Value;
    tCliCelular.Value := tFCelular.Value;
    tCliDataNasc.Value := tFDataNasc.Value;
    tCliIncluidoEm.Value := tFDataCadastro.Value;
    tCliObs.Value := tFObs.Value;
    tCliEmail.Value := tFEmail.Value;
    tCliEscola.Value := TFEscola.Value;
    tCliUsername.Value := TFNumero.AsString;
    tCliIncluidoPor.value := 'admin';
    tCliInativo.Value := False;
    tCliIsento.Value := False;
    tCliObs.Value := TFObs.Value;
    tCli.Post;
    
    TF.Next;
  end;

  tCli.SetAutoIncValue(Cod);

  ShowMessage('Fim de Importação! - '+IntToStr(I)+' registros importados');

end;

end.

// Senha OptiCyber MS Access = k4hvd$$
