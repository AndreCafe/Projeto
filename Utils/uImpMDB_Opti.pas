unit uImpMDB_Opti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, DBTables, IBDatabase, 
  ADODB, nxreRemoteServerEngine;
  

type
  TForm16 = class(TForm)
    nxSession1: TnxSession;
    nxDB: TnxDatabase;
    tCli: TnxTable;
    nxTCP: TnxWinsockTransport;
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
    adoConn: TADOConnection;
    tF: TADOTable;
    tTempo: TADOTable;
    tTempoobjUsuario: TIntegerField;
    tTemposTempoEstimado: TWideStringField;
    tTempodInicio: TDateTimeField;
    tTempodFim: TDateTimeField;
    tTempobCrashServer: TBooleanField;
    qMov: TADOQuery;
    qMovobjUsuario: TIntegerField;
    qMovobjMaquina: TIntegerField;
    qMovdEntrada: TDateTimeField;
    qMovdSaida: TDateTimeField;
    qMovbAtivo: TBooleanField;
    qMovbFechado: TBooleanField;
    qMovbAgendado: TBooleanField;
    qMovbCrashServer: TBooleanField;
    qMovbFragNight: TBooleanField;
    tFobjUsuario: TAutoIncField;
    tFsLogin: TWideStringField;
    tFsNome: TWideStringField;
    tFsSobrenome: TWideStringField;
    tFsEndereco: TWideStringField;
    tFsBairro: TWideStringField;
    tFsCidade: TWideStringField;
    tFiCep: TIntegerField;
    tFsSenha: TWideStringField;
    tFdCadastro: TDateTimeField;
    tFiTelefoneDDD: TSmallintField;
    tFiTelefone: TIntegerField;
    tFbStatus: TBooleanField;
    tFiAcessos: TIntegerField;
    tFmDebito: TBCDField;
    tFsObs: TWideMemoField;
    tFsEmail: TWideStringField;
    tFbCortesia: TBooleanField;
    tFbPosPago: TBooleanField;
    tFbTicket: TBooleanField;
    tFiDias: TIntegerField;
    tFiDesc: TIntegerField;
    tFmValorDif: TBCDField;
    tFsIdentidade: TWideStringField;
    tFdDataNasc: TDateTimeField;
    tFobjFuncionario: TIntegerField;
    tFbLockUser: TBooleanField;
    Label1: TLabel;
    nxRSE: TnxRemoteServerEngine;
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

function DateTimeToSegundos(D: TDateTime): Cardinal;
var H, M, S, MS : Word;
begin
  DecodeTime(D, H, M, S, MS);
  Result := (H * 60 * 60) + (M * 60) + S;
end;  

function DateTimeToMinutos(D: TDateTime): Cardinal;
begin
  Result := DateTimeToSegundos(D) div 60;
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

function HMToMinutos(S: String): Double;
var 
  H, M : Integer;
  St: String;
begin
  St := Copy(S, 1, Pos(':', S)-1);
  H := StrToIntDef(St, 0);
  St := Copy(S, Pos(':', S)+1, 2);
  M := StrToIntDef(St, 0);
  Result := (H*60) + M;
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

  try
    adoConn.Connected := True;
  except
    S := adoConn.ConnectionString;
    I := Pos('k4hvd$$', S);
    Delete(S, I+5, 2);
    adoConn.ConnectionString := S;
    adoConn.Connected := True;
  end;  

  TF.Active := True;
  tTempo.Open;
//  tTempo.Open;
  PB.Max := TF.RecordCount;
  PB.Position := 0;
  tCli.Open;
  tCli.DeleteRecords;
  tCli.SetAutoIncValue(0);
//  ShortDateFormat := 'DD-MM-yyyy';
  TF.First;
  while not TF.eof do begin
    PB.Position := PB.Position + 1;
    Application.ProcessMessages;
    if not SameText(tFSNome.Value, 'Ticket') then begin

      sUsername := TFSLogin.Value;
{      if sUsername>'' then
      if tCli.FindKey([sUsername]) then sUsername := sUsername+'2';}
      
      tCli.Insert;
      tCLIID.Value := Trunc(Int(tFObjUsuario.Value));
      tCliUsername.Value := sUsername;
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

      if TFITelefoneDDD.Value>0 then
        tCliTelefone.Value := TFITelefoneDDD.AsString;
      
      if tFITelefone.Value>0 then
        tClitelefone.value := tCliTelefone.Value + tFITelefone.AsString;

      if tTempo.Locate('ObjUsuario', tFObjUsuario.Value, []) then begin
        tCliMinutos.Value := HMToMinutos(tTempoSTempoEstimado.Value); 
        qMov.Active := False;
        qMov.SQL.Text := 'Select * from Movimentacao where (objUsuario = ' + tFObjUsuario.AsString + ')';
        qMov.Open;
        qMov.First;
        while not qMov.Eof do begin
            tCliMinutos.Value := tCliMinutos.Value - MinutosOpti(qMovdEntrada.Value, qMovdSaida.Value);
          qMov.Next;
        end;
      end;  
        
      tCliIncluidoPor.value := 'admin';
      tCliInativo.Value := False;
      tCliIsento.Value := False;
      tCliObs.Value := TFSObs.Value;
      tCliEmail.Value := TFSEmail.Value;
      tCliRG.Value := tFSIdentidade.Value;
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

  ShowMessage('Fim de importação: Zipar arquivo CLIENTE.NX1 e enviar pro cliente');
  Close;
  
end;

procedure TForm16.FormCreate(Sender: TObject);
begin
 nxDB.AliasPath := ExtractFilePath(ParamStr(0))+'dados';
end;

end.

// Senha OptiCyber MS Access = k4hvd$$

JetOLEDB:Database Password
