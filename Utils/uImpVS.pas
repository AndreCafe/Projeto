unit uImpVS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, DBCtrls, IBDatabase, IBCustomDataSet, IBTable, ExtCtrls, cxPC,
  cxControls,  
  nxreRemoteServerEngine, LMDCustomComponent,
  LMDSysInfo, IBQuery, Menus;

type
  TFrmPri = class(TForm)
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
    tCliObs: TMemoField;
    tCliEmail: TMemoField;
    IBTransaction1: TIBTransaction;
    tLogin: TIBTable;
    tPessoa: TIBTable;
    IBDatabase1: TIBDatabase;
    tLoginIDLOGIN: TIntegerField;
    tLoginLOGIN: TIBStringField;
    tLoginPW: TBlobField;
    tLoginFLAGS: TIntegerField;
    tPessoaIDPESSOA: TIntegerField;
    tPessoaNOMEFANTASIA: TIBStringField;
    tPessoaNOMECOMPLETO: TIBStringField;
    tPessoaTPPESSOA: TIBStringField;
    tPessoaBINATIVA: TSmallintField;
    tPessoaIDINC: TIntegerField;
    tPessoaDHINC: TDateTimeField;
    tPessoaIDALT: TIntegerField;
    tPessoaDHALT: TDateTimeField;
    tDataNasc: TIBTable;
    tRG: TIBTable;
    tDataNascIDDTPESSOA: TIntegerField;
    tDataNascIDPESSOA: TIntegerField;
    tDataNascSITPDATA: TIntegerField;
    tDataNascDATA: TDateTimeField;
    tDataNascIDINC: TIntegerField;
    tDataNascDHINC: TDateTimeField;
    tDataNascIDALT: TIntegerField;
    tDataNascDHALT: TDateTimeField;
    tRGIDIDENTFPESS: TIntegerField;
    tRGIDPESSOA: TIntegerField;
    tRGSITPIDENTF: TIntegerField;
    tRGREFERENCIA: TIBStringField;
    tRGIDINC: TIntegerField;
    tRGDHINC: TDateTimeField;
    tRGIDALT: TIntegerField;
    tRGDHALT: TDateTimeField;
    tSaldo: TIBTable;
    tSaldoIDCLI: TIntegerField;
    tSaldoSLD: TIBBCDField;
    nxRSE: TnxRemoteServerEngine;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    lbImp: TLabel;
    cbSenhaAleat: TCheckBox;
    Label6: TLabel;
    LMDSysInfo1: TLMDSysInfo;
    OpenDlg: TOpenDialog;
    tAd: TIBTable;
    tAdIDPESSXFORMACNTT: TIntegerField;
    tAdIDPESSOA: TIntegerField;
    tAdIDFORMACNTT: TIntegerField;
    tAdREFERENCIA: TIBStringField;
    tAdIDLOCD: TIntegerField;
    tAdIDINC: TIntegerField;
    tAdDHINC: TDateTimeField;
    tAdIDALT: TIntegerField;
    tAdDHALT: TDateTimeField;
    qLocD: TIBQuery;
    qLocDIDLOCD: TIntegerField;
    qLocDESTADO: TIBStringField;
    qLocDNOME: TIBStringField;
    qLocDDDD: TIntegerField;
    tEnd: TIBTable;
    tEndIDPESSXFORMACNTT: TIntegerField;
    tEndIDBAIRRO: TIntegerField;
    tEndCEP: TIBStringField;
    qBairro: TIBQuery;
    qBairroIDBAIRRO: TIntegerField;
    qBairroESTADO: TIBStringField;
    qBairroCIDADE: TIBStringField;
    qBairroNOME: TIBStringField;
    tSexo: TIBTable;
    tSexoIDPESSOA: TIntegerField;
    tSexoSEXO: TIBStringField;
    Label7: TLabel;
    MainMenu1: TMainMenu;
    DataSource1: TDataSource;
    tAux: TnxTable;
    tAuxID: TAutoIncField;
    tAuxNome: TStringField;
    tAuxEndereco: TStringField;
    tAuxBairro: TStringField;
    tAuxCidade: TStringField;
    tAuxUF: TStringField;
    tAuxCEP: TStringField;
    tAuxSexo: TStringField;
    tAuxCpf: TStringField;
    tAuxRg: TStringField;
    tAuxTelefone: TStringField;
    tAuxMinutos: TFloatField;
    tAuxMinutosUsados: TFloatField;
    tAuxMinutosIniciais: TFloatField;
    tAuxIsento: TBooleanField;
    tAuxUsername: TStringField;
    tAuxPai: TStringField;
    tAuxMae: TStringField;
    tAuxSenha: TStringField;
    tAuxUltVisita: TDateTimeField;
    tAuxDebito: TCurrencyField;
    tAuxEscola: TStringField;
    tAuxEscolaHI: TDateTimeField;
    tAuxEscolaHF: TDateTimeField;
    tAuxNickName: TStringField;
    tAuxDataNasc: TDateTimeField;
    tAuxCelular: TStringField;
    tAuxTemDebito: TBooleanField;
    tAuxLimiteDebito: TCurrencyField;
    tAuxFoto: TGraphicField;
    tAuxIncluidoEm: TDateTimeField;
    tAuxAlteradoEm: TDateTimeField;
    tAuxIncluidoPor: TStringField;
    tAuxAlteradoPor: TStringField;
    tAuxInativo: TBooleanField;
    tAuxTipoAcessoPref: TIntegerField;
    tAuxValorCred: TCurrencyField;
    tAuxObs: TMemoField;
    tAuxEmail: TMemoField;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    OffSet: Integer;
    sl: Tstrings;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;
  NoDelete : Boolean = False;

