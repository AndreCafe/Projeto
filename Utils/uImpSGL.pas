unit uImpSGL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, DBTables, IBDatabase, IBCustomDataSet, IBTable;

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
    IBDatabase1: TIBDatabase;
    tF: TIBTable;
    IBTransaction1: TIBTransaction;
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
    tH: TIBTable;
    tHCODIGO: TIntegerField;
    tHCODCLI: TIntegerField;
    tHTEMPOCOMPRADO: TIntegerField;
    tHTIPOSERVICO: TIBStringField;
    tHBONUSTEMPO: TIntegerField;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
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
  TF.Open;
  tF.First;
  PB.Max := tF.RecordCount;
  PB.Position := 0;
  tCli.Open;
  tCli.EmptyTable;
//  ShortDateFormat := 'DD-MM-yyyy';
  tH.Open;
  while not tF.eof do begin
    PB.Position := I + 1;
    Application.ProcessMessages;
    tCli.Insert;
    tCliID.Value := Trunc(tFCodigo.Value);
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
end;

end.
