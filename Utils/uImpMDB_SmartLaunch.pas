unit uImpMDB_SmartLaunch;

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
    tCliHP1: TIntegerField;
    tCliHP2: TIntegerField;
    tCliHP3: TIntegerField;
    tCliHP4: TIntegerField;
    tCliHP5: TIntegerField;
    tCliHP6: TIntegerField;
    tCliHP7: TIntegerField;
    ADOConnection1: TADOConnection;
    tF: TADOTable;
    tFID: TAutoIncField;
    tFUsername: TWideStringField;
    tFPasswordHash: TWideStringField;
    tFAccountStatus: TBooleanField;
    tFCreatedDateTime: TDateTimeField;
    tFUsergroupID: TIntegerField;
    tFUsergroupDateTime: TDateTimeField;
    tFUsergroupExpirationDate: TDateTimeField;
    tFOverruleGameRating: TIntegerField;
    tFAllowedCredit: TFloatField;
    tFNotes: TWideMemoField;
    tFFingerprint: TVarBytesField;
    tFUsedOfferLastTime: TBooleanField;
    tFLastLogin: TDateTimeField;
    tFAlarm: TDateTimeField;
    tFPrepaidTicketID: TIntegerField;
    tFCardHashCode: TWideStringField;
    tFAskAtNextLogin: TIntegerField;
    tFCreditLimit: TIntegerField;
    tFInfoFirstname: TWideStringField;
    tFInfoLastname: TWideStringField;
    tFInfoBirthday: TDateTimeField;
    tFInfoAddress: TWideStringField;
    tFInfoCity: TWideStringField;
    tFInfoZip: TWideStringField;
    tFInfoState: TWideStringField;
    tFInfoCountry: TWideStringField;
    tFInfoEmail: TWideStringField;
    tFInfoTelephone: TWideStringField;
    tFInfoMobilephone: TWideStringField;
    tFInfoSex: TWordField;
    tFInfoPersonalnumber: TWideStringField;
    tFInfoPersonalnumberVerified: TWordField;
    tFBanned: TBooleanField;
    tFHasSentReminderEmail: TIntegerField;
    tFHasSentSignupEmail: TIntegerField;
    tFBarcode: TWideStringField;
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


function MinutosOpti(I, F: TDateTime): Double;
var 
  H1, M1, S1, MS1,
  H2, M2, S2, MS2  : Word;
begin
  if F<I then begin
    Result := 0;
    Exit;
  end;

  DecodeTime(I, H1, M1, S1, MS1);
  DecodeTime(F, H2, M2, S2, MS2);
  I := Int(I) + EncodeTime(H1, M1, 0, 0);
  F := Int(F) + EncodeTime(H2, M2, 0, 0);
  Result := DateTimeToMinutos(F-I);
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
  I := 0;
  tCli.Open;
  tCli.EmptyTable;
//  ShortDateFormat := 'DD-MM-yyyy';
  TF.First;
  while not TF.eof do begin
    Inc(I);
    PB.Position := I + 1;
    Application.ProcessMessages;

    sUsername := TFUSername.Value;
    tCli.Insert;
    tCLIID.Value := TFID.Value;
    tCliUsername.Value := sUsername;
    tCliIncluidoEm.Value := TFCreatedDateTime.Value;
    tCliAlteradoEm.Value := TFCreatedDateTime.Value;
    tCliNome.Value := TrimLeft(Trim(TFInfoFirstName.Value + ' ' + TFInfoLastName.Value));
    if tCliNome.Value='' then tCliNome.Value := tCliUsername.Value;
    tCliEndereco.Value := TFInfoAddress.Value;
    tCliCEP.Value := TFInfoZip.Value;
    tCliCidade.Value := TFInfoCity.Value;
    tCliTelefone.Value := TFInfoTelephone.Value;
    tCliCelular.Value := TFInfoMobilePhone.Value;
    tCliEmail.Value := TFInfoEmail.Value;
    tCliInativo.Value := TFBanned.Value;  
    tCliUltVisita.Value := tFLastLogin.Value;
    try
      tCliDataNasc.Value := TFInfoBirthday.Value;
    except
      tCliDataNasc.Clear;
    end;
    if tCliDataNasc.Value <= 1 then
      tCliDataNasc.Clear;
        
    tCliIncluidoPor.value := 'admin';
    tCliInativo.Value := False;
    tCliIsento.Value := False;
    tCliObs.Value := TFNotes.Value;
    tCli.Post;
    TF.Next;
  end;

  ShowMessage('Fim de Importação! - '+IntToStr(I)+' registros importados');

end;

end.

// Senha OptiCyber MS Access = k4hvd$$
