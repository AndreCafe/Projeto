unit uImpTXTSGL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nx1xAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent;

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
    nxQuery1: TnxQuery;
    nxDatabase1: TnxDatabase;
    tF: TnxTable;
    tFCODIGO: TIntegerField;
    tFLOGIN: TStringField;
    tFSENHA: TStringField;
    tFNOME: TStringField;
    tFDATANASC: TDateTimeField;
    tFENDERECO: TStringField;
    tFNUM: TStringField;
    tFCOMPL: TStringField;
    tFBAIRRO: TStringField;
    tFCEP: TStringField;
    tFCIDADE: TStringField;
    tFUF: TStringField;
    tFDATACAD: TDateTimeField;
    tFNIVEL: TStringField;
    tFEMAIL: TStringField;
    tFSTATUS: TStringField;
    tFEDITAR: TStringField;
    tFTIPO: TStringField;
    tFDESCONTO: TStringField;
    tFTEMPODESCONTO: TIntegerField;
    tFTEMPOJOGO: TIntegerField;
    tFMONETARIO: TFloatField;
    tFTEMPOCOMPRADO: TIntegerField;
    tFCODBARRA: TStringField;
    tFFONE: TStringField;
    tFCELULAR: TStringField;
    tFTIPOCLIENTE: TStringField;
    tFATIVO: TStringField;
    tFBILHETE: TStringField;
    tFRG: TStringField;
    tFCPF: TStringField;
    tFICQ: TStringField;
    tFEMAIL2: TStringField;
    tFESTUDANTE: TStringField;
    tFSERIE: TStringField;
    tFPERIODO: TStringField;
    tFESCOLA: TStringField;
    tFDEL: TStringField;
    tFIMPRIMIU: TStringField;
    tFLOTE: TIntegerField;
    tFVALORBILHETE: TFloatField;
    tFNOMEPAI: TStringField;
    tFNOMEMAE: TStringField;
    tFHORAINI: TStringField;
    tFHORAFIM: TStringField;
    tFDATAGANHOUVIP: TDateTimeField;
    tFBONUSVALOR: TFloatField;
    tFLIMITECREDITO: TFloatField;
    tFFORMAPOS: TStringField;
    tFGANHOUANIVER: TDateTimeField;
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

procedure TForm16.Button1Click(Sender: TObject);
var 
  SL: TStrings;
  I, Min: Integer;
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
  tF.Open;
  PB.Max := tF.RecordCount;
  PB.Position := 0;
  tCli.Open;
  tCli.EmptyTable;
//  ShortDateFormat := 'DD-MM-yyyy';
  while not tF.Eof do begin
    PB.Position := PB.Position + 1;
    Application.ProcessMessages;
    tCli.Insert;
    tCliID.Value := tFCodigo.Value;
    tCliNome.Value := tFNome.Value;
    tCliUsername.Value := tFLogin.Value;
    tCliSenha.Value := tFSENHA.Value;
    tCliDataNasc.Value := tFDATANASC.Value;
    if tCliDataNasc.Value < 1 then tCliDataNasc.Clear;
    
    tCliEndereco.Value := tFEndereco.Value;
    if tFNum.Value>'' then tCliEndereco.Value := tCliEndereco.Value + ' ' + tFNum.Value;
    if tFCompl.Value>'' then tCliEndereco.Value := tCliEndereco.Value+ ' ' + tFCompl.Value;
    tCliBairro.Value := tFBairro.Value;
    tCliCEP.Value := tFCEP.Value;
    tCliCidade.Value :=tFCidade.Value;
    tCliUF.Value := tFUF.Value;
    tCliIncluidoEm.Value := tFDataCad.Value;
    tCliEmail.Value := tFEmail.Value;
    tCliTelefone.Value := tFFone.Value;
    tCliCelular.Value := tFCelular.Value;
    tCliIsento.Value := SameText('Livre', tFTipoCliente.Value);
    tCliRG.Value := tFRG.Value;
    tCliCPF.Value := tFCPF.Value;
    tCliEscola.Value := tFEscola.Value;
    tCliPai.Value := tFNomePai.Value;
    tCliMae.Value := tFNomeMae.Value;
    tCli.Post;
    tF.Next;
  end;
end;

end.

CREATE TABLE CLIENTES(
  CODIGO Integer,
  LOGIN Varchar(15),
  SENHA Varchar(10),
  NOME Varchar(40),
  DATANASC Timestamp,
  ENDERECO Varchar(40),
  NUM Varchar(5),
  COMPL Varchar(20),
  BAIRRO Varchar(25),
  CEP Varchar(9),
  CIDADE Varchar(30),
  UF Varchar(2),
  DATACAD Timestamp,
  NIVEL Char(1),
  EMAIL Varchar(30),
  STATUS Char(1),
  EDITAR Char(1),
  TIPO Varchar(15),
  DESCONTO Char(5),
  TEMPODESCONTO Integer,
  OBS Blob sub_type 1,
  FOTO Blob sub_type 0,
  TEMPOJOGO Integer,
  MONETARIO Float,
  TEMPOCOMPRADO Integer,
  CODBARRA Varchar(20),
  FONE Varchar(15),
  CELULAR Varchar(15),
  TIPOCLIENTE Varchar(20),
  ATIVO Char(1),
  BILHETE Char(1),
  RG Varchar(20),
  CPF Varchar(20),
  ICQ Varchar(10),
  EMAIL2 Varchar(30),
  ESTUDANTE Char(1),
  SERIE Varchar(20),
  PERIODO Varchar(10),
  ESCOLA Varchar(30),
  DEL Char(1),
  IMPRIMIU Char(1),
  LOTE Integer,
  VALORBILHETE Float,
  NOMEPAI Varchar(40),
  NOMEMAE Varchar(40),
  HORAINI Char(5),
  HORAFIM Char(5),
  DATAGANHOUVIP Timestamp,
  BONUSVALOR Float,
  LIMITECREDITO Float,
  FORMAPOS Char(1),
  GANHOUANIVER Timestamp,
);
