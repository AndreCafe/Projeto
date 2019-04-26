unit uImp_SGL;

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
    Label1: TLabel;
    Button1: TButton;
    lbImp: TLabel;
    LMDSysInfo1: TLMDSysInfo;
    OpenDlg: TOpenDialog;
    IBTransaction1: TIBTransaction;
    tF: TIBTable;
    tH: TIBTable;
    tHCODIGO: TIntegerField;
    tHCODCLI: TIntegerField;
    tHTEMPOCOMPRADO: TIntegerField;
    tHTIPOSERVICO: TIBStringField;
    tHBONUSTEMPO: TIntegerField;
    IBDatabase1: TIBDatabase;
    tCli: TnxTable;
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
    nxTCP: TnxWinsockTransport;
    nxDB: TnxDatabase;
    nxSession1: TnxSession;
    PB: TProgressBar;
    nxRSE: TnxRemoteServerEngine;
    DataSource1: TDataSource;
    Label2: TLabel;
    tFCODIGO: TIntegerField;
    tFLOGIN: TIBStringField;
    tFSENHA: TIBStringField;
    tFNOME: TIBStringField;
    tFDATANASC: TDateTimeField;
    tFENDERECO: TIBStringField;
    tFNUM: TIBStringField;
    tFCOMPL: TIBStringField;
    tFBAIRRO: TIBStringField;
    tFCEP: TIBStringField;
    tFCIDADE: TIBStringField;
    tFUF: TIBStringField;
    tFDATACAD: TDateTimeField;
    tFNIVEL: TIBStringField;
    tFEMAIL: TIBStringField;
    tFSTATUS: TIBStringField;
    tFEDITAR: TIBStringField;
    tFTIPO: TIBStringField;
    tFDESCONTO: TIBStringField;
    tFTEMPODESCONTO: TIntegerField;
    tFOBS: TMemoField;
    tFFOTO: TBlobField;
    tFTEMPOJOGO: TIntegerField;
    tFMONETARIO: TFloatField;
    tFTEMPOCOMPRADO: TIntegerField;
    tFCODBARRA: TIBStringField;
    tFFONE: TIBStringField;
    tFCELULAR: TIBStringField;
    tFTIPOCLIENTE: TIBStringField;
    tFATIVO: TIBStringField;
    tFBILHETE: TIBStringField;
    tFRG: TIBStringField;
    tFCPF: TIBStringField;
    tFICQ: TIBStringField;
    tFEMAIL2: TIBStringField;
    tFESTUDANTE: TIBStringField;
    tFSERIE: TIBStringField;
    tFPERIODO: TIBStringField;
    tFESCOLA: TIBStringField;
    tFDEL: TIBStringField;
    tFIMPRIMIU: TIBStringField;
    tFLOTE: TIntegerField;
    tFVALORBILHETE: TFloatField;
    tFNOMEPAI: TIBStringField;
    tFNOMEMAE: TIBStringField;
    tFHORAINI: TIBStringField;
    tFHORAFIM: TIBStringField;
    tFDATAGANHOUVIP: TDateTimeField;
    tFBONUSVALOR: TFloatField;
    tFLIMITECREDITO: TFloatField;
    tFFORMAPOS: TIBStringField;
    tFGANHOUANIVER: TDateTimeField;
    tFDIGITAL: TBlobField;
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

uses ncClassesBase;

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
var S: String;
begin
  if not SimNao('Deseja importar dados do SGL?'+sLineBreak+sLineBreak+
                '** Todos os clientes que estão atualmente cadastrados no NEXCAFÉ serão apagados e substituídos pelos clientes do SGL.') then Exit;

  S := 'c:\meus programas\nexcafe\sgl.gdb';

  OpenDlg.FileName := S;

  if not FileExists(S) then begin 
    ShowMessage('A seguir selecione a pasta onde se encontra o arquivo SGL.GDB para que seja realizada a importação');
    repeat
      if not OpenDlg.Execute(Handle) then Exit;
    until SameText(ExtractFileName(OpenDlg.FileName), 'SGL.GDB');
  end;

  IBDatabase1.DatabaseName := 'localhost:' + OpenDlg.FileName;

  Randomize;
  Button1.Enabled := False;
  Button1.Repaint;
  lbImp.Visible := True;
  lbImp.Repaint;
  Application.ProcessMessages;

  

  TF.Open;
  tF.First;
  PB.Max := tF.RecordCount;
  PB.Position := 0;
  tCli.Open;
  tCli.DeleteRecords;
//  ShortDateFormat := 'DD-MM-yyyy';
  tH.Open;
  while not tF.eof do begin
    PB.Position := PB.Position + 1;
    Application.ProcessMessages;
    tCli.Insert;
//    tCliID.Value := Trunc(tFCodigo.Value);
    tCliUsername.Value := Trim(tFLogin.Value);
    tCliSenha.Value := Trim(tFsenha.Value);
    tCliNome.Value := tFnome.Value;
    try
      tCliDataNasc.Value := tFdatanasc.AsDateTime;
    except
      tCliDataNasc.Clear;
    end;  
    tclirg.value := trim(tFrg.Value);
    tCliCPF.Value := tFCPF.Value;
    tcliendereco.value := tFendereco.Value;
    if Trim(tFCompl.Value)>'' then 
      tCliEndereco.Value := tCliEndereco.Value + ' ' + tFCompl.Value;

    tCliBairro.Value := tFBairro.Value;
    tCliCidade.Value := tFCidade.Value;
    tCliUF.Value := tFUF.Value;
    tCliCEp.Value := tFCep.Value;
    tCliObs.Value := TFObs.Value;
    tCliEscola.Value := TFEscola.Value;
    tCliValorCred.Value := tFMonetario.Value;

    tcliemail.value := tFemail.Value;
    if Trim(tFEmail2.Value)>'' then begin
      if tCliEmail.Value>'' then
        tCliEmail.Value := tCliEmail.Value+'; '+tFEmail2.Value;
    end;    

    tH.First;
    while not tH.Eof do begin
      tCliMinutos.Value := tCliMinutos.Value + tHTempoComprado.Value;
      tH.Next;
    end;
        
    tclitelefone.value := tFFone.value;
    tclicelular.value := tFCelular.Value;
    tcliincluidopor.value := 'Jota';
    tCliIncluidoEm.Value := Date;
    tCliInativo.Value := False;
    tCli.Post;
    tF.next;
  end;

  tCli.Last;

  ShowMessage('Importação realizada com sucesso!');
  ShowMessage('Encerre o NexServ, zipa o arquivo CLIENTES.NX1 da pasta DADOS e envia no email pro cliente');
  Close;
end;

initialization
  

end.


Caixa.nx1
Chat.nx1
EmailCorpo.nx1
EmailCriar.nx1
EmailEnvio.nx1
Impressao.nx1
ITran.nx1
Log.nx1
LogApp.nx1
LogNom.nx1
LogUrl.nx1
MovEst.nx1
Ocupacao.nx1
Post.nx1
Sessao.nx1
Tran.nx1