implementation

{$R *.dfm}


function SimNaoH(S: String; H : HWND): Boolean;
begin
  Result := (MessageBox(H, PChar(S), 'Atenção',
             MB_YESNO + MB_ICONQUESTION + MB_APPLMODAL) = IDYES)
end;    
            
function SimNao(S: String): Boolean;
begin
  Result := SimNaoH(S, Application.ActiveFormHandle);
end;                

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

function SoDig(S: String): String;
var i: integer;
begin
  result := '';
  for i := 1 to length(S) do
    if s[i] in ['0'..'9', '-'] then
      result := result + s[i];
end;

procedure TFrmPri.Button1Click(Sender: TObject);
var 
  I, Min, Cod: Integer;
  S, s2: String;
  Mon : Currency;
  DT: TDateTime;
  Code : Word;
  CodigoIgualUsuario: boolean;

function ProxCampo: String;
var P: Integer;
begin
  P := Pos(',', S);
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
  if not SimNao('Deseja importar dados do VS Cyber?'+sLineBreak+sLineBreak+
                '** Todos os clientes que estão atualmente cadastrados no NEXCAFÉ serão apagados e substituídos pelos clientes do VS Cyber.') then Exit;
                
  if not SimNao('Deseja realmente importar os dados?') then Exit;

  if FileExists('C:\Arquivos de programas\Firebird\Firebird_1_5\bin\vscyber.gdb') then
    OpenDlg.FileName := 'VSCyber.GDB'
  else
  if FileExists('C:\Arquivos de programas\Firebird\Firebird_1_5\bin\vscyber.fdb') then
    OpenDlg.FileName := 'VSCyber.FDB';
  

  repeat
    if not OpenDlg.Execute(Handle) then Exit;
  until SameText(ExtractFileName(OpenDlg.FileName), 'VSCYBER.GDB') or
        SameText(ExtractFileName(OpenDlg.FileName), 'VSCYBER.FDB');

  IBDatabase1.DatabaseName := 'localhost:' + OpenDlg.FileName;

  CodigoIgualUsuario := SameText(sl.values['CodigoIgualUsuario'], 'S');
  
  Randomize;
  Button1.Enabled := False;
  Button1.Repaint;
  lbImp.Visible := True;
  lbImp.Repaint;
  Application.ProcessMessages;
  tRG.Active := True;    
  tAd.Open;
  tDataNasc.Active := True;
  tPessoa.Active := True;
  tLogin.Active := True;
  qLocD.Active := True;
  tSaldo.Active := TRue;
//  ShowMessage(IntToStr(tPessoa.RecordCount));
  tCli.Open;
  tAux.Open;

  if CodigoIgualUsuario then 
    OffSet := 100000 else
    OffSet := 0;
    
  if Not NoDelete then
    tCli.DeleteRecords 
  else
  if not CodigoIgualUsuario then begin
    tCli.Last;
    OffSet := tCliID.Value + 1;
  end;
    
