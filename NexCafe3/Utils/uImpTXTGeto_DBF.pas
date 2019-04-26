unit uImpTXTGeto_DBF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nx1xAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, Dbf;

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
    tF: TDbf;
    DBGrid1: TDBGrid;
    DS: TDataSource;
    tCliObs: TMemoField;
    tCliEmail: TMemoField;
    tCliPassaportes: TFloatField;
    tCliNaoGuardarCredito: TBooleanField;
    tCliPermiteLoginSemCred: TBooleanField;
    tCliHP1: TIntegerField;
    tCliHP2: TIntegerField;
    tCliHP3: TIntegerField;
    tCliHP4: TIntegerField;
    tCliHP5: TIntegerField;
    tCliHP6: TIntegerField;
    tCliHP7: TIntegerField;
    tFUID: TFloatField;
    tFID: TFloatField;
    tFDATE: TDateField;
    tFLASTMODIFI: TDateField;
    tFNAME: TStringField;
    tFUSERID: TStringField;
    tFPASSWORD: TStringField;
    tFEMAIL: TStringField;
    tFJUMINID: TStringField;
    tFADDRESS: TStringField;
    tFTEL: TStringField;
    tFJOB: TStringField;
    tFCARD: TFloatField;
    tFGRADE: TFloatField;
    tFMUG: TStringField;
    tFMILEAGE: TFloatField;
    tFUSEDMILEAG: TFloatField;
    tFMEMO: TStringField;
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

procedure TForm16.Button1Click(Sender: TObject);
var 
  SL: TStrings;
  I: Integer;
  S: String;

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
  SL := TStringList.Create;
  PB.Max := tF.RecordCount;
  PB.Position := 0;
  tCli.Open;
  tCli.EmptyTable;
  ShortDateFormat := 'DD-MM-yyyy';
  while not tF.Eof do begin
    PB.Position := I + 1;
    Application.ProcessMessages;
    tCli.Insert;
    tCliNome.Value := tFName.Value;
    tCliEndereco.Value := tFAddress.Value;
    tCliEmail.Value := TFEmail.Value;
    tCliObs.Value := tFMemo.Value;
    tCliInativo.Value := False;
    tCliIsento.Value := False;
    tCliIncluidoEm.Value := tFDate.Value;
    tCliIncluidoPor.Value := 'admin';
    tCliAlteradoEm.Value := tFLastModifi.Value;
    tCliAlteradoPor.Value := 'admin';
    tCli.Post;
    tCli.Edit;
    tCliUsername.Value := tCliID.AsString;
    tCli.Post;
    tF.Next;
  end;
end;

end.
