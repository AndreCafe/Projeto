unit uImpHabitus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, DBCtrls, IBDatabase, IBCustomDataSet, IBTable, ExtCtrls, cxPC,
  cxControls,  
  nxreRemoteServerEngine, LMDCustomComponent,
  LMDSysInfo, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid;

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
    tF: TIBTable;
    IBDatabase1: TIBDatabase;
    nxRSE: TnxRemoteServerEngine;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    lbImp: TLabel;
    cbSenhaAleat: TCheckBox;
    Label6: TLabel;
    LMDSysInfo1: TLMDSysInfo;
    OpenDlg: TOpenDialog;
    tFCODIGO: TIntegerField;
    tFCODIGO_GRUPO_CLIENTE: TIntegerField;
    tFCODIGO_ULTIMA_CONEXAO: TIntegerField;
    tFCODIGO_ULTIMA_VENDA_AVULSA: TIntegerField;
    tFLIXEIRA: TIBStringField;
    tFNUMERO: TIntegerField;
    tFNOME: TIBStringField;
    tFNOME_ABREVIADO: TIBStringField;
    tFNOME_FORMATADO: TIBStringField;
    tFCPF: TIBStringField;
    tFRG: TIBStringField;
    tFE_MAIL: TIBStringField;
    tFSEXO: TIBStringField;
    tFLOGRADOURO: TIBStringField;
    tFCOMPLEMENTO_LOGRADOURO: TIBStringField;
    tFNUMERO_LOGRADOURO: TIBStringField;
    tFBAIRRO: TIBStringField;
    tFCEP: TIBStringField;
    tFCIDADE: TIBStringField;
    tFESTADO: TIBStringField;
    tFTELEFONE: TIBStringField;
    tFDATA_NASCIMENTO: TDateField;
    tFCLA: TIBStringField;
    tFLOGIN: TIBStringField;
    tFSENHA: TIBStringField;
    tFSALDO: TIBBCDField;
    tFLIMITE_DEBITO: TIBBCDField;
    tFAUTORIZACAO: TIBStringField;
    tFNOME_RESPONSAVEL: TIBStringField;
    tFPARENTESCO: TIBStringField;
    tFTELEFONE_RESPONSAVEL: TIBStringField;
    tFCELULAR_RESPONSAVEL: TIBStringField;
    tFCPF_RESPONSAVEL: TIBStringField;
    tFRG_RESPONSAVEL: TIBStringField;
    tFNOME_ESCOLA: TIBStringField;
    tFTELEFONE_ESCOLA: TIBStringField;
    tFTURNO_MANHA: TIBStringField;
    tFTURNO_TARDE: TIBStringField;
    tFTURNO_NOITE: TIBStringField;
    tFTURNO_MADRUGADA: TIBStringField;
    tFOBSERVACOES: TMemoField;
    tFFOTO: TBlobField;
    tFDIGITAL: TBlobField;
    tFFOTO_DIGITAL: TBlobField;
    tFPONTUACAO_ACUMULADA: TIntegerField;
    tFSALDO_MINUTOS: TIntegerField;
    procedure Button1Click(Sender: TObject);
  private
    OffSet: Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;

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
  SL: TStrings;
  I, Min, Cod: Integer;
  S, s2: String;
  Mon : Currency;
  DT: TDateTime;
  Code : Word;

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
  if not SimNao('Deseja importar dados do HABITUS?'+sLineBreak+sLineBreak+
                '** Todos os clientes que estão atualmente cadastrados no NEXCAFÉ serão apagados e substituídos pelos clientes do HABITUS.') then Exit;
                
  if not SimNao('Deseja realmente importar os dados?') then Exit;

  repeat
    if not OpenDlg.Execute(Handle) then Exit;
  until SameText(ExtractFileName(OpenDlg.FileName), 'IM.FDB');

  IBDatabase1.DatabaseName := 'localhost:' + OpenDlg.FileName;

  Randomize;
  Button1.Enabled := False;
  Button1.Repaint;
  lbImp.Visible := True;
  lbImp.Repaint;
  Application.ProcessMessages;
  tF.Active := True;
  tCli.Open;
  tCli.SetAutoIncValue(0);
  OffSet := 0;
  tCli.DeleteRecords;
//  ShortDateFormat := 'DD-MM-yyyy';
  tF.Open;
  tF.First;
  while not tF.Eof do begin
    Application.ProcessMessages;
    tCli.Insert;
    tCliID.Value := tFNumero.Value;
    tCliNome.Value := Trim(tFNome.Value);
    tCliCPF.Value := tFCPF.Value;
    tCliRG.Value := tFRG.Value;
    tCliEmail.Value := tFE_mail.Value;
    tCliSexo.Value := tFSexo.Value;
    tCliEndereco.Value := TFLogradouro.Value;
    if Trim(tFNumero_Logradouro.Value) > '' then
      tCliEndereco.Value := tCliEndereco.Value + ' ' + tFNumero_Logradouro.Value;

    if Trim(TFComplemento_Logradouro.Value) > '' then 
      tCliEndereco.Value := tCliEndereco.Value + ' ' + TFComplemento_Logradouro.Value;

    tCliBairro.Value := tFBairro.Value;
    tCliCidade.Value := tFCidade.Value;
    tCliUF.Value := TFEstado.Value;
    tCliTelefone.Value := tFTELEFONE.Value;
    tCliCEP.Value := tFCEP.Value;
    tCliDataNasc.Value := TFData_Nascimento.Value;
//    tCliUsername.Value := TFLogin.Value;
    tCliValorCred.Value := TFSaldo.Value;
    tCliMinutos.Value := TFSaldo_Minutos.Value;
    
    tCliIncluidoEm.Value := Date;
    tCliIncluidoPor.Value := 'admin';
    tCliInativo.Value := False;
      
    if cbSenhaAleat.Checked then
      tCliSenha.Value := IntToStr(Random(9)) + 
                         IntToStr(Random(9)) + 
                         IntToStr(Random(9)) + 
                         IntToStr(Random(9)) +
                         IntToStr(Random(9)) +
                         IntToStr(Random(9));
    tCli.Post;
    tF.Next;
  end;
  tCli.Last;
  tCli.SetAutoIncValue(tCliID.Value);


  ShowMessage('Importação realizada com sucesso! '+IntToStr(tCli.RecordCount));
  Close;
end;

initialization
  

end.
