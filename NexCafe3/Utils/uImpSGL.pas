unit uImpSGL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nx1xAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, DBTables, IBDatabase, IBCustomDataSet, IBTable;

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
    IBDatabase1: TIBDatabase;
    IBTable1: TIBTable;
    IBTransaction1: TIBTransaction;
    IBTable1CODIGO: TIntegerField;
    IBTable1LOGIN: TIBStringField;
    IBTable1SENHA: TIBStringField;
    IBTable1NOME: TIBStringField;
    IBTable1DATANASC: TDateTimeField;
    IBTable1ENDERECO: TIBStringField;
    IBTable1NUM: TIBStringField;
    IBTable1COMPL: TIBStringField;
    IBTable1BAIRRO: TIBStringField;
    IBTable1CEP: TIBStringField;
    IBTable1CIDADE: TIBStringField;
    IBTable1UF: TIBStringField;
    IBTable1DATACAD: TDateTimeField;
    IBTable1NIVEL: TIBStringField;
    IBTable1EMAIL: TIBStringField;
    IBTable1STATUS: TIBStringField;
    IBTable1EDITAR: TIBStringField;
    IBTable1TIPO: TIBStringField;
    IBTable1DESCONTO: TIBStringField;
    IBTable1TEMPODESCONTO: TIntegerField;
    IBTable1OBS: TMemoField;
    IBTable1FOTO: TBlobField;
    IBTable1TEMPOJOGO: TIntegerField;
    IBTable1MONETARIO: TFloatField;
    IBTable1TEMPOCOMPRADO: TIntegerField;
    IBTable1CODBARRA: TIBStringField;
    IBTable1FONE: TIBStringField;
    IBTable1CELULAR: TIBStringField;
    IBTable1TIPOCLIENTE: TIBStringField;
    IBTable1ATIVO: TIBStringField;
    IBTable1BILHETE: TIBStringField;
    IBTable1RG: TIBStringField;
    IBTable1CPF: TIBStringField;
    IBTable1ICQ: TIBStringField;
    IBTable1EMAIL2: TIBStringField;
    IBTable1ESTUDANTE: TIBStringField;
    IBTable1SERIE: TIBStringField;
    IBTable1PERIODO: TIBStringField;
    IBTable1ESCOLA: TIBStringField;
    IBTable1DEL: TIBStringField;
    IBTable1IMPRIMIU: TIBStringField;
    IBTable1LOTE: TIntegerField;
    IBTable1VALORBILHETE: TFloatField;
    IBTable1NOMEPAI: TIBStringField;
    IBTable1NOMEMAE: TIBStringField;
    IBTable1HORAINI: TIBStringField;
    IBTable1HORAFIM: TIBStringField;
    IBTable1DATAGANHOUVIP: TDateTimeField;
    IBTable1BONUSVALOR: TFloatField;
    IBTable1LIMITECREDITO: TFloatField;
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
  PB.Max := Table1.RecordCount;
  PB.Position := 0;
  tCli.Open;
  tCli.EmptyTable;
//  ShortDateFormat := 'DD-MM-yyyy';
  table1.First;
  while not table1.eof do begin
    PB.Position := I + 1;
    Application.ProcessMessages;
    tCli.Insert;
    tCliID.Value := Trunc(table1cod.Value);
    tCliUsername.Value := Trim(table1username.Value);
    tCliSenha.Value := Trim(table1senha.Value);
    tCliNome.Value := table1nome.Value;
    tCliSexo.Value := table1sexo.value;
    try
      tCliDataNasc.Value := table1datanasc.AsDateTime;
    except
      tCliDataNasc.Clear;
    end;  
    tclirg.value := trim(table1rg.Value);
    tcliendereco.value := table1endereco.Value;
    tcliemail.value := table1email.Value;
    tclitelefone.value := table1telefone.value;
    tclicelular.value := table1celular.Value;
    tcliincluidopor.value := 'Jota';
    tCliIncluidoEm.Value := Date;
    tCliInativo.Value := False;
    tCli.Post;
    table1.next;
  end;
end;

end.
