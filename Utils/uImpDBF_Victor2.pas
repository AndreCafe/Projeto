unit uImpDBF_Victor2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, DBTables, IBDatabase, Dbf;

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
    tF: TTable;
    tH: TTable;
    tHTARIFA: TFloatField;
    tHCLIENTE: TFloatField;
    tHHORAS: TFloatField;
    Button2: TButton;
    tFCODIGO: TFloatField;
    tFINCLUSAO: TDateField;
    tFNOME: TStringField;
    tFNASCIMENTO: TDateField;
    tFNACIONALID: TStringField;
    tFNATURALIDA: TStringField;
    tFPROFISSAO: TStringField;
    tFRG: TStringField;
    tFCPF: TStringField;
    tFENDERECO: TStringField;
    tFBAIRRO: TStringField;
    tFCEP: TStringField;
    tFTELEFONE: TStringField;
    tFCIDADE: TStringField;
    tFUF: TStringField;
    tFENDCOM: TStringField;
    tFBAIRROCOM: TStringField;
    tFCEPCOM: TStringField;
    tFCIDADECOM: TStringField;
    tFTELCOM: TStringField;
    tFUF_COMERCI: TStringField;
    tFLIBERADO: TBooleanField;
    tFLOGADO: TBooleanField;
    tFINICIO: TDateField;
    tFHORA: TDateField;
    tFESTIMADO: TFloatField;
    tFJOGADAS: TFloatField;
    tFGRATIS: TFloatField;
    tFSENHA: TStringField;
    tFDESCRICAO: TStringField;
    tFMAIL: TStringField;
    tFICQ: TStringField;
    tFVISITA: TDateField;
    tFNICK: TStringField;
    tFSENSIBILID: TFloatField;
    tFFRENTE: TStringField;
    tFTRAS: TStringField;
    tFDIREITA: TStringField;
    tFESQUERDA: TStringField;
    tFGIRARDIREI: TStringField;
    tFGIRARESQUE: TStringField;
    tFAGACHAR: TStringField;
    tFLENTO: TStringField;
    tFPULAR: TStringField;
    tFATIRAR: TStringField;
    tFZOMM: TStringField;
    tFTROCA: TStringField;
    tFARMA1: TStringField;
    tFARMA2: TStringField;
    tFARMA3: TStringField;
    tFARMA4: TStringField;
    tFARMA5: TStringField;
    tFRECARREGAR: TStringField;
    tFITENS: TStringField;
    tFLANTERNA: TStringField;
    tFSPRAY: TStringField;
    tFCHAT1: TStringField;
    tFCHAT2: TStringField;
    tFPRIVILEGIO: TFloatField;
    tFFUNC2: TFloatField;
    tFLOGOF: TBooleanField;
    tFDATAOF: TDateField;
    tFHORAOF: TDateField;
    tFBLOQUEADO: TBooleanField;
    tFMOTIVO: TMemoField;
    tFFUNC3: TFloatField;
    tFMODOACESSO: TFloatField;
    tFHORASPRE: TFloatField;
    tFFECHAMENTO: TBooleanField;
    tFVIP: TBooleanField;
    tFLIMITE: TFloatField;
    tFFUNC: TStringField;
    tFPACOTE: TBooleanField;
    tFIDPACOTE: TFloatField;
    tFADMINISTRA: TBooleanField;
    tFALTERADO: TBooleanField;
    tFUSANDOPRE: TBooleanField;
    tFID_TARIFA: TFloatField;
    tFLIBERADOPO: TBooleanField;
    tFCONVENIO: TFloatField;
    tFAVISADO: TBooleanField;
    tFSEMPRELOGA: TBooleanField;
    tFMASCULINO: TBooleanField;
    tFLOGIN: TStringField;
    tFGRUPOTARIF: TFloatField;
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
  Data6 : TDateTime;

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
  Randomize;
  tCli.Open;
  tCli.IndexName := 'IUsername';
  ShortDateFormat := 'DD-MM-yyyy';
  tCli.EmptyTable;

  TF.Open;
  TH.Open;
  
  PB.Max := TF.RecordCount;
  PB.Position := 0;

  Data6 := EncodeDate(2009, 10, 25);
  
  TF.First;
  while not TF.eof do begin
    PB.Position := I + 1;
    Application.ProcessMessages;
    if (TFCodigo.Value>=1) and (TFVisita.Value>=Data6) then begin
      tCli.Insert;
      tCliID.Value := Trunc(TFCodigo.Value);
      if tH.Locate('Cliente', TFCodigo.Value, []) then
        tCliMinutos.Value := tHHORAS.Value;
      tCliNome.Value := TFNome.Value;
      tCliDataNasc.Value := TFNascimento.Value;
      tCliEndereco.Value := Trim(tFEndereco.Value);
      tCliNickName.Value := TFNick.Value;
      tCliUsername.Value := TFLogin.Value;
      tCliSenha.Value := 
        IntToStr(Random(9)) + 
        IntToStr(Random(9)) + 
        IntToStr(Random(9)) + 
        IntToStr(Random(9)) + 
        IntToStr(Random(9)) + 
        IntToStr(Random(9));
      
      tCliIncluidoEm.Value := Now;
      tCliAlteradoEm.Value := Now;
      tCliRG.Value := tFRG.Value;
      tCliCPF.Value := tFCPF.Value;
      tCliSexo.Value := 'M';
      tCliBairro.Value := TFBairro.Value;
      tCliCidade.Value := TFCidade.Value;
      tCliCEP.Value := TFCep.Value;
      tCliUF.Value := TFUF.Value;
      tCliTelefone.Value := tFTelefone.Value;
      tCliEmail.Value := tFmail.Value;
      tCliCEP.Value := FiltroCEP(TFCEP.Value);
      tCliIncluidoEm.value := TFInclusao.Value;
      tCliInativo.Value := False;
      tCliUltVisita.Value := TFVisita.Value;
      tCli.Post;
    end;  
    TF.Next;
  end;
  tCli.IndexName := 'IID';
  tCli.Last;
  tCli.SetAutoIncValue(tCliID.Value);
  ShowMessage('Fim de importacao');
end;

procedure TForm16.Button2Click(Sender: TObject);
begin
  tCli.Open;
  tCli.First;
  while not tCli.Eof do begin
    if Trim(tCliSenha.Value)='' then begin
      tCli.Edit;
      tCliSenha.Value := 
        IntToStr(Random(9)) + 
        IntToStr(Random(9)) + 
        IntToStr(Random(9)) + 
        IntToStr(Random(9)) + 
        IntToStr(Random(9)) + 
        IntToStr(Random(9));
      tCli.Post;
    end;
    tCli.Next;
  end;
  tCli.Close;
  ShowMessage('Pronto');
end;

end.

// Senha OptiCyber MS Access = k4hvd$$
// Senha TimerCafe = fad0001
