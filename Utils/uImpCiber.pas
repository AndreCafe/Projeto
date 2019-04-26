unit uImpCiber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, ADODB, DBTables;

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
    DataSource1: TDataSource;
    nxDB2: TnxDatabase;
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
    tF: TADOTable;
    ADOConnection1: TADOConnection;
    Label2: TLabel;
    Label1: TLabel;
    tCliCotaImpEspecial: TBooleanField;
    tCliCotaImpDia: TIntegerField;
    tCliCotaImpMes: TIntegerField;
    tCliSemFidelidade: TBooleanField;
    tCliCHorario: TIntegerField;
    tCliOpCHorario: TWordField;
    tCliFornecedor: TBooleanField;
    DataSource2: TDataSource;
    tFLogin: TWideStringField;
    tFAlta: TDateTimeField;
    tFAviso: TWideStringField;
    tFCheckAviso: TBooleanField;
    tFBloquear: TBooleanField;
    tFcredito: TBCDField;
    tFDesactivada: TBooleanField;
    tFDescuento: TSmallintField;
    tFDir: TWideStringField;
    tFIntropass: TBooleanField;
    tFNombre: TWideStringField;
    tFNomodpass: TBooleanField;
    tFPass: TWideStringField;
    tFTarifa: TWideStringField;
    tFTelf: TWideStringField;
    tFTipo: TWideStringField;
    tFUltima: TDateTimeField;
    tFObservaciones: TWideMemoField;
    tFBonotiempo: TIntegerField;
    tFescritorio: TWordField;
    tFemail: TWideStringField;
    tFfoto: TWideStringField;
    tFCP: TWideStringField;
    tFLocalidad: TWideStringField;
    tFProvincia: TWideStringField;
    tFfecha_nac: TDateTimeField;
    tFEdad: TIntegerField;
    tFDNI: TWideStringField;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  Code, I : Integer;
  Res: Double;
  S2 : String;
begin
  Result := 0;
  S2 := '';
  for I := 1 to Length(S) do
    if S[I] in ['0'..'9', ',', '.'] then
    if S[I]=',' then
      S2 := S2 + '.' else
      S2 := S2 + S[I];
      
  S := S2;
    
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

function FiltroCEP(S: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if S[I]  in ['0'..'9', '-'] then
      Result := Result + S[I];
end;

function SoDig(S: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if S[I]  in ['0'..'9'] then
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
  I, Min, Cod, Qtd: Integer;
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
  TF.Open;
  tCli.Open;
  tCli.IndexName := 'IUsername';
  ShortDateFormat := 'DD-MM-yyyy';
  tCli.EmptyTable;
  DecimalSeparator := ',';
  ThousandSeparator := '.';

  Button1.Enabled := False;

  PB.Max := TF.RecordCount;
  PB.Position := 0;

  Cod := 0;
  tCli.IndexName := 'IID';
  
  TF.First;
  while not TF.eof do begin
    PB.Position := I + 1;
    Application.ProcessMessages;
    tCli.Insert;
    
    tCliNome.Value := TFNombre.Value;
    tCliUsername.Value := TFLogin.Value;
    tCliMinutos.Value := TFBonoTiempo.Value / 60;
    tCliEmail.Value := tFEmail.Value;
    tCliSenha.Value := TFPass.Value;
    tCliTelefone.Value := tFTelf.Value;
    tCliObs.Value := tFObservaciones.Value;
    tCliDataNasc.Value := tFFecha_nac.Value;
    tCliRG.Value := tFDNI.Value;
    tCliEndereco.Value := tFDir.Value;
    tCliUltVisita.Value := TFUltima.Value;
    tCliIncluidoPor.value := 'admin';
    tCliInativo.Value := False; 
    tCliIsento.Value := False;
    tCli.Post;
    
    TF.Next;
  end;

  ShowMessage('Fim de importacao - Zipar e enviar o arquivo CLIENTES.NX1 para o cliente');

  Close;
end;

procedure TForm16.FormCreate(Sender: TObject);
begin
  nxDB.AliasPath := ExtractFilePath(ParamStr(0))+'dados';
  nxDB2.AliasPath := ExtractFilePath(ParamStr(0));
end;

end.

// Senha OptiCyber MS Access = k4hvd$$
// Senha TimerCafe = fad0001
