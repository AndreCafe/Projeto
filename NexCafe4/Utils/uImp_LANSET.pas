unit uImp_LANSET;

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
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  IBQuery;

type
  TFrmPri = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    Button1: TButton;
    lbImp: TLabel;
    LMDSysInfo1: TLMDSysInfo;
    OpenDlg: TOpenDialog;
    IBTransaction1: TIBTransaction;
    tF: TIBTable;
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
    tFCODIGO: TIntegerField;
    tFLOGIN: TIBStringField;
    tFSENHA: TIBStringField;
    tFNOME: TIBStringField;
    tFSEXO: TIBStringField;
    tFRG: TIBStringField;
    tFTELEFONE: TIBStringField;
    tFCELULAR: TIBStringField;
    tFENDERECO: TIBStringField;
    tFCIDADE: TIBStringField;
    tFUF: TIBStringField;
    tFCEP: TIBStringField;
    tFEMAIL: TIBStringField;
    tFDATA_CRIACAO: TDateField;
    tFDATA_NASC: TDateField;
    Q: TIBQuery;
    tFCOD_TIPO_CONTA: TSmallintField;
    tFPAIS: TIBStringField;
    tFFILIACAO: TIBStringField;
    tFEXTRA: TMemoField;
    tFMENSAGEM: TMemoField;
    tFMOSTRAR_MSG: TSmallintField;
    tFCODIGO_BARRAS: TIBStringField;
    tFVIP: TSmallintField;
    tFCREDITO: TIBBCDField;
    tFCORTESIA: TIBBCDField;
    tFCANCELADO: TSmallintField;
    DBGrid1: TDBGrid;
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
begin
  if not SimNao('Deseja importar dados do LANSET?'+sLineBreak+sLineBreak+
                '** Todos os clientes que estão atualmente cadastrados no NEXCAFÉ serão apagados e substituídos pelos clientes do LANSET.') then Exit;

  ShowMessage('A seguir selecione a pasta onde se encontra o arquivo LANSET.FDB para que seja realizada a importação'); 

  repeat
    if not OpenDlg.Execute(Handle) then Exit;
  until SameText(ExtractFileName(OpenDlg.FileName), 'LANSET.FDB');

  IBDatabase1.DatabaseName := 'localhost:' + OpenDlg.FileName;

  Randomize;
  Button1.Enabled := False;
  Button1.Repaint;
  lbImp.Visible := True;
  lbImp.Repaint;
  Application.ProcessMessages;

  TF.Active := True;
  tF.First;
  PB.Max := tF.RecordCount;
  PB.Position := 0;
  tCli.Open;
  tCli.DeleteRecords;
//  ShortDateFormat := 'DD-MM-yyyy';
  while not tF.eof do begin
    PB.Position := PB.Position + 1;
    Application.ProcessMessages;
    tCli.Insert;
    tCliID.Value := tFCodigo.Value;
    tCliUsername.Value := tCliID.AsString;
    tCliSenha.Value := tFsenha.Value;
    tCliNome.Value := tFnome.Value;
    try
      tCliDataNasc.AsVariant := TFData_Nasc.AsVariant;
    except
      tCliDataNasc.Clear;
    end;  
    tclirg.value := trim(tFrg.Value);
    tcliendereco.value := tFendereco.Value;
    tCliCidade.Value := tFCidade.Value;
    tCliUF.Value := tFUF.Value;
    tCliCEp.Value := tFCep.Value;
    tCliObs.Value := TFMensagem.Value;
    tCliValorCred.Value := tFCredito.Value;

    if tFCod_Tipo_Conta.Value=5 then
      tCliTipoAcessoPref.Value := 2 else
      tCliTipoAcessoPref.Value := 1;
      

    tcliemail.value := tFemail.Value;
        
    tclitelefone.value := tFTeleFone.value;
    tclicelular.value := tFCelular.Value;
    tcliincluidopor.value := 'Jota';
    tCliIncluidoEm.Value := Date;
    tCliInativo.Value := False;
    tCli.Post;
    tF.next;
  end;

  tCli.Last;

  ShowMessage('Importação realizada com sucesso!');
  Close;
end;

procedure TFrmPri.FormCreate(Sender: TObject);
begin
  nxDB.AliasPath := ExtractFilePath(ParamStr(0))+'Dados';
end;

initialization
  

end.