//  ShortDateFormat := 'DD-MM-yyyy';
  tPessoa.Open;
  tPessoa.First;
  while not tPessoa.Eof do begin
    Application.ProcessMessages;
    tCli.Insert;
    tCliID.Value := tPessoaIDPEssoa.Value + OffSet;
    tCliNome.Value := tPessoaNomeFantasia.Value + ' ' + tPessoaNomeCompleto.Value;
    tCliIncluidoEm.Value := Date;
    tCliIncluidoPor.Value := 'admin';
    tCliInativo.Value := False;
    tCliIsento.Value := False;
    if cbSenhaAleat.Checked then
      tCliSenha.Value := IntToStr(Random(9)) + 
                         IntToStr(Random(9)) + 
                         IntToStr(Random(9)) + 
                         IntToStr(Random(9)) +
                         IntToStr(Random(9)) +
                         IntToStr(Random(9));
    tCli.Post;
    tPessoa.Next;
  end;

  tLogin.First;
  while not tLogin.Eof do begin
    if tCli.FindKey([tLoginIDLogin.Value+OffSet]) then begin
      if tAux.FindKey([tLoginLogin.Value]) then begin
        if NoDelete then tCli.Delete;
      end else begin
        tCli.Edit;
        tCliUsername.Value := tLoginLogin.Value;
        tCli.Post;
      end;
    end;
    tLogin.Next;
  end;

  tDataNasc.First;
  while not tDataNasc.Eof do begin
    if (tDataNascSitPData.Value<>2) and tCli.FindKey([tDataNascIDPessoa.Value+OffSet]) then begin
      tCli.Edit;
      tCliDataNasc.Value := tDataNascData.Value;
      tCli.Post;
    end;
    tDataNasc.Next;
  end;

  tRG.First;
  while not tRG.Eof do begin
    if tCli.FindKey([tRGIDPessoa.Value+OffSet]) then begin
      tCli.Edit;
      if tRGSITPIDENTF.Value=1 then
        tCliRG.Value := tRGReferencia.Value else
        tCliCPF.Value := tRGReferencia.Value;
      tCli.Post;
    end;
    tRG.Next;
  end;

  tAd.First;
  while not tAD.Eof do begin
    if tCli.FindKey([tAdIDPessoa.Value+OffSet]) then begin
      tCli.Edit;
      case tAdIDFormaCNTT.Value of
        1 : begin       
          tCliTelefone.Value := tAdReferencia.Value;
          if not tAdIDLocD.IsNull then
          if qLocD.Locate('IDLOCD', tAdIDLocD.Value, []) then
            tCliTelefone.Value := qLocDDDD.AsString + ' ' + tCliTelefone.Value;
        end;
        2 : begin
          tCliEndereco.Value := tAdReferencia.Value;
          if not tAdIDLocD.IsNull then
          if qLocD.Locate('IDLOCD', tAdIDLocD.Value, []) then begin
            tCliUF.Value := qLocDEstado.Value;
            tCliCidade.Value := qLocDNome.Value;
          end;
        end;
        3 : tCliEmail.Value := tAdReferencia.Value;
        4 : tCliCelular.Value := tAdReferencia.Value;
        5 : tCliPai.Value := tAdReferencia.Value;
      end;
      tCli.Post;
    end;
    tAd.Next;
  end;

  qBairro.Open;
  tEnd.Open;
  tEnd.First;
  while not tEnd.Eof do begin
    if tAd.Locate('IDPESSXFORMACNTT', tEndIDPESSXFORMACNTT.Value, []) and
       tCli.FindKey([tAdIDPessoa.Value+OffSet]) then 
    begin
      tCli.Edit;
      tCliCEP.Value := tEndCEP.Value;
      if qBairro.Locate('IDBAIRRO', tEndIDBairro.Value, []) then begin
        tCliCidade.Value := qBairroCidade.Value;
        tCliBairro.Value := qBairroNome.Value;
        tCliUF.Value := qBairroEstado.Value;
      end;
      tCli.Post;
    end;
    tEnd.Next;
  end;
  

  tSaldo.Open;
  while not tSaldo.Eof do begin
    if (tSaldoSld.Value>0.0000001) and tCli.FindKey([tSaldoIDCLI.Value+OffSet]) then begin
      tCli.Edit;
      tCliValorCred.Value := tSaldoSld.Value;
      tCli.Post;
    end;
    tSaldo.Next;
  end;

  tSexo.Open;
  while not tSexo.Eof do begin
    if tCli.FindKey([tSexoIDPessoa.Value+OffSet]) then begin
      tCli.Edit;
      tCliSexo.Value := tSexoSexo.Value;
      tCli.Post;
    end;
    tSexo.Next;
  end;
  

  Cod := 0;
  if CodigoIgualUsuario then begin
    tCli.IndexName := 'IUsername';
    tCli.First;
    sl.Clear;
    while not tCli.Eof do begin
      I := StrToIntDef(Trim(tCliUsername.Value), 0);
      if I > 0 then begin
        tCli.Edit;
        tCliID.Value := I;
        if I>Cod then Cod := I;
        tCli.Post;
      end else
        SL.Add(tCliUsername.Value);
      tCli.Next;
    end;
    for I := 0 to sl.count-1 do begin
      if tCli.FindKey([sl[i]]) then begin
        Inc(Cod);
        tCli.Edit;
        tCliID.Value := Cod;
        tCli.Post;
      end;
    end;
    tCli.IndexName := 'IID';
    tCli.Last;
    tCli.SetAutoIncValue(tCliID.Value);
  end;

  ShowMessage('Importação realizada com sucesso!');
  Close;
end;

procedure TFrmPri.FormCreate(Sender: TObject);
var s: String;
begin
  sl := tStringList.Create;
  s := extractfilepath(paramstr(0))+'impvs.ini';
  if fileexists(s) then
    sl.loadfromfile(s);
end;

procedure TFrmPri.FormDestroy(Sender: TObject);
begin
  sl.free;
end;

initialization
  NoDelete := SameText(ParamStr(1), 'nodelete');
  

end.
