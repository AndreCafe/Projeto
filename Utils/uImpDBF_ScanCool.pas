unit uImpDBF_ScanCool;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, Dbf, Dbf_lang, Dbf_dbffile;

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
    tVC: TDbf;
    tVCCODIGO_ACE: TStringField;
    tVCNICK: TStringField;
    tCA: TDbf;
    dVC: TnxTable;
    nxDatabase1: TnxDatabase;
    dVCCodigo_Ace: TStringField;
    dVCNick: TStringField;
    tCACODIGO_ACE: TStringField;
    tCASTATUS: TStringField;
    tCAVALOR_DISP: TStringField;
    tCADATA_CRIAC: TStringField;
    tCAURL: TStringField;
    tCATIPO_CODIG: TStringField;
    tCAVENDIDO: TBooleanField;
    tCAVINCULADO: TBooleanField;
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
    tFTIPO: TStringField;
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
  TVC.Open;
  TCA.Open;
  
  TF.First;
  while not TF.eof do begin
    PB.Position := I + 1;
    Application.ProcessMessages;
    tCli.Insert;
    tCliID.Value := Trunc(TFCodigo.Value);
    tCliNome.Value := TFNome.Value;
    tCliEndereco.Value := Trim(TFRua.Value+' '+tFNumero.Value);
    if Trim(tFComplement.Value)<>'------' then
      tCliEndereco.Value := Trim(tCliEndereco.Value+' '+tFComplement.Value);
    tCliEndereco.Value := FiltraEnd(tCliEndereco.Value);
    tCliUsername.Value := TFNick.Value;
    tCliSenha.Value := '';
    tCliIncluidoEm.Value := Now;
    tCliAlteradoEm.Value := Now;
    tCliRG.Value := TFDocumento.Value;
    tCliSexo.Value := 'M';
    tCliBairro.Value := TFBairro.Value;
    tCliCidade.Value := TFCidade.Value;
    tCliCEP.Value := TFCep.Value;
    tCliUF.Value := TFUF.Value;
    tCliTelefone.Value := TFTel_Reside.Value;
    tCliCelular.Value := TFTel_Celula.Value;
    tCliEmail.Value := TFE_mail.Value;
    tCliObs.Value := TFObs.Value;
    tCliCEP.Value := FiltroCEP(TFCEP.Value);
    tCliMae.Value := TFFiliacao.Value;
    try
      tCliDataNasc.AsVariant := TFData_Nasc.Value;
    except
      tCliDataNasc.Clear;
    end;  
    if tCliDataNasc.Value <= 1 then
      tCliDataNasc.Clear;
    tCliIncluidoPor.value := 'admin';
    tCliInativo.Value := False;
    tCli.Post;
    
    TF.Next;
  end;

  tCli.Last;
  tCli.SetAutoIncValue(tCliID.Value);

  dVC.Active := True;
  dVC.EmptyTable;
  
  tVC.Active := True;
  tVC.First;
  PB.Max := tVC.RecordCount;
  PB.Position := 1;
  Caption := 'Importando VC';
  while not tVC.Eof do begin
    dVC.Insert;
    dVCNick.Value := tVCNick.Value;
    dVCCodigo_Ace.Value := tVCCodigo_Ace.Value;
    dVC.Post;
    tVC.Next;
    PB.Position := PB.Position + 1;
    Application.ProcessMessages;
  end;
  

  Caption := 'Importando CA';
  PB.Max := tCA.RecordCount;
  PB.Position := 1;
  tCA.First;
  while not tCA.Eof do begin
    PB.Position := PB.Position + 1;
    Application.ProcessMessages;
    Mon := StrToCurrency(tCAValor_Disp.Value);
    if (Mon>0) and dVC.FindKey([tCACODIGO_ACE.Value]) then
      if tCli.FindKey([Trim(dVCNICK.Value)]) then begin
        tCli.Edit;
        tCliValorCred.Value := Mon;
        tCli.Post;
      end;
    tCA.Next;
  end; 

  ShowMessage('Fim de importacao');
end;

end.

// Senha OptiCyber MS Access = k4hvd$$
// Senha TimerCafe = fad0001
