unit uImpODIN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, DBCtrls, IBDatabase, IBCustomDataSet, IBTable, ExtCtrls, cxPC,
  cxControls, Dbf, 
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
    tEnt: TIBTable;
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
    tEntENTIDADEID: TIntegerField;
    tEntENTIDADEGRUPOID: TIntegerField;
    tEntUSUARIOID: TIntegerField;
    tEntCODIGOBARRA: TIBStringField;
    tEntNOME: TIBStringField;
    tEntAPELIDO: TIBStringField;
    tEntSEXO: TSmallintField;
    tEntDOCUMENTO: TIBStringField;
    tEntTELEFONE: TIBStringField;
    tEntCELULAR: TIBStringField;
    tEntENDERECO: TIBStringField;
    tEntBAIRRO: TIBStringField;
    tEntESTADO: TIBStringField;
    tEntCIDADE: TIBStringField;
    tEntCEP: TIBStringField;
    tEntPAIS: TIBStringField;
    tEntEMAIL: TIBStringField;
    tEntNASCIMENTO: TDateTimeField;
    tEntCADASTRO: TDateTimeField;
    tEntULTIMAVISITA: TDateTimeField;
    tEntENTIDADETIPO: TSmallintField;
    tEntFUNCIONARIOLIMITE: TIBBCDField;
    tEntCOBRARTIPO: TSmallintField;
    tEntCOBRARVALORHORA: TIBBCDField;
    tEntCOBRARCORTESIA: TIntegerField;
    tEntSENHA: TIBStringField;
    tEntPROFISSAO: TIBStringField;
    tEntBLOQUEADO: TIntegerField;
    tEntMOTIVO: TIBStringField;
    tEntSALDO: TIBBCDField;
    tEntMILHAGEM: TIBBCDField;
    tEntNOMEPAI: TIBStringField;
    tEntNOMEMAE: TIBStringField;
    tEntICQ: TIBStringField;
    tEntMSN: TIBStringField;
    tEntESCOLA: TIBStringField;
    tEntESCOLAREGISTRO: TIBStringField;
    tEntAULAINICIO: TDateTimeField;
    tEntAULAFINAL: TDateTimeField;
    tEntAUTORIZACAOMENOR: TSmallintField;
    tEntPERMISSOES: TBlobField;
    tEntDIGITAL: TBlobField;
    tEntBANCOHORA: TIntegerField;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  if not SimNao('Deseja importar dados do ODIN?'+sLineBreak+sLineBreak+
                '** Todos os clientes que estão atualmente cadastrados no NEXCAFÉ serão apagados e substituídos pelos clientes do ODIN.') then Exit;
                
  if not SimNao('Deseja realmente importar os dados?') then Exit;

  repeat
    if not OpenDlg.Execute(Handle) then Exit;
  until SameText(ExtractFileName(OpenDlg.FileName), 'ODIN.FDB');

  IBDatabase1.DatabaseName := 'localhost:' + OpenDlg.FileName;

  Randomize;
  Button1.Enabled := False;
  Button1.Repaint;
  lbImp.Visible := True;
  lbImp.Repaint;
  Application.ProcessMessages;
  tEnt.Active := True;
  tCli.Open;
  OffSet := 0;
  tCli.DeleteRecords;
//  ShortDateFormat := 'DD-MM-yyyy';
  tEnt.Open;
  tEnt.First;
  while not tEnt.Eof do begin
    Application.ProcessMessages;
    tCli.Insert;
    tCliID.Value := tEntEntidadeID.Value;
    tCliNome.Value := tEntNome.Value;
    tCliUsername.Value := tEntApelido.Value;
    tCliIncluidoEm.Value := Date;
    tCliIncluidoPor.Value := 'admin';
    tCliInativo.Value := False;
    tCliSexo.Value := 'M';
    if Trim(tEntDocumento.value)>'' then
    if Length(SoDig(tEntDocumento.Value))=11 then
      tCliCPF.Value := tEntDocumento.Value else
      tCliRG.Value := tEntDocumento.Value;
      
    tCliTelefone.Value := tEntTELEFONE.Value;
    tCliCelular.Value := tEntCELULAR.Value;
    tCliEndereco.Value := tEntENDERECO.Value;
    tCliBairro.Value := tEntBairro.Value;
    tCliUF.Value := tEntESTADO.Value;
    tCliCIDADE.Value := tEntCidade.Value;
    tCliCEP.Value := tEntCEP.Value;
    tCliEmail.Value := tEntEMAIL.Value;
    tCliDataNasc.AsVariant := tEntNASCIMENTO.AsVariant;
    tCliIncluidoEm.Value := tEntCADASTRO.Value;
    tCliUltVisita.Value := tEntULTIMAVISITA.Value;
    if tEntSaldo.Value > 0 then
      tCliValorCred.Value := tEntSaldo.Value;
    tCliMinutos.Value := tEntBancoHora.Value / 60;  
//    tEntBANCOHORA: TIntegerField;
    tCliPai.Value := tEntNOMEPAI.Value;
    tCliMae.Value := tEntNOMEMAE.Value;
    tCliEscola.Value := tEntESCOLA.Value;
    
    if cbSenhaAleat.Checked then
      tCliSenha.Value := IntToStr(Random(9)) + 
                         IntToStr(Random(9)) + 
                         IntToStr(Random(9)) + 
                         IntToStr(Random(9)) +
                         IntToStr(Random(9)) +
                         IntToStr(Random(9));
    tCli.Post;
    tEnt.Next;
  end;
  tCli.Last;
  tCli.SetAutoIncValue(tCliID.Value);


  ShowMessage('Importação realizada com sucesso!');
  Close;
end;

procedure TFrmPri.FormCreate(Sender: TObject);
begin
  nxDB.AliasPath := ExtractFilePath(ParamStr(0))+'Dados';
end;

initialization
  

end.
