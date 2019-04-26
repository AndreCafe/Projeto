unit uImpDBF_SmartLaunch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids;

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
    dVC: TnxTable;
    nxDatabase1: TnxDatabase;
    dVCCodigo_Ace: TStringField;
    dVCNick: TStringField;
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
    tF: TDbf;
    tFID: TFloatField;
    tFUSERNAME: TStringField;
    tFPH: TStringField;
    tFATIVA: TBooleanField;
    tFINCLUSAO: TDateField;
    tFUG: TFloatField;
    tFNOTES: TMemoField;
    tFULTVISITA: TDateField;
    tFPNOME: TStringField;
    tFUNOME: TStringField;
    tFDATANASC: TDateField;
    tFEND: TStringField;
    tFCIDADE: TStringField;
    tFCEP: TStringField;
    tFUF: TStringField;
    tFPAIS: TStringField;
    tFEMAIL: TStringField;
    tFTELEFONE: TStringField;
    tFCELULAR: TStringField;
    tFSEXO: TFloatField;
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
  DbfGlobals.DefaultOpenCodePage := 850;
  TF.LanguageID := DbfLangId_PTB_850;
  TF.Open;

  tCli.Open;
  tCli.IndexName := 'IUsername';
  ShortDateFormat := 'DD-MM-yyyy';
  tCli.EmptyTable;

  PB.Max := TF.RecordCount;
  PB.Position := 0;
  
  TF.First;
  while not TF.eof do begin
    PB.Position := I + 1;
    Application.ProcessMessages;
    tCli.Insert;
    tCliID.Value := Trunc(TFID.Value);
    tCliNome.Value := Trim(TFPNome.Value + ' ' + TFUNome.Value);
    tCliEndereco.Value := Trim(TFEnd.Value);
    tCliUltVisita.Value := TFUltVisita.Value;
    tCliDataNasc.Value := tFDataNasc.Value;
    tCliUsername.Value := TFUsername.Value;
    tCliSenha.Value := '';
    tCliIncluidoEm.Value := TFInclusao.Value;
    tCliCidade.Value := TFCidade.Value;
    tCliCEP.Value := TFCEp.Value;
    tCliUF.Value := TFUF.Value;
    tCliTelefone.Value := TFTelefone.Value;
    tCliCelular.Value := TFCelular.Value;
    tCliEmail.Value := TFEmail.Value;
    tCliObs.Value := tFNotes.Value;

    tCliIsento.Value := False;
    
    if not tFSexo.IsNull then
    if tFSexo.Value = 0 then
      tCliSexo.Value := 'F' 
    else
    if tFSexo.Value = 1 then
      tCliSexo.Value := 'M';
      
    try
      tCliDataNasc.AsVariant := TFDataNasc.AsVariant;
    except
      tCliDataNasc.Clear;
    end;  
    
    if tCliDataNasc.Value <= 1 then
      tCliDataNasc.Clear;
      
    tCliIncluidoPor.value := 'admin';
//    tCliInativo.Value := not tFAtiva.Value;
    tCli.Post;
    
    TF.Next;
  end;

  tCli.Last;
  tCli.SetAutoIncValue(tCliID.Value);

  ShowMessage('Fim de importacao');
end;

end.

// Senha OptiCyber MS Access = k4hvd$$
// Senha TimerCafe = fad0001
