unit uImpDBF3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, DBTables, IBDatabase, Dbf, 
  DBF_lang, dbf_dbffile;
  

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
    tTempo: TDbf;
    tTempoOBJUSUARIO: TFloatField;
    tTempoSTEMPOESTI: TStringField;
    tTempoDINICIO: TDateField;
    tTempoDFIM: TDateField;
    tTempoBCRASHSERV: TBooleanField;
    tF: TDbf;
    tFOBJUSUARIO: TFloatField;
    tFSLOGIN: TStringField;
    tFSNOME: TStringField;
    tFSSOBRENOME: TStringField;
    tFSENDERECO: TStringField;
    tFSBAIRRO: TStringField;
    tFSCIDADE: TStringField;
    tFICEP: TFloatField;
    tFSSENHA: TStringField;
    tFDCADASTRO: TDateField;
    tFITELEFONED: TFloatField;
    tFITELEFONE: TFloatField;
    tFBSTATUS: TBooleanField;
    tFIACESSOS: TFloatField;
    tFMDEBITO: TFloatField;
    tFSOBS: TMemoField;
    tFSEMAIL: TStringField;
    tFBCORTESIA: TBooleanField;
    tFBPOSPAGO: TBooleanField;
    tFBTICKET: TBooleanField;
    tFIDIAS: TFloatField;
    tFIDESC: TFloatField;
    tFMVALORDIF: TFloatField;
    tFSIDENTIDAD: TStringField;
    tFDDATANASC: TDateField;
    tFOBJFUNCION: TFloatField;
    tFBLOCKUSER: TBooleanField;
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



procedure TForm16.Button1Click(Sender: TObject);
var 
  SL: TStrings;
  I, Min, Cod: Integer;
  S: String;
  Mon : Currency;
  sTempo : String;

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
  DbfGlobals.DefaultOpenCodePage := 850;
  TF.LanguageID := DbfLangId_PTB_850;

  TF.Active := True;
//  tTempo.Open;
  PB.Max := TF.RecordCount;
  PB.Position := 0;
  tCli.Open;
  tCli.EmptyTable;
//  ShortDateFormat := 'DD-MM-yyyy';
  TF.First;
  while not TF.eof do begin
    PB.Position := I + 1;
    Application.ProcessMessages;
    if not SameText(tFSNome.Value, 'Ticket') then begin
      tCli.Insert;
//      tCLIID.Value := Trunc(Int(tFObjUsuario.Value));
      tCliUsername.Value := TFSLogin.Value;
      tCliSenha.Value := TFSSenha.Value;
      tCliIncluidoEm.Value := TFDCadastro.Value;
      tCliAlteradoEm.Value := Now;
      tCliNome.Value := Trim(TFSNome.Value + ' ' + TFSSobrenome.Value);
      tCliSexo.Value := 'M';
      tCliEndereco.Value := TFSEndereco.Value;
      tCliBairro.Value := TFSBairro.Value;
      tCliCidade.Value := TFSCidade.Value;
      if TFICEP.Value>0 then
        tCliCEP.Value := TFICEP.AsString;
      try
        tCliDataNasc.Value := TFDDataNasc.Value;
      except
        tCliDataNasc.Clear;
      end;  
      if tCliDataNasc.Value <= 1 then
        tCliDataNasc.Clear;
        
      tcliemail.value := TFSEmail.Value;
      
      if TFITelefoneD.Value>0 then
        tCliTelefone.Value := TFITelefoneD.AsString;
      
      if tFITelefone.Value>0 then
        tClitelefone.value := tCliTelefone.Value + tFITelefone.AsString;

{      if tTempo.Locate('ObjUsuario', tFObjUsuario.Value, []) then
        tCliMinutos.Value := HMToMinutos(tTempoSTempoEsti.Value);  }
        
      tCliIncluidoPor.value := 'admin';
      tCliInativo.Value := False;
      tCliIsento.Value := False;
      tCliObs.Value := TFSObs.Value;
      tCliEmail.Value := TFSEmail.Value;
      tCliRG.Value := tFSIdentidad.Value;
{      tCliEscola.Value := TFSEscola.Value;
      tCliPai.Value := TFSPai.Value;
      tCliMae.Value := TFSMae.Value;}
      tCli.Post;
    end;  
    TF.Next;
  end;

{  Sl := TStringList.Create;
  try
    SL.LoadFromFile('c:\meus programas\nexcafe\tempo.txt');
    PB.Max := SL.Count;
    PB.Position := 0;
    for I := 0 to SL.Count - 1 do begin
      Application.ProcessMessages;
      PB.Position := I+1;
      S := SL[I];
      if tCli.FindKey([Trim(Copy(S, 1, 29))]) then begin
        tCli.Edit;
        tCliMinutos.Value := HMSToMinutos(Copy(S, 60, 8));
        tCli.Post;
      end;
    end;
  finally
    SL.Free;
  end;}

{  Sl := TStringList.Create;
  try
    SL.LoadFromFile('c:\meus programas\nexcafe\temporestante.txt');
    PB.Max := SL.Count;
    PB.Position := 0;
    for I := 0 to SL.Count - 1 do begin
      Application.ProcessMessages;
      PB.Position := I+1;
      S := Trim(SL[I]);            
      sTempo := Copy(S, Length(S)-7, 8);
      Delete(S, Length(S)-8, 10);
      S := Trim(S);
      
      if tCli.FindKey([LoginStr(2)]) or tCli.FindKey([LoginStr(1)]) then begin
        tCli.Edit;
        tCliMinutos.Value := HMSToMinutos(sTempo);
        tCli.Post;
      end;
    end;
  finally
    SL.Free;
  end; }
  
end;

end.

// Senha OptiCyber MS Access = k4hvd$$
