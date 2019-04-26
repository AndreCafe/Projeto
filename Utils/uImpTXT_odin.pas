unit uImpTXT_odin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids;

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
    tEnt: TnxTable;
    tEntENTIDADEID: TIntegerField;
    tEntENTIDADEGRUPOID: TIntegerField;
    tEntUSUARIOID: TIntegerField;
    tEntCODIGOBARRA: TStringField;
    tEntNOME: TStringField;
    tEntAPELIDO: TStringField;
    tEntSEXO: TSmallintField;
    tEntDOCUMENTO: TStringField;
    tEntTELEFONE: TStringField;
    tEntCELULAR: TStringField;
    tEntENDERECO: TStringField;
    tEntBAIRRO: TStringField;
    tEntESTADO: TStringField;
    tEntCIDADE: TStringField;
    tEntCEP: TStringField;
    tEntPAIS: TStringField;
    tEntEMAIL: TStringField;
    tEntNASCIMENTO: TDateTimeField;
    tEntCADASTRO: TDateTimeField;
    tEntULTIMAVISITA: TDateTimeField;
    tEntENTIDADETIPO: TSmallintField;
    tEntFUNCIONARIOLIMITE: TFloatField;
    tEntCOBRARTIPO: TSmallintField;
    tEntCOBRARVALORHORA: TFloatField;
    tEntCOBRARCORTESIA: TIntegerField;
    tEntSENHA: TStringField;
    tEntPROFISSAO: TStringField;
    tEntBLOQUEADO: TIntegerField;
    tEntMOTIVO: TStringField;
    tEntSALDO: TFloatField;
    tEntBANCOHORA: TIntegerField;
    tEntMILHAGEM: TFloatField;
    tEntNOMEPAI: TStringField;
    tEntNOMEMAE: TStringField;
    tEntICQ: TStringField;
    tEntMSN: TStringField;
    tEntESCOLA: TStringField;
    tEntESCOLAREGISTRO: TStringField;
    tEntAULAINICIO: TDateTimeField;
    tEntAULAFINAL: TDateTimeField;
    tEntAUTORIZACAOMENOR: TSmallintField;
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

function StrToCurrency(S: String): Currency;
var 
  Code : Integer;
  Res: Real;
begin
  Result := 0;
  S := SoDig(S);
  if (Length(S)>=3) then begin
    S := Copy(S, 1, Length(S)-2) + '.' + Copy(S, Length(S)-1, 2);
    Val(S, Res, Code);
    if Code=0 then
      REsult := Res;
  end;
end;

procedure TForm16.Button1Click(Sender: TObject);
begin
  PB.Position := 0;
  tCli.Open;
  tCli.EmptyTable;
  tEnt.Open;
  PB.Max := tEnt.RecordCount;
  while not tEnt.Eof do begin 
    PB.Position := Pb.Position + 1;
    Application.ProcessMessages;
    tCli.Insert;
    tCliID.Value := tEntEntidadeID.Value;
    tCliUsername.Value := tCliID.AsString;
    tCliNome.Value := tEntNome.Value;
    tCliNickName.Value := tEntAPELIDO.Value;

    if tEntSEXO.Value=0 then 
      tCliSexo.Value := 'M' else
      tCliSexo.Value := 'F';

    if tEntSaldo.Value>0 then
      tCliValorCred.Value := tEntSaldo.Value;

    tCliMinutos.Value := tEntBancoHora.Value / 60;
    tCliRG.Value := tEntDOCUMENTO.Value;
    tCliTelefone.Value := tEntTelefone.Value;
    tCliCelular.Value := tEntCELULAR.Value;
    tCliEndereco.Value := tEntENDERECO.Value;
    tCliBairro.Value:= tEntBAIRRO.Value;
    tCliUF.Value := tEntESTADO.Value;
    tCliCidade.Value := tEntCIDADE.Value;
    tCliCEP.Value := tEntCEP.Value;
    tCliEmail.Value:= tEntEMAIL.Value;
    tCliDataNasc.Value := tEntNASCIMENTO.Value;
    tCliIncluidoEm.Value := tEntCADASTRO.Value;
    tCliUltVisita.Value := tEntULTIMAVISITA.Value;
    tCliPai.Value := tEntNOMEPAI.Value;
    tCliMae.Value := tEntNOMEMAE.Value;
    tCliEscola.Value := tEntESCOLA.Value;
    tCli.Post;
    tEnt.Next;
  end;
end;

end.


