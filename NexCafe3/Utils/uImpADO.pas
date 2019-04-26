unit uImpADO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nx1xAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, DBTables, ADODB;

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
    ADOConnection1: TADOConnection;
    T: TADOTable;
    TID: TAutoIncField;
    TUserName: TWideStringField;
    TAccountID: TWideStringField;
    TPasswordAvailable: TBooleanField;
    TPassword: TWideStringField;
    TType: TIntegerField;
    TTotalMinutes: TIntegerField;
    TMinutesUsed: TIntegerField;
    TTotalCash: TBCDField;
    TCashUsed: TBCDField;
    TToPay: TBCDField;
    TPoints: TIntegerField;
    TCreationDate: TDateTimeField;
    TValidSinceDate: TDateTimeField;
    TValidToDate: TDateTimeField;
    TValidFromTime: TDateTimeField;
    TValidToTime: TDateTimeField;
    TChangePasswordAllowed: TBooleanField;
    TLogonAllowed: TBooleanField;
    TWithoutPassword: TBooleanField;
    TUseWorkstationRates: TBooleanField;
    TChargingRate: TWideStringField;
    TFirstName: TWideStringField;
    TMiddleName: TWideStringField;
    TLastName: TWideStringField;
    TTitle: TWideStringField;
    TPhone: TWideStringField;
    TMobile: TWideStringField;
    TFax: TWideStringField;
    TAddress: TWideStringField;
    TCity: TWideStringField;
    TCountry: TWideStringField;
    TEmail: TWideStringField;
    TGender: TIntegerField;
    TBirthday: TDateTimeField;
    TComment: TWideStringField;
    TDescription: TWideStringField;
    TCustom1: TWideStringField;
    TCustom2: TWideStringField;
    TCustom3: TWideStringField;
    TCustom4: TWideStringField;
    TCustom5: TWideStringField;
    TCustom6: TWideStringField;
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
  PB.Max := T.RecordCount;
  PB.Position := 0;
  tCli.Open;
  tCli.EmptyTable;
//  ShortDateFormat := 'DD-MM-yyyy';
  T.First;
  while not T.eof do begin
    PB.Position := I + 1;
    Application.ProcessMessages;
    tCli.Insert;
    tCliID.Value := TID.Value;
    tCliUsername.Value := Trim(TUsername.Value);
    tCliSenha.Value := TPassword.Value;
    tCliNome.Value := TFirstName.Value;
    tCliMinutos.Value := TTotalMinutes.Value - TMinutesUsed.Value;
    tCliIncluidoEm.Value := TCreationDate.Value;
    tCliEndereco.Value := TAddress.Value;
    if TGender.Value=0 then
      tCliSexo.Value := 'F' else
      tCliSexo.Value := 'M';
    try
      tCliDataNasc.Value := TBirthday.Value;
    except
      tCliDataNasc.Clear;
    end;  
    tclirg.value := TAccountID.Value;
    tcliemail.value := TEmail.Value;
    tclitelefone.value := TPhone.Value;
    tclicelular.value := TMobile.Value;
    tCliInativo.Value := not TLogonAllowed.Value;
    tCliUF.Value := 'SC';
    tCliCidade.Value := TCity.Value;
    tCliObs.Value := TComment.Value;
    tCli.Post;
    T.next;
  end;
end;

end.
